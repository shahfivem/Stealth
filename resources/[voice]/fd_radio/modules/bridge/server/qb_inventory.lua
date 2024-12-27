if not GetResourceState('qb-inventory'):find('start') then return end

SetTimeout(1000, function()
    if Config.AllowJammers and Config.UseJammerItem and Config.JammerItemName then
        core.Functions.CreateUseableItem(Config.JammerItemName, function(source, _)
            TriggerClientEvent('fd_radio:usedJammer', source)
        end)
    end

    if not Config.MultipleItems then
        core.Functions.CreateUseableItem(Config.UseableItems.single, function(source, item)
            TriggerClientEvent('fd_radio:use', source, item.name)
        end)

        return
    end

    for color, radioItem in pairs(Config.UseableItems.multiple) do
        core.Functions.CreateUseableItem(radioItem, function(source, item)
            TriggerClientEvent('fd_radio:use', source, item.name, color)
        end)
    end
end)
