local disableCamControl = false -- Prevents cam management
local disableAim = false -- Variable used to check if their aim should be disabled whilst in a vehicle.
local disableAuto = false
local isAiming = false
local shouldDisable = false
local crosshairEnabled = false

local changeCooldown, lastView, crosshairKVP = 0, 0, 1

local policeBikes = {
    [-1921512137] = true,
    [-1145771600] = true,
    [297719966] = true
}

RegisterCommand("crosshair", function(_, _, rawCommand)
    local hexArg = string.sub(rawCommand, 11)
    if #hexArg > 0 then
        SetResourceKvp('crosshairColor', hexArg)
        exports.erp_notifications:SendAlert('success', 'Crosshair color updated')
        SendNUIMessage({ display = "reticleColor", color = hexArg })
    elseif GetResourceKvpInt('crosshair') == 2 then
        SetResourceKvpInt('crosshair', 1)
        crosshairKVP = 1
        exports.erp_notifications:SendAlert('success', 'Crosshair Enabled')
    else
        SetResourceKvpInt('crosshair', 2)
        crosshairKVP = 0
        exports.erp_notifications:SendAlert('error', 'Crosshair Disabled')
        SendNUIMessage({ display = "reticleHide" })
    end
end, false)

TriggerEvent('chat:addSuggestion', '/crosshair', 'Toggle the crosshair or set the color', { { name="color", help="[Optional] Hex value like #FFFFFF"} })

local function setViewMode(viewmode)
    for i = 1, 7 do
        SetCamViewModeForContext(i, viewmode)
    end
    SetFollowPedCamViewMode(viewmode)
    SetFollowVehicleCamViewMode(viewmode)
end

local function init()
    SetPlayerLockon(plyId, false)

    if GetResourceKvpInt('crosshair') == 0 then
        SetResourceKvpInt("crosshair", 1)
        crosshairKVP = 1
    end

    if not GetResourceKvpString('crosshairColor') then 
        SetResourceKvp("crosshairColor", '#FFFFFF')
    end

    local kvp = GetResourceKvpInt('crosshair')

    if kvp == 1 then crosshairKVP = 1
    elseif kvp == 2 then crosshairKVP = 0
    elseif kvp == 3 then crosshairKVP = 2 end

    SendNUIMessage({ display = "reticleColor", color = GetResourceKvpString('crosshairColor') })
end

local function manageCrosshair(toggle)
    if crosshairKVP > 0 then
        if toggle then
            if not crosshairEnabled then
                SendNUIMessage({ display = "reticleShow" })
                crosshairEnabled = true
            end
        elseif crosshairEnabled then
            SendNUIMessage({ display = "reticleHide" })
            crosshairEnabled = false
        end
    elseif crosshairEnabled then
        SendNUIMessage({ display = "reticleHide" })
        crosshairEnabled = false
    end
end

local function forceFp(plyId)
    print('Forcing first person')
    SetCamEffect(0)
    local currCam, currVehCam = GetFollowPedCamViewMode(), GetFollowVehicleCamViewMode()

    if currCam ~= 4 or currVehCam ~= 4 then
        lastView = GetFollowPedCamViewMode()
        setViewMode(4)
        changeCooldown = GetGameTimer() + 2500
        shouldDisable = true
    elseif currCam == 0 then
        SetPlayerCanDoDriveBy(plyId, false)
        disableAim = true
    end

    print('Cam view mode for context', GetCamViewModeForContext(GetCamActiveViewModeContext()))
    if GetCamViewModeForContext(GetCamActiveViewModeContext()) ~= 4 then
        SetPlayerCanDoDriveBy(plyId, false)
        disableAim = true
    elseif disableAim and not disableAuto then
        disableAim = false
        SetPlayerCanDoDriveBy(plyId, true)
    end

    disableCamControl = true
end

local function exitFp(plyId)
    shouldDisable = true;
    local currCam = GetFollowPedCamViewMode()
    if currCam == 1 or currCam == 2 then
        if wasInVehicle then
            SetFollowPedCamViewMode(0)
            SetFollowVehicleCamViewMode(0)
            while GetFollowPedCamViewMode() ~= 0 do
                Wait(0)
                SetFollowPedCamViewMode(0)
                SetFollowVehicleCamViewMode(0)
            end
        else
            setViewMode(0)
            shouldDisable = true
        end
    end
    if disableAim and not disableAuto then SetPlayerCanDoDriveBy(plyId, true) disableAim = false end;
    wasInVehicle = false
end

local function SomethingDumb(plyId)
    manageCrosshair(false)

    if changeCooldown ~= 0 then
        if changeCooldown < GetGameTimer() then
            changeCooldown = 0
            setViewMode(lastView)
        end
    end

    if (GetFollowPedCamViewMode() == 2 or GetFollowVehicleCamViewMode() == 2) and not IsThisModelAHeli(plyVeh.model) then
        setViewMode(4)
        shouldDisable = true
    end

    if disableAim and not isWeaponGun then -- Re-enable driveby aim if they no longer have a gun
        SetPlayerCanDoDriveBy(plyId, true)
        disableAim = false
        disableAuto = false
    end

    disableCamControl = false
end

local function handleAuto()
    if not plyVeh.id or not Automatics[plyWep] then
        if disableAuto then
            disableAuto = false
            SetPlayerCanDoDriveBy(plyId, false)
        end

        return
    end

    if disableAim and disableAuto then return end

    disableAim, disableAuto = true, true
    SetPlayerCanDoDriveBy(plyId, false)
end

-- CreateThread(function()
--     local shakeCounter = 0
--     local shakeCounter2 = 0

--     local isShaking = false

--     local IsPedStill = IsPedStill
--     local IsPedAimingFromCover = IsPedAimingFromCover
--     local ShakeGameplayCam = ShakeGameplayCam
--     local StopGameplayCamShaking = StopGameplayCamShaking

--     while true do
--         local isPedStill = IsPedStill(plyPed)
--         if isAiming and isPedStill and not IsPedAimingFromCover(plyPed) then
--             Wait(100)

--             shakeCounter = shakeCounter + 1
--             shakeCounter2 = 0

--             if shakeCounter == 5 then
--                 isShaking = true
--                 ShakeGameplayCam('HAND_SHAKE', 0.2)
--             end
--         elseif isAiming and not isPedStill then
--             Wait(10)

--             shakeCounter2 = shakeCounter2 + 1
--             shakeCounter = 0

--             if shakeCounter2 == 5 then
--                 isShaking = true
--                 ShakeGameplayCam('HAND_SHAKE', 0.9)
--             end

--             shakeCounter = 0
--             shakeCounter2 = 0
--         else
--             if isShaking then
--                 isShaking = false
--                 shakeCounter = 0
--                 shakeCounter2 = 0

--                 StopGameplayCamShaking(true)
--             end

--             Wait(1000)
--         end
--     end
-- end)

CreateThread(function()
    Wait(100)
    init()

    local DisableControlAction = DisableControlAction
    local IsPlayerFreeAiming= IsPlayerFreeAiming
    local IsAimCamActive = IsAimCamActive
    local SetPlayerCanDoDriveBy = SetPlayerCanDoDriveBy

    while true do

        Wait(0)

        if isWeaponGun then
            if disableCamControl then DisableControlAction(1, 0, true) end
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end

        handleAuto()

        if isWeaponGun then
            isAiming = IsPlayerFreeAiming(plyId)
            if not isAiming then isAiming = IsAimCamActive() end
            if isAiming then
                manageCrosshair(true)
                local model = plyVeh.model
                local isBike = plyVeh.class == 8 or plyVeh.class == 13 or policeBikes[model]
                if plyVeh.id and isAiming and not isBike and not disableAuto then
                    if shouldDisable and not disableAim then
                        SetPlayerCanDoDriveBy(plyId, false)
                        shouldDisable = false;
                        disableAim = true;
                        while IsAimCamActive() do Wait(0) end
                    end
                    forceFp(plyId)
                else
                    disableCamControl = false
                    exitFp(plyId)
                end
            else
                SomethingDumb(plyId)
            end
        else
            SomethingDumb(plyId)
        end
    end
end)

exports('setViewMode', setViewMode) -- exports.echo_combat:setViewMode(4)