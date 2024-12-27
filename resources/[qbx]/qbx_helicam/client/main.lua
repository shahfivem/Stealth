local config = require 'config.client'
local FOV_MAX = 80.0
local FOV_MIN = 10.0 -- max zoom level (smaller fov is more zoom)
local ZOOM_SPEED = 2.0 -- camera zoom speed
local LR_SPEED = 3.0 -- speed by which the camera pans left-right
local UD_SPEED = 3.0 -- speed by which the camera pans up-down
local toggleHeliCam = 51 -- control id of the button by which to toggle the heliCam mode. Default: INPUT_CONTEXT (E)
local toggleVision = 25 -- control id to toggle vision mode. Default: INPUT_AIM (Right mouse btn)
local toggleLockOn = 22 -- control id to lock onto a vehicle with the camera. Default is INPUT_SPRINT (spacebar)
local heliCam = false
local fov = (FOV_MAX + FOV_MIN) * 0.5

---@enum
local VISION_STATE = {
    normal = 0,
    nightmode = 1,
    thermal = 2,
}

local visionState = VISION_STATE.normal
local scanValue = 0

---@enum
local VEHICLE_LOCK_STATE = {
    dormant = 0,
    scanning = 1,
    locked = 2,
}

local vehicleLockState = VEHICLE_LOCK_STATE.dormant
local vehicleDetected = nil
local lockedOnVehicle = nil

local function isHeliHighEnough(heli)
    return GetEntityHeightAboveGround(heli) > 1.5
end

local function changeVision()
    PlaySoundFrontend(-1, 'SELECT', 'HUD_FRONTEND_DEFAULT_SOUNDSET', false)
    if visionState == VISION_STATE.normal then
        SetNightvision(true)
    elseif visionState == VISION_STATE.nightmode then
        SetNightvision(false)
        SetSeethrough(true)
    elseif visionState == VISION_STATE.thermal then
        SetSeethrough(false)
    else
        error('Unexpected visionState ' .. json.encode(visionState))
    end
    visionState = (visionState + 1) % 3
end

local function hideHudThisFrame()
    HideHelpTextThisFrame()
    HideHudAndRadarThisFrame()

    local hudComponents = {1, 2, 3, 4, 13, 11, 12, 15, 18, 19}
    for _, component in ipairs(hudComponents) do
        HideHudComponentThisFrame(component)
    end
end

local function checkInputRotation(cam, zoomValue)
    local rightAxisX = GetDisabledControlNormal(0, 220)
    local rightAxisY = GetDisabledControlNormal(0, 221)
    local rotation = GetCamRot(cam, 2)
    if rightAxisX == 0.0 and rightAxisY == 0.0 then return end

    local zoomFactor = zoomValue + 0.1
    local newZ = rotation.z - rightAxisX * UD_SPEED * zoomFactor
    local newY = rightAxisY * -1.0 * LR_SPEED * zoomFactor
    local newX = math.max(math.min(20.0, rotation.x + newY), -89.5)
    SetCamRot(cam, newX, 0.0, newZ, 2)
end

local function handleZoom(cam)
    if IsControlJustPressed(0,241) then -- Scrollup
        fov = math.max(fov - ZOOM_SPEED, FOV_MIN)
    end
    if IsControlJustPressed(0,242) then
        fov = math.min(fov + ZOOM_SPEED, FOV_MAX) -- ScrollDown
    end
    local currentFov = GetCamFov(cam)
    if math.abs(fov - currentFov) < 0.1 then -- the difference is too small, just set the value directly to avoid unneeded updates to FOV of order 10^-5
        fov = currentFov
    end
    SetCamFov(cam, currentFov + (fov - currentFov) * 0.05) -- Smoothing of camera zoom
end

local function rotAnglesToVec(rot) -- input vector3
    local z = math.rad(rot.z)
    local x = math.rad(rot.x)
    local num = math.abs(math.cos(x))
    return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
end

local function getVehicleInView(cam)
    local camCoords = GetCamCoord(cam)
    local camRot = GetCamRot(cam, 2)
    local forwardVector = rotAnglesToVec(camRot)
    local targetCoords = camCoords + (forwardVector * 400.0)
    local rayHandle = CastRayPointToPoint(camCoords.x, camCoords.y, camCoords.z, targetCoords.x, targetCoords.y, targetCoords.z, 10, cache.vehicle, 0)
    local _, _, _, _, entityHit = GetRaycastResult(rayHandle)

    return entityHit > 0 and IsEntityAVehicle(entityHit) and entityHit or nil
end

local function renderVehicleInfo(vehicle)
    local pos = GetEntityCoords(vehicle)
    local model = GetEntityModel(vehicle)
    local vehName = GetLabelText(GetDisplayNameFromVehicleModel(model))
    local licensePlate = qbx.getVehiclePlate(vehicle)
    local speed = math.ceil(GetEntitySpeed(vehicle) * 3.6)
    local street1, street2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z)
    local streetLabel = GetStreetNameFromHashKey(street1)
    if street2 ~= 0 then
        streetLabel = streetLabel .. ' | ' .. GetStreetNameFromHashKey(street2)
    end
    SendNUIMessage({
        type = 'heliupdateinfo',
        model = vehName,
        plate = licensePlate,
        speed = speed,
        street = streetLabel,
    })
end

local function heliCamThread()
    CreateThread(function()
        local sleep
        while heliCam do
            sleep = 0
            if vehicleLockState == VEHICLE_LOCK_STATE.scanning then
                if scanValue < 100 then
                    scanValue += 1
                    SendNUIMessage({
                        type = 'heliscan',
                        scanvalue = scanValue,
                    })
                    if scanValue == 100 then
                        PlaySoundFrontend(-1, 'SELECT', 'HUD_FRONTEND_DEFAULT_SOUNDSET', false)
                        lockedOnVehicle = vehicleDetected
                        vehicleLockState = VEHICLE_LOCK_STATE.locked
                    end
                    sleep = 10
                end
            elseif vehicleLockState == VEHICLE_LOCK_STATE.locked then
                scanValue = 100
                renderVehicleInfo(lockedOnVehicle)
                sleep = 100
            else
                scanValue = 0
                sleep = 500
            end
            Wait(sleep)
        end
    end)
end

local function unlockCam(cam)
    PlaySoundFrontend(-1, 'SELECT', 'HUD_FRONTEND_DEFAULT_SOUNDSET', false)
    lockedOnVehicle = nil
    local rot = GetCamRot(cam, 2) -- All this because I can't seem to get the camera unlocked from the entity
    fov = GetCamFov(cam)
    local oldCam = cam
    DestroyCam(oldCam, false)
    local newCam = CreateCam('DEFAULT_SCRIPTED_FLY_CAMERA', true)
    AttachCamToEntity(newCam, cache.vehicle, 0.0,0.0,-1.5, true)
    SetCamRot(newCam, rot.x, rot.y, rot.z, 2)
    SetCamFov(newCam, fov)
    RenderScriptCams(true, false, 0, true, false)
    vehicleLockState = VEHICLE_LOCK_STATE.dormant
    scanValue = 0
    SendNUIMessage({
        type = 'disablescan',
    })
    return newCam
end

local function turnOffCam()
    PlaySoundFrontend(-1, 'SELECT', 'HUD_FRONTEND_DEFAULT_SOUNDSET', false)
    heliCam = false
    vehicleLockState = VEHICLE_LOCK_STATE.dormant
    scanValue = 0
    SendNUIMessage({
        type = 'disablescan',
    })
    SendNUIMessage({
        type = 'heliclose',
    })
end

local function handleInVehicle()
    if not LocalPlayer.state.isLoggedIn then return end
    if QBX.PlayerData.job.type ~= 'leo' and not QBX.PlayerData.job.onduty then return end
    if isHeliHighEnough(cache.vehicle) then
        if IsControlJustPressed(0, toggleHeliCam) then -- Toggle Helicam
            PlaySoundFrontend(-1, 'SELECT', 'HUD_FRONTEND_DEFAULT_SOUNDSET', false)
            heliCam = true
            heliCamThread()
            SendNUIMessage({
                type = 'heliopen',
            })
        end
    end

    if heliCam then
        SetTimecycleModifier('heliGunCam')
        SetTimecycleModifierStrength(0.3)
        local scaleform = lib.requestScaleformMovie('HELI_CAM')
        local cam = CreateCam('DEFAULT_SCRIPTED_FLY_CAMERA', true)
        AttachCamToEntity(cam, cache.vehicle, 0.0,0.0,-1.5, true)
        SetCamRot(cam, 0.0, 0.0, GetEntityHeading(cache.vehicle), 2)
        SetCamFov(cam, fov)
        RenderScriptCams(true, false, 0, true, false)
        PushScaleformMovieFunction(scaleform, 'SET_CAM_LOGO')
        PushScaleformMovieFunctionParameterInt(0) -- 0 for nothing, 1 for LSPD logo
        PopScaleformMovieFunctionVoid()
        lockedOnVehicle = nil
        while heliCam and not IsEntityDead(cache.ped) and cache.vehicle and isHeliHighEnough(cache.vehicle) do
            if IsControlJustPressed(0, toggleHeliCam) then -- Toggle Helicam
                turnOffCam()
            end
            if IsControlJustPressed(0, toggleVision) then
                changeVision()
            end
            local zoomValue = 0
            if lockedOnVehicle then
                if DoesEntityExist(lockedOnVehicle) then

                    PointCamAtEntity(cam, lockedOnVehicle, 0.0, 0.0, 0.0, true)
                    if IsControlJustPressed(0, toggleLockOn) then
                        cam = unlockCam(cam)
                    end
                else
                    vehicleLockState = VEHICLE_LOCK_STATE.dormant
                    SendNUIMessage({
                        type = 'disablescan',
                    })
                    lockedOnVehicle = nil -- Cam will auto unlock when entity doesn't exist anyway
                end
            else
                zoomValue = (1.0 / (FOV_MAX - FOV_MIN)) * (fov - FOV_MIN)
                checkInputRotation(cam, zoomValue)
                vehicleDetected = getVehicleInView(cam)
                vehicleLockState = DoesEntityExist(vehicleDetected) and VEHICLE_LOCK_STATE.scanning or VEHICLE_LOCK_STATE.dormant
            end
            handleZoom(cam)
            hideHudThisFrame()
            PushScaleformMovieFunction(scaleform, 'SET_ALT_FOV_HEADING')
            PushScaleformMovieFunctionParameterFloat(GetEntityCoords(cache.vehicle).z)
            PushScaleformMovieFunctionParameterFloat(zoomValue)
            PushScaleformMovieFunctionParameterFloat(GetCamRot(cam, 2).z)
            PopScaleformMovieFunctionVoid()
            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
            Wait(0)
        end
        heliCam = false
        ClearTimecycleModifier()
        fov = (FOV_MAX + FOV_MIN) * 0.5 -- reset to starting zoom level
        RenderScriptCams(false, false, 0, true, false) -- Return to gameplay camera
        SetScaleformMovieAsNoLongerNeeded(scaleform) -- Cleanly release the scaleform
        DestroyCam(cam, false)
        SetNightvision(false)
        SetSeethrough(false)
    end
end

local spotlight = lib.addKeybind({
    name = 'spotlight',
    description = locale('spotlight_keybind'),
    defaultKey = 'H',
    disabled = true,
    onPressed = function()
        PlaySoundFrontend(-1, 'SELECT', 'HUD_FRONTEND_DEFAULT_SOUNDSET', false)

        local netId = NetworkGetNetworkIdFromEntity(cache.vehicle)

        TriggerServerEvent('qbx_helicam:server:toggleSpotlightState', netId)
    end,
})

local rappel = lib.addKeybind({
    name = 'rappel',
    description = locale('rappel_keybind'),
    defaultKey = 'X',
    disabled = true,
    onPressed = function()
        PlaySoundFrontend(-1, 'SELECT', 'HUD_FRONTEND_DEFAULT_SOUNDSET', false)
        TaskRappelFromHeli(cache.ped, 1)
    end
})

---@diagnostic disable-next-line: param-type-mismatch
AddStateBagChangeHandler('spotlight', nil, function(bagName, _, value)
    local entity = GetEntityFromStateBagName(bagName)

    SetVehicleSearchlight(entity, value, false)
end)

lib.onCache('seat', function(seat)
    local model = GetEntityModel(cache.vehicle)

    if not config.authorizedHelicopters[model] then return end

    if seat == -1 or seat == 0 then
        rappel:disable(true)

        if DoesVehicleHaveSearchlight(cache.vehicle) then
            spotlight:disable(false)
        end
    elseif seat >= 1 then
        spotlight:disable(true)

        if DoesVehicleAllowRappel(cache.vehicle) then
            rappel:disable(false)
        end
    end

    CreateThread(function()
        while cache.vehicle do
            handleInVehicle()

            Wait(0)
        end
    end)
end)