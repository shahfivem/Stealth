local function hasItem(source, item)
    local hasItem = exports.ox_inventory:Search(source, 'count', item)
    return hasItem > 0
end

RegisterServerEvent('tp:checkItem')
AddEventHandler('tp:checkItem', function(location)
    local source = source
    local item = 'redkeycard'

    if hasItem(source, item) then
        TriggerClientEvent('tp:teleport', source, location)
    else
        TriggerClientEvent('tp:notify', source, "You need a Red Keycard to teleport!", "error")
    end
end)
