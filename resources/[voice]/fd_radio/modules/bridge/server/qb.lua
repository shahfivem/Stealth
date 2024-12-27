if string.lower(Config.Framework) == 'qb' then
    core = exports[Config.CoreResource]:GetCoreObject()

    function bridge.applyPmaChannelCheck()
        for channel, config in pairs(Config.WhitelistedAccess) do
            exports['pma-voice']:addChannelCheck(channel, function(source)
                local Player = core.Functions.GetPlayer(source)

                if (config[Player.PlayerData.job.name] and Player.PlayerData.job.onduty) or
                    config[Player.PlayerData.gang.name] ~= nil then
                    return true
                end

                return false
            end)
        end
    end

    function bridge.notify(src, message, type)
        TriggerClientEvent('QBCore:Notify', src, message, type)
    end

    function bridge.addItem(source, item, amount)
        local Player = core.Functions.GetPlayer(source)

        if Player ~= nil then
            Player.Functions.AddItem(item, amount)
        end
    end

    function bridge.removeItem(source, item, amount)
        local Player = core.Functions.GetPlayer(source)

        if Player ~= nil then
            Player.Functions.RemoveItem(item, amount)
        end
    end

    function bridge.log(src, event, data)
        --[[
            Available events:
            - connect
            - disconnect
        ]] --

        --[[
            Example:
            if event == 'connect' then
                lib.logger(src, 'radioConnected', {
                    channel = data.joinedChannel,
                    reason = data?.reason or nil
                })
            end
        ]] --
    end
end
