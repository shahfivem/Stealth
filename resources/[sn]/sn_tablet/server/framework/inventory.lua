--------------- [[ Functions ]] ---------------

function getCoreItems()
    if Config.inventory == 'ox_inventory' then
        return exports[Config.inventoryName]:Items()
    elseif Config.inventory == 'qb-inventory' or Config.inventory == 'qb-inventory_old' then
        return QBCore.Shared.Items
    elseif Config.inventory == 'qs-inventory' then
        return exports[Config.inventoryName]:GetItemList()
    end
end

function formatItem(item)
    local format = nil
    if Config.inventory == 'ox_inventory' then
        local itemFormat = [[
    ["%s"] = {
        label = "%s",
        weight = %s,
        description = "%s"
    },
]]
        format = (itemFormat):format(item.name, item.label, item.weight, item.description)
    elseif Config.inventory == 'qb-inventory' or Config.inventory == 'qb-inventory_old' or Config.inventory == 'qs-inventory' then
        local itemFormat = "    ['%s'] = {['name'] = '%s', ['label'] = '%s', ['weight'] = %s, ['type'] = 'item', ['image'] = '%s', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = '%s'},\n"
        format = (itemFormat):format(item.name, item.name, item.label, item.weight, item.name..'.png', item.description)
    end
    return format
end

function RegisterUsableItem(item, cb)
    if Config.inventory == 'qs-inventory' then
        exports[Config.inventoryName]:CreateUsableItem(item, cb)
	elseif QBCore then
		QBCore.Functions.CreateUseableItem(item, function(source, item) cb(source) end)
	elseif ESX then
		ESX.RegisterUsableItem(item, function(source, _, item) cb(source) end)
	end
end

function addItem(source, item, count)
    if Config.inventory == 'ox_inventory' or Config.inventory == 'qb-inventory' or Config.inventory == 'qs-inventory' then
        exports[Config.inventoryName]:AddItem(source, item, count)
    elseif Config.inventory == 'qb-inventory_old' then
        local Player = QBCore.Functions.GetPlayer(source)
        Player.Functions.AddItem(item, count)
    end
end

function removeItem(source, item, count)
    if Config.inventory == 'ox_inventory' or Config.inventory == 'qb-inventory' or Config.inventory == 'qs-inventory' then
        exports[Config.inventoryName]:RemoveItem(source, item, count)
    elseif Config.inventory == 'qb-inventory_old' then
        local Player = QBCore.Functions.GetPlayer(source)
        Player.Functions.RemoveItem(item, count)
    end
end

function hasItem(source, item, count)
    if Config.inventory == 'ox_inventory' then -- is the inventory ox_inventory?
        return exports.ox_inventory:Search(source, 'count', item) >= count
    elseif Config.inventory == 'qb-inventory' or Config.inventory == 'qb-inventory_old' then -- then is the inventory qb-inventory or qb-inventory_old?
        return exports[Config.inventoryName]:HasItem(source, items, count)
    elseif Config.inventory == 'qs-inventory' then -- then is the inventory qs-inventory?
        return exports[Config.inventoryName]:GetItemTotalAmount(source, item) >= count
    end
    return false -- okay well no the player doesnt have the item
end

function registerStash(stash)
    if Config.inventory == 'ox_inventory' then
        exports[Config.inventoryName]:RegisterStash(stash.id, stash.label, stash.slots, stash.maxweight, not stash.shared)      
    end
end

function clearStash(stash)
    if Config.inventory == 'ox_inventory' then
        exports[Config.inventoryName]:ClearInventory(stash.id)
    elseif Config.inventory == 'qb-inventory' then
        if string.find(stash.id,'shop-') then stash.id = stash.id:gsub('shop-', '') end -- qb-invetory dumb logic that doesnt work
        exports[Config.inventoryName]:ClearStash(stash.id)
    elseif Config.inventory == 'qb-inventory_old' then
        if string.find(stash.id,'shop-') then stash.id = stash.id:gsub('shop-', '') end -- qb-invetory dumb logic that doesnt work
        MySQL.insert('INSERT INTO stashitems (stash, items) VALUES (:stash, :items) ON DUPLICATE KEY UPDATE items = :items', {
            ['stash'] = stash.id,
            ['items'] = json.encode({})
        })
    end
end

function getStashItems(stashID)
    local items = {}
    if Config.inventory == 'ox_inventory' then
        return exports[Config.inventoryName]:GetInventoryItems(stashID)
    elseif Config.inventory == 'qb-inventory' then
        if string.find(stashID,'shop-') then stashID = stashID:gsub('shop-', '') end -- qb-invetory dumb logic that doesnt work
        local stashItems = exports[Config.inventoryName]:GetStashItems(stashID)
        for _, item in pairs(stashItems) do
            items[#items+1] = {
                name = item.name,
                label = item.label,
                slot = item.slot,
                count = tonumber(item.amount),
            }
        end
        return items
    elseif Config.inventory == 'qb-inventory_old' then
        if string.find(stashID,'shop-') then stashID = stashID:gsub('shop-', '') end -- qb-invetory dumb logic that doesnt work
        local result = MySQL.scalar.await('SELECT items FROM stashitems WHERE stash = ?', {stashID})
        if not result then return items end
        local stashItems = json.decode(result)
        if not stashItems then return items end
        for _, item in pairs(stashItems) do
            local itemInfo = QBCore.Shared.Items[item.name:lower()]
            if itemInfo then
                items[#items+1] = {
                    name = item.name,
                    label = itemInfo.label,
                    slot = item.slot,
                    count = tonumber(item.amount),
                }
            end
        end
        return items
    elseif Config.inventory == 'qs-inventory' then
        local stashItems = exports[Config.inventoryName]:GetStashItems('Stash_'..stashID)
        for _, item in pairs(stashItems) do
            items[#items+1] = {
                name = item.name,
                label = item.label,
                slot = item.slot,
                count = tonumber(item.amount),
            }
        end
        return items
    end
end

function removeStashItem(stashID, item, count, slot)
    if Config.inventory == 'ox_inventory' then
        exports[Config.inventoryName]:RemoveItem(stashID, item, count)
    elseif Config.inventory == 'qb-inventory' then
        if string.find(stashID,'shop-') then stashID = stashID:gsub('shop-', '') end -- qb-invetory dumb logic that doesnt work
        exports[Config.inventoryName]:RemoveItem(stashID, item, count)
        local stashItems = getStashItems(stashID)
        MySQL.prepare('INSERT INTO inventories (identifier, items) VALUES (?, ?) ON DUPLICATE KEY UPDATE items = ?', { stashID, json.encode(stashItems), json.encode(stashItems) })
    elseif Config.inventory == 'qb-inventory_old' then
        if string.find(stashID,'shop-') then stashID = stashID:gsub('shop-', '') end -- qb-invetory dumb logic that doesnt work
        local stashItems = getStashItems(stashID)
        if stashItems[slot] and stashItems[slot].name == itemName then
            if stashItems[slot].amount > amount then
                stashItems[slot].amount = stashItems[slot].amount - amount
            else stashItems[slot] = nil end
        else
            stashItems[slot] = nil
            if stashItems == nil then stashItems[slot] = nil end
        end
        MySQL.insert('INSERT INTO stashitems (stash, items) VALUES (:stash, :items) ON DUPLICATE KEY UPDATE items = :items', {['stash'] = stashID, ['items'] = json.encode(stashItems)})
    elseif Config.inventory == 'qs-inventory' then
        exports[Config.inventoryName]:RemoveItemIntoStash('Stash_'..stashID, item, count, slot)
    end
end

function registerShop(id, job, shop)
    if Config.inventory == 'ox_inventory' then
        exports[Config.inventoryName]:RegisterShop(id, {
            name = shop.label,
            inventory = shop.items,
            groups = {[job] = 0},
        })
    end
end

--------------- [[ EVENTS ]] ---------------

RegisterNetEvent('sn_tablet:server:openStash', function(id, stash)
    local src = source
    if Config.inventory == 'qb-inventory' then
        if not stash.shared then id = id..'_'..getIdentifier(src) end
        if string.find(id,'shop-') then id = id:gsub('shop-', '') end -- qb-invetory dumb logic that doesnt work
        exports[Config.inventoryName]:OpenInventory(src, id, stash)
    end 
end)

RegisterNetEvent('sn_tablet:server:openShop', function(shopid, shop)
    local src = source
    if Config.inventory == 'qb-inventory' then
        for i, item in pairs(shop.items) do shop.items[i].amount = 999 end
        exports[Config.inventoryName]:CreateShop({
            name = shopid,
            label = shop.label,
            slots = #shop.items,
            items = shop.items
        })
        exports[Config.inventoryName]:OpenShop(src, shopid)
    end
end)


--------------- [[ EXPORTS ]] ---------------

exports('getCoreItems', getCoreItems)
exports('formatItem', formatItem)
exports('RegisterUsableItem', RegisterUsableItem)
exports('addItem', addItem)
exports('removeItem', removeItem)
exports('hasItem', hasItem)
exports('registerStash', registerStash)
exports('clearStash', clearStash)
exports('getStashItems', getStashItems)
exports('removeStashItem', removeStashItem)
exports('registerShop', registerShop)