local function hasItem(source, item)
    local hasItem = exports.ox_inventory:Search(source, 'count', item)
    return hasItem > 0
end

RegisterServerEvent('tp:checkItem2')
AddEventHandler('tp:checkItem2', function(location)
    local source = source
    local item = 'bluekeycard'

    if hasItem(source, item) then
        TriggerClientEvent('tp:teleport2', source, location)
    else
        TriggerClientEvent('tp:notify2', source, "You need a Blue Keycard to teleport!", "error")
    end
end)
