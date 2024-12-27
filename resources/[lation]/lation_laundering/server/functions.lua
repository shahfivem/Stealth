-- Event handler to process sending a text/email to phone(s)
RegisterNetEvent('lation_laundering:phoneMessage', function(source, number)
    if not source then return end
    local source = source

    if Config.Phone == 'qb-phone' then
        local identifier = GetIdentifier(source)
        local message = { sender = Strings.Phone.sender, subject = Strings.Phone.subject, message = Strings.Phone.message }
        exports['qb-phone']:sendNewMailToOffline(identifier, message)
    elseif Config.Phone == 'npwd' then
        exports.npwd:emitMessage({
            senderNumber = math.random(1000000, 9999999),
            targetNumber = number,
            message = Strings.Phone.message
        })
    elseif Config.Phone == 'qs-smartphone' then
        local identifier = GetIdentifier(source)
        local data = { sender = Strings.Phone.sender, subject = Strings.Phone.subject, message = Strings.Phone.message }
        TriggerEvent('qs-smartphone:server:sendNewMailToOffline', identifier, data)
    elseif Config.Phone == 'qs-smartphonepro' then
        -- Handled on client side, nothing needed here
    elseif Config.Phone == 'lb-phone' then
        local phoneNumber = exports["lb-phone"]:GetEquippedPhoneNumber(source)
        local email = exports["lb-phone"]:GetEmailAddress(phoneNumber)
        local data = { to = email, subject = Strings.Phone.subject, message = Strings.Phone.message }
        exports["lb-phone"]:SendMail(data)
    elseif Config.Phone == 'gksphone' then
        local identifier = GetIdentifier(source)
        local data = { sender = Strings.Phone.sender, image = '/html/static/img/icons/mail.png', subject = Strings.Phone.subject, message = Strings.Phone.message }
        exports["gksphone"]:SendNewMailOffline(identifier, data)
    elseif Config.Phone == 'yseries' then
        local identifier = GetIdentifier(source)
        local phoneNumber = exports["yseries"]:GetPhoneNumberByIdentifier(identifier)
        local data = { title = Strings.Phone.title, sender = Strings.Phone.sender, senderDisplayName = Strings.Phone.name, content = Strings.Phone.message }
        exports["yseries"]:SendMail(data, 'phoneNumber', phoneNumber)
    elseif Config.Phone == 'custom' then
        exports.high_phone:sendMessageToNumber(number, Strings.Phone.sender, Strings.Phone.message, nil) -- nil for attachments if not needed
    end
end)

-- Function used to return a total count of all police online
PoliceCount = function()
    local jobCount = 0
    if Framework == 'esx' then
        for _, player in pairs(ESX.GetExtendedPlayers()) do
            local job = player.getJob()
            for _, jobs in pairs(Config.Police.jobs) do
                local jobNames = jobs
                if job.name == jobNames then
                    jobCount = jobCount + 1
                end
            end
        end
    elseif Framework == 'qb' then
        for _, players in pairs(QBCore.Functions.GetPlayers()) do
            local player = QBCore.Functions.GetPlayer(players)
            local job = player.PlayerData.job
            for _, jobs in pairs(Config.Police.jobs) do
                local jobNames = jobs
                if job.name == jobNames and player.PlayerData.job.onduty then
                    jobCount = jobCount + 1
                end
            end
        end
    else
        -- Add support for a custom framework here
    end
    return jobCount
end

-- Function that produces Discord Webhook logs
--- @param link string Webhook link
--- @param title string Title of the log
--- @param message string Message contents
--- @param color number Decimal value embed color
DiscordLogs = function(link, title, message, color)
    local embed = {{["color"] = color, ["title"] = "**".. title .."**", ["description"] = message, ["footer"] = {["text"] = os.date("%a %b %d, %I:%M%p"), ["icon_url"] = Logs.Footer}}}
    PerformHttpRequest(link, function(err, text, headers) end, 'POST', json.encode({username = Logs.Name, embeds = embed, avatar_url = Logs.Image}), { ['Content-Type'] = 'application/json' })
end

-- Function used to print events if Config.Debug is enabled
--- @param string string Event message
EventLog = function(string)
    if not string or not Config.Debug then return end
    print(string)
end