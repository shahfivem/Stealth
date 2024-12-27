Config.CuttingBoardCrafting = {
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
        ["hornyssandwich"] = {
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
                    item = "hornyssandwich",
                    amount = 1
                },
                duration = 5000,
                dict = "anim@amb@business@meth@meth_monitoring_no_work@",
                clip = "so_board_with_cleaning_lazycook"
            }
        },
        ["hornyssalad"] = {
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
                    item = "hornyssalad",
                    amount = 1
                },
                duration = 5000,
                dict = "anim@amb@business@meth@meth_monitoring_no_work@",
                clip = "so_board_with_cleaning_lazycook"
            }
        }
    }
}