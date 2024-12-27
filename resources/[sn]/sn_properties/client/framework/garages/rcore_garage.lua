if Config.garage ~= 'rcore_garage' then return end
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
            TriggerEvent('rcore_garage:StoreMyVehicle', 'car')
        else
            TriggerEvent('rcore_garage:OpenGarageOnSpot', 'car', 'civ')
        end
    end
end