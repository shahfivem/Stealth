local currentTime = {hour = 11, minute = 0, day = 0}
local days = {
    [0] = 'SUNDAY',
    [1] = 'MONDAY',
    [2] = 'TUESDAY',
    [3] = 'WEDNESDAY',
    [4] = 'THURSDAY',
    [5] = 'FRIDAY',
    [6] = 'SATURDAY'
}

local function getTime(format)
    local hour = format and (currentTime.hour <= 9 and ('%i%i'):format(0, currentTime.hour)) or currentTime.hour
    local minute = format and (currentTime.minute <= 9 and ('%i%i'):format(0, currentTime.minute)) or currentTime.minute
    local day = format and days?[currentTime.day] or currentTime.day
    return {hour = hour, minute = minute, day = day}
end
exports('getTime', getTime)



-- Add Targets for Phone Booth Models
exports.ox_target:addModel({
    `prop_phonebox_04`,
    `prop_phonebox_01a`,
    `prop_phonebox_01b`,
    `p_phonebox_02_s`,
    `p_phonebox_01b_s`,
    `prop_phonebox_03`,
    `prop_phonebox_02`,
    `prop_phonebox_01c`,
    `prop_cs_phone_01`,
    `ch_chint02_phonebox001`,
    `sf_prop_sf_phonebox_01b_s`,
}, {
    {
        event = 'erp-script:payphone',
        label = 'Payphone',
        icon = 'phone',
        distance = 1.0,
        canInteract = function(entity)
            if Entity(entity).state.restricted then return false end
            return true
        end
    },
    {
        event = "erp-script:911call",
        label = "Call 911",
        icon = 'police',
        distance = 1.0,
        canInteract = function(entity)
            if Entity(entity).state.restricted then return false end
            return true
        end
    },
})

-- Payphone Call
AddEventHandler('erp-script:payphone', function()
    if LocalPlayer.state.isDead then return end

    -- Get Player's Phone Number
    local myPhoneNumber = exports.npwd:getPhoneNumber()

    -- Using Ox_lib inputDialog
    local keyboard = lib.inputDialog("Enter Number", {
        { type = "number", label = "Call Number #", placeholder = "Phone Number", required = true }
    })

    if keyboard then
        local number = tostring(keyboard[1]) -- Convert input to string for phone call
        if number then
            -- Check if the player is calling their own number
            if number == myPhoneNumber then
                lib.notify({ description = "You can't call yourself?", type = "error" })
                return
            end

            -- Start the phone call
            exports.npwd:startPhoneCall(number)
        else
            lib.notify({ description = "Please specify a valid number!", type = "inform" })
        end
    end
end)

-- 911 Call
AddEventHandler('erp-script:911call', function()
    -- Using Ox_lib inputDialog
    local keyboard = lib.inputDialog("Call 911", {
        { type = "textarea", label = "911 Call", placeholder = "Enter your message here...", required = true }
    })

    if keyboard then
        if keyboard[1] then
            -- Get Player's Location
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)

            -- Trigger Custom Alert for 911 Call
            exports['ps-dispatch']:CustomAlert({
                code = "911", -- Dispatch code
                message = keyboard[1], -- Message from the user input
                coords = playerCoords, -- Player's location
                priority = 1, -- Set priority for the alert
                gender = playerPed,
                firstStreet = playerCoords,
                radius = 50.0, -- Blip radius
                job = {"LEO", "police", "ambulance", "ems"}, -- Recipient jobs
                sprite = 280, -- Blip sprite
                color = 3, -- Blip color
                scale = 1.0, -- Blip scale
                length = 5, -- Blip length in minutes
                sound = "Lose_1st", -- Sound for alert
                sound2 = "GTAO_FM_Events_Soundset", -- Sound set
                flash = true, -- Blip flashing
            })

            -- Notify User
            lib.notify({ description = "Your 911 call has been processed!", type = "success" })
        end
    end
end)


-- Scheduled Restart Notifications
RegisterNetEvent('strez:client:SendMailTsunamiAuto', function(minutes)
    local message = ("Scheduled server restart in %d minute(s). Please save your progress!"):format(minutes)
    local secondaryTitle = ("Tsunami Alert: %d Minute(s) Remaining"):format(minutes)

    exports["npwd"]:createSystemNotification({
        uniqId = "tsunamiAlert_" .. minutes,
        content = message,
        secondaryTitle = secondaryTitle,
        keepOpen = false,
        duration = 15000, -- 15 seconds
        controls = false
    })
end)

-- Player Warned Notification
RegisterNetEvent('strez:client:PlayerWarned', function(eventData)
    local content = ("Warning: %s"):format(eventData.reason)
    local secondaryTitle = "Admin Warning"

    exports["npwd"]:createSystemNotification({
        uniqId = "playerWarned_" .. eventData.issuerName,
        content = content,
        secondaryTitle = secondaryTitle,
        keepOpen = false,
        duration = 10000, -- 10 seconds
        controls = false
    })
end)

-- Announcement Notification
RegisterNetEvent('strez:client:Announcement', function(eventData)
    local content = eventData.message
    local secondaryTitle = "Server Announcement"

    exports["npwd"]:createSystemNotification({
        uniqId = "serverAnnouncement",
        content = content,
        secondaryTitle = secondaryTitle,
        keepOpen = false,
        duration = 15000, -- 15 seconds
        controls = false
    })
end)

-- Player Direct Message Notification
RegisterNetEvent('strez:client:DirectMessage', function(eventData)
    local content = ("Direct Message from %s: %s"):format(eventData.issuerName, eventData.message)
    local secondaryTitle = "Admin Message"

    exports["npwd"]:createNotification({
        notisId = "playerDirectMessage_" .. eventData.issuerName,
        appId = "MESSAGES",
        content = content,
        secondaryTitle = secondaryTitle,
        keepOpen = false,
        duration = 10000, -- 10 seconds
        path = "/messages" -- Example path, adjust as needed
    })
end)
