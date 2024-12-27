Cargo = {}

-- Weapon Loot Tiers
Cargo.Config = {
     
    -- Compatible with ps-dispatch or cd_dispatch :)

    PoliceAlerts = 'ps-dispatch',


    WeaponsTier1 = {
        {name = 'weapon_pistol50', quantity = 2},
        {name = 'weapon_appistol', quantity = 1},
        {name = 'rifleammo', quantity = 5},
        {name = 'subammo', quantity = 5},
        {name = 'pistolammo', quantity = 5},
    },

    CratePositions = {
        vector4(3059.65, -4626.7, 14.26, 162.26),
        vector4(3026.71, -4691.89, 14.26, 169.76),
        vector4(3101.97, -4798.6, 14.26, 168.45),
        vector4(3048.78, -4692.05, 5.08, 91.0),
        vector4(3079.59, -4638.22, 5.08, 291.63)
    },

    WeaponsTier2 = {
        {name = 'weapon_heavypistol', quantity = 1},
        {name = 'weapon_microsmg', quantity = 1},
        {name = 'weapon_compactrifle', quantity = 1},
        {name = 'bluekeycard', quantity = 1},
        {name = 'subammo', quantity = 5},
        {name = 'pistolammo', quantity = 5},
        {name = 'rifleammo', quantity = 5},
    },

    WeaponsTier3 = {
        {name = 'weapon_machinepistol', quantity = 1},
        {name = 'weapon_compactrifle', quantity = 1},
        {name = 'rifleammo', quantity = 5},
        {name = 'subammo', quantity = 5},
        {name = 'pistolammo', quantity = 5},
    },

    WeaponsTier4 = {
        {name = 'weapon_carbinerifle_mk2', quantity = 1},
        {name = 'weapon_assaultsmg', quantity = 1},
        {name = 'rifleammo', quantity = 5},
        {name = 'subammo', quantity = 5},
        {name = 'pistolammo', quantity = 5},
        {name = 'redkeycard', quantity = 1},
    },

    BoatSpawns = {
        {id = 1, coords = vector3(1311.8400, -3307.4758, 6.2272), model = `dinghy4`},
        {id = 2, coords = vector3(1311.5734, -3291.5498, 5.9692), model = `dinghy4`},
        {id = 3, coords = vector3(1311.7594, -3259.7407, 5.0587), model = `dinghy4`},
        {id = 4, coords = vector3(1312.0035, -3237.4731, 4.7996), model = `dinghy4`},
        {id = 5, coords = vector3(1312.1346, -3226.3955, 4.7039), model = `dinghy4`},
        {id = 6, coords = vector3(1312.5757, -3185.8618, 4.3932), model = `dinghy4`},
        {id = 7, coords = vector3(1312.7087, -3171.0005, 4.3074), model = `dinghy4`},
        {id = 8, coords = vector3(1312.5005, -3195.0156, 4.4324), model = `dinghy4`},
        {id = 9, coords = vector3(1312.3152, -3215.4531, 4.5387), model = `dinghy4`},
        {id = 10, coords = vector3(1310.9573, -3326.4072, 5.1043), model = `dinghy4`},
    },

    HealthPackZones = {
        -- Define health pack zones using vector4(x, y, z, heading)
        { name = "health_zone_1", coords = vector4(3086.33, -4795.1, 2.03, 12.76), length = 2.0, width = 2.0 },
        { name = "health_zone_2", coords = vector4(3034.98, -4689.28, 6.08, 101.85), length = 2.0, width = 2.0 },
        { name = "health_zone_3", coords = vector4(3096.73, -4702.06, 12.24, 284.66), length = 2.0, width = 2.0 },
        { name = "health_zone_4", coords = vector4(-397.57, -4131.21, 9.32, 40.22), length = 2.0, width = 2.0 },
        { name = "health_zone_5", coords = vector4(-397.57, -4131.21, 9.32, 40.22), length = 2.0, width = 2.0 }
        
    },
    
    HealthPackItems = {
        { name = "bandage", quantity = 5 },
        { name = "medbag", quantity = 2 },
        { name = "medicalsyringe", quantity = 2 },
        { name = "medarmour", quantity = 2 },
        
    },

    GuardSpawnPoints = {
        { coords = vector3(3075.23, -4683.16, 15.26), heading = 45.0 },
        { coords = vector3(3108.2, -4768.8, 15.26), heading = 90.0 },
        { coords = vector3(3076.3, -4755.03, 6.08), heading = 135.0 },
        { coords = vector3(3044.9, -4644.69, 6.08), heading = 135.0 },
        { coords = vector3(3100.13, -4800.61, 2.04), heading = 135.0 },
        { coords = vector3(3098.72, -4764.72, 6.08), heading = 135.0 },
    },

    GuardWeapon = "WEAPON_ASSAULTRIFLE",
}