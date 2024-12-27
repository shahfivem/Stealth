-- Check if ox_inventory is running
local ox_inv = GetResourceState('ox_inventory') == 'started'

-- Initialize ox_lib progress bar type
local progressType = Config.ProgressType == 'bar' and 'progressBar' or 'progressCircle'

-- Function to show a notification
--- @param message string
--- @param type string
ShowNotification = function(message, type)
    if Config.Notify == 'ox_lib' then
        lib.notify({ title = 'Chop Shop', description = message, type = 'inform', position = 'top', icon = 'fas fa-car-burst' })
    elseif Config.Notify == 'esx' then
        ESX.ShowNotification(message)
    elseif Config.Notify == 'qb' then
        QBCore.Functions.Notify(message, type)
    elseif Config.Notify == 'okok' then
        exports['okokNotify']:Alert('Chop Shop', message, 5000, type, false)
    elseif Config.Notify == 'sd-notify' then
        exports['sd-notify']:Notify('Chop Shop', message, type)
    elseif Config.Notify == 'wasabi_notify' then
        exports.wasabi_notify:notify('Chop Shop', message, 5000, type, false, 'fas fa-car-burst')
    elseif Config.Notify == 'custom' then
        -- Add custom notification export/event here
    end
end

-- Event handler for sending notifications from server
--- @param message string
--- @param type string
RegisterNetEvent('lation_chopshop:Notify', function(message, type)
    ShowNotification(message, type)
end)

-- Empty function that is ran before executing "Request a Job" option
-- Allows you to write in your own customize requirements, etc
-- Simply return true if your conditions are met, or return false to reject
CanRequestJob = function()
    return true
end

-- Empty function that is triggered at the start of "Request a Job"
-- Before a job is actually assigned
WaitingForJob = function()

end

-- Empty function that's triggered when a vehicle has been assigned
-- Via the "Request a Job" menu option
--- @param vehicle table .spawnName & .label
--- @param coords vector3 | vector4 Position car will be spawned
JobAssigned = function(vehicle, coords)

end

-- Function that's triggered when Request a Job vehicle is spawned
-- This is where the vehicle doors should be set to locked
--- @param vehicle number entity
RequestJobVehicleSpawned = function(vehicle)
    SetVehicleDoorsLocked(vehicle, 2)
end

-- Empty function that's triggered once a vehicle/job has been completed
-- This will be triggered when the vehicle's frame is chopped
--- @param model string Vehicle model
JobCompleted = function(model)

end

-- Empty function that's triggered when player has started chopping process
-- Can be used for things like disabling inventory, etc
StartChopping = function()
    -- Below are some examples:
    -- qs-inventory: exports['qs-inventory']:setInventoryDisabled(true)
    -- ox_inventory: LocalPlayer.state.invBusy = true
    -- qb-inventory: LocalPlayer.state.inv_busy = true
end

-- Empty function that's triggered when player has finished chopping process
-- Can be used for things like disabling inventory, etc
FinishChopping = function()
    -- Below are some examples:
    -- qs-inventory: exports['qs-inventory']:setInventoryDisabled(false)
    -- ox_inventory: LocalPlayer.state.invBusy = false
    -- qb-inventory: LocalPlayer.state.inv_busy = false
end

-- Empty function that's triggered when a contract has started
--- @param coords vector4 Position at which the vehicle is spawned
--- @param driver number The driver's entity ID
--- @param vehicle number The vehicle's entity ID
--- @param model string The vehicle spawn name, data can be accessed via Config.Vehicles[model]
--- @param isSale boolean True if it's a selling contract, false if chopping
ContractStarted = function(coords, driver, vehicle, model, isSale)

end

-- Empty function that's triggered when a player succesfully obtained contract vehicle
--- @param vehicle number Entity ID
--- @param model string Vehicle spawn name, data can be accessed via Config.Vehicles[model]
--- @param isSale boolean True if it's a selling contract, false if chopping
VehicleHijacked = function(vehicle, model, isSale)

end

-- Function that's triggered when a vehicle is succesfully lockpicked
-- Used to improve car lock system compatibility by giving the player keys
--- @param vehicle number
--- @param netId number | nil
GiveKeys = function(vehicle, netId)
    if not vehicle then return end
    -- Get vehicle plate & model
    local plate = GetVehicleNumberPlateText(vehicle)
    local model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
    -- Check if wasabi_carlock is running
    if GetResourceState('wasabi_carlock') == 'started' then
        exports.wasabi_carlock:GiveKey(plate)
    end
    -- Check if okokGarage is running
    if GetResourceState('okokGarage') == 'started' then
        TriggerServerEvent("okokGarage:GiveKeys", plate)
    end
    -- Check if qb-vehiclekeys is running
    if GetResourceState('qb-vehiclekeys') == 'started' then
        TriggerEvent('qb-vehiclekeys:client:AddKeys', plate)
    end
    -- Check if qs-vehiclekeys is running
    if GetResourceState('qs-vehiclekeys') == 'started' then
        exports['qs-vehiclekeys']:GiveKeys(plate, model, true)
    end
    -- Check if qbx_vehiclekeys is running
    if GetResourceState('qbx_vehiclekeys') == 'started' then
        TriggerEvent('qb-vehiclekeys:client:AddKeys', plate)
    end
    -- Check if cd_garage is running
    if GetResourceState('cd_garage') == 'started' then
        TriggerEvent('cd_garage:AddKeys', exports['cd_garage']:GetPlate(vehicle))
    end
    -- Check if Renewed-Vehiclekeys is running
    if GetResourceState('Renewed-Vehiclekeys') == 'started' then
        exports['Renewed-Vehiclekeys']:addKey(plate)
    end
    -- Check if jaksam's vehicles_keys is running
    if GetResourceState('vehicles_keys') == 'started' then
        TriggerServerEvent('vehicles_keys:selfGiveVehicleKeys', plate)
    end
    -- Check if t1ger_keys is running
    if GetResourceState('t1ger_keys') == 'started' then
        TriggerServerEvent('t1ger_keys:updateOwnedKeys', plate, true)
    end
end

-- Function to process vehicle hacking
--- @param data table .difficulty, .inputs
Lockpick = function(data)
    if lib.skillCheck(data.difficulty, data.inputs) then
        return true
    end
    return false
end

-- Function to process part chopping
--- @param data table .difficulty, .inputs
ChopPart = function(data)
    if lib.skillCheck(data.difficulty, data.inputs) then
        return true
    end
    return false
end

-- Function to handle progress bar
--- @param data table Config.Animations.X
function ProgressBar(data)
    if Config.ProgressType == 'ox_lib' then
        if lib.progressCircle({
            label = data.label,
            duration = data.duration,
            position = data.position or 'bottom',
            useWhileDead = data.useWhileDead,
            canCancel = data.canCancel,
            disable = data.disable,
            anim = {
                dict = data.anim.dict or nil,
                clip = data.anim.clip or nil,
                flag = data.anim.flag or nil
            },
            prop = {
                model = data.prop.model or nil,
                bone = data.prop.bone or nil,
                pos = data.prop.pos or nil,
                rot = data.prop.rot or nil
            }
        }) then
            return true
        end
        return false

    elseif Config.ProgressType == 'qbcore' then
        local complete = false
        QBCore.Functions.Progressbar(data.label, data.label, data.duration, data.useWhileDead, data.canCancel, {
            disableMovement = data.disable.move,
            disableCarMovement = data.disable.car,
            disableMouse = false,
            disableCombat = data.disable.combat
        }, {
            animDict = data.anim.dict or nil,
            anim = data.anim.clip or nil,
            flags = data.anim.flag or nil
        }, {
            model = data.prop.model or nil,
            bone = data.prop.bone or nil,
            coords = data.prop.pos or nil,
            rotation = data.prop.rot or nil
        }, {},
        function()
            complete = true
        end,
        function()
            complete = false
        end)
        Wait(data.duration + 500)
        return complete

    elseif Config.ProgressType == 'custom' then
        -- Custom Progress Bar using `erp_progressbar:taskBar` export
        local progress = exports['shah-progressbar']:taskBar({
            length = data.length or 5000, -- Duration in ms
            text = data.text or "Performing task...", -- Text to display
            runcheck = data.runcheck or true, -- Prevents running if true
            ignoreclear = data.ignoreclear or true, -- Whether to ignore clearing tasks
            keepweapon = data.keepweapon or false, -- Keeps current weapon equipped
            vehicle = data.vehicle or false, -- Checks if the player is in a vehicle
            distcheck = data.distcheck or 5.0, -- Maximum distance allowed from start point
            animation = {
                dict = data.anim.dict or nil,
                anim = data.anim.clip or nil,
                flag = data.anim.flag or 49 -- Default animation flag
            },
            preventCancel = data.preventCancel or true, -- Disables cancel with the cancel key
            showTime = data.showTime or false -- Shows remaining time
        })

        -- The taskBar function should return 100 if completed
        return progress == 100

    else
        print("Invalid progress setup defined in Config.ProgressType.")
        return false
    end
end

-- Function to return if a player can see chop targets on vehicle
--- @param isChopping boolean
ChopCanInteract = function(isChopping)
    local isDead = IsPedDeadOrDying(cache.ped, true)
    if isChopping or isDead then
        return false
    end
    return true
end

-- Function to handle sending a message to specific phone
--- @param data table title, subject, sender, name, content
SendPhoneMessage = function(data)
    if Config.Phone == 'qb-phone' then
        TriggerServerEvent('lation_chopshop:phoneMessage', cache.serverId, data)
    elseif Config.Phone == 'npwd' then
        local number = exports.npwd:getPhoneNumber()
        TriggerServerEvent('lation_chopshop:phoneMessage', cache.serverId, data, number)
    elseif Config.Phone == 'qs-smartphone' then
        TriggerServerEvent('lation_chopshop:phoneMessage', cache.serverId, data)
    elseif Config.Phone == 'qs-smartphonepro' then
        local message = { sender = data.sender, subject = data.subject, message = data.content }
        TriggerServerEvent('phone:sendNewMail', message)
    elseif Config.Phone == 'lb-phone' then
        TriggerServerEvent('lation_chopshop:phoneMessage', cache.serverId, data)
    elseif Config.Phone == 'gksphone' then
        local number = exports["gksphone"]:PhoneNumber()
        TriggerServerEvent('lation_chopshop:phoneMessage', cache.serverId, data, number)
    elseif Config.Phone == 'yseries' then
        TriggerServerEvent('lation_chopshop:phoneMessage', cache.serverId, data)
    elseif Config.Phone == 'roadphone' then
        local message = { sender = data.sender, subject = data.subject, message = data.content }
        exports['roadphone']:sendMail(message)
    elseif Config.Phone == 'custom' then
        local number exports.high_phone:getPhoneNumber()
        TriggerServerEvent('lation_chopshop:phoneMessage', cache.serverId, data, number)
    end
end

-- Function used for police dispatch systems
--- @param data table .entity, .coords, .model, .color, .street
PoliceDispatch = function(data)
    if not data then print('Failed to retrieve dispatch data, cannot proceed.') return end
    if Config.Police.dispatch == 'cd_dispatch' then
        local playerData = exports['cd_dispatch']:GetPlayerInfo()
        if not playerData then
            print('cd_dispatch failed to return playerData, cannot proceed.')
            return
        end
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = Config.Police.jobs,
            coords = data.coords,
            title = '10-87 - Reported Stolen Vehicle',
            message = 'An anonymous caller has reported a possible stolen ' ..data.color.. ' ' ..data.model.. ' near ' ..data.street,
            flash = 0,
            unique_id = playerData.unique_id,
            sound = 1,
            blip = {
                sprite = 225,
                scale = 1.0,
                colour = 1,
                flashes = false,
                text = '10-37 | Reported Stolen Vehicle',
                time = 5,
                radius = 0,
            }
        })
    elseif Config.Police.dispatch == 'ps-dispatch' then
        local alert = {
            coords = data.coords,
            message = 'An anonymous caller has reported a possible stolen ' ..data.color.. ' ' ..data.model.. ' near ' ..data.street,
            dispatchCode = "10-37 | Reported Stolen Vehicle",
            description = "Reported Stolen Vehicle",
            radius = 0,
            sprite = 225,
            color = 1,
            scale = 1.0,
            length = 3,
        }
        exports["ps-dispatch"]:CustomAlert(alert)
    elseif Config.Police.dispatch == 'qs-dispatch' then
        local playerData = exports['qs-dispatch']:GetPlayerInfo()
        if not playerData then
            print('qs-dispatch failed to return playerData, cannot proceed.')
            return
        end
        exports['qs-dispatch']:getSSURL(function(image)
            TriggerServerEvent('qs-dispatch:server:CreateDispatchCall', {
                job = Config.Police.jobs,
                callLocation = data.coords,
                callCode = { code = '10-37', snippet = 'Reported Stolen Vehicle' },
                message = 'An anonymous caller has reported a possible stolen ' ..data.color.. ' ' ..data.model.. ' near ' ..data.street,
                flashes = false,
                image = image or nil,
                blip = {
                    sprite = 225,
                    scale = 1.0,
                    colour = 1,
                    flashes = true,
                    text = 'Reported Stolen Vehicle',
                    time = (6 * 60 * 1000),
                }
            })
        end)
    elseif Config.Police.dispatch == 'core_dispatch' then
        local gender = IsPedMale(cache.ped) and 'male' or 'female'
        TriggerServerEvent('core_dispatch:addCall', '10-37', 'Reported Stolen Vehicle',
        {{icon = 'fa-venus-mars', info = gender}},
        {data.coords.x, data.coords.y, data.coords.z},
        'police', 30000, 225, 1, false)
    elseif Config.Police.dispatch == 'rcore_dispatch' then
        local playerData = exports['rcore_dispatch']:GetPlayerData()
        if not playerData then
            print('rcore_dispatch failed to return playerData, cannot proceed.')
            return
        end
        exports['screenshot-basic']:requestScreenshotUpload('InsertWebhookLinkHERE', "files[]", function(val)
            local image = json.decode(val)
            local alert = {
                code = '10-37 | Reported Stolen Vehicle',
                default_priority = 'low',
                coords = data.coords,
                job = Config.Police.jobs,
                text = 'An anonymous caller has reported a possible stolen ' ..data.color.. ' ' ..data.model.. ' near ' ..data.street,
                type = 'alerts',
                blip_time = 30,
                image = image.attachments[1].proxy_url,
                blip = {
                    sprite = 225,
                    colour = 1,
                    scale = 1.0,
                    text = '10-37 | Reported Stolen Vehicle',
                    flashes = false,
                    radius = 0,
                }
            }
            TriggerServerEvent('rcore_dispatch:server:sendAlert', alert)
        end)
    elseif Config.Police.dispatch == 'aty_dispatch' then
        TriggerEvent('aty_dispatch:SendDispatch', 'Reported Stolen Vehicle', '10-37', 225, Config.Police.jobs)
    elseif Config.Police.dispatch == 'op-dispatch' then
        local job = 'police'
        local text = 'An anonymous caller has reported a possible stolen ' ..data.color.. ' ' ..data.model.. ' near ' ..data.street
        local coords = data.coords
        local id = cache.serverId
        local title = '10-37 | Reported Stolen Vehicle'
        local panic = false
        TriggerServerEvent('Opto_dispatch:Server:SendAlert', job, title, text, coords, panic, id)
    elseif Config.Police.dispatch == 'origen_police' then
        local alert = {
            coords = data.coords,
            title = '10-37 | Reported Stolen Vehicle',
            type = 'GENERAL',
            message = 'An anonymous caller has reported a possible stolen ' ..data.color.. ' ' ..data.model.. ' near ' ..data.street,
            job = Config.Police.jobs,
        }
        TriggerServerEvent("SendAlert:police", alert)
    elseif Config.Police.dispatch == 'emergencydispatch' then
        TriggerServerEvent('emergencydispatch:emergencycall:new', Config.Police.jobs, '10-37 | Reported Stolen Vehicle', data.coords, true)
    elseif Config.Police.dispatch == 'custom' then
        -- Add your custom dispatch system here
    else
        -- No dispatch system was found
        print('No dispatch system was identified - please update your Config.Police.dispatch')
    end
end

-- Function used to apply target to bone(s)
--- @param entity number
--- @param bone string
--- @param option table
AddTargetBone = function(entity, bone, option)
    if Config.Target == 'ox_target' then
        exports.ox_target:addLocalEntity(entity, option)
    elseif Config.Target == 'qb-target' then
        exports['qb-target']:AddTargetBone(bone, {options = option, distance = 2.0})
    elseif Config.Target == 'qtarget' then
        exports.qtarget:AddTargetBone(bone, {options = option, distance = 2.0})
    elseif Config.Target == 'custom' then
        -- Add support for a custom target system here
    else
        print('No target system defined in the config file.')
    end
end

-- Function used to remove target from bone(s)
--- @param entity number
--- @param bone string
--- @param option table | any
RemoveTargetBone = function(entity, bone, option)
    if Config.Target == 'ox_target' then
        exports.ox_target:removeLocalEntity(entity, option)
    elseif Config.Target == 'qb-target' then
        exports['qb-target']:RemoveTargetBone(bone, option)
    elseif Config.Target == 'qtarget' then
        exports.qtarget:RemoveTargetBone(bone, option)
    elseif Config.Target == 'custom' then
        -- Add support for a custom target system here
    else
        print('No target system defined in the config file.')
    end
end

-- Add target to entity
--- @param entity number Entity number
--- @param data table Options table
AddTargetEntity = function(entity, data)
    if Config.Target == 'ox_target' then
        exports.ox_target:addLocalEntity(entity, data)
    elseif Config.Target == 'qb-target' then
        exports['qb-target']:AddTargetEntity(entity, {options = data, distance = 2.0})
    elseif Config.Target == 'qtarget' then
        exports.qtarget:AddTargetEntity(entity, {options = data, distance = 2.0})
    elseif Config.Target == 'custom' then
        -- Add support for a custom target system here
    else
        print('No target system defined in the config file.')
    end
end

-- Remove target from entity
--- @param entity number
--- @param data table|string|nil
RemoveTargetEntity = function(entity, data)
    if Config.Target == 'ox_target' then
        exports.ox_target:removeLocalEntity(entity, data)
    elseif Config.Target == 'qb-target' then
        exports['qb-target']:RemoveTargetEntity(entity, nil)
    elseif Config.Target == 'qtarget' then
        exports.qtarget:RemoveTargetEntity(entity, data)
    elseif Config.Target == 'custom' then
        -- Add support for a custom target system here
    else
        print('No target system defined in the config file.')
    end
end

-- Function that returns true or false if player has item
--- @param item string
--- @param amount number
HasItem = function(item, amount)
    if not item then return end
    if ox_inv then
        local count = exports.ox_inventory:Search('count', item)
        if count >= amount then
            return true
        end
        return false
    end
    if Framework == 'esx' then
        if not ESX.GetPlayerData() or not ESX.GetPlayerData().inventory then
            return false
        end
        local inventory = ESX.GetPlayerData().inventory
        for _, itemData in pairs(inventory) do
            if itemData.name == item then
                local count = itemData.count or itemData.amount
                if count >= amount then
                    return true
                end
            end
        end
        return false
    elseif Framework == 'qb' then
        local PlayerData = QBCore.Functions.GetPlayerData()
        if not PlayerData or not PlayerData.items then
            return false
        end
        for _, itemData in pairs(PlayerData.items) do
            if itemData and itemData.name == item then
                local count = itemData.amount or itemData.count
                if count >= amount then
                    return true
                end
            end
        end
        return false
    else
        -- Add support for a custom framework here
    end
end

-- Function to spawn NPCs
--- @param model string
--- @param position vector4
SpawnNPC = function(model, position)
    lib.requestModel(model)
    while not HasModelLoaded(model) do Wait(0) end
    local ped = CreatePed(0, model, position.x, position.y, position.z - 1.0, position.w, false, true)
    FreezeEntityPosition(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    return ped
end

-- Function to print events to console if debug enabled
--- @param string string
EventLog = function(string)
    if not Config.Debug or not string then return end
    print(string)
end