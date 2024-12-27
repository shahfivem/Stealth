Config       = {}

-- Template
-- location_teleport = { Title = "Teleport Name", Spawn = vector3(0,0,0), Heading = 169.59, Access = {"otherlocation","secondlocation"} },

Config.Zones = {
    -- Pillbox
    pb_upper1 = { Title = "Upper Level (Authorized Access Only)", Spawn = vector3(335.56, -592.42, 43.27), Heading = 70.0, Access = { "pb_lower1", "pb_rooftop" }, job = { "police", "bcso", "sast", "sasp", "doc", "ambulance", "pa" } },
    pb_upper2 = { Title = "Upper Level (Authorized Access Only)", Spawn = vector3(336.95, -589.17, 43.27), Heading = 70.0, Access = { "pb_lower2", "pb_rooftop" }, job = { "police", "bcso", "sast", "sasp", "doc", "ambulance", "pa" } },
    pb_lower1 = { Title = "Lower Level (Authorized Access Only)", Spawn = vector3(322.04, -586.58, 28.84), Heading = 250.00, Access = { "pb_upper1", "pb_rooftop" }, job = { "police", "bcso", "sast", "sasp", "doc", "ambulance", "pa" } },
    pb_lower2 = { Title = "Lower Level (Authorized Access Only)", Spawn = vector3(323.13, -583.38, 28.84), Heading = 250.00, Access = { "pb_upper2", "pb_rooftop" }, job = { "police", "bcso", "sast", "sasp", "doc", "ambulance", "pa" } },
    pb_rooftop = { Title = "Rooftop (Authorized Access Only)", Spawn = vector3(338.58, -583.74, 74.15), Heading = 252.28, Access = { "pb_lower1", "pb_upper1" }, job = { "police", "bcso", "sast", "sasp", "doc", "ambulance", "pa" } },

    -- Arcadius
    arc_lobby = { Title = "Lobby", Spawn = vector3(-116.06, -605.43, 36.27), Heading = 169.59, Access = { "arc_office", "arc_garage", "arc_roof" }, job = "all" },
    arc_office = { Title = "Office", Spawn = vector3(-139.49, -620.78, 168.81), Heading = 169.59, Access = { "arc_lobby", "arc_garage", "arc_roof" }, job = "all" },
    arc_garage = { Title = "Garage", Spawn = vector3(-143.97, -576.42, 32.41), Heading = 169.59, Access = { "arc_office", "arc_lobby", "arc_roof" }, job = "all" },
    arc_roof = { Title = "Roof", Spawn = vector3(-137.192429, -596.114624, 206.915802), Heading = 169.59, Access = { "arc_office", "arc_lobby", "arc_garage" }, job = "all" },


    -- Morgue
    --morgue_entrance = { Title = "Entrance", Spawn = vector3(240.75, -1379.5, 33.73), Heading = 169.59, Access = {"morgue_autopsy"}, job = "all" },
    --morgue_autopsy = { Title = "Autopsy (Authorized Access Only)", Spawn = vector3(247.03, -1371.9, 24.53), Heading = 319.08, Access = {"morgue_entrance"}, job = {"police","bcso","sast","sasp","doc","ambulance","pa"} },

    -- Courthouse
    court_lobby1 = { Title = "Lobby", Spawn = vector3(346.68, -1643.47, 32.53), Heading = 169.59, Access = { "court_office1" }, job = "all" },
    court_lobby2 = { Title = "Lobby", Spawn = vector3(341.27, -1650.09, 32.53), Heading = 169.59, Access = { "court_office2" }, job = "all" },
    court_office1 = { Title = "Office", Spawn = vector3(346.69, -1643.59, 85.58), Heading = 169.59, Access = { "court_lobby1" }, job = "all" },
    court_office2 = { Title = "Office", Spawn = vector3(346.69, -1643.59, 85.58), Heading = 169.59, Access = { "court_lobby2" }, job = "all" },

    court2_groundfloor = { Title = "Ground Floor", Spawn = vector3(254.61, -1083.89, 29.28), Heading = 110.59, Access = { "court2_upperfloor" }, job = "all" },
    court2_upperfloor = { Title = "Upper Floor", Spawn = vector3(254.43, -1084.0, 36.12), Heading = 110.59, Access = { "court2_groundfloor" }, job = "all" },

    -- Pillbox Medical
    --pb_1 = { Title = "name", Spawn = vector3(346.68, -1643.47, 32.53), Heading = 169.59, Access = {""} },

    -- Casino

    casino_floor1 = { Title = "Casino", Spawn = vector3(947.75, 50.77, 75.11), Heading = 314.65, Access = { "casino_top1" }, job = "all" },
    casino_floor2 = { Title = "Casino", Spawn = vector3(1004.89, 77.6, 78.46), Heading = 175.75, Access = { "casino_top2" }, job = "all" },

    casino_top1 = { Title = "Casino Top", Spawn = vector3(964.83, 58.71, 112.53), Heading = 59.53, Access = { "casino_floor1" }, job = "all" },
    casino_top2 = { Title = "Casino", Spawn = vector3(953.37, 78.92, 111.24), Heading = 328.82, Access = { "casino_floor2" }, job = "all" },

    f1_office1 = { Title = "Hub", Spawn = vector3(908.74, -2333.2, 21.19), Heading = 260.79, Access = { "f1_office2" }, job = "all" },
    f1_office2 = { Title = "Office", Spawn = vector3(837.55, -2168.65, 21.21), Heading = 354.33, Access = { "f1_office1" }, job = "all" },

    garage_casino1 = { Title = "Casino", Spawn = vector3(941.02, 27.73, 75.31), Heading = 314.65, Access = { "garage_casino2" }, job = "casino" },
    garage_casino2 = { Title = "Casino", Spawn = vector3(936.47, 1.61, 78.75), Heading = 175.75, Access = { "garage_casino1" }, job = "casino" },

    --Louies
    louies_1 = { Title = "Restaurant", Spawn = vector3(-1192.43, -1399.33, 4.28), Heading = 221.10, Access = { "louies_2", "louies_3", "louies_4" }, job = "all" },
    louies_2 = { Title = "Office/VIP", Spawn = vector3(-1191.56, -1400.80, 10.51), Heading = 221.10, Access = { "louies_1", "louies_3", "louies_4" }, job = "all" },
    louies_3 = { Title = "Executive", Spawn = vector3(-1191.59, -1400.72, 13.85), Heading = 221.10, Access = { "louies_1", "louies_2", "louies_4" }, job = "all" },
    louies_4 = { Title = "Roof", Spawn = vector3(-1191.56, -1400.80, 17.89), Heading = 221.10, Access = { "louies_1", "louies_2", "louies_3" }, job = "all" },

    -- Von Crastenburg Hotel

    lobby_1 = { Title = 'Lobby', Spawn = { vector3(-1196.56, -173.33, 39.29), vector3(-1190.60, -176.44, 39.29), vector3(-1189.07, -173.85, 39.29), vector3(-1195.41, -170.49, 39.29) }, Heading = 246.61, Access = { 'floor_1', 'floor_2', 'floor_3', 'floor_4', 'floor_5', 'floor_6', 'floor_7' }, job = "all" },

    floor_1 = { Title = 'Floor #1', Spawn = { vec3(-1199.21, -184.05, 47.81), vec3(-1204.913696, -188.458969, 47.816021), vec3(-1197.580688, -186.510117, 47.816013), vec3(-1203.001099, -190.722900, 47.816013) }, Heading = 124.72, Access = { 'lobby_1', 'floor_2', 'floor_3', 'floor_4', 'floor_5', 'floor_6', 'floor_7' }, job = "all" },
    floor_2 = { Title = 'Floor #2', Spawn = { vec3(-1199.21, -184.05, 51.81), vec3(-1204.913696, -188.458969, 51.81), vec3(-1197.580688, -186.510117, 51.81), vec3(-1203.001099, -190.722900, 51.81) }, Heading = 124.72, Access = { 'lobby_1', 'floor_1', 'floor_3', 'floor_4', 'floor_5', 'floor_6', 'floor_7' }, job = "all" },
    floor_3 = { Title = 'Floor #3', Spawn = { vec3(-1199.21, -184.05, 55.81), vec3(-1204.913696, -188.458969, 55.80), vec3(-1197.580688, -186.510117, 55.80), vec3(-1203.001099, -190.722900, 55.80) }, Heading = 124.72, Access = { 'lobby_1', 'floor_1', 'floor_2', 'floor_4', 'floor_5', 'floor_6', 'floor_7' }, job = "all" },
    floor_4 = { Title = 'Floor #4', Spawn = { vec3(-1199.21, -184.05, 59.81), vec3(-1204.913696, -188.458969, 59.81), vec3(-1197.580688, -186.510117, 59.81), vec3(-1203.001099, -190.722900, 59.81) }, Heading = 124.72, Access = { 'lobby_1', 'floor_1', 'floor_2', 'floor_3', 'floor_5', 'floor_6', 'floor_7' }, job = "all" },
    floor_5 = { Title = 'Floor #5', Spawn = { vec3(-1199.21, -184.05, 63.81), vec3(-1204.913696, -188.458969, 63.81), vec3(-1197.580688, -186.510117, 63.81), vec3(-1203.001099, -190.722900, 63.81) }, Heading = 124.72, Access = { 'lobby_1', 'floor_1', 'floor_2', 'floor_3', 'floor_4', 'floor_6', 'floor_7' }, job = "all" },
    floor_6 = { Title = 'Floor #6', Spawn = { vec3(-1199.21, -184.05, 67.81), vec3(-1204.913696, -188.458969, 67.81), vec3(-1197.580688, -186.510117, 67.81), vec3(-1203.001099, -190.722900, 67.81) }, Heading = 124.72, Access = { 'lobby_1', 'floor_1', 'floor_2', 'floor_3', 'floor_4', 'floor_5', 'floor_7' }, job = "all" },
    floor_7 = { Title = 'Floor #7', Spawn = { vec3(-1199.21, -184.05, 71.81), vec3(-1204.913696, -188.458969, 71.81), vec3(-1197.580688, -186.510117, 71.81), vec3(-1203.001099, -190.722900, 71.81) }, Heading = 124.72, Access = { 'lobby_1', 'floor_1', 'floor_2', 'floor_3', 'floor_4', 'floor_5', 'floor_6' }, job = "all" },

    -- VPD
    vpd_floor6 = { 
        Title = "6", 
        Spawn = vector3(-1096.35, -850.19, 38.24), 
        Heading = 35.37, 
        Access = {"vpd_floor5", "vpd_floor4", "vpd_floor3", "vpd_floor2", "vpd_floor1", "vpd_floorneg1", "vpd_floorneg2", "vpd_floorneg3"}, 
        job = {"police","bcso","sast","sasp","doc","ambulance","pa"} 
    },
    
    vpd_floor5 = { 
        Title = "5", 
        Spawn = vector3(-1096.36, -850.18, 34.36), 
        Heading = 35.37, 
        Access = {"vpd_floor6", "vpd_floor4", "vpd_floor3", "vpd_floor2", "vpd_floor1", "vpd_floorneg1", "vpd_floorneg2", "vpd_floorneg3"}, 
        job = {"police","bcso","sast","sasp","doc","ambulance","pa"} 
    },
    
    vpd_floor4 = { 
        Title = "4", 
        Spawn = vector3(-1096.37, -850.18, 30.75), 
        Heading = 35.37, 
        Access = {"vpd_floor6", "vpd_floor5", "vpd_floor3", "vpd_floor2", "vpd_floor1", "vpd_floorneg1", "vpd_floorneg2", "vpd_floorneg3"}, 
        job = {"police","bcso","sast","sasp","doc","ambulance","pa"} 
    },
    
    vpd_floor3 = { 
        Title = "3", 
        Spawn = vector3(-1096.37, -850.18, 26.75), 
        Heading = 35.37, 
        Access = {"vpd_floor6", "vpd_floor5", "vpd_floor4", "vpd_floor2", "vpd_floor1", "vpd_floorneg1", "vpd_floorneg2", "vpd_floorneg3"}, 
        job = {"police","bcso","sast","sasp","doc","ambulance","pa"} 
    },
    
    vpd_floor2 = { 
        Title = "2", 
        Spawn = vector3(-1096.37, -850.18, 22.75), 
        Heading = 35.37, 
        Access = {"vpd_floor6", "vpd_floor5", "vpd_floor4", "vpd_floor3", "vpd_floor1", "vpd_floorneg1", "vpd_floorneg2", "vpd_floorneg3"}, 
        job = {"police","bcso","sast","sasp","doc","ambulance","pa"} 
    },
    
    vpd_floor1 = { 
        Title = "1", 
        Spawn = vector3(-1096.37, -850.18, 18.75), 
        Heading = 35.37, 
        Access = {"vpd_floor6", "vpd_floor5", "vpd_floor4", "vpd_floor3", "vpd_floor2", "vpd_floorneg1", "vpd_floorneg2", "vpd_floorneg3"}, 
        job = {"police","bcso","sast","sasp","doc","ambulance","pa"} 
    },
    
    vpd_floorneg1 = { 
        Title = "-1", 
        Spawn = vector3(-1096.38, -850.19, 13.69), 
        Heading = 35.37, 
        Access = {"vpd_floor6", "vpd_floor5", "vpd_floor4", "vpd_floor3", "vpd_floor2", "vpd_floor1", "vpd_floorneg2", "vpd_floorneg3"}, 
        job = {"police","bcso","sast","sasp","doc","ambulance","pa"} 
    },
    
    vpd_floorneg2 = { 
        Title = "-2", 
        Spawn = vector3(-1096.37, -850.18, 10.75), 
        Heading = 35.37, 
        Access = {"vpd_floor6", "vpd_floor5", "vpd_floor4", "vpd_floor3", "vpd_floor2", "vpd_floor1", "vpd_floorneg1", "vpd_floorneg3"}, 
        job = {"police","bcso","sast","sasp","doc","ambulance","pa"} 
    },
    
    vpd_floorneg3 = { 
        Title = "-3", 
        Spawn = vector3(-1096.37, -850.18, 4.88), 
        Heading = 35.37, 
        Access = {"vpd_floor6", "vpd_floor5", "vpd_floor4", "vpd_floor3", "vpd_floor2", "vpd_floor1", "vpd_floorneg1", "vpd_floorneg2"}, 
        job = {"police","bcso","sast","sasp","doc","ambulance","pa"} 
    },    

}
