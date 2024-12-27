if Config.garage ~= 'okokGarage' then return end
function onGarageEnter(property)
    if IsPedInAnyVehicle(PlayerPedId(), true) then
        lib.showTextUI('[E] Park vehicle in the garage')
    else 
        lib.showTextUI('[E] Open garage')
    end
end

function onGarageExit(property)
    lib.hideTextUI()
end

function insideGarage(property)
    if IsControlJustReleased(0, 38) then
        Wait(100)
        if IsPedInAnyVehicle(PlayerPedId(), true) then
            TriggerEvent('okokGarage:StoreVehiclePrivate')
        else
            TriggerEvent('okokGarage:OpenPrivateGarageMenu', vec3(property.garage_zone.x, property.garage_zone.y, property.garage_zone.z), property.garage_zone.w)
        end
    end
end