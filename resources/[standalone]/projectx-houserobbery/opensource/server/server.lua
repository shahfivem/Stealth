Webhook = "" -- Add your webhook here
NPCCoords = nil

if Config.Framework == "qb-core" or Config.Framework == "qbox" then
    local QBCore = exports[Config.Core.resource]:GetCoreObject()

    function AddItem(source, item, amount, info)
        if Config.Inventory == "ox" then
            if info == nil then
                exports.ox_inventory:AddItem(source, item, amount)
            else
                exports.ox_inventory:AddItem(source, item, amount, info)
            end
        elseif Config.Inventory == "qs" then
            if info == nil then
                exports['qs-inventory']:AddItem(source, item, amount)
            else
                exports['qs-inventory']:AddItem(source, item, amount, nil, info)
            end
        elseif Config.Inventory == "origen" then
            if info == nil then
                exports.origen_inventory:AddItem(source, item, amount)
            else
                exports.origen_inventory:AddItem(source, item, amount, nil, nil, info)
            end
        elseif Config.Inventory == "codem" then
            if info == nil then
                exports['codem-inventory']:AddItem(source, item, amount)
            else
                exports['codem-inventory']:AddItem(source, item, amount, nil, info)
            end
        else
            if info == nil then
                QBCore.Functions.GetPlayer(source).Functions.AddItem(item, amount)
            else
                QBCore.Functions.GetPlayer(source).Functions.AddItem(item, amount, false, info)
            end
        end
    end

    function RemoveItem(source, item, amount)
        if Config.Inventory == "ox" then
            exports.ox_inventory:RemoveItem(source, item, amount)
        elseif Config.Inventory == "qs" then
            exports['qs-inventory']:RemoveItem(source, item, amount)
        elseif Config.Inventory == "origen" then
            exports.origen_inventory:RemoveItem(source, item, amount)
        elseif Config.Inventory == "codem" then
            exports['codem-inventory']:RemoveItem(source, item, amount)
        else
            QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item, amount)
        end
    end

    function ItemBox(source, item, addRemove, amount)
        if Config.Inventory ~= "ox" then
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], addRemove, amount)
        end
    end

    function NotificationServer(source, notification, notificationType, duration)
        if Config.Notification == "ox" then
            TriggerClientEvent('ox_lib:notify', source, {description = notification, type = notificationType, duration = duration, position = 'center-right'})
        else
            TriggerClientEvent('QBCore:Notify', source, notification, notificationType, duration)
        end
    end

    lib.callback.register("projectx-houserobbery:getOnlinePoliceCountQB", function(source)
        if Config.MinimumPolice == 0 then return true end
        local CurrentCops = 0
        local players = QBCore.Functions.GetPlayers()
        for i = 1, #players do
            local Player = QBCore.Functions.GetPlayer(players[i])
            if Player then
                if Config.PoliceJobs[Player.PlayerData.job.name] and Player.PlayerData.job.onduty then
                    CurrentCops = CurrentCops + 1
                    if CurrentCops >= Config.MinimumPolice then
                        return true
                    end
                end
            end
        end
        return false
    end)

    function DiscordLogItem(source, item, amount, location, gainedfrom, info)
        if Config.DiscordLogStatus then
            local player = QBCore.Functions.GetPlayer(source)
            local discord = QBCore.Functions.GetIdentifier(source, 'discord') or 'N/A'
            if discord ~= 'N/A' then discord = discord:gsub("discord:", "") end
            if not info then
                DiscordLog("House Robbery - Item Gained.","**- Info:\n> Name: " ..player.PlayerData.charinfo.firstname.. " " ..player.PlayerData.charinfo.lastname.. "\n> ID: " ..player.PlayerData.cid.. "\n> Citizen ID: " ..player.PlayerData.citizenid.. "\n> Item Gained: x" ..amount.. " " ..item.. "\n> Gained From: " ..gainedfrom.. "\n> Location: " ..location.. "\n\n- Identifiers: \n> Discord: " ..discord.. " (<@" ..discord.. ">)\n> License: " ..player.PlayerData.license.. "**")
            else
                DiscordLog("House Robbery - Item Gained.","**- Info:\n> Name: " ..player.PlayerData.charinfo.firstname.. " " ..player.PlayerData.charinfo.lastname.. "\n> ID: " ..player.PlayerData.cid.. "\n> Citizen ID: " ..player.PlayerData.citizenid.. "\n> Item Gained: x" ..amount.. " " ..item.. " ($" ..info.. ")\n> Gained From: " ..gainedfrom.. "\n> Location: " ..location.. "\n\n- Identifiers: \n> Discord: " ..discord.. " (<@" ..discord.. ">)\n> License: " ..player.PlayerData.license.. "**") 
            end
        end
    end

    lib.callback.register('projectx-houserobbery:CheckPerms', function(source)
        return QBCore.Functions.HasPermission(source, 'god') or QBCore.Functions.HasPermission(source, 'admin')
    end)
elseif Config.Framework == "esx" then
    CreateThread(function()
        while ESX == nil do Wait(1000) end
    end)
    
    function AddItem(source, item, amount, info)
        if Config.Inventory == "ox" then
            if info == nil then
                exports.ox_inventory:AddItem(source, item, amount)
            else
                exports.ox_inventory:AddItem(source, item, amount, info)
            end
        elseif Config.Inventory == "qs" then
            if info == nil then
                exports['qs-inventory']:AddItem(source, item, amount, nil, info)
            else
                exports['qs-inventory']:AddItem(source, item, amount)
            end
        elseif Config.Inventory == "origen" then
            if info == nil then
                exports.origen_inventory:AddItem(source, item, amount)
            else
                exports.origen_inventory:AddItem(source, item, amount, nil, nil, info)
            end
        elseif Config.Inventory == "codem" then
            if info == nil then
                exports['codem-inventory']:AddItem(source, item, amount)
            else
                exports['codem-inventory']:AddItem(source, item, amount, nil, info)
            end
        else
            ESX.GetPlayerFromId(source).addInventoryItem(item, amount)
        end
    end

    function RemoveItem(source, item, amount)
        if Config.Inventory == "ox" then
            exports.ox_inventory:RemoveItem(source, item, amount)
        elseif Config.Inventory == "qs" then
            exports['qs-inventory']:RemoveItem(source, item, amount)
        elseif Config.Inventory == "origen" then
            exports.origen_inventory:RemoveItem(source, item, amount)
        elseif Config.Inventory == "codem" then
            exports['codem-inventory']:RemoveItem(source, item, amount)
        else
            ESX.GetPlayerFromId(source).removeInventoryItem(item, amount)
        end
    end

    function ItemBox(source, item, addRemove, amount)

    end

    function NotificationServer(source, notification, notificationType, duration)
        if Config.Notification == "ox" then
            TriggerClientEvent('ox_lib:notify', source, {description = notification, type = notificationType, duration = duration, position = 'center-right'})
        else
            TriggerClientEvent('esx:showNotification', source, notification, notificationType, duration)
        end
    end

    lib.callback.register('projectx-houserobbery:server:hasitem', function(source, item)
        if Config.Inventory == "ox" then
            return exports.ox_inventory:GetItemCount(source, item) >= 1
        elseif Config.Inventory == "qs" then
            return exports['qs-inventory']:GetItemTotalAmount(source, item) >= 1
        elseif Config.Inventory == "codem" then
            return exports['codem-inventory']:HasItem(source, item, 1)
        elseif Config.Inventory == "origen" then
            return exports.origen_inventory:HasItem(source, item, 1)
        else
            return ESX.GetPlayerFromId(source).hasItem(item).count >= 1
        end
    end)

    lib.callback.register("projectx-houserobbery:getOnlinePoliceCount", function()
        if Config.ESX == "old" then
            local Players = ESX.GetPlayers()
            local policeOnline = 0
            for i = 1, #Players do
                local xPlayer = ESX.GetPlayerFromId(Players[i])
                if Config.PoliceJobs[xPlayer.job.name] then
                    policeOnline = policeOnline + 1
                end
            end
            return (policeOnline >= Config.MinimumPolice)
        else
            local policeOnline = 0
            local xPlayers = ESX.GetExtendedPlayers()
            for _, xPlayer in ipairs(xPlayers) do
                if Config.PoliceJobs[xPlayer.job.name] then
                    policeOnline = policeOnline + 1
                end
            end
            return (policeOnline >= Config.MinimumPolice)
        end
    end)

    RegisterServerEvent('projectx-houserobbery:server:PdNotify', function()
        local Criminal = ESX.GetPlayerFromId(source)
        local Players = ESX.GetPlayers()
        for i = 1, #Players do
            local xPlayer = ESX.GetPlayerFromId(Players[i])
            if Config.PoliceJobs[xPlayer.job.name] then
                if Config.Notification == "ox" then
                    TriggerClientEvent('ox_lib:notify', xPlayer.source, {description = 'Someone is robbing a house, check your map for the location', type = 'info', duration = 5000, position = 'center-right'})
                else
                    TriggerClientEvent('esx:showNotification', xPlayer.source, 'Someone is robbing a house, check your map for the location')
                end
            end
        end
        local coords = Criminal.getCoords(true)
        TriggerClientEvent('projectx-houserobbery:client:PdNotify', coords)
    end)

    function DiscordLogItem(source, item, amount, location, gainedfrom, info)
        if Config.DiscordLogStatus then
            local xPlayer = ESX.GetPlayerFromId(source)
            local discord = GetPlayerIdentifierByType(source, 'discord') or 'N/A'
            local license = GetPlayerIdentifierByType(source, 'license')
            if discord ~= 'N/A' then discord = discord:gsub("discord:", "") end
            if not info then
                DiscordLog("House Robbery - Item Gained.","**- Info:\n> Name: " ..xPlayer.getName().. "\n> ID: " ..source.. "\n> Item Gained: x" ..amount.. " " ..item.. "\n> Gained From: " ..gainedfrom.. "\n> Location: " ..location.. "\n\n- Identifiers: \n> Discord: " ..discord.. " (<@" ..discord.. ">)\n> License: " ..license.. "**")
            else
                DiscordLog("House Robbery - Item Gained.","**- Info:\n> Name: " ..xPlayer.getName().. "\n> ID: " ..source.. "\n> Item Gained: x" ..amount.. " " ..item.. " ($" ..info.. ")\n> Gained From: " ..gainedfrom.. "\n> Location: " ..location.. "\n\n- Identifiers: \n> Discord: " ..discord.. " (<@" ..discord.. ">)\n> License: " ..license.. "**")
            end
        end
    end

    lib.callback.register('projectx-houserobbery:CheckPerms', function(source)
        return IsPlayerAceAllowed(source, "group.admin") or IsPlayerAceAllowed(source, "group.god")
    end)
else

end

----- Group work functions -----
function GroupgetGroupByMembers(source)
    return exports[Config.Core.abbrev..'-phone']:GetGroupByMembers(source)
end

function GroupgetGroupMembers(group)
    if not group then return end
    return exports[Config.Core.abbrev..'-phone']:getGroupMembers(group)
end

function GroupgetJobStatus(group)
    if not group then return end
    return exports[Config.Core.abbrev..'-phone']:getJobStatus(group)
end

function GroupgetGroupSize(group)
    if not group then return end
    return exports[Config.Core.abbrev..'-phone']:getGroupSize(group)
end

function GroupisGroupLeader(source, group)
    if not group then return end
    return exports[Config.Core.abbrev..'-phone']:isGroupLeader(source, group)
end

function GroupCreateBlipForGroupIPL(house, group)
    if not group then return end
    exports[Config.Core.abbrev..'-phone']:CreateBlipForGroup(group, "targethouse", {
        label = Loc[Config.Lan].group["blip_name"],
        coords = Config.IPL[house].DoorCoords,
        sprite = 364,
        color = 59,
        scale = 1.0,
    })
end

function GroupCreateBlipForGroupShell(house, group)
    if not group then return end
    exports[Config.Core.abbrev..'-phone']:CreateBlipForGroup(group, "targethouse", {
        label = Loc[Config.Lan].group["blip_name"],
        coords = Config.Shells[house].coords,
        sprite = 364,
        color = 59,
        scale = 1.0,
    })
end

function GroupNotifyGroup(group, message, successFail)
    if not group then return end
    exports[Config.Core.abbrev..'-phone']:NotifyGroup(group, message, successFail)
end

function GroupRemoveBlipForGroup(group)
    if not group then return end
    exports[Config.Core.abbrev..'-phone']:RemoveBlipForGroup(group, "targethouse")
end

function GroupresetJobStatus(group)
    if not group then return end
    exports[Config.Core.abbrev..'-phone']:resetJobStatus(group)
end

function GroupsetJobStatus(group, status, stage)
    if not group then return end
    exports[Config.Core.abbrev..'-phone']:setJobStatus(group, status, stage)
end

function AddExperience(source, exp)
    if not Config.ClientSideEvents then
        exports["pickle_xp"]:AddPlayerXP(source, 'criminal', exp)
    else
        TriggerClientEvent("projectx-houserobbery:client:AddExperience", source, exp)
    end
end

function CheckExpLevel(source)
    if not Config.ClientSideEvents then
        local level = exports["pickle_xp"]:GetPlayerLevel(source, 'criminal')
        return level
    else
        local level = lib.callback.await("projectx-houserobbery:client:CheckExpLevel", source, false)
        return level
    end
end

CreateThread(function() NPCCoords =  Config.NPC["Coords"][math.random(1, #Config.NPC["Coords"])] end)