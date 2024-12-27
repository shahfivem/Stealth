local QBCore = exports[Config.Core]:GetCoreObject()

local hasFakePlate = false

-- Net Events

RegisterNetEvent('brazzers-fakeplates:client:usePlate', function(plate)
    if not plate then return end
    local ped = PlayerPedId()
    local pedCoords = GetEntityCoords(ped)
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local vehicleCoords = GetEntityCoords(vehicle)
    local dist = #(vehicleCoords - pedCoords)
    local hasKeys = false
    
    if dist <= 5.0 then
        local currentPlate = QBCore.Functions.GetPlate(vehicle)
        -- Has Keys Check
        if exports['cd_garage']:DoesPlayerHaveKeys(currentPlate) then
            hasKeys = true
        end
        TaskTurnPedToFaceEntity(ped, vehicle, 3.0)
        local success = exports.erp_progressbar:taskBar({
            text = "Attaching Plate", 
            length = 4000,
            animation = {
                dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 
                anim = 'machinic_loop_mechandplayer', 
                flags = 1, 
                stuck = true
            }
        })
        
        if success == 100 then
            -- Trigger your server event after the task bar is completed
            TriggerServerEvent('brazzers-fakeplates:server:usePlate', VehToNet(vehicle), currentPlate, plate, hasKeys)
            ClearPedTasks(ped)
        else
            -- Handle the case when the task is canceled
            ClearPedTasks(ped)
        end        
    end
end)

RegisterNetEvent('brazzers-fakeplates:client:removePlate', function()
    local ped = PlayerPedId()
    local pedCoords = GetEntityCoords(ped)
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local vehicleCoords = GetEntityCoords(vehicle)
    local dist = #(vehicleCoords - pedCoords)
    local hasKeys = false
    
    if dist <= 5.0 then
        local currentPlate = QBCore.Functions.GetPlate(vehicle)
        -- Has Keys Check
        if exports['cd_garage']:DoesPlayerHaveKeys(currentPlate) then
            hasKeys = true
        end
        TaskTurnPedToFaceEntity(ped, vehicle, 3.0)
        local success = exports.erp_progressbar:taskBar({
            text = "Removing Plate", 
            length = 4000,
            animation = {
                dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 
                anim = 'machinic_loop_mechandplayer', 
                flags = 1, 
                stuck = true
            }
        })
        
        if success == 100 then
            -- Trigger your server event after the task bar is completed
            TriggerServerEvent('brazzers-fakeplates:server:removePlate', VehToNet(vehicle), currentPlate, hasKeys)
            ClearPedTasks(ped)
        else
            -- Handle the case when the task is canceled
            ClearPedTasks(ped)
        end
        
    end
end)

-- Threads

CreateThread(function()
    while true do
        Wait(1000)
        local inRange = false
        local pos = GetEntityCoords(PlayerPedId())
        local vehicle = QBCore.Functions.GetClosestVehicle()
        local vehCoords = GetEntityCoords(vehicle)
        local closestPlate = QBCore.Functions.GetPlate(vehicle)

        if exports['cd_garage']:DoesPlayerHaveKeys(closestPlate) then -- Has Keys
            if not IsPedInAnyVehicle(PlayerPedId()) then -- Not in vehicle
                if #(pos - vector3(vehCoords.xyz)) < 7.0 then -- dist check
                    inRange = true
                    QBCore.Functions.TriggerCallback('brazzers-fakeplates:server:checkPlateStatus', function(result)
                        if result then
                            hasFakePlate = true
                        else
                            hasFakePlate = false
                        end
                    end, closestPlate)
                end
                if not inRange then
                    Wait(3000)
                end
            end
        end
    end
end)


local function AddGlobalVehicleTargets(data)
    exports['ox_target']:addGlobalVehicle(data.options)
end

CreateThread(function()
    while not LocalPlayer.state.isLoggedIn do Wait(1000) end

    AddGlobalVehicleTargets({
    options = {
        type = 'client',
            event = 'brazzers-fakeplates:client:removePlate',
            icon = 'fa-solid fa-car-side',
            label = 'Remove Plate',
            distance = 1.5,
            entity = entity,            
            canInteract = function(entity)
                return not hasFakelate -- Assuming 'hasFakePlate' tracks if the vehicle has a fake plate
            end
        }
    })
end)

CreateThread(function()
exports.ox_target:addGlobalVehicle({
    {
        name = 'use_plate',
        icon = 'fa-solid fa-car-side',
        label = 'Use Plate',
        distance = 1.5,
        bones = {'boot'},
        event = 'brazzers-fakeplates:client:removePlate',
            type = 'client',
            canInteract = function(entity)
                return hasFakePlate -- Assuming 'hasFakePlate' tracks if the vehicle has a fake plate
            end   
        }
    }) 
end)

CreateThread(function()
    exports.ox_target:addGlobalVehicle({
        {
            name = 'remove_plate',
            icon = 'fa-solid fa-car-side',
            label = 'Remove Plate',
            distance = 1.5,
            bones = {'boot'},
            event = 'brazzers-fakeplates:client:removePlate',
            type = 'client',
            canInteract = function(entity)
                return hasFakePlate -- Assuming 'hasFakePlate' tracks if the vehicle has a fake plate
            end    
        }
    })
end)
