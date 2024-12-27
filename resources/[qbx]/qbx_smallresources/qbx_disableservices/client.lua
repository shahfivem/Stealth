local config = lib.loadJson('qbx_disableservices.config')

CreateThread(function()
    for key, value in ipairs(config.enabledServices) do
        EnableDispatchService(key, value)
    end

    SetMaxWantedLevel(config.maxWantedLevel)
end)


-- Add an event handler for the txAdmin scheduled restart event
AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    -- Check if the remaining time is 1800 seconds (30 minutes)
    if eventData.secondsRemaining == 1800 then
        -- Format the remaining time as a more readable format, if needed
        local restartTime = "in 30 minutes"

        -- Create the system notification using NPWD's API
        exports["npwd"]:createSystemNotification({
            uniqId = "txAdminRestart30Min",
            content = "Server will restart " .. restartTime,
            secondaryTitle = "Server Restart Notice",
            keepOpen = false, -- Close the notification automatically after the duration ends
            duration = 10000, -- Duration in milliseconds (10 seconds)
            controls = false -- Set to true if you want users to interact with confirmation/cancel actions
        })
    end
end)

-- Add an event handler for the txAdmin scheduled restart event
AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    -- Check if the remaining time is 1800 seconds (30 minutes)
    if eventData.secondsRemaining == 900 then
        -- Format the remaining time as a more readable format, if needed
        local restartTime = "in 15 minutes"

        -- Create the system notification using NPWD's API
        exports["npwd"]:createSystemNotification({
            uniqId = "txAdminRestart15Min",
            content = "Server will restart " .. restartTime,
            secondaryTitle = "Server Restart Notice",
            keepOpen = false, -- Close the notification automatically after the duration ends
            duration = 10000, -- Duration in milliseconds (10 seconds)
            controls = false -- Set to true if you want users to interact with confirmation/cancel actions
        })
    end
end)

-- Add an event handler for the txAdmin scheduled restart event
AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    if eventData.secondsRemaining == 300 then
        -- Format the remaining time as a more readable format, if needed
        local restartTime = "in 5 minutes"

        -- Create the system notification using NPWD's API
        exports["npwd"]:createSystemNotification({
            uniqId = "txAdminRestart5Min",
            content = "Server will restart " .. restartTime,
            secondaryTitle = "Server Restart Notice",
            keepOpen = false, -- Close the notification automatically after the duration ends
            duration = 10000, -- Duration in milliseconds (10 seconds)
            controls = false -- Set to true if you want users to interact with confirmation/cancel actions
        })
    end
end)

AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    if eventData.secondsRemaining == 60 then
        -- Format the remaining time as a more readable format, if needed
        local restartTime = "in 1 minute"

        -- Create the system notification using NPWD's API
        exports["npwd"]:createSystemNotification({
            uniqId = "txAdminRestart1Min",
            content = "Server will restart " .. restartTime,
            secondaryTitle = "Server Restart Notice",
            keepOpen = false, -- Close the notification automatically after the duration ends
            duration = 10000, -- Duration in milliseconds (10 seconds)
            controls = false -- Set to true if you want users to interact with confirmation/cancel actions
        })
    end
end)