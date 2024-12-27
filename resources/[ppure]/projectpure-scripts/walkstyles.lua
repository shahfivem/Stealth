local QBCore = exports['qb-core']:GetCoreObject()

-- Helper function to set the walk style
local function SetWalkStyle(anim)
    local ped = PlayerPedId()
    if anim == 'default' then
        ResetPedMovementClipset(ped, 0.2)
    else
        RequestAnimSet(anim)
        while not HasAnimSetLoaded(anim) do Wait(0) end
        SetPedMovementClipset(ped, anim, 0.2)
    end
end

-- Event: Apply walk style when manually triggered
AddEventHandler('erp-scripts:setwalk', function()
    Wait(500)
    local PlayerData = QBCore.Functions.GetPlayerData()
    local cid = PlayerData.citizenid
    if not cid then return end

    -- Load walk style from KVP
    local savedWalk = GetResourceKvpString(cid .. "-walkstyle")
    walkstyle = savedWalk
    SetWalkStyle(savedWalk)
end)

-- Event: Save walk style to KVP
AddEventHandler("saveWalk", function(walk, kvp)
    local PlayerData = QBCore.Functions.GetPlayerData()
    local cid = PlayerData.citizenid
    if not cid then return end

    -- Save walk style to KVP
    if kvp then
        SetResourceKvp(cid .. "-walkstyle", walk)
        print("[^5SRP^7] Walkstyle saved: " .. walk)
        return
    end

    -- Update local walkstyle variable if not saving
    walkstyle = walk
end)

-- Event: Set walk style on player load
RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    Wait(500) -- Delay to ensure player data is ready
    local PlayerData = QBCore.Functions.GetPlayerData()
    local cid = PlayerData.citizenid
    if not cid then return end

    -- Load saved walk style
    local savedWalk = GetResourceKvpString(cid .. "-walkstyle") or 'default'
    walkstyle = savedWalk
    SetWalkStyle(savedWalk)
end)
