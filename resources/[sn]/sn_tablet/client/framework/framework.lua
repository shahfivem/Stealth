QBCore = Config.framework == 'qb' and exports['qb-core']:GetCoreObject()
ESX = Config.framework == 'esx' and exports['es_extended']:getSharedObject()
playerData = {}

function getPlayerData()
    local data = {}
    if QBCore then
        local PlayerData = QBCore.Functions.GetPlayerData()
        data = {
            identifier = PlayerData.citizenid,
            job = {
                name = PlayerData.job.name,
                rank = tonumber(PlayerData.job.grade.level)
            }
        }
    elseif ESX then
        local playerData = ESX.GetPlayerData()
        if not playerData then return print('Error getting player data') end
        local jobData = playerData.job
        data = {
            identifier = playerData.identifier,
            job = {
                name = jobData.name,
                rank = tonumber(jobData.grade)
            }
        }
    end
    playerData = data
    return data
end

function getMoney(account)
    if QBCore then
        return QBCore.Functions.GetPlayerData().money[account]
    elseif ESX then
        return ESX.PlayerData.accounts[account=='cash' and 'money' or account]
    end
end

function addMetadata(metadata, amount)
    if ESX then
        TriggerEvent("esx_status:add", metadata, amount * 10000)
    else
        TriggerServerEvent('sn_tablet:server:addMetaData', metadata, amount)
    end
end


---@param data {id?:string, title:string, description?:string, type:string, duration?:number}
function notify(data)
    lib.notify(data)
    --QBCore.Functions.Notify(data.title, data.type, data.duration)
    --ESX.ShowNotification(data.title, data.type, data.duration)
end

exports('getPlayerData', getPlayerData)
exports('getMoney', getMoney)
exports('addMetadata', addMetadata)
exports('notify', notify)

RegisterNetEvent('sn_tablet:client:notify', notify)