if GetResourceState('qbx_core') == 'started' then
    Framework = "qbox"
elseif GetResourceState('qb-core') == 'started' then
    Framework = "qb-core"
    QBCore = exports['qb-core']:GetCoreObject()
end
if GetResourceState('ox_inventory') == 'started' then
    UsingOxInventory = true
else
    UsingOxInventory = false
end
if GetResourceState('qb-target') == 'started' then
    Target = "ox"
elseif GetResourceState('ox_target') == 'started' then
    Target = "ox"
end

function StartupPrint()
    print('+================+===================+')
    print('|          cb-gangsystem            |')
    print('+================+===================+')
    print(string.format('| Framework      | %s ', Framework))
    print(string.format('| Ox Inventory   | %s ', UsingOxInventory))
    print(string.format('| Target         | %s ', Target))
    print('+================+===================+')
end

local DiscordWebhook = {
    url = Config.WebhookURL,
    name = Config.WebhookName,
}
local DrugSaleWebhookURL = Config.SellDrugsWebhookURL

function SQLQuery(query, params)
    if params then
        return MySQL.query.await(query, params)
    else
        return MySQL.query.await(query)
    end
end

---@param target number        -- The target player's unique identifier (server ID)
---@return table|nil           -- Returns the player object as a table if found, or nil if the player is not found or the framework is unrecognized
function GetPlayer(target)
    if Framework == "qb-core" then
        return QBCore.Functions.GetPlayer(target)
    elseif Framework == "qbox" then
        return exports.qbx_core:GetPlayer(target)
    end
    return nil
end

function GetPlayerByCitizenID(citizenid)
    if Framework == "qb-core" then
        return QBCore.Functions.GetPlayerByCitizenId(citizenid)
    elseif Framework == "qbox" then
        return exports.qbx_core:GetPlayerByCitizenId(citizenid)
    end
    return nil
end

function GetOfflinePlayer(citizenid)
    if Framework == "qb-core" then
        return QBCore.Functions.GetOfflinePlayer(citizenid)
    elseif Framework == "qbox" then
        return exports.qbx_core:GetOfflinePlayer(citizenid)
    end
    return nil
end

function GetPlayerCoords(target)
    local playerPed = GetPlayerPed(target)
    return GetEntityCoords(playerPed)
end

---@param name string
---@return {citizenid: string, grade: integer}[]
function FetchPlayersInGang(name)
    return SQLQuery("SELECT citizenid, grade FROM player_groups WHERE `group` = ? AND `type` = 'gang'", {name})
end

---@return number[]           -- Returns an array of player server IDs, or an empty array if no players are found
function GetPlayers()
    if Framework == "qb-core" then
        return QBCore.Functions.GetPlayers()
    elseif Framework == "qbox" then
        local sources = {}
        local players = exports.qbx_core:GetQBPlayers()
        for k in pairs(players) do
            sources[#sources+1] = k
        end
        return sources
    end
    return {}
end

---@param source number       -- The player's unique identifier (server ID)
---@param item string         -- The name of the item to check
---@param amount number       -- The quantity of the item to check for
---@return boolean            -- Returns true if the player has the item in the specified amount, false otherwise
function HasItem(source, item, amount)
    local Player = GetPlayer(source)
    if Player == nil then return false end
    if not UsingOxInventory and Framework == "qb-core" then
        return Player.Functions.HasItem(item, amount)
    elseif UsingOxInventory then
        if UsingOxInventory then
            local itemCount = exports.ox_inventory:Search(source, "count", item)
            if not itemCount then
                return false
            elseif itemCount >= amount then
                return true
            else
                return false
            end
        else
            return Player.Functions.HasItem(item, amount)
        end
    end
    return false
end

---@param source number       -- The player's unique identifier (server ID)
---@param item string         -- The name of the item to remove
---@param amount number       -- The quantity of the item to remove
function RemoveItem(source, item, amount)
    if not UsingOxInventory then
        local Player = GetPlayer(source)
        Player.Functions.RemoveItem(item, amount)
        if Config.OptionalNotifications.UseItemBox then
            TriggerClientEvent('inventory:client:ItemBox', source, item, 'remove', amount)
        end
    elseif UsingOxInventory then
        local Player = GetPlayer(source)
        exports.ox_inventory:RemoveItem(source, item, amount)
    end
end

---@param source number       -- The player's unique identifier (server ID)
---@param item string         -- The name of the item to add
---@param amount number       -- The quantity of the item to add
---@return boolean            -- Returns true if the item was added successfully
function AddItem(source, item, amount)
    if not UsingOxInventory then
        local Player = GetPlayer(source)
        Player.Functions.AddItem(item, amount)
        if Config.OptionalNotifications.UseItemBox then
            TriggerClientEvent('inventory:client:ItemBox', source, item, 'add', amount)
        end
        return true
    elseif UsingOxInventory then
        local Player = GetPlayer(source)
        local canCarryItem = exports.ox_inventory:CanCarryItem(source, item, amount)
        if canCarryItem then
            exports.ox_inventory:AddItem(source, item, amount)
            return true
        else
            return false
        end
    end
    return false
end

---@param tag string          -- The unique tag for the gang
---@param name string         -- The name of the gang
function CreateGang(tag, name)
    if Framework == "qb-core" then
        QBCore.Functions.AddGang(tag, {
            label = name,
            grades = {
                ['6'] = { name = 'President', isboss = true, },
                ['5'] = { name = 'Vice President' },
                ['4'] = { name = 'Sergeant at Arms' },
                ['3'] = { name = 'Treasurer' },
                ['2'] = { name = 'Enforcer' },
                ['1'] = { name = 'Member' },
                ['0'] = { name = 'Prospect' },
            }
        })
    elseif Framework == "qbox" then
        local gangs = {
            [tag] = {
                label = name,
                grades = {
                    [6] = { name = 'President', isboss = true },
                    [5] = { name = 'Vice President' },
                    [4] = { name = 'Sergeant at Arms' },
                    [3] = { name = 'Treasurer' },
                    [2] = { name = 'Enforcer' },
                    [1] = { name = 'Member' },
                    [0] = { name = 'Prospect' },
                }
            }
        }
        exports.qbx_core:CreateGangs(gangs)
    end
end

---@param tag string          -- The unique tag for the gang
---@param name string         -- The name of the gang
---@param grades table        -- A table defining the grades within the gang, with each grade including a name and optional 'isboss' key
function AddGang(tag, name, grades)
    local gangData = {
        label = name,
        grades = grades
    }

    if Framework == "qb-core" then
        QBCore.Functions.AddGang(tag, gangData)
    elseif Framework == "qbox" then
        exports.qbx_core:CreateGangs({[tag] = gangData})
    end
end

function GangSystemLog(data)
    PerformHttpRequest(DiscordWebhook.url, function() end, 'POST',
        json.encode({ username = DiscordWebhook.name, content = data }), { ['Content-Type'] = 'application/json' })
end

function GangSystemEmbed(data)
    PerformHttpRequest(DiscordWebhook.url, function() end, 'POST',
        json.encode({ username = DiscordWebhook.name, embeds = data }), { ['Content-Type'] = 'application/json' })
end

function DrugSaleLog(data)
    PerformHttpRequest(DrugSaleWebhookURL, function() end, 'POST',
        json.encode({ username = Config.WebhookName, content = data }), { ['Content-Type'] = 'application/json' })
end

function RemoveFromGang(Player, citizenID, gangTag)
    if Framework == "qb-core" then
        Player.Functions.SetGang(tostring('none'), 0)
    elseif Framework == "qbox" then
        exports.qbx_core:RemovePlayerFromGang(citizenID, gangTag)
    end
end

function SavePlayerData()
    if Framework == "qb-core" then
        TriggerEvent('QBCore:Player:SetPlayerData')
    elseif Framework == "qbox" then
        TriggerEvent('QBCore:Player:SetPlayerData')
    end
end

---@return number         -- Returns the number of players with Police jobs or nil if the framework is unrecognized
function PlayersWithJob()
    if Framework == "qb-core" then
        local policeCount = 0
        local players = GetPlayers()
        for i = 1, #players do
            local player = GetPlayer(players[i])
            if player then
                for _, jobName in pairs(Config.PoliceJobs) do
                    if player.PlayerData.job.name == jobName then
                        policeCount = policeCount + 1
                        break  -- No need to check other jobs if we already matched one
                    end
                end
            end
        end
        return policeCount
    elseif Framework == "qbox" then
        local totalPoliceCount = 0
        for _, jobName in pairs(Config.PoliceJobs) do
            local jobCount = exports.qbx_core:GetDutyCountJob(jobName)
            if jobCount then
                totalPoliceCount = totalPoliceCount + jobCount
            end
        end
        return totalPoliceCount
    end
    return 0
end