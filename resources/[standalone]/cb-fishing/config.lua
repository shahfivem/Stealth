Config =  {}

--Fishing Rod Animation
Config.Animation = {
  Dict = "amb@world_human_stand_fishing@idle_a",
  Anim = "idle_a",
  Flags = 1,
  BlendInSpeed = 12.0,
  BlendOutSpeed = 12.0,
  Model = "prop_fishing_rod_01",
  Bone = 0x49D9,
  Coords = vector3(0.10, 0.1, 0.0),
  Rotation = vector3(-90.0, -10.0, 0.0),
  BoneID = 31086
}

Config.NetSpeed = 10 -- Minimum speed in MPH to net fish
Config.CatchSpeed = 30 -- Time in seconds between netting fish
Config.Chum = 'bagoffishchum' -- Chum Item Name
Config.ChumChance = 25 -- Chance of chum being removed from net and having to restock (0% means it will never run out, 100% means it will run out after each successful catch)
Config.Net = 5000 -- Time in MS to drop/pickup net
Config.MinNet = 2 -- Minimum amount of fish to catch per net pull
Config.MaxNet = 4 -- Maximum amount of fish to catch per net pull

-- Amount of rep required for each level
Config.Level1 = 200
Config.Level2 = 400
Config.Level3 = 600
Config.Level4 = 800
Config.Level5 = 1000 -- LevelUp to net fishing
Config.Level6 = 1200
Config.Level7 = 1400
Config.Level8 = 1600
Config.Level9 = 1800
Config.Level10 = 2000 -- LevelUp to deep sea fishing

-- Time from casting pole to catching fish
Config.FishingTimeMin = 10 -- Minimum Time to Wait before catching fish (in seconds)
Config.FishingTimeMax = 20 -- Max Time to Wait before catching fish (in seconds)
Config.FishingBait = "fishingbait"
Config.LakeZones = {
  "LACT",
  "TATAMO",
  "ZANCUDO",
  "SANDY",
  "ALAMO",
  "SLAB",
  "MTCHIL",
  "GALFISH",
  "GRAPES",
  "BAYTRE",
  "CHIL"
}

-- Anchor
Config.Anchor = 5000 -- Length of progressbar in ms

-- Shore Fishing (Saltwater)
Config.ShoreFishing = {
-- name = Item Name / Chance to receive item while fishing (Higher the number higher the collective average) / rep = Rep aquired by catching fish
  [1] = { name = 'seatrout', chance = 50, rep = 2 },
  [2] = { name = 'snook', chance = 50, rep = 2 },
  [3] = { name = 'croaker', chance = 50, rep = 2 },
  [4] = { name = 'bluefish', chance = 50, rep = 2 },
  [5] = { name = 'flounder', chance = 50, rep = 2 },
  [6] = { name = 'stripedbass', chance = 50, rep = 2 },
  [7] = { name = 'redsnapper', chance = 50, rep = 2 },
  [8] = { name = 'lanesnapper', chance = 50, rep = 2 },
  [9] = { name = 'cobia', chance = 50, rep = 2 },
  [10] = { name = 'mackerel', chance = 50, rep = 2 },
  -- Treasure Chest
  [11] = { name = 'treasurebox', chance = 5, rep = 2 },
}

-- Shore Fishing (Freshwater)
Config.LakeFishing = {
-- name = Item Name / Chance to receive item while fishing (Higher the number higher the collective average) / rep = Rep aquired by catching fish
  [1] = { name = 'largemouthbass', chance = 50, rep = 2 },
  [2] = { name = 'smallmouthbass', chance = 50, rep = 2 },
  [3] = { name = 'rainbowtrout', chance = 50, rep = 2 },
  [4] = { name = 'bluegill', chance = 50, rep = 2 },
  [5] = { name = 'catfish', chance = 50, rep = 2 },
  [6] = { name = 'crappie', chance = 50, rep = 2 },
  [7] = { name = 'sunfish', chance = 50, rep = 2 },
  [8] = { name = 'walleye', chance = 50, rep = 2 },
  [9] = { name = 'yellowperch', chance = 50, rep = 2 },
  [10] = { name = 'carp', chance = 50, rep = 2 },
   -- Treasure Chest
   [11] = { name = 'treasurebox', chance = 5, rep = 2 },
}

-- Net Fishing
Config.NetFishing = {
-- name = Item Name / Chance to receive item while fishing (Higher the number higher the collective average) / rep = Rep aquired by catching fish
  [1] = { name = 'groundfish', chance = 50, rep = 1 },
  [2] = { name = 'cod', chance = 50, rep = 1 },
  [3] = { name = 'squid', chance = 50, rep = 1 },
  [4] = { name = 'halibut', chance = 50, rep = 1 },
  [5] = { name = 'rockfish', chance = 50, rep = 1 },
  [6] = { name = 'shrimp', chance = 50, rep = 1 },
  [7] = { name = 'grouper', chance = 50, rep = 1 },
  [8] = { name = 'redfish', chance = 50, rep = 1 },
  -- Illegal Fish
  [9] = { name = 'seaturtle', chance = 50, rep = 1 },
  [10] = { name = 'dolphin', chance = 50, rep = 1 },
}

-- Deep Sea Fishing

Config.DeepSeaBait = "fishinglure"
Config.DeepSeaFishingTimeMin = 10 -- Minimum Time to Wait before catching fish (in seconds)
Config.DeepSeaFishingTimeMax = 20 -- Max Time to Wait before catching fish (in seconds)

Config.DeepSeaFishing = {
  [1] = { name = 'sailfish', chance = 50, rep = 4 },
  [2] = { name = 'swordfish', chance = 50, rep = 4 },
  [3] = { name = 'mahimahi', chance = 50, rep = 4 },
  [4] = { name = 'skipjacktuna', chance = 50, rep = 4 },
  [5] = { name = 'bluemarlin', chance = 50, rep = 4 },
  [6] = { name = 'amberjacktuna', chance = 50, rep = 4 },
  [7] = { name = 'wahoo', chance = 50, rep = 4 },
  -- Illegal Fish
  [8] = { name = 'makoshark', chance = 50, rep = 4 },
  [9] = { name = 'killerwhale', chance = 50, rep = 4 },
  [10] = { name = 'goliathgrouper', chance = 50, rep = 4 },
   -- Treasure Box
   [11] = { name = 'treasurechest', chance = 5, rep = 4 },
}

-- Treasure Box/Chest Animation
Config.AnimationTreasure = {
  Dict = "mp_arresting",
  Anim = "a_uncuff",
  Model = "prop_box_ammo07a",
  Bone = 0x49D9,
  Coords = vector3(0.10, -0.10, 0.0),
  Rotation = vector3(270.0, 0.0, 0.0),
}

-- Treasure Box Rewards

Config.MinTreasureBox = 1 -- Min Number of different items located in treasure box
Config.MaxTreasureBox = 2 -- Max Number of different items located in treasure box
Config.LockpickTreasureBox = "lockpick" -- Item needed to lockpick treasure boxes
Config.LockpickFailTreasureBox = 50 -- Chance of breaking lockpick on failed attempt -- 0 will NEVER break. 100 will ALWAYS break
Config.LockpickFailTreasureChest = 50 -- Chance of breaking lockpick on failed attempt -- 0 will NEVER break. 100 will ALWAYS break
Config.TreasureBoxRewards = { -- Add as many items as you would like
  [1] = { name = 'diamond_ring', chance = 50},
  -- Add more items here
}

-- Treasure Chest Rewards

Config.MinTreasureChest = 3 -- Min Number of different items located in treasure box
Config.MaxTreasureChest = 5 -- Max Number of different items located in treasure box
Config.LockpickTreasureChest = "lockpick" -- Item needed to lockpick treasure chests
Config.TreasureChestRewards = { -- Add as many items as you would like
  [1] = { name = 'diamond_ring', chance = 50},
}

-- Fishing Shop

Config.FishShopPedHash = `ig_josef`
Config.FishShopPedCoords = vector4(-1860.33, -1231.43, 8.62, 185.71)
Config.FishingShopBlip = true -- Enable/Disable Shop Blip

Config.FishingShopBlip = {
  sprite = 52,
  color = 30,
  scale = 0.75,
  name = 'Fishing Supply Store'
}

Config.FishingShop = { -- This is only used if you are using Ox Inventory
    name = 'Fishing Shop',
    inventory = {
        { name = 'fishingrod', price = 250 },
        { name = 'fishingbait', price = 3 },
        { name = 'net', price = 250 },
        { name = 'bagoffishchum', price = 20 },
        { name = 'deepsearod', price = 250 },
        { name = 'fishinglure', price = 20 },
    },
    locations = {
        Config.FishShopPedCoords
    }
}

-- Wholesale Fish Stores
Config.FishWholesalePedHash = `s_m_m_migrant_01`
Config.FishWholesalePedCoords = vector4(-960.75, -1287.39, 5.34, 325.58)
Config.FishStoreBlip = true -- Enable/Disable Shop Blip
Config.FishStoreBlip = {
  sprite = 210,
  color = 30,
  scale = 0.75,
  name = 'Fish Buyer',
  locations = {
    vector4(-960.75, -1287.39, 5.34, 325.58),
    vector4(1300.81, 4318.76, 38.16, 306.09),
  },
}

Config.FishWholesale = {
  [1] = {item = 'seatrout', name = 'Sea Trout', price = math.random(100, 200)},
  [2] = {item = 'snook', name = 'Snook', price = math.random(250, 500)},
  [3] = {item = 'croaker', name = 'Croaker', price = math.random(150, 300)},
  [4] = {item = 'bluefish', name = 'Bluefish', price = math.random(250,500)},
  [5] = {item = 'flounder', name = 'Flounder', price = math.random(200,500)},
  [6] = {item = 'stripedbass', name = 'Striped Bass', price = math.random( 350,500)},
  [7] = {item = 'redsnapper', name = 'Red Snapper', price = math.random(250, 500)},
  [8] = {item = 'lanesnapper', name = 'Lane Snapper', price = math.random(250, 500)},
  [9] = {item = 'cobia', name = 'Cobia', price = math.random(250, 500)},
  [10] = {item = 'mackerel', name = 'Mackerel', price = math.random(240, 480)},
  [11] = {item = 'largemouthbass', name = 'Largemouth Bass', price = math.random(250, 480)},
  [12] = {item = 'smallmouthbass', name = 'Smallmouth Bass', price = math.random(300, 450)},
  [13] = {item = 'rainbowtrout', name = 'Rainbow Trout', price = math.random(300, 500)},
  [14] = {item = 'bluegill', name = 'Bluegill', price = math.random(300, 500)},
  [15] = {item = 'catfish', name = 'Cat Fish', price = math.random(300,500)},
  [16] = {item = 'crappie', name = 'Crappie', price = math.random(250,500)},
  [17] = {item = 'sunfish', name = 'Sunfish', price = math.random(300,500)},
  [18] = {item = 'walleye', name = 'Walleye', price = math.random(250,500)},
  [19] = {item = 'yellowperch', name = 'Yellow Perch', price = math.random(250,500)},
  [20] = {item = 'carp', name = 'Carp', price = math.random(100,200)},
}

Config.FishWholesalePedPremiumHash = `s_m_m_migrant_01`
Config.FishWholesalePedPremiumCoords = vector4(1300.81, 4318.76, 38.16, 306.09)

Config.FishWholesalePremium = {
  [1] = {item = 'groundfish', name = 'Ground Fish', price = math.random(250, 500)},
  [2] = {item = 'cod', name = 'Cod', price = math.random(250, 500)},
  [3] = {item = 'squid', name = 'Squid', price = math.random(250, 500)},
  [4] = {item = 'halibut', name = 'Halibut', price = math.random(250, 500)},
  [5] = {item = 'rockfish', name = 'Rockfish', price = math.random(250, 500)},
  [6] = {item = 'shrimp', name = 'Shrimp', price = math.random(250, 500)},
  [7] = {item = 'redfish', name = 'Red Fish', price = math.random(250, 500)},
  [8] = {item = 'grouper', name = 'Grouper', price = math.random(250, 500)},
  [9] = {item = 'sailfish', name = 'Sailfish', price = math.random(250, 500)},
  [10] = {item = 'swordfish', name = 'Swordfish', price = math.random(250, 500)},
  [11] = {item = 'mahimahi', name = 'Mahi Mahi', price = math.random(250, 500)},
  [12] = {item = 'skipjacktuna', name = 'Skipjack Tuna', price = math.random(250, 500)},
  [13] = {item = 'bluemarlin', name = 'Blue Marlin', price = math.random(250, 500)},
  [14] = {item = 'amberjacktuna', name = 'Amberjack Tuna', price = math.random(250, 500)},
  [15] = {item = 'wahoo', name = 'Wahoo', price = math.random(250, 500)},
}

-- Illegal Fish Shop

Config.FishIllegalPedHash = `a_m_m_prolhost_01`
Config.FishIllegalPedCoords = vector4(314.81, 258.59, 104.69, 12.04)

Config.FishIllegalMarket = {
  [1] = {item = 'dolphin', name = 'Dolphin', price = math.random(2000, 3000)},
  [2] = {item = 'seaturtle', name = 'Sea Turtle', price = math.random(2000, 3000)},
  [3] = {item = 'makoshark', name = 'Mako Shark', price = math.random(2000, 3000)},
  [4] = {item = 'killerwhale', name = 'Killer Whale', price = math.random(2000, 3000)},
  [5] = {item = 'goliathgrouper', name = 'Goliath Grouper', price = math.random(2000, 3000)},
}