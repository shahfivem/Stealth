-- Emotes you add in the file will automatically be added to AnimationList.lua
-- If you have multiple custom list files they MUST be added between AnimationList.lua and Emote.lua in fxmanifest.lua!
-- Don't change 'CustomDP' it is local to this file!

--- RPEmotes by TayMcKenzieNZ, Mathu_lmn and MadsL, maintained by TayMcKenzieNZ ---
--- Download OFFICIAL version and updates ONLY at https://github.com/TayMcKenzieNZ/rpemotes ---
--- RPEmotes is FREE and ALWAYS will be. STOP PAYING SCAMMERS OR SOMEONE ELSE'S WORK!!! ---
--- Remove the } from the = {} then enter your own animation code ---
--- Don't forget to close the tables. See https://docs.rpemotes.com/for-developers/important-note/custom-emotes-and-props ---

local CustomDP = {}

CustomDP.Expressions = {}
CustomDP.Walks = {}
CustomDP.Shared = {}
CustomDP.Dances = {}
CustomDP.AnimalEmotes = {}
CustomDP.Exits = {}
CustomDP.Emotes = {}
CustomDP.PropEmotes = {
    ["tac01"] = {"anim@male@holding_weapon_2", "holding_weapon_2_clip", "Tac 1", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["tac02"] = {"anim@male@holding_weapon_4", "holding_weapon_4_clip", "Tac 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["tac03"] = {"anim@male@holding_weapon_kneel", "anim@male@holding_weapon_kneel_clip", "Tac 3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["tac04"] = {"anim@male@holding_weapon_nvg", "holding_weapon_nvg_clip", "Tac 4", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["tac05"] = {"anim@male@holding_weapon_nvg_2", "holding_weapon_nvg_2_clip", "Tac 5", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["tac06"] = {"anim@male@hug_weapon", "hug_weapon_clip", "Tac 6", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["tac07"] = {"anim@male@hug_weapon_2", "hug_weapon_2_clip", "Tac 7", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["tac08"] = {"anim@male@holding_radio", "holding_radio_clip", "Tac 8", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["tac09"] = {"anim@male@pose_weapon", "pose_weapon_clip", "Tac 9", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["tac10"] = {"anim@male@pose_weapon_2", "pose_weapon_2_clip", "Tac 10", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["tac11"] = {"anim@male@pose_weapon_3", "pose_weapon_3_clip", "Tac 11", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["tac12"] = {"anim@male@aim_weapon", "aim_weapon_clip", "Tac 12", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["tac13"] = {"anim@male@preaim_weapon", "preaim_weapon_clip", "Tac 13", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["tac14"] = {"anim@male@run_weapon", "run_weapon_clip", "Tac 14", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["tac15"] = {"anim@male@tactical_kneel", "tactical_kneel_clip", "Tac 15", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["tac16"] = {"anim@male@holding_vest", "holding_vest_clip", "Tac 16", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["tac17"] = {"anim@holding_side_vest", "holding_side_vest_clip", "Tac 17", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["tac18"] = {"anim@holding_siege_vest_side", "holding_siege_vest_side_clip", "Tac 18", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["tac19"] = {"anim@male@holding_vest_2", "holding_vest_2_clip", "Tac 19", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["tac20"] = {"anim@radio_left", "radio_left_clip", "Tac 20", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["tac21"] = {"anim@male@holding_vest_siege", "holding_vest_siege_clip", "Tac 21", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["tac22"] = {"anim@male@holding_vest_siege_2", "holding_vest_siege_2_clip", "Tac 22", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
     
        ["armwave"] = {"custom@armwave", "armwave", "Arm Wave", AnimationOptions =
        {
             EmoteMoving = false,
             EmoteLoop = true
        }},
     
        ["circle_crunch"] = {"custom@circle_crunch", "circle_crunch", "Circle Crunch", AnimationOptions =
        {
             EmoteMoving = false,
             EmoteLoop = true
        }},
        ["gangnamstyle"] = {"custom@gangnamstyle", "gangnamstyle", "Gangnam Style", AnimationOptions =
        {
             EmoteMoving = false,
             EmoteLoop = true
        }},
     
        ["makarena"] = {"custom@makarena", "makarena", "Makarena", AnimationOptions =
        {
             EmoteMoving = false,
             EmoteLoop = true
        }},
     
        ["maraschino"] = {"custom@maraschino", "maraschino", "Maraschino", AnimationOptions =
        {
             EmoteMoving = false,
             EmoteLoop = true
        }},
     
        ["salsadance"] = {"custom@salsa", "salsa", "Salsa", AnimationOptions =
        {
             EmoteMoving = false,
             EmoteLoop = true
        }},
     
        ["what_idk"] = {"custom@what_idk", "what_idk", "What", AnimationOptions =
        {
             EmoteMoving = false,
             EmoteLoop = false
        }},
     
        ["pickfromground"] = {"custom@pickfromground", "pickfromground", "Pick From Ground", AnimationOptions =
        {
             EmoteMoving = false,
             EmoteLoop = false
        }},
     
        -- Josh
     
        ["listenmusic"] = {"anim@amb@carmeet@listen_music@male_a@trans", "a_trans_d", "Listen Music", AnimationOptions =
        {
         EmoteMoving = false,
         EmoteDuration = 5000,
        }},
     
        ["readmessagesm"] = {"anim@amb@carmeet@take_photos@male_a@base", "base", "Read Messages · Male", AnimationOptions =
        {
            EmoteMoving = false,
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
        ["readmessagesf"] = {"anim@amb@carmeet@take_photos@female_b@base", "base", "Read Messages · Female", AnimationOptions =
        {
            EmoteMoving = false,  
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
        ["weeding"] = {"anim@amb@drug_field_workers@weeding@male_a@base", "base", "Weeding · Male", AnimationOptions =
        {
            EmoteLoop = true,
        }},
        ["valet4"] = {"anim@amb@world_human_valet@normal@base@", "base_a_m_y_vinewood_01", "Valet 4", AnimationOptions =
        {
         EmoteMoving = false,
         EmoteDuration = 2500,
        }},
        ["valet5"] = {"anim@amb@world_human_valet@formal_right@base@", "base_a_m_y_vinewood_01", "Valet 5", AnimationOptions =
        {
         EmoteMoving = true,
         EmoteLoop = true,
        }},
        ["leancar"] = {"anim@scripted@carmeet@tun_meet_ig2_race@", "base", "Lean Car", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
        ["dj10"] = {"anim@scripted@nightclub@dj@dj_moodm@", "moodm_cdj_left_a_12", "DJ 10", AnimationOptions =
        {
            EmoteLoop = true,
        }},
        ["jogger"] = {"move_f@jogger", "idle", "Jogger · Female", AnimationOptions =
        {
            EmoteDuration = 2500,
            EmoteMoving = true,
        }},
        ["jogger2"] = {"move_m@jogger", "idle", "Jogger · Male", AnimationOptions =
        {
            EmoteDuration = 2500,
            EmoteMoving = true,
        }},
        ["help"] = {"oddjobs@assassinate@old_lady", "looking_for_help", "Looking For Help", AnimationOptions =
        {
         EmoteMoving = false,
         EmoteDuration = 5000,
        }},
        ["tsomething"] = {"oddjobs@bailbond_hobohang_out_street_c", "idle_c", "Tell Something", AnimationOptions =
        {
         EmoteMoving = false,
         EmoteDuration = 2500,
        }},
        ["wait14"] = {"oddjobs@taxi@", "idle_a", "Wait Taxi", AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 5000,
        }},
        ["noway2"] = {"oddjobs@towingpleadingbase", "base", "No Way 2", AnimationOptions =
        {
         EmoteMoving = false,
         EmoteDuration = 2500,
        }},
     
        -- BuddiesPosePack
     
        ["buddypose1"] = {"lunyx@buddies01a", "buddies01a", "Buddy Pose 1", AnimationOptions =
        {
         EmoteMoving = true,
         EmoteLoop = true,
        }},
        ["buddypose1s"] = {"lunyx@buddies01b", "buddies01b", "Buddy Pose 1 S", AnimationOptions =
        {
         EmoteMoving = true,
         EmoteLoop = true,
        }},
        ["buddypose2"] = {"lunyx@buddies02a", "buddies02a", "Buddy Pose 2", AnimationOptions =
        {
         EmoteMoving = true,
         EmoteLoop = true,
        }},
        ["buddypose2s"] = {"lunyx@buddies02b", "buddies02b", "Buddy Pose 2 S", AnimationOptions =
        {
         EmoteMoving = true,
         EmoteLoop = true,
        }},
        ["buddypose3"] = {"lunyx@buddies03a", "buddies03a", "Buddy Pose 3", AnimationOptions =
        {
         EmoteMoving = true,
         EmoteLoop = true,
        }},
        ["buddypose3s"] = {"lunyx@buddies03b", "buddies03b", "Buddy Pose 3 S", AnimationOptions =
        {
         EmoteMoving = true,
         EmoteLoop = true,
        }},
        ["buddypose4"] = {"lunyx@buddies04a", "buddies04a", "Buddy Pose 4", AnimationOptions =
        {
         EmoteMoving = true,
         EmoteLoop = true,
        }},
        ["buddypose4s"] = {"lunyx@buddies04b", "buddies04b", "Buddy Pose 4 S", AnimationOptions =
        {
         EmoteMoving = true,
         EmoteLoop = true,
        }},
        ["buddypose5"] = {"lunyx@buddies05a", "buddies05a", "Buddy Pose 5", AnimationOptions =
        {
         EmoteMoving = true,
         EmoteLoop = true,
        }},
        ["buddypose5s"] = {"lunyx@buddies05b", "buddies05b", "Buddy Pose 5 S", AnimationOptions =
        {
         EmoteMoving = true,
         EmoteLoop = true,
        }},
     
        -- Darling Pose Pack
        ["darlingpose1"] = {"lunyx@darling@pose001", "darling@pose001", "Darling Pose 1", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["darlingpose2"] = {"lunyx@darling@pose002", "darling@pose002", "Darling Pose 2", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["darlingpose3"] = {"lunyx@darling@pose003", "darling@pose003", "Darling Pose 3", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["darlingpose4"] = {"lunyx@darling@pose004", "darling@pose004", "Darling Pose 4", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["darlingpose5"] = {"lunyx@darling@pose005", "darling@pose005", "Darling Pose 5", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["darlingpose6"] = {"lunyx@darling@pose006", "darling@pose006", "Darling Pose 6", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["darlingpose7"] = {"lunyx@darling@pose007", "darling@pose007", "Darling Pose 7", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["darlingpose8"] = {"lunyx@darling@pose008", "darling@pose008", "Darling Pose 8", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["darlingpose9"] = {"lunyx@darling@pose009", "darling@pose009", "Darling Pose 9", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["darlingpose10"] = {"lunyx@darling@pose010", "darling@pose010", "Darling Pose 1", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
     
        -- LUNYX_KatanaPosePack
     
        ["katanapose1"] = {"lunyx@katanav1@pose01", "katanav1@pose01", "Katana Pose 1", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
     
        ["katanapose2"] = {"lunyx@katanav1@pose02", "katanav1@pose02", "Katana Pose 2", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
     
        ["katanapose3"] = {"lunyx@katanav1@pose03", "katanav1@pose03", "Katana Pose 3", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
     
        ["katanapose4"] = {"lunyx@katanav1@pose04", "katanav1@pose04", "Katana Pose 4", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
     
        ["katanapose5"] = {"lunyx@katanav1@pose05", "katanav1@pose05", "Katana Pose 5", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
     
        ["katanapose6"] = {"lunyx@katanav1@pose06", "katanav1@pose06", "Katana Pose 6", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
     
        ["katanapose7"] = {"lunyx@katanav1@pose07", "katanav1@pose07", "Katana Pose 7", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
     
        ["katanapose8"] = {"lunyx@katanav1@pose08", "katanav1@pose08", "Katana Pose 8", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
     
        -- LookbookPosePack
     
        ["lb1"] = {"lunyx@lookbook_v1@pose001", "lookbook_v1@pose001", "Lookbook Pose 1", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["lb2"] = {"lunyx@lookbook_v1@pose002", "lookbook_v1@pose002", "Lookbook Pose 2", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["lb3"] = {"lunyx@lookbook_v1@pose003", "lookbook_v1@pose003", "Lookbook Pose 3", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["lb4"] = {"lunyx@lookbook_v1@pose004", "lookbook_v1@pose004", "Lookbook Pose 4", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["lb5"] = {"lunyx@lookbook_v1@pose005", "lookbook_v1@pose005", "Lookbook Pose 5", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["lb6"] = {"lunyx@lookbook_v1@pose006", "lookbook_v1@pose006", "Lookbook Pose 6", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["lb7"] = {"lunyx@lookbook_v1@pose007", "lookbook_v1@pose007", "Lookbook Pose 7", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["lb8"] = {"lunyx@lookbook_v1@pose008", "lookbook_v1@pose008", "Lookbook Pose 8", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["lb9"] = {"lunyx@lookbook_v1@pose009", "lookbook_v1@pose009", "Lookbook Pose 9", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["lb10"] = {"lunyx@lookbook_v1@pose010", "lookbook_v1@pose010", "Lookbook Pose 10", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["lb11"] = {"lunyx@lookbook_v1@pose011", "lookbook_v1@pose011", "Lookbook Pose 11", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["lb12"] = {"lunyx@lookbook_v1@pose012", "lookbook_v1@pose012", "Lookbook Pose 12", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["lb13"] = {"lunyx@lookbook_v1@pose013", "lookbook_v1@pose013", "Lookbook Pose 13", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["lb14"] = {"lunyx@lookbook_v1@pose014", "lookbook_v1@pose014", "Lookbook Pose 14", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["lb15"] = {"lunyx@lookbook_v1@pose015", "lookbook_v1@pose015", "Lookbook Pose 15", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
     
        -- LookBookV2PosePack
     
        ["lb201"] = {"lunyx@lookbook_v2@pose001", "lookbook_v2@pose001", "Lookbook V2 Pose 1", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["lb201"] = {"lunyx@lookbook_v2@pose002", "lookbook_v2@pose002", "Lookbook V2 Pose 1", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["lb203"] = {"lunyx@lookbook_v2@pose003", "lookbook_v2@pose003", "Lookbook V2 Pose 3", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["lb204"] = {"lunyx@lookbook_v2@pose004", "lookbook_v2@pose004", "Lookbook V2 Pose 4", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["lb205"] = {"lunyx@lookbook_v2@pose005", "lookbook_v2@pose005", "Lookbook V2 Pose 5", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["lb206"] = {"lunyx@lookbook_v2@pose006", "lookbook_v2@pose006", "Lookbook V2 Pose 6", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["lb207"] = {"lunyx@lookbook_v2@pose007", "lookbook_v2@pose007", "Lookbook V2 Pose 7", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["lb208"] = {"lunyx@lookbook_v2@pose008", "lookbook_v2@pose008", "Lookbook V2 Pose 8", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["lb209"] = {"lunyx@lookbook_v2@pose009", "lookbook_v2@pose009", "Lookbook V2 Pose 9", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["lb210"] = {"lunyx@lookbook_v2@pose010", "lookbook_v2@pose010", "Lookbook V2 Pose 10", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["lb211"] = {"lunyx@lookbook_v2@pose011", "lookbook_v2@pose011", "Lookbook V2 Pose 11", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["lb212"] = {"lunyx@lookbook_v2@pose012", "lookbook_v2@pose012", "Lookbook V2 Pose 12", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["lb213"] = {"lunyx@lookbook_v2@pose013", "lookbook_v2@pose013", "Lookbook V2 Pose 13", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["lb214"] = {"lunyx@lookbook_v2@pose014", "lookbook_v2@pose014", "Lookbook V2 Pose 14", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["lb215"] = {"lunyx@lookbook_v2@pose015", "lookbook_v2@pose015", "Lookbook V2 Pose 15", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["lb216"] = {"lunyx@lookbook_v2@pose016", "lookbook_v2@pose016", "Lookbook V2 Pose 16", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["lb217"] = {"lunyx@lookbook_v2@pose017", "lookbook_v2@pose017", "Lookbook V2 Pose 17", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["lb218"] = {"lunyx@lookbook_v2@pose018", "lookbook_v2@pose018", "Lookbook V2 Pose 18", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["lb219"] = {"lunyx@lookbook_v2@pose019", "lookbook_v2@pose019", "Lookbook V2 Pose 19", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["lb220"] = {"lunyx@lookbook_v2@pose020", "lookbook_v2@pose020", "Lookbook V2 Pose 20", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
     
        -- PortraitPosePack
     
        ["portrait1"] = {"lunyx@portrait001", "portrait001", "Portrait Pose 1", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
        ["portrait2"] = {"lunyx@portrait002", "portrait002", "Portrait Pose 2", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
           ["portrait3"] = {"lunyx@portrait003", "portrait003", "Portrait Pose 3", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
           ["portrait4"] = {"lunyx@portrait004", "portrait004", "Portrait Pose 4", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
           ["portrait5"] = {"lunyx@portrait005", "portrait005", "Portrait Pose 5", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
           ["portrait6"] = {"lunyx@portrait006", "portrait006", "Portrait Pose 6", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
           ["portrait7"] = {"lunyx@portrait007", "portrait007", "Portrait Pose 7", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
           ["portrait8"] = {"lunyx@portrait008", "portrait008", "Portrait Pose 8", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
           ["portrait9"] = {"lunyx@portrait009", "portrait009", "Portrait Pose 9", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
           ["portrait10"] = {"lunyx@portrait010", "portrait010", "Portrait Pose 10", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
     
        -- SweetiePosePack
     
        ["sweetie1"] = {"lunyx@sweetie@pose001", "sweetie@pose001", "Sweetie Pose 1", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["sweetie2"] = {"lunyx@sweetie@pose002", "sweetie@pose002", "Sweetie Pose 2", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["sweetie3"] = {"lunyx@sweetie@pose003", "sweetie@pose003", "Sweetie Pose 3", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["sweetie4"] = {"lunyx@sweetie@pose004", "sweetie@pose004", "Sweetie Pose 4", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["sweetie5"] = {"lunyx@sweetie@pose005", "sweetie@pose005", "Sweetie Pose 5", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["sweetie6"] = {"lunyx@sweetie@pose006", "sweetie@pose006", "Sweetie Pose 6", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["sweetie7"] = {"lunyx@sweetie@pose007", "sweetie@pose007", "Sweetie Pose 7", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["sweetie8"] = {"lunyx@sweetie@pose008", "sweetie@pose008", "Sweetie Pose 8", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["sweetie9"] = {"lunyx@sweetie@pose009", "sweetie@pose009", "Sweetie Pose 9", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["sweetie10"] = {"lunyx@sweetie@pose010", "sweetie@pose010", "Sweetie Pose 10", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
     
        -- SyxJumpPosePack
     
        ["jump1"] = {"syx@jump01", "jump01", "Jump 1", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        ["jump2"] = {"syx@jump02", "jump02", "Jump 2", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        ["jump3"] = {"syx@jump03", "jump03", "Jump 3", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        ["jump4"] = {"syx@jump04", "jump04", "Jump 4", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        ["jump5"] = {"syx@jump05", "jump05", "Jump 5", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        ["jump6"] = {"syx@jump06", "jump06", "Jump 6", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        ["jump7"] = {"syx@jump07", "jump07", "Jump 7", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        ["jump8"] = {"syx@jump08", "jump08", "Jump 8", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
     
        -- FollowMe
     
         ["followa"] = {"dollie_mods@follow_me_001", "follow_me_001", "Follow me pose A", AnimationOptions =
         {
            EmoteLoop = true,
            EmoteMoving = false,
         }},
     
         ["followb"] = {"dollie_mods@follow_me_002", "follow_me_002", "Follow me pose B", AnimationOptions =
         {
            EmoteLoop = true,
            EmoteMoving = false,
         }},
         
         -- Trippie Redd Pose 1
     
         -- ["trippieredd"] = {"wrldmods@trippieredd", "trippieredd", "Trippie Red Pose", AnimationOptions =
         -- {
         --    EmoteLoop = true,
         --    EmoteMoving = true,
         -- }},
     
         -- Gang Signs
     
         ["gangsign3"] = {"simple@animation", "simple_clip", "Gang Sign 3", AnimationOptions =
         {
            EmoteLoop = true,
            EmoteMoving = true,
         }},
     
         ["gangsign4"] = {"instapose2@animation", "instapose2_clip", "Gang Sign 4", AnimationOptions =
         {
            EmoteLoop = true,
            EmoteMoving = true,
         }},
     
         ["gangsign5"] = {"instapose@animation", "instapose_clip", "Gang Sign 5", AnimationOptions =
         {
            EmoteLoop = true,
            EmoteMoving = true,
         }},
     
         ["gangsign6"] = {"gangpose@animation", "gangpose_clip", "Gang Sign 6", AnimationOptions =
         {
            EmoteLoop = true,
            EmoteMoving = true,
         }},
     
         -- Mikey Gang Signs
     
         ["gangsign7"] = {"mikey@gangsigns@new", "mgangsign_1", "Gang Sign 7", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
        ["gangsign8"] = {"mikey@gangsigns@new", "mgangsign_2", "Gang Sign 8", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
        ["gangsign9"] = {"mikey@gangsigns@new", "mgangsign_3", "Gang Sign 9", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
        ["gangsign10"] = {"mikey@gangsigns@new", "mgangsign_4", "Gang Sign 10", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
        ["gangsign11"] = {"mikey@gangsigns@new", "mgangsign_5", "Gang Sign 11", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
        ["gangsign12"] = {"mikey@gangsigns@new", "mgangsign_6", "Gang Sign 12", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
        ["gangsign13"] = {"mikey@gangsigns@new", "mgangsign_7", "Gang Sign 13", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
        ["gangsign14"] = {"mikey@gangsigns@new", "mgangsign_8", "Gang Sign 14", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
        ["gangsign15"] = {"mikey@gangsigns@new", "mgangsign_9", "Gang Sign 15", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
        ["gangsign16"] = {"mikey@gangsigns@new", "mgangsign_10", "Gang Sign 16", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
        ["gangsign17"] = {"mikey@gangsigns@new", "mgangsign_11", "Gang Sign 17", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
     
         -- DivinedRoleplayAnimations
         ["heart"] = {"divined@rpack@new", "alchemy", "Heart", AnimationOptions =
        {
            EmoteLoop = true
        }},
        ["badmood"] = {"divined@rpack@new", "badmood", "Bad Mood", AnimationOptions =
        {
            EmoteLoop = true
        }},
        ["bunnyhop"] = {"divined@rpack@new", "bunnyhop", "Bunnyhop", AnimationOptions =
        {
            EmoteLoop = true
        }},
        ["burpee"] = {"divined@rpack@new", "burpee", "Burpee", AnimationOptions =
        {
            EmoteLoop = true
        }},
        ["callme"] = {"divined@rpack@new", "callme", "Call Me", AnimationOptions =
        {
            EmoteLoop = true
        }},
        ["coronet"] = {"divined@rpack@new", "coronet", "Coronet", AnimationOptions =
        {
            EmoteLoop = true
        }},
        ["dcry"] = {"divined@rpack@new", "dcry", "Cry", AnimationOptions =
        {
            EmoteLoop = true
        }},
        ["hailcab"] = {"divined@rpack@new", "hailcab", "Hailcab", AnimationOptions =
        {
            EmoteLoop = true
        }},
        ["kepler"] = {"divined@rpack@new", "kepler", "King Of The Jungle", AnimationOptions =
        {
            EmoteLoop = true
        }},
        ["mindblown"] = {"divined@rpack@new", "mindblown", "Mindblown", AnimationOptions =
        {
            EmoteLoop = true
        }},
        ["uproar"] = {"divined@rpack@new", "uproar", "Uproar", AnimationOptions =
        {
            EmoteLoop = true
        }},
        ["yeet"] = {"divined@rpack@new", "yeet", "Yeet", AnimationOptions =
        {
            EmoteLoop = true
        }},
     
        -- hipsxn anim pack 1
     
        ["gangsign18"] = {"beepee_anim@animation", "beepee_anim_clip", "Gang Sign 18", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
     
        ["crouchedselfie"] = {"crouchedselfieanim@animation", "crouchedselfieanim_clip", "Crouched Selfie", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
     
        ["gangsign19"] = {"gangsign@animation", "gangsign_clip", "Gang Sign 19", AnimationOptions =
        {
             EmoteMoving = true,
            EmoteLoop = true,
        }},
     
        ["handonhead"] = {"handonheadanim@animation", "handonheadanim_clip", "Hand On Head", AnimationOptions =
        {
             EmoteMoving = true,
            EmoteLoop = true,
        }},
     
        ["crouchedselfie2"] = {"kjanim@animation", "kjanim_clip", "Crouched Selfie 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
     
        ["gangsign20"] = {"pwcloseanim@animation", "pwcloseanim_clip", "Gang Sign 20", AnimationOptions =
        {
         EmoteMoving = true,
         EmoteLoop = true,
        }},
     
        ["rabbitselfie"] = {"rabbitanim@animation", "rabbitanim_clip", "Rabbit Selfie", AnimationOptions =
        {
            EmoteLoop = true,
        }},
     
        ["standingpose"] = {"standingposeanim@animation", "standingposeanim_clip", "Standing Pose", AnimationOptions =
        {
            EmoteLoop = true,
        }},
     
        ["twistedselfie"] = {"twistedselfieanim@animation", "twistedselfieanim_clip", "Twisted Selfie", AnimationOptions =
        {
            EmoteLoop = true,
        }},
     
        -- JustMePosePack
     
        ["justme1"] = {"lunyx@justme001", "justme001", "Just Me Pose 1", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
     
        ["justme2"] = {"lunyx@justme002", "justme002", "Just Me Pose 2", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["justme3"] = {"lunyx@justme003", "justme003", "Just Me Pose 3", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["justme4"] = {"lunyx@justme004", "justme004", "Just Me Pose 4", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["justme5"] = {"lunyx@justme005", "justme005", "Just Me Pose 5", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["justme6"] = {"lunyx@justme006", "justme006", "Just Me Pose 6", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
     --    ["justme7"] = {"lunyx@justme007", "justme007", "Just Me Pose 7", AnimationOptions =
     --    {
     --        EmoteLoop = true,
     --        EmoteMoving = false,
     --    }},
        
        ["justme8"] = {"lunyx@justme008", "justme008", "Just Me Pose 8", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["justme9"] = {"lunyx@justme009", "justme009", "Just Me Pose 9", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["justme10"] = {"lunyx@justme010", "justme010", "Just Me Pose 10", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
        
        ["justme11"] = {"lunyx@justme011", "justme011", "Just Me Pose 11", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
     
        -- Cute Pose Pack
     
        ["imcute1"] = {"lunyx@imcute@pose001", "imcute@pose001", "I'm Cute Pose 01", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
        
        ["imcute2"] = {"lunyx@imcute@pose002", "imcute@pose002", "I'm Cute Pose 02", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
        
        ["imcute3"] = {"lunyx@imcute@pose003", "imcute@pose003", "I'm Cute Pose 03", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
        
        ["imcute4"] = {"lunyx@imcute@pose004", "imcute@pose004", "I'm Cute Pose 04", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
        
        ["imcute5"] = {"lunyx@imcute@pose005", "imcute@pose005", "I'm Cute Pose 05", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
        
        ["imcute6"] = {"lunyx@imcute@pose006", "imcute@pose006", "I'm Cute Pose 06", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
        
        ["imcute7"] = {"lunyx@imcute@pose007", "imcute@pose007", "I'm Cute Pose 07", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
        
        ["imcute8"] = {"lunyx@imcute@pose008", "imcute@pose008", "I'm Cute Pose 08", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
        
        ["imcute9"] = {"lunyx@imcute@pose009", "imcute@pose009", "I'm Cute Pose 09", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
        
        ["imcute10"] = {"lunyx@imcute@pose010", "imcute@pose010", "I'm Cute Pose 10", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
        
        ["imcute11"] = {"lunyx@imcute@pose011", "imcute@pose011", "I'm Cute Pose 11", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
        
        ["imcute12"] = {"lunyx@imcute@pose012", "imcute@pose012", "I'm Cute Pose 12", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
        
        ["imcute13"] = {"lunyx@imcute@pose013", "imcute@pose013", "I'm Cute Pose 13", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
        
        ["imcute14"] = {"lunyx@imcute@pose014", "imcute@pose014", "I'm Cute Pose 14", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
        
        ["imcute15"] = {"lunyx@imcute@pose015", "imcute@pose015", "I'm Cute Pose 15", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
        
        ["imcute16"] = {"lunyx@imcute@pose016", "imcute@pose016", "I'm Cute Pose 16", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
        
        ["imcute17"] = {"lunyx@imcute@pose017", "imcute@pose017", "I'm Cute Pose 17", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
}

-----------------------------------------------------------------------------------------
--| I don't think you should change the code below unless you know what you are doing |--
-----------------------------------------------------------------------------------------

-- Add the custom emotes to RPEmotes main array
for arrayName, array in pairs(CustomDP) do
    if RP[arrayName] then
        for emoteName, emoteData in pairs(array) do
            RP[arrayName][emoteName] = emoteData
        end
    end
    -- Free memory
    CustomDP[arrayName] = nil
end
-- Free memory
CustomDP = nil
