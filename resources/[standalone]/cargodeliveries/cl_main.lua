local vehicle, blip, currentSpot, packages = nil, nil, 1, {}
local hasPackage = false
local deliveryPeds = {}
local vehicleDestroyed = false
local vehicleOffsets = {
    [`minivan`] = {
		{ x = -0.2, y = -1.4, z = 0.0 },
		{ x = 0.2, y = -1.4, z = 0.0 },
		{ x = -0.2, y = -1.6, z = 0.0 },
		{ x = 0.2, y = -1.6, z = 0.0 },
		{ x = -0.2, y = -1.8, z = 0.0 },
		{ x = 0.2, y = -1.8, z = 0.0 },
		{ x = -0.2, y = -1.4, z = 0.15 },
		{ x = 0.2, y = -1.4, z = 0.15 },
		{ x = -0.2, y = -1.6, z = 0.15 },
		{ x = 0.2, y = -1.6, z = 0.15 },
		{ x = -0.2, y = -1.8, z = 0.15 },
		{ x = 0.2, y = -1.8, z = 0.15 },
	},
    [`speedo`] = {
		{ x = -0.2, y = -1.4, z = -0.05 },
		{ x = 0.2, y = -1.4, z = -0.05 },
		{ x = -0.2, y = -1.6, z = -0.05 },
		{ x = 0.2, y = -1.6, z = -0.05 },
		{ x = -0.2, y = -1.8, z = -0.05 },
		{ x = 0.2, y = -1.8, z = -0.05 },
		{ x = -0.2, y = -1.4, z = 0.125 },
		{ x = 0.2, y = -1.4, z = 0.125 },
		{ x = -0.2, y = -1.6, z = -0.125 },
		{ x = 0.2, y = -1.6, z = -0.125 },
		{ x = -0.2, y = -1.8, z = -0.125 },
		{ x = 0.2, y = -1.8, z = -0.125 },
	},
    [`rumpo`] = {
		{ x = -0.2, y = -1.4, z = -0.35 },
		{ x = 0.2, y = -1.4, z = -0.35 },
		{ x = -0.2, y = -1.6, z = -0.35 },
		{ x = 0.2, y = -1.6, z = -0.35 },
		{ x = -0.2, y = -1.8, z = -0.35 },
		{ x = 0.2, y = -1.8, z = -0.35 },
		{ x = -0.2, y = -1.4, z = -0.175 },
		{ x = 0.2, y = -1.4, z = -0.175 },
		{ x = -0.2, y = -1.6, z = -0.175 },
		{ x = 0.2, y = -1.6, z = -0.175 },
		{ x = -0.2, y = -1.8, z = -0.175 },
		{ x = 0.2, y = -1.8, z = -0.175 },
	},
    [`youga`] = {
		{ x = -0.2, y = -1.4, z = 0.235 },
		{ x = 0.2, y = -1.4, z = 0.235 },
		{ x = -0.2, y = -1.6, z = 0.235 },
		{ x = 0.2, y = -1.6, z = 0.235 },
		{ x = -0.2, y = -1.8, z = 0.235 },
		{ x = 0.2, y = -1.8, z = 0.235 },
		{ x = -0.2, y = -1.4, z = 0.41 },
		{ x = 0.2, y = -1.4, z = 0.41 },
		{ x = -0.2, y = -1.6, z = 0.41 },
		{ x = 0.2, y = -1.6, z = 0.41 },
		{ x = -0.2, y = -1.8, z = 0.41 },
		{ x = 0.2, y = -1.8, z = 0.41 },
	},
}
local function drawText3D(coords, text)
    local onScreen, _x, _y = World3dToScreen2d(coords.x, coords.y, coords.z)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(true)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    DrawText(_x, _y)
end

local function RemovePackage()
    if packages and packages[#packages] then
        packages[#packages]:remove()
        packages[#packages] = nil
    end
end


RegisterNetEvent("cargo:spawnVehicle")
AddEventHandler("cargo:spawnVehicle", function()
    local model = Config.VehicleModels[math.random(1, #Config.VehicleModels)]
    vehicle = lib.vehicle.create({
        model = model,
        position = vector4(706.87, -677.83, 26.40, 2.83),
    })

    if not vehicle then
        print('Unable to create vehicle')
        return
    end

    -- Spawn and attach packages to the vehicle
    local count = math.random(6, 12)
    for i = 1, count do
        packages[i] = lib.object.create({
            model = `prop_cs_package_01`,
            coords = GetEntityCoords(vehicle),
            networked = true,
            onCreated = function(box)
                SetEntityVisible(box, false, false)
                local x, y, z = vehicleOffsets[model][i].x, vehicleOffsets[model][i].y, vehicleOffsets[model][i].z
                AttachEntityToEntity(box, vehicle, 0, x, y, z, 0.0, 0.0, 0.0, false, true, true, false, 0, true)
                SetEntityVisible(box, true, true)
            end
        })
        Wait(50)
    end

    -- Add interaction to the vehicle for package pickup
    exports.ox_target:addLocalEntity(vehicle, {
        {
            label = "Get Package",
            onSelect = function()
                if hasPackage then
                    TriggerEvent("qbx_core:Notify", "You already have a package!", "error")
                    return
                end

                -- Add a package to the player
                local package = lib.object.create({
                    model = 'prop_cs_package_01',
                    coords = GetEntityCoords(cache.ped),
                    onCreated = function(box)
                        AttachEntityToEntity(box, cache.ped, GetPedBoneIndex(cache.ped, 60309), 0.025, 0.08, 0.255, -145.0, 290.0, 0.0, true, true, false, false, 2, true)

                        local animDict = "anim@heists@box_carry@"
                        lib.requestAnimDict(animDict)
                        TaskPlayAnim(cache.ped, animDict, 'idle', 8.0, -4.0, -1, 51, 0.0, false, false, false)

                        hasPackage = true
                        RemovePackage()
                    end
                })
            end
        }
    })
end)


local function spawnDeliveryPed(coords)
    local pedModel = `a_m_m_business_01`
    RequestModel(pedModel)
    while not HasModelLoaded(pedModel) do Wait(10) end

    local ped = CreatePed(4, pedModel, coords.x, coords.y, coords.z, 0.0, false, true)
    SetEntityAsMissionEntity(ped, true, true)
    FreezeEntityPosition(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)

    deliveryPeds[currentSpot] = ped

    -- Add target for delivery
    exports.ox_target:addLocalEntity(ped, {
        {
            label = "Deliver Package",
            icon = "fas fa-box",
            action = function()
                TriggerEvent("cargo:deliverPackage")
            end
        }
    })
end

local function spawnVan()
    local model = Config.VehicleModels[math.random(1, #Config.VehicleModels)]
    vehicle = lib.vehicle.create({
        model = model,
        position = Config.VehicleSpawn,
    })

    if not vehicle then
        TriggerEvent("qbx_core:Notify", "Failed to spawn delivery vehicle.", "error")
        return
    end

    -- Attach packages to the vehicle
    local count = math.random(6, 12)
    for i = 1, count do
        packages[i] = lib.object.create({
            model = `prop_cs_package_01`,
            coords = GetEntityCoords(vehicle),
            networked = true,
            onCreated = function(box)
                local offset = vehicleOffsets[model][i]
                if offset then
                    AttachEntityToEntity(box, vehicle, 0, offset.x, offset.y, offset.z, 0.0, 0.0, 0.0, false, true, true, false, 0, true)
                end
            end
        })
    end

    -- Add interaction to the van for picking up packages
    exports.ox_target:addLocalEntity(vehicle, {
        {
            label = "Pick up package",
            onSelect = function()
                TriggerEvent("cargo:pickupPackage")
            end
        }
    })
end


RegisterNetEvent("cargo:startMission")
AddEventHandler("cargo:startMission", function()
    spawnVan()
    currentSpot = 1
    spawnDeliveryPed(Config.DeliverySpots[currentSpot])
    TriggerEvent("cargo:nextDelivery")
end)

RegisterNetEvent("cargo:nextDelivery")
AddEventHandler("cargo:nextDelivery", function()
    if currentSpot > #Config.DeliverySpots then
        TriggerEvent("cargo:finishMission")
        return
    end

    if blip then RemoveBlip(blip) end
    blip = AddBlipForCoord(Config.DeliverySpots[currentSpot])
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 2)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Delivery Point")
    EndTextCommandSetBlipName(blip)
end)

RegisterNetEvent("cargo:pickupPackage")
AddEventHandler("cargo:pickupPackage", function()
    local prop = CreateObject(`prop_cs_package_01`, GetEntityCoords(PlayerPedId()), true, true, false)
    AttachEntityToEntity(prop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.1, 0.0, -0.15, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
    hasPackage = true
    packages[#packages + 1] = prop
end)

RegisterNetEvent("cargo:deliverPackage")
AddEventHandler("cargo:deliverPackage", function()
    if hasPackage then
        DeleteEntity(packages[#packages])
        packages[#packages] = nil
        hasPackage = false
        currentSpot = currentSpot + 1
        TriggerEvent("cargo:nextDelivery")
    else
        TriggerEvent("qbx_core:Notify", "You don't have a package to deliver!", "error")
    end
end)

RegisterNetEvent("cargo:finishMission")
AddEventHandler("cargo:finishMission", function()
    TriggerServerEvent("cargo:completeMission")
    if DoesEntityExist(vehicle) then
        DeleteVehicle(vehicle)
    end
    TriggerEvent("qbx_core:Notify", "Mission completed successfully!", "success")
end)

RegisterNetEvent("cargo:failMission")
AddEventHandler("cargo:failMission", function(reason)
    if DoesEntityExist(vehicle) then
        DeleteVehicle(vehicle)
    end
    TriggerEvent("qbx_core:Notify", reason, "error")
end)
