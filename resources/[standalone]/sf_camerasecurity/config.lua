
-- DISCORD FOR SUPPORT
-- |||||||||||||||||||||||||||||||||||||||||||||
-- ||||||| https://discord.gg/dcm4TNtbGQ |||||||
-- |||||||||||||||||||||||||||||||||||||||||||||

Config = Config or {}

Config.Framework = 'QBCore'     -- ESX / QBCore

-- Inventory
-- ox_inventory     (ESX/QBCore)
-- qs-inventory     (ESX/QBCore)
-- qb-inventory     (QBCore)
-- codem-inventory  (ESX/QBCore)
-- ps-inventory     (QBCore)
Config.Inventory = 'ox_inventory'

-- Resources
Config.Target = 'ox_target'     -- ox_target / qb-target
Config.Notify = 'lib'           -- qb / esx / lib / custom (require to add your custom notify in [sf_camerasecurity/client/utils.lua])
Config.ProgressBar = 'custom'      -- qb / esx / lib / custom (require to add your custom progressbar in [sf_camerasecurity/client/utils.lua])

-- Items
Config.RemoteTablet = 'camera_viewer'       -- for Citizens
Config.TabletCamViewJobs = 'camera_tablet'  -- for Jobs
Config.NeedItemFixCam = 'screwdriverset'    -- for job to fix cam
Config.CameraSignalPaper = 'camera_paper'   -- for citizens to receive signal when create new camera
Config.VpnItem = 'vpn'                      -- require this item in location wifi to watch camera

-- Settings
Config.SignalLength = 12   -- how much characters and numbers in signal 
Config.MoveCamForwardDistance = 0.2     -- this only move camera coords to forward because some times big cam props hide the vision
Config.DisableWifiSystem = true            -- if you want disable wifi system 
Config.TimerFixCamera = 10      -- sec (this only for jobs, no fix cam for normal camera)
Config.EnableWifiIcon = true    -- if you are in zone wifi, is show you a icon wifi up screen
Config.AutoRepairCameras = false -- to repair all broken camera after server restart
Config.ScanLine = true    -- set this false if you dont want show scanline when you watch camera

-- Player camera
Config.SignalItem = {
    NameItem = 'camera_citizen',
    Prop = 'prop_cctv_cam_01a'
}

-- Personal camera
Config.PersonalCamera = {
    NameItem = 'camera_personal',
    TabletItem = 'camera_personaltablet',
    Props = {
        [1] = 'prop_cctv_cam_06a',
        [2] = 'prop_cctv_cam_04a',
        [3] = 'prop_cctv_cam_05a',
        [4] = 'prop_cctv_cam_02a',
        [5] = 'prop_cctv_cam_01a',
        [6] = 'prop_cctv_cam_07a',
        [7] = 'prop_cctv_cam_01b',
        [8] = 'prop_cctv_cam_04b',
        [9] = 'prop_cctv_cam_03a',
        [10] = 'prop_cctv_cam_04c',
        [11] = 'prop_cs_cctv',
        [12] = 'hei_prop_bank_cctv_01',
        [13] = 'hei_prop_bank_cctv_02',
        [14] = 'p_cctv_s',
        [15] = 'prop_snow_cam_03a',
        [16] = 'prop_spycam'
    }
}

-- shop information
Config.Shop = {   
    Enable = true,                                        -- to active shop
    EnableCategory = true,                                -- if you want show titles category in shop
    Label = 'Camera Shop',                                -- name shop
    Icon = 'fa-solid fa-camera',                          -- icon target eye
    Ped = 's_m_y_grip_01',                                -- ped shop
    Scenario = 'WORLD_HUMAN_CLIPBOARD',                   -- scenario ped
    Coords = vector4(152.98, -1363.35, 29.33, 230.07),    -- location ped
    Distance = 2.5,                                       -- distance to require to use ped shop
    Blip = {Enable = true, Sprite = 184, Scale = 0.6, Color = 32},       -- blip setting

    -- item shop and prices 
    Store = {   
        {
            Title = 'Public Items',
            Items = {
                {item = 'camera_viewer',            price = 1500},
                {item = 'camera_citizen',           price = 500},
            }
        },    
        {
            Title = 'Job Items',
            Items = {
                {item = 'camera_pd',                price = 250,    job = {'police'}},
                {item = 'camera_ems',               price = 250,    job = {'ambulance'}},
                {item = 'camera_tablet',            price = 1000,   job = {'police', 'ambulance'}},
                {item = 'screwdriverset',           price = 250,    job = {'police', 'ambulance'}},
            }
        },   
        {
            Title = 'Personal Items',
            Items = {
                {item = 'camera_personal',          price = 500},  
                {item = 'camera_personaltablet',    price = 2000},  
            } 
        }
       
    }
}

-- props camera list only for jobs
Config.PropListJob = {     
    [1] = 'prop_cctv_cam_06a',
    [2] = 'prop_cctv_cam_04a',
    [3] = 'prop_cctv_cam_05a',
    [4] = 'prop_cctv_cam_02a',
    [5] = 'prop_cctv_cam_01a',
    [6] = 'prop_cctv_cam_07a',
    [7] = 'prop_cctv_cam_01b',
    [8] = 'prop_cctv_cam_04b',
    [9] = 'prop_cctv_cam_03a',
    [10] = 'prop_cctv_cam_04c',
    [11] = 'prop_cs_cctv',
    [12] = 'hei_prop_bank_cctv_01',
    [13] = 'hei_prop_bank_cctv_02',
    [14] = 'p_cctv_s',
    [15] = 'prop_snow_cam_03a',
    [16] = 'prop_spycam'
}

Config.DistanceCreateCam = {
    Jobs = 70.0,        -- max distance to put camera for job 
    SignalCam = 20.0,   -- max distance to put camera for normal players 
    PersonalCam = 40.0  -- max distance to put personal camera
}

-- wifi zones
Config.WifiZones = { 
    {
        Coords = vector3(29.66, -1345.06, 29.5),
        Distance = 10,
    }
}

-- sens to move camera (left, right..) when you watching
Config.Sens = {
    Right = 1,
    Left = 1,
    Up = 1,
    Down = 1
}

-- item and job can use this item
Config.JobItems = {
    {ItemName = 'camera_pd', Type = 'Job', Job = {'police', 'lssd'}},
    {ItemName = 'camera_ems', Type = 'Job', Job = 'ambulance'},
}

-- this for jobs if he not have tablet like (cctv) to open camera
Config.JobConnectLocations = {
    ['police'] = {
        Coords = vector3(440.71, -978.79, 29.69),
        Distance = 1
    }
}
