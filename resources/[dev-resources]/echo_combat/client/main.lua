local _print = print

local gunGroups = {
    [416676503] = true,
    [-957766203] = true,
    [860033945] = true,
    [970310034] = true,
    [1159398588] = true,
    [3082541095] = true,
    [2725924767] = true,
}

plyPed = cache.ped
plyId = cache.playerId
plyWep = cache.weapon
plyVeh = { id = cache.vehicle }

isWeaponGun = false
wasInVehicle = false

lib.onCache('ped', function(value) plyPed = value end)

lib.onCache('weapon', function(value)
    plyWep = value
    isWeaponGun = value and gunGroups[GetWeapontypeGroup(value)] or false
end)

lib.onCache('vehicle', function(value)
    if not value then
        plyVeh = { id = value, class = 0, model = 0 }
        return
    end

    plyVeh = { id = value, class = GetVehicleClass(value), model = GetEntityModel(value) }
    wasInVehicle = true
end)

function print(...)
    if GetConvarInt('sv_developer', 0) == 0 then return end
    _print('^2Debug Log:^4', ...)
end

if plyVeh.id then
    plyVeh.model = GetEntityModel(plyVeh.id)
    plyVeh.class = GetVehicleClass(plyVeh.id)
    wasInVehicle = true
end
