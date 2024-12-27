RegisterCommand("id", function(source, args, rawCommand)
    -- Get the player's identifiers
    local idens = GetPlayerIdentifiers(source)
    local playerIdentifier = idens[2] -- Use the first identifier (usually Steam or license ID)

    -- Get the userId for the player
    local userId = exports.qbx_core:GetUserId(playerIdentifier)

    if userId == 0 then
        TriggerClientEvent('chat:addMessage', source, {
            args = { "System", "Player not found!" }
        })
    else
        TriggerClientEvent('chat:addMessage', source, {
            args = { "System", "Your CID is: " .. userId }
        })
    end
end, false)

-- Event Handlers for txAdmin Scheduled Restart Notifications
AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    if eventData.secondsRemaining == 1800 then
        TriggerClientEvent('strez:client:SendMailTsunamiAuto', -1, 30)
    elseif eventData.secondsRemaining == 900 then
        TriggerClientEvent('strez:client:SendMailTsunamiAuto', -1, 15)
    elseif eventData.secondsRemaining == 300 then
        TriggerClientEvent('strez:client:SendMailTsunamiAuto', -1, 5)
    elseif eventData.secondsRemaining == 60 then
        TriggerClientEvent('strez:client:SendMailTsunamiAuto', -1, 1)
    end
end)

AddEventHandler('txAdmin:events:playerWarned', function(eventData)
    TriggerClientEvent('strez:client:PlayerWarned', eventData.target, eventData)
end)

-- Announcement Notification
AddEventHandler('txAdmin:events:announcement', function(eventData)
    TriggerClientEvent('strez:client:Announcement', -1, eventData)
end)

-- Player Direct Message Notification
AddEventHandler('txAdmin:events:playerDirectMessage', function(eventData)
    TriggerClientEvent('strez:client:DirectMessage', eventData.target, eventData)
end)