exports.ox_target:addGlobalVehicle({
    {
        canInteract = function(entity)
            local model = GetEntityModel(entity)
            return model == `TACO2` and GetVehicleLivery(entity) == 0
        end,
        groups = 'taco',
        onSelect = function(data)
            exports.ox_inventory:openInventory('stash', { id = 'taco_hut' })
        end,
        label = "Taco Hut Food",
    },
    {
        canInteract = function(entity)
            local model = GetEntityModel(entity)
            return model == `TACO2` and GetVehicleLivery(entity) == 2
        end,
        groups = 'blackwoods',
        onSelect = function(data)
            exports.ox_inventory:openInventory('stash', { id = 'blackwoods_food' })
        end,
        label = "Blackwoods Food",
    },
    {
        canInteract = function(entity)
            local model = GetEntityModel(entity)
            return model == `TACO2` and GetVehicleLivery(entity) == 3
        end,
        groups = 'soochi',
        onSelect = function(data)
            exports.ox_inventory:openInventory('stash', { id = 'soochies_food' })
        end,
        label = "Soochis Food",
    },
    {
        canInteract = function(entity)
            local model = GetEntityModel(entity)
            return model == `TACO2` and GetVehicleLivery(entity) == 4
        end,
        groups = 'enchanted',
        onSelect = function(data)
            exports.ox_inventory:openInventory('stash', { id = 'enchanted_shop' })
        end,
        label = "Enchanted Shop",
    },
    {
        canInteract = function(entity)
            return GetEntityModel(entity) == `TACO3`
        end,
        groups = 'justchilling',
        onSelect = function(data)
            exports.ox_inventory:openInventory('stash', { id = 'just_chilling' })
        end,
        label = "Just Chilling",
    },
})

function IsPoliceVehicle(vehicleModel)
    local policeVehicles = {
        GetHashKey('polbuff'),
        GetHashKey('nkcruiser'),
        GetHashKey('prevolter'),
        GetHashKey('bearcat'),
        GetHashKey('cara'),
        GetHashKey('nkballer7'),
        GetHashKey('nkdominator3'),
        GetHashKey('nkgauntlet4'),
        GetHashKey('nkscout'),
        GetHashKey('nktorrence'),
        GetHashKey('nkvstr'),
        GetHashKey('pbike'),
        GetHashKey('polbullet2'),
        GetHashKey('polchaser'),
        GetHashKey('polcoquette4'),
        GetHashKey('policeb1'),
        GetHashKey('policeb2'),
        GetHashKey('polvigero2'),
        GetHashKey('r1200rtp'),
        GetHashKey('fibsultan'),
        GetHashKey('apoliceu13'),
        GetHashKey('apoliceu10'),
        GetHashKey('apoliceu15'),
        GetHashKey('apoliceu9'),
        GetHashKey('as350'),
        GetHashKey('predator'),
    }

    for _, model in ipairs(policeVehicles) do
        if vehicleModel == model then
            return true
        end
    end

    return false
end

CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped, false) then
            local vehicle = GetVehiclePedIsIn(ped, false)
            local vehicleModel = GetEntityModel(vehicle)
            local vehiclePlate = GetVehicleNumberPlateText(vehicle)

            if exports.qbx_core:HasGroup("police") and IsPoliceVehicle(vehicleModel) then
                TriggerServerEvent('createPDRackStash', vehiclePlate)
            end
            Wait(5000)
        end
    end
end)

local function OpenPDStash()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false) 

    if vehicle and DoesEntityExist(vehicle) then
        local vehicleModel = GetEntityModel(vehicle)
        local vehiclePlate = GetVehicleNumberPlateText(vehicle)

        if IsPoliceVehicle(vehicleModel) then
            local stashId = ('PD RACK_%s'):format(vehiclePlate)
            TriggerEvent('ox_inventory:openInventory', 'stash', stashId)
        else
            exports.qbx_core:Notify('This is not a police vehicle.', 'error', 5000)
        end
    else
        exports.qbx_core:Notify('You are not in a vehicle.', 'error', 5000)
    end
end

local function UpdateRadialMenu()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)

    if vehicle and DoesEntityExist(vehicle) then
        local vehicleModel = GetEntityModel(vehicle)

        if IsPoliceVehicle(vehicleModel) then
            lib.addRadialItem({
                id = 'pd_rack',
                icon = 'box-open',
                label = 'Open PD Rack',
                onSelect = function()
                    OpenPDStash()
                end,
                keepOpen = false,
            })
            return
        end
    end
    lib.removeRadialItem('pd_rack')
end

CreateThread(function()
    local wasInVehicle = false

    while true do
        Wait(500)
        local ped = PlayerPedId()
        local isInVehicle = IsPedInAnyVehicle(ped, false)

        if isInVehicle and not wasInVehicle then
            UpdateRadialMenu()
        elseif not isInVehicle and wasInVehicle then
            UpdateRadialMenu()
        end

        wasInVehicle = isInVehicle
    end
end)


