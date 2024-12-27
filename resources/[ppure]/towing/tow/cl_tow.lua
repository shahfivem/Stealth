-- The Job
local hasRented = false
local currentFlatbed = 0
local notify = exports.erp_notifications

exports('CanTow', function()
	return currentFlatbed ~= 0
end)

CreateThread(function()

	while true do

		local delay = 2500

		local plyPed = PlayerPedId()
		local currVeh = GetVehiclePedIsIn(plyPed, false)
		if currentFlatbed ~= 0 then

			delay = 0

			if currVeh ~= 0 and DoesEntityExist(currVeh) then
				if currentFlatbed ~= currVeh then
					if IsVehicleTow(currVeh) then
						currentFlatbed = currVeh
						notify:SendAlert('inform', 'We see you switched flatbeds, letting the impound know!', 5000)
					end
				end
			end

			local plyPos = GetEntityCoords(plyPed)

			for i=1, #Impounds do

				local impound = Impounds[i]
				local center = impound.center

				local dist = #(plyPos - center)
				if dist < 30.0 then
					local box = impound.box
					for y=1, #box do
						for x=1, 20 do
							local newZ = (x / 350)
							DrawLine(box[y][1].x, box[y][1].y, box[y][1].z+newZ, box[y][2].x, box[y][2].y, box[y][2].z+newZ, 50, 168, 82, 255)
						end
					end
				end

			end

		elseif IsVehicleTow(currVeh) then
			notify:SendAlert('inform', 'You are in a flatbed, you can use the impound to tow vehicles for money.', 5000)
			currentFlatbed = currVeh
			delay = 500
		end

		Wait(delay)

	end

end)

local towPed = nil

-- Function to spawn a ped
local function spawnTowPed()
    local pedModel = `s_m_m_autoshop_01` -- Replace with your desired ped model
    RequestModel(pedModel)
    while not HasModelLoaded(pedModel) do Wait(10) end

    local coords = vector3(408.96, -1623.55, 29.29) -- Replace with desired spawn location
    local heading = 204.04 -- Replace with desired heading

    towPed = CreatePed(4, pedModel, coords.x, coords.y, coords.z - 1.0, heading, false, true)
    FreezeEntityPosition(towPed, true)
    SetEntityInvincible(towPed, true)
    SetBlockingOfNonTemporaryEvents(towPed, true)

    return towPed
end

-- Targetable ped interaction
exports.ox_target:addModel({ `s_m_m_autoshop_01` }, {
    {
        name = 'tow_menu',
        label = "Tow Options",
        icon = 'fa-solid fa-tools',
        onSelect = function()
            -- Get the closest impound dynamically
            local coords = GetEntityCoords(PlayerPedId())
            local closestImpound = GetClosestImpound(coords)

            if not closestImpound then
                return notify:SendAlert('error', 'No nearby impound found.', 5000)
            end

            -- Pass the impound ID to the menu
            TriggerEvent('erp-jobsystem:createtowoptions', { name = closestImpound.id })
        end,
        canInteract = function(entity)
            return entity == towPed
        end,
        distance = 2.5
    }
})


CreateThread(function()
    spawnTowPed()
end)

AddEventHandler('erp-jobsystem:createtowoptions', function(data)
	TriggerEvent('erp-context:sendMenu', {
		{ id = 1, header = "Impound Vehicle", txt = "Place the vehicle you towed in to the area marked with a blue outline/no parking zone.", params = { event = "erp-jobsystem:impoundvehicle", arrow = false, args = data } },
		{ id = 2, header = "$250 Grab Flatbed", txt = "Obtain a Flatbed here, you can only have one out at a time.", params = { event = "erp-jobsystem:flatbed:grab", arrow = false, args = data }},
		{ id = 3, header = "Return Flatbed", txt = "Return your Flatbed here.", params = { event = "erp-jobsystem:flatbed:return", arrow = false, args = data }}
	})
end)

local function getVehicleFromPosition(position)

	local closestVehicle
	local closestDist = 6969.0

	local vehicles = GetGamePool('CVehicle')
	for i=1, #vehicles do
		local vehicle = vehicles[i]
		local dist = #(GetEntityCoords(vehicle) - position.xyz)
		if dist < closestDist then
			closestDist = dist
			closestVehicle = vehicle
		end
	end

	return {
		vehicle = closestVehicle,
		dist = closestDist
	}

end

AddEventHandler('erp-jobsystem:impoundvehicle', function(data)

	local id = data.name
	local impound = GetImpound(id)

	if not impound then	
		return print('Unknown impound passed', id)
	end

	if currentFlatbed ~= 0 and DoesEntityExist(currentFlatbed) then

		local closest = getVehicleFromPosition(impound.center)

		local closestVehicle = closest.vehicle
		local closestDist = closest.dist

		if closestDist == nil or closestDist > 7.5 then
			return notify:SendAlert('error', 'You must place the vehicle you wish to impound in the box', 5000)
		end

		if currentFlatbed == closestVehicle then
			return notify:SendAlert('inform', 'We found your flatbed... move your flatbed away from the area. If this was intentional, you\'re an idiot.', 5000)
		end

		TriggerEvent('cd_garage:ImpoundVehicle', closestVehicle)

	else

		notify:SendAlert('error', 'You must grab a flatbed first', 5000)

	end

end)
AddEventHandler('erp-jobsystem:flatbed:return', function()

    if hasRented and currentFlatbed ~= 0 and DoesEntityExist(currentFlatbed) then
        -- Set the entity as a mission entity to allow deletion
        SetEntityAsMissionEntity(currentFlatbed, true, true)

        -- Ensure we have control over the entity before deleting it
        local timeout = 0
        while not NetworkHasControlOfEntity(currentFlatbed) and timeout < 5000 do
            NetworkRequestControlOfEntity(currentFlatbed)
            Wait(10)
            timeout = timeout + 10
        end

        if NetworkHasControlOfEntity(currentFlatbed) then
            DeleteVehicle(currentFlatbed)
            currentFlatbed = 0
            hasRented = false
            notify:SendAlert('inform', 'Flatbed successfully returned.', 5000)
        else
            notify:SendAlert('error', 'Unable to delete the flatbed. Try again.', 5000)
        end

        return
    end

    notify:SendAlert('inform', 'According to our records, you have not yet obtained a flatbed, or it no longer exists', 7500)
end)


AddEventHandler('erp-jobsystem:flatbed:grab', function(data)

	local id = data.name
	local impound = GetImpound(id)

	if not impound then	
		return print('Unknown impound passed', id)
	end
	
	if currentFlatbed ~= 0 then
		notify:SendAlert('inform', 'You already have a Flatbed out there, charging $100 for not returning it.')
		TriggerServerEvent('erp-jobsystem:charge', 100)
		currentFlatbed = 0
	end

	local sentModel = `flatbed`
	local spawnpoint

	local spawnPoints = impound.spots

	for i=1, #spawnPoints do

		local closest = getVehicleFromPosition(spawnPoints[i])
		if closest.dist == nil or closest.dist > 5.0 then
			spawnpoint = spawnPoints[i]
			break
		end

	end

	if not spawnpoint then
		return notify:SendAlert('inform', 'Unable to find space for the flatbed, try again later')
	end

	currentFlatbed = lib.vehicle.create({
		model = sentModel,
		position = spawnpoint
	})
    hasRented = true
	-- TriggerEvent('keys:addNew', currentFlatbed, GetVehicleNumberPlateText(currentFlatbed))
	TriggerServerEvent('erp-jobsystem:charge', 250)
	-- Trigger the Server Event for Notification
    notify:SendAlert('inform', 'You have been charged $250', 'inform')


	notify:SendAlert('inform', 'Collect your Flatbed', 5000)
	TriggerEvent('cd_garage:AddKeys', exports['cd_garage']:GetPlate(currentFlatbed))
	notify:SendAlert('inform', 'Temporary Keys Found', 5000)

	while DoesEntityExist(currentFlatbed) do

		DrawText3Ds(GetEntityCoords(currentFlatbed), "Your Flatbed")
		if GetVehiclePedIsIn(PlayerPedId(), false) == currentFlatbed then
			notify:SendAlert('inform', 'Awesome, enjoy towing vehicles.', 5000)
			return
		end

		Wait(0)

	end

end)

RegisterNetEvent('erp-jobsystem:notify', function(type, message)
    lib.notify({
        type = type, -- 'success', 'error', etc.
        text = message
    })
end)

-- Tow Truck Stuff

local towingAnimation = false

AddEventHandler('animation:tow', function()

	if towingAnimation then return end
	towingAnimation = true

	local plyPed = PlayerPedId()

	RequestAnimDict('mini@repair')
    while not HasAnimDictLoaded('mini@repair') do
        Wait(0)
    end

	while towingAnimation do

        if not IsEntityPlayingAnim(plyPed, "mini@repair", "fixing_a_player", 3) then
            ClearPedSecondaryTask(plyPed)
            TaskPlayAnim(plyPed, "mini@repair", "fixing_a_player", 8.0, -8, -1, 16, 0, false, false, false)
        end

        Wait(250)

    end

	StopAnimTask(plyPed, 'mini@repair', 'fixing_a_player', 3.0)

end)

local function canStillTow(vehicle, targetVehicle)

	local model = GetEntityModel(vehicle)
	local d1 = GetModelDimensions(model)

	local back = GetOffsetFromEntityInWorldCoords(vehicle, 0.0,d1.y-1.0,0.0)

	return not DoesEntityExist(GetPedInVehicleSeat(targetVehicle, -1)) and #(back - GetEntityCoords(targetVehicle)) < 3.0

end

exports.ox_target:addGlobalVehicle({
    {
		name = 'towvehicle',
        label = "Tow Vehicle",
		onSelect = function(data)
			
			local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
			if not DoesEntityExist(vehicle) or not IsVehicleTow(vehicle) then
				return notify:SendAlert('error', 'Unable to find flatbed, try entering and then exiting it')
			end

			local targetVehicle = data.entity

			local plyPed = PlayerPedId()
			local model = GetEntityModel(vehicle)
			local d1 = GetModelDimensions(model)

			local timeout = 15000 -- 15 seconds
			local shouldTow = false

			repeat

				timeout = timeout - 1

				local targetPosition = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, d1.y - 1.0, 0.0)

				local checkingPosition = false

				local towDist = #(targetPosition - GetEntityCoords(targetVehicle))
				if towDist > 3.5 then
					DrawText3Ds(targetPosition, 'Move Vehicle Here')
					checkingPosition = true
				end

				local plyDist = 100.0

				if not checkingPosition then

					plyDist = #(targetPosition - GetEntityCoords(plyPed))
					if plyDist > 2.5 then
						DrawText3Ds(targetPosition, 'Move Here to Tow')
						checkingPosition = true
					end

				end

				if not checkingPosition then
					timeout = 0
					shouldTow = true
					break
				end

				Wait(0)
				
			until timeout <= 0

			if timeout <= 0 and not shouldTow then
				return notify:SendAlert('error', 'You did not move to the correct positions in time')
			end

			TriggerServerEvent('erp-sounds:PlayWithinDistance', 10.0, 'towtruck', 0.5)

			TaskTurnPedToFaceEntity(plyPed, vehicle, 1.0)

			Wait(1000)

			TriggerEvent("animation:tow")

			local first = exports["erp_progressbar"]:taskBar({
				length = math.random(12500, 17500),
				text = "Hooking up vehicle",
				runcheck = true,
				distCheck = 3.0
			})

			if first < 100 then
				towingAnimation = false
				return
			end

			if not canStillTow(vehicle, targetVehicle) then
				towingAnimation = false
				return notify:SendAlert('error', 'Unable to tow vehicle')
			end

			TriggerServerEvent('erp-sounds:PlayWithinDistance', 10.0, 'towtruck2', 0.5)

			local second = exports["erp_progressbar"]:taskBar({
				length = math.random(5000, 7500),
				text = "Towing Vehicle",
				runcheck = true,
				distCheck = 3.0
			})

			if second < 100 then
				towingAnimation = false
				return
			end

			if not canStillTow(vehicle, targetVehicle) then
				towingAnimation = false
				return notify:SendAlert('error', 'Unable to tow vehicle')
			end

			timeout = 0

			while timeout < 1000 and not NetworkHasControlOfEntity(vehicle) do
				timeout = timeout + 100
				NetworkRequestControlOfEntity(vehicle)
				Citizen.Wait(100)
			end

			timeout = 0

			while timeout < 1000 and not NetworkHasControlOfEntity(targetVehicle) do
				timeout = timeout + 100
				NetworkRequestControlOfEntity(targetVehicle)
				Citizen.Wait(100)
			end

			-- TriggerServerEvent('erp-jobsystem:registertow', VehToNet(targetVehicle), VehToNet(vehicle))

			if model == `flatbed3` then
				AttachEntityToEntity(targetVehicle, vehicle, GetEntityBoneIndexByName(vehicle, 'bodyshell'), 0.0, -3.3, 1.0, 0, 0, 0, 1, 1, 0, 1, 0, 1)
			elseif model == `flatbed2` then
				AttachEntityToEntity(targetVehicle, vehicle, GetEntityBoneIndexByName(vehicle, 'bodyshell'), 0.0, -1.9, 0.5, 0, 0, 0, 1, 1, 0, 1, 0, 1)
			elseif model == `flatbed` then
				AttachEntityToEntity(targetVehicle, vehicle, GetEntityBoneIndexByName(vehicle, 'bodyshell'), -0.25, -2.8, 1.1, 0, 0, 0, 1, 1, 0, 1, 0, 1)
			elseif model == `flatbedm2` then
				AttachEntityToEntity(targetVehicle, vehicle, GetEntityBoneIndexByName(vehicle, 'bodyshell'), -0.25, -2.8, 0.9, 0, 0, 0, 1, 1, 0, 1, 0, 1)
			end

			towingAnimation = false

		end,
        canInteract = function(entity)

			local plyVeh = GetVehiclePedIsIn(PlayerPedId(), true)
			if plyVeh == 0 or not DoesEntityExist(plyVeh) then return false end

			if not IsVehicleTow(plyVeh) then return false end
			if IsVehicleTow(entity) then return false end

			local attachedTo = GetEntityAttachedTo(entity)
			return attachedTo == 0
        
        end,
        distance = 2.5
    },
})

local towModels = {}

for model in pairs(TowVehicles) do
	table.insert(towModels, model)
end

local function getAttachedVehicle(flatbed)

	local vehicles = GetGamePool('CVehicle')
	for i=1, #vehicles do
		local vehicle = vehicles[i]
		if IsEntityAttachedToEntity(vehicle, flatbed) then
			return vehicle
		end
	end

	return 0

end

exports.ox_target:addModel(towModels, {
    {
		name = 'untowvehicle',
        label = "Untow Vehicle",
		onSelect = function(data)
			
			local plyPed = PlayerPedId()
			
			local vehicle = data.entity
			local targetVehicle = getAttachedVehicle(vehicle)

			if not DoesEntityExist(targetVehicle) then return end

			local model = GetEntityModel(vehicle)
			local d1 = GetModelDimensions(model)

			local timeout = 5000

			repeat
				Wait(1)
				timeout = timeout - 1
				DrawText3Ds(GetOffsetFromEntityInWorldCoords(vehicle, 0.0,d1.y-1.0,0.0), 'Move Here to Untow')
			until #(GetOffsetFromEntityInWorldCoords(vehicle, 0.0,d1.y-1.0,0.0) - GetEntityCoords(plyPed)) < 2.5

			if #(GetOffsetFromEntityInWorldCoords(vehicle, 0.0,d1.y-1.0,0.0) - GetEntityCoords(plyPed)) > 2.5 then
				return notify:SendAlert('error', 'You did not move to the back to untow in time')
			end

			timeout = 1000

			TriggerServerEvent('erp-sounds:PlayWithinDistance', 10.0, 'towtruck', 0.5)
			TaskTurnPedToFaceEntity(plyPed, vehicle, 1.0)

			Wait(1000)

			TriggerEvent("animation:tow")

			local first = exports["erp_progressbar"]:taskBar({
				length = math.random(12500, 17500),
				text = "Untowing vehicle",
				runcheck = true,
				distCheck = 3.0
			})

			if first < 100 then
				towingAnimation = false
				return
			end

			timeout = 0

			while timeout < 1000 and not NetworkHasControlOfEntity(vehicle) do
				timeout = timeout + 100
				NetworkRequestControlOfEntity(vehicle)
				Citizen.Wait(100)
			end

			timeout = 0

			while timeout < 1000 and not NetworkHasControlOfEntity(targetVehicle) do
				timeout = timeout + 100
				NetworkRequestControlOfEntity(targetVehicle)
				Citizen.Wait(100)
			end

			local drop = GetOffsetFromEntityInWorldCoords(vehicle, 1.5, d1.y - 5.0, 0.0)

			DetachEntity(targetVehicle, true, true)
			---@diagnostic disable-next-line: missing-parameter
			SetEntityCoords(targetVehicle, drop.x, drop.y, drop.z)

			towingAnimation = false

		end,
        canInteract = function(entity)
			return getAttachedVehicle(entity) ~= 0
        end,
        distance = 2.5
    }
})

towModels = nil