Config = {}

Config.debug = {
  taget = false,
  polyZone = false,
}

Config.framework = 'auto' -- options: qb, esx, auto
Config.target = 'ox_target' -- options: qb-target, ox_target, auto
Config.inventory = 'ox_inventory' -- options: ox_inventory, qb-inventory, qb-inventory_old, qs-inventory or auto
Config.inventoryName = nil -- change if the inventory file name is custom
Config.itemsPath = { -- path to where your items are saved
  --['Config.inventory'] = {'resourceName', 'path to stored place'},
    ['ox_inventory'] = {'ox_inventory', 'data/items.lua'},
    ['qb-inventory'] = {'qb-core', 'shared/items.lua'},
    ['qb-inventory_old'] = {'qb-core', 'shared/items.lua'},
    ['qs-inventory'] = {'qb-core', 'shared/items.lua'},
}
Config.society = 'Renewed-Banking' --- options: sn_corejobs, qb-banking, Renewed-Banking, esx_society
Config.appearance = 'illenium-appearance' -- options: qb-clothing, illenium-appearance, fivem-appearance, sn_appearance
Config.manageWorkOutfits = true -- adds the manage workoutfits to locker rooms works with: illenium-appearance, fivem-appearance, sn_appearance
Config.phone = 'auto' -- options: qb-phone, lb-phone, gksphone, qs-smartphone-pro, qs-smartphone, z-phone, yseries

Config.items = {
	tablet = 'sn_tablet'
}

Config.Apps = {
  --[[{
    id = 'duo',
    label = 'Duo',
    icon = 'cards',
    color = '#dca2e5',
    url = 'https://duowfriends.eu',
    canOpen = function()
        return true
    end
  },]]
}










if Config.framework == 'auto' then
  if GetResourceState('qb-core'):find('start') then
    Config.framework = 'qb' 
  elseif GetResourceState('es_extended'):find('start') then
    Config.framework = 'esx'
  end 
end

if Config.inventory == 'auto' then
  if GetResourceState('qb-inventory'):find('start') then
    Config.inventory = 'qb-inventory'
  elseif GetResourceState('ox_inventory'):find('start') then
    Config.inventory = 'ox_inventory'
  elseif GetResourceState('qs-inventory'):find('start') then
    Config.inventory = 'qs-inventory'
  end
end

if not Config.inventoryName then
  Config.inventoryName = Config.inventory
  if Config.inventoryName == 'qb-inventory_old' then
    Config.inventoryName = 'qb-inventory'
  end
end

if Config.target == 'auto' then
  if GetResourceState('qb-target'):find('start') then
    Config.target = 'qb-target'
  elseif GetResourceState('ox_target'):find('start') then
    Config.target = 'ox_target'
  end
end


appearanceScripts = {'qb-clothing', 'illenium-appearance', 'fivem-appearance', 'codem-appearance', 'raid_clothes', 'sleek-clothestore', 'rcore_clothes', 'ak47_clothing', 'sn_appearance'}
if Config.appearance == 'auto' then
	for _, resource in ipairs(appearanceScripts) do
		if GetResourceState(resource):find('start') then
      if resource == 'sn_appearance' then Config.manageWorkOutfits = true end
			Config.appearance = resource
			break
		end
	end
end

phoneScripts = {'qb-phone', 'lb-phone', 'gksphone', 'qs-smartphone-pro', 'qs-smartphone', 'z-phone', 'yseries'}
if Config.phone == 'auto' then
  for _, resource in ipairs(phoneScripts) do
		if GetResourceState(resource):find('start') then
			Config.phone = resource
			break
		end
	end
end