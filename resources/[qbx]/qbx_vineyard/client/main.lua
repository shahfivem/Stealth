local config = require 'config.client'
local sharedConfig = require 'config.shared'
local isLoggedIn = LocalPlayer.state.isLoggedIn

local function setLocationsBlip()
    if not config.useBlips then return end
    for _, value in pairs(config.locations) do
        local blip = AddBlipForCoord(value.coords.x, value.coords.y, value.coords.z)
        SetBlipSprite(blip, value.blipIcon)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.8)
        SetBlipAsShortRange(blip, true)
        SetBlipColour(blip, 83)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName(value.blipName)
        EndTextCommandSetBlipName(blip)
    end
end

local function pickProcess()
    if lib.progressBar({
        duration = math.random(6000, 8000),
        label = Lang:t('progress.pick_grapes'),
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = true,
            car = true,
            mouse = false,
            combat = true
        }
    }) then
        tasking = false
        TriggerServerEvent("qbx_vineyard:server:getGrapes")
    else
        exports.qbx_core:Notify(Lang:t('task.cancel_task'), 'error')
    end
    ClearPedTasks(cache.ped)
end

local function pickAnim()
    lib.playAnim(cache.ped, 'amb@prop_human_bum_bin@idle_a', 'idle_a', 6.0, -6.0, -1, 47, 0, 0, 0, 0)
end

local function toPickGrapes()
    if not IsPedInAnyVehicle(cache.ped, true) and IsControlJustReleased(0, 38) then
        pickAnim()
        pickProcess()
        random = 0
    end
end

local function wineProcessing()
    lib.callback('qbx_vineyard:server:grapeJuicesNeeded', false, function(result)
        if result then
            loadIngredients = true
            if lib.progressBar({
                duration = 5000,  -- Duration in milliseconds
                label = Lang:t('progress.process_wine'),  -- Label text
                showTime = true,  -- Show remaining time
                
                -- Animation Options
                anim = {
                    dict = 'mp_car_bomb',  -- Animation dictionary
                    clip = 'car_bomb_mechanic',  -- Animation clip
                    flag = 49  -- Animation flag
                },
                
                -- Disable Options
                canCancel = false,  -- Disable canceling (inverted logic for shah-progressbar)
                disable = {
                    move = true,  -- Prevent movement during the task
                    car = true    -- Prevent entering a vehicle during task
                }
            })
             then
                TriggerServerEvent('qbx_vineyard:server:receiveWine')
            else
                exports.qbx_core:Notify(Lang:t('task.cancel_task'), 'error')
            end
        else
            exports.qbx_core:Notify(Lang:t('error.invalid_items'), 'error')
        end
    end)
end

local function juiceProcessing()
    lib.callback('qbx_vineyard:server:grapesNeeded', false, function(result)
        if result then
            loadIngredients = true
            if lib.progressBar({
                duration = 5000,  -- Duration in milliseconds
                label = Lang:t('progress.process_juice'),  -- Label text
                showTime = true,  -- Show remaining time
                
                -- Animation Options
                anim = {
                    dict = 'mp_car_bomb',  -- Animation dictionary
                    clip = 'car_bomb_mechanic',  -- Animation clip
                    flag = 49  -- Animation flag
                },
                
                -- Disable Options
                canCancel = false,  -- Disable canceling (inverted logic for shah-progressbar)
                disable = {
                    move = true,  -- Prevent movement during the task
                    car = true    -- Prevent entering a vehicle during the task
                }
            })
             then
            TriggerServerEvent('qbx_vineyard:server:receiveGrapeJuice')
            else
                exports.qbx_core:Notify(Lang:t('task.cancel_task'), 'error')
            end
        else
            exports.qbx_core:Notify(Lang:t('error.invalid_items'), 'error')
        end
    end)
end


local function processingMenu()
    lib.registerContext({
        id = 'processingMenu',
        title = Lang:t('menu.title'),
        options = {
            {
                title = Lang:t('menu.process_wine_title'),
                description = Lang:t('menu.wine_items_needed', { amount = sharedConfig.grapeJuicesNeeded }),
                icon = 'wine-bottle',
                onSelect = function()
                    wineProcessing()
                end,
            },
            {
                title = Lang:t('menu.process_juice_title'),
                description = Lang:t('menu.juice_items_needed', { amount = sharedConfig.grapesNeeded }),
                icon = 'bottle-droplet',
                onSelect = function()
                    juiceProcessing()
                end,
            }
        }
    })

    lib.showContext('processingMenu')
end

lib.zones.box({
    coords = config.locations.vineyardProcessing.coords,
    size = vec3(1.6, 1.4, 3.2),
    rotation = 346.25,
    debug = config.debugPoly,
    onExit = function()
        lib.hideTextUI()
    end,
    onEnter = function ()
        lib.showTextUI(Lang:t('task.vineyard_processing'))
    end,
    inside = function()
        if IsControlJustReleased(0, 38) then
            processingMenu()
        end
    end,
})

for _, coords in pairs(config.grapeLocations) do
    lib.zones.box({
        coords = coords,
        size = vec3(1, 1, 1),
        rotation = 40,
        debug = config.debugPoly,
        onExit = function()
            lib.hideTextUI()
        end,
        onEnter = function()
            lib.showTextUI(Lang:t("task.start_task"))
        end,
        inside = toPickGrapes,
    })
end

local function init()
    setLocationsBlip()
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    init()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

CreateThread(function()
    if not isLoggedIn then return end
    init()
end)