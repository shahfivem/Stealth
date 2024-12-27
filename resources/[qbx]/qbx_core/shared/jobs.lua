---Job names must be lower case (top level table key)
---@type table<string, Job>
return {
    ['unemployed'] = {
        label = 'Civilian',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Freelancer',
                payment = 10
            },
        },
    },
    ['police'] = {
        label = 'LSPD',
        type = 'leo',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Recruit',
                payment = 50
            },
            [1] = {
                name = 'Officer',
                payment = 75
            },
            [2] = {
                name = 'Sergeant',
                payment = 100
            },
            [3] = {
                name = 'Lieutenant',
                payment = 125
            },
            [4] = {
                name = 'Chief',
                isboss = true,
                bankAuth = true,
                payment = 150
            },
        },
    },
    ['bcso'] = {
        label = 'BCSO',
        type = 'leo',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Recruit',
                payment = 50
            },
            [1] = {
                name = 'Officer',
                payment = 75
            },
            [2] = {
                name = 'Sergeant',
                payment = 100
            },
            [3] = {
                name = 'Lieutenant',
                payment = 125
            },
            [4] = {
                name = 'Chief',
                isboss = true,
                bankAuth = true,
                payment = 150
            },
        },
    },
    ['sasp'] = {
        label = 'SASP',
        type = 'leo',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Recruit',
                payment = 50
            },
            [1] = {
                name = 'Officer',
                payment = 75
            },
            [2] = {
                name = 'Sergeant',
                payment = 100
            },
            [3] = {
                name = 'Lieutenant',
                payment = 125
            },
            [4] = {
                name = 'Chief',
                isboss = true,
                bankAuth = true,
                payment = 150
            },
        },
    },
    ['ambulance'] = {
        label = 'EMS',
        type = 'ems',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Recruit',
                payment = 50
            },
            [1] = {
                name = 'Paramedic',
                payment = 75
            },
            [2] = {
                name = 'Doctor',
                payment = 100
            },
            [3] = {
                name = 'Surgeon',
                payment = 125
            },
            [4] = {
                name = 'Chief',
                isboss = true,
                bankAuth = true,
                payment = 150
            },
        },
    },
    ['realestate'] = {
        label = 'Real Estate',
        type = 'realestate',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Recruit',
                payment = 50
            },
            [1] = {
                name = 'House Sales',
                payment = 75
            },
            [2] = {
                name = 'Business Sales',
                payment = 100
            },
            [3] = {
                name = 'Broker',
                payment = 125
            },
            [4] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 150
            },
        },
    },
    ['taxi'] = {
        label = 'Taxi',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Recruit',
                payment = 50
            },
            [1] = {
                name = 'Driver',
                payment = 75
            },
            [2] = {
                name = 'Event Driver',
                payment = 100
            },
            [3] = {
                name = 'Sales',
                payment = 125
            },
            [4] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 150
            },
        },
    },
    ['bus'] = {
        label = 'Bus',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Driver',
                payment = 50
            },
        },
    },
    ['cardealer'] = {
        label = 'Vehicle Dealer',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Recruit',
                payment = 50
            },
            [1] = {
                name = 'Showroom Sales',
                payment = 75
            },
            [2] = {
                name = 'Business Sales',
                payment = 100
            },
            [3] = {
                name = 'Finance',
                payment = 125
            },
            [4] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 150
            },
        },
    },
    ['mechanic'] = {
        label = 'Mechanic',
        type = 'mechanic',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Recruit',
                payment = 50
            },
            [1] = {
                name = 'Novice',
                payment = 75
            },
            [2] = {
                name = 'Experienced',
                payment = 100
            },
            [3] = {
                name = 'Advanced',
                payment = 125
            },
            [4] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 150
            },
        },
    },
    ['judge'] = {
        label = 'Honorary',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Judge',
                payment = 100
            },
        },
    },
    ['lawyer'] = {
        label = 'Law Firm',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Associate',
                payment = 50
            },
        },
    },
    ['reporter'] = {
        label = 'Reporter',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Journalist',
                payment = 50
            },
        },
    },
    ['trucker'] = {
        label = 'Trucker',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Driver',
                payment = 50
            },
        },
    },
    ['tow'] = {
        label = 'Towing',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Driver',
                payment = 50
            },
        },
    },
    ['garbage'] = {
        label = 'Garbage',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Collector',
                payment = 50
            },
        },
    },
    ['vineyard'] = {
        label = 'Vineyard',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Picker',
                payment = 50
            },
        },
    },
    ['hotdog'] = {
        label = 'Hotdog',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Sales',
                payment = 50
            },
        },
    },

    -- Custom
    ['taco'] = {
        label = 'Taco Hut',
        
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Trainee',
                payment = 50
            },
            [1] = {
                name = 'Cook',
                payment = 75
            },
            [2] = {
                name = 'Shift Lead',
                payment = 100
            },
            [3] = {
                name = 'Manager',
                payment = 125
            },
            [4] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
                payment = 150
            },
        },
    },
    ['blackwoods'] = {
        label = 'Blackwoods',
        
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Apprentice',
                payment = 60
            },
            [1] = {
                name = 'Chef',
                payment = 85
            },
            [2] = {
                name = 'Sous Chef',
                payment = 110
            },
            [3] = {
                name = 'Executive Chef',
                payment = 135
            },
            [4] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
                payment = 160
            },
        },
    },
    ['soochi'] = {
        label = 'Soochi',
        
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Trainee',
                payment = 55
            },
            [1] = {
                name = 'Assistant Chef',
                payment = 80
            },
            [2] = {
                name = 'Chef',
                payment = 105
            },
            [3] = {
                name = 'Manager',
                payment = 130
            },
            [4] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
                payment = 155
            },
        },
    },
    ['enchanted'] = {
        label = 'Enchanted Shop',
        type = 'retail',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Sales Associate',
                payment = 45
            },
            [1] = {
                name = 'Shift Lead',
                payment = 70
            },
            [2] = {
                name = 'Assistant Manager',
                payment = 95
            },
            [3] = {
                name = 'Store Manager',
                payment = 120
            },
            [4] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
                payment = 145
            },
        },
    },

    ['justchilling'] = {
        label = 'Just Chilling',
        
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Scooper',
                payment = 40
            },
            [1] = {
                name = 'Cashier',
                payment = 60
            },
            [2] = {
                name = 'Ice Cream Artist',
                payment = 80
            },
            [3] = {
                name = 'Shift Manager',
                payment = 100
            },
            [4] = {
                name = 'Store Owner',
                isboss = true,
                bankAuth = true,
                payment = 120
            },
        },
    },

    ['ltp'] = {
        label = 'Little Teapot',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Bud Maker',
                payment = 40
            },
            [1] = {
                name = 'Cashier',
                payment = 60
            },
            [2] = {
                name = 'Joint Artist',
                payment = 80
            },
            [3] = {
                name = 'Shift Manager',
                payment = 100
            },
            [4] = {
                name = 'Store Owner',
                isboss = true,
                bankAuth = true,
                payment = 120
            },
        },
    },
    
}
