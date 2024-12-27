local playerData = {}

-- Get Player Data
local function getPlayerData()
    local success, result = pcall(function()
        return QBCore.Functions.GetPlayerData()
    end)
    return success and result or {}
end

playerData = getPlayerData()

-- Player Spawned Event
RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    playerData = getPlayerData()
end)

-- Update Player Info Event
RegisterNetEvent("qb:updateinfo", function(key, value)
    if not key or value == nil then return end
    playerData[key] = value
end)


function PlayerInGang(filter)
    local _type = type(filter)
    local playerGang = playerData.gang and playerData.gang.name

    if _type == 'string' then
        return playerGang == filter
    elseif _type == 'table' then
        for _, gang in ipairs(filter) do
            if playerGang == gang then
                return true
            end
        end
    end
    return false
end

function PlayerHasGroups(filter)
    local _type = type(filter)

    if _type == 'string' then
        if playerData.job.name == filter or playerData.citizenid == filter or (playerData.sidejob and playerData.sidejob.name == filter) then
            return true
        end
    elseif _type == 'table' then
        for name, grade in pairs(filter) do
            local jobMatch = playerData.job.name == name and playerData.job.grade.level >= grade
            local sideJobMatch = playerData.sidejob and playerData.sidejob.name == name
            local citizenIdMatch = playerData.citizenid == name

            if jobMatch or sideJobMatch or citizenIdMatch then
                return true
            end
        end
    end
    return false
end

function PlayerIsCop()
    return playerData.job and playerData.job.name == "police"
end

function PlayerIsDown()
    return LocalPlayer.state.isDead or LocalPlayer.state.isKnockedOut
end
