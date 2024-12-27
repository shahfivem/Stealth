-- Display a notification
--- @param message string
--- @param type string
function ShowNotification(message, type)
    if Config.Setup.notify == 'ox_lib' then
        lib.notify({ title = 'Metal Detecting', description = message, type = type, position = 'top', icon = 'fas fa-magnifying-glass' })
    elseif Config.Setup.notify == 'esx' then
        ESX.ShowNotification(message)
    elseif Config.Setup.notify == 'qb' then
        QBCore.Functions.Notify(message, type)
    elseif Config.Setup.notify == 'okok' then
        exports['okokNotify']:Alert('Metal Detecting', message, 5000, type, false)
    elseif Config.Setup.notify == 'sd-notify' then
        exports['sd-notify']:Notify('Metal Detecting', message, type)
    elseif Config.Setup.notify == 'wasabi_notify' then
        exports.wasabi_notify:notify('Metal Detecting', message, 5000, type, false, 'fas fa-magnifying-glass')
    elseif Config.Setup.notify == 'custom' then
        -- Add custom notification export/event here
    end
end

-- Event handler for sending notifications from server
--- @param message string
--- @param type string
RegisterNetEvent('lation_detecting:Notify', function(message, type)
    ShowNotification(message, type)
end)

-- Display TextUI
--- @param text string 
--- @param icon string
function ShowTextUI(text, icon)
    lib.showTextUI(text, {
        position = 'left-center',
        icon = icon
    })
end

-- Hide TextUI
--- @param label string
function HideTextUI(label)
    local isOpen, text = lib.isTextUIOpen()
    if isOpen and text == label then
        lib.hideTextUI()
    end
end

-- Empty function that's triggered when a player begins detecting
-- Can be used for things like disabling inventory, etc
function StartedDetecting()
    -- DisableInventory()
end

-- Empty function that's triggered when a player stops detecting
-- Can be used for things like re-enabling inventory, etc
function StoppedDetecting()
    -- EnableInventory()
end

-- Empty function that's triggered when a player begins digging
-- Can be used for things like disabling inventory, etc
function StartedDigging()
    -- DisableInventory()
end

-- Empty function that's triggered when a player stops digging
-- Can be used for things like re-enabling inventory, etc
function StoppedDigging()
    -- EnableInventory()
end

-- Add target to entity
--- @param entity number Entity number
--- @param data table Options table
function AddTargetEntity(entity, data)
    if Config.Setup.interact == 'ox_target' then
        exports.ox_target:addLocalEntity(entity, data)
    elseif Config.Setup.interact == 'qb-target' then
        exports['qb-target']:AddTargetEntity(entity, {options = data, distance = 2})
    elseif Config.Setup.interact == 'interact' then
        exports.interact:AddLocalEntityInteraction({
            entity = entity,
            interactDst = 2.0,
            offset = vec3(0.0, 0.0, 1.0),
            options = data
        })
    elseif Config.Setup.interact == 'textui' then
        -- TextUI is being used
    elseif Config.Setup.interact == 'custom' then
        -- Add support for a custom target system here
    else
        print('No interaction system defined in the config file.')
    end
end

-- Remove target from entity
--- @param entity any|number Entity number
--- @param data table|string Options table or table name
function RemoveTargetEntity(entity, data)
    if Config.Setup.interact == 'ox_target' then
        exports.ox_target:removeLocalEntity(entity, data)
    elseif Config.Setup.interact == 'qb-target' then
        exports.qtarget:RemoveTargetEntity(entity, data)
    elseif Config.Setup.interact == 'interact' then
        exports.interact:RemoveLocalEntityInteraction(entity, data)
    elseif Config.Setup.interact == 'textui' then
        -- TextUI is being used
    elseif Config.Setup.interact == 'custom' then
        -- Add support for a custom target system here
    else
        print('No interaction system defined in the config file.')
    end
end

-- Function used to spawn NPCs
--- @param model string
--- @param coords vector3 | vector4
function SpawnNPC(model, coords)
    lib.requestModel(model)
    while not HasModelLoaded(model) do Wait(0) end
    local ped = CreatePed(0, model, coords.x, coords.y, coords.z, coords.w, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetPedFleeAttributes(ped, 0, false)
    SetEntityInvincible(ped, true)
    SetPedCanRagdoll(ped, false)
    SetEntityProofs(ped, true, true, true, true, true, true, true, true)
    FreezeEntityPosition(ped, true)
    SetModelAsNoLongerNeeded(model)
    return ped
end

-- Returns interval at which to play detecting sound
--- @param distance number
function GetBeepTime(distance)
    if distance < 15 then
        return math.floor(distance) * 150
    elseif distance < 20 then
        return 2000
    elseif distance < 25 then
        return 2500
    elseif distance < 30 then
        return 3000
    else
        return 3500
    end
end

-- Function used to print events if Config.Setup.debug is enabled
--- @param string string Event message
function EventLog(string)
    if not string or not Config.Setup.debug then return end
    print(string)
end