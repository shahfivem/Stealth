QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('ant-teleport:client:Teleport', function(coords)
    DoScreenFadeOut(500)
    Wait(1000)
    SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, false, false, false, false)
    DoScreenFadeIn(500)
end)

for k, v in pairs(Config.Missions) do
    if v['teleport'] then
        exports['qb-target']:AddBoxZone("TeleportZone"..k, v['teleport'].from, 1, 1, {
            name = "TeleportZone"..k,
            heading = v['teleport'].heading,
            minZ = v['teleport'].from.z - 1,
            maxZ = v['teleport'].from.z + 1,
            debugpoly = false,
        }, {
            options = {
                {
                    type = "client",
                    action = function()
                        TriggerEvent("ant-teleport:client:Teleport", v['teleport'].to)
                    end,
                    label = v['teleport'].label,
                },
            },
            distance = 2.5,
        })
    end
end