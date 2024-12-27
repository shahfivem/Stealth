if not GetResourceState('ox_inventory'):find('start') then return end

local logger = Logger.New('Ox Inventory bridge')
logger:info('Ox Inventory bridge loaded')

SetTimeout(0, function()
    function bridge.hasItem(item, amount)
        local count = exports.ox_inventory:Search('count', item)

        if count >= amount then
            logger:info(('Player has %s %s in inventory'):format(count, item))
            return true
        end

        logger:info(('Player does not have enough %s in inventory'):format(item))
        return false
    end

    if Config.AllowJammers and Config.UseJammerItem and Config.JammerItemName then
        exports('useJammer', function()
            logger:info('Using jammer')
            placeJammer()
        end)
    end

    if not Config.MultipleItems then
        logger:info('Registering single item export', Config.UseableItems.single)
        exports('useRadio', function()
            logger:info('Using radio, single item', Config.UseableItems.single)
            toggleRadio(Config.UseableItems.single)
        end)

        return
    end

    logger:info('Registering multiple item exports')
    for color, item in pairs(Config.UseableItems.multiple) do
        local name = ("useRadio%s"):format(color:gsub("^%l", string.upper))

        exports(name, function()
            logger:info(('Using radio, multiple items, export: %s'):format(name))
            toggleRadio(item, color)
        end)
    end
end)
