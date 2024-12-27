return {
    checkInCost = 400, -- Price for using the hospital check-in system
    minForCheckIn = 2, -- Minimum number of people with the ambulance job to prevent the check-in system from being used

    locations = { -- Various interaction points
        duty = {
            vec3(313.24, -586.5, 42.97),
            vec3(-254.88, 6324.5, 32.58),
        },
        vehicle = {
            -- vec4(294.578, -574.761, 43.179, 35.79),
            -- vec4(-234.28, 6329.16, 32.15, 222.5),
        },
        helicopter = {
            -- vec4(351.58, -587.45, 74.16, 160.5),
            -- vec4(-475.43, 5988.353, 31.716, 31.34),
        },
        armory = {
            -- {
            --     shopType = 'AmbulanceArmory',
            --     name = 'Armory',
            --     groups = { ambulance = 0 },
            --     inventory = {
            --         { name = 'radio', price = 0 },
            --         { name = 'bandage', price = 0 },
            --         { name = 'painkillers', price = 0 },
            --         { name = 'firstaid', price = 0 },
            --         { name = 'weapon_flashlight', price = 0 },
            --         { name = 'weapon_fireextinguisher', price = 0 },
            --     },
            --     locations = {
            --         vec3(309.93, -602.94, 43.29)
            --     }
            -- }
        },
        roof = {
            vec3(338.54, -583.88, 74.17),
        },
        main = {
            vec3(298.62, -599.66, 43.29),
        },
        stash = {
            -- {
            --     name = 'ambulanceStash',
            --     label = 'Personal stash',
            --     weight = 100000,
            --     slots = 30,
            --     groups = { ambulance = 0 },
            --     owner = true, -- Set to false for group stash
            --     location = vec3(309.78, -596.6, 43.29)
            -- }
        },

        ---@class Bed
        ---@field coords vector4
        ---@field model number

        ---@type table<string, {coords: vector3, checkIn?: vector3|vector3[], beds: Bed[]}>
        hospitals = {
            pillbox = {
                coords = vec3(350, -580, 43),
                checkIn = vec3(310.01, -585.39, 42.97),
                beds = {
                    {coords = vec4(321.25, -581.3, 43.27, 155.99), model = 1631638868},
                    {coords = vec4(318.31, -580.17, 43.27, 161.99), model = 1631638868},
                    {coords = vec4(316.87, -584.6, 43.27, 344.99), model = 2117668672},
                    {coords = vec4(325.61, -588.04, 43.27, 344.99), model = 2117668672},
                    {coords = vec4(328.32, -588.92, 43.27, 353.99), model = 2117668672},
                    {coords = vec4(330.72, -584.81, 43.27, 161.99), model = -1091386327},
                    {coords = vec4(327.64, -583.63, 43.27, 164.98), model = -1091386327},
                    {coords = vec4(322.6, -576.29, 43.24, 74.98), model = -1091386327},
                    {coords = vec4(305.7, -573.39, 43.24, 242.98), model = -1091386327},
                    
                },
            },
            paleto = {
                coords = vec3(-250, 6315, 32),
                checkIn = vec3(-254.54, 6331.78, 32.43),
                beds = {
                    {coords = vec4(-252.43, 6312.25, 32.34, 313.48), model = 2117668672},
                    {coords = vec4(-247.04, 6317.95, 32.34, 134.64), model = 2117668672},
                    {coords = vec4(-255.98, 6315.67, 32.34, 313.91), model = 2117668672},
                },
            },
            jail = {
                coords = vec3(1761, 2600, 46),
                beds = {
                    {coords = vec4(1761.96, 2597.74, 45.66, 270.14), model = 2117668672},
                    {coords = vec4(1761.96, 2591.51, 45.66, 269.8), model = 2117668672},
                    {coords = vec4(1771.8, 2598.02, 45.66, 89.05), model = 2117668672},
                    {coords = vec4(1771.85, 2591.85, 45.66, 91.51), model = 2117668672},
                },
            },
        },

        stations = {
            {label = 'Pillbox Hospital', coords = vec4(304.27, -600.33, 43.28, 272.249)},
        }
    },
}