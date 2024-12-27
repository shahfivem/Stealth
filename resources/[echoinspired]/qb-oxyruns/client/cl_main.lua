local QBCore = exports['qb-core']:GetCoreObject()

local started = false
local dropOffCount = 0
local hasDropOff = false
local hasPackage = false
local packageEntity = nil
local vehicleOffsets = {
    [`minivan`] = {
		{ x = -0.2, y = -1.4, z = 0.0 },
		{ x = 0.2, y = -1.4, z = 0.0 },
		{ x = -0.2, y = -1.6, z = 0.0 },
		{ x = 0.2, y = -1.6, z = 0.0 },
		{ x = -0.2, y = -1.8, z = 0.0 },
		{ x = 0.2, y = -1.8, z = 0.0 },
		{ x = -0.2, y = -1.4, z = 0.15 },
		{ x = 0.2, y = -1.4, z = 0.15 },
		{ x = -0.2, y = -1.6, z = 0.15 },
		{ x = 0.2, y = -1.6, z = 0.15 },
		{ x = -0.2, y = -1.8, z = 0.15 },
		{ x = 0.2, y = -1.8, z = 0.15 },
	},
    [`speedo`] = {
		{ x = -0.2, y = -1.4, z = -0.05 },
		{ x = 0.2, y = -1.4, z = -0.05 },
		{ x = -0.2, y = -1.6, z = -0.05 },
		{ x = 0.2, y = -1.6, z = -0.05 },
		{ x = -0.2, y = -1.8, z = -0.05 },
		{ x = 0.2, y = -1.8, z = -0.05 },
		{ x = -0.2, y = -1.4, z = 0.125 },
		{ x = 0.2, y = -1.4, z = 0.125 },
		{ x = -0.2, y = -1.6, z = -0.125 },
		{ x = 0.2, y = -1.6, z = -0.125 },
		{ x = -0.2, y = -1.8, z = -0.125 },
		{ x = 0.2, y = -1.8, z = -0.125 },
	},
    [`rumpo`] = {
		{ x = -0.2, y = -1.4, z = -0.35 },
		{ x = 0.2, y = -1.4, z = -0.35 },
		{ x = -0.2, y = -1.6, z = -0.35 },
		{ x = 0.2, y = -1.6, z = -0.35 },
		{ x = -0.2, y = -1.8, z = -0.35 },
		{ x = 0.2, y = -1.8, z = -0.35 },
		{ x = -0.2, y = -1.4, z = -0.175 },
		{ x = 0.2, y = -1.4, z = -0.175 },
		{ x = -0.2, y = -1.6, z = -0.175 },
		{ x = 0.2, y = -1.6, z = -0.175 },
		{ x = -0.2, y = -1.8, z = -0.175 },
		{ x = 0.2, y = -1.8, z = -0.175 },
	},
    [`youga`] = {
		{ x = -0.2, y = -1.4, z = 0.235 },
		{ x = 0.2, y = -1.4, z = 0.235 },
		{ x = -0.2, y = -1.6, z = 0.235 },
		{ x = 0.2, y = -1.6, z = 0.235 },
		{ x = -0.2, y = -1.8, z = 0.235 },
		{ x = 0.2, y = -1.8, z = 0.235 },
		{ x = -0.2, y = -1.4, z = 0.41 },
		{ x = 0.2, y = -1.4, z = 0.41 },
		{ x = -0.2, y = -1.6, z = 0.41 },
		{ x = 0.2, y = -1.6, z = 0.41 },
		{ x = -0.2, y = -1.8, z = 0.41 },
		{ x = 0.2, y = -1.8, z = 0.41 },
	},
}

vehicleTypes = {
	`minivan`,
	`speedo`,
	`rumpo`,
	`youga`
}

local oxyPed = nil
local madeDeal = false

local dropOffBlip = nil

local peds = {
	'a_m_y_stwhi_02',
	'a_m_y_stwhi_01',
	'a_f_y_genhot_01',
	'a_f_y_vinewood_04',
	'a_m_m_golfer_01',
	'a_m_m_soucent_04',
	'a_m_o_soucent_02',
	'a_m_y_epsilon_01',
	'a_m_y_epsilon_02',
	'a_m_y_mexthug_01'
}
local function Draw3DText(coords, text)
	local onScreen,_x,_y=World3dToScreen2d(coords.x,coords.y,coords.z)
	SetTextScale(0.35, 0.35)
	SetTextFont(4)
	SetTextProportional(true)
	SetTextColour(255, 255, 255, 215)
	SetTextEntry("STRING")
	SetTextCentre(true)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = #text / 370
	DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end
--- This function can be used to trigger your desired dispatch alerts
local AlertCops = function()
	exports['ps-dispatch']:DrugSale() -- Project-SLoth qb-dispatch
	-- TriggerServerEvent('police:server:policeAlert', 'Suspicious Hand-off') -- Regular qbcore
end

--- Creates a drop off blip at a given coordinate
--- @param coords vector4 - Coordinates of a location
local CreateDropOffBlip = function(coords)
	dropOffBlip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(dropOffBlip, 51)
    SetBlipScale(dropOffBlip, 1.0)
    SetBlipAsShortRange(dropOffBlip, false)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Deliver")
    EndTextCommandSetBlipName(dropOffBlip)
end

--- Creates a drop off ped at a given coordinate
--- @param coords vector4 - Coordinates of a location
local CreateDropOffPed = function(coords)
    if oxyPed ~= nil then return end
    local model = peds[math.random(#peds)]
    local hash = GetHashKey(model)

    RequestModel(hash)
    while not HasModelLoaded(hash) do Wait(10) end
    oxyPed = CreatePed(5, hash, coords.x, coords.y, coords.z-1, coords.w, true, true)
    while not DoesEntityExist(oxyPed) do Wait(10) end
    ClearPedTasks(oxyPed)
    ClearPedSecondaryTask(oxyPed)
    TaskSetBlockingOfNonTemporaryEvents(oxyPed, true)
    SetPedFleeAttributes(oxyPed, 0, 0)
    SetPedCombatAttributes(oxyPed, 17, 1)
    SetPedSeeingRange(oxyPed, 0.0)
    SetPedHearingRange(oxyPed, 0.0)
    SetPedAlertness(oxyPed, 0)
    SetPedKeepTask(oxyPed, true)
    FreezeEntityPosition(oxyPed, true)
    
    exports.ox_target:addLocalEntity(oxyPed, {
        {
            name = 'oxy:deliverOxy',
            icon = 'fas fa-capsules',
            label = 'Make Deal',
            onSelect = function()
                if not hasPackage then
                    lib.notify({ 
                        text = "You need to get the package from the car, silly!", 
                        type = "error", 
                        duration = 5000 
                    })
                    return
                end
                
                -- Proceed with the deal
                TriggerEvent('qb-oxyruns:client:DeliverOxy')
            end,
            canInteract = function(entity)
                -- Ensure interaction happens only when within distance
                return #(GetEntityCoords(cache.ped) - GetEntityCoords(entity)) < 2.0
            end
        }
    }, {
        distance = 2.0
    })
end


--- Creates a random drop off location
local CreateDropOff = function()
	hasDropOff = true
	lib.notify({
		type = 'inform',
		text = 'Make your way to the drop off..',
		duration = 5000
	})
	dropOffCount += 1
	local randomLoc = Config.Locations[math.random(#Config.Locations)]
	-- Blip
	CreateDropOffBlip(randomLoc)
	-- PolyZone
	dropOffArea = CircleZone:Create(randomLoc.xyz, 85.0, {
		name = "dropOffArea",
		debugPoly = false
	})
	dropOffArea:onPlayerInOut(function(isPointInside, point)
		if isPointInside then
			if oxyPed == nil then
				lib.notify({
					type = 'inform',
					text = 'Make the delivery',
					duration = 8000
				})
				CreateDropOffPed(randomLoc)
			end
		end
	end)
end

--- Start an oxy run after paying the initial payment
local StartOxyrun = function()
	if started then return end
	started = true
	SpawnVan()
	lib.notify({
		type = 'inform',
		text = 'Wait for a new location..',
		duration = 8000
	})
	while started do
		Wait(4000)
		if not hasDropOff then
			Wait(8000)
			CreateDropOff()
		end
	end
end

--- Deletes the oxy ped
local DeleteOxyped = function()
	FreezeEntityPosition(oxyPed, false)
	SetPedKeepTask(oxyPed, false)
	TaskSetBlockingOfNonTemporaryEvents(oxyPed, false)
	ClearPedTasks(oxyPed)
	TaskWanderStandard(oxyPed, 10.0, 10)
	SetPedAsNoLongerNeeded(oxyPed)
	Wait(20000)
	DeletePed(oxyPed)
	oxyPed = nil
end

RegisterNetEvent("qb-oxyruns:client:StartOxy", function()
	if started then return end
	QBCore.Functions.TriggerCallback('qb-oxyruns:server:StartOxy', function(canStart)
		if canStart then
			StartOxyrun()
		end
	end)
end)

RegisterNetEvent('qb-oxyruns:client:DeliverOxy', function()
    if madeDeal then return end
    local ped = PlayerPedId()
    if not IsPedOnFoot(ped) then return end
    if #(GetEntityCoords(ped) - GetEntityCoords(oxyPed)) < 5.0 then
        -- Anti spam
        madeDeal = true
        exports.ox_target:removeLocalEntity(oxyPed)

        -- Alert Cops
        if math.random(100) <= Config.CallCopsChance then
            AlertCops()
        end

        -- Face each other
        TaskTurnPedToFaceEntity(oxyPed, ped, 1.0)
        TaskTurnPedToFaceEntity(ped, oxyPed, 1.0)
        Wait(1500)
        PlayAmbientSpeech1(oxyPed, "Generic_Hi", "Speech_Params_Force")
        Wait(1000)

		if packageEntity then
			local entityHandle = packageEntity.entity -- Extract the actual entity handle
			if entityHandle then
				DetachEntity(entityHandle, false, true)
				DeleteObject(entityHandle)
			end
			packageEntity:remove() -- Ensure the object metadata is cleared
			packageEntity = nil
		end

        -- Stop animation and reset hasPackage
        ClearPedTasks(ped)
        hasPackage = false

        -- Playerped animation
        RequestAnimDict("mp_safehouselost@")
        while not HasAnimDictLoaded("mp_safehouselost@") do Wait(10) end
        TaskPlayAnim(ped, "mp_safehouselost@", "package_dropoff", 8.0, 1.0, -1, 16, 0, 0, 0, 0)
        Wait(800)
        
        -- Oxyped animation
        PlayAmbientSpeech1(oxyPed, "Chat_State", "Speech_Params_Force")
        Wait(500)
        RequestAnimDict("mp_safehouselost@")
        while not HasAnimDictLoaded("mp_safehouselost@") do Wait(10) end
        TaskPlayAnim(oxyPed, "mp_safehouselost@", "package_dropoff", 8.0, 1.0, -1, 16, 0, 0, 0, 0)
        Wait(3000)

        -- Remove blip
        RemoveBlip(dropOffBlip)
        dropOffBlip = nil

        -- Reward
        TriggerServerEvent('qb-oxyruns:server:Reward')

        -- Finishing up
        dropOffArea:destroy()
        Wait(2000)
        if dropOffCount == Config.RunAmount then
            lib.notify({
                type = 'inform',
                text = 'You\'re done delivering, come back.',
                duration = 5000
            })
            started = false
            dropOffCount = 0
        else
            lib.notify({
                type = 'inform',
                text = 'Delivery was good, you\'ll be notified when the next one is available.',
                duration = 5000
            })
        end
        DeleteOxyped()
        hasDropOff = false
        madeDeal = false
    end
end)


function SpawnVan()
	TriggerEvent('erp-cargodeliveries:requestVehicle')
end
CreateThread(function()
	-- Starter Ped
	local pedModel = `g_m_m_chemwork_01`
	RequestModel(pedModel)
	while not HasModelLoaded(pedModel) do Wait(10) end
	local ped = CreatePed(0, pedModel, Config.StartLocation.x, Config.StartLocation.y, Config.StartLocation.z-1.0, Config.StartLocation.w, false, false)
	TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_CLIPBOARD', true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	-- Target
	exports.ox_target:addLocalEntity(ped, {
		{
			icon = 'fas fa-capsules',
			label = 'Start Run ($' .. Config.StartOxyPayment .. ')',
			onSelect = function()
				lib.notify({
					type = 'inform',
					text = 'Hold your push to talk key..'
				})
				local k = exports.erp_progressbar:taskBar({
					text = 'Speak to the chemist',
					length = 10000,
					keepweapon = true,
					vehicle = false,
					distcheck = 10.0,
					speaking = true,
				}) == 100 if k then
				TriggerEvent('qb-oxyruns:client:StartOxy')
				end
			end
		}
	})
	
end)


local packages = {}

local function RemovePackage()
	if packages and packages[#packages] then
		packages[#packages]:remove()
		packages[#packages] = nil
	end
end

-- Function to attach package to player
local function AttachPackageToPlayer()
    if packageEntity then
        DeleteObject(packageEntity)
        packageEntity = nil
    end

    packageEntity = lib.object.create({
        model = 'prop_cs_package_01',
        coords = GetEntityCoords(cache.ped),
        onCreated = function(box)
            AttachEntityToEntity(box, cache.ped, GetPedBoneIndex(cache.ped, 60309), 0.025, 0.08, 0.255, -145.0, 290.0, 0.0, true, true, false, false, 2, true)

            -- Request and play carrying animation
            local animDict = "anim@heists@box_carry@"
            lib.requestAnimDict(animDict)
            TaskPlayAnim(cache.ped, animDict, 'idle', 8.0, -4.0, -1, 51, 0.0, false, false, false)

            hasPackage = true
        end
    })
end

-- Adding interaction to the delivery vehicle
local function AddVehicleInteraction(vehicle)
    exports.ox_target:addLocalEntity(vehicle, {
        {
            name = 'oxy:pickupPackage',
            label = "Get Package",
            onSelect = function()
                if not hasPackage then
                    AttachPackageToPlayer()
					RemovePackage()
                else
                    lib.notify({ text = 'You already have a package!', type = 'error' })
                end
            end,
            canInteract = function(entity)
                local ped = cache.ped
                return not hasPackage and #(GetEntityCoords(ped) - GetEntityCoords(entity)) < 2.0
            end,
            distance = 1.5
        }
    })
end

RegisterNetEvent('erp-cargodeliveries:requestVehicle', function(netId)
    local model = vehicleTypes[math.random(1, #vehicleTypes)]
    local vehicle = lib.vehicle.create({
        model = model,
        position = vector4(-1092.54, -2137.99, 13.28, 215.58),
    })

    if not vehicle then
        print('Unable to create vehicle')
        return
    end

    -- Add package interaction to the spawned vehicle
    AddVehicleInteraction(vehicle)

	local count = math.random(6, 12)
	for i = 1, count do
		packages[i] = lib.object.create({
			model = `prop_cs_package_01`,
			coords = GetEntityCoords(vehicle),
			networked = true,
			onCreated = function(box)
				SetEntityVisible(box, false, false)
				local x, y, z = vehicleOffsets[model][i].x, vehicleOffsets[model][i].y, vehicleOffsets[model][i].z
				AttachEntityToEntity(box, vehicle, 0, x, y, z, 0.0, 0.0, 0.0, false, true, true, false, 0, true)
				SetEntityVisible(box, true, true)
			end
		})
		Wait(50)
	end
	TriggerEvent('cd_garage:AddKeys', exports['cd_garage']:GetPlate(vehicle))
	lib.notify('Your vehicle is parked up, go get it')
	
	repeat
		Wait(0)
		Draw3DText(GetEntityCoords(vehicle), 'Delivery Vehicle')
	until GetVehiclePedIsIn(cache.ped, false) == vehicle
end)
