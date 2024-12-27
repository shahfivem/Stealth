--  ██████╗ ██████╗ ██████╗ ███╗   ██╗███████╗██████╗
-- ██╔════╝██╔═══██╗██╔══██╗████╗  ██║██╔════╝██╔══██╗
-- ██║     ██║   ██║██████╔╝██╔██╗ ██║█████╗  ██████╔╝
-- ██║     ██║   ██║██╔══██╗██║╚██╗██║██╔══╝  ██╔══██╗
-- ╚██████╗╚██████╔╝██║  ██║██║ ╚████║███████╗██║  ██║
--  ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝
Config.AlertCopsChance = 12
Config.DrawLine = false -- Draws a pink line to the Drug Sale PED. Useful for Debug, potentially useful in a Live Environment.
Config.UsingModifiedR14 = false -- Are you using a modified R14-Evidence? Enabling this allows drug residue to drop on the ground when selling drugs.
Config.SellDrugsCommand = "corner"
Config.MinCops = 0 -- The minimum number of cops online before selling is allowed
Config.DirtyCashItem = "cash"
Config.UseZoneModifier = true -- Do you want to increase the price of the drug sale if the player's gang is in control of the turf that is being sold on
Config.ZoneModifier = 1.15 -- Think of this as a percentage (e.g. 1.15 = 115%)
Config.OnlySlingOutside = true -- If true, only allow players to sell drugs when outside
Config.Slinging = {
    Cooldown = 30, -- In seconds.
    Distance = 1.5,
    DrawDistance = 6.0,
    MaxRange = 40.0,
    SpawnCooldown = 15000, -- In milliseconds.
    Anim = {
        Dict = "mp_common",
        Name = "givetake1_a",
        Flag = 16,
        Props = {
            { Model = "prop_paper_bag_small", Bone = 28422, Offset = { 0.0, -0.05, 0.02, -90.0, 0.0, 0.0 } },
        },
    },
}

Config.PoliceCallModels = { -- If the player sells to one of these peds the cops will be called
    "s_m_m_security_01"
}
-- TODO: Rework Police Call Models

Config.DrugSaleMultiplier = function(policeCount)
    if policeCount == 0 then
        return 0.5
    elseif policeCount == 1 then
        return 1.0
    elseif policeCount == 2 then
        return 1.15
    elseif policeCount == 3 then
        return 1.2
    elseif policeCount == 4 then
        return 1.25
    elseif policeCount == 5 then
        return 1.3
    else
        return 1.35
    end
end

Config.DrugPrices = {
    --[[
        Min: minimum cash per item,
        Max: maximum cash per item,
        Cap: maximum amount of items per sale,
    ]]
    --- PUT YOUR DRUGS HERE ---
    ["weed_ak47"] = { Min = 159, Max = 169, Cap = 4 },
    ["weed_skunk"] = { Min = 163, Max = 173, Cap = 4 },
    ["weed_amnesia"] = { Min = 162, Max = 171, Cap = 4 },
    ["weed_gelato"] = { Min = 158, Max = 166, Cap = 4 },
    ["weed_og-kush"] = { Min = 163, Max = 175, Cap = 4 },
    ["weed_purple-haze"] = { Min = 165, Max = 173, Cap = 4 },
    ["weed_white-widow"] = { Min = 156, Max = 167, Cap = 4 },
    ["weed_zkittlez"] = { Min = 155, Max = 177, Cap = 4 },
    ["meth"] = { Min = 431, Max = 466, Cap = 5 },
    ["meth_1oz"] = { Min = 325, Max = 350, Cap = 5 },
    ["heroinbaggy"] = { Min = 385, Max = 402, Cap = 5 },
    ["morphinebaggy"] = { Min = 265, Max = 298, Cap = 5 },
    ["liquidheroin"] = { Min = 395, Max = 432, Cap = 5 },
    ["crack_baggy"] = { Min = 384, Max = 446, Cap = 5 },
    ["coke_small_brick"] = { Min = 350, Max = 500, Cap = 5 },
    ["cokebaggy"] = { Min = 391, Max = 451, Cap = 5 },
    ["ketamine"] = { Min = 262, Max = 301, Cap = 5 },
    ["moonshine_bottle"] = { Min = 151, Max = 203, Cap = 4 },
    ["morphine"] = { Min = 280, Max = 320, Cap = 5 },
    ["coke_1oz"] = { Min = 325, Max = 350, Cap = 5 },
    ["heroin_1oz"] = { Min = 325, Max = 350, Cap = 5 },
    ["crack_1oz"] = { Min = 325, Max = 350, Cap = 5 },
    ["lean_bottle"] = { Min = 65, Max = 80, Cap = 1 },
    ["meth_brick"] = { Min = 7750, Max = 7760, Cap = 1 },
    ["coke_brick"] = { Min = 7030, Max = 7040, Cap = 1 },
    ["weed_brick"] = { Min = 2930, Max = 2940, Cap = 1 },
    ["heroin_brick"] = { Min = 6925, Max = 6935, Cap = 1 },
}