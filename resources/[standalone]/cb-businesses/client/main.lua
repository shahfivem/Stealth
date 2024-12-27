JobPeds = {}
ClosedShopPeds = {}
Businesses = {}
local makingItRain = false
-- Automatically populate the Businesses table from Config
for key, business in pairs(Config) do
    if business and business.job then  -- Assuming each business config has a 'job' property
        Businesses[key] = business
    end
end

CreateThread(function()
    -- Loop through each business in the Businesses table and create zones
    for _, business in pairs(Businesses) do
        CreateJobZones(business, business.job)
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    for _, business in pairs(Businesses) do
        if business.stripper then
            local strippersSpawned = lib.callback.await('cb-businesses:server:StrippersSpawned', false, business.job)
            if strippersSpawned then
                SpawnStrippersForPlayer(business)
            end
        end
    end
end)

function BillPlayer()
    -- Get the player's ped and coordinates
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    -- Get nearby players within a 10.0 unit radius (you can adjust this distance)
    local nearbyPlayers = lib.getNearbyPlayers(playerCoords, 10.0, false)

    -- Prepare options for inputDialog based on nearby players
    local playerOptions = {}
    for _, player in ipairs(nearbyPlayers) do
        local playerid = GetPlayerServerId(player.id)
        table.insert(playerOptions, {value = playerid, label = Translations.general.playerID .. ' ' .. playerid})
    end

    -- If no nearby players are found, show a notification
    if #playerOptions == 0 then
        TriggerEvent('cb-businesses:client:Notify', Translations.error.noCustomers, Translations.error.noCustomersDesc, "error")
        return
    end

    -- Open the input dialog with nearby players
    local dialog = lib.inputDialog(Translations.billPlayer.title, {
        {type = 'select', label = Translations.billPlayer.player, options = playerOptions, description = Translations.billPlayer.playerDesc, required = true},
        {type = 'number', label = Translations.billPlayer.amount, description = Translations.billPlayer.amountDesc, required = true, min = 1, max = 10000},
        {type = 'select', label = Translations.billPlayer.account, options = {{value = 'cash', label = Translations.general.cash}, {value = 'bank', label = Translations.general.bank}}, required = true},
    })

    -- Check if the dialog was completed
    if dialog then
        -- Trigger the server event with selected player id, bill amount, and payment method
        TriggerServerEvent("cb-businesses:server:billcustomer", dialog[1], dialog[2], dialog[3])
    end
end

function OpenClothingMenu(job)
    local menuItems = {}
    local isBoss = IsPlayerBoss(job)
    if isBoss then
        table.insert(menuItems, {
            title = "Set Uniform",
            description = "Set the uniform for all employees",
            icon = "fa-solid fa-shirt",
            iconColor = "orange",
            onSelect = function()
                local ped = cache.ped
                local outfit = GetPlayerOutfit(ped)
                TriggerServerEvent("cb-businesses:server:SetUniform", GetPlayerServerId(PlayerId()), outfit)
            end
        })
    end
    table.insert(menuItems, {
        title = "Wear Uniform",
        description = "Wear the uniform for your job",
        icon = "fa-solid fa-shirt",
        iconColor = "green",
        onSelect = function()
            local outfit = lib.callback.await('cb-businesses:server:GetUniform', false)
            -- Table mapping component names to their respective component IDs
            local componentIds = {
                mask = 1,
                torso = 3,
                legs = 4,
                bags = 5,
                shoes = 6,
                accessories = 7,
                undershirts = 8,
                bodyarmor = 9,
                decals = 10,
                tops = 11
            }

            if outfit then
                for k, v in pairs(outfit) do
                    -- Check if the component name exists in the mapping
                    if componentIds[k] then
                        SetPedComponentVariation(cache.ped, componentIds[k], v.drawable, v.texture, 0)
                    end
                end
            else
                TriggerEvent('cb-gangsystem:client:Notify', "No Uniform Set", "The Owner hasn't set a Job Unfiform yet!", "error")
            end

            --[[
            -- Additional components like hats, glasses, ears, watches, and bracelets are separate from the main components
            SetPedPropIndex(cache.ped, 0, outfit.hats.drawable, outfit.hats.texture, true)        -- Hats
            SetPedPropIndex(cache.ped, 1, outfit.glasses.drawable, outfit.glasses.texture, true)  -- Glasses
            SetPedPropIndex(cache.ped, 2, outfit.ears.drawable, outfit.ears.texture, true)        -- Ears
            SetPedPropIndex(cache.ped, 6, outfit.watches.drawable, outfit.watches.texture, true)  -- Watches
            SetPedPropIndex(cache.ped, 7, outfit.bracelets.drawable, outfit.bracelets.texture, true)  -- Bracelets
            ]]
        end
    })
    lib.registerContext({
        id = 'OpenClothingMenu',
        title = "Clothing Menu",
        options = menuItems
    })
    lib.showContext('OpenClothingMenu')
end

function CraftMenu(job, type)
local playerJob = GetPlayerJob()
local craftingOptions = {}

-- Function to process recipes and add them to the craftingOptions
local function addRecipes(recipes)
    for categoryName, recipeList in pairs(recipes) do
        for _, recipe in ipairs(recipeList) do
            local itemLabel = GetItemLabel(recipe.result.item)
            local iconPath = GetItemImage(recipe.result.item)
            local submenuId = 'CraftingMenu_' .. recipe.result.item

            -- Create the submenu for the item
            local submenuOptions = {}
            local craftingQuantities = {1, 5, 10, 20} -- Define the multiples for crafting

            for _, quantity in ipairs(craftingQuantities) do
                local description = "Requirements:"
                local hasItems = recipe.items and #recipe.items > 0 -- Check if there are item requirements

                if hasItems then
                    -- Add item requirements to the description
                    for _, ingredient in ipairs(recipe.items) do
                        local ingredientLabel = GetItemLabel(ingredient.item)
                        description = description .. "\n" .. (ingredient.amount * quantity) .. "x " .. ingredientLabel
                    end
                else
                    description = "No materials required." -- No item requirements
                end

                table.insert(submenuOptions, {
                    title = string.format("%dx %s", quantity, itemLabel),
                    description = description,
                    icon = iconPath,
                    onSelect = function()
                        local canCraft = true
                        if hasItems then
                            -- Check if the player has the required materials
                            canCraft = lib.callback.await('cb-businesses:server:canCraft', false, recipe.result.item, type, job, quantity)
                        end

                        if not canCraft then
                            TriggerEvent('cb-gangsystem:client:Notify', "Missing Materials", "You do not have the required items to craft this!", "error")
                            return
                        end

                        -- Proceed with crafting
                        -- if lib.progressBar({
                        --     duration = recipe.duration * quantity, -- Multiply duration by quantity
                        --     label = string.format("Crafting %dx %s...", quantity, itemLabel),
                        --     useWhileDead = false,
                        --     canCancel = true,
                        --     disable = {
                        --         move = true,
                        --         car = true,
                        --         combat = true,
                        --     },
                        --     anim = {
                        --         dict = recipe.dict,
                        --         clip = recipe.clip,
                        --         flag = recipe.flag or nil
                        --     },
                        -- }) then
                        if exports.erp_progressbar:taskBar({
                            length = recipe.duration * quantity, -- Multiply duration by quantity
                            text = string.format("Crafting %dx %s...", quantity, itemLabel),
                            flopcheck = true,
                            animation = {
                                dict = recipe.dict,
                                anim = recipe.clip,
                                flag = recipe.flag or nil,
                                stuck = true
                            }
                        }) == 100 then
                            TriggerServerEvent('cb-businesses:server:CraftItem', recipe.result.item, type, job, quantity)
                        else
                            TriggerEvent('cb-gangsystem:client:Notify', "Cancelled", "You cancelled the action!", "error")
                        end
                    end
                })
            end

            -- Register the submenu for this item
            lib.registerContext({
                id = submenuId,
                title = itemLabel,
                options = submenuOptions,
            })

            -- Add the main menu option for this item
            table.insert(craftingOptions, {
                title = itemLabel,
                description = "Select quantity to craft",
                icon = iconPath,
                arrow = true,
                onSelect = function()
                    lib.showContext(submenuId)
                end
            })
        end
    end
end

-- Add recipes for the player's specific job
if type[playerJob] then
    addRecipes(type[playerJob])
end

-- Add recipes for the "all" category, if it exists
if type["all"] then
    addRecipes(type["all"])
end

if #craftingOptions > 0 then
    lib.registerContext({
        id = 'CraftingMenu' .. job,
        title = GetPlayerJobLabel(),
        options = craftingOptions
    })
    lib.showContext('CraftingMenu' .. job)
else
    TriggerEvent('cb-gangsystem:client:Notify', "No Recipes", "There are no crafting options available for your job.", "error")
end
end



-- Function to spawn a stripper ped
local function spawnStripperPed(model, coords, heading, business)
    local barName = business.job
    local stripperPed = CreatePed(5, model, coords.x, coords.y, coords.z, heading, true, true)
    
    if DoesEntityExist(stripperPed) then
        FreezeEntityPosition(stripperPed, true)
        SetEntityInvincible(stripperPed, true)
        
        -- Delay to ensure the ped is fully initialized before performing actions
        Wait(100)

        -- Load and apply the animation
        RequestAnimDict("mini@strip_club@lap_dance@ld_girl_a_song_a_p1")
        while not HasAnimDictLoaded("mini@strip_club@lap_dance@ld_girl_a_song_a_p1") do
            Wait(100)
        end

        TaskPlayAnim(stripperPed, "mini@strip_club@lap_dance@ld_girl_a_song_a_p1", "ld_girl_a_song_a_p1_f", 8.0, -8.0, -1, 1, 0, false, false, false)

        -- Add to the job-specific stripperPeds table
        if not JobPeds[barName] then
            JobPeds[barName] = {}
        end
        table.insert(JobPeds[barName], stripperPed)

        exports.ox_target:addLocalEntity(stripperPed, {
            {
                label = "Throw Money",
                icon = "fa-solid fa-heart",
                distance = business.stripper.targetDistance,
                onSelect = function()
                    local cashRemoved = lib.callback.await('cb-businesses:server:StripperTakeCash', false, business)
                    if not cashRemoved then
                        TriggerEvent('cb-businesses:client:Notify', "No Cash", "You don't have any cash to throw!", "error")
                        return
                    end
                    if makingItRain then return end
                    makingItRain = true
                    ExecuteCommand("e makeitrain")
                    Wait(5000)
                    TriggerServerEvent('hud:server:RelieveStress', math.random(business.stripper.stressRelief.min, business.stripper.stressRelief.max))
                    ExecuteCommand("e c")
                    makingItRain = false
                end,
            },
            {
                label = "Send Strippers Home",
                icon = "fa-solid fa-house",
                distance = business.stripper.targetDistance,
                onSelect = function()
                    -- Delete all peds associated with this job
                    if JobPeds[barName] then
                        for _, ped in ipairs(JobPeds[barName]) do
                            if DoesEntityExist(ped) then
                                TriggerServerEvent('cb-businesses:server:DeletePed', ped)
                            end
                        end
                        JobPeds[barName] = nil -- Clear the table for this job
                    end
                end,
                canInteract = function()
                    local PlayerData = GetPlayerData()
                    local job = PlayerData.job.name
                    return (JobPeds[barName] ~= nil) and (job == barName)
                end
            }
        })
    else
        lib.print.error("Failed to create the stripper ped at " .. tostring(coords))
    end
end

-- Function to handle spawning for all players
function SpawnStrippersForPlayer(business)
    local stripperModel = `s_f_y_stripper_01`

    -- Load the model
    RequestModel(stripperModel)
    local tries = 0
    while not HasModelLoaded(stripperModel) and tries < 10 do
        Wait(500)
        tries = tries + 1
    end

    if HasModelLoaded(stripperModel) then
        if business.stripper.coords then
            for _, stripperData in ipairs(business.stripper.coords) do
                spawnStripperPed(stripperModel, stripperData.coords, stripperData.heading or 0.0, business)
            end
        end
        SetModelAsNoLongerNeeded(stripperModel)
    else
        print("[ERROR] Model failed to load after several attempts!")
    end
end

function CreateJobZones(business, job)
    if business.blip.useBlip then
        local businessBlip = AddBlipForCoord(business.blip.coords.x, business.blip.coords.y, business.blip.coords.z)
		SetBlipSprite(businessBlip, business.blip.sprite)
		SetBlipColour(businessBlip, business.blip.color)
		SetBlipScale(businessBlip, business.blip.scale)
		SetBlipAsShortRange(businessBlip, true)
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString(business.blip.name)
		EndTextCommandSetBlipName(businessBlip)
    end
    if business.autoClock then
        local onDuty = false -- Tracks if the player is on duty
    
        -- Function to update onDuty status from player data
        local function updateDutyStatus()
            local playerData = exports["qbx_core"]:GetPlayerData()
            if playerData and playerData.job then
                onDuty = playerData.job.onduty
            else
                onDuty = false
            end
        end
    
        -- Initialize duty status
        updateDutyStatus()
    
        lib.zones.sphere({
            coords = business.autoClock.coords,
            radius = business.autoClock.radius,
            debug = business.debug,
            onEnter = function()
                updateDutyStatus() -- Refresh duty status
                if GetPlayerJob() == job and not onDuty then
                    -- Update duty status only if not already on duty
                    onDuty = true
                    TriggerServerEvent("QBCore:ToggleDuty")
                    TriggerEvent('cb-businesses:client:Notify', "Clocked In", "You are now clocked in.", "success")
                end
            end,
            onExit = function()
                updateDutyStatus() -- Refresh duty status
                if GetPlayerJob() == job and onDuty then
                    -- Toggle duty off on exit if on duty
                    onDuty = false
                    TriggerServerEvent("QBCore:ToggleDuty")
                    TriggerEvent('cb-businesses:client:Notify', "Clocked Out", "You are now clocked out.", "error")
                end
            end
        })
    end
    
    

    if business.duty then
        for _, dutyZone in ipairs(business.duty) do
            local uniqueName = "duty_" .. job .. "_" .. _
            local menuOptions = {
                {
                    type = "client",
                    onSelect = function()
                        TriggerServerEvent("QBCore:ToggleDuty")
                    end,
                    label = dutyZone.label,
                    icon = dutyZone.icon,
                    canInteract = function(entity, distance, coords, name, bone)
                        return GetPlayerJob() == job
                    end,
                    distance = 2
                }
            }
            exports.ox_target:addBoxZone({
                name = uniqueName,
                coords = dutyZone.coords,
                size = vec3(dutyZone.length, dutyZone.width, dutyZone.height),
                rotation = dutyZone.heading,
                debug = business.debug,
                drawSprite = false,
                options = menuOptions,
            })
        end
    end

    if business.stripper then
        local uniqueName = "stripper_manage_" .. job
        local menuOptions = {}
        table.insert(menuOptions, {
            type = "client",
            onSelect = function()
                TriggerServerEvent('cb-businesses:server:SpawnStrippers', business)
            end,
            label = business.stripper.target.label,
            icon = business.stripper.target.icon,
            canInteract = function(entity, distance, coords, name, bone)
                return (JobPeds[job] == nil) and (GetPlayerJob() == job) and (business.stripper.coords) and IsOnDuty()
            end,
            distance = 2
        })
        table.insert(menuOptions, {
            type = "client",
            onSelect = function()
                -- Delete all peds associated with this job
                if JobPeds[job] then
                    for _, ped in ipairs(JobPeds[job]) do
                        if DoesEntityExist(ped) then
                            TriggerServerEvent('cb-businesses:server:DeletePed', ped)
                        end
                    end
                    JobPeds[job] = nil -- Clear the table for this job
                end
            end,
            label = business.stripper.target.label2,
            icon = business.stripper.target.icon2,
            distance = business.stripper.targetDistance,
            canInteract = function()
                local PlayerData = GetPlayerData()
                local job = PlayerData.job.name
                return (JobPeds[job] ~= nil) and (job == job)
            end
        })
        exports.ox_target:addBoxZone({
            name = uniqueName,
            coords = business.stripper.target.coords,
            size = vec3(business.stripper.target.length, business.stripper.target.width, business.stripper.target.height),
            rotation = business.stripper.target.heading,
            debug = business.debug,
            drawSprite = false,
            options = menuOptions,
        })
    end

    if business.payment then
        for _, paymentZone in ipairs(business.payment) do
            local uniqueName = "payment_" .. job .. "_" .. _
            exports.ox_target:addBoxZone({
                name = uniqueName,
                coords = paymentZone.coords,
                size = vec3(paymentZone.length, paymentZone.width, paymentZone.height),
                rotation = paymentZone.heading,
                debug = business.debug,
                drawSprite = false,
                options = {
                    {
                        type = "client",
                        onSelect = function()
                            BillPlayer()
                        end,
                        label = paymentZone.label,
                        icon = paymentZone.icon,
                        canInteract = function(entity, distance, coords, name, bone)
                            return GetPlayerJob() == job and IsOnDuty()
                        end,
                        distance = 2
                    }
                },
            })
        end
    end

    if business.shop then
        for _, shopZone in ipairs(business.shop) do
            local uniqueName = "payment_" .. job .. "_" .. _
            exports.ox_target:addBoxZone({
                name = uniqueName,
                coords = shopZone.coords,
                size = vec3(shopZone.length, shopZone.width, shopZone.height),
                rotation = shopZone.heading,
                debug = business.debug,
                drawSprite = false,
                options = {
                    {
                        type = "client",
                        onSelect = function()
                            exports.ox_inventory:openInventory('shop', { type = shopZone.name, id = 1 })
                        end,
                        label = shopZone.label,
                        icon = shopZone.icon,
                        canInteract = function(entity, distance, coords, name, bone)
                            return GetPlayerJob() == job and IsOnDuty()
                        end,
                        distance = 2
                    }
                },
            })
        end
    end

    if business.clothing then
        for _, clothingZone in ipairs(business.clothing) do
            EntranceZone = lib.zones.box({
                coords = vector3(clothingZone.coords.x, clothingZone.coords.y, clothingZone.coords.z),
                size = vector3(clothingZone.length, clothingZone.width, clothingZone.height),
                rotation = clothingZone.heading,
                debug = business.debug,
                onEnter = function()
                    ShowTextUI("[E] Clothing")
                end,
                onExit = function()
                    HideTextUI()
                end,
                inside = function()
                    -- Check if the player presses the interaction key (E by default)
                    if IsControlJustReleased(0, 38) then -- 38 is the control for "E"
                        OpenClothingMenu(business.job)
                    end
                end
            })
        end
    end

    if business.beer then
        for _, beerZone in ipairs(business.beer) do
            local uniqueName = "beer" .. job .. "_" .. _
            exports.ox_target:addBoxZone({
                name = uniqueName,
                coords = beerZone.coords,
                size = vec3(beerZone.length, beerZone.width, beerZone.height),
                rotation = beerZone.heading,
                debug = business.debug,
                drawSprite = false,
                options = {
                    {
                        type = "client",
                        onSelect = function()
                            CraftMenu(job, Config.BeerCrafting)
                        end,
                        label = beerZone.label,
                        icon = beerZone.icon,
                        canInteract = function(entity, distance, coords, name, bone)
                            return GetPlayerJob() == job and IsOnDuty()
                        end,
                        distance = 2
                    }
                },
            })
        end
    end



    if business.counter then
        for _, counterZone in ipairs(business.counter) do
            local uniqueName = "counter_" .. job .. "_" .. _
            exports.ox_target:addBoxZone({
                name = uniqueName,
                coords = counterZone.coords,
                size = vec3(counterZone.length, counterZone.width, counterZone.height),
                rotation = counterZone.heading,
                debug = business.debug,
                drawSprite = false,
                options = {
                    {
                        type = "client",
                        onSelect = function()
                            OpenStash(counterZone.name)
                        end,
                        label = counterZone.label,
                        icon = counterZone.icon,
                        --canInteract = function(entity, distance, coords, name, bone)
                        --    return --GetPlayerJob() == job and IsOnDuty()
                        --end,
                        distance = 2.5
                    }
                },
            })
        end
    end

    if business.counter2 then
        for _, counter2Zone in ipairs(business.counter2) do
            local uniqueName = "counter2_" .. job .. "_" .. _
            exports.ox_target:addBoxZone({
                name = uniqueName,
                coords = counter2Zone.coords,
                size = vec3(counter2Zone.length, counter2Zone.width, counter2Zone.height),
                rotation = counter2Zone.heading,
                debug = business.debug,
                drawSprite = false,
                options = {
                    {
                        type = "client",
                        onSelect = function()
                            OpenStash(counter2Zone.name)
                        end,
                        label = counter2Zone.label,
                        icon = counter2Zone.icon,
                        --canInteract = function(entity, distance, coords, name, bone)
                        --    return --GetPlayerJob() == job and IsOnDuty()
                        --end,
                        distance = 2.5
                    }
                },
            })
        end
    end

    if business.storage then
        for _, storageZone in ipairs(business.storage) do
            local uniqueName = "storage" .. job .. "_" .. _
            exports.ox_target:addBoxZone({
                name = uniqueName,
                coords = storageZone.coords,
                size = vec3(storageZone.length, storageZone.width, storageZone.height),
                rotation = storageZone.heading,
                debug = business.debug,
                drawSprite = false,
                options = {
                    {
                        type = "client",
                        onSelect = function()
                            OpenStash(storageZone.name)
                        end,
                        label = storageZone.label,
                        icon = storageZone.icon,
                        canInteract = function(entity, distance, coords, name, bone)
                            return GetPlayerJob() == job and IsOnDuty()
                        end,
                        distance = 2
                    }
                },
            })
        end
    end

    if business.ice then
        for _, iceZone in ipairs(business.ice) do
            local uniqueName = "storage" .. job .. "_" .. _
            exports.ox_target:addBoxZone({
                name = uniqueName,
                coords = iceZone.coords,
                size = vec3(iceZone.length, iceZone.width, iceZone.height),
                rotation = iceZone.heading,
                debug = business.debug,
                drawSprite = false,
                options = {
                    {
                        type = "client",
                        onSelect = function()
                            CraftMenu(job, Config.IceCrafting)
                        end,
                        label = iceZone.label,
                        icon = iceZone.icon,
                        canInteract = function(entity, distance, coords, name, bone)
                            return GetPlayerJob() == job and IsOnDuty()
                        end,
                        distance = 2
                    }
                },
            })
        end
    end

    if business.coffee then
        for _, coffeeZone in ipairs(business.coffee) do
            local uniqueName = "coffee" .. job .. "_" .. _
            exports.ox_target:addBoxZone({
                name = uniqueName,
                coords = coffeeZone.coords,
                size = vec3(coffeeZone.length, coffeeZone.width, coffeeZone.height),
                rotation = coffeeZone.heading,
                debug = business.debug,
                drawSprite = false,
                options = {
                    {
                        type = "client",
                        onSelect = function()
                            CraftMenu(job, Config.CoffeeCrafting)
                        end,
                        label = coffeeZone.label,
                        icon = coffeeZone.icon,
                        canInteract = function(entity, distance, coords, name, bone)
                            return GetPlayerJob() == job and IsOnDuty()
                        end,
                        distance = 2
                    }
                },
            })
        end
    end

    if business.slushy then
        for _, slushyZone in ipairs(business.slushy) do
            local uniqueName = "slushy" .. job .. "_" .. _
            exports.ox_target:addBoxZone({
                name = uniqueName,
                coords = slushyZone.coords,
                size = vec3(slushyZone.length, slushyZone.width, slushyZone.height),
                rotation = slushyZone.heading,
                debug = business.debug,
                drawSprite = false,
                options = {
                    {
                        type = "client",
                        onSelect = function()
                            CraftMenu(job, Config.SlushyCrafting)
                        end,
                        label = slushyZone.label,
                        icon = slushyZone.icon,
                        canInteract = function(entity, distance, coords, name, bone)
                            return GetPlayerJob() == job and IsOnDuty()
                        end,
                        distance = 2
                    }
                },
            })
        end
    end

    if business.stove then
        for _, stoveZone in ipairs(business.stove) do
            local uniqueName = "stove" .. job .. "_" .. _
            exports.ox_target:addBoxZone({
                name = uniqueName,
                coords = stoveZone.coords,
                size = vec3(stoveZone.length, stoveZone.width, stoveZone.height),
                rotation = stoveZone.heading,
                debug = business.debug,
                drawSprite = false,
                options = {
                    {
                        type = "client",
                        onSelect = function()
                            CraftMenu(job, Config.StoveCrafting)
                        end,
                        label = stoveZone.label,
                        icon = stoveZone.icon,
                        canInteract = function(entity, distance, coords, name, bone)
                            return GetPlayerJob() == job and IsOnDuty()
                        end,
                        distance = 2
                    }
                },
            })
        end
    end

    if business.workbench then
        for _, workbenchZone in ipairs(business.workbench) do
            local uniqueName = "workbench" .. job .. "_" .. _
            exports.ox_target:addBoxZone({
                name = uniqueName,
                coords = workbenchZone.coords,
                size = vec3(workbenchZone.length, workbenchZone.width, workbenchZone.height),
                rotation = workbenchZone.heading,
                debug = business.debug,
                drawSprite = false,
                options = {
                    {
                        type = "client",
                        onSelect = function()
                            CraftMenu(job, Config.WorkbenchCrafting)
                        end,
                        label = workbenchZone.label,
                        icon = workbenchZone.icon,
                        canInteract = function(entity, distance, coords, name, bone)
                            return GetPlayerJob() == job and IsOnDuty()
                        end,
                        distance = 2
                    }
                },
            })
        end
    end

    if business.cuttingboard then
        for _, cuttingboardZone in ipairs(business.cuttingboard) do
            local uniqueName = "cuttingboard" .. job .. "_" .. _
            exports.ox_target:addBoxZone({
                name = uniqueName,
                coords = cuttingboardZone.coords,
                size = vec3(cuttingboardZone.length, cuttingboardZone.width, cuttingboardZone.height),
                rotation = cuttingboardZone.heading,
                debug = business.debug,
                drawSprite = false,
                options = {
                    {
                        type = "client",
                        onSelect = function()
                            CraftMenu(job, Config.CuttingBoardCrafting)
                        end,
                        label = cuttingboardZone.label,
                        icon = cuttingboardZone.icon,
                        canInteract = function(entity, distance, coords, name, bone)
                            return GetPlayerJob() == job and IsOnDuty()
                        end,
                        distance = 2
                    }
                },
            })
        end
    end

    if business.teleport then
        for _, teleportZone in ipairs(business.teleport) do
            local uniqueName = "teleport" .. job .. "_" .. _
            exports.ox_target:addBoxZone({
                name = uniqueName,
                coords = teleportZone.enter,
                size = vec3(teleportZone.length, teleportZone.width, teleportZone.height),
                rotation = teleportZone.heading,
                debug = business.debug,
                drawSprite = false,
                options = {
                    {
                        type = "client",
                        onSelect = function()
                            local canTeleport = lib.callback.await('cb-businesses:server:canTeleport', false, job)
                            if canTeleport then
                                TeleportPlayer(teleportZone.exit)
                            end
                        end,
                        label = teleportZone.label,
                        icon = teleportZone.icon,
                        canInteract = function(entity, distance, coords, name, bone)
                            return GetPlayerJob() == job
                        end,
                        distance = 2
                    }
                },
            })

            exports.ox_target:addBoxZone({
                name = uniqueName,
                coords = teleportZone.exit,
                size = vec3(teleportZone.length, teleportZone.width, teleportZone.height),
                rotation = teleportZone.heading,
                debug = business.debug,
                drawSprite = false,
                options = {
                    {
                        type = "client",
                        onSelect = function()
                            local canTeleport = lib.callback.await('cb-businesses:server:canTeleport', false, job)
                            if canTeleport then
                                TeleportPlayer(teleportZone.enter)
                            end
                        end,
                        label = teleportZone.label2,
                        icon = teleportZone.icon2,
                        canInteract = function(entity, distance, coords, name, bone)
                            return GetPlayerJob() == job
                        end,
                        distance = 2
                    }
                },
            })
        end
    end
end

-- Event handler to remove all stripper peds when the resource stops
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        for businessName, peds in pairs(JobPeds) do
            for _, ped in ipairs(peds) do
                if DoesEntityExist(ped) then
                    DeleteEntity(ped)
                end
            end
        end
    end
end)

RegisterNetEvent('cb-businesses:client:SpawnStrippers')
AddEventHandler('cb-businesses:client:SpawnStrippers', function(business)
    SpawnStrippersForPlayer(business)
end)

RegisterNetEvent("cb-businesses:client:PaymentVerification", function(amount, paymenttype, employeeId)
    local options = {
        { label = 'Approve', value = 'approve' },
        { label = 'Deny', value = 'deny' }
    }
  
    local input = lib.inputDialog('Payment Approval', {
        {type = 'select', label = 'Your bill is $' .. amount .. ' Approve or Deny?', options = options, required = true}
    })
  
    if input then
        local selectedOption = input[1]
        if selectedOption == 'approve' then
            TriggerServerEvent('cb-businesses:server:ProcessPayment', GetPlayerServerId(PlayerId()), employeeId, amount, paymenttype, true)
        elseif selectedOption == 'deny' then
            TriggerServerEvent('cb-businesses:server:ProcessPayment', GetPlayerServerId(PlayerId()), employeeId, amount, paymenttype, false)
        end
    else
        TriggerEvent('cb-businesses:client:PaymentVerification', amount, paymenttype, employeeId)
    end
end)

RegisterNetEvent('cb-businesses:client:DeletePed', function(ped)
    if DoesEntityExist(ped) then
        DeleteEntity(ped)
    end
end)