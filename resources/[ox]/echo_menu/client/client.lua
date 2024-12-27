---@class RadialItem
---@field label string
---@field icon string
---@field onSelect? fun(itemIndex: number) | string
---@field items? RadialItem[]
---@field params? table

---@class RadialMenuItem: RadialItem
---@field menu? string
---@field id? string
---@field items? RadialItem[] | function
---@field resource? string

---@class RadialSelect
---@field select function
---@field resource? string
---@field params? table

local isOpen = false
local isClosing = false
local isDisabled = false

local ANIMATION_DELAY <const> = 150

---@type RadialMenuItem[]
local menuItems = {}

---@type RadialSelect[]
local menuSelects = {}

local function setNuiFocus(allowInput, disableCursor)
    keepInput = IsNuiFocusKeepingInput()
    SetNuiFocus(true, not disableCursor)
    SetNuiFocusKeepInput(allowInput)
end

local function resetNuiFocus()
    SetNuiFocus(false, false)
    SetNuiFocusKeepInput(keepInput)
end

---Registers a radial sub menu with predefined options.
---@param radial RadialMenuItem
function registerRadial(radial)
	table.insert(menuItems, radial)
    radial.resource = GetInvokingResource()
end

function hideRadial()
    if not isOpen or isClosing then return end

	SendReactMessage('openRadialMenu', false)
    resetNuiFocus()

	isClosing = true

	Wait(ANIMATION_DELAY)

    isOpen = false
	isClosing = false
end

---Registers an item or array of items in the global radial menu.
---@param items RadialMenuItem | RadialMenuItem[]
function addRadialItem(items)
	items = table.type(items) == 'array' and items or { items }

	local invokingResource = GetInvokingResource()

	for i=1, #items do
		local item = items[i]
		item.resource = invokingResource

		for x=1, #menuItems do
			if menuItems[x].id == item.menu then
				item.menu = nil
				if not menuItems[x].items then menuItems[x].items = {} end

				table.insert(menuItems[x].items, item)
				goto skip
			end
		end

		if item.id and not menuItems[item.id] then
			menuItems[item.id] = item
		elseif item.menu and not menuItems[item.menu] then
			menuItems[item.menu] = item
		end

		::skip::
	end
end

---Removes an item from the global radial menu with the given id.
---@param id string
function removeRadialItem(id)
    local menuItem

    for i = 1, #menuItems do
        menuItem = menuItems[i]

        if menuItem.id == id then
            table.remove(menuItems, i)
            break
        end
    end

    if not isOpen then return end
	refreshRadial()
end

---Removes all items from the global radial menu.
function clearRadialItems()
    table.wipe(menuItems)

    if isOpen then
        refreshRadial()
    end
end

---@param id string
RegisterNUICallback('radialClick', function(id, cb)
	cb(1)

	local item = menuSelects[id]
	if not item then
		error('Unable to find click for id '..id)
	end

	local menuResource = item.resource
	
	local onSelect = item.select
	if onSelect then
		hideRadial()

        if type(onSelect) == 'string' then
			return TriggerEvent(onSelect, item.params)
        end

        onSelect(id)
    end

end)

RegisterNUICallback('radialClose', function(_, cb)
    cb(1)

    if not isOpen then return end

    resetNuiFocus()

	isClosing = true

	Wait(ANIMATION_DELAY) -- This is required to ensure the ESC control disabling works

    isOpen = false
	isClosing = false
end)

---Disallow players from opening the radial menu.
---@param state boolean
function disableRadial(state)
    isDisabled = state

    if isOpen and state then
        return hideRadial()
    end
end

---Formats the items so we remove any functions and unwanted data to send to NUI, less the better
---@param items RadialMenuItem[]
local function filterItems(items)
    local filtered = {}
	local selects = {}

	local isCop <const> = PlayerIsCop()
	local isDown <const> = PlayerIsDown()

    local function filter(id, item)
		if (item.groups and not PlayerHasGroups(item.groups)) or
           (item.gangs and not PlayerInGang(item.gangs)) or
           (item.ignoreCop and isCop) or
           (item.police and not isCop) or
		   (isDown and not item.useDown) or
		   (item.downOnly and not isDown) then
        	return
        end

		if item.canInteract then
            local success, resp = pcall(item.canInteract)
            if not success or not resp then
                return
            end
        end

        local filteredItem = { id = id, label = item.label, icon = item.icon }
		local filteredSelect = { select = item.onSelect, resource = item.resource, params = item.params }

		local itemItems = item.items
		local _type = type(itemItems)

		if _type == 'table' and itemItems.__cfx_functionReference then
			_type = 'function'
		end

		if _type == 'function' then
			local success, result = pcall(itemItems)
			itemItems = success and result or {}
			_type = type(itemItems)
		end

        if itemItems and _type == 'table' then
            filteredItem.items = {}

			local key = 1

			for _, subItem in pairs(itemItems) do
				local subId = ('%s_%s'):format(id, key)

				local _filteredItem, _filteredSelect = filter(subId, subItem)
				if _filteredItem then
					filteredItem.items[key], selects[subId] = _filteredItem, _filteredSelect
					key += 1
				end
			end
        end

        return filteredItem, filteredSelect
    end

	local key = 1

	for _, item in pairs(items) do
		local filteredItem, filteredSelect = filter(key, item)
		if filteredItem then
			filtered[key], selects[key] = filteredItem, filteredSelect
			key += 1
		end
	end

    return filtered, selects
end

function refreshRadial()
	local items, selects = filterItems(menuItems)

	SendReactMessage('openRadialMenu', items)
	menuSelects = selects
end

lib.addKeybind({
	name = 'echo_menu-radial',
	description = 'Open Radial Menu',
	defaultKey = 'z',
	onPressed = function()
		if isDisabled or isOpen then return end
		if #menuItems == 0 or IsNuiFocused() or IsPauseMenuActive() then return end

		isOpen = true

		local time = GetGameTimer()
		local items, selects = filterItems(menuItems) -- Filtered menu

		print('Time taken', GetGameTimer() - time)

		if not isOpen or isDisabled  or isClosing then return end

		SendReactMessage('openRadialMenu', items)
		menuSelects = selects

		setNuiFocus(true)
        SetCursorLocation(0.5, 0.5)

		local playerId = cache.playerId

        while isOpen do
            DisablePlayerFiring(playerId, true)
            DisableControlAction(0, 1, true)
            DisableControlAction(0, 2, true)
            DisableControlAction(0, 142, true)
            DisableControlAction(2, 199, true)
            DisableControlAction(2, 200, true)
            Wait(0)
        end
	end,
	onReleased = function()
		hideRadial()
	end,
})

---@param resource string
AddEventHandler('onClientResourceStop', function(resource)
    for i = #menuItems, 1, -1 do
        local item = menuItems[i]

        if item.resource == resource then
            table.remove(menuItems, i)
        end
    end
end)

-- registerRadial({
-- 	id = 'test',
-- 	label = 'Test',
-- 	icon = 'handcuffs',
-- 	items = function()
-- 		return {
-- 			{
-- 				label = 'Search',
-- 				icon = 'magnifying-glass',
-- 			}
-- 		}
-- 	end,
-- })

-- addRadialItem({
-- 	{
-- 		label = 'Search',
-- 		icon = 'magnifying-glass',
-- 		menu = 'police_menu'
-- 	},
-- 	{
-- 		id = 'business_stuff',
-- 		label = 'Business',
-- 		icon = 'briefcase'
-- 	}
-- })

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() and isOpen then
		resetNuiFocus()
	end
end)

exports('registerRadial', registerRadial)
exports('hideRadial', hideRadial)
exports('addRadialItem', addRadialItem)
exports('removeRadialItem', removeRadialItem)
exports('clearRadialItems', clearRadialItems)
exports('disableRadial', disableRadial)