local count = 0  -- Initialize the count variable

-- Box zone interaction for USB insert
exports.ox_target:addBoxZone({
    coords = vector3(-1063.34, -246.19, 45.02),
    distance = 2.0,
    options = { 
        {
            label = "Insert USB",
            icon = "fa-solid fa-search",
            iconColor = "red",
            distance = 3.0,
            onSelect = function(data)
                -- Check if the player has at least one 'fleecadevice'
                local hasitem = exports.ox_inventory:Search('count', 'fleecadevice')
                if hasitem < 1 then
                    -- If not, notify the player and exit the function
                    lib.notify({
                        text = 'You are missing the required device for this.',
                        duration = 5000,
                        type = 'error'
                    })
                    return  -- Exit the function if the player is missing the device
                end

                -- Start the task bar for inserting the USB
                local k = exports.erp_progressbar:taskBar({
                    text = 'Inserting USB',
                    length = 5000,
                    disable = {
                        movement = true
                    }
                })

                -- If the task bar completes successfully (100%)
                if k == 100 then
                    local result = promise.new()

                    -- Start the memory game
                    exports['erp_memorygame']:movingmemory(math.random(5, 6), function()
                        -- On success, resolve the promise and notify the player
                        result:resolve(true)
                    end, function()
                        -- On failure, resolve the promise and notify the player
                        result:resolve(false)
                    end)

                    -- Await the result of the memory game
                    local won = Citizen.Await(result)

                    -- Check if the player won the mini-game
                    if won then
                        exports["npwd"]:createSystemNotification({
                            uniqId = "esxSurvey",
                            content = "Accept task?",
                            secondaryTitle = "???",
                            keepOpen = true,
                            duration = 5000,
                            controls = true,
                            onConfirm = function()
                                SetNewWaypoint(1735.18, -1636.86)  -- Replace with the coordinates you want
                                -- Call the function to spawn the ped and set the target interaction
                                spawnPedAndSetTarget()
                                lib.notify({
                                    text = 'Check your map, you have 5 mins',
                                    duration = 5000,
                                    type = 'inform'
                                })
                                count = 0
                            end,
                            onCancel = function()
                              lib.notify({
                                text = 'Stop wasting your own time... freak.',
                                duration = 5000,
                                type = 'error'
                              })
                            end,
                          })
                    else
                        -- Player failed the mini-game
                        count = count + 1  -- Increment the failure count

                        lib.notify({
                            text = 'You failed, you have ' .. (5 - count) .. ' more tries',
                            duration = 5000,
                            type = 'inform'
                        })

                        -- If the player has failed 5 times, remove the item
                        if count >= 5 then
                            TriggerServerEvent('ox_inventory:removeItem', 'fleecadevice', 1)
                            lib.notify({
                                text = 'You have failed 5 times. The device has been removed.',
                                duration = 5000,
                                type = 'error'
                            })
                            count = 0
                        end
                    end
                end
            end
        }
    }
})

function spawnPedAndSetTarget()
    -- Define the ped model
    local pedModel = `a_m_m_business_01`  -- Example ped model

    -- Request the model and wait until it's loaded
    RequestModel(pedModel)
    while not HasModelLoaded(pedModel) do
        Wait(500)
    end

    -- Spawn the ped at the destination coordinates
    local ped = CreatePed(4, pedModel, 1735.18, -1636.86, 111.53, 68.38, true, false)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetEntityVisible(ped, true)

    -- Get the network ID of the ped
    local pedNetId = NetworkGetNetworkIdFromEntity(ped)

    -- Add a target interaction to the ped using the network ID
    exports.ox_target:addEntity(pedNetId, {
        label = "Talk to Ped",
        icon = "fa-solid fa-comment",
        iconColor = "blue",
        onSelect = function()
            -- Add the 'adv_laptop' item to the player's inventory
            TriggerServerEvent('giveitem')
            lib.notify({
                text = 'You received a laptop, paired with your device. it could be useful for $F.',
                duration = 5000,
                type = 'success'
            })
        end
    })
end
