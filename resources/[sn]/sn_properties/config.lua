Config = {}

Config.debug = false
Config.radial = 'ox_lib' -- options: qb-radialmenu, ox_lib, auto
Config.garage = 'cd_garage' -- options: ak47_garage, cd_garage, codem_garage, jg-advancedgarages, okokGarage, qb-garages, qbx_garages, qs-advancedgarages, rcore_garage, zerio-garage, sn_garages, auto

Config.webHooks = {
	propertyCreated = '',
	propertyBought = '',
	propertySoldBack = '',
}

Config.scprop = { --- screenshot furniture command
	command = 'scprop',
	restricted = 'group.admin'
}

Config.creator = {
	permissionNeeded = 'job', -- job, or admin
	permissionName = 'realestate', -- job name or admin rank
	minJobRank = 0, -- (permissionNeeded being set to job) minimum job rank needed to create houses
}

Config.motorhomes = {
	updateMinimap = true, -- if false the minimap wont be updated while in the motorhome should impove performance
	crashEfect = true, -- use crash effect? (if motorhome crashes the players inside will have an effect)
	minCrashSpeed = 30, -- if crashEfect is true what is the minimum speed a crash can have an effect
	models = {
		['camper'] = 'sn_trailershell',
		['journey'] = 'sn_trailershell',
		['journey2'] = 'sn_trailershell',
	}
}

Config.properties = {
	maxProperties = 10, -- how many properties are players able to own?
	maxKeyholders = 5, -- how many players can be on the house panel (does not include owner)
	maxDecoratingDistance = 20.0, -- while in decorating how far can the player noclip
	furnitureSellBackPercent = 0.75, -- when selling placed furniture how much money you get back from the original value 1.0 being 100% 0.5 = 50%
	allowSellBack = false, -- if true players can sell their properties back to the bank
	sellBackPercent = 0.5, -- when selling property how much money you get back from the original value 1.0 being 100% 0.5 = 50%
	limitStorages = false, -- true will limit the amount of storages properties can have to the ones listed bellow
	maxStorage = {
		small = {
			slots = 50,
			weight = 200000,
		},
		medium = {
			slots = 50,
			weight = 200000,
		},
		large = {
			slots = 50,
			weight = 200000,
		}
	}
}

Config.buying = {
	realtorNeeded = true, -- false = people can buy houses by themselves/true = people require a realtor to purchase a home
	realtorJob = 'realestate', -- (realtorNeeded being true) what job is needed to sell houses
	percentToRealtor = 0.25, -- (realtorNeeded being true) 1.0 being 100% 0.25 being 25% what % cut goes to the realtor
	percentToBusiness = 0.0, -- 1.0 being 100% 0.0 being 0% what % cut goes to the realtorJob business
	viewProperties = vec4(-706.75, 271.81, 82.54, 27.53) -- adds a place in the world you can veiew the properties for sale
}

Config.doors = {
	dynamicDoors = true, -- -- needs setr game_enableDynamicDoorCreation "true" in cfg
	playAnimation = true, -- plays an animation then locking/unlocking a door
	showNotification = true, -- shows lock/unlock notification
	showSprite = true, -- shows [E] text on door
	useThirdEye = false --  if true it will override showSprite
}

Config.defaultStorage = {
	label = 'Storage', 
	slots = 25, 
	maxweight = 100000
}

Config.policeRaids = {
	enabled = true,
	jobs = {
	  --jobName = minimum rank
		['police'] = 2,
	},
	notifyOwner = true, -- if true the player will get a notification if the house is being broken into
	doors = {
		itemRequired = 'police_stormram', -- itemName or {itemname, itemname2} can also be nil for no item required
		minigame = function()
			Wait(500)
			return lib.skillCheck({'easy', 'easy', 'easy'}, {'w', 'a', 's', 'd'})
		end,
		onFail = function() -- runs if a player fails to do the minigame
			-- dispatch code here maybe?
		end
	},
	stashes = {
		itemRequired = 'WEAPON_CROWBAR', -- itemName or {itemname, itemname2} can also be nil for no item required
		minigame = function() -- minigame to unlock stashes (this cant return the item used so you can use tablet:hasItem(item, count) to check if player has an item)
			Wait(500)
			return lib.skillCheck({'easy', 'easy', 'easy'}, {'w', 'a', 's', 'd'})
		end,
		onFail = function() -- runs if a player fails to do the minigame
			-- dispatch code here maybe?
		end
	},
}

Config.propertyRobbing = {
	enabled = false,
	requireOwnerOnline = false,  -- if true the owner of the property must be online for the house to be able to be robbed
	notifyOwner = true, -- if true the player will get a notification if the house is being broken into
	doors = {
		itemRequired = {'lockpick', 'advancedlockpick'}, -- itemName or {itemname, itemname2} can also be nil for no item required
		minigame = function() -- minigame to unlock doors
			Wait(500)
			if tablet:hasItem('advancedlockpick') then
				return lib.skillCheck({'easy', 'easy', 'easy'}, {'w', 'a', 's', 'd'})
			else
				return lib.skillCheck({'hard', 'hard', 'hard'}, {'w', 'a', 's', 'd'})
			end
		end,
		onFail = function() -- runs if a player fails to do the minigame

		end
	},
	stashes = {
		enabled = true,
		itemRequired = {'lockpick', 'advancedlockpick'}, -- itemName or {itemname, itemname2} can also be nil for no item required
		minigame = function() -- minigame to unlock stashes (this cant return the item used so you can use tablet:hasItem(item, count) to check if player has an item)
			Wait(500)
			if tablet:hasItem('advancedlockpick') then 
				return lib.skillCheck({'easy', 'easy', 'easy'}, {'w', 'a', 's', 'd'})
			else
				return lib.skillCheck({'hard', 'hard', 'hard'}, {'w', 'a', 's', 'd'})
			end
			return false
		end,
		onFail = function() -- runs if a player fails to do the minigame
			
		end
	},
}

Config.blips = {
	owned = {
		label = 'House',
		sprite = 40,
		size = 0.7,
		color = 50,
	},
	for_sale = {
		show = true, -- if true properties for sale will be displayed on the map
		label = 'House For Sale',
		sprite = 374,
		size = 0.7,
		color = 43,
	}
}

Config.target = {
	view_properties = {
		label = 'View Properties',
		icon = 'fas fa-magnifying-glass',
	},
	storage = {
		label = 'Open',
		icon = 'fas fa-box',
	},
	raid_storage = {
		label = 'Raid Storage',
		icon = 'fas fa-lock-open',
	},
	wardrobe = {
		label = 'Change',
		icon = 'fas fa-shirt',
	},
	panel = {
		label = 'Open Panel',
		icon = 'fas fa-house',
	},
	logout = {
		label = 'Switch Character',
		icon = 'fas fa-bed',
	},
	door_unlock = {
		label = 'Unlock Door',
		icon = 'fas fa-unlock',
	},
	door_lock = {
		label = 'Lock Door',
		icon = 'fas fa-lock',
	},
	door_enter = {
		label = 'Enter',
		icon = 'fas fa-door-open',
	},
	door_exit = {
		label = 'Exit',
		icon = 'fas fa-door-open',
	},
	door_raid = {
		label = 'Raid Property',
		icon = 'fas fa-lock-open',
	},
	door_lockpick = {
		label = 'lockpick',
		icon = 'fas fa-screwdriver',
	},
}










radialScripts = {
	'qb-radialmenu', 
	'ox_lib'
}

garageScripts = {
	'ak47_garage',
	'cd_garage',
	'codem_garage',
	'jg-advancedgarages',
	'okokGarage',
	'qb-garages',
	'qbx_garages',
	'qs-advancedgarages',
	'rcore_garage',
	'zerio-garage',
	'sn_garages'
}

if Config.radial == 'auto' then
	for _, resource in ipairs(radialScripts) do
		if GetResourceState(resource):find('start') then
			Config.radial = resource
			break
		end
	end
end

if Config.garage == 'auto' then
	for _, resource in ipairs(garageScripts) do
		if GetResourceState(resource):find('start') then
			Config.garage = resource
			break
		end
	end
end