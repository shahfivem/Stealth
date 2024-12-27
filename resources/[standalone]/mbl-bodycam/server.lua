RLCore = nil
local acik = false

local QBCore = exports['qb-core']:GetCoreObject()



RegisterNetEvent("booleanuodate")
AddEventHandler("booleanuodate", function (bool)
    acik = bool
end)

QBCore.Functions.CreateUseableItem("bodycam" , function(source, item)
    local _src = source
    TriggerClientEvent("mbl-body:openBoy", _src, item, tonumber(os.date("%H")), tonumber(os.date("%M")), tonumber(os.date("%S")))
end)

CreateThread(function ()
    while acik do
        Citizen.Wait(1000)
        local src = source
        TriggerClientEvent("bodycam:time", src, tonumber(os.date("%H")), tonumber(os.date("%M")), tonumber(os.date("%S")))
    end
end)