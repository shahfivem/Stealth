local config = require 'qbx_ignore.config'

---@TODO test if this needs to be called in a loop
CreateThread(function()
    while true do
        for _, sctyp in next, config.blacklisted.scenarioTypes do
            SetScenarioTypeEnabled(sctyp, false)
        end
        for _, scmdl in next, config.blacklisted.suppressedModels do
            SetVehicleModelIsSuppressed(joaat(scmdl), true)
        end
        for _, scgrp in next, config.blacklisted.scenarioGroups do
            SetScenarioGroupEnabled(scgrp, false)
        end
        Wait(10000)
    end
end)

AddEventHandler('populationPedCreating', function(x, y, z)
    Wait(500)    -- Give the entity some time to be created
    local _, handle = GetClosestPed(x, y, z, 1.0) -- Get the entity handle
    SetPedDropsWeaponsWhenDead(handle, false)
end)

CreateThread(function() -- all these should only need to be called once
    if config.disable.ambience then
        StartAudioScene('CHARACTER_CHANGE_IN_SKY_SCENE')
    end
    SetAudioFlag('PoliceScannerDisabled', true)
    SetGarbageTrucks(false)
    SetCreateRandomCops(false)
    SetCreateRandomCopsNotOnScenarios(false)
    SetCreateRandomCopsOnScenarios(false)
    DistantCopCarSirens(false)
    SetFarDrawVehicles(false)
    RemoveVehiclesFromGeneratorsInArea(335.2616 - 300.0, -1432.455 - 300.0, 46.51 - 300.0, 335.2616 + 300.0, -1432.455 + 300.0, 46.51 + 300.0) -- central los santos medical center
    RemoveVehiclesFromGeneratorsInArea(441.8465 - 500.0, -987.99 - 500.0, 30.68 -500.0, 441.8465 + 500.0, -987.99 + 500.0, 30.68 + 500.0) -- police station mission row
    RemoveVehiclesFromGeneratorsInArea(316.79 - 300.0, -592.36 - 300.0, 43.28 - 300.0, 316.79 + 300.0, -592.36 + 300.0, 43.28 + 300.0) -- pillbox
    RemoveVehiclesFromGeneratorsInArea(-2150.44 - 500.0, 3075.99 - 500.0, 32.8 - 500.0, -2150.44 + 500.0, -3075.99 + 500.0, 32.8 + 500.0) -- military
    RemoveVehiclesFromGeneratorsInArea(-1108.35 - 300.0, 4920.64 - 300.0, 217.2 - 300.0, -1108.35 + 300.0, 4920.64 + 300.0, 217.2 + 300.0) -- nudist
    RemoveVehiclesFromGeneratorsInArea(-458.24 - 300.0, 6019.81 - 300.0, 31.34 - 300.0, -458.24 + 300.0, 6019.81 + 300.0, 31.34 + 300.0) -- police station paleto
    RemoveVehiclesFromGeneratorsInArea(1854.82 - 300.0, 3679.4 - 300.0, 33.82 - 300.0, 1854.82 + 300.0, 3679.4 + 300.0, 33.82 + 300.0) -- police station sandy
    RemoveVehiclesFromGeneratorsInArea(-724.46 - 300.0, -1444.03 - 300.0, 5.0 - 300.0, -724.46 + 300.0, -1444.03 + 300.0, 5.0 + 300.0) -- REMOVE CHOPPERS WOW
end)

if config.disable.idleCamera then
    DisableIdleCamera(true)
end

local function pistolWhipLoop()
    CreateThread(function()
        local sleep
        while cache.weapon do
            sleep = 500
            if IsPedArmed(cache.ped, 6) then
                sleep = 0
                DisableControlAction(1, 140, true)
                DisableControlAction(1, 141, true)
                DisableControlAction(1, 142, true)
            end

            if cache.weapon == `WEAPON_FIREEXTINGUISHER` or cache.weapon == `WEAPON_PETROLCAN` then
                if IsPedShooting(cache.ped) then
                    SetPedInfiniteAmmo(cache.ped, true, `WEAPON_FIREEXTINGUISHER`)
                    SetPedInfiniteAmmo(cache.ped, true, `WEAPON_PETROLCAN`)
                end
            end
            Wait(sleep)
        end
    end)
end

lib.onCache('weapon', function(weapon)
    Wait(5)
    if not weapon then return end
    pistolWhipLoop()
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local ped = PlayerPedId()
		if IsPedUsingActionMode(ped) then
			SetPedUsingActionMode(ped, false, -1, 'DEFAULT_ACTION')
		end
	end
end)

local isPointing = false

local isPointing = false

RegisterKeyMapping("point", "Point", "keyboard", "B")
RegisterCommand("-point", function() end, false) -- Disables chat from opening.

local function startPointing()
    local ped = PlayerPedId()
    RequestAnimDict("anim@mp_point")
    while not HasAnimDictLoaded("anim@mp_point") do Wait(0) end
    SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
    SetPedConfigFlag(ped, 36, 1)
    Citizen.InvokeNative(0x2D537BA194896636, ped, "task_mp_pointing", 0.5, 0, "anim@mp_point", 24)
    RemoveAnimDict("anim@mp_point")
    isPointing = true
    TriggerEvent('point:camcheck')
end

local function stopPointing()
    local ped = PlayerPedId()
    Citizen.InvokeNative(0xD01015C7316AE176, ped, "Stop")
    if not IsPedInjured(ped) then
        ClearPedSecondaryTask(ped)
    end
    if not IsPedInAnyVehicle(ped, 1) then
        SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
    end
    SetPedConfigFlag(ped, 36, 0)
    ClearPedSecondaryTask(ped)
    isPointing = false
end

RegisterCommand("point", function(source, args, rawCommand)
    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        if isPointing then
            stopPointing()
        elseif not isPointing then
            startPointing()
        end
    end
end, false)

AddEventHandler('point:camcheck', function()
    local ped = PlayerPedId()
    while isPointing do
        Wait(0)
            local camPitch = GetGameplayCamRelativePitch()
            if camPitch < -70.0 then
                camPitch = -70.0
            elseif camPitch > 42.0 then
                camPitch = 42.0
            end
            
            camPitch = (camPitch + 70.0) / 112.0

            local camHeading = GetGameplayCamRelativeHeading()
            local cosCamHeading = Cos(camHeading)
            local sinCamHeading = Sin(camHeading)
            if camHeading < -180.0 then
                camHeading = -180.0
            elseif camHeading > 180.0 then
                camHeading = 180.0
            end
            
            camHeading = (camHeading + 180.0) / 360.0

            local blocked = 0
            local nn = 0

            local coords = GetOffsetFromEntityInWorldCoords(ped, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
            local ray = Cast_3dRayPointToPoint(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7);
            nn,blocked,coords,coords = GetRaycastResult(ray)

            SetTaskMoveNetworkSignalFloat(ped, "Pitch", camPitch)
            SetTaskMoveNetworkSignalFloat(ped, "Heading", camHeading * -1.0 + 1.0)
            SetTaskMoveNetworkSignalBool(ped, "isBlocked", blocked)
            SetTaskMoveNetworkSignalBool(ped, "isFirstPerson", N_0xee778f8c7e1142e2(N_0x19cafa3c87f7c2ff() == 4)--[[Citizen.InvokeNative(0xEE778F8C7E1142E2, Citizen.InvokeNative(0x19CAFA3C87F7C2FF)) == 4]])
    end
    return
end)


RegisterCommand('+handsup', function()
    local plyPed = PlayerPedId()  -- Ensure this is the correct player ped
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local isInVehicle = plyVeh and plyVeh ~= 0
    local isPlayerDead = LocalPlayer.state.isdead
    local isPlayingAnim = IsEntityPlayingAnim(plyPed, "missminuteman_1ig_2", "handsup_base", 3)

    -- Debugging print statements
    print("isPlayingAnim: ", isPlayingAnim)
    print("isInVehicle: ", isInVehicle)
    print("isPlayerDead: ", isPlayerDead)

    if IsNuiFocused() then
        return
    end

    if isInVehicle then
        ClearPedSecondaryTask(plyPed)  -- Clear task if in vehicle
    elseif isPlayingAnim then
        ExecuteCommand("e c")  -- Cancel handsup emote if already playing
    elseif not isPlayerDead then
        ExecuteCommand("e handsup")  -- Start handsup emote if not dead
    end
end, false)

RegisterKeyMapping('+handsup', 'Hands Up', 'keyboard', 'x')
RegisterCommand("-handsup", function() end, false) -- Disables chat from opening.


-- ANCHOR

local boatArray = {}

function toggleAnchor()
    if IsPedInAnyBoat(plyPed) then
        local playerVeh = GetVehiclePedIsIn(plyPed, false)
        local vehPlate = GetVehicleNumberPlateText(playerVeh)
        if boatArray[vehPlate] == nil then boatArray[vehPlate] = { vehAnchored = false } end
        local fin = lib.progressBar({
            duration = 1000,  -- Duration for the task (in milliseconds)
            label = ('%s the anchor!'):format(not boatArray[vehPlate].vehAnchored and 'Dropping' or 'Raising'),  -- Label text
        })
        
        if fin then 
            if CanAnchorBoatHere(playerVeh) then
                SetBoatAnchor(playerVeh, not boatArray[vehPlate].vehAnchored)
                SetBoatFrozenWhenAnchored(playerVeh, true)
                boatArray[vehPlate].vehAnchored = not boatArray[vehPlate].vehAnchored
            else
                lib.notify('Unable to anchor here.')
            end
        end
    else
        lib.notify('You can only do this while in a boat.')
    end
end

RegisterCommand('anchor', function(src, args, raw)
    toggleAnchor()
end, false)