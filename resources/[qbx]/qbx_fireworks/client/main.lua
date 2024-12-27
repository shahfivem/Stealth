local sharedConfig = require 'config.shared'

AddStateBagChangeHandler('qbx_fireworks:initiate', nil, function(bagName, _, value)
    local entity = GetEntityFromStateBagName(bagName)
    if entity == 0 then return end
    if value and NetworkGetEntityOwner(entity) == cache.playerId then
        PlaceObjectOnGroundProperly(entity)
	    FreezeEntityPosition(entity, true)
        Entity(entity).state:set('qbx_fireworks:initiate', false, true)
    end
end)

local function startFirework(asset, entityCoords)
    local time
    local coords = GetEntityCoords(cache.ped)

    time = sharedConfig.detonationTime

    lib.requestNamedPtfxAsset(asset, 5000)
    lib.requestNamedPtfxAsset('core', 5000)


    local particles = sharedConfig.fireworks[asset].particleList
    CreateThread(function()
        while time > 0 do
            Wait(1000)
            time -= 1
        end
        for _ = 1, math.random(10, 15), 1 do
            local firework = particles[math.random(1, #particles)]
            UseParticleFxAsset('core')
            StartNetworkedParticleFxNonLoopedAtCoord('sp_foundry_sparks', entityCoords.x, entityCoords.y, entityCoords.z + 1.2, 0.0, 0.0, 0.0, .5, false, false, false)
            AddExplosion(entityCoords.x, entityCoords.y, entityCoords.z, 45, 0, true, true, 0)
            Wait(750)
            UseParticleFxAsset(asset)
            StartNetworkedParticleFxNonLoopedAtCoord(firework, coords.x, coords.y, coords.z + 50.0, 0.0, 0.0, 0.0, math.random() * 0.3 + 0.5, false, false, false)
            AddExplosion(coords.x, coords.y, coords.z + 50, 61, 0, true, true, 0)
            Wait(1000)
        end
    end)
    RemoveNamedPtfxAsset(asset)
    RemoveNamedPtfxAsset('core')
end

local function startFireworkShow(asset, coords, height, fireworkEffects)
    local showTime
    
    showTime = sharedConfig.detonationTime

    lib.requestNamedPtfxAsset(asset, 5000)
    lib.requestNamedPtfxAsset('core', 5000)

    CreateThread(function()
        while showTime > 0 do
            Wait(1000)
            showTime -= 1
        end
        for i = 1, #fireworkEffects do
            UseParticleFxAsset('core')
            StartParticleFxNonLoopedAtCoord('sp_foundry_sparks', coords.x, coords.y, coords.z - .8, 0.0, 0.0, 0.0, .5, false, false, false)
            AddExplosion(coords.x, coords.y, coords.z, 45, 0, true, true, 0)
            Wait(750)
            UseParticleFxAsset(asset)
            StartParticleFxNonLoopedAtCoord(fireworkEffects[i].particle, coords.x, coords.y, coords.z + height, 0.0, 0.0, 0.0, math.random() * 0.3 + 0.5, false, false, false)
            AddExplosion(coords.x, coords.y, coords.z + height, 61, 0, true, true, 0)
            Wait(1000)
        end
    end)
    RemoveNamedPtfxAsset(asset)
    RemoveNamedPtfxAsset('core')
end

lib.callback.register('qbx_fireworks:client:useFirework', function(asset)
    if lib.progressBar({
        duration = 3000,  -- Duration of the progress in milliseconds
        label = locale('placing'),  -- Label text for the progress bar
        canCancel = true,  -- Allow canceling the progress (equivalent to `preventCancel = false`)
        showTime = false,  -- Do not show remaining time
        
        anim = {
            dict = 'anim@mp_fireworks',  -- Animation dictionary
            clip = 'place_firework_3_box',  -- Animation clip
            flag = 0  -- Animation flag
        },
    
        prop = {
            model = 'ind_prop_firework_03',  -- Prop model
            pos = {x = 0.07, y = 0.04, z = 0.08},  -- Position offset for the prop
            rot = {x = -45.0, y = 220.0, z = 0.0}  -- Rotation offset for the prop
        },
    
        disable = {
            move = true,  -- Cancel the progress if the player moves
            sprint = true  -- Prevent sprinting during the task
        }
    })
     then -- if completed
        local coords = GetOffsetFromEntityInWorldCoords(cache.ped, 0, 0.6, -2.0)
        TriggerServerEvent('qbx_fireworks:server:spawnObject', 'ind_prop_firework_03', coords)
        startFirework(asset, coords)
        return true
    else -- if canceled
        exports.qbx_core:Notify(locale('canceled'), 'error')
        return false
    end
end)

RegisterNetEvent('qbx_fiureworks:client:startShow', function(fireworkAsset, fireworkCoords, fireworkHeight, fireworkEffects)
    startFireworkShow(fireworkAsset, fireworkCoords, fireworkHeight, fireworkEffects)
end)