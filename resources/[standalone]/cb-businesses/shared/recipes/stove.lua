Config.StoveCrafting = {
    all = { -- Recipes in this category can be accessed by AL>L jobs
        --["pintglass"] = {
        --    {
        --        free = false,
        --        items = {
        --            {
        --                item = "beer",
        --                amount = 2,
        --                remove = true
        --            }
        --        },
        --        result = {
        --            item = "water_bottle",
        --            amount = 1
        --        },
        --        duration = 5000,
        --        dict = "anim@amb@business@meth@meth_monitoring_no_work@",
        --        clip = "so_board_with_cleaning_lazycook"
        --    }
        --}
    },
    hornys = {
        ['hornysburger'] = {{
            hornysburger = false,
            items = {
                {
                    item = 'beef',
                    amount = 1,
                    remove = true
                },
                {
                    item = 'hornysbacon',
                    amount = 1,
                    remove = true
                },
                {
                    item = 'burgerbun',
                    amount = 1,
                    remove = true
                },
                {
                    item = 'hornysegg',
                    amount = 1,
                    remove = true
                }
            },
            result = {
               item = "hornysburger",
               amount = 1
            },
           duration = 5000,
           dict = "anim@amb@business@meth@meth_monitoring_no_work@",
           clip = "so_board_with_cleaning_lazycook"
        }},
        ['hornysbreakfast'] = {{
            free = false,
            items = {
                {
                    item = 'hornysbread',
                    amount = 1,
                    remove = true
                },
                {
                    item = 'hornysbeans',
                    amount = 1,
                    remove = true
                },
                {
                    item = 'hornysmushroom',
                    amount = 1,
                    remove = true
                },
                {
                    item = 'hornystomato',
                    amount = 1,
                    remove = true
                },
                {
                    item = 'hornysbacon',
                    amount = 1,
                    remove = true
                },
                {
                    item = 'hornysegg',
                    amount = 1,
                    remove = true
                },
                {
                    item = 'hornyssausge',
                    amount = 1,
                    remove = true
                }
                
            },
            result = {
               item = "hornysbreakfast",
               amount = 1
            },
           duration = 5000,
           dict = "anim@amb@business@meth@meth_monitoring_no_work@",
           clip = "so_board_with_cleaning_lazycook"
        }},
        ['hornyshashbrown'] = {{
            free = false,
            items = {
                {
                    item = 'hornyspotato',
                    amount = 1,
                    remove = true
                },
                {
                    item = 'hornyssalt',
                    amount = 1,
                    remove = true
                },
                {
                    item = 'hornyspepper',
                    amount = 1,
                    remove = true
                },
                {
                    item = 'hornysbutter',
                    amount = 1,
                    remove = true
                }
            },
            result = {
               item = "hornyshashbrown",
               amount = 1
            },
           duration = 5000,
           dict = "anim@amb@business@meth@meth_monitoring_no_work@",
           clip = "so_board_with_cleaning_lazycook"
        }},
        ['horynswildfries'] = {{
            free = false,
            items = {
                {
                    item = 'hornyspotato',
                    amount = 1,
                    remove = true
                },
                {
                    item = 'hornyssalt',
                    amount = 1,
                    remove = true
                },
                {
                    item = 'hornyspepper',
                    amount = 1,
                    remove = true
                },
                {
                    item = 'hornysbutter',
                    amount = 1,
                    remove = true
                }
            },
            result = {
                item = "hornyshashbrown",
                amount = 1
             },
            duration = 5000,
            dict = "anim@amb@business@meth@meth_monitoring_no_work@",
            clip = "so_board_with_cleaning_lazycook"
        }}

    }
}