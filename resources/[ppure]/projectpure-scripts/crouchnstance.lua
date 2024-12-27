local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()
local plyPed = cache.ped
local plyVeh = GetVehiclePedIsIn(plyPed, false)
local plyId = PlayerId()

local stealth = { on = false, forced = false, initialized = true }
local stance, lastHighStance = 3, 3
local persistentProneStance, persistentStealthStance, cooldown = true, false, false

local forceStance = false
local function thisStealth(b) SetPedStealthMovement(plyPed, b, "DEFAULT_ACTION") stealth.on = b end
local function forcedStealth(b) stealth.forced = b end
local function actionmode(b) SetPedUsingActionMode(plyPed, b, -1, "DEFAULT_ACTION") end


local function isPolice()
    return QBX.PlayerData.job.type == 'leo' and QBX.PlayerData.job.onduty
end

AddEventHandler('erp-scripts:setwalk', function()
    Wait(500)

    local cid = PlayerData.citizenid
    if not cid then return end

    local savedWalk = GetResourceKvpString(cid.."-walk") or ''
    if #savedWalk > 0 then
        lib.requestAnimSet(savedWalk)
        SetPedMovementClipset(plyPed, savedWalk, 0.2)
    end
end)

AddEventHandler("saveWalk", function(walk, kvp)
    if kvp then
        local plyCid = PlayerData.citizenid
        if plyCid then
            print("[^5PureRP^7] Walk has been saved in KVP.")
            SetResourceKvp(plyCid.."-walk", walk)
        end
        return
    end
    oldWalk = walk;
end)

RegisterKeyMapping("crouch", "Toggle Crouch", "keyboard", "LCONTROL")
RegisterCommand("-crouch", function() end, false) -- Disables chat from opening.

CreateThread(function()
    while true do
        local waitTime = 3000

        if not plyVeh then
            waitTime = 400
            if IsPedUsingActionMode(plyPed) then SetPedUsingActionMode(plyPed, -1, -1, 1) end
        end

        Wait(waitTime)
    end
end)

CreateThread(function()

    SetFlashLightKeepOnWhileMoving(true)
    SetWeaponsNoAutoswap(true)
    NetworkSetLocalPlayerSyncLookAt(true)
   
    local allowedCrouchWeapons = {
        [`WEAPON_SNIPERRIFLE`] = true
    }

    while true do
        if stance == 1 then
            local _, weapon = GetCurrentPedWeapon(cache.ped, true)

            if not allowedCrouchWeapons[weapon] then
                DisablePlayerFiring(plyId, true)
                DisableControlAction(0, 25, true)
            end

            Wait(0)
        else
            Wait(1000)
        end
    end
end)

local function reset()
    ResetPedMovementClipset(plyPed, 0.55)
    ResetPedStrafeClipset(plyPed)
    SetPedCanPlayAmbientAnims(plyPed, true)
    SetPedCanPlayAmbientBaseAnims(plyPed, true)
    ResetPedWeaponMovementClipset(plyPed)
    thisStealth(false)
    forcedStealth(true)
    actionmode(false)

    if not persistentProneStance and stance == 0 then
        stance = 1
    end

    if stance == 1 then
        if isPolice() then
            stance = 2
        else
            stance = 3
        end
    end

    if not persistentStealthStance and stance == 2 then
        stance = 3
    end

    Wait(50)

    local plyCid = PlayerData.citizenid
    if plyCid then
        if oldWalk then
            RequestAnimSet(oldWalk)
            while not HasAnimSetLoaded(oldWalk) do Wait(0) end
            SetPedMovementClipset(plyPed, oldWalk, 0.2)
            return
        end
        local savedWalk = GetResourceKvpString(plyCid .. "-walk")
        if not savedWalk or savedWalk == "" then
            ResetPedMovementClipset(plyPed)
            return
        end
        RequestAnimSet(savedWalk)
        while not HasAnimSetLoaded(savedWalk) do Wait(0) end
        SetPedMovementClipset(plyPed, savedWalk, 0.2)
    end
end

local function ToggleCrouch()
    if forceStance then return end

    if stance == 1 then
        -- Stand up and reset clipsets
        stance = 3
        reset()
    else
        -- Activate crouch
        stance = 1
        RequestAnimSet('move_ped_crouched')
        while not HasAnimSetLoaded('move_ped_crouched') do Wait(0) end
        SetPedMovementClipset(plyPed, 'move_ped_crouched', 0.2)
        SetPedStrafeClipset(plyPed, 'move_ped_crouched_strafing')
    end
end

local function HandleStealth()
    if isPolice() and IsPlayerFreeAiming(plyId) then
        SetPedStealthMovement(plyPed, true, "DEFAULT_ACTION")
    else
        SetPedStealthMovement(plyPed, false, "DEFAULT_ACTION")
    end
end

local function crouch()
	RequestAnimSet('move_ped_crouched')
	thisStealth(false) 
	forcedStealth(true) 
	actionmode(false)
	SetPedCanPlayAmbientAnims(plyPed, false) 
	SetPedCanPlayAmbientBaseAnims(plyPed, false)
	while not HasAnimSetLoaded('move_ped_crouched') do Wait(0) RequestAnimSet('move_ped_crouched') end
    SetPedMovementClipset(plyPed, 'move_ped_crouched', 0.2)
	SetPedStrafeClipset(plyPed, 'move_ped_crouched_strafing')
end

local function stand() reset() thisStealth (false) forcedStealth(true) end

local function goStealthy() thisStealth(true) forcedStealth(true) end

local function updateStance()
	if stance == 3 then stand() end
	if stance == 2 then goStealthy() end
	if stance == 1 then crouch() end
	if stance == 0 then prone() end
end

exports('setStance', function(state, force)

    stance = state
    forceStance = force

    updateStance()

end)

local widescreenStatus = 0

local function GetSeatPedIsIn(ped)
    for i=-2,GetVehicleMaxNumberOfPassengers(plyVeh) do
        if(GetPedInVehicleSeat(plyVeh, i) == ped) then return i end
    end
    return -2
end

CreateThread(function()
	while true do
        local isWidescreen = GetIsWidescreen()
        local pauseMenu = IsPauseMenuActive()

        if widescreenStatus == 1 and pauseMenu then
            widescreenStatus = 0
            SendNUIMessage({ show = false })
        elseif not isWidescreen then
            if widescreenStatus == 0 and not pauseMenu then
                widescreenStatus = 1
                SendNUIMessage({ show = true })
            end
        elseif isWidescreen then
            if widescreenStatus == 1 then
                widescreenStatus = 0
                SendNUIMessage({ show = false })
            end
        end
            
        local job = isPolice()
        if job then
            if stance ~= 1 then
                if IsPlayerFreeAiming(plyId) then
                    actionmode(true)
                    goStealthy()
                elseif stealth.on then
                    updateStance()
                end
            else
                updateStance()
            end
        end

        if plyVeh and not scriptShuffle then
            SetPedConfigFlag(plyPed, 184, true)
            if GetIsTaskActive(plyPed, 165) == 1 and GetPedInVehicleSeat(plyVeh, 0) == plyPed then
                print('Player is trying to shuffle to driver seat...')
                if GetIsTaskActive(plyPed, 2) ~= 1 then
                    print('Doesn\'t appear to be trying to exit the vehicle, preventing task!')
                    SetPedIntoVehicle(plyPed, plyVeh, GetSeatPedIsIn(plyPed))
                else
                    print('Seems to be wanting to exit, I assume the passenger door is blocked, allowing!')
                end
            end
        end

		Wait(500)
    end
end)

function loadAnimDict(dict) RequestAnimDict(dict) while not HasAnimDictLoaded(dict) do Wait(0) end end

RegisterCommand("crouch", function()
    if IsNuiFocused() then return end
    if IsPedOnFoot(plyPed) and not IsPedJumping(plyPed) then
        ToggleCrouch()
    end
end, false)

CreateThread(function()
    while true do
        Wait(500) -- Run periodically for performance
        HandleStealth()
    end
end)