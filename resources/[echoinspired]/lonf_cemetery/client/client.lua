local config = lib.require 'config'
local acceptRob = false
local markerPoints = {}
local sphere = nil
local pedSpawned = false
local qtdGraves = #config.coordsGraves

local function spawnDefensors(model, weapon, selectedGrave)
    local pedModel = GetHashKey(model)
    RequestModel(pedModel)

    while not HasModelLoaded(model) do
        Wait(1)
    end

    pedModel = CreatePed(0, model, selectedGrave.x + 10, selectedGrave.y + 10, selectedGrave.z + 0.3, selectedGrave.w,
        true, false)

    SetPedFleeAttributes(pedModel, 0, false)
    SetPedCombatAttributes(pedModel, 46, true)
    SetPedCombatAbility(pedModel, 1)
    SetPedCombatMovement(pedModel, 2)
    SetPedCombatRange(pedModel, 0)
    SetPedKeepTask(pedModel, true)
    SetPedDropsWeaponsWhenDead(pedModel, false)

    GiveWeaponToPed(pedModel, weapon, 250, true, true)

    TaskCombatPed(pedModel, cache.ped, 0, 16)
end

local function CreateDefensor(selectedGrave)
    local hours = GetClockHours()
    local model

    if math.random(0, 100) <= config.spawnDefensorChance then
        if hours >= 22 or hours < 8 then
            model = config.defensorGothMommy
            weapon1 = "WEAPON_BOTTLE"
            weapon2 = "WEAPON_KNIFE"
            spawnDefensors(model, weapon1, selectedGrave)
            spawnDefensors(model, weapon2, selectedGrave)
        else
            model = config.defensorPriest
            weapon = "WEAPON_DBSHOTGUN"
            spawnDefensors(model, weapon, selectedGrave)
        end
    end
end



local function callTheCops()
    local hours = GetClockHours()
    local chance = config.policeCallChance

    if hours >= 22 and hours <= 8 then
        chance = config.policeCallNightChance
    end

    if math.random() <= chance then
        TriggerServerEvent('police:server:policeAlert')
    end
end

local function dropFingerprint(selectedGrave)
    if qbx.isWearingGloves() then return end
    if config.fingerprintChance > math.random(0, 100) then
        TriggerServerEvent('evidence:server:CreateFingerDrop', selectedGrave)
    end
end

local function cleanZones()
    if sphere then
        sphere:remove()
        sphere = nil
    end

    for _, point in pairs(markerPoints) do
        point:remove()
    end

    markerPoints = {}
end
-- Linear interpolation function
function Lerp(a, b, t)
    return a + (b - a) * t
end

local function generateRandomGrave()
    return math.random(1, qtdGraves)
end

local function generateCoords(grave)
    return config.coordsGraves[grave]
end

local function hasItem()
    return exports.ox_inventory:Search('count', 'shovel') >= 1
end


local function transitionToGrave(selectedGrave)
    local ped = PlayerPedId()
    local playerCoords = GetEntityCoords(ped)

    -- Create the camera and set its initial position at the player's location
    local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamCoord(cam, playerCoords.x, playerCoords.y, playerCoords.z + 1.5)  -- Start a little above the player's head
    PointCamAtCoord(cam, selectedGrave.x, selectedGrave.y, selectedGrave.z)
    SetCamActive(cam, true)
    RenderScriptCams(true, false, 0, true, true)

    -- Transition the camera towards the grave smoothly
    local transitionTime = 3000  -- Set the transition duration in milliseconds
    local startTime = GetGameTimer()

    while GetGameTimer() - startTime < transitionTime do
        local progress = (GetGameTimer() - startTime) / transitionTime

        -- Interpolate the camera position from the player's position to the grave
        local interpolatedX = Lerp(playerCoords.x, selectedGrave.x, progress)
        local interpolatedY = Lerp(playerCoords.y, selectedGrave.y, progress)
        local interpolatedZ = Lerp(playerCoords.z + 1.5, selectedGrave.z + 5.0, progress)  -- Adjust the Z value to move the camera up a bit

        SetCamCoord(cam, interpolatedX, interpolatedY, interpolatedZ)
        PointCamAtCoord(cam, selectedGrave.x, selectedGrave.y, selectedGrave.z)

        Citizen.Wait(0)
    end

    -- Final camera position and look at the grave
    SetCamCoord(cam, selectedGrave.x, selectedGrave.y, selectedGrave.z + 5.0)
    PointCamAtCoord(cam, selectedGrave.x, selectedGrave.y, selectedGrave.z)

    -- Wait for a few seconds before restoring the player's view
    Citizen.Wait(5000)

    -- Disable the camera and restore the player's view
    RenderScriptCams(false, false, 0, true, true)
    DestroyCam(cam, false)
end

local function generatePoints()
    local randomGrave = generateRandomGrave()
    local selectedGrave = generateCoords(randomGrave)
    
    -- Notify the player to go look for the grave
    lib.notify({
        text = 'I marked a grave on your map.',
        duration = 5000,
        type = 'inform'
    })

    -- Add a waypoint to the selected grave
    SetNewWaypoint(selectedGrave.x, selectedGrave.y)

-- Call the function with your selected grave coordinates
transitionToGrave(selectedGrave)

    -- Proceed with creating a marker and handling interaction
    local point = lib.points.new({
        coords = selectedGrave,
        distance = 60,
        dunak = 'nerd',
    })

    function point:nearby()
        -- Draw a marker near the selected grave
        DrawMarker(2, self.coords.x, self.coords.y, self.coords.z, 0.0, 0.0, 0.0, 0.0, 0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 50, false, true, 2, false, nil, nil, false)

        if self.currentDistance < 1 and IsControlJustReleased(0, 38) then
            local d = exports.erp_progressbar:taskBar({
                text = 'Digging ...',
                length = 5000,
                animation = {
                    dict = 'anim@scripted@player@mission@tun_iaa_dig@male@',
                    anim = 'action',
                    stuck = true
                }
            })
if d == 100 then
            point:remove()
            dropFingerprint(selectedGrave)
            TriggerServerEvent('hud:server:GainStress', math.random(12, 20))
            lib.callback.await('lonf_fruitpick:server:giveItem', false)

            CreateDefensor(selectedGrave)

            Wait(500)
            generatePoints()
        end
    end
end

    table.insert(markerPoints, point)
end
local function createGravesBoxes()
    Citizen.CreateThread(function()
        generatePoints()
        Wait(500)
    end)
end
local function createRobZone()
    sphere = lib.zones.sphere({
        coords = config.robZone,
        radius = 147,
        debug = false,
        inside = function()
            exports.ox_target:removeModel(config.model, _)
            inSphere = true
        end,
        onEnter = function()
            inSphere = true
        end,
        onExit = function()
            acceptRob = false
            cleanZones()

            exports.ox_target:addModel(config.model, {
                {
                    icon = 'fa-solid fa-user-secret',
                    label = 'Talk to corrupt priest',
                    onSelect = function()
                        local cops = lib.callback.await('lonf:server:getNumCops')
                        if cops >= config.minCops then
                            acceptRob = true
                            if acceptRob then
                                createGravesBoxes()
                                createRobZone()
                            end
                        end
                    end,
                    distance = 1.5,
                }
            })
            inSphere = false
        end
    })
end

local function SpawnPeds()
    local model = GetHashKey(config.model)
    RequestModel(model)

    while not HasModelLoaded(model) do
        Wait(1)
    end

    local pedModel = CreatePed(0, model, config.coords.x, config.coords.y, config.coords.z, config.coords.w, false, false)
    SetEntityInvincible(pedModel, true)
    FreezeEntityPosition(pedModel, true)
    SetBlockingOfNonTemporaryEvents(pedModel, true)
    SetModelAsNoLongerNeeded(pedModel)
    lib.RequestAnimDict('timetable@michael@on_chairidle_c')
    TaskPlayAnim(pedModel, 'timetable@michael@on_chairidle_c', 'on_chair_e', 8.0, 1.0, -1, 01, 0, 0, 0, 0)

    exports.ox_target:addModel(config.model, {
        {
            icon = 'fa-solid fa-user-secret',
            label = 'Talk to corrupt priest',
            onSelect = function()
                local cops = lib.callback.await('lonf:server:getNumCops')

                if cops >= config.minCops then
                    acceptRob = true
                    if acceptRob then
                        createGravesBoxes()
                        createRobZone()
                    end
                end
            end,
            distance = 1.5,
        }
    })
    pedSpawned = true
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    SpawnPeds()
end)

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        if not pedSpawned then
            SpawnPeds()
        end
    end
end)
