local QBCore = exports['qb-core']:GetCoreObject()

--- Returns the amount of cops online and on duty
--- @return amount number - amount of cops
local GetCopCount = function()
    local amount = 0
    local players = QBCore.Functions.GetQBPlayers()
    for _, Player in pairs(players) do
        if Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    return amount
end

--- Calculates the amount of cash rolls to launder
--- @return retval number - amount
local GetLaunderAmount = function()
    local cops = GetCopCount()
    if cops > 10 then cops = 10 end -- cap at 10 cops for no insane returns
    local min = 1 + (cops * 3) -- 300 base + 100 per cop minimum
    local max = 6 + (cops * 6) -- 600 base + 190 per cop minimum
    local retval = math.random(min, max)
    return retval
end

RegisterNetEvent('qb-oxyruns:server:Reward', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player then
        print("Player found:", Player.PlayerData.citizenid)

        -- Filter items the player has in inventory
        local availableItems = {}
        for _, item in pairs(Config.LaunderItems) do
            local itemAmount = exports.ox_inventory:Search(src, 'count', item.name)
            if itemAmount and itemAmount > 0 then
                table.insert(availableItems, { name = item.name, price = item.price, count = itemAmount })
            end
        end

        if #availableItems > 0 then
            -- Randomly pick an item from available items
            local chosenItem = availableItems[math.random(#availableItems)]
            print("Chosen item:", chosenItem.name)

            -- Determine remove amount
            local removeAmount = GetLaunderAmount()
            if removeAmount > chosenItem.count then
                removeAmount = chosenItem.count
            end
            print("Removing amount:", removeAmount)

            -- Calculate earnings
            local moneyEarned = removeAmount * chosenItem.price
            print("Money earned:", moneyEarned)

            -- Remove items and add money
            local removed = exports.ox_inventory:RemoveItem(src, chosenItem.name, removeAmount)
            print("Items removed:", removed)
            Player.Functions.AddMoney('cash', moneyEarned, 'oxy-launder')

            -- Notify player
            TriggerClientEvent('ox_lib:notify', src, {
                description = string.format("Laundered %d %s for $%.2f", removeAmount, chosenItem.name, moneyEarned),
                type = "success",
                duration = 2500
            })
        else
            print("No items to launder")
        end

        -- Rare loot logic
        local rareLoot = math.random(100)
        print("Rare loot roll:", rareLoot)
        if rareLoot <= Config.RareLoot then
            local added = exports.ox_inventory:AddItem(src, Config.RareLootItem, 1)
            print("Rare loot added:", added)
        end
    else
        print("Player not found")
    end
end)




QBCore.Functions.CreateCallback('qb-oxyruns:server:StartOxy', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player.PlayerData.money.cash >= Config.StartOxyPayment then
        local amount = GetCopCount()
        if amount >= Config.MinCops then
            Player.Functions.RemoveMoney('cash', Config.StartOxyPayment, "oxy start")
            cb(true)
        else
            TriggerClientEvent('QBCore:Notify', src, "I don\'t recommend doing this right now..", "error",  2500)
            cb(false)
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "You don't have enough money, get lost.", "error",  3500)
        cb(false)
    end
end)
