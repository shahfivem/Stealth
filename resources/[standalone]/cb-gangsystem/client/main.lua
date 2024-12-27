-- Declare Variables
QBCore = exports['qb-core']:GetCoreObject()
CurrentMission = nil
Translations = Translations
CreatedObjects = {} -- Table to store references to created objects
ZoneBlips = {}      -- Store the blip handles for each zone

--  ███████╗██╗   ██╗███╗   ██╗ ██████╗████████╗██╗ ██████╗ ███╗   ██╗███████╗
--  ██╔════╝██║   ██║████╗  ██║██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
--  █████╗  ██║   ██║██╔██╗ ██║██║        ██║   ██║██║   ██║██╔██╗ ██║███████╗
--  ██╔══╝  ██║   ██║██║╚██╗██║██║        ██║   ██║██║   ██║██║╚██╗██║╚════██║
--  ██║     ╚██████╔╝██║ ╚████║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║███████║
--  ╚═╝      ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
function SpawnGangTable(tableToSpawn)
    for k, v in pairs(Config.GangHideouts) do
        if k == tableToSpawn then
            RequestModel(v.model)
            while not HasModelLoaded(v.model) do
                Wait(500)
            end
            local created_object = CreateObject(v.model, v.crafting.x, v.crafting.y, v.crafting.z, false, false, false)
            PlaceObjectOnGroundProperly(created_object)
            SetEntityHeading(created_object, v.crafting.w)
            FreezeEntityPosition(created_object, true)
            SetModelAsNoLongerNeeded(v.model)
            -- Store the reference to the created object
            table.insert(CreatedObjects, created_object)
        end
    end
end

function SpawnOutsideBoxZones()
    local PlayerData = GetPlayerData()
    if PlayerData == nil then return end
    if PlayerData.gang.name == "none" or PlayerData.gang.name == nil then return end
    for k,v in pairs(Config.GangHideouts) do
        EntranceZone = lib.zones.box({
            coords = vector3(v.outsideCoords.x, v.outsideCoords.y, v.outsideCoords.z + 1), -- The center of the zone
            size = vector3(5, 5, 3),
            rotation = 0, -- Rotation of the zone
            debug = false, -- Debug mode, set to true to visualize the zone
            onEnter = function()
                ShowTextUI("[E] Enter Hideout")
            end,
            onExit = function()
                HideTextUI()
            end,
            inside = function()
                -- Check if the player presses the interaction key (E by default)
                if IsControlJustReleased(0, 38) then -- 38 is the control for "E"
                    local allowed = lib.callback.await('cb-gangsystem:server:AccessGangTable', false, v.zone)
                    if allowed == "Access Granted" then
                        TriggerEvent("cb-gangsystem:client:Teleport", v.insideCoords, k)
                        TriggerServerEvent("cb-gangsystem:server:EnterHideoutLog")
                        ZoneEnteredFrom = v.zone
                    elseif allowed == "Gang War" then
                        TriggerEvent('cb-gangsystem:client:Notify', "No Access",
                            "You are at war! Settle the beef first.", "error")
                    elseif allowed == "War Timeout" then
                        TriggerEvent('cb-gangsystem:client:Notify', "War Timeout", "Losing a war has its costs. Try again later.", "error")
                    elseif allowed == "Gang Timeout" then
                        TriggerEvent('cb-gangsystem:client:Notify', "No Access",
                            "Improve your standing with the Gods!", "error")
                    elseif allowed == "Home Turf Taken" then
                        TriggerEvent('cb-gangsystem:client:Notify', "No Access",
                            "Your Home Turf has been taken. Declare a new one or take it back!", "error")
                    else
                        TriggerEvent('cb-gangsystem:client:Notify', "No Access",
                            "You do not have access to this Gang Hideout! Declare it as your Home Turf and take it over to gain access!", "error")
                    end
                end
            end
        })
    end
    if Config.BlueprintCrafting and Config.UseDrawTextBlueprints then
        local PlayerData = GetPlayerData()
        if PlayerData == nil then return end
        local gangTag = PlayerData.gang.name
        for k, v in pairs(Config.BlueprintCraftingLocations) do
            CraftingZone = lib.zones.box({
                coords = vector3(v.coords.x, v.coords.y, v.coords.z + 1), -- The center of the zone
                size = vector3(5, 5, 3),
                rotation = 0, -- Rotation of the zone
                debug = false, -- Debug mode, set to true to visualize the zone
                onEnter = function()
                    if gangTag == "none" or gangTag == nil then return end
                    ShowTextUI("[E] Craft Blueprint")
                end,
                onExit = function()
                    HideTextUI()
                end,
                inside = function()
                    if gangTag == "none" or gangTag == nil then return end
                    -- Check if the player presses the interaction key (E by default)
                    if IsControlJustReleased(0, 38) then -- 38 is the control for "E"
                        if gangTag == nil or gangTag == "none" then
                            return
                        end
                        GangTableMenu("Blueprint")
                    end
                end
            })
        end
    end
end

function CraftItem(items, craftAmount, resultItem, recipeResultAmount, duration, label, dict, clip)
    if exports.erp_progressbar:taskBar({
        length = duration,
        text = "Crafting " .. label,
        animation = {
            dict = dict,
            anim = clip,
            stuck = true
        }
    }) == 100 then
        TriggerServerEvent('cb-gangsystem:server:Craft', items, craftAmount, resultItem, recipeResultAmount)
    end
end

function DrawText3D(coords, textInput, fontId, scale, id, lines, offset)
    local color = WorldText.Colors[id or 1]
    if not offset then
        offset = vector2(0.0, 0.0)
    end
    SetTextColour(255, 255, 255, color.a)
    SetTextScale(scale, scale)
    SetTextFont(fontId)
    SetTextCentre(true)
    SetDrawOrigin(coords.x, coords.y, coords.z, 0)
    SetScriptGfxAlignParams(offset.x, offset.y, 1.0, 1.0)
    BeginTextCommandWidth("STRING")
    AddTextComponentString(textInput)
    if not lines then lines = 1 end
    local height = GetTextScaleHeight(scale, fontId) * lines
    local width = EndTextCommandGetWidth(4)
    local padding = WorldText.Padding * scale
    SetTextEntry("STRING")
    AddTextComponentString(textInput)
    EndTextCommandDisplayText(0.0, 0.0)
    DrawRect(0.0, height * 0.6, width + padding, height + padding, color.r, color.g, color.b, 64)
    ClearDrawOrigin()
    ResetScriptGfxAlign()
end

local function CreateBodyguardPed()
    lib.requestModel(Config.Bodyguard.model, 5000)
    local ped = CreatePed(0, Config.Bodyguard.model, Config.Bodyguard.coords.x, Config.Bodyguard.coords.y,
        Config.Bodyguard.coords.z, Config.Bodyguard.coords.w, false, false)
    while not DoesEntityExist(ped) do Wait(1) end
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetPedCanPlayAmbientAnims(ped, true)
    TaskStartScenarioInPlace(ped, Config.Bodyguard.scenario, 0, true)
    TriggerEvent('cb-gangsystem:client:bodyguardTarget', ped)
    return ped
end

function MoveGangStorage()
    local label = Translations.info.moveGangStorage
    local message = Translations.info.moveGangStorageDesc
    TriggerEvent('cb-gangsystem:client:Notify', label, message, "error")
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            if IsControlJustPressed(0, 38) then -- "E" key
                local coords = GetEntityCoords(PlayerPedId())
                TriggerServerEvent('cb-gangsystem:server:changeStorageCoords', coords)
                break -- Exit the loop
            end
        end
    end)
end

function GetPeds(ignoreList)
    local pedPool = GetGamePool('CPed')
    local ignoreList = ignoreList or {}
    local peds = {}
    for i = 1, #pedPool, 1 do
        local found = false
        for j=1, #ignoreList, 1 do
            if ignoreList[j] == pedPool[i] then
                found = true
            end
        end
        if not found then
            peds[#peds+1] = pedPool[i]
        end
    end
    return peds
end

function CreateCapturePed(data)
    lib.requestModel(data.model, 5000)
    local ped = CreatePed(0, data.model, data.coords.x, data.coords.y, data.coords.z, data.coords.w, false, false)
    while not DoesEntityExist(ped) do Wait(1) end
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetPedCanPlayAmbientAnims(ped, true)
    TaskStartScenarioInPlace(ped, data.scenario, 0, true)
    if Config.CapturePed.UseBlip then
        local blip = AddBlipForEntity(ped)
        SetBlipSprite(blip, 88)
        SetBlipColour(blip, 1)
        SetBlipScale(blip, 1.0)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(data['blip'].name or "Franklin") -- Default to "Mission Ped" if not provided
        EndTextCommandSetBlipName(blip)
    end
    CaptureZone = lib.zones.box({
        coords = vector3(data.coords.x, data.coords.y, data.coords.z),
        size = vector3(5, 5, 2),
        rotation = 0,
        onEnter = function()
            local gangTag = GetPlayerData().gang.name
            if gangTag == "none" or gangTag == nil then return end
            ShowTextUI('[E] - Capture Rival')
        end,
        onExit = function()
            HideTextUI()
        end,
        inside = function()
            local gangTag = GetPlayerData().gang.name
            if gangTag == "none" or gangTag == nil then return end
            if IsControlJustPressed(1, 38) then
                local coords = data.coords
                local maxDistance = 3
                local nearbyPlayers = lib.getNearbyPlayers(coords, maxDistance, false)
                local closestPlayer = nil
                local minDistance = maxDistance
                for k, v in pairs(nearbyPlayers) do
                    local distance = #(coords - v.coords)
                    if distance < minDistance then
                        minDistance = distance
                        closestPlayer = v.id
                    end
                end
                if closestPlayer then
                    local capturer = GetPlayerData().source
                    TriggerServerEvent('cb-gangsystem:server:CapturePlayer', closestPlayer, capturer)
                end
            end
        end,
        debug = false
    })
end

--  ██╗  ██╗ █████╗ ███╗   ██╗██████╗ ██╗     ███████╗██████╗ ███████╗
--  ██║  ██║██╔══██╗████╗  ██║██╔══██╗██║     ██╔════╝██╔══██╗██╔════╝
--  ███████║███████║██╔██╗ ██║██║  ██║██║     █████╗  ██████╔╝███████╗
--  ██╔══██║██╔══██║██║╚██╗██║██║  ██║██║     ██╔══╝  ██╔══██╗╚════██║
--  ██║  ██║██║  ██║██║ ╚████║██████╔╝███████╗███████╗██║  ██║███████║
--  ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝
AddEventHandler('gameEventTriggered', function(event, data)
    if event == 'CEventNetworkEntityDamage' then
        local PlayerData = GetPlayerData()
        if PlayerData == nil then return end
        local gangTag = PlayerData.gang.name
        if Config.UsingPugPaintball and exports['pug-paintball']:IsInPaintball() then return end
        if gangTag ~= "none" and gangTag ~= "None" and gangTag ~= nil then
            local victim, attacker, victimDied, weapon = data[1], data[2], data[4], data[7]
            if IsEntityAPed(victim) then
                local coords = GetEntityCoords(PlayerPedId())
                local gangZone = exports['cb-gangsystem']:GetGangZonePlayer(coords)
                if gangZone ~= nil then
                    local playerNetworkID = NetworkGetPlayerIndexFromPed(victim)
                    local playerID = GetPlayerServerId(playerNetworkID)
                    
                    -- If the Player was killed do this....
                    if victimDied and NetworkGetPlayerIndexFromPed(victim) == PlayerId() and IsEntityDead(PlayerPedId()) then
                        local killerNetworkID = NetworkGetPlayerIndexFromPed(attacker)
                        local killerID = GetPlayerServerId(killerNetworkID)
                        TriggerServerEvent('cb-gangsystem:server:Vendetta', playerID, killerID, weapon, gangZone)

                    -- Else if the player killed a local do this....
                    elseif attacker == PlayerPedId() and not IsPedAPlayer(victim) and victimDied and Config.VendettaSystem.Locals then
                        TriggerServerEvent('cb-gangsystem:server:NPCKilled', playerID, weapon, gangZone)
                    end
                end
            end
        end
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    if Config.Debug then
        local leaderData = Config.GangLeader
        leaderData.entity = CreateGangLeader(leaderData)
        CreateCapturePed(Config.CapturePed)
        CreateBodyguardPed()
        for mission, data in pairs(Config.Missions) do
            if data['ped'] and data['ped'].onstart then
                data['ped'].entity = CreateMissionPed(mission, data)
            end
        end
        TriggerServerEvent('cb-gangsystem:server:loadGangStorage')
        TriggerServerEvent('cb-gangsystem:server:DrawGangZones', GetPlayerData().source)
        if GetPlayerData().metadata['gangHideout'] ~= 0 then
            SpawnGangTable(GetPlayerData().metadata['gangHideout'])
            TriggerEvent('cb-gangsystem:client:SpawnInsideZones')
        end
        SpawnOutsideBoxZones()
    end
    TriggerEvent('cb-gangsystem:client:checkLoyaltyTarget')
    TriggerEvent('cb-gangsystem:client:leaderZoneTarget')
    if Config.UseCheckLoyaltyCommand then
        RegisterCommand(Config.CheckLoyaltyCommand, function()
            local gangTag = PlayerData.gang.name
            if (gangTag == "none") then
                local notifyLabel = Translations.error.noGang
                local notifyMessage = Translations.error.noGangDesc
                TriggerEvent('cb-gangsystem:client:Notify', notifyLabel, notifyMessage, "error")
            else
                TriggerServerEvent('cb-gangsystem:server:checkLoyalty', PlayerData.source, "command")
            end
        end, false)
        TriggerEvent('chat:addSuggestion', '/' .. Config.CheckLoyaltyCommand, Translations.commands.help.viewGangTurfs, {})
        RegisterKeyMapping(Config.CheckLoyaltyCommand, Translations.commands.help.checkLoyalty, 'keyboard',
            Config.CheckLoyaltyKeybind)
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    local leaderData = Config.GangLeader
    if DoesEntityExist(leaderData.entity) then
        DeleteEntity(leaderData.entity)
    end
    for _, data in pairs(Config.Missions) do
        if data['ped'] and DoesEntityExist(data['ped'].entity) then
            DeleteEntity(data['ped'].entity)
        end
    end
end)

--  ███████╗██╗   ██╗███████╗███╗   ██╗████████╗███████╗
--  ██╔════╝██║   ██║██╔════╝████╗  ██║╚══██╔══╝██╔════╝
--  █████╗  ██║   ██║█████╗  ██╔██╗ ██║   ██║   ███████╗
--  ██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║╚██╗██║   ██║   ╚════██║
--  ███████╗ ╚████╔╝ ███████╗██║ ╚████║   ██║   ███████║
--  ╚══════╝  ╚═══╝  ╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝
RegisterNetEvent('cb-gangsystem:client:redrawZones')
AddEventHandler('cb-gangsystem:client:redrawZones', function(turfControllers, GangData)
    DrawPolyZonesForZones(turfControllers, GangData)
end)

RegisterNetEvent('cb-gangsystem:client:CompleteMission', function(zone)
    TriggerServerEvent('cb-gangsystem:server:CompleteMission', MissionData, zone)
end)

RegisterNetEvent('cb-gangsystem:client:Captured', function()
    -- Fade out the screen to black
    DoScreenFadeOut(1000) -- 1 second fade out
    while not IsScreenFadedOut() do
        Wait(100)
    end

    -- Get random teleport location from the config
    local teleportLocations = Config.CapturePed.teleportLocations
    local randomIndex = math.random(1, #teleportLocations)
    local randomLocation = teleportLocations[randomIndex]

    -- Get the player's ped and teleport them to the random location
    local playerPed = PlayerPedId()
    SetEntityCoords(playerPed, randomLocation.x, randomLocation.y, randomLocation.z, false, false, false, true)
    SetEntityHeading(playerPed, randomLocation.h)

    -- Wait for 5 seconds while the screen is black
    Wait(5000)

    -- Play a "getting up" animation
    RequestAnimDict("get_up@directional@movement@from_knees@injured")
    --RequestAnimDict("mp_arrest_get_up_dir@right")

    while not HasAnimDictLoaded("get_up@directional@movement@from_knees@injured") do
        Wait(100)
    end
    TaskPlayAnim(playerPed, "get_up@directional@movement@from_knees@injured", "getup_l_0", 8.0, -8.0, -1, 2, 0, false, false, false)

    -- Fade the screen back in
    DoScreenFadeIn(1000) -- 1 second fade in
    while not IsScreenFadedIn() do
        Wait(100)
    end

    Wait(3000)

    -- Clear the animation task (stop playing animation)
    ClearPedTasksImmediately(playerPed)
end)

RegisterNetEvent('cb-gangsystem:client:SpawnInsideZones', function()
    local PlayerData = GetPlayerData()
    if PlayerData == nil then return end
    local gangHideout = PlayerData.metadata["gangHideout"]
    for k, v in pairs(Config.GangHideouts) do
        if gangHideout and gangHideout == k then
            -- Create the crafting zone
            GangCraftingZone = lib.zones.box({
                coords = vector3(v.crafting.x, v.crafting.y, v.crafting.z + 1), -- The center of the zone
                size = vector3(5, 5, 2),
                rotation = 0, -- Rotation of the zone
                debug = false, -- Debug mode, set to true to visualize the zone
                onEnter = function()
                    ShowTextUI("[E] Access Gang Table")
                end,
                onExit = function()
                    HideTextUI()
                end,
                inside = function()
                    if IsControlJustReleased(0, 38) then -- 38 is the control for "E"
                        GangTableMenu(v.type)
                    end
                end
            })

            ExitHideoutZone = lib.zones.box({
                coords = vector3(v.insideCoords.x, v.insideCoords.y, v.insideCoords.z), -- The center of the zone
                size = vector3(2, 2, 2),
                rotation = 0, -- Rotation of the zone
                debug = false, -- Debug mode, set to true to visualize the zone
                onEnter = function()
                    ShowTextUI("[E] Exit Hideout")
                end,
                onExit = function()
                    HideTextUI()
                end,
                inside = function()
                    if IsControlJustReleased(0, 38) then -- 38 is the control for "E"
                        for key, value in pairs(Config.GangHideouts) do
                            if key == gangHideout then
                                TriggerEvent("cb-gangsystem:client:Teleport", value.outsideCoords, 0)
                                TriggerEvent("cb-gangsystem:client:LeaveHideout")
                            end
                        end
                    end
                end
            })
        end
    end
end)

RegisterNetEvent('cb-gangsystem:client:Teleport', function(args, bucket)
    DoScreenFadeOut(500)
    Wait(1000)
    SetEntityCoords(PlayerPedId(), args.x, args.y, args.z, false, false, false, false)
    TriggerServerEvent('cb-gangsystem:server:SetRoutingBucket', bucket)
    for k, v in pairs(Config.GangHideouts) do
        if bucket == k then
            SpawnGangTable(k)
        end
    end
    DoScreenFadeIn(500)
end)

RegisterNetEvent('cb-gangsystem:client:TeleportNoBucket', function(args)
    DoScreenFadeOut(500)
    Wait(1000)
    SetEntityCoords(PlayerPedId(), args.x, args.y, args.z, false, false, false, false)
    DoScreenFadeIn(500)
end)

RegisterNetEvent('cb-gangsystem:client:setWaypoint', function(coords)
    SetNewWaypoint(coords.x, coords.y)
end)

RegisterNetEvent('cb-gangsystem:client:LeaveHideout')
AddEventHandler('cb-gangsystem:client:LeaveHideout', function()
    DeleteCreatedObjects()
    CraftingZone:remove()
    ExitHideoutZone:remove()
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    local leaderData = Config.GangLeader
    leaderData.entity = CreateGangLeader(leaderData)
    CreateCapturePed(Config.CapturePed)
    TriggerEvent('cb-gangsystem:client:leaderZoneTarget')
    for mission, data in pairs(Config.Missions) do
        if data['ped'] and data['ped'].onstart then
            data['ped'].entity = CreateMissionPed(mission, data)
        end
    end
    CreateBodyguardPed()
    local CurrentMission = lib.callback.await('cb-gangsystem:server:GetCurrentMission', false)
    if CurrentMission then
        TriggerEvent('cb-gangsystem:client:StartMission', CurrentMission)
    end
    PlayerData = GetPlayerData()
    local gangTag = PlayerData.gang.name or nil
    if Config.OptionalNotifications.NotInGang then
        if gangTag == "none" or gangTag == nil then
            TriggerEvent('cb-gangsystem:client:Notify', Translations.info.noGang, Translations.info.noGangDesc, "info")
        end
    end
    if gangTag ~= nil and gangTag ~= "none" then
        local exists = lib.callback.await('cb-gangsystem:server:DoesGangExist', false, gangTag)
        if exists then
            if Config.UseOxRadialMenu then
                RegisterRadialMenu()
            end
            local gangRank = PlayerData.gang.grade.level
            TriggerServerEvent('cb-gangsystem:server:CheckForInvalidRank', PlayerData.citizenid, gangTag, gangRank)
            TriggerServerEvent('cb-gangsystem:server:UpdateLastActive', gangTag)
        else
            TriggerServerEvent('cb-gangsystem:server:PlayerGangNoExist')
        end
    end
    if Config.UseCheckLoyaltyCommand then
        RegisterCommand(Config.CheckLoyaltyCommand, function()
            local PlayerData = GetPlayerData()
            if (gangTag == "none") then
                local notifyLabel = Translations.error.noGang
                local notifyMessage = Translations.error.noGangDesc
                TriggerEvent('cb-gangsystem:client:Notify', notifyLabel, notifyMessage, "error")
            else
                TriggerServerEvent('cb-gangsystem:server:checkLoyalty', PlayerData.source, "command")
            end
        end, false)
        TriggerEvent('chat:addSuggestion', '/' .. Config.CheckLoyaltyCommand, Translations.commands.help.viewGangTurfs, {})
        RegisterKeyMapping(Config.CheckLoyaltyCommand, Translations.commands.help.checkLoyalty, 'keyboard', Config.CheckLoyaltyKeybind)
    end
    TriggerEvent('cb-gangsystem:client:checkLoyaltyTarget')
    TriggerServerEvent('cb-gangsystem:server:DrawGangZones', PlayerData.source)
    TriggerServerEvent('cb-gangsystem:server:loadGangStorage')
    if Config.BlueprintCrafting then
        for k, v in pairs(Config.BlueprintCraftingLocations) do
            if v.spawnProp then
                Citizen.CreateThread(function()
                    RequestModel(v.model)
                    local iter_for_request = 1
                    while not HasModelLoaded(v.model) and iter_for_request < 5 do
                        Wait(500)
                        iter_for_request = iter_for_request + 1
                    end
                    if not HasModelLoaded(v.model) then
                        SetModelAsNoLongerNeeded(v.model)
                    else
                        local created_object = CreateObjectNoOffset(v.model, v.coords.x, v.coords.y, v.coords.z, 1, 0, 1)
                        PlaceObjectOnGroundProperly(created_object)
                        SetEntityHeading(created_object, v.coords.w)
                        FreezeEntityPosition(created_object, true)
                        SetModelAsNoLongerNeeded(v.model)
                    end
                end)
            end
        end
    end
    if GetPlayerData().metadata['gangHideout'] ~= 0 then
        SpawnGangTable(GetPlayerData().metadata['gangHideout'])
        TriggerEvent('cb-gangsystem:client:SpawnInsideZones')
    end
    SpawnOutsideBoxZones()
end)

RegisterNetEvent('cb-gangsystem:client:CheckMission', function()
    local CurrentMission = lib.callback.await('cb-gangsystem:server:GetCurrentMission', false)
    if CurrentMission then
        TriggerServerEvent('cb-gangsystem:server:CheckMission', CurrentMission)
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    local leaderData = Config.GangLeader
    if DoesEntityExist(leaderData.entity) then
        DeleteEntity(leaderData.entity)
    end
    for _, data in pairs(Config.Missions) do
        if data['ped'] and DoesEntityExist(data['ped'].entity) then
            DeleteEntity(data['ped'].entity)
        end
    end
end)

RegisterNetEvent('cb-gangsystem:client:StartMission', function(mission)
    CurrentMission = mission
    if Config.Missions[CurrentMission] then
        if Config.Missions[CurrentMission]['ped'] and not Config.Missions[CurrentMission]['ped'].onstart then
            Config.Missions[CurrentMission]['ped'].entity = CreateMissionPed(CurrentMission, Config.Missions[CurrentMission])
        end
    end
end)

RegisterNetEvent('cb-gangsystem:client:FinishMission', function()
    CurrentMission = nil
end)

RegisterNetEvent('cb-gangsystem:client:OpenUI', function(GangData, count, prevalenceStars)
    local PlayerData = GetPlayerData()
    if PlayerData == nil then return end
    local gangTag = PlayerData.gang.name
    if gangTag == "none" or gangTag == nil then
        TriggerEvent('cb-gangsystem:client:Notify', Translations.info.noGang, Translations.info.noGangDesc, "info")
        return
    end
    local gangID = GetGangID(GangData, gangTag)
    local gangName = GangData[gangID].name
    local GangStatus = "Active / Good Standing"
    local home_turf = GangData[gangID].home_turf
    local data = GangData[gangID]
    local gradeName = nil
    if home_turf == nil or home_turf == "None" then
        home_turf = "No Home Turf"
    elseif home_turf ~= "Taken" then
        home_turf = exports['cb-gangsystem']:GetTurfName(GangData[gangID].home_turf)
    end
    if GangData[gangID].penalty == 1 then
        GangStatus = "Gang Timeout"
    end
    if data then
        local rankNames = Split(data.ranks, ',')
        local rankCount = #rankNames

        -- Ensure the grade level is within the range of available ranks
        local gradeLevel = PlayerData.gang.grade.level
        local gradeIndex = tonumber(gradeLevel)
        if gradeIndex and gradeIndex >= 0 and gradeIndex < rankCount then
            gradeName = rankNames[gradeIndex + 1]
        end
    end
    local gangImage = string.format("../logos/%s.png", GangData[gangID].tag)
    SendNUIMessage({
        type = 'openUI',
        gangName = gangName,
        gangStatus = GangStatus,
        homeTurf = home_turf,
        gradeName = gradeName,
        gangImage = gangImage,
        count = count,
        prevalenceStars = prevalenceStars
    })
    SetNuiFocus(true, true)
end)

RegisterNUICallback('releaseFocus', function(data, cb)
    cb({})
    SetNuiFocus(false, false)
end)

RegisterNUICallback('showGangHelpMenu', function(data, cb)
    cb({})
    SetNuiFocus(false, false)
    OpenHelpMenu()
end)

--  ████████╗██╗  ██╗██████╗ ███████╗ █████╗ ██████╗ ███████╗
--  ╚══██╔══╝██║  ██║██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔════╝
--     ██║   ███████║██████╔╝█████╗  ███████║██║  ██║███████╗
--     ██║   ██╔══██║██╔══██╗██╔══╝  ██╔══██║██║  ██║╚════██║
--     ██║   ██║  ██║██║  ██║███████╗██║  ██║██████╔╝███████║
--     ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝

local lastGunShotTime = 0
local lastRecklessDrivingTime = 0
AddEventHandler('CEventGunShot', function(entities, eventEntity, args)
    local currentTime = GetGameTimer() -- Get current game time in milliseconds
    if currentTime - lastGunShotTime < 30000 then
        return
    end
    if eventEntity == PlayerPedId() then
        -- Update the last event time
        lastGunShotTime = currentTime
        local gangName = GetPlayerData().gang.name
        if gangName == "none" or gangName == "None" or gangName == nil then
            return
        end
        local coords = GetEntityCoords(cache.ped)
        local zone = exports['cb-gangsystem']:GetGangZonePlayer(coords)
        local isCommunityTurf = exports['cb-gangsystem']:IsCommunityTurf(zone)
        if isCommunityTurf then
            TriggerServerEvent('cb-gangsystem:server:decreasePrevalence', gangName, "Shooting Community Turf")
        else
            TriggerServerEvent('cb-gangsystem:server:decreasePrevalence', gangName, "Shooting")
        end
    end
end)

AddEventHandler('CEventShockingDrivingOnPavement', function(entities, eventEntity, args)
    if Config.RecklessDrivingChance == 0 then return end
    local chance = math.random(1, 100)
    if chance <= Config.RecklessDrivingChance then
        return
    end
    local gangName = GetPlayerData().gang.name
    if gangName == "none" or gangName == "None" or gangName == nil then
        return
    end
    local currentTime = GetGameTimer() -- Get current game time in milliseconds
    if currentTime - lastRecklessDrivingTime < 30000 then
        return
    end
    lastRecklessDrivingTime = currentTime
    local gangName = GetPlayerData().gang.name
    TriggerServerEvent('cb-gangsystem:server:decreasePrevalence', gangName, "Reckless Driving")
end)

--[[ You could also use this instead to check when a Player shoots a weapon. Although it's less optimized.

local weaponCheckActive = false
local shotCount = 0  -- Initialize a counter for shots
CreateThread(function()
    while true do
        local hasWeapon, weaponHash = GetCurrentPedWeapon(cache.ped, true)
        if hasWeapon then
            weaponCheckActive = true
            while weaponCheckActive do
                local weaponGroup = GetWeapontypeGroup(weaponHash)
                if weaponGroup == 860033945 or weaponGroup == 3082541095 then -- Check if Shotgun or Sniper
                    if IsPedShooting(cache.ped) then
                        local coords = GetEntityCoords(cache.ped)
                        local zone = exports['cb-gangsystem']:GetGangZonePlayer(coords)
                        local isCommunityTurf = exports['cb-gangsystem']:IsCommunityTurf(zone)
                        local gangName = GetPlayerData().gang.name
                        if isCommunityTurf then
                            TriggerServerEvent('cb-gangsystem:server:decreasePrevalence', gangName, "Shooting Community Turf")
                        else
                            TriggerServerEvent('cb-gangsystem:server:decreasePrevalence', gangName, "Shooting")
                        end
                        shotCount = 0  -- Reset the shot counter
                    end
                else
                    if IsPedShooting(cache.ped) then
                        shotCount = shotCount + 1  -- Increment the shot counter
                        if shotCount >= 5 then
                            local coords = GetEntityCoords(cache.ped)
                            local zone = exports['cb-gangsystem']:GetGangZonePlayer(coords)
                            local isCommunityTurf = exports['cb-gangsystem']:IsCommunityTurf(zone)
                            local gangName = GetPlayerData().gang.name
                            if isCommunityTurf then
                                TriggerServerEvent('cb-gangsystem:server:decreasePrevalence', gangName, "Shooting Community Turf")
                            else
                                TriggerServerEvent('cb-gangsystem:server:decreasePrevalence', gangName, "Shooting")
                            end
                            shotCount = 0  -- Reset the shot counter
                        end
                    end
                end
                Citizen.Wait(1)  -- Adjust the wait time based on performance needs
            end
        else
            weaponCheckActive = false
        end
        Citizen.Wait(15000)  -- Adjust this wait time to suit your needs
    end
end)
]]