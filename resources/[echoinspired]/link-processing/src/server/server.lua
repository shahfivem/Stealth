local QBCore = exports['qb-core']:GetCoreObject()

function addItems(xPlayer, items)
    for _, item in ipairs(items) do
        if type(item) == "table" and #item == 2 then
            local itemName, itemAmount = item[1], item[2]

            if exports.ox_inventory:CanCarryItem(xPlayer.PlayerData.source, itemName, itemAmount) then
                local success, response = exports.ox_inventory:AddItem(xPlayer.PlayerData.source, itemName, itemAmount)
                if success then
                    TriggerClientEvent('QBCore:Notify', xPlayer.PlayerData.source, 
                        string.format("You received %d %s!", itemAmount, itemName), "success")
                else
                    TriggerClientEvent('QBCore:Notify', xPlayer.PlayerData.source, 
                        string.format("Failed to receive %d %s. Please try again.", itemAmount, itemName), "error")
                end
            else
                TriggerClientEvent('QBCore:Notify', xPlayer.PlayerData.source, 
                    string.format("You cannot carry any more %s.", itemName), "error")
            end
        else
            TriggerClientEvent('QBCore:Notify', xPlayer.PlayerData.source, 
                "Invalid item type or format detected. Please check the server configuration.", "error")
        end
    end
end

for name, location in pairs(Shared.Locations) do
    local eventName = location.processEvent

    lib.callback.register(eventName, function(source)
        local xPlayer = QBCore.Functions.GetPlayer(source)

        if not xPlayer then
            TriggerClientEvent('QBCore:Notify', source, 
                "Error: Player not found. Please contact the server administrator.", "error")
            return false
        end

        local canProcess = true

        for _, requiredItem in ipairs(location.requiredItems) do
            if type(requiredItem) == "table" and #requiredItem == 2 then
                local itemName, itemAmount = requiredItem[1], requiredItem[2]
                local item = exports.ox_inventory:GetItem(source, itemName, nil, false)

                if not item then
                    TriggerClientEvent('QBCore:Notify', source, 
                        string.format("You do not have any %s to process.", itemName), "error")
                    canProcess = false
                    break
                elseif item.count < itemAmount then
                    TriggerClientEvent('QBCore:Notify', source, 
                        string.format("You need %d %s, but you only have %d.", itemAmount, itemName, item.count), "error")
                    canProcess = false
                    break
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 
                    "Invalid required item format detected. Please check the server configuration.", "error")
                canProcess = false
                break
            end
        end

        if canProcess then
            for _, requiredItem in ipairs(location.requiredItems) do
                local itemName, itemAmount = requiredItem[1], requiredItem[2]
                exports.ox_inventory:RemoveItem(source, itemName, itemAmount)
            end

            local hasOptional = false
            for _, optionalItem in ipairs(location.optionalItems) do
                local itemName, itemAmount = optionalItem[1], optionalItem[2]
                local item = exports.ox_inventory:GetItem(source, itemName, nil, false)

                if item and item.count >= itemAmount then
                    hasOptional = true
                    break
                end
            end

            if hasOptional then
                if #location.optionalAddItems > 0 then
                    addItems(xPlayer, location.optionalAddItems)
                end
            else
                if #location.addItems > 0 then
                    addItems(xPlayer, location.addItems)
                end
            end
        else
            TriggerClientEvent('QBCore:Notify', source, "You do not have the required items to process.", "error")
        end
    end)
end

local inv = exports.ox_inventory
local ox_lib = exports.ox_lib

for itemName, duration in pairs(Shared.UsableItems) do
    exports(itemName, function(event, item, inventory, slot, data)
        if event == 'usedItem' then
            local playerId = inventory.id

            TriggerClientEvent('link-processing:useItem', playerId, duration)
            
            TriggerClientEvent('QBCore:Notify', playerId, 
                string.format("%s consumed! You will be invincible to stunguns for %d seconds!", itemName, duration / 1000), "success")
        end
    end)
end