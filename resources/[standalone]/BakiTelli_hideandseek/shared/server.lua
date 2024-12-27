local QBCore = exports['qb-core']:GetCoreObject()


function getMoney(src, typ)
    local zrt = getplayer()
    local xPlayer = zrt(src)	
    if typ == "cash" then 
        money = xPlayer.PlayerData.money["cash"]
    else 
        money = xPlayer.PlayerData.money["bank"]
    end
    return money
end

-------------------------------- 

function getplayer(source)
	xPlayer = QBCore.Functions.GetPlayer
	return xPlayer
end

-------------------------------- 

function getidentifier(xPlayer)
	hex = xPlayer.PlayerData.citizenid
	return hex
end

-------------------------------- 

function getplayername(src)
    return GetPlayerName(src)
end