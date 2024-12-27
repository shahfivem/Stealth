local blacklistedVehTypes = {
    [8] = true,
    [13] = true,
    [14] = true,
    [15] = true,
    [16] = true,
    [21] = true
}

local function copAlert()
    if math.random(1, 100) >= 60 then
        local closestNpc = exports['ps-dispatch']:GetClosestNPC({
            pos = GetEntityCoords(cache.ped),
            minDist = 15.0,
            maxDist = 50.0
        })

        if DoesEntityExist(closestNpc) then
            exports['ps-dispatch']:Alert({
                code = '10-15',
                desc = 'Suspicious Vehicle Activity',
                priority = 2,
                wait = math.random(1500, 2000),
                blip = {
                    alpha = 250,
                    sprite = 487,
                    text = '10-15 Suspicious Activity',
                    color = 4,
                    scale = 1.2,
                    sound = { "Lose_1st", "GTAO_FM_Events_Soundset" },
                    highDetail = false,
                    shortRange = true,
                    time = 120
                }
            })
        end
    end

    if math.random(1, 100) > 50 then TriggerEvent("updatestress", 300) end
    if math.random(1, 100) >= 75 then TriggerEvent('evidence:client:SetStatus', 'unique_id', 'Agitated') end
    if math.random(1, 100) >= 50 and not qbx.isWearingGloves() then
        TriggerEvent('evidence:client:SetStatus', 'ee', 'Has Scratches On Hands')
    end
end

local function AttemptCut(entity)
    local canCut = true
    if not canCut then return lib.notify('Not now.') end

    exports.ox_target:disableTargeting(true)
    local playerPed = cache.ped

    SetEntityHeading(playerPed, GetEntityHeading(playerPed) + 180.0)

    local dict = 'amb@world_human_vehicle_mechanic@male@base'
    local anim = 'base'

    lib.requestAnimDict(dict)

    TaskPlayAnim(playerPed, dict, anim, 8.0, 1.0, -1, 1, 0, false, false, false)

    local checking = exports["erp_progressbar"]:taskBar({
        length = math.random(14000, 16000),
        text = "Checking"
    })

    if checking == 100 then
        copAlert()
        Wait(500)
        if Entity(entity).state.alreadyCut then
            lib.notify("Seems to have no catalytic converter", 5000, "error")
            ClearPedTasks(playerPed)
            exports.ox_target:disableTargeting(false)
            return
        end

        local skillcheck = exports["erp_skillcheck"]:taskBar(math.random(2000, 3000), math.random(9, 12))

        if skillcheck == 100 then
            local cutting = exports["erp_progressbar"]:taskBar({
                length = math.random(19000, 21000),
                text = "Cutting",
                keepweapon = false,
                vehicle = false,
                distcheck = 1.0,
            })
            if cutting == 100 then
                Wait(1000)
                TriggerServerEvent("echo_converters:server:cutConverter", NetworkGetNetworkIdFromEntity(entity))
                ClearPedTasks(playerPed)
            else
                lib.notify("You stopped cutting.", 5000, "error")
                ClearPedTasks(playerPed)
            end
        else
            lib.notify("Failed.", 5000, "error")
            ClearPedTasks(playerPed)
        end
    else
        lib.notify("You stopped checking the vehicle.", 5000, "error")
        ClearPedTasks(playerPed)
    end

    exports.ox_target:disableTargeting(false)
end

local function CheckForCat(entity)
    exports.ox_target:disableTargeting(true)
    local playerPed = cache.ped

    SetEntityHeading(playerPed, GetEntityHeading(playerPed) + 180.0)

    local dict = 'amb@world_human_vehicle_mechanic@male@base'
    local anim = 'base'

    lib.requestAnimDict(dict)

    TaskPlayAnim(playerPed, dict, anim, 8.0, 1.0, -1, 1, 0, false, false, false)

    local checking = exports["erp_progressbar"]:taskBar({
        length = math.random(5000, 10000),
        text = "Checking"
    })

    if checking == 100 then
        Wait(500)
        local cut = Entity(entity).state.alreadyCut
        lib.notify(cut and "Seems to have no catalytic converter" or "The catalytic converter is still there", 5000,
            cut and "error" or "inform")
        ClearPedTasks(playerPed)
        exports.ox_target:disableTargeting(false)

        -- Trigger client update for vehicle state if converter is cut
        if cut then
            TriggerClientEvent('echo_converters:client:updateVehicleState', -1, NetworkGetNetworkIdFromEntity(entity), true)
        end

        return
    else
        lib.notify("You stopped checking the vehicle.", 5000, "error")
        ClearPedTasks(playerPed)
    end

    exports.ox_target:disableTargeting(false)
end

local function addVehicleTarget()
    exports.ox_target:addGlobalVehicle({
        {
            label = "Cut Catalytic Converter",
            distance = 1.0,
            onSelect = function(data)
                AttemptCut(data.entity)
            end,
            canInteract = function(entity)
                if blacklistedVehTypes[GetVehicleClass(entity)] or not NetworkGetEntityIsNetworked(entity) or GetEntityPopulationType(entity) == 7 or Entity(entity).state.alreadyCut then
                    return false
                end
                return true
            end,
            items = 'chop_torch'
        },
        {
            label = "Check for Catalytic Converter",
            distance = 1.0,
            onSelect = function(data)
                CheckForCat(data.entity)
            end,
            canInteract = function(entity)
                if blacklistedVehTypes[GetVehicleClass(entity)] or not NetworkGetEntityIsNetworked(entity) or GetEntityPopulationType(entity) == 7 then
                    return false
                end
                return true
            end,
        },
    })
end

CreateThread(addVehicleTarget)

lib.addStateHandler('converterLost', function(ent, _, value)
    if not value then return end
    if NetworkGetEntityOwner(ent) ~= cache.playerId then return end

    local particle = lib.particle.create({
        dict = 'scr_family1',
        name = 'scr_fam1_veh_smoke',
        looped = true,
        networked = true,
        entity = ent,
        scale = 1.0,
        bone = 'overheat'
    })

    if not particle then return end

    SetParticleFxLoopedEvolution(particle.handle, 'damage', 1.0, false)
    SetVehicleAudioEngineDamageFactor(ent, 0.75)
    Citizen.InvokeNative(0x1C073274E065C6D2, ent, true)

    Entity(ent).state:set('converterLost', nil, true)
end)

-- Update vehicle state on the client side when the catalytic converter is cut
RegisterNetEvent('echo_converters:client:updateVehicleState')
AddEventHandler('echo_converters:client:updateVehicleState', function(entityId, isAlreadyCut)
    local entity = NetworkGetEntityFromNetworkId(entityId)
    if entity then
        if isAlreadyCut then
            exports.ox_target:updateGlobalVehicle({
                {
                    label = "Cut Catalytic Converter",
                    distance = 1.0,
                    canInteract = function(entity)
                        return false  -- Disable the interaction if the converter is already cut
                    end
                }
            })
        end
    end
end)
