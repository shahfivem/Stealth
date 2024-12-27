RegisterNetEvent("cargo:completeMission")
AddEventHandler("cargo:completeMission", function()
    local source = source
    local payout = math.random(Config.Payout.min, Config.Payout.max)
    exports.ox_inventory:AddItem(source, 'money', payout)
    TriggerClientEvent("qbx_core:Notify", source, "You've been paid $" .. payout, "success")
end)

RegisterCommand("startcargo", function(source)
    TriggerClientEvent("cargo:startMission", source)
end)
