local zones = {}
if Config.Framework == "qb-core" or Config.Framework == "qbox" then
    local QBCore = exports[Config.Core.resource]:GetCoreObject()

    function Notification(notification, notificationType, duration)
        if Config.Notification == "ox" then
            lib.notify({
                description = notification,
                type = notificationType,
                position = 'center-right',
            })
        else
            TriggerEvent(Config.Core.name..':Notify', notification, notificationType, duration)
        end
    end

    function HasItem(item)
        if Config.Inventory == "ox" then
            return exports.ox_inventory:GetItemCount(item) > 0
        elseif Config.Inventory == "origen" then
            return exports.origen_inventory:HasItem(item)
        elseif Config.Inventory == "qs" then
            return exports['qs-inventory']:Search(item) > 0
        else
            return QBCore.Functions.HasItem(item)
        end
    end

    function EnableWeather()
        if Config.Weather == "cd" then
            TriggerEvent('cd_easytime:PauseSync', false)
        elseif Config.Weather == "av" then
            TriggerEvent('av_weather:freeze', false)
        else
            TriggerEvent(Config.Core.abbrev..'-weathersync:client:EnableSync')
        end
    end

    function DisableWeather()
        if Config.Weather == "cd" or Config.Weather == "renewed" then
            TriggerEvent('cd_easytime:PauseSync', true)
        elseif Config.Weather == "av" then
            TriggerEvent('av_weather:freeze', true)
        else
            TriggerEvent(Config.Core.abbrev..'-weathersync:client:DisableSync')
        end
    end

    function Progressbar(name, label, duration, success, fail, icon)
        if Config.Progressbar == "ox" then
            if lib.progressCircle({
                duration = duration,
                position = 'bottom',
                useWhileDead = false,
                label = label,
                canCancel = false,
                disable = {car = true},
                anim = {},
                prop = {},
            }) then success() else fail() end
        else
            QBCore.Functions.Progressbar(name, label, duration, false, false, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true
            }, {}, {}, {}, success, fail, icon)
        end
    end
elseif Config.Framework == "esx" then
    function Notification(notification, notificationType, duration)
        if Config.Notification == "ox" then
            lib.notify({
                description = notification,
                type = notificationType,
                position = 'center-right',
            })
        else
            TriggerEvent('esx:showNotification', notification, notificationType, duration)
        end
    end
    
    function HasItem(item)
        local p = promise.new()
        lib.callback('projectx-houserobbery:server:hasitem', false, function(result)
            p:resolve(result)
        end, item)
        return Citizen.Await(p)
    end
    
    RegisterNetEvent('projectx-houserobbery:client:PdNotify', function(coords)
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, 364)
        SetBlipScale(blip, 1.0)
        SetBlipColour(blip, 59)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("House Robbery")
        EndTextCommandSetBlipName(blip)
        SetTimeout(120000, function()
            RemoveBlip(blip)
        end)
    end)
    
    function EnableWeather()
        if Config.Weather == "cd" then
            TriggerEvent('cd_easytime:PauseSync', false)
        else
            TriggerEvent(Config.Core.abbrev..'-weathersync:client:EnableSync')
        end
    end

    function DisableWeather()
        if Config.Weather == "cd" then
            TriggerEvent('cd_easytime:PauseSync', true)
        else
            TriggerEvent(Config.Core.abbrev..'-weathersync:client:DisableSync')
        end
    end
    
    function Progressbar(name, label, duration, success, fail, icon)
        if lib.progressCircle({
            duration = duration,
            position = 'bottom',
            useWhileDead = false,
            label = label,
            canCancel = false,
            disable = {car = true},
            anim = {},
            prop = {},
        }) then success() else fail() end
    end
else

end

function CreateCircleZones(name, coords, event, icon, label, param, param2, param3, param4)
    if not Config.WorldInteract then
        if Config.Target == "ox_target" then
            exports.ox_target:addSphereZone({
                name = name,
                coords = coords,
                radius = 0.75,
                debug = Config.debug,
                drawSprite = true,
                options =
                {{
                    icon = icon,
                    label = label,
                    distance = 1.5,
                    onSelect = event,
                }}
            })
        else
            exports[Config.Target]:AddCircleZone(name, coords, 0.75, {name = name, debugPoly = Config.debug, useZ=true},
                {
                options = {
                    {
                        name = name,
                        type = "client",
                        action = event,
                        icon = icon,
                        label = label,
                        coords = coords,
                    }
                },
                distance = 1.5
            })
        end
    else
        exports.interact:AddInteraction({
            coords = coords,
            distance = 3.0,
            interactDst = 1.5, -- optional
            id = name, -- needed for removing interactions
            name = name, -- optional
            options = {
                {
                    label = label,
                    action = function()
                        TriggerEvent(event, param, param2, param3, param4)
                    end,
                },
            }
        })
    end
end

function CircleZoneDestroy(name)
    if Config.WorldInteract then return exports.interact:RemoveInteraction(name) end
    if Config.Target == "ox_target" then exports.ox_target:removeZone(name) else exports[Config.Target]:RemoveZone(name) end
end

function drawTextUi(bool, text)
    if Config.Drawtext == "OX" then
        if bool then lib.showTextUI(text) else lib.hideTextUI() end
    elseif Config.Drawtext == "QB" then
        if bool then exports[Config.Core.abbrev..'-core']:DrawText(text) else exports[Config.Core.abbrev..'-core']:HideText() end
    elseif Config.Drawtext == "OLDQB" then
        if bool then exports[Config.Core.abbrev..'-drawtext']:DrawText(text) else exports[Config.Core.abbrev..'-drawtext']:HideText() end    
    end
end

function zoneDestroy(name)
    for k, v in pairs(zones) do
        if v.name == name then
            zones[k]:remove() zones[k] = nil
        end
    end
end

function zoneCreate(name, coords, size, rotation, onEnter, onExit)
    zones[#zones + 1] = lib.zones.box({
        name = name,
        coords = coords,
        size = size,
        rotation = rotation,
        debug = Config.debug,
        onEnter = onEnter,
        onExit = onExit,
    })
end

function Evidence(chance)
    if math.random(1, 100) <= chance and not IsWearingHandshoes() then
        local pos = GetEntityCoords(PlayerPedId())
        TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
    end
end

function Stress(chance)
    TriggerServerEvent('hud:server:GainStress', chance)
end

function Dispatch()
    local coords = GetEntityCoords(PlayerPedId())
    if Config.Dispatch == "cd" then
        local data = exports['cd_dispatch']:GetPlayerInfo()
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = {'police', },
            coords = data.coords,
            title = '10-15 - House Robbery',
            message = 'A '..data.sex..' robbing a house at '..data.street,
            flash = 0,
            unique_id = data.unique_id,
            sound = 1,
            blip = {
                sprite = 431, 
                scale = 1.2, 
                colour = 3,
                flashes = false, 
                text = '911 - House Robbery',
                time = 5,
                radius = 0,
            }
        })
    elseif Config.Dispatch == "origen" then
        TriggerServerEvent("SendAlert:police", {
            coords = coords,
            title = 'House Robbery',
            type = 'GENERAL',
            message = 'House is being robbed',
            job = 'police',
        })
    elseif Config.Dispatch == "tk" then
        exports['tk_dispatch']:addCall({
            title = 'House Robbery',
            code = '10-58',
            priority = 'Priority 3',
            showLocation = true,
            showGender = true,
            playSound = true,
            blip = {
                color = 3,
                sprite = 357,
                scale = 1.0,
            },
            jobs = {'police'}
        })
    elseif Config.Dispatch == "rcore" then
        local player_data = exports['rcore_dispatch']:GetPlayerData()
        local data = {
            code = '10-35 House Robbery',
            default_priority = 'medium',
            coords = player_data.coords,
            job = 'police',
            text = 'House Robbery!',
            type = 'alert',
            blip_time = 5,
            blip = {
                sprite = 272, 
                colour = 3,
                scale = 0.7,
                text = 'House Robbery', 
                flashes = false,
                radius = 0,
            }
        }
        TriggerServerEvent('rcore_dispatch:server:sendAlert', data)
    elseif Config.Dispatch == "outlaw" then
        local data = {displayCode = '211', description = 'Robbery', isImportant = 0, recipientList = {'police'}, length = '10000', infoM = 'fa-info-circle', info = 'House Robbery'}
        local dispatchData = {dispatchData = data, caller = 'Alarm', coords = coords}
        TriggerEvent('wf-alerts:svNotify', dispatchData)
    elseif Config.Dispatch == "codem" then
        local Data = {
            type = 'Robbery',
            header = 'Robbery in progress',
            text = 'House Robbery in progress',
            code = '10-54',
        }
        exports['codem-dispatch']:CustomDispatch(Data)
    elseif Config.Dispatch == "qs" then
        exports['qs-dispatch']:HouseRobbery()
    elseif Config.Dispatch == "ps" then
        exports['ps-dispatch']:HouseRobbery()
    else
        if Config.Framework == "esx" then
            TriggerServerEvent('projectx-houserobbery:server:PdNotify')
            -- (ESX) Add your disptach script here if it's none of the above and remove the line above this one
        else
            -- (Qbcore) Add your disptach script here if it's none of the above
        end
    end
end

function Despawn(houseObj, house)
    DespawnInterior(houseObj, function() interior(house) end)
end

function CreateInterior(coords, house)
    return CreateHouseRobbery(coords, house)
end

function DoorUnlockSound()
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.25)
end

function AlarmSounds()
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "metaldetected", 0.1)
end

function CreateHouseRobbery(spawn, house)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": 1.46, "y": -10.33, "z": 1.06, "h": 0.39}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do Wait(10) end
	RequestModel("furnitured_midapart")
	while not HasModelLoaded("furnitured_midapart") do Wait(1000) end
	local house = CreateObject("furnitured_midapart", spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

------ Minigames ------
function LockpickIPLMinigame()
    local p = promise.new()
    local success = exports["bl_ui"]:CircleShake(1, 50, 2)
    p:resolve(success)
    return Citizen.Await(p)
end

function LockpickShell()
    local p = promise.new()
    local success = exports["bl_ui"]:CircleShake(1, 50, 2)
    p:resolve(success)
    return Citizen.Await(p)
end

function SearchingMinigameIPL()
    local p = promise:new()
    local success = lib.skillCheck({'easy', 'easy', 'medium', 'medium'}, {'w', 'a', 's', 'd'})
    p:resolve(success)
    return Citizen.Await(p)
end

function SearchingMinigameShell()
    local p = promise:new()
    local success = lib.skillCheck({'easy', 'easy', 'medium', 'medium'}, {'w', 'a', 's', 'd'})
    p:resolve(success)
    return Citizen.Await(p)
end

function SafecrackingMinigameIPL()
    local result = exports["pd-safe"]:createSafe({math.random(0, 99)})
    return result
end

------ Ped related functions and events ------
function CreatePeds(Coords)
    local RandomModel = Config.NPC["Models"][math.random(1, #Config.NPC["Models"])]
    RequestModel(RandomModel)
    while not HasModelLoaded(RandomModel) do Wait(0) end
    local ped = CreatePed(0, RandomModel, Coords.x, Coords.y, Coords.z, Coords.w, false, false)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, Config.NPC["Animation"], 0, true)
end

RegisterNetEvent('projectx-houserobbery:client:TalkWithNPC', function()
    local GlobalCooldown = lib.callback.await("projectx-houserobbery:server:CheckGlobalCooldown", false, function() end)
    if not GlobalCooldown then return Notification(Loc[Config.Lan].group["npc_time"], 'error', Config.NotificationDuration) end
    if Config.GlobalCooldown["Status"] then TriggerEvent("projectx-houserobbery:server:GlobalCooldown") end
    local Cooldown = lib.callback.await("projectx-houserobbery:server:cooldown", false, function() end)
    if not Cooldown then return Notification(Loc[Config.Lan].group["npc_time"], 'error', Config.NotificationDuration) end
    if Config.Framework ~= 'esx' then
        local wait = lib.callback.await("projectx-houserobbery:getOnlinePoliceCountQB", false)
        if not wait then return Notification(Loc[Config.Lan].error["cops"], 'error', Config.NotificationDuration) end
    else
        local wait = lib.callback.await("projectx-houserobbery:getOnlinePoliceCount", false)
        if not wait then return Notification(Loc[Config.Lan].error["cops"], 'error', Config.NotificationDuration) end
    end
    if not (GetClockHours() >= Config.TimeFrame.min or GetClockHours() <= Config.TimeFrame.max) then return Notification(Loc[Config.Lan].group["not_time"], 'error', Config.NotificationDuration) end
    if Config.GroupWork then
        TriggerServerEvent('projectx-houserobbery:server:GroupExports')
    else
        TriggerServerEvent("projectx-houserobbery:server:MarkHouseNonGroup")
    end
end)

----- Adding blip for non-group systems (Config.NPC["Status"] = true)
RegisterNetEvent('projectx-houserobbery:client:AddBlipForPlayerIPL', function(house)
    local blip = AddBlipForCoord(Config.IPL[house].DoorCoords.x, Config.IPL[house].DoorCoords.y, Config.IPL[house].DoorCoords.z)
    SetBlipSprite(blip, 364)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, 59)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Target House")
    EndTextCommandSetBlipName(blip)
    Wait(Config.AutomaticallyResetHouse * 60000)
    RemoveBlip(blip)
end)

RegisterNetEvent('projectx-houserobbery:client:AddBlipForPlayerShell', function(house)
    local blip = AddBlipForCoord(Config.Shells[house].coords.x, Config.Shells[house].coords.y, Config.Shells[house].coords.z)
    SetBlipSprite(blip, 364)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, 59)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Target House")
    EndTextCommandSetBlipName(blip)
    Wait(Config.AutomaticallyResetHouse * 60000)
    RemoveBlip(blip)
end)

RegisterNetEvent("projectx-houserobbery:client:setTime", function()
    NetworkOverrideClockTime(23, 0, 0)
end)

----- Client Side EXP Events (Only use this if Config.ServerSideEvents is false and your skill system has client sided functions)
RegisterNetEvent("projectx-houserobbery:client:AddExperience", function(exp)
    -- add exp function here and insert exp as a parameter
end)

function CheckExpLevel()
    -- Add "return" then add your check exp level function here
end

------ Commands ------
RegisterCommand('getshelloffset', function()
    lib.callback('projectx-houserobbery:CheckPerms', false, function(result)
        if not result then return Notification(Loc[Config.Lan].error["no_permission"], 'error', Config.NotificationDuration) end
        local pos = GetEntityCoords(PlayerPedId())
        for _, v in pairs(Config.Shells) do
            if #(pos - vector3(v["coords"]["x"], v["coords"]["y"], v["coords"]["z"])) <= 50.0 then
                local houseCoords = vector3(
                    v["coords"]["x"],
                    v["coords"]["y"],
                    v["coords"]["z"] - Config.MinZOffset
                )
                local xdist = pos.x - houseCoords.x
                local ydist = pos.y - houseCoords.y
                local zdist = pos.z - houseCoords.z
                print('X: '..xdist)
                print('Y: '..ydist)
                print('Z: '..zdist)
                break
            end
            Wait(10)
        end
    end)
end, false)

RegisterCommand('lockshell', function()
    lib.callback('projectx-houserobbery:CheckPerms', false, function(result)
        if not result then return Notification(Loc[Config.Lan].error["no_permission"], 'error', Config.NotificationDuration) end
        local pos = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.Shells) do
            if #(pos - vector3(v["coords"]["x"], v["coords"]["y"], v["coords"]["z"])) <= 10.0 then
                TriggerServerEvent('projectx-houserobbery-shell:server:ResetHouseStateTimer', k)
                break
            end
            Wait(50)
        end
    end)
end, false)

RegisterCommand('lockipl', function()
    lib.callback('projectx-houserobbery:CheckPerms', false, function(result)
        if not result then return Notification(Loc[Config.Lan].error["no_permission"], 'error', Config.NotificationDuration) end
        local pos = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.IPL) do
            if #(pos - vector3(v["DoorCoords"]["x"], v["DoorCoords"]["y"], v["DoorCoords"]["z"])) < 10.0 then
                TriggerServerEvent('projectx-houserobbery:server:ResetHouse', k)
                break
            end
            Wait(50)
        end
    end)
end, false)