return {
    core = exports['qb-core']:GetCoreObject(),
    speedType = 'MPH', -- KMH or MPH
    hudKeybind = 'I',
    isLowFuelChecked = true,
    stress = {
        enableStress = true,
        policeStress = true,
        chance = 0.1, -- Percentage stress chance when shooting (0-1)
        minForShaking = 50, -- Minimum stress level for screen shaking
        minForSpeeding = 1000, -- Minimum stress level for speeding while buckled
        minForSpeedingUnbuckled = 50, -- Minimum stress level for speeding while unbuckled
        whitelistedWeapons = { -- Weapons which don't give stress
            `weapon_petrolcan`,
            `weapon_hazardcan`,
            `weapon_fireextinguisher`,
        },
        blurIntensity = { -- Blur intensity for different stress levels
            [1] = {min = 50, max = 60, intensity = 1500},
            [2] = {min = 60, max = 70, intensity = 2000},
            [3] = {min = 70, max = 80, intensity = 2500},
            [4] = {min = 80, max = 90, intensity = 2700},
            [5] = {min = 90, max = 100, intensity = 3000},
        },
        effectInterval = { -- Effect interval for different stress levels
            [1] = {min = 50, max = 60, timeout = math.random(50000, 60000)},
            [2] = {min = 60, max = 70, timeout = math.random(40000, 50000)},
            [3] = {min = 70, max = 80, timeout = math.random(30000, 40000)},
            [4] = {min = 80, max = 90, timeout = math.random(20000, 30000)},
            [5] = {min = 90, max = 100, timeout = math.random(15000, 20000)},
        },
    },
    hudSettings = {
        hudType = "rectangle",  -- Default HUD type
        hudPosition = "left",  -- Default HUD position
    },
}