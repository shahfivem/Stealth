GymBlips = {
    vector3(-1201.41, -1567.70, 4.61)
}

GymPoints = {
    CurlBar = {
        points = {
            vector3(-1198.36, -1573.27, 4.61),
            vector3(-1209.26, -1559.20, 4.61),
            vector3(1643.98, 2534.51, 45.56),
            vector3(1641.36, 2532.10, 45.56)
        },
        textPrompt = 'to lift a curl bar',
        animDict = 'amb@world_human_muscle_free_weights@male@barbell@base',
        animClip = 'base',
        zOffset = 1.0,
        usePlayerCoords = true,
        objects = {
            {
                model = 'prop_curl_bar_01',
                bone = 28422,
                coords = vector3(0.0, 0.0, 0.0),
                rotation = vector3(0.0, 0.0, 0.0),
            },
        },
        skills = {
            arms = 0.1
        }
    },
    ChinUps = {
        points = {
            vector4(-1200.07, -1571.12, 4.61, 215.44),
            vector4(-1204.70, -1564.34, 4.61, 36.21),
            vector4(1643.34, 2527.83, 45.56,49.27),
            vector4(1649.15, 2529.63, 45.56,55.38)
        },
        textPrompt = 'to do chin ups',
        animDict = 'amb@prop_human_muscle_chin_ups@male@base',
        animClip = 'base',
        enter = 'amb@prop_human_muscle_chin_ups@male@enter',
        exit = 'amb@prop_human_muscle_chin_ups@male@exit',
        zOffset = 0.06,
        usePlayerCoords = false,
        objects = {},
        skills = {
            back = 0.1,
            arms = 0.01
        }
    },
    PushUps = {
        points = {
            vector3(-1199.52, -1563.57, 4.62),
            vector3(-1201.89, -1567.14, 4.61),
            vector3(1648.79, 2534.80, 45.56),
            vector3(1652.59, 2531.52, 45.56)
        },
        textPrompt = 'to do push ups',
        animDict = 'amb@world_human_push_ups@male@base',
        animClip = 'base',
        zOffset = 0.0,
        usePlayerCoords = true,
        objects = {},
        skills = {
            chest = 0.1,
            arms = 0.01,
            back = 0.01
        }
    },
    SitUps = {
        points = {
            vector3(-1207.60, -1566.09, 4.61),
            vector3(-1204.15, -1557.77, 4.62),
            vector3(1636.91, 2522.65, 45.56),
            vector3(1638.59, 2521.07, 45.56)
        },
        textPrompt = 'to do sit ups',
        animDict = 'amb@world_human_sit_ups@male@base',
        enter = 'amb@world_human_sit_ups@male@enter',
        exit = 'amb@world_human_sit_ups@male@exit',
        animClip = 'base',
        zOffset = 0.0,
        usePlayerCoords = true,
        rotateHeading = true,
        objects = {},
        skills = {
            core = 0.1
        }
    },
    BenchPress = {
        points = {
            vector4(-1196.82, -1567.40, 4.6, 305),
            vector4(-1206.26, -1561.98, 4.6, 213),
            vector4(1636.80, 2526.00, 45.56, 231.54),
            vector4(1639.17, 2529.22, 45.56, 232.60)
        },
        textPrompt = 'to do bench press',
        animDict = 'amb@prop_human_seat_muscle_bench_press@idle_a',
        enter = 'amb@prop_human_seat_muscle_bench_press@enter',
        exit = 'amb@prop_human_seat_muscle_bench_press@exit',
        animClip = 'idle_a',
        zOffset = 0.0,
        usePlayerCoords = false,
        rotateHeading = true,
        objects = {
            {
                model = 'prop_barbell_02',
                bone = 28422,
                coords = vector3(0.0, 0.0, 0.0),
                rotation = vector3(0.0, 0.0, 0.0),
            },
        },
        skills = {
            chest = 0.1,
            arms = 0.01
        }
    },
    Jogging = {
        points = {
            vector3(-1194.76, -1570.71, 4.62),
            vector3(-1197.29, -1578.88, 4.61),
            vector3(1645.60, 2523.58, 45.56),
            vector3(1647.80, 2525.86, 45.56)
        },
        textPrompt = 'to do some jogging',
        animDict = 'amb@world_human_jog_standing@male@base',
        animClip = 'base',
        zOffset = 0.0,
        usePlayerCoords = true,
        rotateHeading = false,
        objects = {},
        skills = {
            legs = 0.1,
            core = 0.01
        }
    },
}
