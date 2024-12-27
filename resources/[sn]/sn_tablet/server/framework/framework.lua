QBCore = Config.framework == 'qb' and exports['qb-core']:GetCoreObject()
ESX = Config.framework == 'esx' and exports['es_extended']:getSharedObject()
isQbx = GetResourceState('qbx_core') ~= 'started'
coreJobs = QBCore and QBCore.Shared.Jobs or ESX and ESX.Jobs or {}
 
function getIdentifier(source)
    if QBCore then
        local Player = QBCore.Functions.GetPlayer(source)
        if not Player then return end
        return Player.PlayerData.citizenid
    elseif ESX then
        local Player = ESX.GetPlayerFromId(source)
        if not Player then return end
        return Player.identifier
    end
end

function getSource(identifier)
    if QBCore then
        local Player = QBCore.Functions.GetPlayerByCitizenId(identifier)
        if Player then 
            return Player.PlayerData.source 
        end
    elseif ESX then
        local Player = ESX.GetPlayerFromIdentifier(identifier)
        if Player then 
            return Player.source
        end
    end
    return nil 
end

function getPlayerData(identifier)
    if QBCore then
        local online = false
        local Player = QBCore.Functions.GetPlayerByCitizenId(identifier)
        if Player then
            online = true
        else
            Player = QBCore.Player.GetOfflinePlayer(identifier)
        end
        if Player then
            return {
                online = online,
                identifier = identifier,
                name = Player.PlayerData.charinfo.firstname..' '..Player.PlayerData.charinfo.lastname,
                jobName = Player.PlayerData.job.name,
                isBoss = Player.PlayerData.job.isboss
            }
        end
    elseif ESX then
        local Player = ESX.GetPlayerFromIdentifier(identifier)
        if Player then
            local job = Player.getJob()
            return {
                online = true,
                identifier = identifier,
                name = Player.PlayerData.charinfo.firstname..' '..Player.PlayerData.charinfo.lastname,
                jobName = job.label,
                isBoss = job.name == 'boss' or job.name == 'owner'
            }
        else
            MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {['@identifier'] = identifier}, function(Player)
				if Player and Player[1] then
                    local jobData = coreJobs[Player[1].job]
					return {
                        online = false,
                        identifier = identifier,
                        name = Player[1].name,
                        jobName = jobData.label,
                        isBoss = jobData.grades[tostring(Player[1].job_grade)].label == 'boss' or jobData.grades[tostring(Player[1].job_grade)].label == 'owner'
                    }
				end
			end)
        end
    end
    return nil
end

function addMetaData(source, metadata, amount)
    if QBCore then
        local Player = QBCore.Functions.GetPlayer(source)
        local oldValue = Player.Functions.GetMetaData(metadata)
        local newValue = oldValue + amount
        if newValue > 100 then newValue = 100 end
        Player.Functions.SetMetaData(metadata, newValue)
        if metadata == 'hunger' then
            TriggerClientEvent('hud:client:UpdateNeeds', source, newValue, Player.PlayerData.metadata.thirst)
        else
            TriggerClientEvent('hud:client:UpdateNeeds', source, Player.PlayerData.metadata.hunger, newValue)
        end
    end
    --- ESX IS CLIENT SIDED
end

function setJob(source, job, grade)
    if isQbx then grade = tonumber(grade) end
    if QBCore then
        local Player = QBCore.Functions.GetPlayer(source)
        if Player then
            Player.Functions.SetJob(job, grade)
        end
    elseif ESX then
        local Player = ESX.GetPlayerFromId(source)
        if Player then
            Player.setJob(job, grade)
        end
    end
end

function setOfflineJob(identifier, job, grade)
    if isQbx then grade = tonumber(grade) end
    if QBCore then
        local Player = QBCore.Functions.GetPlayerByCitizenId(identifier)
        if Player then
            Player.setJob(job, grade)
            Player.Functions.Save()
        end
    elseif ESX then
        MySQL.update.await('UPDATE users SET job = ?, job_grade = ? WHERE identifier = ?', { job, grade, identifier })
    end
end

function getMoney(source, account)
    if QBCore then
        local Player = QBCore.Functions.GetPlayer(source)
        return Player.PlayerData.money[account]
    elseif ESX then
        local Player = ESX.GetPlayerFromId(source)
        return Player.getAccount(account=='cash' and 'money' or account).money
    end
end

function addMoney(identifier, account, amount, reason)
    if QBCore then
        local offline = false
        local Player = QBCore.Functions.GetPlayerByCitizenId(identifier)
        if not Player then
            Player = QBCore.Player.GetOfflinePlayer(identifier)
            offline = true
        end
        if Player then
            Player.Functions.AddMoney(account, amount, reason)
            if offline then Player.Functions.Save() end
        end
    elseif ESX then
        local Player = ESX.GetPlayerFromIdentifier(identifier)
        if Player then
            Player.addAccountMoney(account=='cash' and 'money' or account, amount)
        else
            local result = MySQL.query.await('SELECT * FROM users WHERE identifier = ?', {identifier})
            if result and result[1] then
                local savedAccounts = json.decode(result[1].accounts)
                savedAccounts.bank = savedAccounts.bank + amount
                MySQL.update.await('UPDATE users SET accounts = ? WHERE identifier = ?',{ json.encode(savedAccounts), identifier })
            end
        end
    end
end

function removeMoney(source, amount, account, reason)
    if QBCore then
        local Player = QBCore.Functions.GetPlayer(source)
        Player.Functions.RemoveMoney(account, amount, reason)
    elseif ESX then
        local Player = ESX.GetPlayerFromId(source)
        Player.removeAccountMoney(account=='cash' and 'money' or account, amount)
    end
end

function logout(source)
    if QBCore then
        local Player = QBCore.Functions.GetPlayer(source)
        if not Player then return end
        MySQL.update('UPDATE players SET inventory = ? WHERE citizenid = ?',{json.encode(Player.PlayerData.items), Player.PlayerData.citizenid }) -- native qb-inventory
        QBCore.Player.Logout(source)
        TriggerClientEvent('qb-multicharacter:client:chooseChar', source)
    elseif ESX then
        TriggerEvent('esx:playerLogout', source)
    end
end

function checkVehicleOwnership(source, plate)
    local identifier = getIdentifier(source)
    if not identifier then return false end
    if QBCore then
        local owner = MySQL.scalar.await('SELECT citizenid FROM player_vehicles WHERE plate = ? LIMIT 1', { plate })
        return owner == identifier
    elseif ESX then
        local owner = MySQL.scalar.await('SELECT owner FROM owned_vehicles WHERE plate = ? LIMIT 1', { plate })
        return owner == identifier
    end
end

exports('getCoreJobs', function() return coreJobs end)
exports('getPlayerData', getPlayerData)
exports('addMetaData', addMetaData)
exports('getIdentifier', getIdentifier)
exports('getSource', getSource)
exports('setJob', setJob)
exports('setOfflineJob', setOfflineJob)
exports('getMoney', getMoney)
exports('addMoney', addMoney)
exports('removeMoney', removeMoney)
exports('logout', logout)
exports('checkVehicleOwnership', checkVehicleOwnership)