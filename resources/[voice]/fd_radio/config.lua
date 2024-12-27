Config = {}
Config.Debug = false            -- Debug mode, this will print all events to console
Config.Framework = 'QB'       -- Server core: QB - QBCore, ESX - ESX, none - Standalone
Config.CoreResource = 'qb-core' -- Only used for QBCore servers
Config.PMAVoiceResource = 'pma-voice'

--[[
    Since v1.8 your able to log actions like radio channel switch and etc.
    ensure that your bridge has `bridge.log(src, event, data)` method
]] --
Config.EnableLogging = false

--[[
    Since v1.8 theres new frame introduced
    For config use either:
    - new
    - old
]] --
Config.Frame = "new"
Config.FrameProps = {
    new = {
        ['default'] = 'prop_radio_graphite',
        ['red'] = 'prop_radio_red',
        ['blue'] = 'prop_radio_blue',
        ['green'] = 'prop_radio_green',
        ['yellow'] = 'prop_radio_yellow',
        ['white'] = 'prop_radio_white',
    },
    old = {
        ['default'] = 'walkietalkie_grey',
        ['red'] = 'walkietalkie_red',
        ['blue'] = 'walkietalkie_blue',
        ['green'] = 'walkietalkie_green',
        ['yellow'] = 'walkietalkie_yellow',
        ['white'] = 'walkietalkie_white',
    }
}
Config.DefaultColor = "default"       -- Options: default, white, red, blue, green, yellow
Config.AllowColorChange = true    -- Allow personal color switch, automatically set to false if MultipleItems are enabled
Config.OpenRadioCommand = 'radio' -- Command to open radio, false to disable
Config.UseItem = true             -- Use item to open radio, this will work only for QB or ESX
Config.MultipleItems = false
Config.UseableItems = {
    single = "radio",
    multiple = {
        default = 'radio_default',
        red = 'radio_red',
        blue = 'radio_blue',
        green = 'radio_green',
        yellow = 'radio_yellow',
        white = 'radio_white'
    }
}
Config.UseRadioKey =
    true                      -- Use radio key to open radio, if you want to disable this set it to false (command should be enabled if you want to use keybind)

Config.LeaveRadioIfDead = false -- Leave radio channel if player is dead


Config.DefaultVolume = 50                       -- 0 - 100
Config.MicClicks = true                         -- This enables pma-voice mic clicks
Config.RadioAnims = true                        -- This enables pma-voice radio animations
Config.CanMoveWhileRadioIsOpen = false          -- Allow user to move while radio is open
Config.CanMoveWhileQuickRadioListIsOpen = false -- Allow user to move while quick radio list is open, what a name
Config.MaxFrequency = 999

Config.UseRanges = true
Config.DisableRangesForJobs = { 'police', 'ambulance' } -- disable ranges for custom jobs, example: { 'police', 'ambulance' }, used only for ESX and QB
Config.disableAutoSpectateModeDetection = false         -- If disabled, ranges wont take effect on person who is spectating
Config.UsePMADefaultRadioEffect = false                 -- Use default radio effect for normal range
Config.DefaultRadioFilter = {
    { name = "freq_low",    value = 100.0 },
    { name = "freq_hi",     value = 5000.0 },
    { name = "rm_mod_freq", value = 300.0 },
    { name = "rm_mix",      value = 0.1 },
    { name = "fudge",       value = 4.0 },
    { name = "o_freq_lo",   value = 300.0 },
    { name = "o_freq_hi",   value = 5000.0 },
    volume = {
        frontLeftVolume = 0.25,
        frontRightVolume = 1.0,
    },
}

--[[
    Since v1.8 you're able to extend range with an item.
    Enable it below, and make sure item with extendable range is defined correctly.
]] --
Config.CanExtendRange = true
Config.RangeExtendItem = 'advancedradio'
Config.RangeExtendRange = 500.0 -- min and max will be extended for each range.

Config.Ranges = {
    {
        effect = {
            { name = "freq_low",    value = 100.0 },
            { name = "freq_hi",     value = 5000.0 },
            { name = "rm_mod_freq", value = 300.0 },
            { name = "rm_mix",      value = 0.5 },
            { name = "fudge",       value = 11.0 },
            { name = "o_freq_lo",   value = 300.0 },
            { name = "o_freq_hi",   value = 5000.0 },
        },
        volume = {
            frontLeftVolume = 0.25,
            frontRightVolume = 1.0,
        },
        ranges = {
            min = 900,
            max = 1300.0
        }
    },
    {
        effect = {
            { name = "freq_low",    value = 100.0 },
            { name = "freq_hi",     value = 5000.0 },
            { name = "rm_mod_freq", value = 300.0 },
            { name = "rm_mix",      value = 0.8 },
            { name = "fudge",       value = 17.0 },
            { name = "o_freq_lo",   value = 300.0 },
            { name = "o_freq_hi",   value = 5000.0 },
        },
        volume = {
            frontLeftVolume = 0.25,
            frontRightVolume = 1.0,
        },
        ranges = {
            min = 1300.0,
            max = 1700.0
        }
    },
    {
        effect = {
            { name = "freq_low",    value = 100.0 },
            { name = "freq_hi",     value = 5000.0 },
            { name = "rm_mod_freq", value = 1500.0 },
            { name = "rm_mix",      value = 1.3 },
            { name = "fudge",       value = 25.0 },
            { name = "o_freq_lo",   value = 300.0 },
            { name = "o_freq_hi",   value = 5000.0 },
        },
        volume = {
            frontLeftVolume = 0.25,
            frontRightVolume = 1.0,
        },
        mute = false,
        ranges = {
            min = 1700.0,
            max = 2300.0
        }
    }
}

Config.JammerFilter = {
    effect = {
        { name = "freq_low",    value = 100.0 },
        { name = "freq_hi",     value = 5000.0 },
        { name = "rm_mod_freq", value = 1500.0 },
        { name = "rm_mix",      value = 1.3 },
        { name = "fudge",       value = 30.0 },
        { name = "o_freq_lo",   value = 300.0 },
        { name = "o_freq_hi",   value = 5000.0 },
    },
    volume = {
        frontLeftVolume = 0.25,
        frontRightVolume = 1.0,
    },
}

Config.AllChanelsHaveUserList = false              -- If enabled, all channels will have user list
Config.AllWhitelistedChannelsHaveUserList = true   -- If enabled, all radio will have user list
Config.IsExternalUsersListEnabledByDefault = false -- If enabled, external users list will be enabled and shown
Config.CanExternalUsersListBeToggled = false        -- if enabled, external users list can be toggled
Config.ExternalUsersListHighlight = true          -- if enabled, talking users will be highlighted in external users list

-- Applies for list title
Config.ExternalListTitleStyles = {
    ['opacity'] = '0.8',
    ['text-shadow'] = '1.25px 0 0 #000, 0 -1.25px 0 #000, 0 1.25px 0 #000, -1.25px 0 0 #000',
}

-- Applies for each user in the list
Config.ExternalUsersListStyles = {
    -- ['top'] = '30%',
}

Config.ExternalUsersListInActiveStyles = {
    ['opacity'] = '0.8',
    ['text-shadow'] = '1.25px 0 0 #000, 0 -1.25px 0 #000, 0 1.25px 0 #000, -1.25px 0 0 #000',
}

-- Applies for each user in the list
Config.ExternalUsersListActiveStyles = {
    ['opacity'] = '1.0',
    ['color'] = '#4BB2FA',
    ['text-shadow'] = '1.25px 0 0 #000, 0 -1.25px 0 #000, 0 1.25px 0 #000, -1.25px 0 0 #000',
}

Config.QuickJoinCommand = 'qradio' -- Command to join radio channel, to disable it set it to false

Config.UseCustomChannelNames = {
    [1] = "Tac 1",
    [1.11] = 'Chase 1',
    [1.12] = 'Chase 2'
}

Config.WhitelistedAccess = {
    [1] = {
        ['police'] = true,
        ['ambulance'] = true
    }
}

Config.ChannelsWhichHasList = {
    -- [1] = true
}

-- Disables range for specific channels
Config.DisableRangeForChannels = {
    [1] = true
}

Config.AllChannelsCanBeLocked = false -- Specify if all public channels can be locked (won't work on whitelisted channels)
Config.ChannelsWhichCanBeLocked = {   -- if above is false, Specify which channels can be locked (won't work on whitelisted channels)
    [2] = true
}

Config.AllowJammers = false   -- Allow jammers to be used
Config.JammerRadius = 20
Config.JammerPickUpUse = '3d' -- Avaiable: 3d (draws 3d text above jammer), qb-target, qtarget, ox_target
Config.PlaceJammerCommand =
'placejammer'                 -- Command to place jammer, to disable it set it to false (only work with Framework = none)
Config.UseJammerItem = false  -- Item name to use as jammer, only works with QB or ESX, set false to disable
Config.JammerItemName = "radio_jammer"
Config.MinimumDistanceBetweenJammers = 100
Config.DisableJammerForJobs = { 'police' } -- Only works for QB or ESX
Config.DisableJammerForChannels = {
    [2] = true
}

-- Quick join list
Config.QuickListCommand = 'rlist' -- Command to open quick join list, to disable it set it to false
Config.QuickListKeyBind =
false                            -- Keybind to open quick join list, to disable it set it to false (command should be enabled if you want to use keybind)
Config.QuickListForJobs = {
    ['police'] = {
        [1] = 'Tac 1',
        [2] = 'Tac 2',
        [3] = 'Tac 3',
        [4] = 'Tac 4',
        [5] = 'Tac 5',
        [6] = 'Tac 6',
        [7] = 'Tac 7',
        [8] = 'Tac 8',
        [9] = 'Tac 9',
        [10] = 'Tac 10',
    }
}


-- Don't touch
Config.DefaultSettings = {
    volume = Config.DefaultVolume,
    frame = Config.DefaultColor,
    size = "medium",
    signs = {
        sign = '',
        name = '',
    },
    position = {
        bottom = 0,
        right = 0
    }
}
