if Config.Framework == 'ESX' then
    ESX = exports['es_extended']:getSharedObject()
elseif Config.Framework == 'QBCORE' then
    QBCore = exports['qb-core']:GetCoreObject()
elseif Config.Framework == 'OX' then
    local file = ('imports/%s.lua'):format(IsDuplicityVersion() and 'server' or 'client')
    local import = LoadResourceFile('ox_core', file)
    local chunk = assert(load(import, ('@@ox_core/%s'):format(file)))
    chunk()
end

function GetPlayerIdentifier(src)
    if Config.Framework == 'OX' then
        local player = Ox.GetPlayer(src)
        return player.charid
    elseif Config.Framework == 'ESX' then
        local xPlayer = ESX.GetPlayerFromId(src)
        return xPlayer.identifier
    elseif Config.Framework == 'QBCORE' then
        local Player = QBCore.Functions.GetPlayer(src)
        return Player.PlayerData.citizenid
    end
end

-- https://www.highleaks.com on top!
-- https://www.highleaks.com on top!
-- https://www.highleaks.com on top!
-- https://www.highleaks.com on top!
-- https://www.highleaks.com on top!
-- https://www.highleaks.com on top!
-- https://www.highleaks.com on top!
-- https://www.highleaks.com on top!
-- https://www.highleaks.com on top!
-- https://www.highleaks.com on top!
-- https://www.highleaks.com on top!
-- https://www.highleaks.com on top!