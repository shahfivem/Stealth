-- ██████╗  █████╗ ███╗   ██╗ ██████╗     ███████╗██╗   ██╗███████╗████████╗███████╗███╗   ███╗
--██╔════╝ ██╔══██╗████╗  ██║██╔════╝     ██╔════╝╚██╗ ██╔╝██╔════╝╚══██╔══╝██╔════╝████╗ ████║
--██║  ███╗███████║██╔██╗ ██║██║  ███╗    ███████╗ ╚████╔╝ ███████╗   ██║   █████╗  ██╔████╔██║
--██║   ██║██╔══██║██║╚██╗██║██║   ██║    ╚════██║  ╚██╔╝  ╚════██║   ██║   ██╔══╝  ██║╚██╔╝██║
--╚██████╔╝██║  ██║██║ ╚████║╚██████╔╝    ███████║   ██║   ███████║   ██║   ███████╗██║ ╚═╝ ██║
-- ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚══════╝   ╚═╝   ╚══════╝   ╚═╝   ╚══════╝╚═╝     ╚═╝
Config = {}
Config.Debug = true -- Allows you to start and restart the resource without any problems
Config.UsingNewQB = false -- Are you using the newest QB-Core updates?
Config.InventoryImage = "ox_inventory/web/images/"
Config.Notify = "ox" -- Supports: "qb" / "ox" / "okok"
Config.OxRadialMenu = true -- Are you using Ox Radial Menu?
Config.DispatchSystem = "ps-dispatch" -- Supports: "ps-dispatch" / "cd_dispatch" / "qs-dispatch" / "none"
Config.DefaultGangImage = "nui://cb-gangsystem/logos/logo.png"
Config.GangImagePath = "nui://cb-gangsystem/logos/"
Config.MoveableGangStorage = true
Config.EnableResetGangStorage = false
Config.PoliceJobs = {'lspd', 'bcso', 'comm', 'sasp', 'judge'}
Config.PoliceAlertJobs = {'lspd', 'bcso', 'comm', 'sasp'}
Config.UsingPugPaintball = false

Config.Phone = {
    LBPhone = false, -- Are you using LB Phone?
}

Config.OptionalPhoneNotifications = { -- Supported phones are above
    DecreaseGangPrevalence = false, -- Do you want to notify players when their gang loses prevalence
    PrevalenceDecay = false, -- Do you want to notify players when the prevalence decay loop is ran (Every 10 minutes - this can be annoying)
    IncreaseGangPrevalence = true -- Do you want to notify players when prevalence is increased
}

Config.FogOfWar = true -- Fog of War makes it so the /turf command only shows turfs that your gang controls.
Config.Rivalry = {
    Enabled = true,
    Cost = 5000,
    EscrowPercentage = 0.25
}

Config.GangTimeout = { -- If the Gang is in Timeout, what do you want to allow them to do?
    Blueprints = false,
    GangHideout = false,
    GangMissions = false,
    Gifts = false,
}

Config.WarTimeout = { -- If the Gang is in War Timeout, what do you want to allow them to do?
    Blueprints = false,
    GangHideout = false,
    GangMissions = false,
    Gifts = false,
}

Config.LimitGangTurfs = true -- Do you want to create an upkeep cost when a gang controls a certain amount of turfs
Config.CountOnlyControlled = true -- Do you want to count only the turfs that the gang controls, or all turfs in the system?
Config.MaxGangTurfs = 5 -- How many Turfs should a gang control before an upkeep comes into effect
Config.UpkeepPercentage = 0.30 -- How much of the drug sale price should be taken away when a Gang controls more than the MaxGangTurfs (Must enable LimitGangTurfs)

Config.DeclareHomeTurf_Cooldown = 0.5 -- How much time should pass before a Gang can declare Home Turf again, in DAYS.
Config.TurfDecayHours = 6             -- How long do you want to wait before taking away Loyalty in every zone turf. Turf Decay helps new gangs be able to take turf a *bit* easier
Config.TurfDecayPercentage = 0.05     -- What percentage do you want to take away from each turf. (Example: 100 Loyalty @ 0.05 = 95 Loyalty after Turf Decay)

Config.VendettaSystem = { 
    OwnGangMembers = true, -- Decrease Loyalty when a Gang Member kills a member of the same gang? False = Only when killed by Rival Gang Members
    Locals = true -- Decrease loyalty in a zone when a Gang Members hurts a Local
}

Config.Loyalty = {
    Increase = {
        Mission = 120, -- How much loyalty should a gang receive when a member completes a mission
        Drugs = 5, -- How much loyalty should a gang receive when performing a Drug Sale
        Spray = 10, -- How much loyalty should a gang receive when performing a Gang Spray (Requires RCore Spray)
        Presence = 5, -- How much loyalty should a gang receive in a particular turf just for being there! Loops every 10 minutes
        Vendetta = 10, -- Keep in mind that you are also taking away loyalty from the gang that gets downed. You wouldn't want to make this too large as it will incentivize shootouts between Gangs
        Capture = 25 -- How much loyalty should a gang receive when capturing a rival gang member
    },
    Decrease = {
        Vendetta = 25, -- How much loyalty should a gang lose when a member is killed by a rival gang member
        VendettaPolice = 50, -- How much loyalty should a gang lose in their HOME TURF when a member downs a police officer
        LostTurfWar = 150, -- How much loyalty should a gang lose when they lose a Turf War
        LostColorWar = 100, -- How much loyalty should a gang lsoe when they lose a Color War
        LostRegularWar = 75, -- How much loyalty should a gang lsoe when they lose a Regular War
    }
}

Config.AllowGangProtection = true -- Do you want to allow gangs to protect their home turf? See Documentaiton for more information
Config.ProtectionLoopTime = 60 -- How often should the Protection Loop run in minutes
Config.ProtectionCost = 2000 -- How much mony should a gang have to pay to protect their home turf from being taken over by another gang EVERY 2 HOURS
Config.RecklessDrivingChance = 10 -- What are the chances that a local will report a gang member for reckless driving? (1-100)
Config.Prevalence = { -- Prevalence is a combined number that represents how well a gang is interacting with the Gang System
    MinPrevalence = -200,
    MaxPrevalence = 200,
    DecayTime = 720, -- In minutes
    DecayAmount = 5,
    Stars = {
        one = -100, -- At or below -100 results in One Star
        two = -50,
        three = 0,
        four = 100,
        five = 175, -- At or above 175 results in Five Stars
    },
    Increase = {
        Mission = 10, -- Increase when a player completes a Gang Mission
        Drugs = 3, -- Increase when a player sells drugs
        Heist = 10 -- Increase when a player completes a heist (Tip: See Documentation for how to implement this)
    },
    Decrease = {
        Vendetta = 10, -- Decrease when a player kills another gang member
        VendettaPolice = 10, -- Decrease when a player kills a police officer
        GangTimeout = 10, -- Decrease when a Gang is put in Timeout
        StaffPenalty = 5, -- Decrease when a Gang is a penalized by Staff
        Shooting = 0, -- Decrease Prevalence when a Gang Member shoots a Weapon
        ShootingCommunityTurf = 1, -- Decrease prevalence when a Gang Member shoots a weapon in a Community Turf (triggered every 5 shots)
        RecklessDriving = 0, -- Driving on sidewalk and a local sees you
    },
    PrevalenceLockout = { -- Prevent gangs from doing certain things unless their prevalence is at or above said level. I wouldn't recommend changing this unless you know what you are doing.
        -- ATTENTION: Level 1 is the MINIMUM. There is no Level 0
        Gifts = 3, -- What level of prevalence should be required for a gang to be able to receive gifts
        Blueprints = 4, -- What level of prevalence should be required for a gang to be able to receive Blueprints
        Missions = 2, -- What level of prevalence should be required for a gang to partake in missions
        Drugs = 1, -- What level of prevalence should be required for a gang to sell drugs
        Presence = 4, -- What level of prevalence should be required for a gang to earn loyalty just for being present in a turf
        Vendetta = 3, -- What level of prevalence should be required for a gang's vendetta kills to increase their loyalty. (Setting Level 2 or above can prevent shitter gangs from shitting)
        Heist1 = 2, -- Here you can prevent gang members from partaking in Level 1 Heists (Requires some additional setup, please see Documentation)
        Heist2 = 2, -- Here you can prevent gang members from partaking in Level 1 Heists (Requires some additional setup, please see Documentation)
        Heist3 = 2, -- Here you can prevent gang members from partaking in Level 1 Heists (Requires some additional setup, please see Documentation)
    }
}

Config.GangWars = {
    Enabled = true,
    RequireOutfitsDuringWar = true, -- Do you want to require that Gangs wear their War Outfit during war? Enabling this will change the players clothes to the war outfit when they check in, and it will check them out if they change clothes
    Length = {1, 2, 3}, -- In Days
    Modifiers = {
        gifts = false, -- Do you want to allow gifts to be obtained while the gang is at war (Recommended: false)
        missions = false, -- Do you want to allow gangs to partake in Gang Missions while the gang is at war (Recommended: false)
        hideouts = false, -- Do you want gangs to be able to access their Gang Hideout when they are at war (Recommended: false)
        blueprints = false, -- Do you want to allow gangs to be able to craft blueprints using the BP table while they are involved in a war (Recommended: false)
    },
    KillPoints = { -- Utilizes the GetWeaponTypeGroup native in FiveM
        [3566412244] = 2,   -- Melee
        [416676503] = 1,    -- Pistol
        [970310034] = 1,    -- Rifle
        [860033945] = 1,    -- Shotgun
        [3337201093] = 1,   -- SMG
        [3082541095] = 1,   -- Sniper
        [690389602] = 1,    -- Stungun
        [1548507267] = 1,    -- Throwable
        [2685387236] = 3,    -- Unarmed
    },
}

Config.GangStashes = {
    maxWeight = 1250000,
    slots = 120,
}

Config.OptionalNotifications = {
    NotInGang = true,      -- Do you want to notify players if they are not in a gang when they join the server. This can help with any issues related to already existing player data.
    OnTurfIncrease = true, -- Do you want to notify gang members when another gang sells on their turf
    HomeTurfTaken = true,  -- Do you want to notify Gang Members if they lost their Home Turf when they open the Gang Menu
    OnDrugSale = false, -- Do you want to send a notification to the player when they sell a Drug. Some servers opt out of this in favor of itemBox
    ZoneModifier = true, -- Do you want to notify the player that their drugs are selling for more because they control the turf?
    UseItemBox = false, -- Does your server use inventory:client:ItemBox? 
}

Config.OptionalMenuItems = {
    dontForgetToScroll = false, -- Enabling this adds a reminder to the Menus telling people to scroll
    zoneDetailsDivider = true,  -- This adds a divider to the Zone Details Menu separating the Gang Presence from the Zone actions. It makes it look prettier in our opinion.
    zoneActionsDivider = true   -- This adds a divider to the Zone Details Menu separating the Gang Presence from the Zone actions. It makes it look prettier in our opinion.
}

-- ██████╗  █████╗ ███╗   ██╗ ██████╗     ██╗     ███████╗ █████╗ ██████╗ ███████╗██████╗
--██╔════╝ ██╔══██╗████╗  ██║██╔════╝     ██║     ██╔════╝██╔══██╗██╔══██╗██╔════╝██╔══██╗
--██║  ███╗███████║██╔██╗ ██║██║  ███╗    ██║     █████╗  ███████║██║  ██║█████╗  ██████╔╝
--██║   ██║██╔══██║██║╚██╗██║██║   ██║    ██║     ██╔══╝  ██╔══██║██║  ██║██╔══╝  ██╔══██╗
--╚██████╔╝██║  ██║██║ ╚████║╚██████╔╝    ███████╗███████╗██║  ██║██████╔╝███████╗██║  ██║
-- ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚══════╝╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝
Config.GangLeader = {
    coords = vector4(-1373.31, -464.31, 71.04, 196.66),
    model = `player_one`,
    scenario = 'WORLD_HUMAN_GUARD_STAND',
}

Config.CapturePed = {
    coords = vec4(567.5, -3127.17, 17.77, 189.12),
    model = `mp_m_bogdangoon`,
    scenario = 'WORLD_HUMAN_GUARD_STAND',
    distance = 2.5,
    useBlip = false,
    onlyAtWar = false, -- Allow players to only capture rival Gang Members if the two gangs are at war with eachother
    teleportLocations = {
        {x = -1552.41, y = -1269.1, z = 0.62, h = 312.44},
    },
    warPoints = {
        leader = 2,
        member = 1
    }
}

Config.Bodyguard = {
    coords = vector4(-81.14, -835.37, 39.56, 160.39),
    model = `s_m_m_bouncer_01`,
    scenario = 'WORLD_HUMAN_GUARD_STAND',
    icon = 'fa-solid fa-shield-halved',
    label = 'Request Entry',
    distance = 2,
    insideCoords = vector3(-1392.74, -480.79, 72.04),
    outsideCoords = vector3(-81.14, -835.37, 40.56),
}

--███████╗███████╗████████╗ █████╗ ██████╗ ██╗     ██╗███████╗██╗  ██╗
--██╔════╝██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██║     ██║██╔════╝██║  ██║
--█████╗  ███████╗   ██║   ███████║██████╔╝██║     ██║███████╗███████║
--██╔══╝  ╚════██║   ██║   ██╔══██║██╔══██╗██║     ██║╚════██║██╔══██║
--███████╗███████║   ██║   ██║  ██║██████╔╝███████╗██║███████║██║  ██║
--╚══════╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝╚══════╝╚═╝  ╚═╝
Config.RequiredItems = {
    cash = 2500000, -- Required Cash
    items = {
        ['diamond'] = 50,
        ['sapphire'] = 50,
        ['emerald'] = 50,
        ['ruby'] = 50,
        ['undergroundkey'] = 1000,
    }
}

--██████╗ ███████╗███╗   ██╗ █████╗ ██╗  ████████╗██╗███████╗███████╗
--██╔══██╗██╔════╝████╗  ██║██╔══██╗██║  ╚══██╔══╝██║██╔════╝██╔════╝
--██████╔╝█████╗  ██╔██╗ ██║███████║██║     ██║   ██║█████╗  ███████╗
--██╔═══╝ ██╔══╝  ██║╚██╗██║██╔══██║██║     ██║   ██║██╔══╝  ╚════██║
--██║     ███████╗██║ ╚████║██║  ██║███████╗██║   ██║███████╗███████║
--╚═╝     ╚══════╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝╚═╝   ╚═╝╚══════╝╚══════╝
Config.StaffGangCommand = "gangstaff"
Config.StaffPenaltyAmounts = {
    { 20, 50, 100, 150, 250, 500 }, -- These are the options for how much loyalty you will take away (or give) from the penalized gang.
}

--██████╗ ██╗     ██╗   ██╗███████╗██████╗ ██████╗ ██╗███╗   ██╗████████╗███████╗
--██╔══██╗██║     ██║   ██║██╔════╝██╔══██╗██╔══██╗██║████╗  ██║╚══██╔══╝██╔════╝
--██████╔╝██║     ██║   ██║█████╗  ██████╔╝██████╔╝██║██╔██╗ ██║   ██║   ███████╗
--██╔══██╗██║     ██║   ██║██╔══╝  ██╔═══╝ ██╔══██╗██║██║╚██╗██║   ██║   ╚════██║
--██████╔╝███████╗╚██████╔╝███████╗██║     ██║  ██║██║██║ ╚████║   ██║   ███████║
--╚═════╝ ╚══════╝ ╚═════╝ ╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝
Config.BlueprintCrafting = true
Config.UseDrawTextBlueprints = false
Config.BlueprintTableWaitTime = 12 -- in HOURS
Config.NumberOfBlueprints = 1
Config.BlueprintCraftDuration = 5000
Config.BlueprintSystemType = "person" -- / Supports "person" or "gang" // 1 Blueprint Per Person or Per Gang per Day
Config.BlueprintCraftingLocations = {    -- Use this if you want to place props in/around the server.
    [1] = {
        name = "BlueprintCraftingTable", -- Must be unique
        type = "Blueprint",              -- MUST MATCH DOWN BELOW
        coords = vector4(-2441.54, 2950.97, 35.09, 151.27),
        label = "Craft Blueprint",
        model = "prop_tool_bench02",
        icon = "fa-solid fa-screwdriver-wrench",
        spawnProp = false,
    },
}
Config.BlueprintTableItems = {
    { item = "bpcombatpdw", chance = 4 },
   --{ item = "bpcombatpistol", chance = 10 },
    { item = "bpmachinepistol", chance = 7 },
    { item = "bpmicrosmg", chance = 7 },
    { item = "bpminismg", chance = 7 },
    --{ item = "bppistol", chance = 10 },
    { item = "bppistol50", chance = 10 },
    --{ item = "bpsnspistol", chance = 10 },
    { item = "bpappistol", chance = 7 },
    { item = "bpcomblocpdw", chance = 4 },
    { item = "bpassaultpdw", chance = 4 },
    { item = "bpvintagepistol", chance = 10 },
    { item = "bpsolverpistol", chance = 10 },
    { item = "bpassaultrifle", chance = 4 },
    { item = "bpsmallscope_attachment", chance = 5 },
    { item = "bpclip_attachment", chance = 5 },
    { item = "bpdrum_attachment", chance = 5 },
    { item = "bpflashlight_attachment", chance = 5 },
    { item = "bpsuppressor_attachment", chance = 5 },
    { item = "bpgrip_attachment", chance = 5 },
    { item = "weapon_chbfknife", chance = 1 },
    { item = "bpheavypistol", chance = 10 },
    { item = "bpsawnoffshotgun", chance = 4 },
}

--██╗    ██╗███████╗██████╗ ██╗  ██╗ ██████╗  ██████╗ ██╗  ██╗
--██║    ██║██╔════╝██╔══██╗██║  ██║██╔═══██╗██╔═══██╗██║ ██╔╝
--██║ █╗ ██║█████╗  ██████╔╝███████║██║   ██║██║   ██║█████╔╝
--██║███╗██║██╔══╝  ██╔══██╗██╔══██║██║   ██║██║   ██║██╔═██╗
--╚███╔███╔╝███████╗██████╔╝██║  ██║╚██████╔╝╚██████╔╝██║  ██╗
-- ╚══╝╚══╝ ╚══════╝╚═════╝ ╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝
Config.WebhookName = "New Energy Roleplay"
Config.WebhookURL = '' --The URL of the Webhook
Config.SellDrugsWebhookURL = '' --The URL of the Webhook
Config.WebhookName = 'New Energy Roleplay' -- The name of the Webhook (e.g. Infinity RP)

Config.OptionalLogs = {
    PoliceSetup = true, -- Do you want to send a log when the player sells to one of the Setup Peds listed in Config.PoliceCallModels?
}