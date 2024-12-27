-- Definition of the peds list.
local pedsList = {
    [0] = "MP_Plane_Passenger_1",
    [1] = "MP_Plane_Passenger_2",
    [2] = "MP_Plane_Passenger_3",
    [3] = "MP_Plane_Passenger_4",
    [4] = "MP_Plane_Passenger_5",
    [5] = "MP_Plane_Passenger_6",
    [6] = "MP_Plane_Passenger_7"
}

-- Definition of the different components types.
local ComponentsTypes = { 
    [0] = Config.Faces,
    [1] = Config.Masks,
    [2] = Config.Hairs,
    [3] = Config.Torsos,
    [4] = Config.Legs,
    [5] = Config.ParachuteBags,
    [6] = Config.Shoes,
    [7] = Config.Accessories,
    [8] = Config.Undershirts,
    [9] = Config.Kevlars,
    [10] = Config.Badges,
    [11] = Config.Torsos2s
}

-- Registering the triggering command.
-- RegisterCommand("start", function()
-- 	TriggerEvent('introCinematic:start')
-- end) 

---------------------------
-- Using ESX? Want to auto trigger it when you join a server? Simple replace:
-- RegisterNetEvent('introCinematic:start')
-- AddEventHandler('introCinematic:start', function()

-- With:
-- RegisterNetEvent('esx:playerLoaded')
-- AddEventHandler('esx:playerLoaded', function()

-- And don't forget to comment / remove the register command block! (Look above a bit)
---------------------------

-- Registering the cut scene event.
RegisterNetEvent("introCinematic:start")
AddEventHandler("introCinematic:start", function()
    PrepareMusicEvent("FM_INTRO_START")
    TriggerMusicEvent("FM_INTRO_START")

    if not DoesEntityExist(cache.ped) then
        print("Error: Player ped does not exist!")
        return
    end

    local model = GetEntityModel(cache.ped)
    local isMale = model == GetHashKey("mp_m_freemode_01")

    if isMale then
        RequestCutsceneWithPlaybackList("MP_INTRO_CONCAT", 31, 8)
    else
        RequestCutsceneWithPlaybackList("MP_INTRO_CONCAT", 103, 8)
    end

    local timeout = 5000 -- 5 seconds
    local startTime = GetGameTimer()
    while not HasCutsceneLoaded() do
        if GetGameTimer() - startTime > timeout then
            print("Error: Cutscene failed to load!")
            return
        end
        Wait(10)
    end

    if isMale then
        GeneratePed("MP_Male_Character", "MP_Female_Character", cache.ped)
    else
        GeneratePed("MP_Female_Character", "MP_Male_Character", cache.ped)
    end

    local peds = {}
    for pedIdx = 0, 6 do
        local model = (pedIdx == 1 or pedIdx == 2 or pedIdx == 4 or pedIdx == 6) and "mp_f_freemode_01" or "mp_m_freemode_01"
        peds[pedIdx] = CreatePed(26, model, -1117.77783203125, -1557.6248779296875, 3.3819, 0.0, false, false)

        if DoesEntityExist(peds[pedIdx]) and not IsEntityDead(peds[pedIdx]) then
            HandlePassengersClothes(peds[pedIdx], pedIdx)
            FinalizeHeadBlend(peds[pedIdx])
            RegisterEntityForCutscene(peds[pedIdx], pedsList[pedIdx], 0, 0, 64)
        end
    end

    NewLoadSceneStartSphere(-1212.79, -1673.52, 7, 1000, 0)
    SetWeatherTypeNow(Config.WeatherType)
    StartCutscene(4)

    Wait(31520)

    for pedIdx = 0, 6 do
        if DoesEntityExist(peds[pedIdx]) then
            DeleteEntity(peds[pedIdx])
        end
    end

    PrepareMusicEvent("AC_STOP")
    TriggerMusicEvent("AC_STOP")
end)


-- Generate main char ped!
function GeneratePed(modelString, modelString2, playerId)
	RegisterEntityForCutscene(0, modelString, 3, GetEntityModel(playerId), 0)
	RegisterEntityForCutscene(playerId, modelString, 0, 0, 0)
	SetCutsceneEntityStreamingFlags(modelString, 0, 1) 

	local ped = RegisterEntityForCutscene(0, modelString2, 3, 0, 64)

	NetworkSetEntityInvisibleToNetwork(ped, true)
end

-- Clear the peds props, all 8 of them.
function ClearPedProps(ped)
    for i = 0, 8, 1 do
        ClearPedProp(ped, i)
    end
end

-- Handle our randomly generated peds clothes.
function HandleRandomPeds(ped)
    SetPedRandomComponentVariation(ped, 0) 
    ClearPedProps(ped)
end

-- Handle our configured peds clothes.
function HandlePassengersClothes(ped, pedIdx)
    if Config.RandomPassengersClothes then
        if pedIdx >= 0 and pedIdx <= 6 then HandleRandomPeds(ped) end
    else
        for i = 0, 6, 1 do -- Loop through all peds.
            if pedIdx >= 0 and pedIdx <= 6 then -- Checkt he player idx.
                for j = 0, 11, 1 do -- Loop through all of the 11 components.
                    local component = ComponentsTypes[j] -- Get omponent config.
                    local numberOfTextures = GetNumberOfPedTextureVariations(ped, j, component[i])
                    local randomTexture = math.random(numberOfTextures)

                    SetPedComponentVariation(ped, j, component[i], randomTexture, 0)
                    ClearPedProps(ped)
                end
            end
        end
    end
end
