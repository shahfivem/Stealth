Shared = {}

Shared.peds = false

Shared.UsableItems = {
    -- ['water'] = 5000,
    -- ['burger'] = 5000
}

Shared.Locations = {
    heating = {
        coords = vec3(1389.86, 3608.83, 38.94),
        size = 2.0,
        debug = false,
        requiredItems = {{"meth_glycol", 2}, {"meth_sodium", 2}},
        optionalItems = {{"battery", 2}},
        skillCheck = {
            difficulty = {'easy', 'medium'},
            directions = {'w', 'a', 's', 'd'}
        },
        waitingTime = math.random(15000, 30000),
        label = "Heating",
        oxTargetIcon = "fas fa-fire",
        oxTargetLabel = "Crush and Mix Ingredients",
        progressBarLabel = "Crushing and mixing...",
        pedModel = "a_m_m_skater_01",
        pedCoords = vec4(570.8886, 2796.8677, 41.0132, 271.7054),
        addItems = {{"unstablemeth", 5}, {"meth_toulene", 2}},
        optionalAddItems = {{"batteryacid", 2}, {"unstablemeth", 5}, {"meth_toulene", 2}},
        anim = {
    dict = "anim@amb@business@meth@meth_monitoring_no_work@",
    clip = "turnaround_intro_lazycook"
        },
        processEvent = 'process_heating_event'
    },
    mixing = {
        coords = vec3(1394.48, 3601.72, 38.94),
        size = 2.0,
        debug = false,
        requiredItems = {{"unstablemeth", 5}, {"meth_toulene", 2}},
        optionalItems = {{"unstablemeth", 5}, {"meth_toulene", 2}},
        skillCheck = {
            difficulty = {'medium', 'hard'},
            directions = {'w', 'a', 's', 'd'}
        },
        waitingTime = math.random(10000, 20000),
        label = "Mixing",
        oxTargetIcon = "fas fa-vial",
        oxTargetLabel = "Start Diluting and combining Process",
        progressBarLabel = "Combining in progress...",
        pedModel = "a_m_m_business_01",
        pedCoords = vec4(585.7142, 2783.5945, 42.4812, 3.9733),
        addItems = {{"shatteredmeth", 5}},
        optionalAddItems = {{"shatteredmeth", 5}},
        anim = {
            dict = "anim@scripted@player@freemode@ig3_lab@heeled@", -- A meth-smashing animation
            clip = "idle_03"
        },
        processEvent = 'process_mixing_event'
    },
    cooling = {
        coords = vec3(1391.55, 3606.63, 38.94),
        size = 2.0,
        debug = false,
        requiredItems = {{"shatteredmeth", 5}, {"empty_weed_bag", 5}},
        optionalItems = {{"shatteredmeth", 5}, {"empty_weed_bag", 5}},
        skillCheck = {
            difficulty = {'medium', 'easy'},
            directions = {'w', 'a', 's', 'd'}
        },
        waitingTime = math.random(20000, 30000),
        label = "Cooling",
        oxTargetIcon = "fas fa-snowflake",
        oxTargetLabel = "Start Crushing Process",
        progressBarLabel = "Crushing in progress...",
        pedModel = "a_m_y_genstreet_01",
        pedCoords = vec4(619.1066, 2800.2014, 40.9131, 92.1753),
        addItems = {{"crushedmeth", 5}},
        optionalAddItems = {{"crushedmeth", 5}},
        anim = {
            dict = "anim@amb@business@meth@meth_monitoring_no_work@",
            clip = "turnaround_intro_lazycook"
                },
        processEvent = 'process_cooling_event'
    },
    bagging = {
        coords = vec3(1389.79, 3603.53, 38.94),
        size = 2.0,
        debug = false,
        requiredItems = {{"crushedmeth", 5}, {"empty_weed_bag", 5}},
        optionalItems = {{"batteryacid", 5}},
        skillCheck = {
            difficulty = {'medium', 'easy'},
            directions = {'w', 'a', 's', 'd'}
        },
        waitingTime = math.random(20000, 30000),
        label = "Bagging",
        oxTargetIcon = "fas fa-snowflake",
        oxTargetLabel = "Start Bagging Process",
        progressBarLabel = "Bagging in progress...",
        pedModel = "a_m_y_genstreet_01",
        pedCoords = vec4(619.1066, 2800.2014, 40.9131, 92.1753),
        addItems = {{"bagofmeth", 5}},
        optionalAddItems = {{"refinedmeth", 5}},
        anim = {
            dict = "anim@amb@business@meth@meth_smash_weight_check@",
            clip = "break_weigh_char01"
                },
        processEvent = 'process_bagging_event'
    }
}