Config, Locales = {}, {}

Config.Debug = false

Config.DoubleXP = false

Config.EventPrefix = 'okokCrafting'

Config.xpColumnsName = 'xp'

Config.craftQueryColumnName = 'okokcrafts'

Config.qbPrefix = 'qb'

Config.QBCorePrefix = 'QBCore'

Config.Locale = 'en'                     -- en / pt / gr / fr / de

Config.UseOkokTextUI = false             -- true = okokTextUI (I recommend you using this since it is way more optimized than the default ShowHelpNotification) | false = ShowHelpNotification

Config.Key = 38                          -- [E] Key to open the interaction, check here the keys ID: https://docs.fivem.net/docs/game-references/controls/#controls

Config.HideMinimap = true                -- If true it'll hide the minimap when the Crafting menu is opened

Config.ShowBlips = true                  -- If true it'll show the crafting blips on the map

Config.ShowFloorBlips = true             -- If true it'll show the crafting markers on the floor

Config.ShowAllCrafts = true              -- This option will show all crafts even if you don't have enough level to craft it

Config.UseXP = true                      -- If you want to use the XP system or not

Config.SameLevelForAllTables = false     -- Use the same level in all the crafting tables

Config.MaxLevel = 20                     -- Max level on the workbenches

Config.StartXP = 100                     -- First level XP

Config.LevelMultiplier = 1.05            -- How much the XP needed increases per level (1.05 = 5% | level 1 = 100 | level 2 = 205 | etc...)

Config.GiveXPOnCraftFailed = true        -- If the player receives XP when he fails the craft of an item

Config.SetXPCommand = 'setcraftxp'       -- Set the players XP

Config.SetLevelCommand = 'setcraftlevel' -- Set the players level

Config.CraftRadius = 5                   -- if you are further it will stop the craft

Config.MaxCraftsPerWorkbench = 10        -- how many items can be in the queue at the same time

Config.UseCategories = false

Config.InventoryDirectory = 'ox_inventory/web/images/'

Config.UseOx_inventory = true

Config.NotInterectableTables = false -- true = all blips will disapear and you can only open the crafting table using the `openClosestTable` or `openWorkbench` events

Config.AdminGroups = {
	'god',
	'admin',
	'mod'
}

Config.itemNames = { -- Format: id = label | In case the item starts with a number make sure to set it in this format: ['9mm'] = 9mm ammo,
	metalscrap = 'Metal Scrap',
	weapon_assaultrifle = 'Assault Rifle',
	bandage = 'Bandage',
	firstaid = 'First Aid',
	['10kgoldchain'] = '10kgoldchain',
	plastic = 'Plastic',
	copper = 'Copper',
	aluminum = 'Aluminum',
	iron = 'Iron',
	cash = 'Money',
	rubber = 'Rubber',
	steel = 'steel',
	weapon_heavypistol = 'Heavy Pistol',
	weapon_sp45 = 'SP45 Pistol',
	weapon_fnx45 = 'FNX45 Pistol',
	weapon_specialcarbine = 'Special Carbine',
	weapon_carbinerifle_mk2 = '.762 Carbine Rifle',
	weapon_compactrifle = 'Draco',
	weapon_heavyrifle = 'Heavy Rifle',
	weapon_advancedrifle = 'Ctar-21',
	weapon_bullpuprifle_mk2 = 'Bullpup Rifle Mk2',
	weapon_mp5 = 'MP5 Submachine Gun',
	weapon_assaultsmg = 'Assault SMG',
	weapon_combatpdw = 'Combat PDW',
	weapon_microsmg = 'Micro SMG',
	weapon_pp19 = 'PP19 Submachine Gun',
	weapon_machinepistol = 'Machine Pistol',
	weapon_appistol = 'AP Pistol',
	weapon_glock18c = 'Glock 18c',
	weapon_deagle = 'Deagle'
}


Config.Crafting = {
	{
		coordinates = vector3(-1156.13, -467.25, 53.3),
		radius = 1,
		showMapBlip = false,
		marker = { type = 20, r = 31, g = 94, b = 255, a = 155, bobUpAndDown = 0, faceCamera = 0, rotate = 1, textureDict = 0, textureName = 0, drawOnEnts = 0 },
		showBlipRadius = 50,
		blip = { blipId = 89, blipColor = 3, blipScale = 0.9, blipText = 'Crafting' },
		tableName = 'Pistol Bench',
		tableID = 'pistol',
		crafts = {
			'weapon_heavypistol',
			'weapon_sp45',
			'weapon_fnx45',
			'weapon_machinepistol',
			'weapon_deagle'
		},
		jobs = {
			['all'] = true -- For everyone to be able to open the workbench
		},
	},
	{
		coordinates = vector3(884.7, -3199.77, -98.2),
		radius = 1,
		showMapBlip = false,
		marker = { type = 20, r = 31, g = 94, b = 255, a = 155, bobUpAndDown = 0, faceCamera = 0, rotate = 1, textureDict = 0, textureName = 0, drawOnEnts = 0 },
		showBlipRadius = 50,
		blip = { blipId = 89, blipColor = 3, blipScale = 0.9, blipText = 'Crafting' },
		tableName = 'Rifle Bench',
		tableID = 'rifle',
		crafts = {
			'weapon_specialcarbine',
			'weapon_assaultrifle',
			'weapon_carbinerifle_mk2',
			'weapon_compactrifle',
			'weapon_heavyrifle',
			'weapon_advancedrifle',
			'weapon_bullpuprifle_mk2'
		},
		jobs = {
			['all'] = true -- For everyone to be able to open the workbench
		},
	},
	{
		coordinates = vector3(-1869.09, 3749.82, -99.85),
		radius = 1,
		showMapBlip = false,
		marker = { type = 20, r = 31, g = 94, b = 255, a = 155, bobUpAndDown = 0, faceCamera = 0, rotate = 1, textureDict = 0, textureName = 0, drawOnEnts = 0 },
		showBlipRadius = 50,
		blip = { blipId = 89, blipColor = 3, blipScale = 0.9, blipText = 'Crafting' },
		tableName = 'SMG Bench',
		tableID = 'smg',
		crafts = {
			'weapon_mp5',
			'weapon_assaultsmg',
			'weapon_combatpdw',
			'weapon_microsmg',
			'weapon_appistol',
			'weapon_machinepistol',
		},
		jobs = {
			['all'] = true -- For everyone to be able to open the workbench
		},
	},
}

Config.Crafts = {
		['weapon_specialcarbine'] = {
			item = 'weapon_specialcarbine',
			amount = 1,
			maxCraft = 1,
			successCraftPercentage = 100,
			isItem = true,
			isDisassemble = false,
			time = 240,
			levelNeeded = 4,
			xpPerCraft = 120,
			recipe = {
				{ 'iron', math.random(100, 200), true, false },
				{ 'plastic', math.random(100, 200), true, false },
				{ 'metalscrap', math.random(100, 200), true, false },
				{ 'steel', math.random(100, 200), true, false },
				{ 'rubber', math.random(100, 200), true, false },
				{ 'copper', math.random(100, 200), true, false },
			},
			job = { '' },
			data = {},
			category = 'Rifles',
		},
		['weapon_mp5'] = {
			item = 'weapon_mp5',
			amount = 1,
			maxCraft = 1,
			successCraftPercentage = 100,
			isItem = true,
			isDisassemble = false,
			time = 240,
			levelNeeded = 3,
			xpPerCraft = 120,
			recipe = {
				{ 'iron', math.random(100, 200), true, false },
				{ 'plastic', math.random(100, 200), true, false },
				{ 'metalscrap', math.random(100, 200), true, false },
				{ 'steel', math.random(100, 200), true, false },
				{ 'rubber', math.random(100, 200), true, false },
				{ 'copper', math.random(100, 200), true, false },
			},
			job = { '' },
			data = {},
			category = 'SMGs',
		},
		
		['weapon_assaultsmg'] = {
			item = 'weapon_assaultsmg',
			amount = 1,
			maxCraft = 1,
			successCraftPercentage = 100,
			isItem = true,
			isDisassemble = false,
			time = 240,
			levelNeeded = 2,
			xpPerCraft = 120,
			recipe = {
				{ 'iron', math.random(100, 200), true, false },
				{ 'plastic', math.random(100, 200), true, false },
				{ 'metalscrap', math.random(100, 200), true, false },
				{ 'steel', math.random(100, 200), true, false },
				{ 'rubber', math.random(100, 200), true, false },
				{ 'copper', math.random(100, 200), true, false },
			},
			job = { '' },
			data = {},
			category = 'SMGs',
		},
		
		['weapon_combatpdw'] = {
			item = 'weapon_combatpdw',
			amount = 1,
			maxCraft = 1,
			successCraftPercentage = 100,
			isItem = true,
			isDisassemble = false,
			time = 240,
			levelNeeded = 0,
			xpPerCraft = 120,
			recipe = {
				{ 'iron', math.random(100, 200), true, false },
				{ 'plastic', math.random(100, 200), true, false },
				{ 'metalscrap', math.random(100, 200), true, false },
				{ 'steel', math.random(100, 200), true, false },
				{ 'rubber', math.random(100, 200), true, false },
				{ 'copper', math.random(100, 200), true, false },
			},
			job = { '' },
			data = {},
			category = 'SMGs',
		},
		
		['weapon_microsmg'] = {
			item = 'weapon_microsmg',
			amount = 1,
			maxCraft = 1,
			successCraftPercentage = 100,
			isItem = true,
			isDisassemble = false,
			time = 240,
			levelNeeded = 0,
			xpPerCraft = 120,
			recipe = {
				{ 'iron', math.random(100, 200), true, false },
				{ 'plastic', math.random(100, 200), true, false },
				{ 'metalscrap', math.random(100, 200), true, false },
				{ 'steel', math.random(100, 200), true, false },
				{ 'rubber', math.random(100, 200), true, false },
				{ 'copper', math.random(100, 200), true, false },
			},
			job = { '' },
			data = {},
			category = 'SMGs',
		},
		
		['weapon_pp19'] = {
			item = 'weapon_pp19',
			amount = 1,
			maxCraft = 1,
			successCraftPercentage = 100,
			isItem = true,
			isDisassemble = false,
			time = 240,
			levelNeeded = 1,
			xpPerCraft = 120,
			recipe = {
				{ 'iron', math.random(100, 200), true, false },
				{ 'plastic', math.random(100, 200), true, false },
				{ 'metalscrap', math.random(100, 200), true, false },
				{ 'steel', math.random(100, 200), true, false },
				{ 'rubber', math.random(100, 200), true, false },
				{ 'copper', math.random(100, 200), true, false },
			},
			job = { '' },
			data = {},
			category = 'SMGs',
		},
		
		['weapon_machinepistol'] = {
			item = 'weapon_machinepistol',
			amount = 1,
			maxCraft = 1,
			successCraftPercentage = 100,
			isItem = true,
			isDisassemble = false,
			time = 240,
			levelNeeded = 0,
			xpPerCraft = 120,
			recipe = {
				{ 'iron', math.random(100, 200), true, false },
				{ 'plastic', math.random(100, 200), true, false },
				{ 'metalscrap', math.random(100, 200), true, false },
				{ 'steel', math.random(100, 200), true, false },
				{ 'rubber', math.random(100, 200), true, false },
				{ 'copper', math.random(100, 200), true, false },
			},
			job = { '' },
			data = {},
			category = 'SMGs',
		},		
		['weapon_assaultrifle'] = {
			item = 'weapon_assaultrifle',
			amount = 1,
			maxCraft = 1,
			successCraftPercentage = 100,
			isItem = true,
			isDisassemble = false,
			time = 240,
			levelNeeded = 2,
			xpPerCraft = 120,
			recipe = {
				{ 'iron', math.random(250, 500), true, false },
				{ 'plastic', math.random(250, 500), true, false },
				{ 'metalscrap', math.random(250, 500), true, false },
				{ 'steel', math.random(250, 500), true, false },
				{ 'rubber', math.random(250, 500), true, false },
				{ 'copper', math.random(250, 500), true, false },
			},
			job = { '' },
			data = {},
			category = 'Rifles',
		},
		['weapon_carbinerifle_mk2'] = {
			item = 'weapon_carbinerifle_mk2',
			amount = 1,
			maxCraft = 1,
			successCraftPercentage = 100,
			isItem = true,
			isDisassemble = false,
			time = 240,
			levelNeeded = 4,
			xpPerCraft = 120,
			recipe = {
				{ 'iron', math.random(250, 500), true, false },
				{ 'plastic', math.random(250, 500), true, false },
				{ 'metalscrap', math.random(250, 500), true, false },
				{ 'steel', math.random(250, 500), true, false },
				{ 'rubber', math.random(250, 500), true, false },
				{ 'copper', math.random(250, 500), true, false },
			},
			job = { '' },
			data = {},
			category = 'Rifles',
		},
		['weapon_compactrifle'] = {
			item = 'weapon_compactrifle',
			amount = 1,
			maxCraft = 1,
			successCraftPercentage = 100,
			isItem = true,
			isDisassemble = false,
			time = 240,
			levelNeeded = 0, -- Lowest level
			xpPerCraft = 120,
			recipe = {
				{ 'iron', math.random(250, 500), true, false },
				{ 'plastic', math.random(250, 500), true, false },
				{ 'metalscrap', math.random(250, 500), true, false },
				{ 'steel', math.random(250, 500), true, false },
				{ 'rubber', math.random(250, 500), true, false },
				{ 'copper', math.random(250, 500), true, false },
			},
			job = { '' },
			data = {},
			category = 'Rifles',
		},
		['weapon_heavyrifle'] = {
			item = 'weapon_heavyrifle',
			amount = 1,
			maxCraft = 1,
			successCraftPercentage = 100,
			isItem = true,
			isDisassemble = false,
			time = 240,
			levelNeeded = 3,
			xpPerCraft = 120,
			recipe = {
				{ 'iron', math.random(250, 500), true, false },
				{ 'plastic', math.random(250, 500), true, false },
				{ 'metalscrap', math.random(250, 500), true, false },
				{ 'steel', math.random(250, 500), true, false },
				{ 'rubber', math.random(250, 500), true, false },
				{ 'copper', math.random(250, 500), true, false },
			},
			job = { '' },
			data = {},
			category = 'Rifles',
		},
		['weapon_advancedrifle'] = {
			item = 'weapon_advancedrifle',
			amount = 1,
			maxCraft = 1,
			successCraftPercentage = 100,
			isItem = true,
			isDisassemble = false,
			time = 240,
			levelNeeded = 4,
			xpPerCraft = 120,
			recipe = {
				{ 'iron', math.random(250, 500), true, false },
				{ 'plastic', math.random(250, 500), true, false },
				{ 'metalscrap', math.random(250, 500), true, false },
				{ 'steel', math.random(250, 500), true, false },
				{ 'rubber', math.random(250, 500), true, false },
				{ 'copper', math.random(250, 500), true, false },
			},
			job = { '' },
			data = {},
			category = 'Rifles',
		},
		['weapon_bullpuprifle_mk2'] = {
			item = 'weapon_bullpuprifle_mk2',
			amount = 1,
			maxCraft = 1,
			successCraftPercentage = 100,
			isItem = true,
			isDisassemble = false,
			time = 240,
			levelNeeded = 5,
			xpPerCraft = 120,
			recipe = {
				{ 'iron', math.random(250, 500), true, false },
				{ 'plastic', math.random(250, 500), true, false },
				{ 'metalscrap', math.random(250, 500), true, false },
				{ 'steel', math.random(250, 500), true, false },
				{ 'rubber', math.random(250, 500), true, false },
				{ 'copper', math.random(250, 500), true, false },
			},
			job = { '' },
			data = {},
			category = 'Rifles',
		},
	
	['weapon_heavypistol'] = {
		item = 'weapon_heavypistol',
		amount = 1,
		maxCraft = 1,
		successCraftPercentage = 75,
		isItem = true,
		isDisassemble = false,
		time = 60,                    -- Crafting time
		levelNeeded = 0,              -- Increased level requirement
		xpPerCraft = 80,              -- Increased XP reward
		recipe = {
			{ 'iron',       math.random(50, 200), true, false }, -- Increased iron requirement
			{ 'aluminum',   math.random(50, 200), true, false }, -- Increased aluminum requirement
			{ 'metalscrap', math.random(50, 200), true, false }, -- Increased metalscrap requirement
			{ 'steel',      math.random(50, 200), true, false }, -- Added steel requirement
		},
		job = { '' },
		data = {},
		category = 'Pistol Bench',
	},
	['weapon_deagle'] = {
		item = 'weapon_deagle',
		amount = 1,
		maxCraft = 1,
		successCraftPercentage = 75,
		isItem = true,
		isDisassemble = false,
		time = 60,                    -- Crafting time
		levelNeeded = 0,              -- Increased level requirement
		xpPerCraft = 80,              -- Increased XP reward
		recipe = {
			{ 'iron', math.random(100, 200), true, false },
			{ 'plastic', math.random(100, 200), true, false },
			{ 'metalscrap', math.random(100, 200), true, false },
			{ 'steel', math.random(100, 200), true, false },
			{ 'rubber', math.random(100, 200), true, false },
			{ 'copper', math.random(100, 200), true, false },
		},
		job = { '' },
		data = {},
		category = 'Pistol Bench',
	},
	['weapon_appistol'] = {
		item = 'weapon_appistol',
		amount = 1,
		maxCraft = 1,
		successCraftPercentage = 75,
		isItem = true,
		isDisassemble = false,
		time = 60,                    -- Crafting time
		levelNeeded = 0,              -- Increased level requirement
		xpPerCraft = 80,              -- Increased XP reward
		recipe = {
			{ 'iron', math.random(100, 200), true, false },
			{ 'plastic', math.random(100, 200), true, false },
			{ 'metalscrap', math.random(100, 200), true, false },
			{ 'steel', math.random(100, 200), true, false },
			{ 'rubber', math.random(100, 200), true, false },
			{ 'copper', math.random(100, 200), true, false },
		},
		job = { '' },
		data = {},
		category = 'SMGs',
	},
	['weapon_sp45'] = {
		item = 'weapon_sp45',
		amount = 1,
		maxCraft = 1,
		successCraftPercentage = 75,
		isItem = true,
		isDisassemble = false,
		time = 80,                    -- Crafting time stays the same
		levelNeeded = 0,              -- Increased level requirement
		xpPerCraft = 100,             -- Increased XP reward
		recipe = {
			{ 'iron',       40, true, false }, -- Increased iron requirement
			{ 'copper',     20, true, false }, -- Increased copper requirement
			{ 'metalscrap', 30, true, false }, -- Increased metalscrap requirement
			{ 'rubber',     15, true, false }, -- Added rubber requirement
			{ 'steel',      20, true, false }, -- Increased steel requirement
		},
		job = { '' },
		data = {},
		category = 'Pistol Bench',
	},
	['weapon_fnx45'] = {
		item = 'weapon_fnx45',
		amount = 1,
		maxCraft = 1,
		successCraftPercentage = 75,
		isItem = true,
		isDisassemble = false,
		time = 150,                   -- Crafting time
		levelNeeded = 0,              -- Increased level requirement
		xpPerCraft = 90,              -- Increased XP reward
		recipe = {
			{ 'iron',       35, true, false }, -- Increased iron requirement
			{ 'plastic',    20, true, false }, -- Increased plastic requirement
			{ 'steel',      15, true, false }, -- Added steel requirement
			{ 'rubber',     10, true, false }, -- Added rubber requirement
			{ 'metalscrap', 25, true, false }, -- Added metalscrap requirement
		},
		job = { '' },
		data = {},
		category = 'Pistol Bench',
	},
}




-------------------------- DISCORD LOGS

-- To set your Discord Webhook URL go to server.lua, line 3

Config.BotName = 'ServerName'       -- Write the desired bot name

Config.ServerName = 'ServerName'    -- Write your server's name

Config.IconURL = ''                 -- Insert your desired image link

Config.DateFormat = '%d/%m/%Y [%X]' -- To change the date format check this website - https://www.lua.org/pil/22.1.html

-- To change a webhook color you need to set the decimal value of a color, you can use this website to do that - https://www.mathsisfun.com/hexadecimal-decimal-colors.html

Config.StartCraftWebhookColor = '16127'

Config.CancelWebhookColor = '16776960'

Config.ClaimCraftWebhookColor = '65352'

Config.FailedCraftWebhookColor = '16711680'

-------------------------- LOCALES (DON'T TOUCH)

function _L(id)
	if Locales[Config.Locale][id] then
		return Locales[Config.Locale][id]
	else
		print('Locale ' .. id .. ' doesn\'t exist')
	end
end

--
