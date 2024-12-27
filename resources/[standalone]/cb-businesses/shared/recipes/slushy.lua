Config.SlushyCrafting = {
    all = { -- All jobs are able to use this crafting
       --["water"] = {
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
       --            item = "water",
       --            amount = 1
       --        },
       --        duration = 5000,
       --        dict = "anim@amb@business@meth@meth_monitoring_no_work@",
       --        clip = "so_board_with_cleaning_lazycook"
       --    }
       --}
    },    
    hornys = { -- Only the vanilla job is able to use this crafting
        ["hornyssoda"] = {
            {
                free = true,
                items = {
                    --{
                    --    item = "hornyssoda",
                    --    amount = 1,
                    --    remove = false
                    --}
                },
                result = {
                    item = "hornyssoda",
                    amount = 1
                },
                duration = 5000,
                dict = "anim@amb@business@meth@meth_monitoring_no_work@",
                clip = "so_board_with_cleaning_lazycook"
            }
        },
        ["hornysespresso"] = {
            {
                free = false,
                items = {
                    {
                        item = "hornyscaramel",
                        amount = 1,
                        remove = true
                    },
                    {
                        item = "whipcream",
                        amount = 1,
                        remove = true
                    },
                    {
                        item = "hornysdarkroastedcoffeebeans",
                        amount = 1,
                        remove = true
                    },
                    {
                        item = "hornyscocopowder",
                        amount = 1,
                        remove = true
                    },
                    {
                        item = "cinnamon",
                        amount = 1,
                        remove = true
                    },
                    {
                        item = "hornysvanilla",
                        amount = 1,
                        remove = true
                    }
                },
                result = {
                    item = "hornysespresso",
                    amount = 1
                },
                duration = 5000,
                dict = "anim@amb@business@meth@meth_monitoring_no_work@",
                clip = "so_board_with_cleaning_lazycook"
            }
        },
        ["slushy"] = {
            {
                free = false,
                items = {
                    {
                        item = "hornyscherrysyrup",
                        amount = 1,
                        remove = true
                    },
                    {
                        item = "hornysmangosyrup",
                        amount = 1,
                        remove = true
                    },
                    {
                        item = "hornyspineapplesyrup",
                        amount = 1,
                        remove = true
                    },
                    {
                        item = "hornysapplesyrup",
                        amount = 1,
                        remove = true
                    },
                    {
                        item = "hornysblueberrysyrup",
                        amount = 1,
                        remove = true
                    },
                    {
                        item = "hornysgrapesyrup",
                        amount = 1,
                        remove = true
                    },
                    {
                        item = "water_bottle",
                        amount = 1,
                        remove = true
                    }
                },
                result = {
                    item = "slushy",
                    amount = 1
                },
                duration = 5000,
                dict = "anim@amb@business@meth@meth_monitoring_no_work@",
                clip = "so_board_with_cleaning_lazycook"
            }
        }
    }
}