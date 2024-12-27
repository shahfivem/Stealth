local containers = {}

---@class ItemContainerProperties
---@field slots number
---@field maxWeight number
---@field whitelist? table<string, true> | string[]
---@field blacklist? table<string, true> | string[]

local function arrayToSet(tbl)
	local size = #tbl
	local set = table.create(0, size)

	for i = 1, size do
		set[tbl[i]] = true
	end

	return set
end

---Registers items with itemName as containers (i.e. backpacks, wallets).
---@param itemName string
---@param properties ItemContainerProperties
---@todo Rework containers for flexibility, improved data structure; then export this method.
local function setContainerProperties(itemName, properties)
	local blacklist, whitelist = properties.blacklist, properties.whitelist

	if blacklist then
		local tableType = table.type(blacklist)

		if tableType == 'array' then
			blacklist = arrayToSet(blacklist)
		elseif tableType ~= 'hash' then
			TypeError('blacklist', 'table', type(blacklist))
		end
	end

	if whitelist then
		local tableType = table.type(whitelist)

		if tableType == 'array' then
			whitelist = arrayToSet(whitelist)
		elseif tableType ~= 'hash' then
			TypeError('whitelist', 'table', type(whitelist))
		end
	end

	containers[itemName] = {
		size = { properties.slots, properties.maxWeight },
		blacklist = blacklist,
		whitelist = whitelist,
	}
end

setContainerProperties('paperbag', {
	slots = 5,
	maxWeight = 1000,
	blacklist = { 'testburger' }
})

setContainerProperties('pizzabox', {
	slots = 5,
	maxWeight = 1000,
	whitelist = { 'pizza' }
})

setContainerProperties('teapotcigcase', {
    slots = 10,  -- Adjust the slots as needed
    maxWeight = 1000,  -- Adjust the weight limit as needed
    whitelist = {
        'teapot_bloomjoint',
        'teapot_serentiyjoint',
		'teapotlighter'
    }
})

setContainerProperties('teapotbasket', {
    slots = 20,  -- Adjust the slots as needed
    maxWeight = 1000,  -- Adjust the weight limit as needed
    whitelist = {
        'teapot_cheesesteak',
        'teapot_maplewalnut',
        'teapot_dragon',
        'teapot_earlgrey',
        'teapot_saintcity',
        'teapot_dirt',
        'teapot_hearttoast',
        'teapot_sandos',
        'teapot_honeycomb',
        'teapot_swissroll',
        'teapot_poptart',
        'teapot_rainbow',
        'teapot_rasp',
        'teapot_cinna',
        'teapot_frappe',
        'teapot_pan_cookie',
        'teapot_bi_cookie',
        'teapot_lesbian_cookie',
        'teapot_trans_cookie',
        'teapot_enby_cookie',

        -- Infused Food and Drinks
        'teapot_cheesesteak_infused',
        'teapot_maplewalnut_infused',
        'teapot_dragon_infused',
        'teapot_earlgrey_infused',
        'teapot_saintcity_infused',
        'teapot_dirt_infused',
        'teapot_hearttoast_infused',
        'teapot_sandos_infused',
        'teapot_honeycomb_infused',
        'teapot_swissroll_infused',
        'teapot_poptart_infused',
        'teapot_rainbow_infused',
        'teapot_rasp_infused',
        'teapot_cinna_infused',
        'teapot_frappe_infused',
        'teapot_pan_cookie_infused',
        'teapot_bi_cookie_infused',
        'teapot_lesbian_cookie_infused',
        'teapot_trans_cookie_infused',
        'teapot_enby_cookie_infused',
        'teapot_bloomjoint',
        'teapot_serentiyjoint',
		'teapotlighter'
    }
})



setContainerProperties('duffelbag', {
	slots = 20,
	maxWeight = 175000,
})

setContainerProperties('wallet', {
	slots = 5,
	maxWeight = 5000,
	whitelist = { 'money' }
})

setContainerProperties('ammopouch', {
	slots = 5,
	maxWeight = 5000,
	whitelist = { 'pistolammo', 'subammo', 'rifleammo', 'heavyammo', 'lmgammo' }
})
setContainerProperties('plugweaponcrate', {
	slots = 15,
	maxWeight = 200000,
})
return containers
