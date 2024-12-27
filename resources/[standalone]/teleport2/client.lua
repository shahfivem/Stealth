DoScreenFadeIn(500)

local entryPoint = vector3(980.22, 2666.19, 40.03) -- Example coordinates
local exitPoint = vector3(-1922.32, 3749.76, -99.65) -- Example coordinates

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
            TriggerServerEvent('tp:checkItem2', 'entry')
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
            TriggerServerEvent('tp:checkItem2', 'exit')
            lib.hideTextUI()
        end
    end
})


RegisterNetEvent('tp:teleport2')
AddEventHandler('tp:teleport2', function(location)
    local coords = location == 'entry' and exitPoint or entryPoint
    DoScreenFadeOut(500)
    Wait(500)
    SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, false, false, false, true)
    DoScreenFadeIn(500)
end)

RegisterNetEvent('tp:notify2')
AddEventHandler('tp:notify2', function(message, type)
    lib.notify({
        description = message,
        type = type,
    })
end)
