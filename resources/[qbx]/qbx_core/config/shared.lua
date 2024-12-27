return {
    serverName = 'Stealth Roleplay',
    defaultSpawn = vec4(-1034.92, -2732.88, 20.17, 331.28),
    notifyPosition = 'top-right', -- 'top' | 'top-right' | 'top-left' | 'bottom' | 'bottom-right' | 'bottom-left'
    ---@type { name: string, amount: integer, metadata: fun(source: number): table }[]
    starterItems = { -- Character starting items
        { name = 'phone', amount = 1 },
        { name = 'id_card', amount = 1, metadata = function(source)
            return exports['um-idcard']:CreateMetaLicense(source, 'id_card')
        end 
    },
    { name = 'driver_license', amount = 1, metadata = function(source)
            return exports['um-idcard']:CreateMetaLicense(source, 'driver_license')
        end
    },
    }
}