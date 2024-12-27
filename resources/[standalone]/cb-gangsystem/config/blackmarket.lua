-- ██████╗ ██╗      █████╗  ██████╗██╗  ██╗    ███╗   ███╗ █████╗ ██████╗ ██╗  ██╗███████╗████████╗
-- ██╔══██╗██║     ██╔══██╗██╔════╝██║ ██╔╝    ████╗ ████║██╔══██╗██╔══██╗██║ ██╔╝██╔════╝╚══██╔══╝
-- ██████╔╝██║     ███████║██║     █████╔╝     ██╔████╔██║███████║██████╔╝█████╔╝ █████╗     ██║
-- ██╔══██╗██║     ██╔══██║██║     ██╔═██╗     ██║╚██╔╝██║██╔══██║██╔══██╗██╔═██╗ ██╔══╝     ██║
-- ██████╔╝███████╗██║  ██║╚██████╗██║  ██╗    ██║ ╚═╝ ██║██║  ██║██║  ██║██║  ██╗███████╗   ██║
-- ╚═════╝ ╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝
Config.UseBlackMarket = true
Config.BlackMarketCooldown = 0
Config.BlackMarketCoords = vector3(892.038, -3212.503, -98.529)
Config.BlackMarket = { -- This is only used if you are not using Ox Inventory
    label = "Black Market",
    slots = 1,
    items = {
        [1] = {
            name = "sandwich",
            price = 1000,
            amount = 100,
            info = { quality = 100, },
            type = "item",
            slot = 1,
        }
    }
}
Config.OxBlackMarket = { -- This is only used if you are using Ox Inventory
    name = 'Black Market',
    inventory = {
        { name = 'sandwich', price = 1000 },
        { name = 'sandwich', price = 15, currency = 'black_money' },
    },
    locations = {
        Config.BlackMarketCoords
    }
}