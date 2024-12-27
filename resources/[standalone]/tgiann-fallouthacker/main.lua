local menuOpen = false
local hackStatus = false

--[[
	--example usage
	local health = 2
	Hack = exports["tgiann-fallouthacker"]:openMenu(health)
	if Hack then 
		print("hack success")
	else
		print("hack unsuccessful")
	end
]]

function openMenu(health)
	if not menuOpen then
		menuOpen = true
		SendNUIMessage({menu = 'open', health = health})
		SetNuiFocus(true, true)
		while menuOpen do
			Citizen.Wait(0)
			if IsControlJustPressed(0, 177) or IsControlJustPressed(0, 214) or IsControlJustPressed(0, 49) then
				menuOpen = false
				SendNUIMessage({menu = 'open'})
				closeMenu()
			end
		end
		Citizen.Wait(100)
		return hackStatus
	else
		return false
	end
end

RegisterNUICallback('menuClose', function(data)
	hackStatus = data.success
	closeMenu()
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		closeMenu()
	end
end)

function closeMenu()
	SetNuiFocus(false, false)
	menuOpen = false
end