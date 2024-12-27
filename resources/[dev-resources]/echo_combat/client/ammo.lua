-- exports('magazineUse', function(itemData)
-- 	updateAmmo() -- Essential

-- 	local weaponData = exports.echo_combat:getWeaponData()
-- 	if not weaponData or not next(weaponData) then
-- 		return lib.notify('You do not have a weapon equipped')
-- 	end

-- 	local itemWeaponData = Weapons[weaponData.item_id]
-- 	if itemWeaponData and itemWeaponData.ammo then
-- 		return lib.notify('This weapon does not take magazines')
-- 	end

-- 	lib.callback.await('mergeMagazine', false, {
-- 		id = itemData.id,
-- 		inventory = itemData.name,
-- 		slot = itemData.slot - 1,
-- 	}, {
-- 		id = weaponData.id,
-- 		information = weaponData.information,
-- 		item_id = weaponData.item_id
-- 	})
-- end)

exports('ammoUse', function(itemData)
	updateAmmo() -- Essential

	local weaponData = exports.echo_combat:getWeaponData()
	if not weaponData or not next(weaponData) then
		return lib.notify('You do not have a weapon equipped')
	end

	local itemWeaponData = Weapons[weaponData.item_id] or {}
	local supportedAmmo = itemWeaponData.ammo or {}

	if not supportedAmmo[itemData.item_id] then
		return lib.notify('Equipped weapon does not support this ammo')
	end

	lib.callback.await('mergeAmmo', false, {
		id = itemData.id,
		inventory = itemData.name,
		slot = itemData.slot,
		item_id = itemData.item_id,
		information = itemData.information
	}, {
		id = weaponData.id,
		information = weaponData.information,
		item_id = weaponData.item_id
	})
end)

lib.callback.register('echo_combat:insertMagazine', function()
	local isInventoryOpen = exports.erp_inventory:isOpen()
	if isInventoryOpen then
		TriggerEvent('erp_inventory:close')
	end

	---@Todo-Lamb: Play inserting animation here

	local finished = exports.erp_progressbar:taskBar({
		length = math.random(1000, 1500),
		text = 'Inserting Mag',
		keepweapon = true,
		stopRunning = true
		-- animation = { dict = "anim@gangops@facility@servers@bodysearch@", anim = "player_search" }
	})

	if isInventoryOpen then
		exports.erp_inventory:open()
	end

	return finished == 100
end)

-- lib.callback.register('echo_combat:removeMagazine', function(skipOpen)
-- 	TriggerEvent('erp_inventory:close')

-- 	---@Todo-Lamb: Play removing animation here

-- 	local finished = exports.erp_progressbar:taskBar({
-- 		length = math.random(750, 1250),
-- 		text = 'Removing Mag',
-- 		keepweapon = true,
-- 		stopRunning = true
-- 	})

-- 	if finished ~= 100 then return false end

-- 	if skipOpen then return true end

-- 	exports.erp_inventory:open()
-- 	return true
-- end)

lib.callback.register('echo_combat:insertAmmo', function(amount)
	local isInventoryOpen = exports.erp_inventory:isOpen()
	if isInventoryOpen then
		TriggerEvent('erp_inventory:close')
	end

	local multiplier = amount / 10
	if multiplier < 1 then multiplier = 1 end

	local finished = exports.erp_progressbar:taskBar({
		length = math.random(500, 750) * multiplier,
		text = ('Loading %s Rounds'):format(amount),
		keepweapon = true,
		stopRunning = true
		-- animation = { dict = "anim@gangops@facility@servers@bodysearch@", anim = "player_search" }
	})

	return finished == 100
end)

AddEventHandler('erp_inventory:contextMenu', function(data)
	if data.action ~= 'check_ammo' then return end

	updateAmmo() -- Essential

	local weaponInformation = json.decode(data.itemInfo.information) -- Information for the weapon
	if not weaponInformation.magazine then weaponInformation.magazine = 0 end -- Set the ammo to 0 if it's invalid

	if weaponInformation.magazine == 0 then
		return lib.notify('No magazine in this weapon', 5000, 'error')
	end

	local weaponData = Weapons[data.itemInfo.item_id]
	if not weaponData then return end

	local ammo = lib.callback.await('getMagazineAmmo', false, weaponInformation.magazine) or 0
	local percentage = ammo / weaponData.capacity

	if percentage == 0 then
		lib.notify('No ammo in the magazine')
	elseif percentage < 0.5 then
		lib.notify('Magazine seems almost empty')
	elseif percentage < 0.8 then
		lib.notify('Magazine appears almost full')
	elseif percentage < 0.95 then
		lib.notify('Only missing a couple of bullets in the magazine')
	else
		lib.notify('Magazine is filled to the brim')
	end
end)
