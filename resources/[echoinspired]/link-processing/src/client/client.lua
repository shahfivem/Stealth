local function handleProcess(location)
    if not location.processEvent or type(location.processEvent) ~= "string" then
        print("Error: Invalid process event provided.")
        return
    end

    local canProcess = true

    for _, requiredItem in ipairs(location.requiredItems) do
        if type(requiredItem) == "table" and #requiredItem == 2 then
            local itemName, itemAmount = requiredItem[1], requiredItem[2]
            local count = exports.ox_inventory:Search('count', itemName)

            if count < itemAmount then
                canProcess = false
                print("Not enough items: " .. itemName)
                break
            end
        else
            print("Invalid required item format: " .. tostring(requiredItem))
            canProcess = false
            break
        end
    end

    if canProcess then
        local success = exports.erp_skillcheck:taskBar(math.random(1000, 2000), math.random(8, 12))
        if success then
            if lib.progressBar({
                duration = location.waitingTime,
                label = location.progressBarLabel,
                useWhileDead = false,
                canCancel = false,
                disable = {car = true, move = true, combat = true},
                anim = {
                    dict = location.anim.dict,
                    clip = location.anim.clip
                }
            }) 
            then
                lib.callback.await(location.processEvent)
            else
                lib.notify({
                    title = location.progressBarLabel .. ' Interrupted',
                    description = 'The process was interrupted!',
                    type = 'error'
                })
            end
        else
            lib.notify({
                title = 'Skill Check Failed',
                description = 'You did not succeed in the skill check.',
                type = 'error'
            })
        end
    else
        lib.notify({
            title = 'Missing Items',
            description = 'You do not have the required items to start this process.',
            type = 'error'
        })
    end
end

-- Pre-load all ped models to avoid delays
local function preloadModels()
    for _, location in pairs(Shared.Locations) do
        if Shared.peds and location.pedModel then
            local pedHash = GetHashKey(location.pedModel)
            RequestModel(pedHash)
            while not HasModelLoaded(pedHash) do
                Wait(100)
            end
        end
    end
end

-- Create ped and add ox_target
local function createPed(location)
    local pedHash = GetHashKey(location.pedModel)
    local ped = CreatePed(4, pedHash, location.pedCoords.x, location.pedCoords.y, location.pedCoords.z, location.pedCoords.w, false, true)

    if DoesEntityExist(ped) then
        SetEntityAsMissionEntity(ped, true, true)
        FreezeEntityPosition(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        SetEntityInvincible(ped, true)

        exports['ox_target']:addLocalEntity(ped, {
            {
                name = location.label .. '_ped',
                icon = location.oxTargetIcon,
                label = location.oxTargetLabel,
                onSelect = function()
                    handleProcess(location)
                end
            }
        })
    else
        print("Error: Ped not created for " .. location.label)
    end
end

-- Create a box zone for non-ped targets
local function createBoxZone(location)
    exports.ox_target:addBoxZone({
        coords = location.coords,
        name = location.label .. "_zone",
        size = vec3(location.size, location.size, 1.0),
        debug = location.debug,
        options = {
            {
                label = location.oxTargetLabel,
                icon = location.oxTargetIcon,
                onSelect = function()
                    handleProcess(location)
                end
            }
        }
    })
end

-- Setup all locations
local function setupLocations()
    for name, location in pairs(Shared.Locations) do
        if Shared.peds then
            createPed(location)
        else
            createBoxZone(location)
        end
    end
end

-- Initialization
preloadModels()
setupLocations()
