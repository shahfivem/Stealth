local Lobbys = {}

AddEventHandler("BakiTelli_hideandseek:NewLobby")
RegisterNetEvent("BakiTelli_hideandseek:NewLobby", function (p, pStatus, lobby, mapid, time)
    local insert = {
            password = pStatus,
            name = lobby,
            owner = source,
            password_no = p,
            mapid = mapid, 
            time = time,
            redteam_kill = 0,
            blueteam_kill = 0,
            starttime = 0,
            all = 0,
            round = 1,
            blueround =0,
            redround =0,
            red= 0,
            blue = 0,
            players = {
                red = {
                    [1] = 9999,  
                    [2] = 9999,                
                    [3] = 9999,                
                    [4] = 9999,                
                    [5] = 9999,                
                },
                blue = {
                    [1] = 9999,  
                    [2] = 9999,                
                    [3] = 9999,                
                    [4] = 9999,                
                    [5] = 9999,  
                }            
            } 
        }
        insert = json.encode(insert)
        table.insert(Lobbys, insert)
end)

AddEventHandler("BakiTelli_hideandseek:getPlayerDetails")
RegisterNetEvent("BakiTelli_hideandseek:getPlayerDetails", function ()
    src  = source
    Details = {
        moneycash = 1,
        moneybank = 1,
        name = "name",
    }
    TriggerClientEvent("BakiTelli_hideandseek:cl:getPlayerDetails", src , Details, Lobbys)
end)

AddEventHandler("BakiTelli_hideandseek:exitLobby")
RegisterNetEvent("BakiTelli_hideandseek:exitLobby", function (lobbyname)
    ExitLobby(source,lobbyname)
end)

function ExitLobby(pid,lobbyname)
    for k,v in pairs(Lobbys) do
        decode = json.decode(v)
        if lobbyname == decode.name then
        for x, innerValue in pairs(decode.players) do
            for num, value in pairs(innerValue) do
                myTeam = tonumber(value)
                if myTeam == pid then 
                    decode.players[x][num] = 9999
                    Lobbys[k] = json.encode(decode)
                    id = getLobbyId(lobbyname)
                    for k,v in pairs(json.decode(Lobbys[id]).players) do
                        for y,x in pairs(v) do
                           if  tonumber(x) == 9999 then 
                           else
                            getallplayers(lobbyname)
                            TriggerClientEvent("BakiTelli_hideandseek:cl:UpdatePlayers", tonumber(x), Lobbys, id)
                            end
                        end
                    end
                    end  
                end
            end
        end
    end
end

function getallplayers(lobbyname)
    allp = 0
    redp = 0
    bluep = 0
    for k,v in pairs(Lobbys) do
        decode = json.decode(v)
        if lobbyname == decode.name then
        for x, innerValue in pairs(decode.players) do
            for num, value in pairs(innerValue) do
                if 9999 == tonumber(value) then else 
                    allp = allp + 1
                end
                end
            end
                for num, value in pairs(decode.players.red) do
                    if 9999 == tonumber(value) then else 
                        redp = redp + 1
                    end
                end
                for num, value in pairs(decode.players.blue) do
                    if 9999 == tonumber(value) then else 
                        bluep = bluep + 1
                    end
                end
            end
    end
    savePlayers(lobbyname, allp, redp, bluep)
end

function savePlayers(lobbyname,all,red, blue)
    local decodedData = json.decode(Lobbys[getLobbyId(lobbyname)])
    decodedData.red = red
    decodedData.blue = blue
    decodedData.all = all
    Lobbys[getLobbyId(lobbyname)] = json.encode(decodedData)
end 

function getLobbyId(lobbyname)
    for k,v in pairs(Lobbys) do
        decode = json.decode(v)
        if decode.name == lobbyname then 
            return tonumber(k)
        end
    end
end


AddEventHandler("BakiTelli_hideandseek:checkTeam")
RegisterNetEvent("BakiTelli_hideandseek:checkTeam", function (lobbyname ,team, num)
    for k,v in pairs(Lobbys) do
        decode = json.decode(v)
        if lobbyname == decode.name then
        for innerKey, innerValue in pairs(decode.players) do
            if innerKey == team then 
                myTeam = tonumber(innerValue[num])
                if myTeam == 9999 then 
                    UpdatePlayers(source, team, num, k)
                    AddPlayer(source,lobbyname,team,num, k)
                    getallplayers(lobbyname)
                    NewTeamDate(source, k)
                else
                    break
                    end  
                end
            end
        end
    end
end)

function UpdatePlayers(source, teamx, numi, k)
    local decodedData = json.decode(Lobbys[k])
    local players = decodedData.players
    for team, teamData in pairs(players) do
        for num, value in pairs(teamData) do
            if tonumber(json.encode(value)) == source then
                if tonumber(numi) == tonumber(num) and teamx == team then 
                else
                decodedData.players[team][num] = 9999
                Lobbys[k] = json.encode(decodedData)
                end
            end
        end
    end
end
function AddPlayer(src, lobbyname, team, num, id)
    local decodedData = json.decode(Lobbys[id])
    decodedData.players[team][num] = src
    Lobbys[id] = json.encode(decodedData)
end

function NewTeamDate(source, g)
    for k,v in pairs(json.decode(Lobbys[g]).players) do
        for y,x in pairs(v) do
           if  tonumber(x) == 9999 then 
           else
            TriggerClientEvent("BakiTelli_hideandseek:cl:UpdatePlayers", tonumber(x), Lobbys, g)
           end
        end
    end
end


RegisterNetEvent("BakiTelli_hideandseek:getProfile")
AddEventHandler("BakiTelli_hideandseek:getProfile", function(srcy, team, num)
    local srcx = source
    Citizen.CreateThread(function()
        local name = getplayername(srcy)
        local identifierr = GetPlayerIdentifiers(srcy)[1]
        local id = tonumber(identifierr:gsub("steam:", ""), 16)
        local steamid = id and "http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=" .. Config.apikey .. "&steamids=" .. id or 'null'
        TriggerClientEvent("BakiTelli_hideandseek:cl:getProfile", srcx, srcy, name, steamid, team, num)
    end)
end)

AddEventHandler("BakiTelli_hideandseek:TimeEdit")
RegisterNetEvent("BakiTelli_hideandseek:TimeEdit", function (time, lk)
    local decodedData = json.decode(Lobbys[getLobbyId(lk)])
    decodedData.time = time
    Lobbys[getLobbyId(lk)] = json.encode(decodedData)
    TimeUpdate(getLobbyId(lk), time)
end)

function TimeUpdate(lk, time)
    for k,v in pairs(json.decode(Lobbys[lk]).players) do
        for y,x in pairs(v) do
           if tonumber(x) == 9999 then 
           else
            TriggerClientEvent("BakiTelli_hideandseek:cl:TimeEdit", tonumber(x), Lobbys, lk, time)
           end
        end
    end
end
AddEventHandler("BakiTelli_hideandseek:MapUpdate")
RegisterNetEvent("BakiTelli_hideandseek:MapUpdate", function (mapid, lk)
    local decodedData = json.decode(Lobbys[getLobbyId(lk)])
    decodedData.mapid = mapid
    Lobbys[getLobbyId(lk)] = json.encode(decodedData)
    MapUpdate(getLobbyId(lk), mapid)
end)


function MapUpdate(lk, mid)
    for k,v in pairs(json.decode(Lobbys[lk]).players) do
        for y,x in pairs(v) do
           if  tonumber(x) == 9999 then 
           else
            TriggerClientEvent("BakiTelli_hideandseek:cl:UpdateMap", tonumber(x), Lobbys, lk, mid)
           end
        end
    end
end

AddEventHandler("BakiTelli_hideandseek:getPlayers")
RegisterNetEvent("BakiTelli_hideandseek:getPlayers", function (name)
    id = getLobbyId(name)
    TriggerClientEvent("BakiTelli_hideandseek:cl:UpdatePlayers", source, Lobbys, id)
end)

AddEventHandler("BakiTelli_hideandseek:LoginLobby")
RegisterNetEvent("BakiTelli_hideandseek:LoginLobby", function (lid)
    local decodedData = json.decode(Lobbys[getLobbyId(lid)])
    if decodedData.password == true then 
        TriggerClientEvent("BakiTelli_hideandseek:cl:Login", source, decodedData.time, decodedData.mapid, "password")
    else 
        TriggerClientEvent("BakiTelli_hideandseek:cl:Login", source, decodedData.time , decodedData.mapid, "no_password")
    end 
end)

AddEventHandler("BakiTelli_hideandseek:checkPassword")
RegisterNetEvent("BakiTelli_hideandseek:checkPassword", function (pw, lobbyname)
    local decodedData = json.decode(Lobbys[getLobbyId(lobbyname)])
    if tonumber(decodedData.password_no) == tonumber(pw) then 
        TriggerClientEvent("BakiTelli_hideandseek:cl:enterPw",source, true, decodedData.time, decodedData.mapid)
    else 
        TriggerClientEvent("BakiTelli_hideandseek:cl:enterPw",source, false)
    end 
end)

AddEventHandler("BakiTelli_hideandseek:KickAllLobby")
RegisterNetEvent("BakiTelli_hideandseek:KickAllLobby", function (lobbyname, lb)
    Citizen.CreateThread(function()
        for k,v in pairs(Lobbys) do
            decode = json.decode(v)
            if decode.name == lobbyname then
                local players = decode.players
                for team, teamData in pairs(players) do
                    for num, value in pairs(teamData) do
                        if tonumber(value) == 9999 then
                    else
                        Earth(tonumber(value),decode.name, true) 
                        TriggerClientEvent("BakiTelli_hideandseek:cl:closeMenu", tonumber(value), lb)
                        end
                    end
                end
                table.remove(Lobbys, k)
            end
        end 
    end)
end)

function Earth(id,code, cancel) 
    earth = string.gsub(code, Config.Namep.."#", "")
    if cancel then
        SetPlayerRoutingBucket(tonumber(id), 0)
        else
        SetPlayerRoutingBucket(tonumber(id), tonumber(earth))
    end
end

AddEventHandler("BakiTelli_hideandseek:StartGame")
RegisterNetEvent("BakiTelli_hideandseek:StartGame", function (lobbyname)
    id = getLobbyId(lobbyname)
    decode = json.decode(Lobbys[id])
    if lobbyname == decode.name then
        for x, innerValue in pairs(decode.players) do
            for num, value in pairs(innerValue) do
                if 9999 == tonumber(value) then else 
                    StartGame(value, tonumber(decode.time), lobbyname)
                    TriggerClientEvent("BakiTelli_hideandseek:cl:StartGame", value, x, num)
                end
            end
        end
    end
end)

function StartGame(pid, time, lobbyname)
    Citizen.CreateThread(function()
        futureTime = os.time() + time * 60 
        lobbyid = getLobbyId(lobbyname) 
        local decodedData = json.decode(Lobbys[getLobbyId(lobbyname)])
        decodedData.starttime = futureTime
        Lobbys[lobbyid] = json.encode(decodedData)
        Earth(tonumber(pid),decodedData.name, false) 
        TriggerClientEvent("BakiTelli_hideandseek:TimeStart",pid, getTime(futureTime),lobbyname,futureTime)
    end)
end

function getTime(futureTimex)
    local currentTime = os.time()
    local remainingTime = futureTimex - currentTime

    if remainingTime > 0 then
        return tostring(remainingTime)
    else
        return 0
    end
end


AddEventHandler("BakiTelli_hideandseek:TimeFinish")
RegisterNetEvent("BakiTelli_hideandseek:TimeFinish", function (lobbyname)
    id = getLobbyId(lobbyname)
    decode = json.decode(Lobbys[id])
    winning = "" 
    if lobbyname == decode.name then
        if tonumber(getTime(decode.starttime)) == 0 then
            if (tonumber(decode.round) == 1 or tonumber(decode.round) == 2 or tonumber(decode.round) == 3) then 
                addRound(lobbyname, "red")
            else 
                addRound(lobbyname, "blue")
            end
        end
    end
end)

RegisterServerEvent('BakiTelli_hideandseek:UpdateScore')
AddEventHandler('BakiTelli_hideandseek:UpdateScore', function( lobby, team)
    id = getLobbyId(lobby)
    decode = json.decode(Lobbys[id])
    round = tonumber(decode.round)
    red = tonumber(decode.red) 
    blue = tonumber(decode.blue)
    if lobby == decode.name then
        if team == "red" then
            if red <= tonumber(decode.redteam_kill) +1 then
                addRound(lobby, "blue")
            else 
                addKill(lobby, team)
            end
        else
            if blue <= tonumber(decode.blueteam_kill) + 1 then
                addRound(lobby, "red")
            else 
                addKill(lobby, team)
            end
        end
    end
end)

function addKill(lobby,team)
    if team == "red" then
        local decodedData = json.decode(Lobbys[getLobbyId(lobby)])
        k = tonumber(decodedData.redteam_kill)
        decodedData.redteam_kill = k + 1
        Lobbys[getLobbyId(lobby)] = json.encode(decodedData)
    else   
        local decodedData = json.decode(Lobbys[getLobbyId(lobby)])
        k = tonumber(decodedData.blueteam_kill)
        decodedData.blueteam_kill = k + 1
        Lobbys[getLobbyId(lobby)] = json.encode(decodedData) 
    end
    SendKill(lobby,team)
end

function addRound(lobby,team)
    if team == "red" then
        local decodedData = json.decode(Lobbys[getLobbyId(lobby)])
        y = tonumber(decodedData.round)
            k = tonumber(decodedData.redround)
            decodedData.redround = k + 1
            decodedData.round = y + 1
            decodedData.blueteam_kill = 0
            decodedData.redteam_kill = 0
            Lobbys[getLobbyId(lobby)] = json.encode(decodedData)
        if y == 6 then 
            SendFinish(lobby)
        end
    else   
        local decodedData = json.decode(Lobbys[getLobbyId(lobby)])
        y = tonumber(decodedData.round)
            k = tonumber(decodedData.blueround)
            decodedData.blueround = k + 1
            decodedData.round = y + 1
            decodedData.blueteam_kill = 0
            decodedData.redteam_kill = 0
            Lobbys[getLobbyId(lobby)] = json.encode(decodedData) 
            if y == 6 then 
                SendFinish(lobby)
            end
    end
    SendScore(lobby,team)
end


function SendScore(lobby,team)
    for k,v in pairs(json.decode(Lobbys[getLobbyId(lobby)]).players) do
        for y,x in pairs(v) do
           if  tonumber(x) == 9999 then 
           else
            local decodedData = json.decode(Lobbys[getLobbyId(lobby)])
            TriggerClientEvent("BakiTelli_hideandseek:cl:UpdateScoreTable", tonumber(x), decodedData.blueround, decodedData.redround)
            end
        end
    end
end
function SendKill(lobby,team)
    for k,v in pairs(json.decode(Lobbys[getLobbyId(lobby)]).players) do
        for y,x in pairs(v) do
           if  tonumber(x) == 9999 then 
           else
            local decodedData = json.decode(Lobbys[getLobbyId(lobby)])
            TriggerClientEvent("BakiTelli_hideandseek:cl:UpdateScore", tonumber(x), decodedData.blueteam_kill, decodedData.redteam_kill)
            end
        end
    end
end


function SendFinish(lobby)
    win = ""
    id = getLobbyId(lobby)
    decode = json.decode(Lobbys[id])
    if tonumber(decode.blueround) > tonumber(decode.redround) then 
        win = "blue"
    elseif tonumber(decode.redround) > tonumber(decode.blueround) then 
        win = "red"
    else
      win = "draw"
    end
    for k,v in pairs(decode.players) do
        for y,x in pairs(v) do
           if  tonumber(x) == 9999 then 
           else
                if win == "draw" then 
                    TriggerClientEvent("BakiTelli_hideandseek:cl:FinishGame", tonumber(x), "draw")
                else
                    if k == win then 
                        TriggerClientEvent("BakiTelli_hideandseek:cl:FinishGame", tonumber(x), "win")
                    else
                        TriggerClientEvent("BakiTelli_hideandseek:cl:FinishGame", tonumber(x), "lose")
                    end
                end
            end
        end
    end
    TriggerEvent("BakiTelli_hideandseek:KickAllLobby", lobby, false)
end

AddEventHandler("playerDropped", function(reason)
    local playerId = source
    for k,v in pairs(Lobbys) do
    decode = json.decode(v)
        local players = decode.players
        for team, teamData in pairs(players) do
            for num, value in pairs(teamData) do
                if tonumber(value) == playerId then
                    if decode.owner == source then 
                        TriggerEvent("BakiTelli_hideandseek:KickAllLobby", decode.name, true)
                    else 
                        ExitLobby(playerId,decode.name)
                    end
                end
            end
        end
    end 
end)