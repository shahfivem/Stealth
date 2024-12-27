lib.versionCheck('Qbox-project/npwd_qbx_garages')
assert(GetResourceState('qbx_garages') == 'started', 'qbx_garages is not started')

local VEHICLES = exports.qbx_core:GetVehiclesByName()

lib.callback.register('npwd_qbx_garages:server:getPlayerVehicles', function(source)
    local player = exports.qbx_core:GetPlayer(source)
    if not player then return {} end

    local result = MySQL.query.await('SELECT * FROM player_vehicles WHERE citizenid = ?', { player.PlayerData.citizenid })
    for i = 1, #result do
        local vehicleData = result[i]
        local model = vehicleData.vehicle

        vehicleData.model = model
        vehicleData.vehicle = 'Unknown'
        vehicleData.brand = 'Vehicle'

        if vehicleData.state == 0 then
            vehicleData.state = 'out'
        elseif vehicleData.state == 1 then
            vehicleData.state = 'garaged'
        elseif vehicleData.state == 2 then
            vehicleData.state = 'impounded'
        else
            vehicleData.state = 'unknown'
        end

        if VEHICLES[model] then
            vehicleData.vehicle = VEHICLES[model].name
            vehicleData.brand = VEHICLES[model].brand
        end

        -- Use the garage column from the player_vehicles table instead of pulling from garageConfig
        local garageName = vehicleData.garage or 'Unknown Garage'  -- Default to 'Unknown Garage' if the garage column is nil
        vehicleData.garage = garageName
    end

    return result
end)
