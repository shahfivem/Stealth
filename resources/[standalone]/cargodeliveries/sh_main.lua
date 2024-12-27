Config = {}

Config.VehicleModels = { 'minivan', 'speedo', 'rumpo', 'youga' }
Config.VehicleSpawn = vector4(114.87, -1199.74, 29.3, 274.22) -- Van spawn location
Config.DeliverySpots = {
    vector3(112.0, -1204.0, 28.0),
    vector3(-304.0, -1502.0, 31.0),
    vector3(250.0, -1974.0, 25.0),
}
Config.RequiredItems = { { name = 'cargo_ticket', count = 1 } }
Config.Payout = { min = 500, max = 1000 }
Config.Deposit = 500
