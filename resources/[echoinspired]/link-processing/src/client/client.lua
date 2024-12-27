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

Citizen.CreateThread(function()
    for name, location in pairs(Shared.Locations) do    
        if Shared.peds then
            local pedHash = GetHashKey(location.pedModel)
            RequestModel(pedHash)
            while not HasModelLoaded(pedHash) do
                Wait(100)
            end

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
                print("Error: Ped not created for " .. name)
            end
        else
            exports.ox_target:addBoxZone({
                coords = location.coords,
                name = name .. "_zone",
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
    end
end)

RegisterNetEvent('link-processing:useItem')
AddEventHandler('link-processing:useItem', function(duration)
    local playerPed = PlayerPedId()

    SetEntityInvincible(playerPed, true)
    SetEntityCanBeDamaged(playerPed, false)

    Citizen.SetTimeout(duration, function()
        SetEntityInvincible(playerPed, false)
        SetEntityCanBeDamaged(playerPed, true)

        TriggerEvent('ox_lib:notify', {description = "Your invincibility to stunguns has ended.", type = 'info'})
    end)
end)