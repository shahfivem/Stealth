AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    Wait(2000)
    TriggerEvent('sn_tablet:client:playerLoaded')
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    playerData.job = {
        name = JobInfo.name,
        rank = JobInfo.grade.level
    }
    TriggerEvent('sn_tablet:client:jobChanged', playerData.job)
end)

RegisterNetEvent('esx:playerLoaded', function(playerData)
    Wait(2000)
    TriggerEvent('sn_tablet:client:playerLoaded')
end)

RegisterNetEvent('esx:setJob', function(jobData)  
    playerData.job = {
        name = jobData.name,
        rank = jobData.grade
    }
    TriggerEvent('sn_tablet:client:jobChanged', playerData.job)
end)