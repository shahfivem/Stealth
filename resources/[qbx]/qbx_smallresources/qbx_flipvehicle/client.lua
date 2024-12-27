local config = lib.loadJson('qbx_flipvehicle.config')

---@param vehicle number? id of the vehicle, default closes vehicle
---@param flipTest boolean? costom fliping task
local function flipVehicle(vehicle, flipTest)
    if cache.vehicle then return end
    if not vehicle then vehicle = lib.getClosestVehicle(GetEntityCoords(cache.ped), config.maxDistance, false) end
    if not vehicle then return exports.qbx_core:Notify(locale('error.no_vehicle_nearby'), 'error') end
    local peedCoords = GetEntityCoords(cache.ped)
    local vehicleCoords = GetEntityCoords(vehicle)

    if #(peedCoords - vehicleCoords) > config.maxDistance then
        return exports.qbx_core:Notify(locale('error.no_vehicle_nearby'), 'error')
    end

    if flipTest or exports.erp_progressbar:taskBar({
            length = config.flipingTime,  -- Duration in milliseconds
            text = locale('progress.flipping_car'),  -- Display text
            canCancel = true,  -- Allows canceling (equivalent to `preventCancel = false`)
            showTime = false,  -- Show remaining time (equivalent to `showTime = true`)
        }) == 100
     then
        SetVehicleOnGroundProperly(vehicle)
        exports.qbx_core:Notify(locale('success.flipped_car'), 'success')
    else
        exports.qbx_core:Notify(locale('error.canceled'), 'error')
    end
end

---@deprecated use FlipVehicle instead
exports('flipVehicle', flipVehicle)

exports('FlipVehicle', flipVehicle)
