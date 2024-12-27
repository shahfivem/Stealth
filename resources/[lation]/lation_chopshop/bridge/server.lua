local ox_inv = GetResourceState('ox_inventory') == 'started'

-- Get framework
if GetResourceState('es_extended') == 'started' then
    ESX = exports['es_extended']:getSharedObject()
    Framework = 'esx'
elseif GetResourceState('qb-core') == 'started' then
    QBCore = exports['qb-core']:GetCoreObject()
    Framework = 'qb'
else
    -- Add support for a custom framework here
    return
end

-- Get player from source
--- @param source number
GetPlayer = function(source)
    if not source then return end
    if Framework == 'esx' then
        return ESX.GetPlayerFromId(source)
    elseif Framework == 'qb' then
        return QBCore.Functions.GetPlayer(source)
    else
        -- Add support for a custom framework here
    end
end

-- Get a players identifier
--- @param source number
GetIdentifier = function(source)
    local player = GetPlayer(source)
    if not player then return end
    if Framework == 'esx' then
        return player.getIdentifier()
    elseif Framework == 'qb' then
        return player.PlayerData.citizenid
    else
        -- Add support for custom framework here
    end
end

-- Get a players name
--- @param source number
GetName = function(source)
    local player = GetPlayer(source)
    if not player then return 'Unknown' end
    if Framework == 'esx' then
        return player.getName()
    elseif Framework == 'qb' then
        return player.PlayerData.charinfo.firstname..' '..player.PlayerData.charinfo.lastname
    end
end

-- Return total count of an item
--- @param source number
--- @param item string
ItemCount = function(source, item)
    local player = GetPlayer(source)
    if not player then return 0 end
    if ox_inv then
        local count = exports.ox_inventory:Search(source, 'count', item)
        return count
    end
    if Framework == 'esx' then
        local itemData = player.getInventoryItem(item)
        if not itemData then return 0 end
        local count = itemData.count or itemData.amount
        return count
    elseif Framework == 'qb' then
        local itemData = player.Functions.GetItemByName(item)
        if not itemData then return 0 end
        local count = itemData.amount or itemData.count
        return count
    else
        -- Add support for a custom framework here
    end
end

-- Add an item to inventory
--- @param source number
--- @param item string
--- @param count number
--- @param slot any
--- @param metadata any
AddItem = function(source, item, count, slot, metadata)
    if count <= 0 then return end
    local player = GetPlayer(source)
    if not player then return end
    if ox_inv then
        exports.ox_inventory:AddItem(source, item, count, metadata, slot)
        return
    end
    if Framework == 'esx' then
        player.addInventoryItem(item, count, metadata, slot)
    elseif Framework == 'qb' then
        if item == 'cash' or item == 'money' then
            AddMoney(source, item, count)
            return
        end
        if item == 'markedbills' then
            if Config.Metadata then
                local hasBag = player.Functions.GetItemByName('markedbills')
                if hasBag then
                    local bagCount = hasBag.amount or hasBag.count
                    local worth = 0
                    if bagCount and bagCount > 0 then
                        if hasBag.info.worth and hasBag.info.worth > 0 then
                            worth = hasBag.info.worth
                        end
                    end
                    if worth > 0 then
                        player.Functions.RemoveItem('markedbills', 1)
                        local newValue = {worth = math.floor(worth + count)}
                        player.Functions.AddItem('markedbills', 1, false, newValue)
                        return
                    end
                end
                local info = {worth = count}
                player.Functions.AddItem(item, 1, false, info)
                return
            end
        end
        player.Functions.AddItem(item, count, slot, metadata)
        TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add')
    else
        -- Add support for a custom framework here
    end
end

-- Remove an item from inventory
--- @param source number
--- @param item string
--- @param count number
--- @param slot any
--- @param metadata any
RemoveItem = function(source, item, count, slot, metadata)
    local player = GetPlayer(source)
    if not player then return end
    if ox_inv then
        exports.ox_inventory:RemoveItem(source, item, count, metadata, slot)
        return
    end
    if Framework == 'esx' then
        player.removeInventoryItem(item, count, metadata, slot)
    elseif Framework == 'qb' then
        player.Functions.RemoveItem(item, count, slot, metadata)
        TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items[item], "remove")
    else
        -- Add support for a custom framework here
    end
end

-- Convert moneyType to match framework
--- @param moneyType string
ConvertMoneyType = function(moneyType)
    if moneyType == 'money' and Framework == 'qb' then
        moneyType = 'cash'
    elseif moneyType == 'cash' and Framework == 'esx' then
        moneyType = 'money'
    else
        -- Add support for a custom framework here
    end
    return moneyType
end

-- Add money to a players account
--- @param source number
--- @param moneyType string
--- @param amount number
AddMoney = function(source, moneyType, amount)
    local player = GetPlayer(source)
    if not player then return end
    moneyType = ConvertMoneyType(moneyType)
    if Framework == 'esx' then
        player.addAccountMoney(moneyType, amount)
    elseif Framework == 'qb' then
        if moneyType == 'markedbills' and Config.Metadata then
            local info = {worth = amount}
            player.Functions.AddItem(moneyType, 1, false, info)
            return
        elseif moneyType == 'markedbills' and not Config.Metadata then
            player.Functions.AddItem(moneyType, amount)
            return
        end
        player.Functions.AddMoney(moneyType, amount)
    else
        -- Add support for a custom framework here
    end
end

-- Remove money from a players account
--- @param source number
--- @param moneyType string
--- @param amount number
RemoveMoney = function(source, moneyType, amount)
    local player = GetPlayer(source)
    if not player then return end
    moneyType = ConvertMoneyType(moneyType)
    if Framework == 'esx' then
        player.removeAccountMoney(moneyType, amount)
    elseif Framework == 'qb' then
        player.Functions.RemoveMoney(moneyType, amount)
    else
        -- Add support for a custom framework here
    end
end

-- Get players account balance
--- @param source number
--- @param moneyType string
GetPlayerAccountFunds = function(source, moneyType)
    local player = GetPlayer(source)
    if not player then return 0 end
    moneyType = ConvertMoneyType(moneyType)
    if Framework == 'qb' then
        return player.PlayerData.money[moneyType]
    elseif Framework == 'esx' then
        return player.getAccount(moneyType).money
    else
        -- Add support for a custom framework here
    end
end

-- Register a usable item
--- @param item string
--- @param ... any
RegisterUsableItem = function(item, ...)
    if Framework == 'esx' then
        ESX.RegisterUsableItem(item, ...)
    elseif Framework == 'qb' then
        QBCore.Functions.CreateUseableItem(item, ...)
    else
        -- Add support for a custom framework here
    end
end