return {
    ['cleankit'] = {
        text = "Cleaning vehicle",
        length = 15000,
        flopcheck = true,
        canCancel = true,
        animation = { dict = "amb@world_human_janitor@male@idle_a", anim = 'idle_a', prop = "janitor", stuck = true }
    },
    ['tirekit'] = {
        text = "Repairing tires",
        length = 15000,
        flopcheck = true,
        canCancel = true,
        anim = {
            dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
            anim = "machinic_loop_mechandplayer",
            stuck = true,
            flag = 10
        },
    },
    ['smallkit'] = {
        text = "Repairing vehicle",
        length = 20000,
        flopcheck = true,
        canCancel = true,
        animation = {
            dict = "mini@repair",
            anim = "fixing_a_player",
            stuck = true,
        },
    },
    ['bigkit'] = {
        label = "Repairing vehicle",
        length = 30000,
        flopcheck = true,
        canCancel = true,
        animation = {
            dict = "mini@repair",
            anim = "fixing_a_player",
            stuck = true
        },
    }
}