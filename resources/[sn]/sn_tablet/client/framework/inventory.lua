function getCoreItems()
    if Config.inventory == 'ox_inventory' then
        return exports[Config.inventoryName]:Items()
    elseif Config.inventory == 'qb-inventory' or Config.inventory == 'qb-inventory_old' then
        return QBCore.Shared.Items
    elseif Config.inventory == 'qs-inventory' then
        return exports[Config.inventoryName]:GetItemList()
    end
end

function hasItem(item, count)
    if not count or count < 1 then count = 1 end
    if Config.inventory == 'ox_inventory' then
        return exports.ox_inventory:Search('count', item) >= count
    elseif Config.inventory == 'qb-inventory' or Config.inventory == 'qb-inventory_old' then
        return 0 --- NEEDS DONE
    elseif Config.inventory == 'qs-inventory' then
        return 0 --- NEEDS DONE
    end
end

function getItemImage(item)
    local items = getCoreItems()
    local imagepath = 'nui://'..Config.inventoryName..'/html/images/'
    if Config.inventory == 'ox_inventory' then
        imagepath = 'nui://'..Config.inventoryName..'/web/images/'
    end
    local image = imagepath..item..'.png'
    local itemData = items[item]
    if itemData.client and itemData.client.image then
        image = itemData.client.image:match('^[%w]+://') and itemData.client.image or ('%s/%s'):format(imagepath, itemData.client.image)
    end
    if itemData.image then image = imagepath..itemData.image end
    return image
end

function openStash(stash)
    if Config.inventory == 'ox_inventory' then
        exports[Config.inventoryName]:openInventory('stash', stash.id)
    elseif Config.inventory == 'qb-inventory' then
        TriggerServerEvent('sn_tablet:server:openStash', stash.id, stash)
    elseif Config.inventory == 'qb-inventory_old' then
        if string.find(stash.id,'shop-') then stash.id = stash.id:gsub('shop-', '') end
        TriggerEvent('inventory:client:SetCurrentStash', stash.id)
        TriggerServerEvent('inventory:server:OpenInventory', 'stash', stash.id, stash)
    elseif Config.inventory == 'qs-inventory' then   
        TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'Stash_'..stash.id, stash)
        TriggerEvent('inventory:client:SetCurrentStash', 'Stash_'..stash.id)
    end
end

function openShop(shopid, shop)
    if Config.inventory == 'ox_inventory' then
        exports[Config.inventoryName]:openInventory('shop', { type = shopid})
    elseif Config.inventory == 'qb-inventory' then
        TriggerServerEvent('sn_tablet:server:openShop', shopid, shop)
    elseif Config.inventory == 'qb-inventory_old' then
        for i, item in pairs(shop.items) do shop.items[i].amount = 999 shop.items[i].slot = i end
        TriggerServerEvent('inventory:server:OpenInventory', 'shop', shopid, shop)
    elseif Config.inventory == 'qs-inventory' then
        for i, item in pairs(shop.items) do shop.items[i].amount = 999 shop.items[i].slot = i end
        TriggerServerEvent('inventory:server:OpenInventory', 'shop', 'Itemshop_'..shopid, shop)
    end
end

exports('getCoreItems', getCoreItems)
exports('hasItem', hasItem)
exports('getItemImage', getItemImage)
exports('openStash', openStash)
exports('openShop', openShop)