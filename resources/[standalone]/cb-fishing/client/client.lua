local IsFishing = false
local anchored = false
local net = false
local boat = nil
local firstannounce = false
local speedwarning = false
local announcestring = false
local lastfor = 5
local display = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1500)
		local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
		local water = IsEntityInWater(vehicle)
		local speed = GetEntitySpeed(vehicle) * 2.236936
		local notificationType = nil

		if DoesEntityExist(vehicle) and water and speed >= Config.NetSpeed and net and not firstannounce then
			TriggerEvent('cb-fishing:client:Notify', "Fishing", Lang:t('success.speed'), "success")
			Citizen.Wait(Config.CatchSpeed * 1000)
			firstannounce = true
			speedwarning = false

			while DoesEntityExist(vehicle) and water and net and speed >= Config.NetSpeed do
				TriggerServerEvent("cb-fishing:server:catchfishnet")
				HasChum()
				TriggerEvent('cb-fishing:client:Notify', "Fishing", Lang:t('success.caught'), "success")
				Citizen.Wait(Config.CatchSpeed * 1000)
				speed = GetEntitySpeed(vehicle) * 2.236936
			end
		elseif DoesEntityExist(vehicle) and water and speed < Config.NetSpeed and net and not speedwarning then
			TriggerEvent('cb-fishing:client:Notify', "Fishing", Lang:t('primary.tooslow'), notificationType)
			firstannounce = false
			speedwarning = true
		end
	end
end)

lib.callback.register('cb-fishing:client:FishingMinigame', function()
	return FishingMinigame()
end)

lib.callback.register('cb-fishing:client:DeepSeaMinigame', function()
	return DeepSeaFishingMinigame()
end)

function SpawnPeds()
	lib.requestModel(Config.FishShopPedHash, 5000)
	local shopPed = CreatePed(0, Config.FishShopPedHash, Config.FishShopPedCoords.x, Config.FishShopPedCoords.y, Config.FishShopPedCoords.z-1.0, Config.FishShopPedCoords.w, false, false)
	FreezeEntityPosition(shopPed, true)
	SetEntityInvincible(shopPed, true)
	SetBlockingOfNonTemporaryEvents(shopPed, true)

	lib.requestModel(Config.FishWholesalePedHash, 5000)
	local salePed = CreatePed(0, Config.FishWholesalePedHash, Config.FishWholesalePedCoords.x, Config.FishWholesalePedCoords.y, Config.FishWholesalePedCoords.z-1.0, Config.FishWholesalePedCoords.w, false, false)
	FreezeEntityPosition(salePed, true)
	SetEntityInvincible(salePed, true)
	SetBlockingOfNonTemporaryEvents(salePed, true)

	lib.requestModel(Config.FishWholesalePedPremiumHash, 5000)
	local fishPed = CreatePed(0, Config.FishWholesalePedPremiumHash, Config.FishWholesalePedPremiumCoords.x, Config.FishWholesalePedPremiumCoords.y, Config.FishWholesalePedPremiumCoords.z-1.0, Config.FishWholesalePedPremiumCoords.w, false, false)
	FreezeEntityPosition(fishPed, true)
	SetEntityInvincible(fishPed, true)
	SetBlockingOfNonTemporaryEvents(fishPed, true)

	lib.requestModel(Config.FishIllegalPedHash, 5000)
	local illegalPed = CreatePed(0, Config.FishIllegalPedHash, Config.FishIllegalPedCoords.x, Config.FishIllegalPedCoords.y, Config.FishIllegalPedCoords.z-1.0, Config.FishIllegalPedCoords.w, false, false)
	FreezeEntityPosition(illegalPed, true)
	SetEntityInvincible(illegalPed, true)
	SetBlockingOfNonTemporaryEvents(illegalPed, true)
	if Target == "ox" then
		exports.ox_target:addLocalEntity(shopPed, {
			{
					type = "client",
					event = "cb-fishing:OpenShop",
					icon = 'fa-solid fa-fish',
					label = 'Fish Supply Shop',
					distance = 2.0
			},
			{
				type = "client",
				event = "cb-fishing:client:checklevel",
				icon = 'fa-solid fa-arrow-trend-up',
				label = 'Check Current Level',
				distance = 2.0
			}
		})

		exports.ox_target:addLocalEntity(salePed, {
			{
					type = "client",
					event = "cb-fishing:client:fishbuyer",
					icon = 'fa-solid fa-fish',
					label = 'Fish Wholesale Buyer',
					distance = 2.0
			},
		})

		exports.ox_target:addLocalEntity(fishPed, {
			{
					type = "client",
					event = "cb-fishing:client:fishbuyerpremium",
					icon = 'fa-solid fa-fish',
					label = 'Fish Wholesale Buyer',
					distance = 2.0
			},
		})

		exports.ox_target:addLocalEntity(illegalPed, {
			{
					type = "client",
					event = "cb-fishing:client:illegalfishmarket",
					icon = 'fa-solid fa-fish',
					label = 'Fish Wholesale Buyer',
					distance = 2.0
			},
		})
	elseif Target == "qb" then
		exports['qb-target']:AddTargetEntity(shopPed, {
			options = {
				{
						type = "client",
						event = "cb-fishing:OpenShop",
						icon = 'fa-solid fa-fish',
						label = 'Fish Supply Shop',
				},
				{
					type = "client",
					event = "cb-fishing:client:checklevel",
					icon = 'fa-solid fa-arrow-trend-up',
					label = 'Check Current Level',
				},
			},
			distance = 2.0
		})

		exports['qb-target']:AddTargetEntity(salePed, {
			options = {
			{
					type = "client",
					event = "cb-fishing:client:fishbuyer",
					icon = 'fa-solid fa-fish',
					label = 'Fish Wholesale Buyer',
			},
		},
			distance = 2.0
		})

		exports['qb-target']:AddTargetEntity(fishPed, {
			options = {
				{
					type = "client",
					event = "cb-fishing:client:fishbuyerpremium",
					icon = 'fa-solid fa-fish',
					label = 'Fish Wholesale Buyer',
				},
			},
			distance = 2.0
		})

		exports['qb-target']:AddTargetEntity(illegalPed, {
			options = {
				{
					type = "client",
					event = "cb-fishing:client:illegalfishmarket",
					icon = 'fa-solid fa-fish',
					label = 'Fish Wholesale Buyer',
				},
			},
			distance = 2.0
		})
	end
end

CreateThread(function()
	SpawnPeds()
	if Config.FishingShopBlip then
		FishingShopBlip = AddBlipForCoord(Config.FishShopPedCoords)
		SetBlipSprite(FishingShopBlip, Config.FishingShopBlip.sprite)
		SetBlipColour(FishingShopBlip, Config.FishingShopBlip.color)
		SetBlipScale(FishingShopBlip, Config.FishingShopBlip.scale)
		SetBlipAsShortRange(FishingShopBlip, true)
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString(Config.FishingShopBlip.name)
		EndTextCommandSetBlipName(FishingShopBlip)
	end
	if Config.FishStoreBlip then
		for _, location in ipairs(Config.FishStoreBlip.locations) do
			local x, y, z, w = location.x, location.y, location.z, location.w
			local FishStoreBlip = AddBlipForCoord(x, y, z, w)
			
			SetBlipSprite(FishStoreBlip, Config.FishStoreBlip.sprite)
			SetBlipColour(FishStoreBlip, Config.FishStoreBlip.color)
			SetBlipScale(FishStoreBlip, Config.FishStoreBlip.scale)
			SetBlipAsShortRange(FishStoreBlip, true)
			
			BeginTextCommandSetBlipName('STRING')
			AddTextComponentString(Config.FishStoreBlip.name)
			EndTextCommandSetBlipName(FishStoreBlip)
		end
	end
end)

function IsZoneInLakeZones(zone)
	for _, lakeZone in pairs(Config.LakeZones) do
		if zone == lakeZone then
			return true
		end
	end
	return false
end

function HasChum()
	local chance = math.random(0, 100)
	local chum = CheckItem(Config.Chum, 1)
	local notificationType = nil

	if chance <= Config.ChumChance and chum then
		TriggerEvent('cb-fishing:client:Notify', "Fishing", Lang:t('primary.chum'), notificationType)
		TriggerServerEvent("cb-fishing:server:removechum")
	elseif chance <= Config.ChumChance and not chum then
		TriggerEvent('cb-fishing:client:Notify', "Fishing", Lang:t('error.nochum'), "error")
	net = false
	end
end

function SetAnchor()
	local ped = PlayerPedId()
	local boat  = GetVehiclePedIsIn(ped, true)
	
	if not IsPedInAnyBoat(ped) then
		TriggerEvent('cb-fishing:client:Notify', "Fishing", Lang:t('error.cantanchorboat'), "error")
		return
	end

	if IsVehicleEngineOn(boat) and not anchored then
		TriggerEvent('cb-fishing:client:Notify', "Fishing", Lang:t('error.cantanchor'), "error")
		return
	end

	if not anchored then
		if Progressbar("setanchor", Lang:t('anchor.dropanchor'), Config.Anchor) then
			TriggerEvent('cb-fishing:client:Notify', "Fishing", Lang:t('success.anchored'), "success")
			SetBoatAnchor(boat, true)
			SetBoatFrozenWhenAnchored(boat, true)
			ClearPedTasks(ped)
			anchored = true
		end
	else
		if Progressbar("pickinganchor", Lang:t('anchor.pickupanchor'), Config.Anchor) then
			TriggerEvent('cb-fishing:client:Notify', "Fishing", Lang:t('success.removeanchor'), "success")
			SetBoatAnchor(boat, false)
			ClearPedTasks(ped)
			anchored = false
		end
	end
end

function StartFishing()
    local ped = PlayerPedId()
    local headPos = GetPedBoneCoords(ped, Config.Animation.BoneID, 0.0, 0.0, 0.0)
    local offsetPos = GetOffsetFromEntityInWorldCoords(ped, 0.0, 50.0, -25.0)
    local hit, hitPos = TestProbeAgainstWater(headPos.x, headPos.y, headPos.z, offsetPos.x, offsetPos.y, offsetPos.z)
    local hasitem = CheckItem(Config.FishingBait, 1)
    
    if not hasitem then
        TriggerEvent('cb-fishing:client:Notify', "Fishing", Lang:t('error.nobait'), "error")
    elseif not hit then
        TriggerEvent('cb-fishing:client:Notify', "Fishing", Lang:t('error.no_water'), "error")
    else
        IsFishing = true
        TriggerServerEvent("cb-fishing:server:removefishingbait")
        -- Set up fishing animation and prop
        local fishingtime = math.random(Config.FishingTimeMin * 1000, Config.FishingTimeMax * 1000)
        RequestAnimDict(Config.Animation.Dict)
        while not HasAnimDictLoaded(Config.Animation.Dict) do
            Citizen.Wait(0)
        end
        TaskPlayAnim(ped, Config.Animation.Dict, Config.Animation.Anim, Config.Animation.BlendInSpeed, Config.Animation.BlendOutSpeed, -1, Config.Animation.Flags, 0, false, false, false)
        -- Create and attach prop (fishing rod, etc.)
        local model = Config.Animation.Model
        RequestModel(model)
        while not HasModelLoaded(model) do
            Citizen.Wait(0)
        end
        
        local prop = CreateObject(model, 0, 0, 0, true, true, true)
        local boneIndex = GetPedBoneIndex(ped, Config.Animation.Bone)
        AttachEntityToEntity(prop, ped, boneIndex, Config.Animation.Coords, Config.Animation.Rotation, true, true, false, true, 1, true)
		local success = exports.erp_progressbar:taskBar({
			text = "Fishing...",
			length = fishingtime,
		})
		
		if success == 100 then
			IsFishing = false
            DetachEntity(prop, true, true)
            DeleteEntity(prop)
            ClearPedTasks(ped)
            RemoveAnimDict(Config.Animation.Dict)
			local zone = GetNameOfZone(GetEntityCoords(ped))
			if not IsZoneInLakeZones(zone) then
				TriggerServerEvent("cb-fishing:server:catchfishshore")
			else
				TriggerServerEvent("cb-fishing:server:catchfishlake")
			end
		else
			IsFishing = false
            DetachEntity(prop, true, true)
            DeleteEntity(prop)
            ClearPedTasks(ped)
            RemoveAnimDict(Config.Animation.Dict)
			TriggerEvent('cb-fishing:client:Notify', "Cancelled", "You cancelled the action!", "error")
		end
    end
end

function DeepSea()
	local ped = PlayerPedId()
	local offsetPos = GetOffsetFromEntityInWorldCoords(ped, 0.0, 50.0, -25.0)
	local origin = GetPedBoneCoords(ped, 60309, 0.0, 0.0, 2.5)
	local retval, surface = TestProbeAgainstWater(origin.x, origin.y, origin.z, offsetPos.x, offsetPos.y, offsetPos.z)
	local rayHandle = StartShapeTestRay(surface.x, surface.y, surface.z + 1000.0, surface.x, surface.y, surface.z - 1000.0, 1, nil, 0)
	local hit, floor = GetShapeTestResult(rayHandle)
	local depth = 0.0
	local hasItem = CheckItem(Config.DeepSeaBait, 1)
	local coords = GetEntityCoords(ped)
	local zone = GetNameOfZone(vector3(coords.x, coords.y, coords.z))

	if IsZoneInLakeZones(zone) then
		TriggerEvent('cb-fishing:client:Notify', "Fishing", Lang:t('error.cannotfish'), "error")
		return
	end

	if hit then
		depth = math.max(depth, #(floor - origin) - #(surface - origin))
		if depth >= 4000 and hasItem then
			TriggerServerEvent("cb-fishing:server:removedeepseabait")

			local dict = Config.Animation.Dict
			local anim = Config.Animation.Anim
			local flags = Config.Animation.Flags
			local blendInSpeed = Config.Animation.BlendInSpeed
			local blendOutSpeed = Config.Animation.BlendOutSpeed
			local fishingTime = math.random(Config.DeepSeaFishingTimeMin * 1000, Config.DeepSeaFishingTimeMax * 1000)

			RequestAnimDict(dict)
			while not HasAnimDictLoaded(dict) do
				Citizen.Wait(0)
			end

			local model = Config.Animation.Model
			local bone = GetPedBoneIndex(ped, Config.Animation.Bone)
			local animCoords = Config.Animation.Coords
			local rotation = Config.Animation.Rotation
			local prop = CreateObject(GetHashKey(model), 0, 0, 0, true, true, true)

			if DoesEntityExist(prop) then
				TaskPlayAnim(ped, dict, anim, blendInSpeed, blendOutSpeed, -1, flags, 0, false, false, false)
				Citizen.Wait(0)
				SetPedComponentVariation(ped, 5, 0, 0, 0)
				AttachEntityToEntity(prop, ped, bone, animCoords, rotation, true, true, false, true, 1, true)
			end
			local success = exports.erp_progressbar:taskBar({
				text = "Fishing...",
				length = fishingtime,
				animation = {
					dict = nil, -- Add animation dictionary if needed
					anim = nil, -- Add animation name if needed
					stuck = false
				}
			})
			
			if success == 100 then
				IsFishing = false
				DetachEntity(prop, true, true)
				DeleteEntity(prop)
				ClearPedTasks(ped)
				RemoveAnimDict(Config.Animation.Dict)
				local zone = GetNameOfZone(GetEntityCoords(ped))
				if not IsZoneInLakeZones(zone) then
					TriggerServerEvent("cb-fishing:server:catchfishdeepsea")
				end
			else
				IsFishing = false
				DetachEntity(prop, true, true)
				DeleteEntity(prop)
				ClearPedTasks(ped)
				RemoveAnimDict(Config.Animation.Dict)
				TriggerEvent('cb-fishing:client:Notify', "Cancelled", "You cancelled the action!", "error")
			end
		elseif depth == 0 then
			TriggerEvent('cb-fishing:client:Notify', "Fishing", Lang:t('error.cannotfishland'), "error")
		elseif depth >= 1 and depth <= 3999 then
			TriggerEvent('cb-fishing:client:Notify', "Fishing", Lang:t('error.shallowwater'), "error")
		else
			TriggerEvent('cb-fishing:client:Notify', "Fishing", Lang:t('error.nobait'), "error")
		end
	end
end

RegisterNetEvent("cb-fishing:client:deepsea", function()
	PlayerData = GetPlayerData()
	local points = PlayerData.metadata['fishing']

	if points < Config.Level10 then
		TriggerEvent('cb-fishing:client:Notify', "Fishing", Lang:t('error.notlevel'), "error")
		return
	end
	if IsFishing then
		TriggerEvent('cb-fishing:client:Notify', "Fishing", Lang:t('error.already_fishing'), "error")
    return
  end
	DeepSea()
end)

RegisterNetEvent("cb-fishing:client:useanchor", function()
	SetAnchor()
end)

RegisterNetEvent("cb-fishing:client:userod", function()
  if IsPedInAnyVehicle(PlayerPedId(), true) then return end
  if IsFishing then
		TriggerEvent('cb-fishing:client:Notify', "Fishing", Lang:t('error.already_fishing'), "error")
    return
  end
	StartFishing()
end)

RegisterNetEvent("cb-fishing:client:usenet", function()
    local coords = GetEntityCoords(PlayerPedId())
    local zone = GetNameOfZone(vector3(coords.x, coords.y, coords.z))
    local item = CheckItem(Config.Chum, 1)
    PlayerData = GetPlayerData()
    local points = PlayerData.metadata['fishing']
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)

    if not DoesEntityExist(vehicle) then
        TriggerEvent('cb-fishing:client:Notify', "Fishing", Lang:t('error.noboat'), "error")
        return
    end

    if points < Config.Level5 then
        TriggerEvent('cb-fishing:client:Notify', "Fishing", Lang:t('error.notlevel'), "error")
        return
    end

    if not item then
        TriggerEvent('cb-fishing:client:Notify', "Fishing", Lang:t('error.missingchum'), "error")
        return
    end

    if IsZoneInLakeZones(zone) then 
        TriggerEvent('cb-fishing:client:Notify', "Fishing", Lang:t('error.freshwater'), "error")
        return
    end

    if net == false then
        if Progressbar("setnet", Lang:t('net.dropnet'), Config.Net) then
			net = true
			TriggerServerEvent("cb-fishing:server:removechum")
		end

    elseif net == true then
        if Progressbar("pickupnet", Lang:t('net.pickupnet'), Config.Net) then
			net = false
		end
    end
end)

lib.callback.register('cb-fishing:client:opentreasurechest', function()
	local dict = Config.AnimationTreasure.Dict
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
    end
	TaskPlayAnim(PlayerPedId(), Config.AnimationTreasure.Dict, Config.AnimationTreasure.Anim, 8.0, -8.0, -1, 1, 0, false, false, false)
	local model = Config.AnimationTreasure.Model
	local bone = GetPedBoneIndex(PlayerPedId(), Config.AnimationTreasure.Bone)
	local coords = Config.AnimationTreasure.Coords
	local rotation = Config.AnimationTreasure.Rotation
	local prop = CreateObject(GetHashKey(Config.AnimationTreasure.Model), 0, 0, 0, true, true, true)
	AttachEntityToEntity(prop, PlayerPedId(), bone, coords, rotation, true, true, false, true, 1, true)
	if Progressbar("treasurechest", Lang:t('success.treasurestart'), 5000) then
		TriggerEvent('cb-fishing:client:Notify', "Fishing", Lang:t('success.treasuresuccess'), "success")
		DetachEntity(prop, true, true)
		DeleteEntity(prop)
		ClearPedTasks(PlayerPedId())
		return true
	else
		DetachEntity(prop, true, true)
		DeleteEntity(prop)
		ClearPedTasks(PlayerPedId())
		return false
	end
end)

lib.callback.register('cb-fishing:client:opentreasurebox', function()
	local dict = Config.AnimationTreasure.Dict
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
    end
	TaskPlayAnim(PlayerPedId(), Config.AnimationTreasure.Dict, Config.AnimationTreasure.Anim, 8.0, -8.0, -1, 1, 0, false, false, false)
	local model = Config.AnimationTreasure.Model
	local bone = GetPedBoneIndex(PlayerPedId(), Config.AnimationTreasure.Bone)
	local coords = Config.AnimationTreasure.Coords
	local rotation = Config.AnimationTreasure.Rotation
	local prop = CreateObject(GetHashKey(Config.AnimationTreasure.Model), 0, 0, 0, true, true, true)
	AttachEntityToEntity(prop, PlayerPedId(), bone, coords, rotation, true, true, false, true, 1, true)
	if Progressbar("treasurebox", Lang:t('success.treasurestart'), 5000) then
		TriggerEvent('cb-fishing:client:Notify', "Fishing", Lang:t('success.treasuresuccess'), "success")
		DetachEntity(prop, true, true)
		DeleteEntity(prop)
		ClearPedTasks(PlayerPedId())
		return true
	else
		DetachEntity(prop, true, true)
		DeleteEntity(prop)
		ClearPedTasks(PlayerPedId())
		return false
	end
end)

RegisterNetEvent("cb-fishing:OpenShop", function()
	PlayerData = GetPlayerData()
	if not UsingOxInventory then
		local items = {}
		for k,v in pairs(Config.FishingShop.inventory) do
			table.insert{items, {name = v.name, price = v.price, amount = 1000, info = {}, type = 'item', slot = k}}
		end
		TriggerServerEvent('inventory:server:OpenInventory', 'shop', 'Fishing', Config.Items)
	else
		exports.ox_inventory:openInventory('shop', { type = 'FishingShop', id = 1 })
	end
end)

RegisterNetEvent("cb-fishing:client:fishbuyer", function()
	local options = {}
	for _, v in pairs(Config.FishWholesale) do
		table.insert(options, {
			title = v.name,
			description = "Sell for $"..v.price,
			icon = GetItemImage(v.item),
			image = GetItemImage(v.item),
			disabled = not CheckItem(v.item, 1),
			arrow = false,
			serverEvent = 'cb-fishing:server:sellfish',
			args = v.item
		})
	end

	local context = {
		id = 'shop',
		title = "Fish Shop",
		options = options
	}

	lib.registerContext(context)
	lib.showContext('shop')
end)

RegisterNetEvent("cb-fishing:client:fishbuyerpremium", function()
	local options = {}
	for _, v in pairs(Config.FishWholesalePremium) do
		table.insert(options, {
			title = v.name,
			description = "Sell for $"..v.price,
			icon = GetItemImage(v.item),
			image = GetItemImage(v.item),
			disabled = not CheckItem(v.item, 1),
			arrow = false,
			serverEvent = 'cb-fishing:server:sellfishpremium',
			args = v.item
		})
	end

	local context = {
		id = 'shop',
		title = "Fish Shop",
		options = options
	}

	lib.registerContext(context)
	lib.showContext('shop')
end)

RegisterNetEvent("cb-fishing:client:illegalfishmarket", function()
	local options = {}
	for _, v in pairs(Config.FishIllegalMarket) do
		table.insert(options, {
			title = v.name,
			description = "Sell for $"..v.price,
			icon = GetItemImage(v.item),
			image = GetItemImage(v.item),
			disabled = not CheckItem(v.item, 1),
			arrow = false,
			serverEvent = 'cb-fishing:server:sellfishillegalmarket',
			args = v.item
		})
	end

	local context = {
		id = 'shop',
		title = "Fish Shop",
		options = options
	}
	lib.registerContext(context)
	lib.showContext('shop')
end)

RegisterNetEvent("cb-fishing:client:announcement", function(rep)
	PlayerData = GetPlayerData()
	local points = PlayerData.metadata['fishing']
	local newpoints = rep

	if points < Config.Level1 and points + newpoints >= Config.Level1 then
		fishinglevelup = "Congrats! You have reached level 1!"
		TriggerEvent("announce", -1, msg)
		PushScaleformMovieFunctionParameterString("~y~" .. fishinglevelup)
	elseif points < Config.Level2 and points + newpoints >= Config.Level2 then
		fishinglevelup = "Congrats! You have reached level 2!"
		TriggerEvent("announce", -1, msg)
		PushScaleformMovieFunctionParameterString("~y~" .. fishinglevelup)
	elseif points < Config.Level3 and points + newpoints >= Config.Level3 then
		fishinglevelup = "Congrats! You have reached level 3!"
		TriggerEvent("announce", -1, msg)
		PushScaleformMovieFunctionParameterString("~y~" .. fishinglevelup)
	elseif points < Config.Level4 and points + newpoints >= Config.Level4 then
		fishinglevelup = "Congrats! You have reached level 4!"
		TriggerEvent("announce", -1, msg)
		PushScaleformMovieFunctionParameterString("~y~" .. fishinglevelup)
	elseif points < Config.Level5 and points + newpoints >= Config.Level5 then
		fishinglevelup = "Congrats! You have reached level 5! You can now catch with fishing Nets!"
		TriggerEvent("announce", -1, msg)
		PushScaleformMovieFunctionParameterString("~y~" .. fishinglevelup)
	elseif points < Config.Level6 and points + newpoints >= Config.Level6 then
		fishinglevelup = "Congrats! You have reached level 6!"
		TriggerEvent("announce", -1, msg)
		PushScaleformMovieFunctionParameterString("~y~" .. fishinglevelup)
	elseif points < Config.Level7 and points + newpoints >= Config.Level7 then
		fishinglevelup = "Congrats! You have reached level 7!"
		TriggerEvent("announce", -1, msg)
		PushScaleformMovieFunctionParameterString("~y~" .. fishinglevelup)
	elseif points < Config.Level8 and points + newpoints >= Config.Level8 then
		fishinglevelup = "Congrats! You have reached level 8!"
		TriggerEvent("announce", -1, msg)
		PushScaleformMovieFunctionParameterString("~y~" .. fishinglevelup)
	elseif points < Config.Level9 and points + newpoints >= Config.Level9 then
		fishinglevelup = "Congrats! You have reached level 9!"
		TriggerEvent("announce", -1, msg)
		PushScaleformMovieFunctionParameterString("~y~" .. fishinglevelup)
	elseif points < Config.Level10 and points + newpoints >= Config.Level10 then
		fishinglevelup = "Congrats! You have reached level 10! You can now Deep Sea fish and maxed your level!"
		TriggerEvent("announce", -1, msg)
		PushScaleformMovieFunctionParameterString("~y~" .. fishinglevelup)
	end
end)

RegisterNetEvent("cb-fishing:client:checklevel", function()
	PlayerData = GetPlayerData()
	local points = GetFishingRep()
	if points < Config.Level1 then
		local xp = Config.Level1 - points
		TriggerEvent('cb-fishing:client:Notify', "Fishing", "You are currently level 0 and need "..xp.." xp to reach level 1!", "info")
	elseif points < Config.Level2 and points >= Config.Level1 then
		local xp = Config.Level2 - points
		TriggerEvent('cb-fishing:client:Notify', "Fishing", "You are currently level 1 and need "..xp.." xp to reach level 2!", "info")
	elseif points < Config.Level3 and points >= Config.Level2 then
		local xp = Config.Level3 - points
		TriggerEvent('cb-fishing:client:Notify', "Fishing", "You are currently level 2 and need "..xp.." xp to reach level 3!", "info")
	elseif points < Config.Level4 and points >= Config.Level3 then
		local xp = Config.Level4 - points
		TriggerEvent('cb-fishing:client:Notify', "Fishing", "You are currently level 3 and need "..xp.." xp to reach level 4!", "info")
	elseif points < Config.Level5 and points >= Config.Level4 then
		local xp = Config.Level5 - points
		TriggerEvent('cb-fishing:client:Notify', "Fishing", "You are currently level 4 and need "..xp.." xp to reach level 5!", "info")
	elseif points < Config.Level6 and points >= Config.Level5 then
		local xp = Config.Level6 - points
		TriggerEvent('cb-fishing:client:Notify', "Fishing", "You are currently level 5 and need "..xp.." xp to reach level 6!", "info")
	elseif points < Config.Level7 and points >= Config.Level6 then
		local xp = Config.Level7 - points
		TriggerEvent('cb-fishing:client:Notify', "Fishing", "You are currently level 6 and need "..xp.." xp to reach level 7!", "info")
	elseif points < Config.Level8 and points >= Config.Level7 then
		local xp = Config.Level8 - points
		TriggerEvent('cb-fishing:client:Notify', "Fishing", "You are currently level 7 and need "..xp.." xp to reach level 8!", "info")
	elseif points < Config.Level9 and points >= Config.Level8 then
		local xp = Config.Level9 - points
		TriggerEvent('cb-fishing:client:Notify', "Fishing", "You are currently level 8 and need "..xp.." xp to reach level 9!", "info")
	elseif points < Config.Level10 and points >= Config.Level9 then
		local xp = Config.Level10 - points
		TriggerEvent('cb-fishing:client:Notify', "Fishing", "You are currently level 9 and need "..xp.." xp to reach level 10!", "info")
	elseif points >= Config.Level10 then
		TriggerEvent('cb-fishing:client:Notify', "Fishing", "Congratulations you are currently at level 10! You will no longer receive anymore xp.", "info")
	end
end)

local function Initialize(scaleform)
	local scaleform = RequestScaleformMovie(scaleform)
	while not HasScaleformMovieLoaded(scaleform) do
			Wait(0)
	end
	PushScaleformMovieFunction(scaleform, "SHOW_SHARD_RANKUP_MP_MESSAGE")
	PushScaleformMovieFunctionParameterString("~y~Level Up!")
	PushScaleformMovieFunctionParameterString("~y~" .. fishinglevelup)
	PushScaleformMovieFunctionParameterString(announcestring)
	PopScaleformMovieFunctionVoid()
	return scaleform
end

local function ActivateThread()
	if announcestring then
		CreateThread(function()
			while display do
			Wait(0)
				scaleform = Initialize("mp_big_message_freemode")
				DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
			end
		end)
	end
end

RegisterNetEvent('announce')
AddEventHandler('announce', function(msg)
	announcestring = false
	announcestring = msg
    display = true
    ActivateThread()
	PlaySoundFrontend(-1, "MP_AWARD","HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
	Wait(lastfor * 2000)
    display = false
	announcestring = false
    ActivateThread()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
	if IsFishing then
		IsFishing = false
	end
	if net then
		net = false
	end
end)