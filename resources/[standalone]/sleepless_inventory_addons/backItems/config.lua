---@class Slot
---@field bone number
---@field pos vector3
---@field rot vector3

---@class OptionalVector
---@field x? number
---@field y? number
---@field z? number

---@class BackItem
---@field prio number
---@field group? string
---@field customPos? {bone?: number , pos?: OptionalVector | vector3, rot?: OptionalVector | vector3}
---@field ignoreLimits? boolean
---@field model? number | string

---@class Config
---@field defaultSlots table<string, Slot[]>
---@field BackItems table<string, BackItem>

local Config = {}

Config.defaultSlots = {
    ['back'] = {
        { bone = 24818, pos = vec3(0.09, -0.16, 0.00), rot = vec3(0.0, 180.0, 0.0) },
        { bone = 24818, pos = vec3(0.09, -0.16, 0.12), rot = vec3(0.0, 180.0, 0.0) },
        { bone = 24818, pos = vec3(0.09, -0.16, -0.12), rot = vec3(0.0, 180.0, 0.0) }
    }
}

Config.allowedVehicleClasses = {
    [8] = true,  -- motorcycles
    [13] = true, -- bicycles
    [14] = true, -- boats
}

Config.BackItems = {
    -- Assault Rifles
    ['WEAPON_CARBINERIFLE'] = { prio = 3, group = 'back', visibility = 1 },
    ['WEAPON_CARBINERIFLE_MK2'] = { prio = 3, group = 'back', visibility = 1 },
    ['WEAPON_ASSAULTRIFLE'] = { prio = 3, group = 'back', visibility = 1 },
    ['WEAPON_ADVANCEDRIFLE'] = { prio = 3, group = 'back', visibility = 1 },
    ['WEAPON_BULLPUPRIFLE'] = { prio = 3, group = 'back', visibility = 1 },
    ['WEAPON_BULLPUPRIFLE_MK2'] = { prio = 3, group = 'back', visibility = 1 },
    ['WEAPON_MK18'] = { prio = 3, group = 'back', visibility = 1, model = `mk18`, },
    ['WEAPON_TACTICALRIFLE'] = { prio = 3, group = 'back', visibility = 1 },

    -- SMGs
    ['WEAPON_MICROSMG'] = { prio = 3, group = 'back', visibility = 1 },
    ['WEAPON_MP5'] = { prio = 3, group = 'back', visibility = 1 },
    ['WEAPON_PP19'] = { prio = 3, group = 'back', visibility = 1 },
    ['WEAPON_COMBATPDW'] = { prio = 3, group = 'back', visibility = 1 },
    ['WEAPON_MPX'] = { prio = 3, group = 'back', visibility = 1 },

    -- Machine Guns
    ['WEAPON_COMBATMG'] = { prio = 3, group = 'back', visibility = 1 },
    ['WEAPON_MG'] = { prio = 3, group = 'back', visibility = 1 },
    ['WEAPON_GUSENBERG'] = { prio = 3, group = 'back', visibility = 1 },

    -- Special Items
    ['WEAPON_SNIPERRIFLE'] = { prio = 3, group = 'back' },
    ['cone'] = {
        prio = 1,
        ignoreLimits = true,
        model = `prop_roadcone02a`,
        customPos = {
            bone = 12844,
            pos = vec3(0.06, 0.0, 0.0),
            rot = vec3(0.0, 90.0, 0.0)
        }
    }
}

return Config
