local entryPoint = vector3(2533.7, 3892.53, 40.23) -- Example coordinates
local exitPoint = vector3(896.37, -3245.85, -98.24) -- Example coordinates

lib.zones.box({
    coords = entryPoint,
    rotation = 0.0, -- Adjust as needed
    size = vec3(4.7, 1.7, 3.75),
    debug = false,
    onEnter = function()
        lib.showTextUI('Press [E] to enter the bunker')
    end,
    onExit = function()
        lib.hideTextUI()
    end,
    inside = function()
        if IsControlJustReleased(0, 38) then -- 38 is key 'E'
            TriggerServerEvent('tp:checkItem', 'entry')
        end
    end
})

lib.zones.box({
    coords = exitPoint,
    rotation = 0.0, -- Adjust as needed
    size = vec3(4.7, 1.7, 3.75),
    debug = false,
    onEnter = function()
        lib.showTextUI('Press [E] to leave the bunker')
    end,
    onExit = function()
        lib.hideTextUI()
    end,
    inside = function()
        if IsControlJustReleased(0, 38) then
            TriggerServerEvent('tp:checkItem', 'exit')
            lib.hideTextUI()
        end
    end
})

RegisterNetEvent('tp:teleport')
AddEventHandler('tp:teleport', function(location)
    local coords = location == 'entry' and exitPoint or entryPoint
    SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, false, false, false, true)
end)

RegisterNetEvent('tp:notify')
AddEventHandler('tp:notify', function(message, type)
    lib.notify({
        description = message,
        type = type,
    })
end)
