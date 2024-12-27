if Config.garage ~= 'ak47_garage' then return end
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
            TriggerEvent('ak47_garage:housing:storevehicle', property.label, 'car')
        else
            TriggerEvent('ak47_garage:housing:takevehicle', property.label, 'car')
        end
    end
end