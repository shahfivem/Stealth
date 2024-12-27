local acik, RLCore, PlayerData, cender = false, nil, nil, nil
local QBCore = exports['qb-core']:GetCoreObject()
PlayerData = QBCore.Functions.GetPlayerData() 

RegisterNetEvent("QBCore:Client:OnJobUpdate")
AddEventHandler("QBCore:Client:OnJobUpdate", function (meslk)
    PlayerData.job = meslk
end)

local year --[[ integer ]], month --[[ integer ]], day --[[ integer ]], hour --[[ integer ]], minute --[[ integer ]], second --[[ integer ]] = GetLocalTime()

RegisterNetEvent("bodycam:time")
AddEventHandler("bodycam:time", function (h,m,s)
    SendNUIMessage({
        action = "zamanguncelle",
        zaman = day.."/"..month.."/"..year.." ".." - "..h..":"..m..":"..s.." GMT+3",
    })
end)

RegisterNetEvent("mbl-body:openBoy")
AddEventHandler("mbl-body:openBoy", function (item, h,m,s)
    if PlayerData.job.name == "police" then
        if item.info.cinsiyet == "0" then
            cender = "Mr."
        else
            cender = "Mrs."
        end
        if acik then
            acik = false
            SendNUIMessage({
                action = "hidebodycam"
            })
            TriggerServerEvent("booleanuodate", false)

        else
            SendNUIMessage({
                action = "showbodycam",
                player = item.info.grade.. " "..cender.." "..item.info.firstname,
                callsign = "["..item.info.callsign.."]",
                tarih = day.."/"..month.."/"..year.." ".." - "..h..":"..m..":"..s.." GMT+3",
            })
            TriggerServerEvent("booleanuodate", true)
            acik = true
        end
    end
end)