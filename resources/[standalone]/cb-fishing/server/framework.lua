WebhookTitle = 'Cool Brad Scripts'
Webhook = '' -- Please put your webhook link inbetween the quotes

function FishingLog(data)
  PerformHttpRequest(Webhook, function() end, 'POST',
      json.encode({ username = WebhookTitle, content = data }), { ['Content-Type'] = 'application/json' })
end

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
    Target = "qb"
elseif GetResourceState('ox_target') == 'started' then
    Target = "ox"
end

function StartupPrint()
    print('+================+===================+')
    print('|            cb-fishing              |')
    print('+================+===================+')
    print(string.format('| Framework      | %s ', Framework))
    print(string.format('| Ox Inventory   | %s ', UsingOxInventory))
    print(string.format('| Target         | %s ', Target))
    print('+================+===================+')
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

function SetFishingRep(source, amount)
    local Player = GetPlayer(source)
    if Player == nil then return end
    if Framework == "qb-core" then
        Player.Functions.SetMetaData("fishing", amount)
    elseif UsingOxInventory then
        Player.Functions.SetMetaData("fishing", amount)
    end
end

function GetFishingRep(source)
    local Player = GetPlayer(source)
    if Player == nil then return 0 end
    local fishingrep = 0
    if Framework == "qb-core" then
        fishingrep = Player.PlayerData.metadata["fishing"]
        if fishingrep == nil then
            SetFishingRep(source, 0)
            fishingrep = 0
        end
        return fishingrep
    else
        fishingrep = Player.PlayerData.metadata["fishing"]
        if fishingrep == nil then
            SetFishingRep(source, 0)
            fishingrep = 0
        end
        return fishingrep
    end
    return 0
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
            local itemCount = exports.ox_inventory:GetItemCount(source, item)
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

function GetItemCount(source, item)
    local Player = GetPlayer(source)
    if Player == nil then return nil end
    if not UsingOxInventory and Framework == "qb-core" then
        return Player.Functions.GetItemByName(item).amount
    elseif UsingOxInventory then
        return exports.ox_inventory:GetItemCount(source, item)
    end
    return nil
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
        return true
    elseif UsingOxInventory then
        local Player = GetPlayer(source)
        exports.ox_inventory:RemoveItem(source, item, amount)
        return true
    end
    return false
end

---@param source number       -- The player's unique identifier (server ID)
---@param item string         -- The name of the item to add
---@param amount number       -- The quantity of the item to add
---@return boolean            -- Returns true if the item was added successfully
function AddItem(source, item, amount)
    if not UsingOxInventory then
        local Player = GetPlayer(source)
        if Player == nil then return false end
        Player.Functions.AddItem(item, amount)
        if Config.UseItemBox then
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

function SavePlayerData()
    if Framework == "qb-core" then
        TriggerEvent('QBCore:Player:SetPlayerData')
    elseif Framework == "qbox" then
        TriggerEvent('QBCore:Player:SetPlayerData')
    end
end

function AddMoney(source, type, amount, reason)
    local Player = GetPlayer(source)
    if Player == nil then return end
    if Framework == "qb-core" then
        Player.Functions.AddMoney(type, amount, reason)
    elseif Framework == "qbox" then
        Player.Functions.AddMoney(type, amount, reason)
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