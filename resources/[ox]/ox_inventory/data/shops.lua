return {
	General = {
        name = 'Shop',
        blip = {
            id = 59,
            colour = 69,
            scale = 0.8
        },
        inventory = {
            { name = 'ls_baconcarbonara', price = 25 },
            { name = 'ls_peppermintchocky', price = 25 },
            { name = "ls_garlicbread", price = 25 },
            { name = "italiancoffee", price = 25 },
            { name = "sparklingwater", price = 35 },
            { name = "teapot_loverboylatte_infused", price = 55 },
            { name = "sandwich", price = 2 },
            { name = "teapot_peppermint_infused", price = 55 },
            { name = "teapot_peppermint", price = 25 },
            { name = "teapot_jingle_infused", price = 55 },
            { name = "hkbandage", price = 25 },
            { name = "painkillers", price = 50 },
            { name = "teapotlighter", price = 2 },
            { name = "spray", price = 250 },
			{ name = "spray_remover", price = 250 },
        },
        locations = {
            vec3(25.7, -1347.3, 29.49),
            vec3(-3038.71, 585.9, 7.9),
            vec3(-3241.47, 1001.14, 12.83),
            vec3(1728.66, 6414.16, 35.03),
            vec3(1697.99, 4924.4, 42.06),
            vec3(1961.48, 3739.96, 32.34),
            vec3(547.79, 2671.79, 42.15),
            vec3(2679.25, 3280.12, 55.24),
            vec3(2557.94, 382.05, 108.62),
            vec3(373.55, 325.56, 103.56),
            vec3(-705.97, -914.42, 19.22),
        },
        targets = {
            {
                ped = 'mp_m_shopkeep_01',
                scenario = 'WORLD_HUMAN_AA_COFFEE',
                loc = vec3(25.06, -1347.32, 28.5),
                heading = 0.0
            },
            {
                ped = 'a_f_m_bevhills_02',
                scenario = 'WORLD_HUMAN_SMOKING',
                loc = vec3(-3039.18, 585.13, 6.91),
                heading = 15.0
            },
            {
                ped = 'a_m_m_bevhills_02',
                scenario = 'WORLD_HUMAN_STAND_MOBILE',
                loc = vec3(-3242.2, 1000.58, 11.83),
                heading = 175.0
            },
            {
                ped = 's_m_y_cop_01',
                scenario = 'WORLD_HUMAN_COP_IDLES',
                loc = vec3(1728.39, 6414.95, 34.04),
                heading = 65.0
            },
            {
                ped = 'a_f_y_bevhills_01',
                scenario = 'WORLD_HUMAN_WINDOW_SHOP_BROWSE',
                loc = vec3(1698.37, 4923.43, 41.06),
                heading = 235.0
            },
            {
                ped = 's_m_m_autoshop_02',
                scenario = 'WORLD_HUMAN_CLIPBOARD',
                loc = vec3(1960.54, 3740.28, 31.34),
                heading = 120.0
            },
            {
                ped = 'mp_m_shopkeep_01',
                scenario = 'WORLD_HUMAN_AA_SMOKE',
                loc = vec3(548.5, 2671.25, 41.16),
                heading = 10.0
            },
            {
                ped = 'a_f_y_hipster_01',
                scenario = 'WORLD_HUMAN_STAND_MOBILE',
                loc = vec3(2678.29, 3279.94, 54.24),
                heading = 330.0
            },
            {
                ped = 'mp_m_shopkeep_01',
                scenario = 'WORLD_HUMAN_DRINKING',
                loc = vec3(2557.19, 381.4, 107.62),
                heading = 0.0
            },
            {
                ped = 's_f_y_shop_low',
                scenario = 'WORLD_HUMAN_WINDOW_SHOP_BROWSE',
                loc = vec3(373.13, 326.29, 102.57),
                heading = 345.0
            },
            {
                ped = 's_m_y_dealer_01',
                scenario = 'WORLD_HUMAN_DRUG_DEALER_HARD',
                loc = vec3(-705.97, -914.42, 17.22),
                heading = 88.78
            },
        }
    },

    Liquor = {
        name = 'Liquor Store',
        blip = {
            id = 93, 
            colour = 69, 
            scale = 0.8
        }, 
        inventory = {
			{ name = 'whiskey', price = 1500 },
			{ name = 'rum', price = 1500 },
			{ name = 'vodka', price = 1500 },
			{ name = 'gin', price = 1500 },
			{ name = 'tequila', price = 1500 },
			{ name = 'scotch', price = 1500 },
        },		 
        locations = {
            vec3(1135.808, -982.281, 46.415),
            vec3(-1222.915, -906.983, 12.326),
            vec3(-1487.553, -379.107, 40.163),
        },
        targets = {
            {
                ped = 's_m_m_bouncer_01',
                scenario = 'WORLD_HUMAN_CLIPBOARD',
                loc = vec3(1134.9, -982.34, 45.41),
                heading = 96.0
            },
            {
                ped = 'a_m_y_business_01',
                scenario = 'WORLD_HUMAN_DRINKING',
                loc = vec3(-1222.33, -907.82, 11.43),
                heading = 32.7
            },
            {
                ped = 's_f_y_bartender_01',
                scenario = 'WORLD_HUMAN_AA_SMOKE',
                loc = vec3(-1486.67, -378.46, 39.26),
                heading = 133.77
            }
        }
    },
	
	YouTool = {
		name = 'Tool Shop',
		blip = {
			id = 402,
			colour = 69,
			scale = 0.8
		},
		inventory = {
			{ name = "lockpick", price = 200 },
			{ name = "advancedlockpick", price = 500 },
			{ name = "lightarmour", price = 250 },
			{ name = "WEAPON_HAMMER", price = 250 },
			{ name = "tirekit", price = 500 },
			{ name = "repairkit", price = 250 },
			{ name = "screwdriverset", price = 350 },
			{ name = "ls_gas_mask", price = 350 },
			{ name = "phone", price = 850 },
			{ name = "radio", price = 600 },
			{ name = "cleaningkit", price = 150 },
			{ name = "chop_torch", price = 400 },
			{ name = "cleaningkit", price = 150 },
			{ name = "advancedrepairkit", price = 500 },
			{ name = "wallet", price = 500 },
			{ name = "duffelbag", price = 900 },
			{ name = "laptop", price = 5000 },
			
		},
		locations = {
			vec3(2748.0, 3472.79, 55.67),
			vec3(342.99, -1298.26, 32.51),
			vec3(46.41, -1749.47, 29.64)
		},
		targets = {
			{
				ped = `s_m_m_autoshop_02`,
				scenario = 'WORLD_HUMAN_CLIPBOARD',
				loc = vec3(2748.0, 3472.79, 54.67),
				heading = 65.0
			},
			{
				ped = `a_m_y_business_03`,
				scenario = 'WORLD_HUMAN_AA_SMOKE',
				loc = vec3(342.99, -1298.26, 30.51),
				heading = 180.0
			},
			{
				ped = `s_m_y_shop_mask`,
				scenario = 'WORLD_HUMAN_STAND_MOBILE',
				loc = vec3(46.41, -1749.47, 28.64),
				heading = 48.18
			},
		}
	},
	
	Ammunation = {
		name = 'Ammunation',
		blip = {
			id = 110,
			colour = 69,
			scale = 0.8
		},
		inventory = {
			{ name = "WEAPON_KNIFE", price = 200 },
			{ name = "WEAPON_BAT", price = 200 },
			{ name = "WEAPON_HATCHET", price = 2000 },
			{ name = "WEAPON_PISTOL", price = 1200, license = 'weapon' },
			{ name = "WEAPON_1911", price = 1600, license = 'weapon' },
			{ name = "WEAPON_VINTAGEPISTOL", price = 1500, license = 'weapon' },
			{ name = "pistolammo", price = 150 }
		},
		locations = {
			vec3(-662.180, -934.961, 21.829),
			vec3(810.25, -2157.60, 29.62),
			vec3(1693.44, 3760.16, 34.71),
			vec3(-330.24, 6083.88, 31.45),
			vec3(252.63, -50.00, 69.94),
			vec3(22.56, -1109.89, 29.80),
			vec3(2567.69, 294.38, 108.73),
			vec3(-1117.58, 2698.61, 18.55),
			vec3(842.44, -1033.42, 28.19)
		},
		targets = {
			{
				ped = `s_m_y_ammucity_01`,
				scenario = 'WORLD_HUMAN_CLIPBOARD',
				loc = vec3(-660.92, -934.10, 21.94),
				heading = 180.0
			},
			{
				ped = `s_m_y_ammucountry`,
				scenario = 'WORLD_HUMAN_GUARD_STAND',
				loc = vec3(808.86, -2158.50, 29.73),
				heading = 360.0
			},
			{
				ped = `s_m_y_ammucity_01`,
				scenario = 'WORLD_HUMAN_CLIPBOARD',
				loc = vec3(-1304.39, -394.87, 36.7),
				heading = 71.97
			},
			{
				ped = `s_m_m_armoured_01`,
				scenario = 'WORLD_HUMAN_STAND_MOBILE',
				loc = vec3(1693.57, 3761.60, 34.82),
				heading = 227.39
			},
			{
				ped = `s_f_y_shop_low`,
				scenario = 'WORLD_HUMAN_AA_SMOKE',
				loc = vec3(-330.29, 6085.54, 31.57),
				heading = 225.0
			},
			{
				ped = `a_m_y_business_01`,
				scenario = 'WORLD_HUMAN_DRINKING',
				loc = vec3(252.85, -51.62, 70.0),
				heading = 70.0
			},
			{
				ped = `s_m_y_dealer_01`,
				scenario = 'WORLD_HUMAN_DRUG_DEALER_HARD',
				loc = vec3(23.68, -1106.46, 29.91),
				heading = 160.0
			},
			{
				ped = `s_m_y_cop_01`,
				scenario = 'WORLD_HUMAN_AA_COFFEE',
				loc = vec3(2566.59, 293.13, 108.85),
				heading = 360.0
			},
			{
				ped = `s_m_y_blackops_01`,
				scenario = 'WORLD_HUMAN_CLIPBOARD',
				loc = vec3(-1117.61, 2700.26, 18.67),
				heading = 221.82
			},
			{
				ped = `s_m_m_security_01`,
				scenario = 'WORLD_HUMAN_GUARD_STAND',
				loc = vec3(841.05, -1034.76, 28.31),
				heading = 360.0
			}
		}
	},
	

	PoliceArmoury = {
		name = 'Police Armoury',
		groups = shared.police,
		blip = {
			id = 110,
			colour = 84,
			scale = 0.8
		},
		inventory = {
			{ name = 'pistolammo', price = 5 },
			{ name = 'subammo', price = 5 },
			{ name = 'rifleammo', price = 5 },
			{ name = 'bbammo', price = 5 },
			{ name = 'shotgunammo', price = 5 },
			{ name = 'WEAPON_FLASHLIGHT', price = 200 },
			{ name = 'WEAPON_NIGHTSTICK', price = 100 },
			{ name = 'WEAPON_GLOCK17', price = 500, metadata = { registered = true, serial = 'POL' } },
			{ name = 'WEAPON_MP5', price = 1500, metadata = { registered = true, serial = 'POLTAC' } },
			{ name = 'WEAPON_PUMPSHOTGUN', price = 500, metadata = { registered = true, serial = 'POLTAC' } },
			{ name = 'WEAPON_BBSHOTTY', price = 1000, metadata = { registered = true, serial = 'POLTAC' } },
			{ name = 'WEAPON_CARBINERIFLE', price = 1000, metadata = { registered = true, serial = 'POLTAC' } },
			{ name = 'WEAPON_CARBINERIFLE_MK2', price = 3000, metadata = { registered = true, serial = 'POLTAC' } },
			{ name = 'WEAPON_TACTICALRIFLE', price = 3000, metadata = { registered = true, serial = 'POLTAC' } },
			{ name = 'WEAPON_MK18', price = 3500, metadata = { registered = true, serial = 'POL' } },
			{ name = 'WEAPON_STUNGUN', price = 500, metadata = { registered = true, serial = 'POL' } },
			{ name = 'WEAPON_PROLASER4', price = 500, metadata = { registered = true, serial = 'POL' } },
			{ name = 'handcuffs', price = 5 },
			{ name = 'empty_evidence_bag', price = 5 },
			{ name = 'megaphone', price = 100 },
			{ name = 'nikon', price = 100 },
			{ name = 'sdcard', price = 5 },
			{ name = 'gsrtestkit', price = 50 },
			{ name = 'dnatestkit', price = 50 },
			{ name = 'fingerprintreader', price = 50 },
			{ name = 'accesstool', price = 25 },
			{ name = 'fingerprintkit', price = 25 },
			{ name = 'mikrosil', price = 5 },
			{ name = 'fingerprinttape', price = 5 },
			{ name = 'blox', price = 5 },
			{ name = 'microfibercloth', price = 5 },

			{ name = 'bodycam', price = 5 },
			

			-- New items
			{ name = 'tintmeter', price = 100 },
			{ name = 'nikkit', price = 200 },
			{ name = 'usednikkit', price = 100 },
			{ name = 'nightvision', price = 5000 },
			{ name = 'thermalvision', price = 5000 },
			{ name = 'gasmask', price = 3000 },
		},
		locations = {
			vec3(482.62, -995.18, 30.69), -- Example location for the shop
		},
			targets = {
				{
					loc = vec3(482.62, -995.18, 30.69), -- Center of the shop zone
					length = 0.7,
					width = 0.5,
					heading = 0.0,
					minZ = 43.0, -- Adjust Z-coordinates to fit your environment
					maxZ = 43.5,
					distance = 1.5 -- Distance to interact with the shop
				},
			},
		},

	EmsInsurance = {
		name = 'Ems Insurance',
		inventory = {
			{ name = 'mzinsurance_bronze_week', price = 100 },
			{ name = 'mzinsurance_bronze_month', price = 400 },
			{ name = 'mzinsurance_silver_week', price = 200 },
			{ name = 'mzinsurance_silver_month', price = 800 },
			{ name = 'mzinsurance_gold_week', price = 300 },
			{ name = 'mzinsurance_gold_month', price = 1200 },
			{ name = 'mzinsurance_diamond_week', price = 400 },
			{ name = 'mzinsurance_diamond_month', price = 1600 },
		},
		locations = {
			vec3(303.05, -584.07, 43.52) -- Primary location
		},
		targets = {
			{
				loc = vec3(303.05, -584.07, 43.52), -- Center of the shop zone
				length = 0.7,
				width = 0.5,
				heading = 0.0,
				minZ = 43.0, -- Adjust Z-coordinates to fit your environment
				maxZ = 43.5,
				distance = 1.5 -- Distance to interact with the shop
			},
		}
	},

	EmsArmory = {
		name = 'EMS Armory',
		inventory = {
			{ name = 'emsmedbag', price = 25 },
			{ name = 'handcuffs', price = 100 },
			{ name = 'bandage', price = 5 },
			{ name = 'hkbandage', price = 5 },
			{ name = 'pbandage', price = 5 },
			{ name = 'prbandage', price = 5 },
			{ name = 'dabandage', price = 5 },
			{ name = 'sthbandage', price = 5 },
			{ name = 'swmbandage', price = 5 },
			{ name = 'hpbandage', price = 5 },
			{ name = 'mnbandage', price = 5 },
			{ name = 'ntbandage', price = 5 },
			{ name = 'ppgbandage', price = 5 },
		},
		locations = {
			vec3(325.57, -590.54, 43.37) -- Primary location
		},
		targets = {
			{
				loc = vec3(325.57, -590.54, 43.37), -- Center of the shop zone
				length = 0.7,
				width = 0.5,
				heading = 0.0,
				minZ = 43.0, -- Adjust Z-coordinates to fit your environment
				maxZ = 43.5,
				distance = 1.5 -- Distance to interact with the shop
			},
		}
	},
	

	-- EMS PED WITH CUSTOM HEALS
	EmsPublicStore = {
		name = 'Hey, how can I help?',
		inventory = {
			{ name = 'medbag', price = 800 },
			{ name = 'bandage', price = 25 },
			{ name = 'hkbandage', price = 25 },
			{ name = 'pbandage', price = 25 },
			{ name = 'prbandage', price = 25 },
			{ name = 'dabandage', price = 25 },
			{ name = 'sthbandage', price = 25 },
			{ name = 'swmbandage', price = 25 },
			{ name = 'hpbandage', price = 25 },
			{ name = 'mnbandage', price = 25 },
			{ name = 'ntbandage', price = 25 },
			{ name = 'ppgbandage', price = 25 },
			{ name = 'painkillers', price = 25 },
		},
		locations = {
			vec3(309.59, -589.92, 43.27), -- Example location for the shop
		},
		targets = {
			{
				ped = `s_m_m_doctor_01`,
				scenario = 'WORLD_HUMAN_CLIPBOARD',
				loc = vec3(309.59, -589.92, 42.27),
				heading = 48.94
			},
		}
	},

	VendingMachineDrinks = {
		name = 'Vending Machine',
		inventory = {
			{ name = 'water', price = 10 },
			{ name = 'cola', price = 10 },
			{ name = 'limoncello', price = 15 },
			{ name = 'sparklingwater', price = 12 },
			{ name = 'mojito', price = 20 },
			{ name = 'raspitaliansoda', price = 15 },
			{ name = 'italiansoda', price = 15 },
			{ name = 'apricotjuice', price = 14 },
			{ name = 'dragonitaliansoda', price = 15 },
			{ name = 'peachdrink', price = 18 }
		},
		model = {
			`prop_vend_soda_02`, `prop_vend_fridge01`, `prop_vend_water_01`, `prop_vend_soda_01`
		}
	},
	
	VendingMachineFood = {
		name = 'Food Vending Machine',
		inventory = {
			{ name = 'twerks_candy', price = 10 },
			{ name = 'snikkel_candy', price = 10 },
			{ name = 'gnocchi', price = 30 },
			{ name = 'bruschetta', price = 25 },
			{ name = 'chopsalad', price = 28 },
			{ name = 'spaghetti', price = 35 },
			{ name = 'pancetta', price = 32 },
			{ name = 'calzone', price = 33 },
			{ name = 'lasagna', price = 40 },
			{ name = 'vealparm', price = 45 },
			{ name = 'fettalfredo', price = 35 },
			{ name = 'stuffshell', price = 30 },
			{ name = 'gelato', price = 20 },
			{ name = 'coffeegelato', price = 22 }
		},
		model = {
			`prop_vend_snak_01`, `prop_vend_snak_01_tu`
		}
	},
	BlackMarket = {
		name = 'Black Market',
		inventory = {
			{ name = 'boosting_usb', price = 200, currency = 'loosenotes' },
		}, locations = {
			vec3(1042.44, -2058.7, 31.02), -- Example location for the shop
		},
		targets = {
			{
				ped = `s_m_y_dealer_01`,
				scenario = 'WORLD_HUMAN_CLIPBOARD',
				loc = vec3(1042.44, -2058.7, 30.02),
				heading = 80
			},
		}
	},
	Photograhphy = {
		name = 'Photography Shop',
		blip = {
			id = 184,
			color = 69,
			scale = 0.8
		},
		inventory = {
			{ name = 'photolights', price = 500, currency = 'money' },
		}, locations = {
			vec3(-1011.99, -480.32, 39.97), -- Example location for the shop
		},
		targets = {
			{
				ped = `a_m_y_vinewood_02`,
				scenario = 'WORLD_HUMAN_CLIPBOARD',
				loc = vec3(-1011.99, -480.32, 38.97),
				heading = 121.2
			},
		}
	},
	AttachmentPed = {
		name = 'Attachments',
		inventory = {
			{ name = 'at_flashlight', price = 10, currency = 'markedbills' },
			{ name = 'at_suppressor_light', price = 35, currency = 'markedbills' },
			{ name = 'at_suppressor_heavy', price = 40, currency = 'markedbills' },
			{ name = 'at_grip', price = 20, currency = 'markedbills' },
			{ name = 'at_barrel', price = 20, currency = 'markedbills' },
			{ name = 'at_clip_extended_pistol', price = 15, currency = 'markedbills' },
			{ name = 'at_clip_extended_smg', price = 20, currency = 'markedbills' },
			{ name = 'at_clip_extended_rifle', price = 25, currency = 'markedbills' },
			{ name = 'at_clip_drum_smg', price = 40, currency = 'markedbills' },
			{ name = 'at_clip_drum_rifle', price = 60, currency = 'markedbills' },
			{ name = 'at_scope_small', price = 20, currency = 'markedbills' },
			{ name = 'at_scope_medium', price = 25, currency = 'markedbills' },
		}, locations = {
			vec3(1255.84, -2562.61, 42.72), -- Example location for the shop
		},
		targets = {
			{
				ped = `s_m_y_dealer_01`,
				scenario = 'WORLD_HUMAN_AA_SMOKE',
				loc = vec3(1255.84, -2562.61, 42.72),
				heading = 247.31
			},
		}
	},
}
