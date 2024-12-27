sharedIpls = {
    {
        id = 'execApartment',
        iplCoords = vec3(-787.7805, 334.9232, 217.8384),
        exitCoords = vec4(-787.36, 315.73, 217.64, 270.24),
        size = 'medium',
        defaultStyle = 'Modern',
        bobipl = function()
            return exports['bob74_ipl']:GetExecApartment1Object()
        end,
        styles = {
            {
                label = 'Modern', 
                func = function(obj)
                    obj.Style.Set(obj.Style.Theme.modern, true)
                end,
            },
            {
                label = 'Moody', 
                func = function(obj)
                    obj.Style.Set(obj.Style.Theme.moody, true)
                end,
            },
            {
                label = 'Vibrant', 
                func = function(obj)
                    obj.Style.Set(obj.Style.Theme.vibrant, true)
                end,
            },
            {
                label = 'Sharp', 
                func = function(obj)
                    obj.Style.Set(obj.Style.Theme.sharp, true)
                end,
            },
            {
                label = 'Monochrome', 
                func = function(obj)
                    obj.Style.Set(obj.Style.Theme.monochrome, true)
                end,
            },
            {
                label = 'Seductive', 
                func = function(obj)
                    obj.Style.Set(obj.Style.Theme.seductive, true)
                end,
            },
            {
                label = 'Regal', 
                func = function(obj)
                    obj.Style.Set(obj.Style.Theme.regal, true)
                end,
            },
            {
                label = 'Aqua', 
                func = function(obj)
                    obj.Style.Set(obj.Style.Theme.aqua, true)
                end,
            },
        },
    },
    {
        id = 'Apartment',
        iplCoords = vec3(-20.23, -585.9, 80.43),
        exitCoords = vec4(-31.46, -595.12, 80.03, 250.25),
        size = 'medium',
    },
    {
        id = 'Apartment2',
        iplCoords = vec3(-169.24, 488.11, 138.44),
        exitCoords = vec4(-174.29, 497.89, 137.65, 190.31),
        size = 'medium',
    },
    {
        id = 'HouseLow',
        iplCoords = vec3(262.46, -998.83, -98.01),
        exitCoords = vec4(266.12, -1007.61, -101.01, 358.42),
        size = 'medium',
    },
    {
        id = 'HouseMid',
        iplCoords = vec3(341.07, -997.93, -98.2),
        exitCoords = vec4(346.56, -1013.05, -99.2, 354.55),
        size = 'medium',
    },
    {
        id = 'CasinoPenthouse',
        iplCoords = vec3(940.57, 7.12, 117.16),
        exitCoords = vec4(980.74, 56.59, 116.16, 57.87),
        size = 'medium',
        defaultStyle = 'Sharp',
        bobipl = function()
            return exports['bob74_ipl']:GetDiamondPenthouseObject()
        end,
        styles = {
            {
                label = 'Default', 
                func = function(obj)
                    obj.Interior.Walls.SetColor(obj.Colors.default, true)
                end,
            },
            {
                label = 'Sharp', 
                func = function(obj)
                    obj.Interior.Walls.SetColor(obj.Colors.sharp, true)
                end,
            },
            {
                label = 'Vibrant', 
                func = function(obj)
                    obj.Interior.Walls.SetColor(obj.Colors.vibrant, true)
                end,
            },
            {
                label = 'Timeless', 
                func = function(obj)
                    obj.Interior.Walls.SetColor(obj.Colors.timeless, true)
                end,
            },
        }
    },
    {
        id = 'financeOffice',
        iplCoords = vec3(-138.32, -642.68, 169.27),
        exitCoords = vec4(-139.16, -620.69, 168.82, 97.98),
        size = 'medium',
        defaultStyle = 'Warm',
        bobipl = function()
            return exports['bob74_ipl']:GetFinanceOffice1Object()
        end,
        styles = {
            {
                label = 'Warm', 
                func = function(obj)
                    obj.Style.Set(obj.Style.Theme.warm, true)
                end,
            },
            {
                label = 'Classical', 
                func = function(obj)
                    obj.Style.Set(obj.Style.Theme.classical, true)
                end,
            },
            {
                label = 'Vintage', 
                func = function(obj)
                    obj.Style.Set(obj.Style.Theme.vintage, true)
                end,
            },
            {
                label = 'Contrast', 
                func = function(obj)
                    obj.Style.Set(obj.Style.Theme.contrast, true)
                end,
            },
            {
                label = 'Rich', 
                func = function(obj)
                    obj.Style.Set(obj.Style.Theme.rich, true)
                end,
            },
            {
                label = 'Cool', 
                func = function(obj)
                    obj.Style.Set(obj.Style.Theme.cool, true)
                end,
            },
            {
                label = 'Ice', 
                func = function(obj)
                    obj.Style.Set(obj.Style.Theme.ice, true)
                end,
            },
            {
                label = 'Conservative', 
                func = function(obj)
                    obj.Style.Set(obj.Style.Theme.conservative, true)
                end,
            },
            {
                label = 'Polished', 
                func = function(obj)
                    obj.Style.Set(obj.Style.Theme.polished, true)
                end,
            },
        },
    },
    {
        id = 'clubhouse1',
        iplCoords = vec3(1104.78, -3158.37, -36.52),
        exitCoords = vector4(1121.07, -3152.78, -37.06, 358.95),
        size = 'medium',
        defaultStyle = 'Red',
        bobipl = function()
            return exports['bob74_ipl']:GetBikerClubhouse1Object()
        end,
        styles = {
            {
                label = 'Sable', 
                func = function(obj)
                    obj.Walls.Set(obj.Walls.plain, obj.Walls.Color.sable)
                    RefreshInterior(obj.interiorId)
                end,
            },
            {
                label = 'Red', 
                func = function(obj)
                    obj.Walls.Set(obj.Walls.plain, obj.Walls.Color.red)
                    RefreshInterior(obj.interiorId)
                end,
            },
            {
                label = 'Brown', 
                func = function(obj)
                    obj.Walls.Set(obj.Walls.plain, obj.Walls.Color.brown)
                    RefreshInterior(obj.interiorId)
                end,
            },
            {
                label = 'Yellow', 
                func = function(obj)
                    obj.Walls.Set(obj.Walls.plain, obj.Walls.Color.yellow)
                    RefreshInterior(obj.interiorId)
                end,
            },
            {
                label = 'Yellow Gray', 
                func = function(obj)
                    obj.Walls.Set(obj.Walls.plain, obj.Walls.Color.yellowGray)
                    RefreshInterior(obj.interiorId)
                end,
            },
            {
                label = 'Light Yellow', 
                func = function(obj)
                    obj.Walls.Set(obj.Walls.plain, obj.Walls.Color.lightYellow)
                    RefreshInterior(obj.interiorId)
                end,
            },
            {
                label = 'Light Yellow Gray', 
                func = function(obj)
                    obj.Walls.Set(obj.Walls.plain, obj.Walls.Color.lightYellowGray)
                    RefreshInterior(obj.interiorId)
                end,
            },
            {
                label = 'Light Gray', 
                func = function(obj)
                    obj.Walls.Set(obj.Walls.plain, obj.Walls.Color.lightGray)
                    RefreshInterior(obj.interiorId)
                end,
            },
            {
                label = 'Orange', 
                func = function(obj)
                    obj.Walls.Set(obj.Walls.plain, obj.Walls.Color.orange)
                    RefreshInterior(obj.interiorId)
                end,
            },
            {
                label = 'Gray', 
                func = function(obj)
                    obj.Walls.Set(obj.Walls.plain, obj.Walls.Color.gray)
                    RefreshInterior(obj.interiorId)
                end,
            },
        },
    },
    {
        id = 'clubhouse2',
        iplCoords = vec3(1004.44, -3159.94, -37.91),
        exitCoords = vec4(997.08, -3158.07, -38.91, 266.61),
        size = 'medium',
        defaultStyle = 'Red',
        bobipl = function()
            return exports['bob74_ipl']:GetBikerClubhouse2Object()
        end,
        styles = {
            {
                label = 'Green N Gray', 
                func = function(obj)
                    obj.Walls.Set(obj.Walls.plain, obj.Walls.Color.greenAndGray, true)
                    obj.LowerWalls.SetColor(obj.Walls.Color.greenAndGray, true)
                end,
            },
            {
                label = 'Multicolor', 
                func = function(obj)
                    obj.Walls.Set(obj.Walls.plain, obj.Walls.Color.multicolor, true)
                    obj.LowerWalls.SetColor(obj.Walls.Color.multicolor, true)
                end,
            },
            {
                label = 'Orange n Gray', 
                func = function(obj)
                    obj.Walls.Set(obj.Walls.plain, obj.Walls.Color.orangeAndGray, true)
                    obj.LowerWalls.SetColor(obj.Walls.Color.orangeAndGray, true)
                end,
            },
            {
                label = 'Blue', 
                func = function(obj)
                    obj.Walls.Set(obj.Walls.plain, obj.Walls.Color.blue, true)
                    obj.LowerWalls.SetColor(obj.Walls.Color.blue, true)
                end,
            },
            {
                label = 'Light Blue And Sable', 
                func = function(obj)
                    obj.Walls.Set(obj.Walls.plain, obj.Walls.Color.lightBlueAndSable, true)
                    obj.LowerWalls.SetColor(obj.Walls.Color.lightBlueAndSable, true)
                end,
            },
            {
                label = 'Green N Red', 
                func = function(obj)
                    obj.Walls.Set(obj.Walls.plain, obj.Walls.Color.greenAndRed, true)
                    obj.LowerWalls.SetColor(obj.Walls.Color.greenAndRed, true)
                end,
            },
            {
                label = 'Yellow N Gray', 
                func = function(obj)
                    obj.Walls.Set(obj.Walls.plain, obj.Walls.Color.yellowAndGray, true)
                    obj.LowerWalls.SetColor(obj.Walls.Color.yellowAndGray, true)
                end,
            },
            {
                label = 'Red', 
                func = function(obj)
                    obj.Walls.Set(obj.Walls.plain, obj.Walls.Color.red, true)
                    obj.LowerWalls.SetColor(obj.Walls.Color.red, true)
                end,
            },
            {
                label = 'Fuchsia N Gray', 
                func = function(obj)
                    obj.Walls.Set(obj.Walls.plain, obj.Walls.Color.fuchsiaAndGray, true)
                    obj.LowerWalls.SetColor(obj.Walls.Color.fuchsiaAndGray, true)
                end,
            },
        }
    },
    {
        id = 'VehicleWarehouse',
        iplCoords = vec3(982.06, -3000.81, -38.61),
        exitCoords = vec4(970.79, -2987.17, -39.65, 181.56),
        size = 'medium',
        defaultStyle = 'Basic',
        bobipl = function()
            return exports['bob74_ipl']:GetImportVehicleWarehouseObject()
        end,
        styles = {
            {
                label = 'Basic', 
                func = function(obj)
                    obj.Upper.Style.Set(obj.Upper.Style.basic, true)
                end,
            },
            {
                label = 'Branded', 
                func = function(obj)
                    obj.Upper.Style.Set(obj.Upper.Style.branded, true)
                end,
            },
            {
                label = 'Urban', 
                func = function(obj)
                    obj.Upper.Style.Set(obj.Upper.Style.urban, true)
                end,
            },
        }
    },
    GetGameBuildNumber() >= 2545 and {
        id = 'SecurityOffice',
        iplCoords = vec3(-1015.02, -431.17, 68.03),
        exitCoords = vec4(-1031.99, -434.59, 63.86, 297.74),
        size = 'medium',
    } or nil,
    GetGameBuildNumber() >= 2545 and {
        id = 'MusicStudio',
        iplCoords = vec3(-987.27, -72.83, -97.86),
        exitCoords = vec4(-1021.67, -92.68, -99.4, 358.35),
        size = 'medium',
    } or nil,
}