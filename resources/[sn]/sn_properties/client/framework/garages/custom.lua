if Config.garage ~= 'custom' then return end
--[[ property:
    label: string,  -- Unique ID
    garage_zone: {x: number, y: number, z:number, w: number}, --Garage coords
]]

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
            -- Trigger park event here
        else
            -- Trigger open garage event here
        end
    end
end