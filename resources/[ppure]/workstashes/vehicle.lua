-- exports.ox_target:addGlobalVehicle({
--     name = 'trey',
--     label = 'Open Tray',
--     {
--         canInteract = function(entity)
--             local model = GetEntityModel(entity)
--             return model == `TACO2` and GetVehicleLivery(entity) == 0
--         end,
--         groups = 'taco',
--         onSelect = function(data)
--             exports.ox_inventory:openInventory('stash', { id = 'taco_hut' })
--         end,
--         label = "Taco Hut Food",
--     },
--     {
--         canInteract = function(entity)
--             local model = GetEntityModel(entity)
--             return model == `TACO2` and GetVehicleLivery(entity) == 2
--         end,
--         groups = 'blackwoods',
--         onSelect = function(data)
--             exports.ox_inventory:openInventory('stash', { id = 'blackwoods_food' })
--         end,
--         label = "Blackwoods Food",
--     },
--     {
--         canInteract = function(entity)
--             local model = GetEntityModel(entity)
--             return model == `TACO2` and GetVehicleLivery(entity) == 3
--         end,
--         groups = 'soochi',
--         onSelect = function(data)
--             exports.ox_inventory:openInventory('stash', { id = 'soochies_food' })
--         end,
--         label = "Soochis Food",
--     },
--     {
--         canInteract = function(entity)
--             local model = GetEntityModel(entity)
--             return model == `TACO2` and GetVehicleLivery(entity) == 4
--         end,
--         groups = 'enchanted',
--         onSelect = function(data)
--             exports.ox_inventory:openInventory('stash', { id = 'enchanted_shop' })
--         end,
--         label = "Enchanted Shop",
--     },
--     {
--         canInteract = function(entity)
--             return GetEntityModel(entity) == `TACO3`
--         end,
--         groups = 'police',
--         onSelect = function(data)
--             exports.ox_inventory:openInventory('stash', { id = 'just_chilling' })
--         end,
--         label = "Just Chilling",
--     },
-- })
RegisterCommand('teststash', function()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local closestVehicle, distance = GetClosestVehicle(playerCoords, 5.0)

    print('Player coords:', playerCoords) -- Debugging

    if closestVehicle then
        local vehicleCoords = GetEntityCoords(closestVehicle)
        local vehicleModel = GetEntityModel(closestVehicle)

        print('Closest vehicle model:', vehicleModel)
        print('Distance to vehicle:', distance)
        print('Vehicle coords:', vehicleCoords) -- Debugging

        if distance <= 2.0 and vehicleModel == `TACO3` then
            print('Conditions met: Opening stash.')
            exports.ox_inventory:openInventory('stash', { id = 'just_chilling' })
        else
            print('Conditions not met. Vehicle not TACO3 or too far.')
        end
    else
        print('No vehicle detected within range.')
    end
end, false)

-- Utility function to find the closest vehicle
function GetClosestVehicle(coords, radius)
    local vehicles = GetGamePool('CVehicle')
    local closestVehicle = nil
    local closestDistance = radius

    for _, vehicle in ipairs(vehicles) do
        local vehicleCoords = GetEntityCoords(vehicle)
        local distance = #(coords - vehicleCoords)

        if distance < closestDistance then
            closestDistance = distance
            closestVehicle = vehicle
        end
    end

    return closestVehicle, closestDistance
end
