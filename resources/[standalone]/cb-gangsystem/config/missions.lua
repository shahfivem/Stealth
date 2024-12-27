--███╗   ███╗██╗███████╗███████╗██╗ ██████╗ ███╗   ██╗███████╗
--████╗ ████║██║██╔════╝██╔════╝██║██╔═══██╗████╗  ██║██╔════╝
--██╔████╔██║██║███████╗███████╗██║██║   ██║██╔██╗ ██║███████╗
--██║╚██╔╝██║██║╚════██║╚════██║██║██║   ██║██║╚██╗██║╚════██║
--██║ ╚═╝ ██║██║███████║███████║██║╚██████╔╝██║ ╚████║███████║
--╚═╝     ╚═╝╚═╝╚══════╝╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
Config.EnableMissions = true -- Do you want to enable the cb-gangsystem Missions feature?
Config.MaxMissions = 1       -- The maximum number of missions that can be completed per restart
Config.UpdateLoyalty = "choose"                     -- Supports: "choose" / "top3" / "none" When players complete a mission, how do you want to reward them with loyalty. (choice = Player chooses what turf to increase loyalty in.)
Config.Missions = {
    ['Zoey'] = {
        ['prevalenceLevel'] = 1,
        ['ped'] = {
            model = `a_f_y_hippie_01`,
            coords = vector4(-35.75, -2688.96, 5.0, 91.41), -- Docks
            scenario = 'WORLD_HUMAN_HANG_OUT_STREET',
            onstart = true,                                 -- Do you want the PED to be loaded when the script starts or when the player gets the mission.
        },
        ['target'] = {
            icon = 'fa-brands fa-angellist',
            label = 'Talk to Zoey',
        },
        ['messages'] = {
            start = {
                subject = 'Help Zoey',
                message = 'Zoey runs a "shipping" business down at the docks. Bring her a brick of Heroin',
            },
            finish = {
                subject = 'Zoey',
                message = 'Thanks for helping me with this. Call me later!'
            },
        },
        ['requirement'] = {
            [1] = {
                item = "heroin_brick",
                amount = 1,
            }
        },
        ['reward_type'] = {
            type = 'random',      -- random / tier
            single = true,        -- (true) single item or (false) mutiple by chance
            acceptAnyItem = false -- Set this to TRUE if you want to allow completion if the player has any ONE item in the requirements list
        },
        ['reward'] = {
            { type = 'cash', name = 'cash', amount = 4700, chance = 100 },
            --{ type = 'item', name = 'diamond', amount = 25, chance = 100 },
            --{ type = 'bank', name = 'bank', amount = 35000, chance = 100 },
        }
    },
    ['Gary'] = {
        ['prevalenceLevel'] = 1,
        ['ped'] = {
            model = `g_m_y_lost_02`,
            coords = vector4(501.87350463867, 5605.1923828125, 796.90911865234, 175.19581604004),
            scenario = 'WORLD_HUMAN_HANG_OUT_STREET',
            onstart = true,
        },
        ['target'] = {
            icon = 'fa-brands fa-angellist',
            label = 'Talk to Gary',
        },
        ['messages'] = {
            start = {
                subject = 'Help Gary',
                message = 'Nobody can get higher than Gary! He needs a pound of weed. Keep the waves going.',
            },
            finish = {
                subject = 'Gary',
                message = 'You came in clutch! Here, take this!'
            },
        },
        ['requirement'] = {
            [1] = {
                item = "weed_brick",
                amount = 1,
            },
        },
        ['reward_type'] = {
            type = 'random', -- random / tier
            single = true,   -- (true) single item or (false) mutiple by chance
            acceptAnyItem = true -- Set this to TRUE if you want to allow completion if the player has any ONE item in the requirements list
        },
        ['reward'] = {
            { type = 'cash', name = 'cash', amount = 3700, chance = 100 },
        }
    },
    ['Billy'] = {
        ['prevalenceLevel'] = 1,
        ['ped'] = {
            model = `a_m_m_hillbilly_02`,
            coords = vector4(-1741.3682861328, 237.26924133301, 63.448745727539, 314.46563720703), -- Richman High School
            scenario = 'WORLD_HUMAN_HANG_OUT_STREET',
            onstart = true,
        },
        ['target'] = {
            icon = 'fa-brands fa-angellist',
            label = 'Talk to Billy',
        },
        ['messages'] = {
            start = {
                subject = 'Help Billy',
                message =
                'Billy thinks he\'s snorting energy powder, but it\'s really cocaine. Bring him another brick of the best cut you can find. He\'s in Richman.',
            },
            finish = {
                subject = 'Billy',
                message = 'The side effects of this stuff are crazy! This is payment for your troubles.'
            },
        },
        ['requirement'] = {
            [1] = {
                item = "coke_brick",
                amount = 1,
            }
        },
        ['reward_type'] = {
            type = 'random', -- random / tier
            single = false,  -- (true) single item or (false) mutiple by chance
            acceptAnyItem = false -- Set this to TRUE if you want to allow completion if the player has any ONE item in the requirements list
        },
        ['reward'] = {
            { type = 'cash', name = 'cash', amount = 5500, chance = 100 },
        }
    },
    ['Ortega'] = {
        ['prevalenceLevel'] = 1,
        ['ped'] = {
            model = `ig_ortega`,
            coords = vector4(-1132.061, -3.309, 47.982, 82.162),
            scenario = 'WORLD_HUMAN_HANG_OUT_STREET',
            onstart = true,
        },
        ['target'] = {
            icon = 'fa-brands fa-angellist',
            label = 'Talk to Ortega',
        },
        ['messages'] = {
            start = {
                subject = 'Help Ortega',
                message =
                'Ortega’s got business to handle, and he needs his supply now. Head to the green and deliver a Brick of Meth. Keep it clean, and don’t mess this up—he’s counting on you.',
            },
            finish = {
                subject = 'Ortega',
                message = 'This will definitely get the job done. Thank you for this. Here you go.'
            },
        },
        ['requirement'] = {
            [1] = {
                item = "meth_brick",
                amount = 1,
            }
        },
        ['reward_type'] = {
            type = 'random', -- random / tier
            single = false,  -- (true) single item or (false) mutiple by chance
            acceptAnyItem = false -- Set this to TRUE if you want to allow completion if the player has any ONE item in the requirements list
        },
        ['reward'] = {
            { type = 'cash', name = 'cash', amount = 4500, chance = 100 },
        }
    },
    ['Johnny'] = {
        ['prevalenceLevel'] = 1,
        ['ped'] = {
            model = `ig_tomcasino`,
            coords = vector4(-142.02326965332, -950.79711914063, 268.13494873047, 89.576126098633),
            scenario = 'WORLD_HUMAN_HANG_OUT_STREET',
            onstart = true,
        },
        ['target'] = {
            icon = 'fa-brands fa-angellist',
            label = 'Talk to Johnny',
        },
        ['messages'] = {
            start = {
                subject = 'Help Johnny',
                message =
                'Johnny is in charge of repairs atop the Mile High Building. Bring him 80 Steel so he can get the job done. Climb the crane, deliver the goods, and don\'t forget a parachute.',
            },
            finish = {
                subject = 'Johnny',
                message = 'I knew I could count on you!'
            },
        },
        ['requirement'] = {
            [1] = {
                item = "steel",
                amount = 80,
            }
        },
        ['reward_type'] = {
            type = 'random', -- random / tier
            single = false,  -- (true) single item or (false) mutiple by chance
            acceptAnyItem = false -- Set this to TRUE if you want to allow completion if the player has any ONE item in the requirements list
        },
        ['reward'] = {
            { type = 'cash', name = 'cash', amount = 10000, chance = 100 },
        }
    },
    ['Amanada'] = {
        ['prevalenceLevel'] = 1,
        ['ped'] = {
            model = `cs_amandatownley`,
            coords = vec4(-1230.9, 349.04, 78.99, 205.53),
            scenario = 'WORLD_HUMAN_TENNIS_PLAYER',
            onstart = true,
        },
        ['target'] = {
            icon = 'fa-brands fa-angellist',
            label = 'Talk to Amanada',
        },
        ['messages'] = {
            start = {
                subject = 'Help Amanada',
                message = 'Amanada, Michael\'s wife, lost her wedding ring. Bring her a new one and quick, before the whole world comes to an end.',
            },
            finish = {
                subject = 'Amanda',
                message = 'I knew I could count on you! Here! I found this laying around the bedroom and I\'m tired of looking at it. Take it!'
            },
        },
        ['requirement'] = {
            [1] = {
                item = "diamond_ring",
                amount = 1,
            }
        },
        ['reward_type'] = {
            type = 'random', -- random / tier
            single = true,  -- (true) single item or (false) mutiple by chance
            acceptAnyItem = false -- Set this to TRUE if you want to allow completion if the player has any ONE item in the requirements list
        },
        ['reward'] = {
            { type = 'item', name = 'loosenotes', amount = 5, chance = 100 },
        }
    },
    ['Marcus'] = {
        ['prevalenceLevel'] = 5,
        ['ped'] = {
            model = `g_m_y_mexgoon_03`,
            coords = vector4(748.72, -529.05, 26.78, 69.65),
            scenario = 'WORLD_HUMAN_DRUG_DEALER_HARD',
            onstart = true,
        },
        ['target'] = {
            icon = 'fa-brands fa-angellist',
            label = 'Talk to Marcus',
        },
        ['messages'] = {
            start = {
                subject = 'Mission',
                message = 'Marcus is a gun nut, he hangs out in the overpass in Mirror Park. Bring him 60K in Marked Bills and he might have something good for you.',
            },
            finish = {
                subject = 'Marcus',
                message = 'Thanks for proving your worth. I\'ve got an extra one of these in stock. Take it.'
            },
            exploit = {
                subject = 'Marcus',
                message = 'You tried to exploit me. Do it again and see what happens!'
            },
        },
        ['requirement'] = {
            [1] = {
                item = "cash",
                amount = 60000,
            }
        },
        ['reward_type'] = {
            type = 'tier', -- random / tier
            single = true, -- (true) single item or (false) mutiple by chance
            acceptAnyItem = false -- Set this to TRUE if you want to allow completion if the player has any ONE item in the requirements list
        },
        ['reward'] = {
            ['tier1'] = {
                chance = 20,
                items = {
                    { type = 'item', name = 'WEAPON_COMBATPISTOL', amount = 1, chance = 100 },
                }
            },
            ['tier2'] = {
                chance = 20,
                items = {
                    { type = 'item', name = 'WEAPON_VINTAGEPISTOL', amount = 1, chance = 100 },
                }
            },
            ['tier3'] = {
                chance = 10,
                items = {
                    { type = 'item', name = 'WEAPON_PISTOL50', amount = 1, chance = 100 },
                }
            },
            ['tier4'] = {
                chance = 15,
                items = {
                    { type = 'item', name = 'WEAPON_MACHINEPISTOL', amount = 1, chance = 100 },
                }
            },
            ['tier5'] = {
                chance = 25,
                items = {
                    { type = 'item', name = 'WEAPON_MICROSMG', amount = 1, chance = 100 },
                }
            },
        }
    },
    ['Spencer'] = {
        ['prevalenceLevel'] = 4,
        ['ped'] = {
            model = `a_m_y_business_01`,
            coords = vec4(-2025.9, -1043.89, 4.88, 258.95),
            scenario = 'WORLD_HUMAN_PARTYING',
            onstart = true,
        },
        ['target'] = {
            icon = 'fa-brands fa-angellist',
            label = 'Talk to Politician',
        },
        ['messages'] = {
            start = {
                subject = 'Help Spencer',
                message = 'A local politician needs some... persuasion. Bring him 10 Gold Ingots and he\'ll be sure to see things our way.',
            },
            finish = {
                subject = 'Spencer',
                message = 'Wow! This will make my job so much easier! Here, take this.'
            },
        },
        ['requirement'] = {
            [1] = {
                item = "goldingot",
                amount = 10,
            }
        },
        ['reward_type'] = {
            type = 'random', -- random / tier
            single = true,  -- (true) single item or (false) mutiple by chance
            acceptAnyItem = false -- Set this to TRUE if you want to allow completion if the player has any ONE item in the requirements list
        },
        ['reward'] = {
            { type = 'item', name = 'cash', amount = 75000, chance = 100 },
        }
    },
    -- You can add your own missions here
}
