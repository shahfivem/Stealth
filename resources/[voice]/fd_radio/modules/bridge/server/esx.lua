if string.lower(Config.Framework) == 'esx' then
    core = nil

    local success, _ = pcall(function()
        return exports['es_extended']['getSharedObject']
    end)

    if not success then
        while core == nil do
            TriggerEvent('esx:getSharedObject', function(obj) core = obj end)
            Citizen.Wait(0)
        end
    else
        core = exports['es_extended']:getSharedObject()
    end

    function bridge.applyPmaChannelCheck()
        for channel, config in pairs(Config.WhitelistedAccess) do
            exports['pma-voice']:addChannelCheck(channel, function(source)
                local Player = core.GetPlayerFromId(source)

                if config[Player.job.name] then
                    return true
                end

                return false
            end)
        end
    end

    function bridge.notify(src, message, type)
        TriggerClientEvent('esx:showNotification', src, message)
    end

    function bridge.addItem(source, item, amount)
        local Player = core.GetPlayerFromId(source)

        if Player ~= nil and Player.canCarryItem(item, amount or 1) then
            Player.addInventoryItem(item, amount)
        end
    end

    function bridge.removeItem(source, item, amount)
        local Player = core.GetPlayerFromId(source)

        if Player ~= nil then
            Player.removeInventoryItem(item, amount)
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
