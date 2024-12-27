Config = {}

Config.Debug = false           -- If you want to see the debug messages in the console, you can make it true.

Config.Lang = 'en'             -- [locales/.lua]

Config.PerformanceMode = false --  true (optional)

Config.CleanZone = false       --  true (optional) (for zombie servers)

Config.HideRadar = true       --  true (optional)

Config.Logs = {
    Status = true,    --  true (optional)
    Logger = 'fivemerr' -- 'discord', 'fivemerr', 'ox' (ox support: fivemanage, datadog, grafana loki logging )
}

Config.DeleteButton = true

Config.DefaultSlots = 5

-- if 'set um:NewPlayerApartmentInsideStart false in server.cfg' this coords will be used.
Config.NewPlayerNoApartmentStartCoords = vector4(-1037.11, -2736.96, 20.17, 323.76)

Config.NoSpawnMenuOnlyLastLocation = {
    Status = false,                -- If you make it true, the character will spawn at Last Location.
    gtaVNativeAndCutScene = false, -- true / false
}

--[[
    customExport = true, comp qbx_idcard, um-idcard bl_idcard or custom
    for custom: server > editable > functions.lua
]]
Config.StarterItems = {
    { item = 'phone',          amount = 1 },
    { item = 'id_card',        amount = 1, customExport = true },
    { item = 'driver_license', amount = 1, customExport = true },
}

Config.CustomHud = function(bool)
    if bool then
        exports['0r-hud-v3']:ToggleVisible(false)
        Debug('Hud is hidden', 'debug')
    else
        exports['0r-hud-v3']:ToggleVisible(true)
        Debug('Hud is show', 'debug')
    end
end


Config.Dob = {
    Lowest = 2005,
    Highest = 1900,
    Notify = {
        invalid = 'Invalid date of birth %s',
        exploit = 'Special Character Detected %s'
    }
}

-----------------------------------------------------------------------------------------------------------------
-- UM - Multi Character | Customize Settings
-----------------------------------------------------------------------------------------------------------------

Config.CinematicMode = true -- If you want to use cinematic mode, you can make it true (um special?)

Config.BackgroundMusic = {
    Status = true,       -- If you want to use background music, you can make it true.
    Name = 'bgmusic.mp3', -- [web/build/audio/]
    Volume = 0.3
}

Config.Pages = {
    Credits = {
        Status = false,
        List = Credits.List -- [list/creditslist.lua]
    },
    Store = {
        Status = false,
        URL = 'https://uyuyorumstore.com'
    }
}

Config.Coords = {
    Single = Coords.List[5], -- If random false [list/coordslist.lua] | all coords = https://alp1x.github.io/um-multi-coords/
    Random = false
}

Config.Effects = {
    Status = true,          -- If you want to use effects, you can make it true.
    Single = Effect.List[6], -- If random false [list/effectlist.lua]
    Random = true
}

Config.Animation = {
    -- If you have a custom animation menu, customize the export in animationlist.lua or use scenario
    Status = true,             -- If you want to use animations, you can make it true.
    Single = Animation.List[1], -- If random false [list/animationlist.lua]
    Random = true,
    Scenario = {
        Status = true,                     -- If you want to use scenario, you can make it true.
        Single = Animation.ScenarioList[2], -- If random false [list/animationlist.lua]
        Random = true
    }
}

Config.TimeSettings = {
    SyncStatus = false, -- false: Custom Time & Weather | true: Server Time
    Time = 23,          -- recommended 10-23 | not 00 or 00:00
    Weather =
    'XMAS'              -- CLEAR, EXTRASUNNY, CLOUDS, OVERCAST, RAIN, CLEARING , THUNDER, SMOG, FOGGY, XMAS , SNOWLIGHT, BLIZZARD
}

Config.Speech = {
    Status = true, -- or true
    Volume = 1,     -- A float that represents the volume value, between 0 (lowest) and 1 (highest.)
    Rate = 1,       -- This feature is used to adjust the loudness or tone of speech. | Default 1
    Pitch = 0,      -- This feature is used to adjust the speed of speech. | Default 1

    -- I suggest using commas
    -- Think of [name] as a variable and don't change its name, you can only change where it is, for example
    -- exp: 오늘 기분이 너무 안 좋아, [name] 넌 어때?
    Texts = {
        -- "Hello [name], Welcome to Stealth <3",
        "오늘 기분이 너무 안 좋아, [name] 넌 어때?"
    }
}

-- [[ ! DON'T CHANGE ]]
Config.NewPlayerNoApartmentStartClothingUI = 'qb-clothes:client:CreateFirstCharacter' -- [[ ! DON'T CHANGE ]]
-- [[ ! DON'T CHANGE ]]
