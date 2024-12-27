Beekeeping = {}

SD.Locale.LoadLocale('en') -- Load the locale language, if available. You can change 'en' to any other available language in the locales folder.

Beekeeping.DebugZones = false --- Enable debug for honey zones

Beekeeping.Max = { -- Max amount of houses/hives an individual player can have placed down at any time.    
    Hives = 3, -- Maximum
    Houses = 5, -- Maximum
}

Beekeeping.Interaction = 'target' -- 'target' = qb-target/qtarget/ox_target or 'textui' = cd_drawtextui/qb-core/ox_lib textui 

-- This config does NOT retroactievely apply to houses/hives already placed down. It only applies to new ones placed down after the change.
Beekeeping.SpawnRange = 100 -- Spawn range for the hives/houses from the player. (Default: 100 meters)

Beekeeping.Saving = {
    Method = 'interval',  -- Options: 'txadmin', 'interval', 'resourceStop'
    Interval = 15      -- in minutes, used if SaveMethod is 'interval'
}

-- It's recommended to keep this as false for performance reasons, but if you're testing or making changes to the config, 
-- you can set it to true to reload the objects without needing to relog.
-- If true, requests objects from the server when the script starts or the client loads. 
-- If false, it requests objects when the player is loaded. (e.g. via QBCore:Client:OnPlayerLoaded or esx:playerLoaded)
Beekeeping.LoadOnStart = false -- true/false

-- Beekeeping Expiration Settings
-- The expiration logic controls the durability of hives and houses over time. (Durability starts at a 100)
-- With the current configuration, the durability of a hive/house decreases by 'DecayRate' every 'DecayInterval' minutes.
-- For example, if 'DecayRate' is 1 and 'DecayInterval' is 60 (minutes), then the durability will decrease by 1 every hour.
-- Adjust these values based on your gameplay needs and server balance considerations.
Beekeeping.Expiry = {
    EnableExpiration = true,   -- Enables or disables the expiration logic for hives/houses.
    DecaySettings = {
        -- Settings for 'hive' type.
        hive = {
            DecayRate = 1,       -- The amount by which durability decreases each time the decay interval elapses for hives.
            DecayInterval = 60,  -- Interval in minutes at which the durability decreases by the DecayRate for hives.
        },
        -- Settings for 'house' type.
        house = {
            DecayRate = 2,       -- The amount by which durability decreases each time the decay interval elapses for houses.
            DecayInterval = 120, -- Interval in minutes at which the durability decreases by the DecayRate for houses.
        }
    },
    RepairCostPerOne = 10,    -- The cost to restore one point of durability.
}

Beekeeping.LockAccess = true -- if enabled, lock access to the hive/house to the owner, and allow that owner to add 'collaborators' who will then also have access to the hive/house. If disabled, everyone can access it.
Beekeeping.RaycastingDistance = 10.0 -- Distance in meters that you are allowed to raycast when placing a hive/house.

-- Beekeeping Ped Settings
Beekeeping.Beekeeper = {
    Enable = true, -- If enabled, the beekeeper will spawn at the location below.
    Location = {
        {x = 426.05, y = 6478.9, z = 27.84, w = 234.9},
        -- Add more locations as needed (Will Randomize from available locations each script start)
    },
    Model = "a_m_m_farmer_01",
    Interaction = {
        Icon = "fas fa-circle",
        Distance = 3.0,
    },
    Scenario = "WORLD_HUMAN_STAND_IMPATIENT" -- Full list of scenarios @ https://pastebin.com/6mrYTdQv
}

-- Blip Creation for Beekeeper if the Beekeeper is enabled
Beekeeping.Blip = {
    Enable = true,  -- Set to false to disable blip creation
    Sprite = 106,    -- Sprite/Icon for the blip
    Display = 4,     -- Display type
    Scale = 0.7,     -- Scale of the blip
    Colour = 33,      -- Colour of the blip
    Name = "Beekeeper"  -- Name of the blip
}

-- Beekeeping.ExclusionZones: Array of zones where hive/house placement is disabled.
-- Each zone is defined by a central point ('coords') and a 'radius'.
Beekeeping.ExclusionZones = {
    { coords = vector3(426.05, 6478.9, 27.84), radius = 100 }, -- Example Location (Default Beekeeper Location)
    -- Add more zones as needed
}

-- Beekeeping Buying/Selling Settings if the Beekeeper is enabled
Beekeeping.Shop = {
    Buy = {
        ['bee-house'] = 1000, -- Buy Price
        ['bee-hive'] = 1250, -- Buy Price
    },
    Sell = {
        ['chiliad-honey'] = 75,
        ['green-hills-honey'] = 45,
        ['alamo-honey'] = 35,
        ['bee-honey'] = 25, -- Sell Price
        ['bee-wax'] = 35, -- Sell Price
    },
}

Beekeeping.WorkerThreshold = 10  -- Number of additional workers needed for each multiplier level (eg. if you have 30, it'll be 1.4x Honey Production and so on.)
Beekeeping.Multipliers = {
    [1] = 1.2,  -- 1st level: 1.2x production
    [2] = 1.3,  -- 2nd level: 1.3x production
    [3] = 1.4,  -- 3rd level: 1.4x production
    [4] = 1.5,  -- 3rd level: 1.5x production
    [5] = 2.0,  -- 3rd level: 2x production
    -- Additional levels as needed
}

Beekeeping.HoneyTypes = {
    ['chiliad'] = { -- Mt Chiliad
        displayName = 'Chiliad Honey',
        item = 'chiliad-honey',
    },
    ['green_hills'] = { -- Green Hills
        displayName = 'Green Hills Honey',
        item = 'green-hills-honey',
    },
    ['alamo'] = { -- Alamo Grove (Sandy Shores)
        displayName = 'Alamo Honey',
        item = 'alamo-honey',
    },
    ['basic'] = { -- Default Honey
        displayName = 'Bee Honey',
        item = 'bee-honey',
    },
}

-- Define the honey zones
-- Each zone will have a 'name' and 'honeyType'
Beekeeping.HoneyZones = {
    Enable = true,
    { -- Mt Chiliad
        name = 'Chiliad Meadow',
        honeyType = 'chiliad',
        thickness = 750,
        points = {
            vec3(-52.06, 7790.08, 0.00),
            vec3(3248.96, 6337.81, 0.00),
            vec3(3791.22, 4888.10, 0.00),
            vec3(1315.75, 4216.83, 00.00),
            vec3(-231.41, 4086.02, 00.00),
            vec3(-2334.77, 5159.51, 00.00),
        },
    },
    { -- Green Hills
        name = 'Green Hills',
        honeyType = 'green_hills',
        thickness = 750,
        points = {
            vec3(-2334.77, 5159.51, 0.00),
            vec3(-3265.46, 3373.03, 0.00),
            vec3(-2421.15, -392.66, 0.00),
            vec3(-745.02, 936.11, 0.00),
            vec3(3393.98, -149.63, 0.00),
            vec3(3367.22, 2166.08, 0.00),
        },
    },
    { -- Alamo Grove
        name = 'Alamo Grove',
        honeyType = 'alamo',
        thickness = 750,
        points = {
            vec3(3367.22, 2166.08, 0.00),
            vec3(3791.22, 4888.10, 0.00),
            vec3(1315.75, 4216.83, 0.00),
            vec3(-231.41, 4086.02, 0.00),
        },
    },
    -- Add more zones as needed
}

Beekeeping.House = {
    CaptureTime = 600, -- Time in seconds to capture a new bee
    QueenSpawnChance = 10, -- Chance in % to spawn a queen when capturing new bees
    BeesPerCapture = {2, 3}, -- Min and max bees to capture per capture or fix amount
    QueensPerCapture = 1, -- Min and max queens to capture per capture or fix amount
    MaxQueens = 5, -- Max queens per house
    MaxWorkers = 25, -- Max workers per house
}

Beekeeping.Hives = {
    -- Honey
    HoneyTime = 3600, -- Time in seconds to produce honey & wax
    HoneyPerTime = {1, 3}, -- Min and max honey to produce per time
    MaxHoney = 50, -- Max honey per hive
    -- Wax
    ChanceOfWax = 10, -- In percentage what are the chances to get wax on HoneyTime?
    WaxPerTime = {1, 2}, -- Min and max honey to produce per time
    MaxWax = 20, -- Max wax per hive
    -- Bees
    NeededQueens = 1, -- Amount of queens needed for the hive to work.
    NeededWorkers = 5, -- Amount of workers needed for the hive to work.
    MaxWorkers = 100, -- Max workers per hive
}

Beekeeping.Items = {
    QueenItem = 'bee-queen',
    WorkerItem = 'bee-worker',
    HoneyItem = 'bee-honey',
    WaxItem = 'bee-wax',
    HiveItem = 'bee-hive',
    HouseItem = 'bee-house',
}

--[[
    For bzzz's props (free): https://bzzz.tebex.io/package/5696199
    For nopixel's props (paid): https://3dstore.nopixel.net/package/5622378
]]

Beekeeping.Type = 'bzzz' -- 'bzzz' / 'nopixel' or 'custom'

if Beekeeping.Type == 'bzzz' then
Beekeeping.Props = {
    bee_house = 'bzzz_props_beehive_box_002',
    bee_hive = 'bzzz_props_beehive_box_001',
}
elseif Beekeeping.Type == 'nopixel' then
Beekeeping.Props = {
    bee_house = 'np_beehive',
    bee_hive = 'np_beehive02',
}
elseif Beekeeping.Type == 'custom' then
Beekeeping.Props = {
    bee_house = '',
    bee_hive = '',
}
end

Beekeeping.Grounds = { -- Acceptable materials for gound (grass, etc) [ DO NOT TOUCH IF YOU DON'T KNOW WHAT YOU ARE DOING. ]
    -2041329971, -- Leaves
    -461750719,  -- GrassLong
    1333033863,  -- Grass
    -1286696947, -- GrassShort
    1144315879,  -- ClayHard
    -1942898710, -- MudHard
    -1595148316, -- SandLoose
    -1885547121, -- DirtTrack
    -2041329971, -- Leaves
    -840216541,  -- Rock
    -700658213,  -- Soil
    -913351839,  -- Twigs
    1109728704,  -- MudDeep
    1635937914,  -- MudSoft
    2128369009,  -- GravelLarge
    951832588,   -- GravelSmall
    581794674,   -- Bushes
    510490462,   -- SandCompact
}