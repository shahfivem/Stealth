Config.IceCrafting = {
    all = { -- All jobs are able to use this crafting
        ["water"] = {
            {
                free = false,
                items = {
                    {
                        item = "beer",
                        amount = 2,
                        remove = true
                    }
                },
                result = {
                    item = "water",
                    amount = 1
                },
                duration = 5000,
                dict = "anim@amb@business@meth@meth_monitoring_no_work@",
                clip = "so_board_with_cleaning_lazycook"
            }
        }
    },
    vanilla = { -- Only the vanilla job is able to use this crafting
        ["water"] = {
            {
                free = false,
                items = {
                    {
                        item = "beer",
                        amount = 2,
                        remove = true
                    }
                },
                result = {
                    item = "water",
                    amount = 1
                },
                duration = 5000,
                dict = "anim@amb@business@meth@meth_monitoring_no_work@",
                clip = "so_board_with_cleaning_lazycook"
            }
        }
    }
}