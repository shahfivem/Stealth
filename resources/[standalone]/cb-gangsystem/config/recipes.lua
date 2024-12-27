-- ██████╗██████╗  █████╗ ███████╗████████╗██╗███╗   ██╗ ██████╗
--██╔════╝██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██║████╗  ██║██╔════╝
--██║     ██████╔╝███████║█████╗     ██║   ██║██╔██╗ ██║██║  ███╗
--██║     ██╔══██╗██╔══██║██╔══╝     ██║   ██║██║╚██╗██║██║   ██║
--╚██████╗██║  ██║██║  ██║██║        ██║   ██║██║ ╚████║╚██████╔╝
-- ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝        ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝
Config.CraftingRecipes = {
    ["WVINE"] = { -- THIS NEEDS TO MATCH THE "type" VARIABLE IN config_hideouts.lua FOR ONE OF YOUR HIDEOUTS
        ["coke_brick"] = {
            items = {
                { item = "cokebaggy", amount = 24, remove = true },
            },
            result = {
                item = "coke_brick",
                label = "Cocaine Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["medarmour"] = {
            items = {
                { item = "steel", amount = 50, remove = true },
                { item = "plastic", amount = 50, remove = true },
                { item = "rubber", amount = 50, remove = true },
            },
            result = {
                item = "medarmour",
                amount = 1,
                 label = "medarmour",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
        },
        ["parts_weapon"] = {
            items = {
                { item = "plastic", amount = 5, remove = true },
                { item = "metalscrap", amount = 5, remove = true },
                { item = "steel", amount = 5, remove = true },
            },
            result = {
                item = "parts_weapon",
                label = "Weapon Parts",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            label = "Weapon Parts",
            clip = 'base_female',
        },
        ["weapon_sawnoffshotgun"] = {
            items = {
                { item = "bpsawnoffshotgun", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
                { item = "shotgun_stock", amount = 1, remove = true },
                { item = "shotgun_firingpin", amount = 1, remove = true },
                { item = "iron", amount = 30, remove = true },
                { item = "steel", amount = 30, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
                        result = {
                item = "weapon_sawnoffshotgun",
                amount = 1,
                 label = "Sawnoff Shotgun",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_minismg"] = {
            items = {
                { item = "bpminismg", amount = 1, remove = true },
                { item = "smg_receiver", amount = 1, remove = true },
                { item = "smg_bolt", amount = 1, remove = true },
                { item = "aluminum", amount = 25, remove = true },
                { item = "plastic", amount = 25, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_minismg",
                amount = 1,
                 label = "Mini SMG",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_heavypistol"] = {
            items = {
                { item = "bpheavypistol", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
                { item = "pistol_slide", amount = 1, remove = true },
                { item = "pistol_body", amount = 1, remove = true },
                { item = "metalscrap", amount = 15, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_heavypistol",
                amount = 1,
                 label = "Heavy Pistol",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_clip_extended_smg"] = {
            items = {
                { item = "bpclip_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 7, remove = true },
            },
            result = {
                item = "at_clip_extended_smg",
                label = "SMG Extended clip",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_suppressor_light"] = {
            items = {
                { item = "bpsuppressor_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
            },
            result = {
                item = "at_suppressor_light",
                label = "Suppressor",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_scope_medium"] = {
            items = {
                { item = "bpsmallscope_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 3, remove = true },
            },
            result = {
                item = "at_scope_medium",
                label = "Medium Scope",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
    },
    ["SANDY"] = { 
        ["meth_brick"] = {
            items = {
                { item = "meth", amount = 24, remove = true },
            },
            result = {
                item = "meth_brick",
                label = "Meth Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["medarmour"] = {
            items = {
                { item = "steel", amount = 50, remove = true },
                { item = "plastic", amount = 50, remove = true },
                { item = "rubber", amount = 50, remove = true },
            },
            result = {
                item = "medarmour",
                amount = 1,
                 label = "medarmour",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
        },
        ["parts_weapon"] = {
            items = {
                { item = "plastic", amount = 5, remove = true },
                { item = "metalscrap", amount = 5, remove = true },
                { item = "steel", amount = 5, remove = true },
            },
            result = {
                item = "parts_weapon",
                label = "Weapon Parts",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            label = "Weapon Parts",
            clip = 'base_female',
        },
        ["weapon_comblocpdw"] = {
            items = {
                { item = "bpcomblocpdw", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
                { item = "rifle_receiver", amount = 1, remove = true },
                { item = "smg_bolt", amount = 1, remove = true },
                { item = "iron", amount = 30, remove = true },
                { item = "steel", amount = 30, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_comblocpdw",
                amount = 1,
                 label = "Combloc PDW",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_microsmg"] = {
            items = {
                { item = "bpmicrosmg", amount = 1, remove = true },
                { item = "smg_receiver", amount = 1, remove = true },
                { item = "smg_bolt", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
                { item = "aluminum", amount = 25, remove = true },
                { item = "plastic", amount = 25, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_microsmg",
                amount = 1,
                 label = "Micro SMG",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_vintagepistol"] = {
            items = {
                { item = "bpvintagepistol", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
                { item = "pistol_slide", amount = 1, remove = true },
                { item = "pistol_body", amount = 1, remove = true },
                { item = "metalscrap", amount = 15, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_vintagepistol",
                amount = 1,
                 label = "Vintage Pistol",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_clip_extended_rifle"] = {
            items = {
                { item = "bpclip_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
            },
            result = {
                item = "at_clip_extended_rifle",
                label = "Rifle Extended clip",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_scope_macro"] = {
            items = {
                { item = "bpsmallscope_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 3, remove = true },
            },
            result = {
                item = "at_scope_macro",
                label = "Macro Scope",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_grip"] = {
            items = {
                { item = "bpgrip_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
            },
            result = {
                item = "at_grip",
                label = "Grip",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
    },
    ["KOREAT"] = {
        ["heroin_brick"] = {
            items = {
                { item = "heroin_1oz", amount = 16, remove = true },
            },
            result = {
                item = "heroin_brick",
                label = "Heroin Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["medarmour"] = {
            items = {
                { item = "steel", amount = 50, remove = true },
                { item = "plastic", amount = 50, remove = true },
                { item = "rubber", amount = 50, remove = true },
            },
            result = {
                item = "medarmour",
                amount = 1,
                 label = "medarmour",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
        },
        ["parts_weapon"] = {
            items = {
                { item = "plastic", amount = 5, remove = true },
                { item = "metalscrap", amount = 5, remove = true },
                { item = "steel", amount = 5, remove = true },
            },
            result = {
                item = "parts_weapon",
                label = "Weapon Parts",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            label = "Weapon Parts",
            clip = 'base_female',
        },
        ["weapon_assaultpdw"] = {
            items = {
                { item = "bpassaultpdw", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
                { item = "rifle_receiver", amount = 1, remove = true },
                { item = "smg_bolt", amount = 1, remove = true },
                { item = "iron", amount = 30, remove = true },
                { item = "steel", amount = 30, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_assaultpdw",
                amount = 1,
                 label = "Assault PDW",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_machinepistol"] = {
            items = {
                { item = "bpmachinepistol", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
                { item = "pistol_body", amount = 1, remove = true },
                { item = "smg_bolt", amount = 1, remove = true },
                { item = "aluminum", amount = 25, remove = true },
                { item = "plastic", amount = 25, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_machinepistol",
                amount = 1,
                 label = "Tech-9",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_pistol50"] = {
            items = {
                { item = "bppistol50", amount = 1, remove = true },
                { item = "silveringot", amount = 3, remove = true },
                { item = "metalscrap", amount = 15, remove = true },
                { item = "pistol_slide", amount = 1, remove = true },
                { item = "pistol_body", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_pistol50",
                amount = 1,
                 label = "Pistol 50",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_flashlight"] = {
            items = {
                { item = "bpflashlight_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 3, remove = true },
            },
            result = {
                item = "at_flashlight",
                label = "Tac Flashlight",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_suppressor_light"] = {
            items = {
                { item = "bpsuppressor_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
            },
            result = {
                item = "at_suppressor_light",
                label = "Suppressor",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_clip_drum_smg"] = {
            items = {
                { item = "bpdrum_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
            },
            result = {
                item = "at_clip_drum_smg",
                label = "SMG Drug Mag",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
    },
    ["GRAPES"] = {
        ["coke_brick"] = {
            items = {
                { item = "cokebaggy", amount = 24, remove = true },
            },
            result = {
                item = "coke_brick",
                label = "Cocaine Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["medarmour"] = {
            items = {
                { item = "steel", amount = 50, remove = true },
                { item = "plastic", amount = 50, remove = true },
                { item = "rubber", amount = 50, remove = true },
            },
            result = {
                item = "medarmour",
                amount = 1,
                 label = "medarmour",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
        },
        ["parts_weapon"] = {
            items = {
                { item = "plastic", amount = 5, remove = true },
                { item = "metalscrap", amount = 5, remove = true },
                { item = "steel", amount = 5, remove = true },
            },
            result = {
                item = "parts_weapon",
                label = "Weapon Parts",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            label = "Weapon Parts",
            clip = 'base_female',
        },
        ["weapon_combatpdw"] = {
            items = {
                { item = "bpcombatpdw", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
                { item = "smg_receiver", amount = 1, remove = true },
                { item = "smg_bolt", amount = 1, remove = true },
                { item = "iron", amount = 30, remove = true },
                { item = "steel", amount = 30, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_combatpdw",
                amount = 1,
                 label = "Combat PDW",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_machinepistol"] = {
            items = {
                { item = "bpmachinepistol", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
                { item = "pistol_body", amount = 1, remove = true },
                { item = "smg_bolt", amount = 1, remove = true },
                { item = "aluminum", amount = 25, remove = true },
                { item = "plastic", amount = 25, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_machinepistol",
                amount = 1,
                 label = "Tech-9",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_pistol_mk2"] = {
            items = {
                { item = "bpsolverpistol", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
                { item = "pistol_slide", amount = 1, remove = true },
                { item = "pistol_body", amount = 1, remove = true },
                { item = "metalscrap", amount = 15, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_pistol_mk2",
                amount = 1,
                 label = "Solver Pistol",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_suppressor_light"] = {
            items = {
                { item = "bpsuppressor_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
            },
            result = {
                item = "at_suppressor_light",
                label = "Suppressor",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_clip_drum_smg"] = {
            items = {
                { item = "bpdrum_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
            },
            result = {
                item = "at_clip_drum_smg",
                label = "SMG Drug Mag",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_clip_drum_rifle"] = {
            items = {
                { item = "bpdrum_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
            },
            result = {
                item = "at_clip_drum_rifle",
                label = "Rifle Drug Mag",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
    },
    ["SANAND"] = { 
        ["meth_brick"] = {
            items = {
                { item = "meth", amount = 24, remove = true },
            },
            result = {
                item = "meth_brick",
                label = "Meth Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["medarmour"] = {
            items = {
                { item = "steel", amount = 50, remove = true },
                { item = "plastic", amount = 50, remove = true },
                { item = "rubber", amount = 50, remove = true },
            },
            result = {
                item = "medarmour",
                amount = 1,
                 label = "medarmour",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
        },
        ["parts_weapon"] = {
            items = {
                { item = "plastic", amount = 5, remove = true },
                { item = "metalscrap", amount = 5, remove = true },
                { item = "steel", amount = 5, remove = true },
            },
            result = {
                item = "parts_weapon",
                label = "Weapon Parts",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            label = "Weapon Parts",
            clip = 'base_female',
        },
        ["weapon_assaultrifle"] = {
            items = {
                { item = "bpassaultrifle", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
                { item = "rifle_receiver", amount = 1, remove = true },
                { item = "rifle_bolt", amount = 1, remove = true },
                { item = "iron", amount = 30, remove = true },
                { item = "steel", amount = 30, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_assaultrifle",
                amount = 1,
                 label = "Assault Rifle",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_minismg"] = {
            items = {
                { item = "bpminismg", amount = 1, remove = true },
                { item = "smg_receiver", amount = 1, remove = true },
                { item = "smg_bolt", amount = 1, remove = true },
                { item = "aluminum", amount = 25, remove = true },
                { item = "plastic", amount = 25, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_minismg",
                amount = 1,
                 label = "Mini SMG",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_pistol_mk2"] = {
            items = {
                { item = "bpsolverpistol", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
                { item = "pistol_slide", amount = 1, remove = true },
                { item = "pistol_body", amount = 1, remove = true },
                { item = "metalscrap", amount = 15, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_pistol_mk2",
                amount = 1,
                 label = "Solver Pistol",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_suppressor_light"] = {
            items = {
                { item = "bpsuppressor_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
            },
            result = {
                item = "at_suppressor_light",
                label = "Suppressor",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_suppressor_heavy"] = {
            items = {
                { item = "bpsuppressor_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
            },
            result = {
                item = "at_suppressor_heavy",
                label = "Tactial Suppressor",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_clip_drum_rifle"] = {
            items = {
                { item = "bpdrum_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
            },
            result = {
                item = "at_clip_drum_rifle",
                label = "Rifle Drug Mag",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
    },
    ["CHIL"] = { 
        ["meth_brick"] = {
            items = {
                { item = "meth", amount = 24, remove = true },
            },
            result = {
                item = "meth_brick",
                label = "Meth Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["medarmour"] = {
            items = {
                { item = "steel", amount = 50, remove = true },
                { item = "plastic", amount = 50, remove = true },
                { item = "rubber", amount = 50, remove = true },
            },
            result = {
                item = "medarmour",
                amount = 1,
                 label = "medarmour",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
        },
        ["parts_weapon"] = {
            items = {
                { item = "plastic", amount = 5, remove = true },
                { item = "metalscrap", amount = 5, remove = true },
                { item = "steel", amount = 5, remove = true },
            },
            result = {
                item = "parts_weapon",
                label = "Weapon Parts",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            label = "Weapon Parts",
            clip = 'base_female',
        },
        ["weapon_sawnoffshotgun"] = {
            items = {
                { item = "bpsawnoffshotgun", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
                { item = "shotgun_stock", amount = 1, remove = true },
                { item = "shotgun_firingpin", amount = 1, remove = true },
                { item = "iron", amount = 30, remove = true },
                { item = "steel", amount = 30, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
                        result = {
                item = "weapon_sawnoffshotgun",
                amount = 1,
                 label = "Sawnoff Shotgun",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_appistol"] = {
            items = {
                { item = "bpappistol", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
                { item = "pistol_slide", amount = 1, remove = true },
                { item = "pistol_body", amount = 1, remove = true },
                { item = "metalscrap", amount = 15, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_appistol",
                amount = 1,
                 label = "AP Pistol",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_pistol_mk2"] = {
            items = {
                { item = "bpsolverpistol", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
                { item = "pistol_slide", amount = 1, remove = true },
                { item = "pistol_body", amount = 1, remove = true },
                { item = "metalscrap", amount = 15, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_pistol_mk2",
                amount = 1,
                 label = "Solver Pistol",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_clip_extended_pistol"] = {
            items = {
                { item = "bpclip_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
            },
            result = {
                item = "at_clip_extended_pistol",
                label = "Pistol Extended Clip",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_suppressor_light"] = {
            items = {
                { item = "bpsuppressor_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
            },
            result = {
                item = "at_suppressor_light",
                label = "Suppressor",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_suppressor_heavy"] = {
            items = {
                { item = "bpsuppressor_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
            },
            result = {
                item = "at_suppressor_heavy",
                label = "Tactial Suppressor",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
    },
    ["PALETO"] = { 
        ["heroin_brick"] = {
            items = {
                { item = "heroin_1oz", amount = 16, remove = true },
            },
            result = {
                item = "heroin_brick",
                label = "Heroin Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["medarmour"] = {
            items = {
                { item = "steel", amount = 50, remove = true },
                { item = "plastic", amount = 50, remove = true },
                { item = "rubber", amount = 50, remove = true },
            },
            result = {
                item = "medarmour",
                amount = 1,
                 label = "medarmour",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
        },
        ["parts_weapon"] = {
            items = {
                { item = "plastic", amount = 5, remove = true },
                { item = "metalscrap", amount = 5, remove = true },
                { item = "steel", amount = 5, remove = true },
            },
            result = {
                item = "parts_weapon",
                label = "Weapon Parts",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            label = "Weapon Parts",
            clip = 'base_female',
        },
        ["weapon_combatpdw"] = {
            items = {
                { item = "bpcombatpdw", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
                { item = "smg_receiver", amount = 1, remove = true },
                { item = "smg_bolt", amount = 1, remove = true },
                { item = "iron", amount = 30, remove = true },
                { item = "steel", amount = 30, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_combatpdw",
                amount = 1,
                 label = "Combat PDW",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_machinepistol"] = {
            items = {
                { item = "bpmachinepistol", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
                { item = "pistol_body", amount = 1, remove = true },
                { item = "smg_bolt", amount = 1, remove = true },
                { item = "aluminum", amount = 25, remove = true },
                { item = "plastic", amount = 25, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_machinepistol",
                amount = 1,
                 label = "Tech-9",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_pistol50"] = {
            items = {
                { item = "bppistol50", amount = 1, remove = true },
                { item = "silveringot", amount = 3, remove = true },
                { item = "metalscrap", amount = 15, remove = true },
                { item = "pistol_slide", amount = 1, remove = true },
                { item = "pistol_body", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_pistol50",
                amount = 1,
                 label = "Pistol 50",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_suppressor_heavy"] = {
            items = {
                { item = "bpsuppressor_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
            },
            result = {
                item = "at_suppressor_heavy",
                label = "Tactial Suppressor",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_clip_drum_smg"] = {
            items = {
                { item = "bpdrum_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
            },
            result = {
                item = "at_clip_drum_smg",
                label = "SMG Drug Mag",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_grip"] = {
            items = {
                { item = "bpgrip_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
            },
            result = {
                item = "at_grip",
                label = "Grip",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
    },
    ["MIRR"] = { 
        ["heroin_brick"] = {
            items = {
                { item = "heroin_1oz", amount = 16, remove = true },
            },
            result = {
                item = "heroin_brick",
                label = "Heroin Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["medarmour"] = {
            items = {
                { item = "steel", amount = 50, remove = true },
                { item = "plastic", amount = 50, remove = true },
                { item = "rubber", amount = 50, remove = true },
            },
            result = {
                item = "medarmour",
                amount = 1,
                 label = "medarmour",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
        },
        ["parts_weapon"] = {
            items = {
                { item = "plastic", amount = 5, remove = true },
                { item = "metalscrap", amount = 5, remove = true },
                { item = "steel", amount = 5, remove = true },
            },
            result = {
                item = "parts_weapon",
                label = "Weapon Parts",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            label = "Weapon Parts",
            clip = 'base_female',
        },
        ["weapon_assaultpdw"] = {
            items = {
                { item = "bpassaultpdw", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
                { item = "rifle_receiver", amount = 1, remove = true },
                { item = "smg_bolt", amount = 1, remove = true },
                { item = "iron", amount = 30, remove = true },
                { item = "steel", amount = 30, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_assaultpdw",
                amount = 1,
                 label = "Assault PDW",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_minismg"] = {
            items = {
                { item = "bpminismg", amount = 1, remove = true },
                { item = "smg_receiver", amount = 1, remove = true },
                { item = "smg_bolt", amount = 1, remove = true },
                { item = "aluminum", amount = 25, remove = true },
                { item = "plastic", amount = 25, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_minismg",
                amount = 1,
                 label = "Mini SMG",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_heavypistol"] = {
            items = {
                { item = "bpheavypistol", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
                { item = "pistol_slide", amount = 1, remove = true },
                { item = "pistol_body", amount = 1, remove = true },
                { item = "metalscrap", amount = 15, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_heavypistol",
                amount = 1,
                 label = "Heavy Pistol",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_clip_extended_pistol"] = {
            items = {
                { item = "bpclip_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
            },
            result = {
                item = "at_clip_extended_pistol",
                label = "Pistol Extended Clip",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_clip_extended_rifle"] = {
            items = {
                { item = "bpclip_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
            },
            result = {
                item = "at_clip_extended_rifle",
                label = "Rifle Extended clip",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_suppressor_heavy"] = {
            items = {
                { item = "bpsuppressor_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
            },
            result = {
                item = "at_suppressor_heavy",
                label = "Tactial Suppressor",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
    },
    ["DAVIS"] = { 
        ["parts_weapon"] = {
            items = {
                { item = "plastic", amount = 5, remove = true },
                { item = "metalscrap", amount = 5, remove = true },
                { item = "steel", amount = 5, remove = true },
            },
            result = {
                item = "parts_weapon",
                label = "Weapon Parts",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            label = "Weapon Parts",
            clip = 'base_female',
        },
        ["medarmour"] = {
            items = {
                { item = "steel", amount = 50, remove = true },
                { item = "plastic", amount = 50, remove = true },
                { item = "rubber", amount = 50, remove = true },
            },
            result = {
                item = "medarmour",
                amount = 1,
                 label = "medarmour",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
        },
        ["weapon_assaultrifle"] = {
            items = {
                { item = "bpassaultrifle", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
                { item = "rifle_receiver", amount = 1, remove = true },
                { item = "rifle_bolt", amount = 1, remove = true },
                { item = "iron", amount = 30, remove = true },
                { item = "steel", amount = 30, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_assaultrifle",
                amount = 1,
                 label = "Assault Rifle",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_appistol"] = {
            items = {
                { item = "bpappistol", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
                { item = "pistol_slide", amount = 1, remove = true },
                { item = "pistol_body", amount = 1, remove = true },
                { item = "metalscrap", amount = 15, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_appistol",
                amount = 1,
                 label = "AP Pistol",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_heavypistol"] = {
            items = {
                { item = "bpheavypistol", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
                { item = "pistol_slide", amount = 1, remove = true },
                { item = "pistol_body", amount = 1, remove = true },
                { item = "metalscrap", amount = 15, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_heavypistol",
                amount = 1,
                 label = "Heavy Pistol",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_clip_extended_pistol"] = {
            items = {
                { item = "bpclip_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
            },
            result = {
                item = "at_clip_extended_pistol",
                label = "Pistol Extended Clip",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_clip_drum_rifle"] = {
            items = {
                { item = "bpdrum_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
            },
            result = {
                item = "at_clip_drum_rifle",
                label = "Rifle Drug Mag",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_grip"] = {
            items = {
                { item = "bpgrip_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
            },
            result = {
                item = "at_grip",
                label = "Grip",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_ak47", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_skunk", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_amnesia", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_gelato", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_og-kush", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_purple-haze", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_white-widow", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_zkittlez", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
    },
    ["CHAMH"] = {
        ["coke_brick"] = {
            items = {
                { item = "cokebaggy", amount = 24, remove = true },
            },
            result = {
                item = "coke_brick",
                label = "Cocaine Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["medarmour"] = {
            items = {
                { item = "steel", amount = 50, remove = true },
                { item = "plastic", amount = 50, remove = true },
                { item = "rubber", amount = 50, remove = true },
            },
            result = {
                item = "medarmour",
                amount = 1,
                 label = "medarmour",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
        },
        ["parts_weapon"] = {
            items = {
                { item = "plastic", amount = 5, remove = true },
                { item = "metalscrap", amount = 5, remove = true },
                { item = "steel", amount = 5, remove = true },
            },
            result = {
                item = "parts_weapon",
                label = "Weapon Parts",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            label = "Weapon Parts",
            clip = 'base_female',
        },
        ["weapon_comblocpdw"] = {
            items = {
                { item = "bpcomblocpdw", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
                { item = "rifle_receiver", amount = 1, remove = true },
                { item = "smg_bolt", amount = 1, remove = true },
                { item = "iron", amount = 30, remove = true },
                { item = "steel", amount = 30, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_comblocpdw",
                amount = 1,
                 label = "Combloc PDW",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_microsmg"] = {
            items = {
                { item = "bpmicrosmg", amount = 1, remove = true },
                { item = "smg_receiver", amount = 1, remove = true },
                { item = "smg_bolt", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
                { item = "aluminum", amount = 25, remove = true },
                { item = "plastic", amount = 25, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_microsmg",
                amount = 1,
                 label = "Micro SMG",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_vintagepistol"] = {
            items = {
                { item = "bpvintagepistol", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
                { item = "pistol_slide", amount = 1, remove = true },
                { item = "pistol_body", amount = 1, remove = true },
                { item = "metalscrap", amount = 15, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_vintagepistol",
                amount = 1,
                 label = "Vintage Pistol",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_flashlight"] = {
            items = {
                { item = "bpflashlight_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 3, remove = true },
            },
            result = {
                item = "at_flashlight",
                label = "Tac Flashlight",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_scope_small"] = {
            items = {
                { item = "bpsmallscope_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 3, remove = true },
            },
            result = {
                item = "at_scope_small",
                label = "Small Scope",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_clip_drum_rifle"] = {
            items = {
                { item = "bpdrum_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
            },
            result = {
                item = "at_clip_drum_rifle",
                label = "Rifle Drug Mag",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
    },
    ["VESP"] = {
        ["coke_brick"] = {
            items = {
                { item = "cokebaggy", amount = 24, remove = true },
            },
            result = {
                item = "coke_brick",
                label = "Cocaine Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["medarmour"] = {
            items = {
                { item = "steel", amount = 50, remove = true },
                { item = "plastic", amount = 50, remove = true },
                { item = "rubber", amount = 50, remove = true },
            },
            result = {
                item = "medarmour",
                amount = 1,
                 label = "medarmour",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
        },
        ["parts_weapon"] = {
            items = {
                { item = "plastic", amount = 5, remove = true },
                { item = "metalscrap", amount = 5, remove = true },
                { item = "steel", amount = 5, remove = true },
            },
            result = {
                item = "parts_weapon",
                label = "Weapon Parts",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            label = "Weapon Parts",
            clip = 'base_female',
        },
        ["weapon_sawnoffshotgun"] = {
            items = {
                { item = "bpsawnoffshotgun", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
                { item = "shotgun_stock", amount = 1, remove = true },
                { item = "shotgun_firingpin", amount = 1, remove = true },
                { item = "iron", amount = 30, remove = true },
                { item = "steel", amount = 30, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
                        result = {
                item = "weapon_sawnoffshotgun",
                amount = 1,
                 label = "Sawnoff Shotgun",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_appistol"] = {
            items = {
                { item = "bpappistol", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
                { item = "pistol_slide", amount = 1, remove = true },
                { item = "pistol_body", amount = 1, remove = true },
                { item = "metalscrap", amount = 15, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_appistol",
                amount = 1,
                 label = "AP Pistol",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_heavypistol"] = {
            items = {
                { item = "bpheavypistol", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
                { item = "pistol_slide", amount = 1, remove = true },
                { item = "pistol_body", amount = 1, remove = true },
                { item = "metalscrap", amount = 15, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_heavypistol",
                amount = 1,
                 label = "Heavy Pistol",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_clip_extended_pistol"] = {
            items = {
                { item = "bpclip_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
            },
            result = {
                item = "at_clip_extended_pistol",
                label = "Pistol Extended Clip",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_clip_drum_rifle"] = {
            items = {
                { item = "bpdrum_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
            },
            result = {
                item = "at_clip_drum_rifle",
                label = "Rifle Drug Mag",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_grip"] = {
            items = {
                { item = "bpgrip_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
            },
            result = {
                item = "at_grip",
                label = "Grip",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
    },
    ["MORN"] = { 
        ["parts_weapon"] = {
            items = {
                { item = "plastic", amount = 5, remove = true },
                { item = "metalscrap", amount = 5, remove = true },
                { item = "steel", amount = 5, remove = true },
            },
            result = {
                item = "parts_weapon",
                label = "Weapon Parts",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            label = "Weapon Parts",
            clip = 'base_female',
        },
        ["medarmour"] = {
            items = {
                { item = "steel", amount = 50, remove = true },
                { item = "plastic", amount = 50, remove = true },
                { item = "rubber", amount = 50, remove = true },
            },
            result = {
                item = "medarmour",
                amount = 1,
                 label = "medarmour",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
        },
        ["weapon_assaultpdw"] = {
            items = {
                { item = "bpassaultpdw", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
                { item = "rifle_receiver", amount = 1, remove = true },
                { item = "smg_bolt", amount = 1, remove = true },
                { item = "iron", amount = 30, remove = true },
                { item = "steel", amount = 30, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_assaultpdw",
                amount = 1,
                 label = "Assault PDW",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_machinepistol"] = {
            items = {
                { item = "bpmachinepistol", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
                { item = "pistol_body", amount = 1, remove = true },
                { item = "smg_bolt", amount = 1, remove = true },
                { item = "aluminum", amount = 25, remove = true },
                { item = "plastic", amount = 25, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_machinepistol",
                amount = 1,
                 label = "Tech-9",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_pistol_mk2"] = {
            items = {
                { item = "bpsolverpistol", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
                { item = "pistol_slide", amount = 1, remove = true },
                { item = "pistol_body", amount = 1, remove = true },
                { item = "metalscrap", amount = 15, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_pistol_mk2",
                amount = 1,
                 label = "Solver Pistol",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_clip_extended_smg"] = {
            items = {
                { item = "bpclip_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 7, remove = true },
            },
            result = {
                item = "at_clip_extended_smg",
                label = "SMG Extended clip",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_clip_extended_rifle"] = {
            items = {
                { item = "bpclip_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
            },
            result = {
                item = "at_clip_extended_rifle",
                label = "Rifle Extended clip",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_clip_drum_smg"] = {
            items = {
                { item = "bpdrum_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
            },
            result = {
                item = "at_clip_drum_smg",
                label = "SMG Drug Mag",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_ak47", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_skunk", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_amnesia", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_gelato", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_og-kush", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_purple-haze", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_white-widow", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_zkittlez", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
    },
    ["ELYSIAN"] = { 
        ["heroin_brick"] = {
            items = {
                { item = "heroin_1oz", amount = 16, remove = true },
            },
            result = {
                item = "heroin_brick",
                label = "Heroin Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["medarmour"] = {
            items = {
                { item = "steel", amount = 50, remove = true },
                { item = "plastic", amount = 50, remove = true },
                { item = "rubber", amount = 50, remove = true },
            },
            result = {
                item = "medarmour",
                amount = 1,
                 label = "medarmour",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
        },
        ["parts_weapon"] = {
            items = {
                { item = "plastic", amount = 5, remove = true },
                { item = "metalscrap", amount = 5, remove = true },
                { item = "steel", amount = 5, remove = true },
            },
            result = {
                item = "parts_weapon",
                label = "Weapon Parts",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            label = "Weapon Parts",
            clip = 'base_female',
        },
        ["weapon_assaultrifle"] = {
            items = {
                { item = "bpassaultrifle", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
                { item = "rifle_receiver", amount = 1, remove = true },
                { item = "rifle_bolt", amount = 1, remove = true },
                { item = "iron", amount = 30, remove = true },
                { item = "steel", amount = 30, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_assaultrifle",
                amount = 1,
                 label = "Assault Rifle",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_appistol"] = {
            items = {
                { item = "bpappistol", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
                { item = "pistol_slide", amount = 1, remove = true },
                { item = "pistol_body", amount = 1, remove = true },
                { item = "metalscrap", amount = 15, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_appistol",
                amount = 1,
                 label = "AP Pistol",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_pistol50"] = {
            items = {
                { item = "bppistol50", amount = 1, remove = true },
                { item = "silveringot", amount = 3, remove = true },
                { item = "metalscrap", amount = 15, remove = true },
                { item = "pistol_slide", amount = 1, remove = true },
                { item = "pistol_body", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_pistol50",
                amount = 1,
                 label = "Pistol 50",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_clip_extended_pistol"] = {
            items = {
                { item = "bpclip_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
            },
            result = {
                item = "at_clip_extended_pistol",
                label = "Pistol Extended Clip",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_clip_extended_rifle"] = {
            items = {
                { item = "bpclip_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
            },
            result = {
                item = "at_clip_extended_rifle",
                label = "Rifle Extended clip",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_clip_drum_smg"] = {
            items = {
                { item = "bpdrum_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
            },
            result = {
                item = "at_clip_drum_smg",
                label = "SMG Drug Mag",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
    },
    ["LMESA"] = { 
        ["parts_weapon"] = {
            items = {
                { item = "plastic", amount = 5, remove = true },
                { item = "metalscrap", amount = 5, remove = true },
                { item = "steel", amount = 5, remove = true },
            },
            result = {
                item = "parts_weapon",
                label = "Weapon Parts",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            label = "Weapon Parts",
            clip = 'base_female',
        },
        ["medarmour"] = {
            items = {
                { item = "steel", amount = 50, remove = true },
                { item = "plastic", amount = 50, remove = true },
                { item = "rubber", amount = 50, remove = true },
            },
            result = {
                item = "medarmour",
                amount = 1,
                 label = "medarmour",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
        },
        ["weapon_comblocpdw"] = {
            items = {
                { item = "bpcomblocpdw", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
                { item = "rifle_receiver", amount = 1, remove = true },
                { item = "smg_bolt", amount = 1, remove = true },
                { item = "iron", amount = 30, remove = true },
                { item = "steel", amount = 30, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_comblocpdw",
                amount = 1,
                 label = "Combloc PDW",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_microsmg"] = {
            items = {
                { item = "bpmicrosmg", amount = 1, remove = true },
                { item = "smg_receiver", amount = 1, remove = true },
                { item = "smg_bolt", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
                { item = "aluminum", amount = 25, remove = true },
                { item = "plastic", amount = 25, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_microsmg",
                amount = 1,
                 label = "Micro SMG",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_vintagepistol"] = {
            items = {
                { item = "bpvintagepistol", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
                { item = "pistol_slide", amount = 1, remove = true },
                { item = "pistol_body", amount = 1, remove = true },
                { item = "metalscrap", amount = 15, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_vintagepistol",
                amount = 1,
                 label = "Vintage Pistol",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_clip_extended_smg"] = {
            items = {
                { item = "bpclip_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 7, remove = true },
            },
            result = {
                item = "at_clip_extended_smg",
                label = "SMG Extended clip",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_flashlight"] = {
            items = {
                { item = "bpflashlight_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 3, remove = true },
            },
            result = {
                item = "at_flashlight",
                label = "Tac Flashlight",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_scope_large"] = {
            items = {
                { item = "bpsmallscope_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 3, remove = true },
            },
            result = {
                item = "at_scope_large",
                label = "Large Scope",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        }, 
        ["weed_brick"] = {
            items = {
                { item = "weed_ak47", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_skunk", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_amnesia", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_gelato", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_og-kush", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_purple-haze", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_white-widow", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_zkittlez", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
    },
    ["HARMO"] = { 
        ["heroin_brick"] = {
            items = {
                { item = "heroin_1oz", amount = 16, remove = true },
            },
            result = {
                item = "heroin_brick",
                label = "Heroin Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["medarmour"] = {
            items = {
                { item = "steel", amount = 50, remove = true },
                { item = "plastic", amount = 50, remove = true },
                { item = "rubber", amount = 50, remove = true },
            },
            result = {
                item = "medarmour",
                amount = 1,
                 label = "medarmour",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
        },
        ["parts_weapon"] = {
            items = {
                { item = "plastic", amount = 5, remove = true },
                { item = "metalscrap", amount = 5, remove = true },
                { item = "steel", amount = 5, remove = true },
            },
            result = {
                item = "parts_weapon",
                label = "Weapon Parts",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            label = "Weapon Parts",
            clip = 'base_female',
        },
        ["weapon_combatpdw"] = {
            items = {
                { item = "bpcombatpdw", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
                { item = "smg_receiver", amount = 1, remove = true },
                { item = "smg_bolt", amount = 1, remove = true },
                { item = "iron", amount = 30, remove = true },
                { item = "steel", amount = 30, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_combatpdw",
                amount = 1,
                 label = "Combat PDW",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_minismg"] = {
            items = {
                { item = "bpminismg", amount = 1, remove = true },
                { item = "smg_receiver", amount = 1, remove = true },
                { item = "smg_bolt", amount = 1, remove = true },
                { item = "aluminum", amount = 25, remove = true },
                { item = "plastic", amount = 25, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_minismg",
                amount = 1,
                 label = "Mini SMG",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_pistol50"] = {
            items = {
                { item = "bppistol50", amount = 1, remove = true },
                { item = "silveringot", amount = 3, remove = true },
                { item = "metalscrap", amount = 15, remove = true },
                { item = "pistol_slide", amount = 1, remove = true },
                { item = "pistol_body", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_pistol50",
                amount = 1,
                 label = "Pistol 50",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_suppressor_heavy"] = {
            items = {
                { item = "bpsuppressor_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
            },
            result = {
                item = "at_suppressor_heavy",
                label = "Tactial Suppressor",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_clip_drum_rifle"] = {
            items = {
                { item = "bpdrum_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
            },
            result = {
                item = "at_clip_drum_rifle",
                label = "Rifle Drug Mag",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_grip"] = {
            items = {
                { item = "bpgrip_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
            },
            result = {
                item = "at_grip",
                label = "Grip",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
    },
    ["CMSW"] = { 
        ["parts_weapon"] = {
            items = {
                { item = "plastic", amount = 5, remove = true },
                { item = "metalscrap", amount = 5, remove = true },
                { item = "steel", amount = 5, remove = true },
            },
            result = {
                item = "parts_weapon",
                label = "Weapon Parts",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            label = "Weapon Parts",
            clip = 'base_female',
        },
        ["medarmour"] = {
            items = {
                { item = "steel", amount = 50, remove = true },
                { item = "plastic", amount = 50, remove = true },
                { item = "rubber", amount = 50, remove = true },
            },
            result = {
                item = "medarmour",
                amount = 1,
                 label = "medarmour",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
        },
        ["weapon_sawnoffshotgun"] = {
            items = {
                { item = "bpsawnoffshotgun", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
                { item = "shotgun_stock", amount = 1, remove = true },
                { item = "shotgun_firingpin", amount = 1, remove = true },
                { item = "iron", amount = 30, remove = true },
                { item = "steel", amount = 30, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
                        result = {
                item = "weapon_sawnoffshotgun",
                amount = 1,
                 label = "Sawnoff Shotgun",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_machinepistol"] = {
            items = {
                { item = "bpmachinepistol", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
                { item = "pistol_body", amount = 1, remove = true },
                { item = "smg_bolt", amount = 1, remove = true },
                { item = "aluminum", amount = 25, remove = true },
                { item = "plastic", amount = 25, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_machinepistol",
                amount = 1,
                 label = "Tech-9",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_heavypistol"] = {
            items = {
                { item = "bpheavypistol", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
                { item = "pistol_slide", amount = 1, remove = true },
                { item = "pistol_body", amount = 1, remove = true },
                { item = "metalscrap", amount = 15, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_heavypistol",
                amount = 1,
                 label = "Heavy Pistol",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_clip_extended_smg"] = {
            items = {
                { item = "bpclip_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 7, remove = true },
            },
            result = {
                item = "at_clip_extended_smg",
                label = "SMG Extended clip",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_suppressor_heavy"] = {
            items = {
                { item = "bpsuppressor_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
            },
            result = {
                item = "at_suppressor_heavy",
                label = "Tactial Suppressor",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_scope_small"] = {
            items = {
                { item = "bpsmallscope_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 3, remove = true },
            },
            result = {
                item = "at_scope_small",
                label = "Small Scope",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_ak47", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_skunk", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_amnesia", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_gelato", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_og-kush", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_purple-haze", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_white-widow", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_zkittlez", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
    },
    ["ALTA"] = { 
        ["meth_brick"] = {
            items = {
                { item = "meth", amount = 24, remove = true },
            },
            result = {
                item = "meth_brick",
                label = "Meth Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["medarmour"] = {
            items = {
                { item = "steel", amount = 50, remove = true },
                { item = "plastic", amount = 50, remove = true },
                { item = "rubber", amount = 50, remove = true },
            },
            result = {
                item = "medarmour",
                amount = 1,
                 label = "medarmour",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
        },
        ["parts_weapon"] = {
            items = {
                { item = "plastic", amount = 5, remove = true },
                { item = "metalscrap", amount = 5, remove = true },
                { item = "steel", amount = 5, remove = true },
            },
            result = {
                item = "parts_weapon",
                label = "Weapon Parts",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            label = "Weapon Parts",
            clip = 'base_female',
        },
        ["weapon_assaultrifle"] = {
            items = {
                { item = "bpassaultrifle", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
                { item = "rifle_receiver", amount = 1, remove = true },
                { item = "rifle_bolt", amount = 1, remove = true },
                { item = "iron", amount = 30, remove = true },
                { item = "steel", amount = 30, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_assaultrifle",
                amount = 1,
                 label = "Assault Rifle",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_minismg"] = {
            items = {
                { item = "bpminismg", amount = 1, remove = true },
                { item = "smg_receiver", amount = 1, remove = true },
                { item = "smg_bolt", amount = 1, remove = true },
                { item = "aluminum", amount = 25, remove = true },
                { item = "plastic", amount = 25, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_minismg",
                amount = 1,
                 label = "Mini SMG",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_vintagepistol"] = {
            items = {
                { item = "bpvintagepistol", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
                { item = "pistol_slide", amount = 1, remove = true },
                { item = "pistol_body", amount = 1, remove = true },
                { item = "metalscrap", amount = 15, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_vintagepistol",
                amount = 1,
                 label = "Vintage Pistol",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_clip_extended_pistol"] = {
            items = {
                { item = "bpclip_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
            },
            result = {
                item = "at_clip_extended_pistol",
                label = "Pistol Extended Clip",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_suppressor_light"] = {
            items = {
                { item = "bpsuppressor_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
            },
            result = {
                item = "at_suppressor_light",
                label = "Suppressor",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_scope_macro"] = {
            items = {
                { item = "bpsmallscope_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 3, remove = true },
            },
            result = {
                item = "at_scope_macro",
                label = "Macro Scope",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
    },
    ["EBURO"] = { 
        ["coke_brick"] = {
            items = {
                { item = "cokebaggy", amount = 24, remove = true },
            },
            result = {
                item = "coke_brick",
                label = "Cocaine Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["medarmour"] = {
            items = {
                { item = "steel", amount = 50, remove = true },
                { item = "plastic", amount = 50, remove = true },
                { item = "rubber", amount = 50, remove = true },
            },
            result = {
                item = "medarmour",
                amount = 1,
                 label = "medarmour",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
        },
        ["parts_weapon"] = {
            items = {
                { item = "plastic", amount = 5, remove = true },
                { item = "metalscrap", amount = 5, remove = true },
                { item = "steel", amount = 5, remove = true },
            },
            result = {
                item = "parts_weapon",
                label = "Weapon Parts",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            label = "Weapon Parts",
            clip = 'base_female',
        },
        ["weapon_assaultpdw"] = {
            items = {
                { item = "bpassaultpdw", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
                { item = "rifle_receiver", amount = 1, remove = true },
                { item = "smg_bolt", amount = 1, remove = true },
                { item = "iron", amount = 30, remove = true },
                { item = "steel", amount = 30, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_assaultpdw",
                amount = 1,
                 label = "Assault PDW",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_microsmg"] = {
            items = {
                { item = "bpmicrosmg", amount = 1, remove = true },
                { item = "smg_receiver", amount = 1, remove = true },
                { item = "smg_bolt", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
                { item = "aluminum", amount = 25, remove = true },
                { item = "plastic", amount = 25, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_microsmg",
                amount = 1,
                 label = "Micro SMG",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_vintagepistol"] = {
            items = {
                { item = "bpvintagepistol", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
                { item = "pistol_slide", amount = 1, remove = true },
                { item = "pistol_body", amount = 1, remove = true },
                { item = "metalscrap", amount = 15, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_vintagepistol",
                amount = 1,
                 label = "Vintage Pistol",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_clip_extended_smg"] = {
            items = {
                { item = "bpclip_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 7, remove = true },
            },
            result = {
                item = "at_clip_extended_smg",
                label = "SMG Extended clip",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_flashlight"] = {
            items = {
                { item = "bpflashlight_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 3, remove = true },
            },
            result = {
                item = "at_flashlight",
                label = "Tac Flashlight",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_scope_large"] = {
            items = {
                { item = "bpsmallscope_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 3, remove = true },
            },
            result = {
                item = "at_scope_large",
                label = "Large Scope",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        }, 
    },
    ["CYPRE"] = { 
        ["meth_brick"] = {
            items = {
                { item = "meth", amount = 24, remove = true },
            },
            result = {
                item = "meth_brick",
                label = "Meth Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["medarmour"] = {
            items = {
                { item = "steel", amount = 50, remove = true },
                { item = "plastic", amount = 50, remove = true },
                { item = "rubber", amount = 50, remove = true },
            },
            result = {
                item = "medarmour",
                amount = 1,
                 label = "medarmour",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
        },
        ["parts_weapon"] = {
            items = {
                { item = "plastic", amount = 5, remove = true },
                { item = "metalscrap", amount = 5, remove = true },
                { item = "steel", amount = 5, remove = true },
            },
            result = {
                item = "parts_weapon",
                label = "Weapon Parts",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            label = "Weapon Parts",
            clip = 'base_female',
        },
        ["weapon_comblocpdw"] = {
            items = {
                { item = "bpcomblocpdw", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
                { item = "rifle_receiver", amount = 1, remove = true },
                { item = "smg_bolt", amount = 1, remove = true },
                { item = "iron", amount = 30, remove = true },
                { item = "steel", amount = 30, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_comblocpdw",
                amount = 1,
                 label = "Combloc PDW",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_appistol"] = {
            items = {
                { item = "bpappistol", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
                { item = "pistol_slide", amount = 1, remove = true },
                { item = "pistol_body", amount = 1, remove = true },
                { item = "metalscrap", amount = 15, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_appistol",
                amount = 1,
                 label = "AP Pistol",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_pistol_mk2"] = {
            items = {
                { item = "bpsolverpistol", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
                { item = "pistol_slide", amount = 1, remove = true },
                { item = "pistol_body", amount = 1, remove = true },
                { item = "metalscrap", amount = 15, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_pistol_mk2",
                amount = 1,
                 label = "Solver Pistol",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_clip_extended_smg"] = {
            items = {
                { item = "bpclip_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 7, remove = true },
            },
            result = {
                item = "at_clip_extended_smg",
                label = "SMG Extended clip",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_flashlight"] = {
            items = {
                { item = "bpflashlight_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 3, remove = true },
            },
            result = {
                item = "at_flashlight",
                label = "Tac Flashlight",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_scope_small"] = {
            items = {
                { item = "bpsmallscope_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 3, remove = true },
            },
            result = {
                item = "at_scope_small",
                label = "Small Scope",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
    },
    ["BHAMCA"] = { 
        ["parts_weapon"] = {
            items = {
                { item = "plastic", amount = 5, remove = true },
                { item = "metalscrap", amount = 5, remove = true },
                { item = "steel", amount = 5, remove = true },
            },
            result = {
                item = "parts_weapon",
                label = "Weapon Parts",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            label = "Weapon Parts",
            clip = 'base_female',
        },
        ["medarmour"] = {
            items = {
                { item = "steel", amount = 50, remove = true },
                { item = "plastic", amount = 50, remove = true },
                { item = "rubber", amount = 50, remove = true },
            },
            result = {
                item = "medarmour",
                amount = 1,
                 label = "medarmour",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
        },
        ["weapon_combatpdw"] = {
            items = {
                { item = "bpcombatpdw", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
                { item = "smg_receiver", amount = 1, remove = true },
                { item = "smg_bolt", amount = 1, remove = true },
                { item = "iron", amount = 30, remove = true },
                { item = "steel", amount = 30, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_combatpdw",
                amount = 1,
                 label = "Combat PDW",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_microsmg"] = {
            items = {
                { item = "bpmicrosmg", amount = 1, remove = true },
                { item = "smg_receiver", amount = 1, remove = true },
                { item = "smg_bolt", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
                { item = "aluminum", amount = 25, remove = true },
                { item = "plastic", amount = 25, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_microsmg",
                amount = 1,
                 label = "Micro SMG",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_pistol50"] = {
            items = {
                { item = "bppistol50", amount = 1, remove = true },
                { item = "silveringot", amount = 3, remove = true },
                { item = "metalscrap", amount = 15, remove = true },
                { item = "pistol_slide", amount = 1, remove = true },
                { item = "pistol_body", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_pistol50",
                amount = 1,
                 label = "Pistol 50",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_clip_extended_rifle"] = {
            items = {
                { item = "bpclip_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
            },
            result = {
                item = "at_clip_extended_rifle",
                label = "Rifle Extended clip",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_grip"] = {
            items = {
                { item = "bpgrip_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
            },
            result = {
                item = "at_grip",
                label = "Grip",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_scope_medium"] = {
            items = {
                { item = "bpsmallscope_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 3, remove = true },
            },
            result = {
                item = "at_scope_medium",
                label = "Medium Scope",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_ak47", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_skunk", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_amnesia", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_gelato", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_og-kush", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_purple-haze", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_white-widow", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_zkittlez", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
    },
    ["RICHM"] = { 
        ["parts_weapon"] = {
            items = {
                { item = "plastic", amount = 5, remove = true },
                { item = "metalscrap", amount = 5, remove = true },
                { item = "steel", amount = 5, remove = true },
            },
            result = {
                item = "parts_weapon",
                label = "Weapon Parts",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            label = "Weapon Parts",
            clip = 'base_female',
        },
        ["medarmour"] = {
            items = {
                { item = "steel", amount = 50, remove = true },
                { item = "plastic", amount = 50, remove = true },
                { item = "rubber", amount = 50, remove = true },
            },
            result = {
                item = "medarmour",
                amount = 1,
                 label = "medarmour",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
        },
        ["weapon_sawnoffshotgun"] = {
            items = {
                { item = "bpsawnoffshotgun", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
                { item = "shotgun_stock", amount = 1, remove = true },
                { item = "shotgun_firingpin", amount = 1, remove = true },
                { item = "iron", amount = 30, remove = true },
                { item = "steel", amount = 30, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
                        result = {
                item = "weapon_sawnoffshotgun",
                amount = 1,
                 label = "Sawnoff Shotgun",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_assaultpdw"] = {
            items = {
                { item = "bpassaultpdw", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
                { item = "rifle_receiver", amount = 1, remove = true },
                { item = "smg_bolt", amount = 1, remove = true },
                { item = "iron", amount = 30, remove = true },
                { item = "steel", amount = 30, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_assaultpdw",
                amount = 1,
                 label = "Assault PDW",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_machinepistol"] = {
            items = {
                { item = "bpmachinepistol", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
                { item = "pistol_body", amount = 1, remove = true },
                { item = "smg_bolt", amount = 1, remove = true },
                { item = "aluminum", amount = 25, remove = true },
                { item = "plastic", amount = 25, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_machinepistol",
                amount = 1,
                 label = "Tech-9",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_assaultrifle"] = {
            items = {
                { item = "bpassaultrifle", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
                { item = "rifle_receiver", amount = 1, remove = true },
                { item = "rifle_bolt", amount = 1, remove = true },
                { item = "iron", amount = 30, remove = true },
                { item = "steel", amount = 30, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_assaultrifle",
                amount = 1,
                 label = "Assault Rifle",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_microsmg"] = {
            items = {
                { item = "bpmicrosmg", amount = 1, remove = true },
                { item = "smg_receiver", amount = 1, remove = true },
                { item = "smg_bolt", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
                { item = "aluminum", amount = 25, remove = true },
                { item = "plastic", amount = 25, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_microsmg",
                amount = 1,
                 label = "Micro SMG",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_combatpdw"] = {
            items = {
                { item = "bpcombatpdw", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
                { item = "smg_receiver", amount = 1, remove = true },
                { item = "smg_bolt", amount = 1, remove = true },
                { item = "iron", amount = 30, remove = true },
                { item = "steel", amount = 30, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_combatpdw",
                amount = 1,
                 label = "Combat PDW",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_comblocpdw"] = {
            items = {
                { item = "bpcomblocpdw", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
                { item = "rifle_receiver", amount = 1, remove = true },
                { item = "smg_bolt", amount = 1, remove = true },
                { item = "iron", amount = 30, remove = true },
                { item = "steel", amount = 30, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_comblocpdw",
                amount = 1,
                 label = "Combloc PDW",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_appistol"] = {
            items = {
                { item = "bpappistol", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
                { item = "pistol_slide", amount = 1, remove = true },
                { item = "pistol_body", amount = 1, remove = true },
                { item = "metalscrap", amount = 15, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_appistol",
                amount = 1,
                 label = "AP Pistol",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_pistol_mk2"] = {
            items = {
                { item = "bpsolverpistol", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
                { item = "pistol_slide", amount = 1, remove = true },
                { item = "pistol_body", amount = 1, remove = true },
                { item = "metalscrap", amount = 15, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_pistol_mk2",
                amount = 1,
                 label = "Solver Pistol",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_pistol50"] = {
            items = {
                { item = "bppistol50", amount = 1, remove = true },
                { item = "silveringot", amount = 3, remove = true },
                { item = "metalscrap", amount = 15, remove = true },
                { item = "pistol_slide", amount = 1, remove = true },
                { item = "pistol_body", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_pistol50",
                amount = 1,
                 label = "Pistol 50",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_minismg"] = {
            items = {
                { item = "bpminismg", amount = 1, remove = true },
                { item = "smg_receiver", amount = 1, remove = true },
                { item = "smg_bolt", amount = 1, remove = true },
                { item = "aluminum", amount = 25, remove = true },
                { item = "plastic", amount = 25, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_minismg",
                amount = 1,
                 label = "Mini SMG",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weapon_heavypistol"] = {
            items = {
                { item = "bpheavypistol", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
                { item = "pistol_slide", amount = 1, remove = true },
                { item = "pistol_body", amount = 1, remove = true },
                { item = "metalscrap", amount = 15, remove = true },
                { item = "ducttape", amount = 1, remove = true },
            },
            result = {
                item = "weapon_heavypistol",
                amount = 1,
                 label = "Heavy Pistol",
               },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_suppressor_light"] = {
            items = {
                { item = "bpsuppressor_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
            },
            result = {
                item = "at_suppressor_light",
                label = "Suppressor",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_clip_drum_smg"] = {
            items = {
                { item = "bpdrum_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 8, remove = true },
            },
            result = {
                item = "at_clip_drum_smg",
                label = "SMG Drug Mag",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_clip_drum_rifle"] = {
            items = {
                { item = "bpdrum_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
            },
            result = {
                item = "at_clip_drum_rifle",
                label = "Rifle Drug Mag",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_clip_extended_pistol"] = {
            items = {
                { item = "bpclip_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
            },
            result = {
                item = "at_clip_extended_pistol",
                label = "Pistol Extended Clip",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_suppressor_heavy"] = {
            items = {
                { item = "bpsuppressor_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
            },
            result = {
                item = "at_suppressor_heavy",
                label = "Tactial Suppressor",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_clip_extended_smg"] = {
            items = {
                { item = "bpclip_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 7, remove = true },
            },
            result = {
                item = "at_clip_extended_smg",
                label = "SMG Extended clip",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_flashlight"] = {
            items = {
                { item = "bpflashlight_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 3, remove = true },
            },
            result = {
                item = "at_flashlight",
                label = "Tac Flashlight",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["at_grip"] = {
            items = {
                { item = "bpgrip_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 6, remove = true },
            },
            result = {
                item = "at_grip",
                label = "Grip",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female',
            maxCraft = 10,
            requiredLevel = 1,
            earnedXP = 25,
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_ak47", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_skunk", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_amnesia", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_gelato", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_og-kush", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_purple-haze", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_white-widow", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_zkittlez", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
    },








    --[[["Cocaine"] = { -- THIS NEEDS TO MATCH THE "type" VARIABLE IN config_hideouts.lua FOR ONE OF YOUR HIDEOUTS
        ["coke_brick"] = {
            items = {
                { item = "cokebaggy", amount = 24, remove = true },
            },
            result = {
                item = "coke_brick",
                label = "Cocaine Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["parts_weapon"] = {
            items = {
                { item = "plastic", amount = 5, remove = true },
                { item = "metalscrap", amount = 5, remove = true },
                { item = "steel", amount = 5, remove = true },
            },
            result = {
                item = "parts_weapon",
                label = "Weapon Parts",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            label = "Weapon Parts",
            clip = 'base_female',
        },
    },
    ["Heroin"] = { -- THIS NEEDS TO MATCH THE "type" VARIABLE IN config_hideouts.lua FOR ONE OF YOUR HIDEOUTS
        ["heroin_brick"] = {
            items = {
                { item = "heroin_1oz", amount = 16, remove = true },
            },
            result = {
                item = "heroin_brick",
                label = "Heroin Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["parts_weapon"] = {
            items = {
                { item = "plastic", amount = 5, remove = true },
                { item = "metalscrap", amount = 5, remove = true },
                { item = "steel", amount = 5, remove = true },
            },
            result = {
                item = "parts_weapon",
                label = "Weapon Parts",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            label = "Weapon Parts",
            clip = 'base_female',
        },
    },
    ["Meth"] = { -- THIS NEEDS TO MATCH THE "type" VARIABLE IN config_hideouts.lua FOR ONE OF YOUR HIDEOUTS
        ["meth_brick"] = {
            items = {
                { item = "meth", amount = 24, remove = true },
            },
            result = {
                item = "meth_brick",
                label = "Meth Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["parts_weapon"] = {
            items = {
                { item = "plastic", amount = 5, remove = true },
                { item = "metalscrap", amount = 5, remove = true },
                { item = "steel", amount = 5, remove = true },
            },
            result = {
                item = "parts_weapon",
                label = "Weapon Parts",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            label = "Weapon Parts",
            clip = 'base_female',
        },
    },
    ["Attachments"] = { -- THIS NEEDS TO MATCH THE "type" VARIABLE IN config_hideouts.lua FOR ONE OF YOUR HIDEOUTS
        ["parts_weapon"] = {
            items = {
                { item = "plastic", amount = 5, remove = true },
                { item = "metalscrap", amount = 5, remove = true },
                { item = "steel", amount = 5, remove = true },
            },
            result = {
                item = "parts_weapon",
                label = "Weapon Parts",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            label = "Weapon Parts",
            clip = 'base_female',
        },    
        ["pistol_extendedclip"] = {
            items = {
                { item = "bpclip_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 5, remove = true },
            },
            result = {
                item = "pistol_extendedclip",
                label = "Pistol Extended Clip",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["pistol_flashlight"] = {
            items = {
                { item = "bpflashlight_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 3, remove = true },
            },
            result = {
                item = "pistol_flashlight",
                label = "Pistol Flashlight",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["pistol_suppressor"] = {
            items = {
                { item = "bpsuppressor_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 15, remove = true },
            },
            result = {
                item = "pistol_suppressor",
                label = "Pistol Suppressor",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["combatpistol_extendedclip"] = {
            items = {
                { item = "bpclip_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 5, remove = true },
            },
            result = {
                item = "combatpistol_extendedclip",
                label = "Combat Pistol Extended Clip",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["pistol50_extendedclip"] = {
            items = {
                { item = "bpclip_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 5, remove = true },
            },
            result = {
                item = "pistol50_extendedclip",
                label = "Pistol .50 Extended Clip",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["snspistol_grip"] = {
            items = {
                { item = "bpgrip_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 3, remove = true },
            },
            result = {
                item = "snspistol_grip",
                label = "SNS Grip",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["microsmg_extendedclip"] = {
            items = {
                { item = "bpclip_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 5, remove = true },
            },
            result = {
                item = "microsmg_extendedclip",
                label = "Micro SMG Extended Clip",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["microsmg_scope"] = {
            items = {
                { item = "bpsmallscope_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 3, remove = true },
            },
            result = {
                item = "microsmg_scope",
                label = "Micro SMG Scope",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["smg_suppressor"] = {
            items = {
                { item = "bpsuppressor_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 20, remove = true },
            },
            result = {
                item = "smg_suppressor",
                label = "SMG Suppressor",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["minismg_extendedclip"] = {
            items = {
                { item = "bpclip_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 5, remove = true },
            },
            result = {
                item = "minismg_extendedclip",
                label = "Mini SMG Extended Clip",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["machinepistol_extendedclip"] = {
            items = {
                { item = "bpclip_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 5, remove = true },
            },
            result = {
                item = "machinepistol_extendedclip",
                label = "Machine Pistol Extended Clip",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["machinepistol_drum"] = {
            items = {
                { item = "bpdrum_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
            },
            result = {
                item = "machinepistol_drum",
                label = "Machine Pistol Drum",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["combatpdw_extendedclip"] = {
            items = {
                { item = "bpclip_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 5, remove = true },
            },
            result = {
                item = "combatpdw_extendedclip",
                label = "Combat PDW Extended Clip",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["combatpdw_drum"] = {
            items = {
                { item = "bpdrum_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 10, remove = true },
            },
            result = {
                item = "combatpdw_drum",
                label = "Combat PDW Drum",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["rifle_flashlight"] = {
            items = {
                { item = "bpflashlight_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 3, remove = true },
            },
            result = {
                item = "rifle_flashlight",
                label = "Rifle Flashlight",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["combatpdw_grip"] = {
            items = {
                { item = "bpgrip_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 3, remove = true },
            },
            result = {
                item = "combatpdw_grip",
                label = "Combat PDW Grip",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["combatpdw_scope"] = {
            items = {
                { item = "bpsmallscope_attachment", amount = 1, remove = true },
                { item = "parts_weapon", amount = 3, remove = true },
            },
            result = {
                item = "combatpdw_scope",
                label = "Combat PDW Scope",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
    },
    ["Weed"] = { -- THIS NEEDS TO MATCH THE "type" VARIABLE IN config_hideouts.lua FOR ONE OF YOUR HIDEOUTS
        ["parts_weapon"] = {
            items = {
                { item = "plastic", amount = 5, remove = true },
                { item = "metalscrap", amount = 5, remove = true },
                { item = "steel", amount = 5, remove = true },
            },
            result = {
                item = "parts_weapon",
                label = "Weapon Parts",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            label = "Weapon Parts",
            clip = 'base_female',
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_ak47", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_skunk", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_amnesia", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_gelato", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_og-kush", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_purple-haze", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_white-widow", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
        ["weed_brick"] = {
            items = {
                { item = "weed_zkittlez", amount = 24, remove = true },
            },
            result = {
                item = "weed_brick",
                label = "Weed Brick",
                amount = 1,
            },
            duration = 5000,
            dict = 'amb@prop_human_parking_meter@female@base',
            clip = 'base_female'
        },
    },]]--
}