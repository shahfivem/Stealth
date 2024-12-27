local objectHandle = nil
local entityhealth = -1111
local isfreeze = false 
local Status = "playerx"
local Lobbys = {}
local LobbysIdx = nil
local LobbyName = nil
local mapid = 1
local time = 25
local playingHideAndSeek = false
local totalMapx = 0
local tour = 0
local mteam = "red"
local timeri = 0
local mytimer = 0
local you = 3000
local warningCoords = vector3(-1466.3849, 6769.4775, 7.0181)
local WarningDistance = 50
local waiterdeather = false 
local deadAnimDict = 'mp_sleep'
local deadAnim = 'bind_pose_180'
local newfunc = false
local funcActive = false

Citizen.CreateThread(function()
    activeBlip()
    totalMap()
	while true do
		local sleep = 1500
		local playercoord = GetEntityCoords(PlayerPedId())
		    local dst = #(playercoord - vector3(Config.Coords.x,Config.Coords.y,Config.Coords.z))
            if dst < Config.Distance then 
				sleep = 1
                if Config.drawtextorfloating == "drawtext" then
				    DrawText3D(Config.Coords.x, Config.Coords.y, Config.Coords.z, Config.Langs["OpenMenu"])
                else 
                    ShowFloatingHelpNotification(Config.Langs["OpenMenu"], Config.Coords,4)
                end
                if IsControlJustReleased(0,38) then
                    TriggerServerEvent("BakiTelli_hideandseek:getPlayerDetails")
                    isUI("main")
                end
            end
        Citizen.Wait(sleep)
	end
end)

function activeBlip()
    if Config.Blips.Blip then
        local blip = AddBlipForCoord(Config.Coords.x, Config.Coords.y, Config.Coords.z)
        SetBlipSprite(blip, Config.Blips.sprite)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, Config.Blips.scale)
        SetBlipColour(blip, Config.Blips.color)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.Blips.Name)
        EndTextCommandSetBlipName(blip)
    end
end

function isUI(typ)
    if typ == "main" then 
        tour = 0
        SetNuiFocus(true, true) 
    end
   SendNUIMessage({
    action = "open",
    typ = typ,
   }) 
end

local function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end


function Update(typ, detail)
    SendNUIMessage({
        action = "update",
        typ = typ,
        detail= detail 
    })
end

RegisterNUICallback("close", function ()
    SetNuiFocus(false, false) 
    if Status == "owner" and playingHideAndSeek == false then
        Status = "playerx"
        TriggerServerEvent("BakiTelli_hideandseek:KickAllLobby", LobbyName, true)
        time = 25 
        mapid = 1
    elseif Status == "player" and playingHideAndSeek == false then
        Status = "playerx"
        TriggerServerEvent("BakiTelli_hideandseek:exitLobby", LobbyName)
        time = 25 
        mapid = 1
    end
end)

AddEventHandler("BakiTelli_hideandseek:cl:getPlayerDetails")
RegisterNetEvent("BakiTelli_hideandseek:cl:getPlayerDetails", function (Details, l_lobbys)
    Update("MainPlayerDetails", Details)
    Lobbys = l_lobbys
    addLobby()
end)

local xxs = 0
function addLobby()
    xxs = 0
    for k, v in pairs(Lobbys) do
        xxs = xxs + 1
        decode = json.decode(v)
        SendNUIMessage({
            action = "loadLobby",
            password = decode.password,
            name = decode.name,
            xxs = xxs,
            password_no = decode.password_no,
            mapid = Config.Maps[decode.mapid].MapName,
            time = decode.time,
        })
    end
end

RegisterNUICallback("NewLobby", function (data)
    SendNUIMessage({
        action = "timer"
    })    
    if data.password then 
            Password = tonumber(data.password)
            CreateLobby(Password)
        else
            CreateLobby("NoPassword") 
    end
end)

function CreateLobby(p)
    LobbyName = RandomName()    
    if p == nil or p == "" then 
        TriggerServerEvent("BakiTelli_hideandseek:NewLobby", p, false, LobbyName, mapid, time)
    else 
        TriggerServerEvent("BakiTelli_hideandseek:NewLobby", p, true, LobbyName, mapid, time)
    end
    mapUpdate()
    TimeUpdate()
    TriggerServerEvent("BakiTelli_hideandseek:checkTeam", LobbyName, "red", 1)
    Status = "owner"
    checkPermission()
end

function mapUpdate()
    SendNUIMessage({
        action = "mapupdate",
        name = LobbyName,
        LobbyName = Config.Maps[mapid].MapName,
        LobbyImg = Config.Maps[mapid].map_img,
        LobbyInformation = Config.Maps[mapid].information,
    })
end

function TimeUpdate()
    SendNUIMessage({
        action = "timeupdate",
        time = 20,
    })
end

function RandomName()
    local code = Config.Namep.."#"
    for i = 1, Config.NameNumber do
      code = code .. tostring(math.random(0, 9))
    end
  return code
end

AddEventHandler("BakiTelli_hideandseek:cl:closeMenu")
RegisterNetEvent("BakiTelli_hideandseek:cl:closeMenu", function (lb)
    playingHideAndSeek = false
    if lb then 
        SendNUIMessage({
            action = "closeAllMenu",
        })
        Status = "playerx"
    end
end)

AddEventHandler("BakiTelli_hideandseek:cl:TimeEdit")
RegisterNetEvent("BakiTelli_hideandseek:cl:TimeEdit", function (lb, k, timex)
    Lobbys = lb 
    LobbysIdx = tonumber(k)    
    time = tonumber(timex)
    TimeUpdate()
end)

AddEventHandler("BakiTelli_hideandseek:cl:UpdatePlayers")
RegisterNetEvent("BakiTelli_hideandseek:cl:UpdatePlayers", function (lb, k)
        SendNUIMessage({
            action = "playersDefault",
            typ = "reset",
        })
        Citizen.Wait(250)
        Lobbys = lb 
        LobbysIdx = tonumber(k)
        playersUpdate()
end)

function playersUpdate()
    local decodedData = json.decode(Lobbys[LobbysIdx])
    local players = decodedData.players
    SendNUIMessage({
        action = "update-teamp",
        red = decodedData.red,
        blue = decodedData.blue, 
    })
    for team, teamData in pairs(players) do
        for num, value in pairs(teamData) do
            if decodedData.players[team][num] == 9999 then else 
                TriggerServerEvent("BakiTelli_hideandseek:getProfile", decodedData.players[team][num], team, num)
            end
        end
    end
end

AddEventHandler("BakiTelli_hideandseek:cl:getProfile")
RegisterNetEvent("BakiTelli_hideandseek:cl:getProfile", function (src, name, profile, team, num)
    SendNUIMessage({
            action = "playersDefault",
            typ = "add",
            src = src, 
            name = name,
            profile = profile, 
            team = team,
            num = num
        })
end)

function checkPermission()
    if Status == "owner" then
        SendNUIMessage({
            action = "perm",
            tx = "owner"
        })
    else 
        SendNUIMessage({
            action = "perm",
            tx = "player"
        })
    end
end

RegisterNUICallback("LoginTeam", function (data)
    SendNUIMessage({
        action = "timer"
    })
    team = data.team 
    num = tonumber(data.num)
    LoginTeam(team,num)
end)

RegisterNUICallback("LoginLobby", function (data)
    LobbyName = data.name
    TriggerServerEvent("BakiTelli_hideandseek:LoginLobby", data.name)
end)

function LoginTeam(team, num)
    TriggerServerEvent("BakiTelli_hideandseek:checkTeam",LobbyName, team, num)
    TriggerServerEvent("BakiTelli_hideandseek:TimeEdit",20, LobbyName)
end

RegisterNUICallback("Time", function (data)
    timrex = tonumber(data.time)
    if data.typ == "add" then 
            timre = timrex + time
        elseif data.typ == "remove" then 
            timre = time -timrex
        else 
            timre = timrex
    end
    if timre <= 1 then 
        timre = 1
    elseif timre >= 30 then 
        timre = 30
    end
    if Status == "owner" then 
        TriggerServerEvent("BakiTelli_hideandseek:TimeEdit",timre, LobbyName)
    end
end)

RegisterNUICallback("Previous", function ()
    SendNUIMessage({
        action = "timer"
    })    
    if Status == "owner" then
        SendNUIMessage({
            action = "timer"
        })
        if 1 == mapid then
            mapid = totalMapx
        else 
            mapid = mapid-1
        end
        TriggerServerEvent("BakiTelli_hideandseek:MapUpdate", tonumber(mapid), LobbyName)
    end
end)

RegisterNUICallback("Next", function ()
    SendNUIMessage({
        action = "timer"
    })    
    if Status == "owner" then
        SendNUIMessage({
            action = "timer"
        })
        if totalMapx == mapid then
            mapid = 1
        else 
            mapid = mapid+1
        end
        TriggerServerEvent("BakiTelli_hideandseek:MapUpdate", tonumber(mapid), LobbyName)
    end
end)

function totalMap()
    totalMapx = 0
    for k, v in pairs(Config.Maps) do
        totalMapx = totalMapx + 1
    end
end

AddEventHandler("BakiTelli_hideandseek:cl:UpdateMap")
RegisterNetEvent("BakiTelli_hideandseek:cl:UpdateMap", function (lb, k, mid)
    Lobbys = lb 
    LobbysIdx = tonumber(k)    
    mapid = mid
    mapUpdate()
end)

RegisterNUICallback("showLobby", function (data)
    n = data.name
    ix = getLobbyId(n) 
    decodedData = json.decode(Lobbys[ix])
    mname = Config.Maps[tonumber(decodedData.mapid)].MapName
    minfo = Config.Maps[tonumber(decodedData.mapid)].information
    mimg = Config.Maps[tonumber(decodedData.mapid)].map_img
    mn = decodedData.name
    time = tonumber(decodedData.time)
    TimeUpdate()
    mapUpdate()
    SendNUIMessage({
        action = "mapupdate",
        LobbyName = mname,
        name = mn, 
        LobbyInformation = minfo, 
        LobbyImg = mimg,
    })
end)

function getLobbyId(lobbyname)
    for k,v in pairs(Lobbys) do
        decode = json.decode(v)
        if decode.name == lobbyname then 
            return tonumber(k)
        end
    end
end

RegisterNUICallback("LoginLobby", function (data)
    LobbyName = data.name
    TriggerServerEvent("BakiTelli_hideandseek:LoginLobby", data.name)
end)

AddEventHandler("BakiTelli_hideandseek:cl:Login")
RegisterNetEvent("BakiTelli_hideandseek:cl:Login", function (tm,mi, ps)
    if ps == "password" then 
        SendNUIMessage({
            action = "loginpassword",
        })
    else
        TriggerServerEvent("BakiTelli_hideandseek:getPlayers", LobbyName)
        SendNUIMessage({
            action = "get-px",
          })
        Status = "player"
          time = tonumber(tm)
          mapid = tonumber(mi)
          TimeUpdate()
          mapUpdate()
          checkPermission()
    end
end)


RegisterNUICallback("checkPassword", function (data)
    pw = tonumber(data.password)
    TriggerServerEvent("BakiTelli_hideandseek:checkPassword", pw , LobbyName)
end)

AddEventHandler("BakiTelli_hideandseek:cl:enterPw")
RegisterNetEvent("BakiTelli_hideandseek:cl:enterPw", function (lgn, tm, mi)
    if lgn then 
        TriggerServerEvent("BakiTelli_hideandseek:getPlayers", LobbyName)
        SendNUIMessage({
            action = "get-px",
          })
        Status = "player"
        time = tonumber(tm)
        mapid = tonumber(mi)
          TimeUpdate()
          mapUpdate()
          checkPermission()
    else
        SendNUIMessage({
            action = "closeAllMenu"
        })
        notify(Config.Langs["password"])
    end
end)

RegisterNUICallback("Disband", function ()
        TriggerServerEvent("BakiTelli_hideandseek:KickAllLobby", LobbyName, true)
end)

RegisterNUICallback("Start", function ()
    if Status == "owner" then 
        TriggerServerEvent("BakiTelli_hideandseek:StartGame", LobbyName)
    end
end)

AddEventHandler("BakiTelli_hideandseek:TimeStart")
RegisterNetEvent("BakiTelli_hideandseek:TimeStart", function (lgn, tm,feture)
    timeri = tonumber(lgn) + 25
    mytimer = tonumber(lgn) + 25
    lobbyid = getLobbyId(tm) 
    local decodedData = json.decode(Lobbys[lobbyid])
    decodedData.starttime = feture
    Lobbys[lobbyid] = json.encode(decodedData)
end)

AddEventHandler("BakiTelli_hideandseek:cl:StartGame")
RegisterNetEvent("BakiTelli_hideandseek:cl:StartGame", function (teami, slot)
    id = getLobbyId(LobbyName)
    decode = json.decode(Lobbys[id])
    mteam = teami
	warningCoords = Config.Maps[tonumber(decode.mapid)].Area 
    WarningDistance = Config.Maps[tonumber(decode.mapid)].Distance 
    playingHideAndSeek = true
    waiterdeather = false
    TriggerEvent("AddRelationShip", mteam)
    if teami == "red" then  
        scoord = Config.Maps[tonumber(decode.mapid)].red[slot]
    else
        scoord = Config.Maps[tonumber(decode.mapid)].blue[slot]
    end
    SendNUIMessage({
        action = "closeAllMenu",
        t = true,
    })
    tour = 1
    StartGame()
    lobbyid = getLobbyId(LobbyName) 
    local decodedData = json.decode(Lobbys[lobbyid])
    if (tour == 1 or tour == 2 or tour == 3) and mteam == "red" then 
        player = decodedData.blue
    else
        player = decodedData.red
    end
        SendNUIMessage({
            action = "KillProfile",
            player = player
        })
end)

RegisterNetEvent("AddRelationShip")
AddEventHandler("AddRelationShip", function(id)
    StartRelationLoop(id)
end)

function StartRelationLoop(id)
  
end

RegisterNetEvent("RemoveRelationShip")
AddEventHandler("RemoveRelationShip", function()
    if DoesRelationshipGroupExist(mySquadHash) then
        SetPedRelationshipGroupHash(PlayerPedId(), 0x6F0783F5)
        SetEntityCanBeDamagedByRelationshipGroup(PlayerPedId(), true,  mySquadHash)
        RemoveRelationshipGroup(mySquadHash)
        mySquadHash = nil
    end
end)
function SetRelationDamage(id)
    if id and (mySquadHash == nil or not DoesRelationshipGroupExist(mySquadHash)) then
        local retval, hash = AddRelationshipGroup(id)
        SetPedRelationshipGroupHash(PlayerPedId(), hash)
        SetEntityCanBeDamagedByRelationshipGroup(PlayerPedId(), false,  hash)
        mySquadHash = hash
    else
        SetPedRelationshipGroupHash(PlayerPedId(), mySquadHash)
        SetEntityCanBeDamagedByRelationshipGroup(PlayerPedId(), false,  mySquadHash)
    end
    return mySquadHash
end


local function inGameStatus(status)
    return playingHideAndSeek
end

exports('inGameStatus', inGameStatus)

function StartGame()
    if funcActive then
        newfunc = true
        Citizen.Wait(1450) 
        newfunc = false
    end
    funcActive = true
    entityhealth = -1111
    SendNUIMessage({
        action = "killing-update",
        kill = 6,
    })
    Citizen.CreateThread(function()
        local playerPed = PlayerPedId()
        DefaultObject()
        isfreeze = false
        FreezePosition()
        SetPedMoveRateOverride(PlayerId(), 1.0)
        SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
        SetEntityCoords(playerPed, scoord.x, scoord.y, scoord.z)
        SetEntityHeading(playerPed, scoord.w)
        FreezeEntityPosition(playerPed, true)
        SetEntityAlpha(playerPed, 150, false)
        
        if ((tour == 1 or tour == 2 or tour == 3) and mteam == "red") or 
           ((tour == 4 or tour == 5 or tour == 6) and mteam == "blue") then
            
            Citizen.Wait(2500)
            if newfunc then funcActive = false return end
            SendNUIMessage({ action = "saytime", time = 6 })    
            Citizen.Wait(1250)
            if newfunc then funcActive = false return end
            SendNUIMessage({ action = "saytime", time = 2 }) 
            Citizen.Wait(1250)
            if newfunc then funcActive = false return end
            SendNUIMessage({ action = "saytime", time = 4 }) 
            Citizen.Wait(1500)
            if newfunc then funcActive = false return end
            SendNUIMessage({ action = "saytime", time = 0 }) 
            SetEntityAlpha(playerPed, 255, false)
            FreezeEntityPosition(playerPed, false)
            openScoreboard()
            you = 0
            SetPedMoveRateOverride(PlayerId(), 10.0)
            SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
        else
            for time = Config.BlackTime - 1, 0, -1 do
                SendNUIMessage({ action = "black-screen", time = time }) 
                if newfunc then 
                    funcActive = false
                    return
                end
                Citizen.Wait(1250)
                if newfunc then 
                    funcActive = false
                    return
                end
            end
            SetEntityAlpha(playerPed, 255, false)
            FreezeEntityPosition(playerPed, false)
            openScoreboard()
            you = 3000
            giveWeapon()
        end
        gameActive = false
        waiterdeather = true
    end)
end
function openScoreboard()
    SendNUIMessage({
        action = "scoreboard",
        display = true,
    }) 
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)

        if playingHideAndSeek then
            if timeri <= 7 and timeri >= 0 then
                timeri = timeri - 1
                SendNUIMessage({
                    action = "time-update",
                    timeri = FormatTime(timeri - 7)
                })
                local playerPed = PlayerPedId()
                local playerId = PlayerId()
                FreezeEntityPosition(playerPed, true)
                SetEntityAlpha(playerPed, 150, false)
            elseif timeri >= 0 then
                timeri = timeri - 1
                SendNUIMessage({
                    action = "time-update",
                    timeri = FormatTime(timeri - 7)
                })
            else
                local playerPed = PlayerPedId()
                local playerId = PlayerId()
                FreezeEntityPosition(playerPed, false)
                SetEntityAlpha(playerPed, 255, false)
                TriggerServerEvent("BakiTelli_hideandseek:TimeFinish", LobbyName)
                Citizen.Wait(3000)
                if playingHideAndSeek then 
                    timeri = mytimer + 10
                end
            end
        end
    end
end)

function FormatTime(seconds)
    if seconds <= 0 then
        return 0
    else
    local minutes = math.floor(seconds / 60)
    local remainingSeconds = seconds % 60 
    local formattedTime = string.format("%02d:%02d", minutes, remainingSeconds)
    return formattedTime
    end
end

AddEventHandler("BakiTelli_hideandseek:cl:UpdateScoreTable")
RegisterNetEvent("BakiTelli_hideandseek:cl:UpdateScoreTable", function (red, blue)
    SendNUIMessage({
        action = "score-update",
        red = blue,
        blue = red
    })
    tour = tour + 1
    ReviveFunction()
    Citizen.Wait(1500)
    if playingHideAndSeek then 
        StartGame()
        timeri = mytimer + 999
    end
end)


AddEventHandler("BakiTelli_hideandseek:cl:UpdateScore")
RegisterNetEvent("BakiTelli_hideandseek:cl:UpdateScore", function (red, blue)
    kill = 0
    if  mteam == "red" then  
        kill = blue+2
    else 
        kill = red - 1
    end
    SendNUIMessage({
        action = "killing-update",
        kill = kill,
    })
end)

AddEventHandler("BakiTelli_hideandseek:cl:FinishGame")
RegisterNetEvent("BakiTelli_hideandseek:cl:FinishGame", function (win)
    local playerPed = PlayerPedId()
    local playerId = PlayerId()
    FreezeEntityPosition(playerPed, false)
    SetEntityAlpha(playerPed, 255, false)
    isfreeze = false
    FreezePosition()
    newfunc = true 
    waiterdeather = false 
    entityhealth = -1111
    SendNUIMessage({
        action = "win-lose",
        typ = win
    })
    ClearPedBloodDamage(PlayerPedId())
    playingHideAndSeek = false
    Citizen.Wait(1500)
    newfunc = false
    SendNUIMessage({ action = "saytime", time = 0})
    SendNUIMessage({ action = "black-screen", time = 0}) 
    Citizen.Wait(2500)
    if Config.GameFinishRevive then 
        ReviveFunction()
    end
    SetPedMoveRateOverride(PlayerId(), 1.0)
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
    TriggerEvent("RemoveRelationShip")
end)

Citizen.CreateThread(function()
	local DeathReason, Killer, DeathCauseHash, Weapon

	while true do
		Citizen.Wait(0)
		if IsEntityDead(PlayerPedId()) and playingHideAndSeek then
			Citizen.Wait(500)
			local PedKiller = GetPedSourceOfDeath(PlayerPedId())
			DeathCauseHash = GetPedCauseOfDeath(PlayerPedId())

			if IsEntityAPed(PedKiller) and IsPedAPlayer(PedKiller) then
				Killer = NetworkGetPlayerIndexFromPed(PedKiller)
			elseif IsEntityAVehicle(PedKiller) and IsEntityAPed(GetPedInVehicleSeat(PedKiller, -1)) and IsPedAPlayer(GetPedInVehicleSeat(PedKiller, -1)) then
				Killer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(PedKiller, -1))
			end
			
			if (Killer == PlayerId()) then
				DeathReason = 'committed suicide'
			elseif (Killer == nil) then
				DeathReason = 'died'
			else
				DeathReason = "weapon_kill"
			end
            -- RevivePlayer()
			if true then -- eğer sorun yaşarsan burayı şunla değiştir     DeathReason == 'weapon_kill'
                TriggerServerEvent('BakiTelli_hideandseek:UpdateScore',LobbyName, mteam, tour)
                waiterdeather = false 
            end
			Killer = nil
			DeathReason = nil
			Weapon = nil
        end
		while IsEntityDead(PlayerPedId()) do
			Citizen.Wait(0)
		end
	end
end)

function ToggleObject(model)
    if you == 0 and playingHideAndSeek then
        local playerPed = PlayerPedId()
        local hash = model
        RequestModel(hash)
        local attempts = 0
        while not HasModelLoaded(hash) and attempts < 100 do
            Wait(10)
            attempts = attempts + 1
        end

        if not HasModelLoaded(hash) then
            return
        end

        SetEntityVisible(playerPed, false, false)

        local playerCoords = GetEntityCoords(playerPed)
        objectHandle = CreateObject(hash, playerCoords.x, playerCoords.y, playerCoords.z - 1, true, true, true)
        entityhealth = GetEntityHealth(objectHandle)
        -- SetEntityCollision(objectHandle, false, false)
    end
end

function DefaultObject()
    entityhealth = -1111
    local playerPed = PlayerPedId()
    if DoesEntityExist(objectHandle) then
        DeleteObject(objectHandle)
        objectHandle = nil
    end
    SetEntityVisible(playerPed, true, false)
    Citizen.Wait(500)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(you)
        if IsControlJustReleased(0, 38) and playingHideAndSeek then 
            DefaultObject()
            local playerPed = PlayerPedId()
            local playerPos = GetEntityCoords(playerPed)
            local closestObject = nil
            local closestDistance = 2.5 
                for obj in EnumerateObjects() do
                    local objPos = GetEntityCoords(obj)
                    local distance = #(playerPos - objPos)
                    if distance < closestDistance then
                        closestObject = obj
                        closestDistance = distance
                    end
                end
                
                if closestObject then
                    local hash = GetEntityModel(closestObject)
                    if contains(Config.BlackListObjects, tostring(hash)) == false then
                        ToggleObject(hash) 
                    end
                end
            elseif IsControlJustReleased(0,73) then 
                isfreeze = not isfreeze
                FreezePosition()
            end
        end
end)

function contains(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    if Config.DevMode then 
        print("[DEV MODE] Obje Name ".. element)
    end
    return false
end


function EnumerateObjects()
    return coroutine.wrap(function()
        local handle, object = FindFirstObject()
        if not handle or handle == -1 then
            EndFindObject(handle)
            return
        end
        
        local enum = {handle = handle, destructor = EndFindObject}
        setmetatable(enum, entityEnumerator)
        
        local next = true
        repeat
            coroutine.yield(object)
            next, object = FindNextObject(handle)
        until not next
        
        enum.destructor, enum.handle = nil, nil
        EndFindObject(handle)
    end)
end

entityEnumerator = {
    __gc = function(enum)
        if enum.destructor and enum.handle then
            enum.destructor(enum.handle)
        end
        enum.destructor, enum.handle = nil, nil
    end
}

function FreezePosition()
    if you == 0 and playingHideAndSeek then 
        local playerPed = PlayerPedId()
        FreezeEntityPosition(playerPed, isfreeze)
        FreezeEntityPosition(objectHandle, isfreeze)
        ClearPedTasks(PlayerPedId())
        if isfreeze then 
            loadAnimDict(deadAnimDict)
            TaskPlayAnim(playerPed, deadAnimDict, deadAnim, 1.0, 1.0, -1, 1, 0, 0, 0, 0)
        end
        Citizen.CreateThread(function()
                while isfreeze do
                if isfreeze then 
                    Citizen.Wait(0)
                else 
                    Citizen.Wait(1500)
                end
                DisableAllControlActions(0)
                EnableControlAction(0, 73, true) -- X
                EnableControlAction(0, 1, true) -- LookLeftRight
                EnableControlAction(0, 2, true) -- LookUpDown
                EnableControlAction(0, 4, true) -- LookUpOnly
                EnableControlAction(0, 5, true) -- LookDownOnly
                EnableControlAction(0, 6, true) -- LookLeftOnly
                EnableControlAction(0, 7, true) -- LookRightOnly
                -- ClearPedTasksImmediately(playerPed)
            end
        end)
    end
end

Citizen.CreateThread(function()
    while true do
        local sleep = 10
		if playingHideAndSeek then

            local playerPed = PlayerPedId()
            local selectedWeapon = GetSelectedPedWeapon(playerPed)
            if (selectedWeapon ~= GetHashKey(Config.Weapon.Name)) then
                SetCurrentPedWeapon(playerPed, GetHashKey("weapon_unarmed"), true)
            end
            if IsPedArmed(playerPed, 6) then
                DisableControlAction(1, 140, true) -- Melee attack light
                DisableControlAction(1, 141, true) -- Melee attack heavy
                DisableControlAction(1, 142, true) -- Melee attack alternate
            end
        end
        Citizen.Wait(sleep)
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000) 
        if playingHideAndSeek == false then 
         Citizen.Wait(2000) 
        end
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local distance = #(playerCoords - warningCoords)
        if (playingHideAndSeek and waiterdeather and entityhealth > GetEntityHealth(objectHandle)) then 
            SetEntityHealth(PlayerPedId(), 0)
        end
        if (distance > WarningDistance and playingHideAndSeek and waiterdeather) or (IsPedSwimming(PlayerPedId()) and playingHideAndSeek and waiterdeather) then
            SetEntityHealth(PlayerPedId(), 0)
        end
    end
end)