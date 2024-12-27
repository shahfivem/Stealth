-- Define the lockdown state
local isLockdownActive = false

-- Function to update the target options dynamically
local function updateLockdownTarget()
    local label, event
    if isLockdownActive then
        label = "Turn Off Lockdown"
        event = 'erp-ambulance:unlockdown'
    else
        label = "Toggle Hospital Lockdown"
        event = 'erp-ambulance:lockdown'
    end

    exports.ox_target:removeZone('hospital_lockdown') -- Remove the old zone

    exports.ox_target:addBoxZone({
        name = 'hospital_lockdown', -- Unique name for the zone
        coords = vector3(313.17, -586.42, 43.19), -- Location of the BoxZone
        size = vec3(2, 2, 2), -- Dimensions
        rotation = 45, -- Rotation angle
        drawSprite = true, -- Visualization
        options = {
            { 
                event = event, -- Dynamic event based on state
                label = label, -- Dynamic label based on state
                groups = 'ambulance' -- Restrict to EMS group
            }
        },
        distance = 2.0 -- Interaction distance
    })
end

-- Event handler for initiating lockdown
AddEventHandler('erp-ambulance:lockdown', function()
    isLockdownActive = true
    local coords = vector3(313.65, -586.28, 43.27) -- Center of lockdown

    -- Dispatch alert for lockdown
    exports['ps-dispatch']:CustomAlert({
        message = 'Hospital Lockdown',
        code = '10-52A',
        icon = 'fas fa-bell',
        priority = 1,
        coords = coords,
        radius = 50, -- Radius of the alert blip
        sprite = 161, -- Blip sprite
        color = 1, -- Red blip color
        scale = 1.0, -- Blip size
        sound = { "erp-sounds:PlayWithinDistance", 10.0, "morse_2", 0.08 }, -- Sound configuration
        jobs = { 'ems', 'leo' } -- Target EMS and LEO for the alert
    })

    -- Trigger server event to lock doors
    TriggerServerEvent('hospital:lockdoors')

    -- Update the target to the unlock option
    updateLockdownTarget()
end)

-- Event handler for turning off lockdown
AddEventHandler('erp-ambulance:unlockdown', function()
    isLockdownActive = false

    -- Trigger server event to unlock doors
    TriggerServerEvent('hospital:unlockdoors')

    -- Update the target back to lockdown option
    updateLockdownTarget()
end)

-- Initialize the target options when the resource starts
CreateThread(function()
    updateLockdownTarget()
end)
