RegisterKeyMapping("+togglescoreboard", "Toggle Scoreboard", "keyboard", "M")

local showNames = false

RegisterCommand("-togglescoreboard", function() 
	showNames = false
	SendNUIMessage({ show = showNames })
end, false) -- Disables chat from opening.

local function DrawText3DTalking(x,y,z, text, textColor)
	local color = { r = 220, g = 220, b = 220, alpha = 255 }
	if textColor ~= nil then 
			color = {r = textColor[1] or 22, g = textColor[2] or 55, b = textColor[3] or 155, alpha = textColor[4] or 255}
	end

	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	local dist = #(vector3(px,py,pz) - vector3(x,y,z))

	local scale = (1/dist)*2
	local fov = (1/GetGameplayCamFov())*100
	local scale = scale*fov
	
	if onScreen then
			SetTextScale(0.0*scale, 0.75*scale)
			SetTextFont(0)
			SetTextProportional(1)
			SetTextColour(color.r, color.g, color.b, color.alpha)
			SetTextDropshadow(0, 0, 0, 0, 55)
			SetTextEdge(2, 0, 0, 0, 150)
			SetTextDropShadow()
			SetTextOutline()
			SetTextEntry("STRING")
			SetTextCentre(1)
			AddTextComponentString(text)
			DrawText(_x,_y)
	end
end

local cooldown = false

RegisterCommand("+togglescoreboard", function(source, args, rawCommand)
	if cooldown then
		lib.notify({
			description = 'Cooldown is active, Relax.',
			type = 'error'
		})
		return
	end

	CreateThread(function()
		cooldown = true
		Wait(2500)
		cooldown = false
		return
	end)

	showNames = true
	TriggerServerEvent('erp-scoreboard:getInfo')

	while showNames do
		Wait(0)
		local players = GetActivePlayers()
		local myPed = PlayerPedId()

		for i=1, #players do
			local plyPed = GetPlayerPed(players[i])
			if DoesEntityExist(plyPed) then
				local myCoords = GetEntityCoords(myPed)
				if myPed == plyPed then
					local plyServerId = GetPlayerServerId(players[i])
					DrawText3DTalking(myCoords.x, myCoords.y, myCoords.z+1.0, " ".. plyServerId .. " ", {152, 251, 152, 255})
				else
					local plyCoords = GetEntityCoords(plyPed)
					local plyDist = #(plyCoords - myCoords)
					if plyDist < 10 then
						local isDucking = IsPedDucking(plyPed)
						local cansee = HasEntityClearLosToEntity(myPed, plyPed, 17)
						local isStealth = GetPedStealthMovement(plyPed)
						local isDriveBy = IsPedDoingDriveby(plyPed)
						local isInCover = IsPedInCover(plyPed,true)
						local isInNoClip = IsEntityVisible(plyPed)
						
						if isStealth == nil then isStealth = 0 end
						if isDucking or isStealth == 1 or isDriveBy or isInCover or not isInNoClip then cansee = false end
						if cansee then
							local plyServerId = GetPlayerServerId(players[i])
							DrawText3DTalking(plyCoords.x, plyCoords.y, plyCoords.z+1.0, " " .. plyServerId .. " ", {255, 255, 255, 255})
						end
					end
				end
			end
		end 
	end
end, false)

RegisterNetEvent("erp-scoreboard:getInfo")
AddEventHandler("erp-scoreboard:getInfo", function(id, players, max)
	if id and players then
		SendNUIMessage({ show = showNames, id = id, players = players, max = max })
	end
end)

Citizen.CreateThread(function()
	while true do
		TriggerServerEvent('erp-scoreboard:discordPresence')	
		Wait(60000)
	end
end)

RegisterNetEvent("erp-scoreboard:discordPresence", function(id, count)
	local cid = exports['echorp_fx']:getCharacterInfoOne('cid')
	if cid then SetRichPresence(count..' players ('..id..' - '..cid..')')
	else SetRichPresence('Selecting Character...') end
end)