Config = Config or {}
Loc = {}

-- //////////////////////////////////////////////////
-- ///////////////// Our Discord ////////////////////
-- //////// https://discord.gg/bJNxYDAm5u ///////////
-- //////////////////////////////////////////////////

Config = {
    debug = false, -- Shows polyzones created inside the game
    Lan = 'en', -- Translation, 'en' 'pl' 'de' 'da' 'fr' 'in' 'am' 'ph' 'no' 'nl' 'ja' 'da' 'ru' 'gr' 'se' 'lt' 'ar' 'bg' 'bs', 'cn', 'cs', 'ee', 'el', 'en', 'es', 'et', 'fa', 'fi', 'ge', 'he', 'hu', 'id', 'is', 'it', 'lv', 'pt', 'pt-br', 'ro', 'rs', 'sl', 'sv', 'th', 'tr', 'vn'
    Framework = 'qbox', -- 'qb-core' 'qbox' 'esx' or 'custom'
    Core = {resource = "qb-core", name = "QBCore", abbrev = "qb"}, -- (QBCore Only) If you arent using qb-core no need to change anything here
    ESX = "new", -- (only for ESX users) "new" or "old" chosoe the version of ESX you are using
    Inventory = "ox", -- "ox" or "qs" or "qb" or "esx" or "lj" or "ps", if you arent using any of these inventories, put it as "other" and you will need to edit the inventory export function, or open a ticket on discord.
    Dispatch = "ps", -- "ps" "cd" "qs" "origen" "tk" "codem" "rcore" or "outlaw", if you arent using any of these dispatch systems, put it as "other" and you will need to edit the dispatch export function, or open a ticket on discord.
    Notification = "ox", -- "ox" or "qb" or "esx"
    Progressbar = "ox", -- "ox" or "qb"
    Weather = "renewed", -- "qb" or "cd" "renewed" or "av"

    -- For lb phones you need to download this resource: https://github.com/solareon/slrn_groups/
    -- (Coming soon) Phone = "qb", -- "qb" "icy" "lb" (Open a ticket on discord if you have snippets of differnt phone groups)

    Target = 'ox_target', -- Target name
    WorldInteract = false, -- Enable/Disable World Interactions (Only use this if you have the interact script, otherwise leave it as false)

    TestingMode = false, -- Enable/Disable Testing Mode (No Minigames)

    DiscordLogStatus = false, -- Choose whether u want to turn on discord logs or not, you need to add a webhook below for it to work
    -- To add your webhook go to opensource -> server, line 1 and add your webhook there

    Cooldown = 15, -- (Minutes) This works both for normal robberies and group work robberies (0 = no cooldown)
    GlobalCooldown = {
        ["Status"] = false, -- If true, it will add a cooldown on the npc for all players when someone requests a house robbery
        ["Time"] = 15, -- (Minutes) How long the cooldown will be
    },

    Drawtext = "OX", -- OLDQB for qb-drawtext, QB for new qbcore drawtext, OX for ox_lib
    DrawTextZoneSize = vec3(1.5, 1.5, 2), -- Size of the drawtext zone
    Interaction = { -- 'true' for Target interactions, 'false' for drawtext interactions
        ["Button"] = 38, -- [E] by default, change depending on used target

        ["NPC"] = true,
        ["Exit"] = true,
        ["Enter"] = true,
        ["Lockpick"] = true,
        ["Props"] = true,
        ["Searching"] = true,
        ["Safe"] = true,
    },

    PoliceJobs = {["police"] = true}, -- Jobs that can receive the dispatch
    MinimumPolice = 0, -- Minimum police required to start the robbery

    TimeFrame = {min = 20, max = 6}, -- Robbery time frame
    AutomaticallyResetHouse = 15, -- (Minutes) How long until the house resets automatically after someone enters

    -- Durations
    NotificationDuration = 5000, -- How long the notifications will be shown
    PropsDuration = 8500, -- (Props) How long the second progressbar will take
    SearchingDuration = 6000, -- (Searching) How long the first progressbar will take

    -- Lockpick
    ItemBreakChance = 10, -- Chance of losing the lockpick after lockpicking the house
    ItemBreakOnFailChance = 50, -- Chance of losing the lockpick if a player fails the lockpick minigame
    RequiredItemShell = "lockpick", -- Item name of the first tool that can be used
    RequiredItemIPL = "advancedlockpick", -- Item name of the second tool that can be used

    -- Stealth
    AddScoreWhenFailed = 10.0, -- (Set to 0 to turn off) Adds this amount to the stealth score if the player fails the minigame
    StealthScore = 300, -- If a player reaches this score, the alarm will be enabled (Increment to make it easier or decrement to make it harder)
    WearingShoes = 0.01, -- (Every step taken) Adds this amount to the stealth score if the player is wearing shoes every
    SilencedWeapon = 20.0, -- (Every shot) Adds this amount to the stealth score if the player is using a silenced weapon
    Crouching = 0.001, -- (Every step taken) Adds this amount to the stealth score if the player is crouching
    Jumping = 20.0, -- (Every jump) Adds this amount to the stealth score if the player is jumping
    Sprinting = 1.5, -- (Every step taken) Adds this amount to the stealth score if the player is sprinting
    Running = 3.0, -- (Every step taken) Adds this amount to the stealth score if the player is running

    ["Evidence"] = {
        ["Status"] = true, -- Enable/disable evidence
        ["Chance"] = 50, -- Chance of having fingerprints
    },

    StressChance = 35, -- (%) Chance of gaining stress per action
    ["Stress"] = { -- Set status for Stress(on/off) and stress gained per action, turn them all to false, to fully disable it
        ["LockPickIPL"] = {status = true, gain = math.random(1, 4)},
        ["PropsIPL"] = {status = true, gain = math.random(1, 5)},
        ["FurnitureIPL"] = {status = true, gain = math.random(1, 3)},
        ["LockPickShell"] = {status = true, gain = math.random(1, 4)},
        ["FurnitureShell"] = {status = true, gain = math.random(1, 3)},
    },

    -- Group Work (If you want to use this, you need to have a group system)
    GroupWork = false, -- Enable/disable group work
    GroupMinimum = 1, -- Minimum players required to start a group work
    GroupLimit = 3, -- Max players that can be in a house robbery group to start a job

    -- Npc settings, works for both non-group work and group work
    ["NPC"] = {
        ["Status"] = true, -- Enable/disable npc
        ["Models"] = { -- Random models of the npc, remove or add more if you want
            "g_m_m_chicold_01",
            "g_m_m_mexboss_02",
            "g_m_m_mexboss_01",
            "g_m_y_mexgang_01",
        },
        ["Coords"] = { -- Random coords where the npc will spawn, remove or add more if you want
            vector4(116.34, -1953.83, 19.75, 41.11),
            -- vector4(-728.55, 187.34, 80.96, 112.18),
            -- vector4(551.65, 2663.23, 44.87, 275.66),
            -- vector4(-176.01, 6152.01, 41.64, 133.42),
        },
        ["Animation"] = "WORLD_HUMAN_LEANING", -- Animation of the npc
    },

    IPLChance = 10, -- Chance of getting an ipl if you are using an NPC and no skill system

    -- Skill System (If you want to use this, you need to have a skill system)
    SkillSystem = false, -- Enable/disable skill system
    ClientSideEvents = false, -- If false, it will use server side events, if true, it will use client side events for the skill system

    ShellLevel = {
        [1] = 1, -- Tier 1
        [2] = 10, -- Tier 2
        [3] = 15, -- Tier 3
    },

    IPLLevel = {
        [1] = 20, -- Tier 1
        [2] = 25, -- Tier 2
        [3] = 30, -- Tier 3
    },
}

Config.RewardsIPL = {
    [1] = { -- IPL Tier
        itemCount = {min = 1, max = 2}, -- Amount of items that can be obtained in this tier
        chance = 50, -- Chance of getting an item while searching in this tier
        bonusItem = "rolex", -- Item that can be obtained as a bonus
        bonusChance = 10, -- Chance of getting the bonus item
        bonusAmount = {min = 1, max = 1}, -- Amount of the bonus item
        Exp = {min = 15, max = 18}, -- Only if you have a level system
        ExpProps = {min = 20, max = 23}, -- Only if you have a level system
        -- Safe Settings:
        -- Chance of a safe spawning is determined indivbidually for each IPL, check the IPL configs themselves
        SafeItemCount = {min = 1, max = 2}, -- Amount of items that can be obtained from the safe loot table below
        ExpSafe = {min = 20, max = 25}, -- Only if you have a level system

        ["cabin"] = { -- The total chance of this section should be = 100
            {Name = "screwdriverset", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "fitbit", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "lockpick", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "samsungphone", Chance = 25, Amount = {min = 1, max = 1}},
        },
        ["kitchen"] = {  -- The total chance of this section should be = 100
            {Name = "bandage", Chance = 25, Amount = {min = 1, max = 2}},
            {Name = "painkillers", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "water_bottle", Chance = 25, Amount = {min = 1, max = 2}},
            {Name = "joint", Chance = 25, Amount = {min = 1, max = 1}},
        },
        ["chest"] = {  -- The total chance of this section should be = 100
            {Name = "diamond", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "rolex", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "iphone", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "samsungphone", Chance = 25, Amount = {min = 1, max = 1}},
        },
        ["livingroom"] = {  -- The total chance of this section should be = 100
            {Name = "fitbit", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "screwdriverset", Chance = 25, Amount = {min = 1, max = 2}},
            {Name = "bandage", Chance = 25, Amount = {min = 1, max = 2}},
            {Name = "plastic", Chance = 25, Amount = {min = 1, max = 1}},
        },
        ["safe"] = {  -- The total chance of this section should be = 100
            {Name = "rolex", Chance = 25, Amount = {min = 2, max = 3}},
            {Name = "diamond", Chance = 25, Amount = {min = 2, max = 3}},
            {Name = "goldchain", Chance = 25, Amount = {min = 2, max = 3}},
            {Name = "weapon_pistol", Chance = 25, Amount = {min = 1, max = 1}},
        }
    },
    [2] = { -- IPL Tier
        itemCount = {min = 1, max = 2}, -- Amount of items that can be obtained in this tier
        chance = 60, -- Chance of getting an item while searching in this tier
        bonusItem = "diamond", -- Item that can be obtained as a bonus
        bonusChance = 10, -- Chance of getting the bonus item
        bonusAmount = {min = 1, max = 1}, -- Amount of the bonus item
        Exp = {min = 22, max = 24}, -- Only if you have a level system
        ExpProps = {min = 27, max = 29}, -- Only if you have a level system
        -- Safe Settings:
        -- Chance of a safe spawning is determined indivbidually for each IPL, check the IPL configs themselves
        SafeItemCount = {min = 1, max = 2}, -- Amount of items that can be obtained from the safe loot table below
        ExpSafe = {min = 20, max = 25}, -- Only if you have a level system

        ["cabin"] = { -- The total chance of this section should be = 100
            {Name = "advancedlockpick", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "iphone", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "rolex", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "joint", Chance = 25, Amount = {min = 1, max = 2}},
        },
        ["kitchen"] = { -- The total chance of this section should be = 100
            {Name = "painkillers", Chance = 25, Amount = {min = 1, max = 2}},
            {Name = "advancedlockpick", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "goldchain", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "joint", Chance = 25, Amount = {min = 1, max = 2}},
        },
        ["chest"] = { -- The total chance of this section should be = 100
            {Name = "diamond_ring", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "rolex", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "10kgoldchain", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "pistolammo", Chance = 25, Amount = {min = 1, max = 1}},
        },
        ["livingroom"] = { -- The total chance of this section should be = 100
            {Name = "samsung", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "painkillers", Chance = 25, Amount = {min = 1, max = 2}},
            {Name = "lockpick", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "diamond_ring", Chance = 25, Amount = {min = 1, max = 1}},
        },
        ["safe"] = { -- The total chance of this section should be = 100
            {Name = "rolex", Chance = 25, Amount = {min = 2, max = 3}},
            {Name = "diamond", Chance = 25, Amount = {min = 2, max = 3}},
            {Name = "goldchain", Chance = 25, Amount = {min = 2, max = 3}},
            {Name = "weapon_pistol", Chance = 25, Amount = {min = 1, max = 1}},
        }
    },
    [3] = { -- IPL Tier
        itemCount = {min = 1, max = 3}, -- Amount of items that can be obtained in this tier
        chance = 70, -- Chance of getting an item while searching in this tier
        bonusItem = "diamond_ring", -- Item that can be obtained as a bonus
        bonusChance = 10, -- Chance of getting the bonus item
        bonusAmount = {min = 1, max = 1}, -- Amount of the bonus item
        Exp = {min = 26, max = 30}, -- Only if you have a level system
        ExpProps = {min = 31, max = 35}, -- Only if you have a level system
        -- Safe Settings:
        -- Chance of a safe spawning is determined indivbidually for each IPL, check the IPL configs themselves
        SafeItemCount = {min = 1, max = 2}, -- Amount of items that can be obtained from the safe loot table below
        ExpSafe = {min = 20, max = 25}, -- Only if you have a level system

        ["cabin"] = { -- The total chance of this section should be = 100
            {Name = "goldchain", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "handcuffs", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "diamond", Chance = 25, Amount = {min = 1, max = 2}},
            {Name = "diamond_ring", Chance = 25, Amount = {min = 1, max = 2}},
        },
        ["kitchen"] = { -- The total chance of this section should be = 100
            {Name = "firstaid", Chance = 25, Amount = {min = 1, max = 2}},
            {Name = "10kgoldchain", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "weapon_knife", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "joint", Chance = 25, Amount = {min = 1, max = 3}},
        }, 
        ["chest"] = {  -- The total chance of this section should be = 100
            {Name = "handcuffs", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "rolex", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "weapon_pistol", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "rifleammo", Chance = 25, Amount = {min = 1, max = 1}},
        },
        ["livingroom"] = {  -- The total chance of this section should be = 100
            {Name = "iphone", Chance = 25, Amount = {min = 1, max = 2}},
            {Name = "advancedlockpick", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "joint", Chance = 25, Amount = {min = 1, max = 3}},
            {Name = "diamond_ring", Chance = 25, Amount = {min = 1, max = 2}},
        },
        ["safe"] = {  -- The total chance of this section should be = 100
            {Name = "rolex", Chance = 25, Amount = {min = 2, max = 3}},
            {Name = "diamond", Chance = 25, Amount = {min = 2, max = 3}},
            {Name = "goldchain", Chance = 25, Amount = {min = 2, max = 3}},
            {Name = "weapon_pistol", Chance = 25, Amount = {min = 1, max = 1}},
        }
    },
}
Config.RewardsShell = {
    [1] = { -- Shell Tier
        itemCount = {min = 1, max = 1}, -- Amount of items that can be obtained in this tier
        chance = 40, -- Chance of getting an item while searching in this tier
        bonusItem = "rolex", -- Item that can be obtained as a bonus
        bonusChance = 10, -- Chance of getting the bonus item
        bonusAmount = {min = 1, max = 1}, -- Amount of the bonus item
        Exp = {min = 4, max = 5}, -- Only if you have a level system

        ["cabin"] = {  -- The total chance of this section should be = 100
            {Name = "screwdriverset", Chance = 25, Amount = {min = 1, max = 2}},
            {Name = "fitbit", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "lockpick", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "samsungphone", Chance = 25, Amount = {min = 1, max = 1}},
        },
        ["kitchen"] = {  -- The total chance of this section should be = 100
            {Name = "bandage", Chance = 25, Amount = {min = 1, max = 2}},
            {Name = "painkillers", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "water_bottle", Chance = 25, Amount = {min = 1, max = 2}},
            {Name = "joint", Chance = 25, Amount = {min = 1, max = 1}},
        },
        ["chest"] = {  -- The total chance of this section should be = 100
            {Name = "diamond", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "rolex", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "iphone", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "samsungphone", Chance = 25, Amount = {min = 1, max = 1}},
        },
        ["livingroom"] = {  -- The total chance of this section should be = 100
            {Name = "fitbit", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "screwdriverset", Chance = 25, Amount = {min = 1, max = 2}},
            {Name = "bandage", Chance = 25, Amount = {min = 1, max = 2}},
            {Name = "plastic", Chance = 25, Amount = {min = 1, max = 1}},
        },
    },
    [2] = { -- Shell Tier
        itemCount = {min = 1, max = 2}, -- Amount of items that can be obtained in this tier
        chance = 50, -- Chance of getting an item while searching in this tier
        bonusItem = "diamond", -- Item that can be obtained as a bonus
        bonusChance = 10, -- Chance of getting the bonus item
        bonusAmount = {min = 1, max = 1}, -- Amount of the bonus item
        Exp = {min = 6, max = 7}, -- Only if you have a level system

        ["cabin"] = {  -- The total chance of this section should be = 100
            {Name = "advancedlockpick", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "iphone", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "rolex", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "joint", Chance = 25, Amount = {min = 1, max = 2}},
        },
        ["kitchen"] = {  -- The total chance of this section should be = 100
            {Name = "painkillers", Chance = 25, Amount = {min = 1, max = 2}},
            {Name = "advancedlockpick", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "goldchain", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "joint", Chance = 25, Amount = {min = 1, max = 2}},
        }, 
        ["chest"] = {  -- The total chance of this section should be = 100
            {Name = "diamond_ring", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "rolex", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "10kgoldchain", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "pistolammo", Chance = 25, Amount = {min = 1, max = 1}},
        },
        ["livingroom"] = { -- The total chance of this section should be = 100
            {Name = "samsung", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "painkillers", Chance = 25, Amount = {min = 1, max = 2}},
            {Name = "lockpick", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "diamond_ring", Chance = 25, Amount = {min = 1, max = 1}},
        }, 
    },
    [3] = { -- Shell Tier
        itemCount = {min = 1, max = 3}, -- Amount of items that can be obtained in this tier
        chance = 60, -- Chance of getting an item while searching in this tier
        bonusItem = "diamond_ring", -- Item that can be obtained as a bonus
        bonusChance = 40, -- Chance of getting the bonus item
        bonusAmount = {min = 1, max = 1}, -- Amount of the bonus item
        Exp = {min = 9, max = 10}, -- Only if you have a level system

        ["cabin"] = { -- The total chance of this section should be = 100
            {Name = "goldchain", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "handcuffs", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "diamond", Chance = 25, Amount = {min = 1, max = 2}},
            {Name = "diamond_ring", Chance = 25, Amount = {min = 1, max = 2}},
        },
        ["kitchen"] = { -- The total chance of this section should be = 100
            {Name = "firstaid", Chance = 25, Amount = {min = 1, max = 2}},
            {Name = "10kgoldchain", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "weapon_knife", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "joint", Chance = 25, Amount = {min = 1, max = 3}},
        },
        ["chest"] = { -- The total chance of this section should be = 100
            {Name = "handcuffs", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "rolex", Chance = 25, Amount = {min = 1, max = 1}}, 
            {Name = "weapon_pistol", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "rifleammo", Chance = 25, Amount = {min = 1, max = 1}},
        },
        ["livingroom"] = { -- The total chance of this section should be = 100
            {Name = "iphone", Chance = 25, Amount = {min = 1, max = 2}},
            {Name = "advancedlockpick", Chance = 25, Amount = {min = 1, max = 1}},
            {Name = "joint", Chance = 25, Amount = {min = 1, max = 3}},
            {Name = "diamond_ring", Chance = 25, Amount = {min = 1, max = 2}},
        },
    },
}

Config.IPL = {
    ["4IntegrityWay"] = {
        OwnerChance = 50, -- (%) Chance of a ped being home
        PetChance = 50, -- (%) Chance of a pet being home
        GunChance = 50, -- (%) Chance of the owner holding a gun
        SleepChance = 60, -- (%) Chance of the owner being asleep
        DogSleepChance = 50, -- (%) Chance of the pet being asleep
        AlarmChance = 50, -- (%) Chance of the alarm going off anyways
        OwnerModel = {'g_m_m_chicold_01', 'a_m_m_beach_01', 'a_m_m_og_boss_01', 'a_m_m_soucent_01'}, -- Owner models that gets chosen randomly to spawn (Can change the models to whatever you want)
        PetModel = {'a_c_rottweiler', 'a_c_chop', 'a_c_shepherd', 'a_c_retriever'}, -- Pet models that gets chosen randomly to spawn (Can change the models to whatever you want)
        HouseCoords = vector3(-13.9, -583.66, 90.11), -- Coords where the players spawn when entering a house
        DoorCoords = vector3(-15.9, -612.43, 35.86), -- Coords where the players need to lockpick to rob the house (must be touching the door)
        OwnerCoords = {vector4(-38.1, -576.28, 89.18, 249.87), vector4(-36.71, -577.14, 84.65, 344.92), vector4(-40.08, -577.97, 89.18, 338.45)}, -- Coords where the owner can spawn inside the house (You can change the coords, or add more to them)
        PetCoords = {vector4(-39.8, -573.3, 88.73, 246.7), vector4(-25.28, -590.61, 90.12, 321.08), vector4(-36.38, -576.12, 84.63, 238.64)}, -- Coords where the pet can spawn inside the house (You can change the coords, or add more to them)

        ["tier"] = 2, -- House tiers (1 to 3), 1 being the lowest, 3 the highest

        ['safe'] = {
            ['status'] = true, -- Enable/Disable safes for this specific IPL
            ['chance'] = 10, -- (%)Chance of a safe spawning in this specific IPL
            ['coords'] = vector4(-39.33, -581.93, 82.91, 342.04), -- Coords where the safe spawns
            ['model'] = 'h4_prop_h4_safe_01a', -- Model of the safe
            ['modelopen'] = 'h4_prop_h4_safe_01b', -- Model of the safe when it's open
            ["text"] = "Crack safe",
            ["icon"] = 'fas fa-search',
            ["spawned"] = false, -- Don't touch this
        },

        ["furniture"] = {
            [1] = {
                ["type"] = "cabin", -- Don't touch this
                ["coords"] = vector3(-46.18, -587.18, 88.36),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search drawers",
            },
            [2] = {
                ["type"] = "cabin", -- Don't touch this
                ["coords"] = vector3(-36.72, -577.16, 88.44),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search drawers",
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = vector3(-34.77, -585.61, 88.51),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search kitchen cabinets",
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = vector3(-37.86, -577.98, 83.3),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search nightstand",
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = vector3(-39.08, -585.29, 83.61),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search drawers",
            },
        },

		['propitem1'] = {
            [1] = {
                ["itemname"] = "laptop",
                ["PropName"] = "prop_laptop_01a",
                ["coords"] = vector4(-32.47, -577.19, 88.00, 22.76),
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Laptop",
            },
            [2] = {
                ["itemname"] = "musicequipment",
                ["PropName"] = "prop_speaker_06",
                ["coords"] = vector4(-38.54, -571.69, 88.53, 340.5),
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Music Equipment",
            },
            [3] = {
                ["itemname"] = "goldchain",
                ["PropName"] = "p_csbporndudes_necklace_s",
                ["coords"] = vector4(-43.26, -580.92, 88.53, 330.35),
                ["pitch"] = -45.0,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Chain",
            },
        },
        ["inHouse"] = {} -- Don't touch this
    },
    ["delPerroHeights"] = {
        OwnerChance = 50, -- (%) Chance of a ped being home
        PetChance = 50, -- (%) Chance of a pet being home
        GunChance = 50, -- (%) Chance of the owner holding a gun
        SleepChance = 60, -- (%) Chance of the owner being asleep
        DogSleepChance = 50, -- (%) Chance of the pet being asleep
        AlarmChance = 50, -- (%) Chance of the alarm going off anyways
        OwnerModel = {'g_m_m_chicold_01', 'a_m_m_beach_01', 'a_m_m_og_boss_01', 'a_m_m_soucent_01'}, -- Owner models that gets chosen randomly to spawn (Can change the models to whatever you want)
        PetModel = {'a_c_rottweiler', 'a_c_chop', 'a_c_shepherd', 'a_c_retriever'}, -- Pet models that gets chosen randomly to spawn (Can change the models to whatever you want)
        HouseCoords = vector3(-1452.87, -537.06, 74.04), -- Coords where the players spawn when entering a house
        DoorCoords = vector3(-1477.83, -519.71, 34.74), -- Coords where the players need to lockpick to rob the house (must be touching the door)
        OwnerCoords = {vector4(-1463.09, -546.92, 73.7, 45.83), vector4(-1455.6, -553.64, 72.51, 153.96), vector4(-1463.97, -545.11, 72.7, 109.77)}, -- Coords where the owner can spawn inside the house (You can change the coords, or add more to them)
        PetCoords = {vector4(-1466.72, -548.08, 73.24, 325.53), vector4(-1459.03, -531.28, 73.08, 220.95), vector4(-1469.43, -528.14, 72.44, 217.94)}, -- Coords where the pet can spawn inside the house (You can change the coords, or add more to them)

        ["tier"] = 1, -- House tiers (1 to 3), 1 being the lowest, 3 the highest

        ['safe'] = {
            ['status'] = true, -- Enable/Disable safes for this specific IPL
            ['chance'] = 10, -- (%)Chance of a safe spawning in this specific IPL
            ['coords'] = vector4(-1448.54, -548.85, 71.84, 303.19), -- Coords where the safe spawns
            ['model'] = 'h4_prop_h4_safe_01a', -- Model of the safe
            ['modelopen'] = 'h4_prop_h4_safe_01b', -- Model of the safe when it's open
            ["text"] = "Crack safe",
            ["icon"] = 'fas fa-search',
            ["spawned"] = false, -- Don't touch this
        },

        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = vector3(-1471.82, -535.02, 73.86),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search oven",
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = vector3(-1467.35, -524.23, 72.92),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search cabinets",
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = vector3(-1463.09, -550.03, 73.14),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search cabinets",
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = vector3(-1458.08, -550.12, 72.57),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search dresser",
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = vector3(-1454.48, -548.97, 72.57),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search dresser",
            },
        },
		['propitem1'] = {
            [1] = {
                ["itemname"] = "phone",
                ["PropName"] = "prop_npc_phone",
                ["coords"] = vector4(-1469.36, -539.86, 73.20, 34.36),
                ["pitch"] = 90.0,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Phone",
            },
            [2] = {
                ["itemname"] = "coffeemaker",
                ["PropName"] = "hei_heist_kit_coffeemachine_01",
                ["coords"] = vector4(-1472.24, -538.2, 73.71, 123.07),
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Coffee Machine",
            },
        },
        ["inHouse"] = {} -- Don't touch this
    },

    ["delPerroHeights2"] = { 
        OwnerChance = 50, -- (%) Chance of a ped being home
        PetChance = 50, -- (%) Chance of a pet being home
        GunChance = 50, -- (%) Chance of the owner holding a gun
        SleepChance = 60, -- (%) Chance of the owner being asleep
        DogSleepChance = 50, -- (%) Chance of the pet being asleep
        AlarmChance = 50, -- (%) Chance of the alarm going off anyways
        OwnerModel = {'g_m_m_chicold_01', 'a_m_m_beach_01', 'a_m_m_og_boss_01', 'a_m_m_soucent_01'}, -- Owner models that gets chosen randomly to spawn (Can change the models to whatever you want)
        PetModel = {'a_c_rottweiler', 'a_c_chop', 'a_c_shepherd', 'a_c_retriever'}, -- Pet models that gets chosen randomly to spawn (Can change the models to whatever you want)
        HouseCoords = vector3(-1453.93, -517.64, 56.93), -- Coords where the players spawn when entering a house
        DoorCoords = vector3(-1459.49, -506.22, 32.08), -- Coords where the players need to lockpick to rob the house (must be touching the door)
        OwnerCoords = {vector4(-1473.45, -533.08, 55.99, 296.93), vector4(-1472.08, -532.61, 51.46, 18.65), vector4(-1462.19, -532.07, 50.72, 228.56)}, -- Coords where the owner can spawn inside the house (You can change the coords, or add more to them)
        PetCoords = {vector4(-1475.01, -532.41, 55.54, 221.4), vector4(-1466.52, -537.02, 50.73, 318.51), vector4(-1466.89, -536.43, 50.73, 28.96)}, -- Coords where the pet can spawn inside the house (You can change the coords, or add more to them)

        ["tier"] = 1, -- House tiers (1 to 3), 1 being the lowest, 3 the highest

        ['safe'] = {
            ['status'] = true, -- Enable/Disable safes for this specific IPL
            ['chance'] = 10, -- (%)Chance of a safe spawning in this specific IPL
            ['coords'] = vector4(-1469.37, -537.5, 49.73, 135.04), -- Coords where the safe spawns
            ['model'] = 'h4_prop_h4_safe_01a', -- Model of the safe
            ['modelopen'] = 'h4_prop_h4_safe_01b', -- Model of the safe when it's open
            ["text"] = "Crack safe",
            ["icon"] = 'fas fa-search',
            ["spawned"] = false, -- Don't touch this
        },

        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = vector3(-1458.21, -537.61, 55.34),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search oven",
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = vector3(-1469.42, -545.99, 54.82),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search cabinets",
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = vector3(-1459.81, -533.76, 54.53),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search cabinets",
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = vector3(-1471.76, -532.12, 54.53),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search dresser",
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = vector3(-1469.74, -534.03, 50.72),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search dresser",
            },
        },
		['propitem1'] = {
            [1] = {
                ["itemname"] = "phone",
                ["PropName"] = "prop_npc_phone",
                ["coords"] = vector4(-1473.05, -540.11, 55.31, 302.98),
                ["pitch"] = 90.0,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Phone",
            },
            [2] = {
                ["itemname"] = "coffeemaker",
                ["PropName"] = "hei_heist_kit_coffeemachine_01",
                ["coords"] = vector4(-1464.76, -536.16, 54.83, 35.58),
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Coffee Machine",
            },
            [3] = {
                ["itemname"] = "goldchain",
                ["PropName"] = "p_csbporndudes_necklace_s",
                ["coords"] = vector4(-1472.06, -534.32, 49.53, 304.03),
                ["pitch"] = -45.0,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Chain",
            },
        },
        ["inHouse"] = {} -- Don't touch this
    },

    ["3655WildOatsDrive"] = {
        OwnerChance = 50, -- (%) Chance of a ped being home
        PetChance = 50, -- (%) Chance of a pet being home
        GunChance = 50, -- (%) Chance of the owner holding a gun
        SleepChance = 60, -- (%) Chance of the owner being asleep
        DogSleepChance = 50, -- (%) Chance of the pet being asleep
        AlarmChance = 50, -- (%) Chance of the alarm going off anyways
        OwnerModel = {'g_m_m_chicold_01', 'a_m_m_beach_01', 'a_m_m_og_boss_01', 'a_m_m_soucent_01'}, -- Owner models that gets chosen randomly to spawn (Can change the models to whatever you want)
        PetModel = {'a_c_rottweiler', 'a_c_chop', 'a_c_shepherd', 'a_c_retriever'}, -- Pet models that gets chosen randomly to spawn (Can change the models to whatever you want)
        HouseCoords = vector3(-174.39, 497.91, 137.65), -- Coords where the players spawn when entering a house
        DoorCoords = vector3(-173.4, 502.83, 137.42), -- Coords where the players need to lockpick to rob the house (must be touching the door)
        OwnerCoords = {vector4(-165.06, 480.65, 137.72, 186.01), vector4(-163.25, 483.92, 134.56, 193.65), vector4(-170.12, 497.68, 130.52, 123.69)}, -- Coords where the owner can spawn inside the house (You can change the coords, or add more to them)
        PetCoords = {vector4(-168.73, 481.72, 133.88, 7.46), vector4(-165.2, 483.67, 137.27, 43.93), vector4(-170.3, 495.41, 137.65, 86.84)}, -- Coords where the pet can spawn inside the house (You can change the coords, or add more to them)

        ["tier"] = 3, -- House tiers (1 to 3), 1 being the lowest, 3 the highest

        ['safe'] = {
            ['status'] = true, -- Enable/Disable safes for this specific IPL
            ['chance'] = 10, -- (%)Chance of a safe spawning in this specific IPL
            ['coords'] = vector4(-173.84, 489.83, 129.04, 186.97), -- Coords where the safe spawns
            ['model'] = 'h4_prop_h4_safe_01a', -- Model of the safe
            ['modelopen'] = 'h4_prop_h4_safe_01b', -- Model of the safe when it's open
            ["text"] = "Crack safe",
            ["icon"] = 'fas fa-search',
            ["spawned"] = false, -- Don't touch this
        },

        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = vector3(-171.01, 482.51, 136.95),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search drawers",
            },
            [2] = {
                ["type"] = "kitchen",
                ["coords"] = vector3(-166.63, 493.67, 137.47),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search kitchen cabinets",
            },
            [3] = {
                ["type"] = "cabin",
                ["coords"] = vector3(-170.84, 481.56, 133.58),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search shelves",
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = vector3(-175.81, 489.72, 129.57),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search cabinets",
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = vector3(-165.79, 495.92, 133.45),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search bathroom drawer",
            },
        },
		['propitem1'] = {
            [1] = {
                ["itemname"] = "laptop",
                ["PropName"] = "prop_laptop_01a",
                ["coords"] = vector4(-163.59, 482.89, 132.79, 45.42),
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Laptop",
            },
            [2] = {
                ["itemname"] = "x_artpiece",
                ["PropName"] = "hei_prop_hei_bust_01",
                ["coords"] = vector4(-171.57, 484.13, 137.37, 100.92),
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Statue",
            },
            [3] = {
                ["itemname"] = "goldchain",
                ["PropName"] = "p_csbporndudes_necklace_s",
                ["coords"] = vector4(-167.64, 488.89, 137.21, 32.51),
                ["pitch"] = -45.0,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Chain",
            },
        },
        ["inHouse"] = {} -- Don't touch this
    },

    ["2044NorthConkerAvenue"] = { 
        OwnerChance = 50, -- (%) Chance of a ped being home
        PetChance = 50, -- (%) Chance of a pet being home
        GunChance = 50, -- (%) Chance of the owner holding a gun
        SleepChance = 60, -- (%) Chance of the owner being asleep
        DogSleepChance = 50, -- (%) Chance of the pet being asleep
        AlarmChance = 50, -- (%) Chance of the alarm going off anyways
        OwnerModel = {'g_m_m_chicold_01', 'a_m_m_beach_01', 'a_m_m_og_boss_01', 'a_m_m_soucent_01'}, -- Owner models that gets chosen randomly to spawn (Can change the models to whatever you want)
        PetModel = {'a_c_rottweiler', 'a_c_chop', 'a_c_shepherd', 'a_c_retriever'}, -- Pet models that gets chosen randomly to spawn (Can change the models to whatever you want)
        HouseCoords = vector3(342.2, 437.96, 149.38), -- Coords where the players spawn when entering a house
        DoorCoords = vector3(346.15, 440.39, 148.08), -- Coords where the players need to lockpick to rob the house (must be touching the door)
        OwnerCoords = {vector4(332.0, 425.81, 148.99, 14.7), vector4(332.12, 427.88, 145.57, 211.73), vector4(343.56, 438.04, 141.77, 125.77)}, -- Coords where the owner can spawn inside the house (You can change the coords, or add more to them)
        PetCoords = {vector4(330.15, 427.19, 148.99, 309.59), vector4(330.91, 426.44, 145.57, 78.65), vector4(341.93, 436.87, 141.77, 55.32)}, -- Coords where the pet can spawn inside the house (You can change the coords, or add more to them)

        ["tier"] = 3, -- House tiers (1 to 3), 1 being the lowest, 3 the highest

        ['safe'] = {
            ['status'] = true, -- Enable/Disable safes for this specific IPL
            ['chance'] = 10, -- (%)Chance of a safe spawning in this specific IPL
            ['coords'] = vector4(334.34, 435.17, 140.77, 117.66), -- Coords where the safe spawns
            ['model'] = 'h4_prop_h4_safe_01a', -- Model of the safe
            ['modelopen'] = 'h4_prop_h4_safe_01b', -- Model of the safe when it's open
            ["text"] = "Crack safe",
            ["icon"] = 'fas fa-search',
            ["spawned"] = false, -- Don't touch this
        },

        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = vector3(327.89, 429.93, 145.57),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search drawers",
            },
            [2] = {
                ["type"] = "kitchen",
                ["coords"] = vector3(342.95, 430.65, 149.38),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search kitchen cabinets",
            },
            [3] = {
                ["type"] = "cabin",
                ["coords"] = vector3(345.32, 437.11, 141.77),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search shelves",
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = vector3(334.08, 436.51, 141.77),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search cabinets",
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = vector3(342.37, 429.05, 145.58),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search bathroom drawer",
            },
        },
		['propitem1'] = {
            [1] = {
                ["itemname"] = "laptop",
                ["PropName"] = "prop_laptop_01a",
                ["coords"] = vector4(330.68, 423.57, 145.47, 277.78),
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Laptop",
            },
            [2] = {
                ["itemname"] = "x_artpiece",
                ["PropName"] = "hei_prop_hei_bust_01",
                ["coords"] = vector4(329.62, 431.43, 148.97, 23.36),
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Statue",
            },
            [3] = {
                ["itemname"] = "goldchain",
                ["PropName"] = "p_csbporndudes_necklace_s",
                ["coords"] = vector4(335.52, 429.14, 148.9, 182.65),
                ["pitch"] = -45.0,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Chain",
            },
            [4] = {
                ["itemname"] = "microwave",
                ["PropName"] = "prop_microwave_1",
                ["coords"] = vector4(339.4, 431.67, 149.36, 55.53),
                ["pitch"] = 0.0,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Microwave",
            },
        },
        ["inHouse"] = {} -- Don't touch this
    },

    ["legionSquare"] = { 
        OwnerChance = 50, -- (%) Chance of a ped being home
        PetChance = 50, -- (%) Chance of a pet being home
        GunChance = 50, -- (%) Chance of the owner holding a gun
        SleepChance = 60, -- (%) Chance of the owner being asleep
        DogSleepChance = 50, -- (%) Chance of the pet being asleep
        AlarmChance = 50, -- (%) Chance of the alarm going off anyways
        OwnerModel = {'g_m_m_chicold_01', 'a_m_m_beach_01', 'a_m_m_og_boss_01', 'a_m_m_soucent_01'}, -- Owner models that gets chosen randomly to spawn (Can change the models to whatever you want)
        PetModel = {'a_c_rottweiler', 'a_c_chop', 'a_c_shepherd', 'a_c_retriever'}, -- Pet models that gets chosen randomly to spawn (Can change the models to whatever you want)
        HouseCoords = vector3(266.16, -1007.57, -101.01), -- Coords where the players spawn when entering a house
        DoorCoords = vector3(307.67, -1005.6, 29.51), -- Coords where the players need to lockpick to rob the house (must be touching the door)
        OwnerCoords = {vector4(259.11, -995.7, -99.01, 175.04), vector4(261.16, -996.53, -98.57, 102.13), vector4(262.63, -1003.78, -98.27, 88.31)}, -- Coords where the owner can spawn inside the house (You can change the coords, or add more to them)
        PetCoords = {vector4(259.47, -1003.9, -99.01, 314.56), vector4(261.72, -994.87, -99.01, 187.34), vector4(254.33, -1001.13, -98.93, 280.99)}, -- Coords where the pet can spawn inside the house (You can change the coords, or add more to them)

        ["tier"] = 1, -- House tiers (1 to 3), 1 being the lowest, 3 the highest

        ['safe'] = {
            ['status'] = true, -- Enable/Disable safes for this specific IPL
            ['chance'] = 10, -- (%)Chance of a safe spawning in this specific IPL
            ['coords'] = vector4(259.6, -1003.43, -98.01, 178.97), -- Coords where the safe spawns
            ['model'] = 'h4_prop_h4_safe_01a', -- Model of the safe
            ['modelopen'] = 'h4_prop_h4_safe_01b', -- Model of the safe when it's open
            ["text"] = "Crack safe",
            ["icon"] = 'fas fa-search',
        },

        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = vector3(266.24, -999.41, -98.88),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Cabinet",
            },
            [2] = {
                ["type"] = "kitchen",
                ["coords"] = vector3(264.1, -994.86, -97.25),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Kitchen Cabinet",
            },
            [3] = {
                ["type"] = "cabin",
                ["coords"] = vector3(259.8, -1004.4, -99.09),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Shelves",
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = vector3(261.31, -1002.05, -99.29),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers",
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = vector3(255.7, -999.83, -98.63),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bathroom Medicine Cabinet",
            },
        },
		['propitem1'] = {
            [1] = {
                ["itemname"] = "laptop",
                ["PropName"] = "prop_laptop_01a",
                ["coords"] = vector4(262.06, -1000.67, -99.18, 95.32),
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Laptop",
            },
            [2] = {
                ["itemname"] = "x_artpiece",
                ["PropName"] = "v_ilev_trev_pictureframe",
                ["coords"] = vector4(255.93, -998.57, -97.02, 267.84),
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Painting",
            },
        },
        ["inHouse"] = {} -- Don't touch this
    },

    ["2045NorthConkerAvenue"] = { 
        OwnerChance = 50, -- (%) Chance of a ped being home
        PetChance = 50, -- (%) Chance of a pet being home
        GunChance = 50, -- (%) Chance of the owner holding a gun
        SleepChance = 60, -- (%) Chance of the owner being asleep
        DogSleepChance = 50, -- (%) Chance of the pet being asleep
        AlarmChance = 50, -- (%) Chance of the alarm going off anyways
        OwnerModel = {'g_m_m_chicold_01', 'a_m_m_beach_01', 'a_m_m_og_boss_01', 'a_m_m_soucent_01'}, -- Owner models that gets chosen randomly to spawn (Can change the models to whatever you want)
        PetModel = {'a_c_rottweiler', 'a_c_chop', 'a_c_shepherd', 'a_c_retriever'}, -- Pet models that gets chosen randomly to spawn (Can change the models to whatever you want)
        HouseCoords = vector3(373.63, 423.74, 145.91), -- Coords where the players spawn when entering a house
        DoorCoords = vector3(374.29, 427.45, 145.68), -- Coords where the players need to lockpick to rob the house (must be touching the door)
        OwnerCoords = {vector4(374.34, 407.12, 145.53, 336.72), vector4(374.54, 424.48, 142.1, 169.35), vector4(372.5, 405.74, 142.11, 216.12)}, -- Coords where the owner can spawn inside the house (You can change the coords, or add more to them)
        PetCoords = {vector4(372.81, 407.23, 145.53, 59.63), vector4(371.56, 409.51, 142.1, 214.7), vector4(377.59, 422.42, 141.01, 270.96)}, -- Coords where the pet can spawn inside the house (You can change the coords, or add more to them)

        ["tier"] = 3, -- House tiers (1 to 3), 1 being the lowest, 3 the highest

        ['safe'] = {
            ['status'] = true, -- Enable/Disable safes for this specific IPL
            ['chance'] = 10, -- (%)Chance of a safe spawning in this specific IPL
            ['coords'] = vector4(378.2, 433.01, 137.3, 350.56), -- Coords where the safe spawns
            ['model'] = 'h4_prop_h4_safe_01a', -- Model of the safe
            ['modelopen'] = 'h4_prop_h4_safe_01b', -- Model of the safe when it's open
            ["text"] = "Crack safe",
            ["icon"] = 'fas fa-search',
            ["spawned"] = false, -- Don't touch this
        },

        ["furniture"] = {
            [1] = {
                ["type"] = "cabin", -- Don't touch this
                ["coords"] = vector3(369.38, 408.3, 145.5),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search drawers",
            },
            [2] = {
                ["type"] = "cabin", -- Don't touch this
                ["coords"] = vector3(369.17, 407.92, 142.1),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search drawers",
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = vector3(377.79, 417.39, 145.9),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search kitchen cabinets",
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = vector3(377.27, 407.49, 142.13),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search nightstand",
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = vector3(373.57, 425.73, 142.1),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Shelves",
            },
        },
		['propitem1'] = {
            [1] = {
                ["itemname"] = "x_painting",
                ["PropName"] = "ch_prop_vault_painting_01c",
                ["coords"] = vector4(379.94, 424.54, 143.1, 261.93),
                ["pitch"] = -35.0,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Painting",
            },
            [2] = { 
                ["itemname"] = "laptop",
                ["PropName"] = "prop_laptop_01a",
                ["coords"] = vector4(374.41, 406.27, 144.45, 5.31),
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Laptop",
            },
            [3] = {
                ["itemname"] = "weapon_appistol",
                ["PropName"] = "w_pi_appistol_luxe",
                ["coords"] = vector4(379.65, 431.8, 137.90, 345.57),
                ["pitch"] = -90.0,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Weapon",
            },
            [4] = {
                ["itemname"] = "x_guitar",
                ["PropName"] = "prop_el_guitar_03",
                ["coords"] = vector4(372.43, 411.91, 141.05, 255.0),
                ["pitch"] = -25.0,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Guitar",
            },
            [5] = {
                ["itemname"] = "goldchain",
                ["PropName"] = "p_csbporndudes_necklace_s",
                ["coords"] = vector4(375.13, 412.76, 145.47, 46.24),
                ["pitch"] = -45.0,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Chain",
            },
            [6] = {
                ["itemname"] = "x_suitcase",
                ["PropName"] = "prop_ld_case_01",
                ["coords"] = vector4(375.43, 417.61, 145.55, 310.8),
                ["pitch"] = -90.0,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Suitcase",
            },
            [7] = {
                ["itemname"] = "pcequipment",
                ["PropName"] = "prop_dyn_pc_02",
                ["coords"] = vector4(374.73, 434.53, 138.02, 346.0),
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal PC",
            },
        },
        ["inHouse"] = {} -- Don't touch this
    },
}

Config.Shells = {
    ["perfectdrive1"] = {
        ["coords"] = vector3(-784.72, 459.77, 100.39),
        
        ["tier"] = 3,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["marked"] = false,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["perfectdrive2"] = {
        ["coords"] = vector3(-762.21, 430.96, 100.2),

        ["tier"] = 3,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["perfectdrive3"] = {
        ["coords"] = vector3(-679.04, 512.04, 113.53),

        ["tier"] = 3,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["perfectdrive4"] = {
        ["coords"] = vector3(-640.92, 520.61, 109.88),

        ["tier"] = 3,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["perfectdrive5"] = {
        ["coords"] = vector3(-622.84, 488.88, 108.88),

        ["tier"] = 3,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["perfectdrive6"] = {
        ["coords"] = vector3(-595.55, 530.28, 107.75),

        ["tier"] = 3,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["miltonroad1"] = {
        ["coords"] = vector3(-536.67, 477.36, 103.19),

        ["tier"] = 3,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["miltonroad2"] = {
        ["coords"] = vector3(-526.64, 516.97, 112.94),

        ["tier"] = 1,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["miltonroad3"] = {
        ["coords"] = vector3(-554.48, 541.26, 110.71),

        ["tier"] = 1,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["miltonroad4"] = {
        ["coords"] = vector3(-500.82, 551.92, 120.6),

        ["tier"] = 1,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["didiondrive1"] = {
        ["coords"] = vector3(-418.09, 568.99, 125.06),

        ["tier"] = 1,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["didiondrive2"] = {
        ["coords"] = vector3(-411.06, 529.18, 122.18),

        ["tier"] = 1,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["didiondrive3"] = {
        ["coords"] = vector3(-348.73, 514.95, 120.65),

        ["tier"] = 1,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["didiondrive4"] = {
        ["coords"] = vector3(-355.93, 469.76, 112.65),

        ["tier"] = 1,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["hillcrest1"] = {
        ["coords"] = vector3(-908.66, 693.67, 151.44),

        ["tier"] = 2,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["hillcrest2"] = {
        ["coords"] = vector3(-951.28, 682.65, 153.58),

        ["tier"] = 2,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["hillcrest3"] = {
        ["coords"] = vector3(-1056.34, 761.34, 167.32),

        ["tier"] = 2,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["northsheldon1"] = {
        ["coords"] = vector3(-1130.87, 784.44, 163.89),

        ["tier"] = 2,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["northsheldon2"] = {
        ["coords"] = vector3(-1117.77, 761.48, 164.29),

        ["tier"] = 2,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["northsheldon3"] = {
        ["coords"] = vector3(-1065.02, 772.17, 170.06),

        ["tier"] = 2,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["northsheldon4"] = {
        ["coords"] = vector3(-962.7, 814.09, 177.57),

        ["tier"] = 2,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["northsheldon5"] = {
        ["coords"] = vector3(-867.34, 785.0, 191.93),

        ["tier"] = 2,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["wildoats1"] = {
        ["coords"] = vector3(80.09, 486.26, 148.2),

        ["tier"] = 1,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["wildoats2"] = {
        ["coords"] = vector3(57.56, 449.68, 147.03),

        ["tier"] = 1,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["wildoats3"] = {
        ["coords"] = vector3(-110.05, 501.83, 143.38),

        ["tier"] = 1,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["jamestown1"] = {
        ["coords"] = vector3(385.0, -1881.57, 26.03),

        ["tier"] = 1,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["jamestown2"] = {
        ["coords"] = vector3(412.47, -1856.38, 27.32),

        ["tier"] = 1,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["jamestown3"] = {
        ["coords"] = vector3(427.21, -1842.09, 28.46),

        ["tier"] = 1,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["roylow1"] = {
        ["coords"] = vector3(348.77, -1820.95, 28.89),

        ["tier"] = 1,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["roylow2"] = {
        ["coords"] = vector3(329.42, -1845.8, 27.75),

        ["tier"] = 1,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["roylow3"] = {
        ["coords"] = vector3(320.27, -1854.06, 27.51),

        ["tier"] = 1,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["covenant1"] = {
        ["coords"] = vector3(192.29, -1883.23, 25.06),

        ["tier"] = 1,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["covenant2"] = {
        ["coords"] = vector3(171.52, -1871.53, 24.4),

        ["tier"] = 1,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["covenant3"] = {
        ["coords"] = vector3(128.24, -1897.02, 23.67),

        ["tier"] = 1,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["covenant4"] = {
        ["coords"] = vector3(130.6, -1853.22, 25.23),

        ["tier"] = 1,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["grove1"] = {
        ["coords"] = vector3(76.36, -1948.1, 21.17),

        ["tier"] = 1,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.984, ["y"] = 10.112, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["grove2"] = {
        ["coords"] = vector3(101.03, -1912.16, 21.41),

        ["tier"] = 1,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["grove3"] = {
        ["coords"] = vector3(126.73, -1930.12, 21.38),

        ["tier"] = 1,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["grove4"] = {
        ["coords"] = vector3(114.25, -1961.19, 21.33),

        ["tier"] = 1,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["grove5"] = {
        ["coords"] = vector3(495.4, -1823.36, 28.87),

        ["tier"] = 1,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["grove6"] = {
        ["coords"] = vector3(514.28, -1780.92, 28.91),

        ["tier"] = 1,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["grove7"] = {
        ["coords"] = vector3(479.63, -1735.72, 29.15),

        ["tier"] = 1,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["grove8"] = {
        ["coords"] = vector3(489.64, -1714.08, 29.71),

        ["tier"] = 1,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["prosperity1"] = {
        ["coords"] = vector3(-1076.33, -1026.96, 4.54),

        ["tier"] = 2,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["prosperity2"] = {
        ["coords"] = vector3(-1064.64, -1057.42, 6.41),

        ["tier"] = 2,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["prosperity3"] = {
        ["coords"] = vector3(-1063.77, -1054.99, 2.15),

        ["tier"] = 2,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["prosperity4"] = {
        ["coords"] = vector3(-1054.07, -1000.2, 6.41),

        ["tier"] = 2,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["prosperity5"] = {
        ["coords"] = vector3(-985.89, -1121.74, 4.55),

        ["tier"] = 2,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["prosperity6"] = {
        ["coords"] = vector3(-1024.42, -1140.0, 2.75),

        ["tier"] = 2,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["prosperity7"] = {
        ["coords"] = vector3(-1074.13, -1152.73, 2.16),

        ["tier"] = 2,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["prosperity8"] = {
        ["coords"] = vector3(-1063.57, -1160.35, 2.75),

        ["tier"] = 2,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["grapeseed1"] = {
        ["coords"] = vector3(1662.07, 4776.19, 42.07),

        ["tier"] = 3,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["grapeseed2"] = {
        ["coords"] = vector3(1664.04, 4739.68, 42.01),

        ["tier"] = 3,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["grapeseed3"] = {
        ["coords"] = vector3(1725.39, 4642.54, 43.88),

        ["tier"] = 1,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["grapeseed4"] = {
        ["coords"] = vector3(1673.62, 4658.22, 43.68),

        ["tier"] = 1,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["grapeseed5"] = {
        ["coords"] = vector3(1719.04, 4677.11, 43.66),

        ["tier"] = 1,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["grapeseed6"] = {
        ["coords"] = vector3(1682.86, 4689.51, 43.07),

        ["tier"] = 1,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["paleto1"] = {
        ["coords"] = vector3(-360.24, 6260.61, 31.9),

        ["tier"] = 3,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["paleto2"] = {
        ["coords"] = vector3(-366.57, 6214.12, 31.84),

        ["tier"] = 3,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["paleto3"] = {
        ["coords"] = vector3(-447.87, 6260.25, 30.05),

        ["tier"] = 3,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["paleto4"] = {
        ["coords"] = vector3(-245.99, 6414.45, 31.46),

        ["tier"] = 3,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["paleto5"] = {
        ["coords"] = vector3(-9.59, 6654.23, 31.7),

        ["tier"] = 3,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["paleto6"] = {
        ["coords"] = vector3(25.1, 6601.76, 32.47),

        ["tier"] = 3,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["paleto7"] = {
        ["coords"] = vector3(-379.93, 6252.55, 31.85),

        ["tier"] = 2,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["paleto8"] = {
        ["coords"] = vector3(-213.44, 6396.42, 33.09),

        ["tier"] = 2,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["paletoHotels1"] = {
        ["coords"] = vector3(-159.84, 6432.65, 31.93),

        ["tier"] = 3,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["paletoHotels2"] = {
        ["coords"] = vector3(-149.98, 6416.07, 31.92),

        ["tier"] = 3,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["littleSeoul1"] = {
        ["coords"] = vector3(-716.42, -864.63, 23.21),

        ["tier"] = 2,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["littleSeoul2"] = {
        ["coords"] = vector3(-719.08, -897.89, 20.42),

        ["tier"] = 2,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["littleSeoul3"] = {
        ["coords"] = vector3(-775.23, -891.55, 21.6),

        ["tier"] = 2,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["littleSeoul4"] = {
        ["coords"] = vector3(-604.05, -773.96, 25.4),

        ["tier"] = 2,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["littleSeoul5"] = {
        ["coords"] = vector3(-604.16, -783.4, 25.4),

        ["tier"] = 2,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["littleSeoul6"] = {
        ["coords"] = vector3(-587.81, -783.43, 25.4),

        ["tier"] = 2,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["littleSeoul7"] = {
        ["coords"] = vector3(-674.53, -999.95, 18.24),

        ["tier"] = 2,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["littleSeoul8"] = {
        ["coords"] = vector3(-693.41, -1015.25, 16.42),

        ["tier"] = 2,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["vinewoodHills1"] = {
        ["coords"] = vector3(-873.33, 562.87, 96.62),

        ["tier"] = 3,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["vinewoodHills2"] = {
        ["coords"] = vector3(-884.54, 517.89, 92.44),

        ["tier"] = 3,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["vinewoodHills3"] = {
        ["coords"] = vector3(-947.86, 567.79, 101.51),

        ["tier"] = 3,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["vinewoodHills4"] = {
        ["coords"] = vector3(-1107.81, 594.48, 104.45),

        ["tier"] = 3,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["vinewoodHills5"] = {
        ["coords"] = vector3(-1146.47, 545.89, 101.91),

        ["tier"] = 3,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["vinewoodHills6"] = {
        ["coords"] = vector3(-1167.01, 568.68, 101.83),

        ["tier"] = 3,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["vinewoodHills7"] = {
        ["coords"] = vector3(-1307.99, 448.9, 100.97),

        ["tier"] = 3,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["vinewoodHills8"] = {
        ["coords"] = vector3(-1337.04, 606.21, 134.38),

        ["tier"] = 3,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["vinewoodHills9"] = {
        ["coords"] = vector3(-1255.41, 666.94, 142.82),

        ["tier"] = 3,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["vinewoodHills10"] = {
        ["coords"] = vector3(-1248.78, 642.94, 142.72),

        ["tier"] = 3,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["laPuerta1"] = {
        ["coords"] = vector3(-1131.13, -1551.69, 4.6),

        ["tier"] = 1,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["laPuerta2"] = {
        ["coords"] = vector3(-1135.27, -1467.92, 4.63),

        ["tier"] = 1,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["laPuerta3"] = {
        ["coords"] = vector3(-1146.15, -1466.49, 4.5),

        ["tier"] = 1,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["laPuerta4"] = {
        ["coords"] = vector3(-1111.05, -1497.99, 4.67),

        ["tier"] = 1,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["laPuerta5"] = {
        ["coords"] = vector3(-1091.12, -1517.04, 4.83),

        ["tier"] = 1,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["laPuerta6"] = {
        ["coords"] = vector3(-1087.46, -1529.22, 4.69),

        ["tier"] = 1,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["sanAndreas1"] = {
        ["coords"] = vector3(-1093.63, -1608.29, 8.46),

        ["tier"] = 1,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["downtownVinewood1"] = {
        ["coords"] = vector3(254.25, 24.63, 83.95),

        ["tier"] = 2,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["downtownVinewood2"] = {
        ["coords"] = vector3(201.05, 6.78, 79.38),

        ["tier"] = 2,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["downtownVinewood3"] = {
        ["coords"] = vector3(188.8, 11.07, 73.22),

        ["tier"] = 2,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["downtownVinewood4"] = {
        ["coords"] = vector3(191.1, 39.93, 87.82),

        ["tier"] = 2,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["downtownVinewood5"] = {
        ["coords"] = vector3(176.55, 45.23, 87.82),

        ["tier"] = 2,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["richman1"] = {
        ["coords"] = vector3(-1873.39, 202.28, 84.33),

        ["tier"] = 3,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["richman2"] = {
        ["coords"] = vector3(-1932.04, 162.65, 84.65),

        ["tier"] = 3,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["richman3"] = {
        ["coords"] = vector3(-1961.21, 211.89, 86.81),

        ["tier"] = 3,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["richman4"] = {
        ["coords"] = vector3(-1905.52, 252.76, 86.45),

        ["tier"] = 3,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["richman5"] = {
        ["coords"] = vector3(-1970.65, 246.16, 87.78),

        ["tier"] = 3,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["richman6"] = {
        ["coords"] = vector3(-1922.43, 298.58, 89.29),

        ["tier"] = 3,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["richman7"] = {
        ["coords"] = vector3(-1931.29, 362.72, 93.98),

        ["tier"] = 3,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["delperro"] = {
        ["coords"] = vector3(-1286.84, -833.52, 17.1),

        ["tier"] = 2,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["delperro2"] = {
        ["coords"] = vector3(-1267.76, -812.07, 17.11),

        ["tier"] = 2,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
}

Config.MaleNoGloves = { [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [16] = true, [18] = true, [26] = true, [52] = true, [53] = true, [54] = true, [55] = true, [56] = true, [57] = true, [58] = true, [59] = true, [60] = true, [61] = true, [62] = true, [112] = true, [113] = true, [114] = true, [118] = true, [125] = true, [132] = true}
Config.FemaleNoGloves = { [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [19] = true, [59] = true, [60] = true, [61] = true, [62] = true, [63] = true, [64] = true, [65] = true, [66] = true, [67] = true, [68] = true, [69] = true, [70] = true, [71] = true, [129] = true, [130] = true, [131] = true, [135] = true, [142] = true, [149] = true, [153] = true, [157] = true, [161] = true, [165] = true}

Config.MinZOffset = 45 -- (Dont touch this)
Config.Cooldowns = {} -- (Dont touch this)
Config.Marked = {} -- (Dont touch this)