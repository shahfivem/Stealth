local Config = {
    CratePositions = Cargo.Config.CratePositions,
    HealthPackPositions = Cargo.Config.HealthPackZones
}
local eventCooldown = false -- Track if the event is on cooldown
local activeCrates = {}
local crateBlips = {}
local dinghyBlips = {}
local guards = {}
local activeHealthCrates = {}

function AlertPolice()
    local coords = vector3(3023.42, -4702.4, 16.76)
    if Cargo.Config.PoliceAlerts == 'ps-dispatch' then
            exports['ps-dispatch']:CustomAlert({
                code = '10-90',
                message = '10-90 Cargoship Robbery',
                coords = coords,
                priority = 1,
                    sprite = 306,
                    color = 50,
                    scale = 1.5,
                    sound = { "erp-sounds:PlayWithinDistance", 10.0, "alert_normal", 0.08 },
            })
            elseif Cargo.Config.PoliceAlerts == 'cd_dispatch' then
                TriggerServerEvent('cd_dispatch:AddNotification', {
                job_table = {'police', }, 
                coords = coords,
                title = '10-90 Container Robbery',
                message = '10-90 Container Robbery', 
                flash = 0,
                unique_id = tostring(math.random(0000000,9999999)),
                sound = 1,
                blip = {
                    sprite = 306,
                    color = 50,
                    scale = 1.5,
                    flashes = false, 
                    text = '10-90 Container Robbery',
                    time = 5,
                    radius = 0,
                }
            })
    end
end

-- Helper function to delete an entity safely
function DeleteEntitySafely(entity)
    if DoesEntityExist(entity) then
        DeleteEntity(entity)
    end
end
-- Function to spawn guards
function SpawnGuards()
    local guardModel = `s_m_y_blackops_01`
    lib.requestModel(guardModel)

    for i, spawnPoint in ipairs(Cargo.Config.GuardSpawnPoints) do
        local guard = CreatePed(4, guardModel, spawnPoint.coords.x, spawnPoint.coords.y, spawnPoint.coords.z, spawnPoint.heading, true, true)
        SetPedRelationshipGroupHash(guard, HATES_PLAYER)
        GiveWeaponToPed(guard, GetHashKey(Cargo.Config.GuardWeapon), 255, false, true)
        TaskWanderStandard(guard, 10.0, 10)
        SetEntityAsMissionEntity(guard, true, true)
        SetPedDropsWeaponsWhenDead(guard, false)
        SetPedAccuracy(guard, math.random(60, 90))
	SetPedDropsWeaponsWhenDead(guard, false)
    SetPedAsEnemy(guard, true)
	TaskCombatPed(guard, cache.ped)
	SetPedCanRagdoll(guard,false)
        guards[#guards + 1] = guard

        -- Add interaction for looting weapon
        exports.ox_target:addLocalEntity(guard, {
            {
                label = "Take Weapon",
                icon = "fa-solid fa-gun",
                canInteract = function()
                    return IsPedDeadOrDying(guard, true)
                end,
                onSelect = function()
                    local finished = exports.erp_progressbar:taskBar({
                        length = math.random(3500, 5500),
                        text = "Searching",
                        distcheck = 2.0,
                        animation = { dict = 'missexile3', anim = 'ex03_dingy_search_case_a_michael', stuck = true }
                    })
                    
                    if finished == 100 then
                        TriggerServerEvent('guards:server:LootWeapon') -- No guard passed
                        DeleteEntitySafely(guard)
                    elseif not finished then
                        lib.notify({
                            text = "Search was canceled!",
                            type = "error",
                            duration = 3000,
                        })
                    end
                end,                
            },
        })
    end
end

function CleanupGuards()
    for _, guard in ipairs(guards) do
        DeleteEntitySafely(guard)
    end
    guards = {}
end

function CleanupHealthCrates()
    for _, healthCrate in pairs(activeHealthCrates) do
        if healthCrate.entity then
            DeleteEntitySafely(healthCrate.entity)
        end
    end

    for _, blip in pairs(crateBlips) do
        RemoveBlip(blip)
    end

    activeHealthCrates = {}
end

-- Function to clean up all crates and props
function CleanupEvent()
    -- Cleanup cargo crates
    for _, crate in pairs(activeCrates) do
        if crate.entity then
            DeleteEntitySafely(crate.entity)
        end
    end

    for _, blip in pairs(crateBlips) do
        RemoveBlip(blip)
    end

    -- Cleanup dinghys
    for dinghy, blip in pairs(dinghyBlips) do
        if DoesEntityExist(dinghy) then
            DeleteEntity(dinghy)
        end
        RemoveBlip(blip)
    end

    -- Cleanup guards and health crates
    CleanupGuards()
    CleanupHealthCrates()

    activeCrates = {}
    crateBlips = {}
    dinghyBlips = {}

    lib.notify({
        text = "[Cargo Ship] Cleanup complete. Waiting for cooldown.",
        type = "inform",
        duration = 5000,
    })
    eventCooldown = true
end

function CreateHealthCrate(crateId, pos)
    local zoneSize = vec3(2.0, 2.0, 2.0) -- Size of the box zone

    -- Create a blip at the position of the box zone
    local blip = AddBlipForCoord(pos.coords.x, pos.coords.y, pos.coords.z)
    SetBlipSprite(blip, 153) -- Medical icon
    SetBlipColour(blip, 2) -- Green
    SetBlipScale(blip, 0.9)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Health Crate")
    EndTextCommandSetBlipName(blip)

    -- Store the blip reference for future cleanup (optional)
    activeHealthCrates[crateId] = { blip = blip }

    -- Add a box zone for interaction using ox_target
    exports.ox_target:addBoxZone({
        coords = pos.coords, -- Position of the crate
        size = zoneSize, -- Size of the interaction zone
        rotation = pos.coords.w, -- Heading
        debug = false, -- Set to true to visualize the zone during development
        options = {
            {
                label = "Open Crate",
                icon = "fa-solid fa-box-open",
                onSelect = function()
                    TriggerEvent('healthpacks:client:OpenCrate', crateId)
                end
            }
        }
    })

    -- Trigger server registration for the health crate
    TriggerServerEvent('healthpacks:server:RegisterHealthCrate', crateId, pos)
end


-- Function to initialize health crates
function InitializeHealthCrates()
    for i, pos in ipairs(Config.HealthPackPositions) do
        local crateId = "health_crate_" .. i
        CreateHealthCrate(crateId, pos)
    end
end

-- Register health crate events
RegisterNetEvent('healthpacks:client:OpenCrate', function(crateId)
    local stashId = "health_stash_" .. crateId
    exports.ox_inventory:openInventory('stash', stashId)
end)

RegisterNetEvent('cargoship:client:OpenCrate', function(crateId)
    local stashId = "cargo_stash_" .. crateId
    exports.ox_inventory:openInventory('stash', stashId)
end)

RegisterNetEvent('healthpacks:client:SetupLootTarget', function(crateId, pos, stashId)
    -- lib.notify({
    --     text = "[HealthPacks] Health crate ready to loot at stash: " .. stashId,
    --     duration = 5000,
    --     type = 'success'
    -- })
end)

-- Function to handle cargo crate thermite game
function StartThermiteGame(crateId, pos, crateBlip)
    local crate = activeCrates[crateId]
    if crate.hacked then
        lib.notify({ text = "[CargoShip] Crate already hacked.", duration = 5000, type = 'inform' })
        return
    end

    exports["memorygame"]:thermiteminigame(10, 3, 3, 20, function()
        crate.hacked = true
        lib.notify({ text = "[CargoShip] Crate hacked successfully! Unlocking in 1 minute...", duration = 5000, type = 'success' })

        if crateBlips[crateId] then
            RemoveBlip(crateBlips[crateId])
            crateBlips[crateId] = nil
        end

        Citizen.SetTimeout(60 * 1000, function()
            TriggerServerEvent('cargoship:server:RegisterCrateStash', crateId, pos)
            lib.notify({ text = "[CargoShip] Crate is now lootable!", duration = 5000, type = 'inform' })

            exports.ox_target:addLocalEntity(crate.entity, {
                {
                    label = "Open Crate",
                    icon = "fa-solid fa-box-open",
                    onSelect = function()
                        TriggerEvent('cargoship:client:OpenCrate', crateId)
                    end
                }
            })
        end)
    end, function()
        lib.notify({ text = "[CargoShip] Thermite Hack Failed!", duration = 5000, type = 'error' })
    end)
end

-- Function to spawn dinghys
function SpawnDinghys()
    for i, boat in ipairs(Cargo.Config.BoatSpawns) do
        lib.requestModel(boat.model)
        local dinghy = CreateVehicle(boat.model, boat.coords.x, boat.coords.y, boat.coords.z, true, true)
        SetVehicleOnGroundProperly(dinghy)
        SetEntityAsMissionEntity(dinghy, true, true)

        local blip = AddBlipForEntity(dinghy)
        SetBlipSprite(blip, 427) -- Dinghy icon
        SetBlipColour(blip, 3) -- Light blue
        SetBlipScale(blip, 0.8)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Dinghy")
        EndTextCommandSetBlipName(blip)

        dinghyBlips[dinghy] = blip
    end
end

-- Function to start the event
function StartEvent()
    lib.notify({ text = "[Event] Starting cargo, go get a boat", duration = 5000, type = 'inform' })
    TriggerEvent('erp-sounds:PlayOnAll', 'ship', 1.0)
    SpawnGuards()
    AlertPolice()
    for i, pos in ipairs(Config.CratePositions) do
        local crateId = "cargo_crate_" .. i
        local crateModel = `hei_prop_crate_stack_01`
        lib.requestModel(crateModel)
        local crateEntity = CreateObject(crateModel, pos.x, pos.y, pos.z, true, true, false)
        SetEntityHeading(crateEntity, pos.w)
        FreezeEntityPosition(crateEntity, true)

        local blip = AddBlipForEntity(crateEntity)
        SetBlipSprite(blip, 1) -- Crate icon
        SetBlipColour(blip, 5) -- Yellow
        SetBlipScale(blip, 0.9)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Cargo Crate")
        EndTextCommandSetBlipName(blip)

        crateBlips[crateId] = blip
        activeCrates[crateId] = { hacked = false, entity = crateEntity }

        exports.ox_target:addLocalEntity(crateEntity, {
            {
                label = "Hack Crate",
                icon = "fa-solid fa-box",
                onSelect = function()
                    StartThermiteGame(crateId, pos, blip)
                end
            }
        })
    end

    InitializeHealthCrates()
    SpawnDinghys()

    Citizen.SetTimeout(Config.EventDuration, function()
        CleanupEvent()
    end)
end

