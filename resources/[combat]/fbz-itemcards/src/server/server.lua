QBCore = exports['qb-core']:GetCoreObject()

local displayRadius = 8.0
local playersShowingCard = {}

for itemName, _ in pairs(Shared.Items) do
    QBCore.Functions.CreateUseableItem(itemName, function(source, item)
        local xPlayer = QBCore.Functions.GetPlayer(source)

        if playersShowingCard[source] then
            TriggerClientEvent('QBCore:Notify', source, 'You are already showing a card.', 'error')
            return
        end

        if Shared.Items[itemName] then
            playersShowingCard[source] = true 
            TriggerClientEvent('fbz-flashable:client:DisplayCard', source, itemName)
            TriggerEvent('fbz-flashable:server:ShowCardNearby', source, itemName)
        end
    end)
end

RegisterNetEvent('fbz-flashable:server:ShowCardNearby', function(src, itemName)
    local srcPlayer = QBCore.Functions.GetPlayer(src)
    local srcCoords = GetEntityCoords(GetPlayerPed(src))

    for _, playerId in ipairs(QBCore.Functions.GetPlayers()) do
        local targetPlayer = QBCore.Functions.GetPlayer(playerId)
        local targetCoords = GetEntityCoords(GetPlayerPed(playerId))

        if #(srcCoords - targetCoords) <= displayRadius then
            TriggerClientEvent('fbz-flashable:client:ShowNearby', playerId, src, itemName)
        end
    end
end)

RegisterNetEvent('fbz-flashable:client:CardClosed')
AddEventHandler('fbz-flashable:client:CardClosed', function()
    local src = source
    playersShowingCard[src] = nil 
end)
