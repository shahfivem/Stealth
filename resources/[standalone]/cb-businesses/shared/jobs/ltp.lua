Config.LTP = {
    job = "ltp",
    debug = false,
    blip = {
        name = "Yellow Jack",
        useBlip = false,
        coords = vec3(129.0, -1299.1, 29.24),
        sprite = 59,
        scale = 0.7,
        color = 48,
    },
    autoClock = {
        coords = vector3(1985.10, 3049.35, 47.29),
        radius = 20.0
    },
    duty = {
        {
            label = "Toggle Duty",
            icon = "fa-solid fa-toggle-on",
            coords = vector3(1985.10, 3049.35, 47.29),
            length = 0.5,
            width = 0.5,
            height = 0.4,
            heading = 95.783,
        }
    },
    counter = {
        {
            label = "Counter",
            name = "ltpcounter1",
            icon = "fa-solid fa-wine-bottle",
            coords = vector3(1984.18, 3050.85, 47.29),
            length = 1,
            width = 0.7,
            height = 0.5,
            heading = -122.217,
        }
    },
    payment = {
        {
            label = "Charge Customer",
            icon = "fa-solid fa-cash-register",
            coords = vector3(1985.10, 3049.35, 47.29),
            length = 0.5,
            width = 0.5,
            height = 0.4,
            heading = 95.783,
        }
    },
    storage = {
        {
            label = "Open Storage",
            icon = "fa-solid fa-boxes-stacked",
            coords = vector3(1984.79, 3048.47, 47.24),
            name = "ltpstorage1",
            length = 0.5,
            width = 0.8,
            height = 1,
            heading = -122.206,
        },
    },
    workbench = {
        {
            label = "Workbench",
            icon = "fa-solid fa-boxes-stacked",
            name = "Workbench",
            coords = vector3(1983.53, 3049.19, 46.84),
            length = 0.5,   
            width = 0.5,    
            height = 0.8,
            heading = -32.237,
        },
    },
    -- shop = {
    --     {
    --         label = "Open Shop",
    --         icon = "fa-solid fa-boxes-stacked",
    --         name = "ltpshop",
    --         coords = vector3(1983.53, 3049.19, 46.84),
    --         length = 0.5,
    --         width = 0.5,
    --         height = 0.8,
    --         heading = -32.237,
    --         inventory = {
    -- -- Regular Food and Drinks
    -- { name = 'teapot_cheesesteak', price = 0 },
    -- { name = 'teapot_maplewalnut', price = 0 },
    -- { name = 'teapot_dragon', price = 0 },
    -- { name = 'teapot_earlgrey', price = 0 },
    -- { name = 'teapot_saintcity', price = 0 },
    -- { name = 'teapot_dirt', price = 0 },
    -- { name = 'teapot_hearttoast', price = 0 },
    -- { name = 'teapot_sandos', price = 0 },
    -- { name = 'teapot_honeycomb', price = 0 },
    -- { name = 'teapot_swissroll', price = 0 },
    -- { name = 'teapot_poptart', price = 0 },
    -- { name = 'teapot_rainbow', price = 0 },
    -- { name = 'teapot_rasp', price = 0 },
    -- { name = 'teapot_cinna', price = 0 },
    -- { name = 'teapot_frappe', price = 0 },
    -- { name = 'teapot_pan_cookie', price = 0 },
    -- { name = 'teapot_bi_cookie', price = 0 },
    -- { name = 'teapot_lesbian_cookie', price = 0 },
    -- { name = 'teapot_trans_cookie', price = 0 },
    -- { name = 'teapot_enby_cookie', price = 0 },

    -- -- Infused Food and Drinks
    -- { name = 'teapot_cheesesteak_infused', price = 0 },
    -- { name = 'teapot_maplewalnut_infused', price = 0 },
    -- { name = 'teapot_dragon_infused', price = 0 },
    -- { name = 'teapot_earlgrey_infused', price = 0 },
    -- { name = 'teapot_saintcity_infused', price = 0 },
    -- { name = 'teapot_dirt_infused', price = 0 },
    -- { name = 'teapot_hearttoast_infused', price = 0 },
    -- { name = 'teapot_sandos_infused', price = 0 },
    -- { name = 'teapot_honeycomb_infused', price = 0 },
    -- { name = 'teapot_swissroll_infused', price = 0 },
    -- { name = 'teapot_poptart_infused', price = 0 },
    -- { name = 'teapot_rainbow_infused', price = 0 },
    -- { name = 'teapot_rasp_infused', price = 0 },
    -- { name = 'teapot_cinna_infused', price = 0 },
    -- { name = 'teapot_frappe_infused', price = 0 },
    -- { name = 'teapot_pan_cookie_infused', price = 0 },
    -- { name = 'teapot_bi_cookie_infused', price = 0 },
    -- { name = 'teapot_lesbian_cookie_infused', price = 0 },
    -- { name = 'teapot_trans_cookie_infused', price = 0 },
    -- { name = 'teapot_enby_cookie_infused', price = 0 },

    -- -- Cannabis-Related Items
    -- { name = 'teapot_bloom_seed', price = 0 },
    -- { name = 'teapot_serentiy_seed', price = 0 },
    -- { name = 'teapot_bloombud', price = 0 },
    -- { name = 'teapot_serentiybud', price = 0 },
    -- { name = 'teapot_bloompaper', price = 0 },
    -- { name = 'teapot_serentiypaper', price = 0 },
    -- { name = 'teapot_bloomjoint', price = 0 },
    -- { name = 'teapot_serentiyjoint', price = 0 },
    --         },
    --     },
    -- },
}
