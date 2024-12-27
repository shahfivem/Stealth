local PLANE_MODEL <const> = `cuban800`
local PILOT_MODEL <const> = `s_m_m_pilot_02`
local CHUTE_MODEL <const> = `p_cargo_chute_s`
local CRATE_MODEL <const> = `prop_box_wood02a_pu`
local COLLECTABLE_MODEL <const> = `ex_prop_adv_case_sm_flash`

local CurrentWeapon = nil
local soundId = nil
local handles = {
    pilot = nil,
    plane = nil,
    chute = nil,
    crate = nil,
    collectable = nil
}

---Creates a plane in the sky.
---@param randomPlaneSpawnCoords vector3
---@param heading number
local function createPlane(randomPlaneSpawnCoords, heading)
    handles.plane = CreateVehicle(PLANE_MODEL, randomPlaneSpawnCoords.x, randomPlaneSpawnCoords.y, randomPlaneSpawnCoords.z, heading, false, false)
    SetEntityHeading(handles.plane, heading)
    SetVehicleDoorsLocked(handles.plane, 2)
    SetEntityDynamic(handles.plane, true)
    ActivatePhysics(handles.plane)
    SetVehicleForwardSpeed(handles.plane, 60.0)
    SetHeliBladesFullSpeed(handles.plane)
    SetVehicleEngineOn(handles.plane, true, true, false)
    ControlLandingGear(handles.plane, 3)
    OpenBombBayDoors(handles.plane)
    SetEntityProofs(handles.plane, true, false, true, false, false, false, false, false)
    -- print("Plane Spawn Coordinates: ", randomPlaneSpawnCoords.x, randomPlaneSpawnCoords.y, randomPlaneSpawnCoords.z)
end

---Spawns the ped controlling the plane.
local function createPilot()
    if not handles.plane then return end
    handles.pilot = CreatePedInsideVehicle(handles.plane, 1, PILOT_MODEL, -1, false, true)
    SetBlockingOfNonTemporaryEvents(handles.pilot, true)
    SetPedRandomComponentVariation(handles.pilot, 0)
    SetPedKeepTask(handles.pilot, true)
    SetTaskVehicleGotoPlaneMinHeightAboveTerrain(handles.plane, 50)
end

--- Collecting and looting the airdrop
local function collectAirdrop(entity)
    local state = Entity(entity).state

    if state.searched then
        -- Notify the player that the crate has already been searched
        exports.qbx_core:Notify("This crate has already been searched.", "error")
        return
    end

    -- Mark the crate as searched
    state:set("searched", true, true)

    -- Disable targeting temporarily during the animation and interaction
    exports.ox_target:disableTargeting(true)

    -- Load animations
    local dictKneel = 'amb@medic@standing@kneel@base'
    local dictSearch = 'anim@gangops@facility@servers@bodysearch@'
    lib.requestAnimDict(dictKneel)
    lib.requestAnimDict(dictSearch)

    -- Play animations
    TaskPlayAnim(cache.ped, dictKneel, 'base', 8.0, -8.0, -1, 1, 0, false, false, false)
    TaskPlayAnim(cache.ped, dictSearch, 'player_search', 8.0, -8.0, -1, 48, 0, false, false, false)

    -- Progress bar for interaction
    local collecting = lib.progressBar({
        duration = math.random(60000, 75000),
        label = "Searching Package...",
        canCancel = false,
    })

    if collecting then
        local didCollect = lib.callback.await('airdrops:collect')

        -- Stop animations after completing the task
        StopAnimTask(cache.ped, dictKneel, 'base', 1.0)
        StopAnimTask(cache.ped, dictSearch, 'player_search', 1.0)
        exports.ox_target:disableTargeting(false)

        if didCollect then
            -- Remove the crate from the world
            exports.ox_target:removeLocalEntity(entity) -- Remove interaction
            DeleteEntity(entity) -- Remove the physical object
        end
    else
        -- Handle interruption (e.g., player cancels interaction)
        StopAnimTask(cache.ped, dictKneel, 'base', 1.0)
        StopAnimTask(cache.ped, dictSearch, 'player_search', 1.0)
        exports.ox_target:disableTargeting(false)
    end
end




---Spawns the loot box to loot after the drop falls.
---@param coords any
---Spawns the loot box to loot after the drop falls.
---@param coords any
local function spawnCollectable(coords)
    handles.collectable = lib.object.create({
        model = COLLECTABLE_MODEL,
        coords = vec4(coords.x, coords.y, coords.z, 0.0),
        networked = false,
        onCreated = function(entity)
            PlaceObjectOnGroundProperly(entity)
            FreezeEntityPosition(entity, true)

            -- Set the 'searched' state to false initially
            Entity(entity).state:set("searched", false, true)

            exports.ox_target:addLocalEntity(entity, {
                {
                    label = "Collect",
                    distance = 1.5,
                    onSelect = function()
                        collectAirdrop(entity) -- Pass the entity to the function
                    end
                }
            })
        end
    })
end


---Spawns the airdrop object and chute
---@param coords vector3
local function spawnChuteAndCrate(coords)
    -- Spawn Create and apply physics
    local crateSpawn = vec3(coords.x, coords.y, GetEntityCoords(handles.plane).z - 5.0)

    handles.crate = lib.object.create({
        model = CRATE_MODEL,
        coords = vec4(crateSpawn.x, crateSpawn.y, crateSpawn.z, 0.0),
        networked = false,
        onCreated = function(entity)
            SetEntityLodDist(entity, 1000)
            ActivatePhysics(entity)
            SetDamping(entity, 2, 0.1)
            SetEntityVelocity(entity, 0.0, 0.0, -0.4)
        end
    })

    -- Spawn Chute and attach to crate
    handles.chute = lib.object.create({
        model = CHUTE_MODEL,
        coords = vec4(crateSpawn.x, crateSpawn.y, crateSpawn.z, 0.0),
        networked = false,
        onCreated = function(entity)
            SetEntityLodDist(entity, 1000)
            SetEntityVelocity(entity, 0.0, 0.0, -0.4)
            AttachEntityToEntity(entity, handles.crate.entity, 0, 0.0, 0.0, 0.1, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
        end
    })

    -- start sound from crate, wait for crate to break
    soundId = GetSoundId()
    PlaySoundFromEntity(soundId, 'Crate_Beeps', handles.crate.entity, 'MP_CRATE_DROP_SOUNDS', false, 0)

    while not HasObjectBeenBroken(handles.crate.entity) do
        Wait(0)
    end

    local parachuteCoords = GetEntityCoords(handles.chute.entity)

    -- detach and delete chute, detach crate
    DetachEntity(handles.chute.entity, true, true)
    handles.chute:remove()

    DetachEntity(handles.crate.entity, true, true)

    -- spawn interactable crate in place of old broken crate
    spawnCollectable(parachuteCoords)
end

---Initializes a new airdrop at a coordinate.
---@param distance number
---@param coords vector3
local function newAirDrop(distance, coords)
    lib.requestModel('cuban800')
    lib.requestModel('s_m_m_pilot_02')

    -- flare effect
    local p = lib.particle.create({
        dict = 'scr_ar_planes',
        name = 'scr_ar_trail_smoke',
        looped = true,
        networked = false,
        coords = coords,
        scale = 1,
        duration = 60000
    })

    SetParticleFxLoopedColour(p.handle, 255, 0, 0, 0)

    -- some calculations to get a random spawn location and calculate flight path
    local randomHeading = math.random(0, 360) + 0.0
    local spawnDistance = (distance and tonumber(distance) + 0.0) or 400.0
    local theta = (randomHeading / 180.0) * 3.14
    local randomPlaneSpawnCoords = vector3(coords.x, coords.y, coords.z) - vector3(math.cos(theta) * spawnDistance, math.sin(theta) * spawnDistance, -500.0)

    local dx = coords.x - randomPlaneSpawnCoords.x
    local dy = coords.y - randomPlaneSpawnCoords.y
    local heading = GetHeadingFromVector_2d(dx, dy)

    createPlane(randomPlaneSpawnCoords, heading)
    Wait(200)
    createPilot()

    -- start flight path
    local driveTo = vec3(coords.x, coords.y, coords.z) + vec3(0.0, 0.0, 500.0)
    TaskVehicleDriveToCoord(handles.pilot, handles.plane, driveTo.x, driveTo.y, driveTo.z, 60.0, 0, PLANE_MODEL, 262144, 15.0, -1.0)

    local dropArea = vector2(coords.x, coords.y)
    local planeLocation = vector2(GetEntityCoords(handles.plane).x, GetEntityCoords(handles.plane).y)

    while not IsEntityDead(handles.pilot) and #(planeLocation - dropArea) > 5.0 do
        Wait(100)
        planeLocation = vector2(GetEntityCoords(handles.plane).x, GetEntityCoords(handles.plane).y)
    end

    -- drop crate and continue flight path till deletion
    TaskVehicleDriveToCoord(handles.pilot, handles.plane, 0.0, 0.0, 500.0, 60.0, 0, PLANE_MODEL, 262144, -1.0, -1.0)
    CreateThread(function()
        spawnChuteAndCrate(coords)
    end)

    Wait(10000)
    DeleteEntity(handles.plane)
    DeleteEntity(handles.pilot)
    -- print("Plane Spawn Coordinates: ", randomPlaneSpawnCoords.x, randomPlaneSpawnCoords.y, randomPlaneSpawnCoords.z)
end

---Clean ups a drop after looting or time elapsed.
local function cleanupDrop()
    StopSound(soundId)
    ReleaseSoundId(soundId)

    if handles.collectable?.entity and DoesEntityExist(handles.collectable.entity) then
        exports.ox_target:removeLocalEntity(handles.collectable.entity)
        handles.collectable:remove()
    end

    if handles.crate?.entity and DoesEntityExist(handles.crate.entity) then
        handles.crate:remove()
    end

    handles = {
        pilot = nil,
        plane = nil,
        chute = nil,
        crate = nil,
        collectable = nil
    }
    soundId = nil
end

RegisterNetEvent('airdrops:newDrop', function(distance, coords)
    if GetInvokingResource() then return end
    newAirDrop(distance, coords)
end)

RegisterNetEvent('airdrops:removeDrop', function()
    if GetInvokingResource() then return end
    cleanupDrop()
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        cleanupDrop()
    end
end)

---Main handler for detecting a flaregun flare shot.
---@param weapon number weapon hash
lib.onCache('weapon', function(weapon)
    -- print("Weapon cached:", weapon)
    CurrentWeapon = weapon
    while CurrentWeapon == `WEAPON_FLAREGUN` do
        if IsPedShooting(cache.ped) then
            -- print("Ped is shooting")        
            CreateThread(function()
                local coords = GetEntityCoords(cache.ped)
                local flare = GetClosestObjectOfType(coords.x, coords.y, coords.z, 50.0, `w_pi_flaregun_shell`, false, false, false)

                -- While the flare is in the air, wait until it falls.
                while IsEntityInAir(flare) or GetEntitySpeed(flare) > 5 do
                    Wait(0)
                end
    
                TriggerServerEvent('airdrops:create', GetEntityCoords(flare))
            end)

            return
        end
        
        Wait(0)
    end
end)