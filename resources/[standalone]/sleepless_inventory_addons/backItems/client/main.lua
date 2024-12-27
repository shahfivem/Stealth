-- Assuming qbx.isWearingDuffelbag is already defined elsewhere
local CBackItem = require 'backItems.imports.backitem'
local CBackWeapon = require 'backItems.imports.weapon'
local Utils = require 'backItems.imports.utils'
local PlayerState = LocalPlayer.state

SetFlashLightKeepOnWhileMoving(true)

local Players = {}

local function deleteBackItemsForPlayer(serverId)
    if not serverId or not Players[serverId] then return end

    for i = 1, #Players[serverId] do
        local backItem = Players[serverId][i]

        if backItem then
            backItem:destroy()
        end
    end

    table.wipe(Players[serverId])
end

local function createBackItemsForPlayer(serverId, backItems)
    for i = 1, #backItems do
        local itemData = backItems[i]
        if itemData.isWeapon then
            Players[serverId][#Players[serverId] + 1] = CBackWeapon:new(serverId, itemData)
        else
            Players[serverId][#Players[serverId] + 1] = CBackItem:new(serverId, itemData)
        end
    end
end

local function refreshBackItemsLocal()
    local serverId = cache.serverId

    -- Check if the player is wearing a duffel bag
    if qbx.isWearingDuffelbag() then
        deleteBackItemsForPlayer(serverId)
        return -- Do not create back items if wearing a duffel bag
    end

    if Players[serverId] then
        deleteBackItemsForPlayer(serverId)

        local Items = Utils.formatCachedInventory(InvCache)

        createBackItemsForPlayer(serverId, Items)
    end
end

function RefreshBackItems()
    if not Players[cache.serverId] then
        Players[cache.serverId] = {}
    end
    if PlayerState.backItems and next(PlayerState.backItems) then
        PlayerState:set('backItems', false, true)

        UpdateBackItems()
    end
end

AddStateBagChangeHandler('bucket', ('player:%s'):format(cache.serverId), function(_, _, value)
    if value == 0 then
        if PlayerState.backItems and next(PlayerState.backItems) then
            refreshBackItemsLocal()
        end
    end
end)

RegisterNetEvent('txcl:setPlayerMode', function(mode)
    if mode == "noclip" then
        PlayerState:set("hideAllBackItems", true, true)
    elseif mode == "none" then
        PlayerState:set("hideAllBackItems", false, true)
    end

    RefreshBackItems()
end)

AddStateBagChangeHandler('backItems', nil, function(bagName, _, backItems, _, replicated)
    if replicated then
        return
    end

    local playerId = GetPlayerFromStateBagName(bagName)
    local serverId = GetPlayerServerId(playerId)

    if not Players[serverId] then
        Players[serverId] = {}
    end

    if not backItems then
        return deleteBackItemsForPlayer(serverId)
    end

    local plyPed = playerId == cache.playerId and cache.ped

    if not plyPed then
        local _, resp = pcall(function ()
            return lib.waitFor(function()
                local ped = GetPlayerPed(playerId)
                if ped > 0 then return ped end
            end, ('%s Player didnt exist in time! (%s)'):format(playerId, bagName), 10000)
        end)
        plyPed = resp
    end

    if not plyPed or plyPed == 0 then return end

    deleteBackItemsForPlayer(serverId)

    if next(backItems) then
        createBackItemsForPlayer(serverId, backItems)
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        for serverId, backItems in pairs(Players) do
            if backItems then
                deleteBackItemsForPlayer(serverId)
            end
        end
    end
end)

CreateThread(function()
    while true do
        Wait(1000)
        for serverId, backItems in pairs(Players) do
            local player = GetPlayerFromServerId(serverId)
            local targetPed = GetPlayerPed(player)

            if player > 0 and targetPed and DoesEntityExist(targetPed) then
                if qbx.isWearingDuffelbag() then
                    PlayerState:set("hideAllBackItems", true, true)
                    deleteBackItemsForPlayer(serverId)
                else
                    PlayerState:set("hideAllBackItems", false, true)
                    if not Players[serverId] or #Players[serverId] == 0 then
                        refreshBackItemsLocal()
                    end
                end
                if not PlayerState.hideAllBackItems then
                    for i = 1, #backItems do
                        local backItem = backItems[i]
                        if backItem and not IsEntityAttachedToEntity(backItem.object, targetPed) then
                            backItem:attach()
                        end
                    end
                end
            else
                deleteBackItemsForPlayer(serverId)
            end
        end
    end
end)



RegisterNetEvent('backItems:clearPlayerItems', function(serverId)
    deleteBackItemsForPlayer(serverId)
    Players[serverId] = nil
end)
