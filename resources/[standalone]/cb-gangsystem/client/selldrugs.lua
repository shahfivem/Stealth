QBCore = exports['qb-core']:GetCoreObject()
BuyerPed = 0
Corner = nil
CurrentDrug = ""
CurrentDrugCount = 0
CurrentPrice = nil
DrugEffect = nil
DrugEffectTime = 0
IsSelling = false
LoyaltyIncreased = false
IsWaiting = false
LastDrugUsed = nil
LastEvent = nil
LastShake = 0
LastSling = 0
LastSpawned = 0
LastUpdate = 0
PoliceSetup = false
DrawLineConfig = Config.DrawLine
IgnoreModels = {
	[GetHashKey("mp_f_freemode_01")] = true,
	[GetHashKey("mp_m_freemode_01")] = true,
}

local WorldText = {
	Padding = 0.01,
	Colors = {
		[1] = { r = 10, g = 20, b = 60, a = 255 },
		[2] = { r = 10, g = 20, b = 60, a = 64 },
	}
}

local function DrawText3D(coords, textInput, fontId, scale, id, lines, offset)
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

RegisterNetEvent('corner:startSelling', function()
    -- Check if player has enough drugs
    local player = PlayerPedId()
    local coords = GetEntityCoords(player)
    -- Trigger the command to start selling
    ExecuteCommand('corner')  -- Ensure this matches your command from the script
end)

Citizen.CreateThread(function()
	while true do
		if Corner then
			local PlayerData = GetPlayerData()
			local gangTag = PlayerData.gang.name
			local playerPed = PlayerPedId()
			local playerCoords = GetEntityCoords(playerPed)
			if DoesEntityExist(BuyerPed) and not IsPedDeadOrDying(BuyerPed) then
				local buyerCoords = GetEntityCoords(BuyerPed)
				local dist = #(playerCoords - buyerCoords)
				if DrawLineConfig then
					DrawLine(buyerCoords.x, buyerCoords.y, buyerCoords.z, playerCoords.x, playerCoords.y, playerCoords.z, 255, 0, 255, 255)
				end
				if CurrentPrice and dist < Config.Slinging.DrawDistance then
					local id = 2

					if dist < Config.Slinging.Distance then
						id = 1

						if not IsWaiting then
							TaskStandStill(BuyerPed, 5000)
							TaskTurnPedToFaceEntity(BuyerPed, playerPed, -1)
							IsWaiting = true
						end

						if IsControlJustPressed(0, 51) then
							-- Ensure the player is facing the buyer before proceeding
							local startTime = GetGameTimer()
							TaskTurnPedToFaceEntity(playerPed, BuyerPed, 4000)
							TaskTurnPedToFaceEntity(BuyerPed, playerPed, 4000)
							while not IsPedFacingPed(playerPed, BuyerPed, 10.0) and GetGameTimer() - startTime < 4000 do
								Citizen.Wait(0)
							end

							-- Show the progress bar and play animation
							local success = exports.erp_progressbar:taskBar({
								text = "Selling Drugs...",
								length = 2000,
								animation = {
									dict = Config.Slinging.Anim.Dict,
									anim = Config.Slinging.Anim.Name,
									stuck = false
								},
								prop = {
									model = Config.Slinging.Anim.Props[1].Model,
									bone = Config.Slinging.Anim.Props[1].Bone,
									pos = {
										x = Config.Slinging.Anim.Props[1].Offset[1],
										y = Config.Slinging.Anim.Props[1].Offset[2],
										z = Config.Slinging.Anim.Props[1].Offset[3]
									},
									rot = {
										x = Config.Slinging.Anim.Props[1].Offset[4],
										y = Config.Slinging.Anim.Props[1].Offset[5],
										z = Config.Slinging.Anim.Props[1].Offset[6]
									}
								}
							})
							
							if success == 100 then
								-- Continue with the selling process
								if not IsPedRagdoll(BuyerPed) and not IsPedDeadOrDying(BuyerPed) then
									IsSelling = true
									TaskPlayAnim(BuyerPed, Config.Slinging.Anim.Dict, Config.Slinging.Anim.Name, 4.0, 4.0, -1, Config.Slinging.Anim.Flag, 0, false, false, false)
									Citizen.Wait(2000)
									local gangZonePlayerIn = nil
									local isRivalryZone = false
									gangZonePlayerIn = exports['cb-gangsystem']:GetGangZonePlayer(GetEntityCoords(playerPed))
									if gangTag ~= "none" then
										if gangZonePlayerIn ~= nil then
											if Config.Rivalry.Enabled then
												isRivalryZone = lib.callback.await('cb-gangsystem:server:CheckZoneForRivalry', false, gangZonePlayerIn)
											end
										end
									end
									if isRivalryZone then
										TriggerServerEvent("cb-gangsystem:server:sellDrugs", gangZonePlayerIn, isRivalryZone, gangTag, Config.Loyalty.Increase.Drugs)
									else
										TriggerServerEvent("cb-gangsystem:server:sellDrugs", gangZonePlayerIn, isRivalryZone, gangTag, Config.Loyalty.Increase.Drugs)
									end
									if not LoyaltyIncreased then
										TriggerServerEvent("cb-gangsystem:server:increaseLoyalty", gangTag, gangZonePlayerIn, "Drugs")
										TriggerServerEvent("cb-gangsystem:server:increasePrevalence", gangTag, "Drugs")
										LoyaltyIncreased = true
									end
									if Config.UsingModifiedR14 then
										TriggerServerEvent('evidence:server:CreateDrugResidue', buyerCoords)
									end
									local chance = math.random(1, 100)
									if chance <= Config.AlertCopsChance or PoliceSetup then
										if PoliceSetup then
											if Config.OptionalLogs.PoliceSetup then
												TriggerServerEvent('cb-gangsystem:server:PoliceSetup')
											end
										end
										if Config.DispatchSystem == "cd_dispatch" then
											local data = exports['cd_dispatch']:GetPlayerInfo()
											TriggerServerEvent('cd_dispatch:AddNotification', {
												job_table = Config.PoliceAlertJobs,
												coords = data.coords,
												title = '10-15 - Drug Sale',
												message = 'A ' .. data.sex .. ' Selling Drugs at ' .. data.street,
												flash = 0,
												unique_id = data.unique_id,
												sound = 1,
												blip = {
													sprite = 51,
													scale = 1.2,
													colour = 3,
													flashes = false,
													text = '911 - Drug Sale',
													time = 5,
													radius = 0,
												}
											})
										elseif Config.DispatchSystem == "ps-dispatch" then
											exports['ps-dispatch']:DrugSale()
										elseif Config.DispatchSystem == "qs-dispatch" then
											exports['qs-dispatch']:DrugSale()
										elseif Config.DispatchSystem == "codem" then
											local Data = {
												type = 'Drug',
												header = 'Drug Sale',
												text = "Reports of Drug Sales in the area!",
												code = "911",
											}
											exports['codem-dispatch']:CustomDispatch(Data)
										elseif Config.DispatchSystem == "custom" then
											CustomDispatchNotify()
										end
										PoliceSetup = false
									end
									ClearPedSecondaryTask(BuyerPed)
									TaskWanderStandard(BuyerPed, 10.0, 10)
									BuyerPed = 0
									Citizen.Wait(1000)
								end
							end
						elseif IsControlJustPressed(0, 47) or IsPedFleeing(BuyerPed) then
							TaskWanderStandard(BuyerPed, 10.0, 10)
							BuyerPed = 0
						end
					end

					if BuyerPed ~= 0 then
						DrawText3D(buyerCoords, string.format(Translations.drugSelling.drugSaleInfo, CurrentPrice * CurrentDrugCount, GetItemLabel(CurrentDrug), CurrentDrugCount), 4, 0.4, id, 1, vector2(0.0, -0.03))
						DrawText3D(buyerCoords, Translations.drugSelling.drugSaleAccept, 4, 0.4, id, 1, vector2(0.0, 0.0))
						DrawText3D(buyerCoords, Translations.drugSelling.drugSaleReject, 4, 0.4, id, 1, vector2(0.0, 0.03))
					end
				end
				if IsPedClimbing(BuyerPed) then
					ClearPedTasksImmediately(BuyerPed)
					TaskReactAndFleePed(BuyerPed, playerPed)
					BuyerPed = 0
				elseif not IsWaiting and not GetIsTaskActive(BuyerPed, 224) and GetGameTimer() - LastUpdate > 500 then
					TaskFollowNavMeshToCoord(BuyerPed, playerCoords.x, playerCoords.y, playerCoords.z, 1.0, -1, 0, false, 0)
					-- TaskGoToCoordAnyMeans(BuyerPed, playerCoords.x, playerCoords.y, playerCoords.z, 1.0, 0, 0, 786603, 0xbf800000)
					LastUpdate = GetGameTimer()
				end
			elseif not IsSelling then
				Spawn()
				Citizen.Wait(1000)
			end
			if Corner and #(Corner - playerCoords) > Config.Slinging.MaxRange then
				StopSlinging()
			end
			LastSling = GetGameTimer()
		else
			if DoesEntityExist(BuyerPed) then
				TaskWanderStandard(BuyerPed, 10.0, 10)
				BuyerPed = 0
			end
			Citizen.Wait(1000)
		end
		Citizen.Wait(0)
	end
end)

function Spawn()
	if GetGameTimer() - LastSpawned < Config.Slinging.SpawnCooldown then return end
	TriggerServerEvent("cb-gangsystem:server:attemptSell", CurrentDrug)
end

function StopSlinging()
	Corner = nil
	TriggerEvent('cb-gangsystem:client:Notify', Translations.drugSelling.notSlinging,
		Translations.drugSelling.notSlingingDesc, "info")
end

RegisterNetEvent("cb-gangsystem:client:sellDrugs")
AddEventHandler("cb-gangsystem:client:sellDrugs", function(salePrice)
	IsSelling = false
	LoyaltyIncreased = false
	if Config.OptionalNotifications.OnDrugSale then
		local message = string.format(Translations.drugSelling.soldDrugsDesc, CurrentDrugCount, GetItemLabel(CurrentDrug), salePrice)
		TriggerEvent('cb-gangsystem:client:Notify', Translations.drugSelling.soldDrugs, message, "success")
	end
	if not CheckItem(CurrentDrug, 1) then
		StopSlinging()
	end
end)

RegisterNetEvent("cb-gangsystem:client:attemptSell")
AddEventHandler("cb-gangsystem:client:attemptSell", function(price, amount)
    if not price then return end
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    -- Fetching peds using QBCore function.
    local peds = GetPeds()
    local randomPeds = {}
    for _, ped in ipairs(peds) do
        if not IsPedAPlayer(ped) and IsPedHuman(ped) and not IgnoreModels[GetEntityModel(ped)] then
            table.insert(randomPeds, ped)
        end
    end
    if #randomPeds == 0 then
        return
    end
    local referencePed = randomPeds[math.random(1, #randomPeds)]
    if not referencePed then return end

    local radius = math.random(25.0, 50.0)
    local radians = math.random() * 2.0 * math.pi

    local x, y = coords.x + math.cos(radians) * radius, coords.y + math.sin(radians) * radius
    local retval, outCoords = GetSafeCoordForPed(x, y, coords.z, true, 0)

    if not retval then
        retval, outCoords = GetSafeCoordForPed(x, y, coords.z, false, 0)
    end

    if not retval then return end

    -- Set the global variables.
	local drugSaleMultiplier = lib.callback.await('cb-gangsystem:server:DrugSaleMultiplier', false)
	CurrentPrice = math.ceil(price * drugSaleMultiplier)
    CurrentDrugCount = amount

    -- Create the buyer ped.
    BuyerPed = CreatePed(GetPedType(referencePed), GetEntityModel(referencePed), outCoords.x, outCoords.y, outCoords.z,
        0.0, true, false)
    DecorSetBool(BuyerPed, "No_Report", math.random() > 0.05)
    SetEntityCoordsNoOffset(BuyerPed, outCoords.x, outCoords.y, outCoords.z)
    SetEntityAsNoLongerNeeded(BuyerPed)

    -- Check if BuyerPed's model should notify the police
    local buyerModel = GetEntityModel(BuyerPed)
    for _, model in ipairs(Config.PoliceCallModels) do
        if buyerModel == GetHashKey(model) then
			if Config.Debug then lib.print.info("It's a setup...") end
            PoliceSetup = true
            break
        end
    end
    IsWaiting = false
    LastSpawned = GetGameTimer()
end)

RegisterNetEvent("cb-gangsystem:client:stopSelling")
AddEventHandler("cb-gangsystem:client:stopSelling", function()
	StopSlinging()
end)

RegisterCommand(Config.SellDrugsCommand, function(source, args, command)
	if Corner then
		StopSlinging()
		return
	end
	local src = source
	if src == nil then return end
	local PlayerData = GetPlayerData()
	local gang = PlayerData.gang.name
	local p = promise.new()
	local copCount = lib.callback.await('cb-gangsystem:GetCopCount', false)
	local allowedByPrevalence = lib.callback.await('cb-gangsystem:server:AllowedByPrevalence', false, gang, "Drugs")
	if copCount < Config.MinCops then
		TriggerEvent('cb-gangsystem:client:Notify', Translations.drugSelling.copCount, Translations.drugSelling.copCountDesc, "error")
		return
	end
	if not allowedByPrevalence and gang ~= "none" and gang ~= "None" then
		TriggerEvent('cb-gangsystem:client:Notify', "Not Enough Prevalence", "The locals don't respect your Gang enough to buy drugs! Increase your prevalence and try again later!", "error")
		return
	end
	if GetGameTimer() - LastSling < Config.Slinging.Cooldown * 1000 then
		TriggerEvent('cb-gangsystem:client:Notify', Translations.drugSelling.slingingTooFast,
			Translations.drugSelling.slingingTooFastDesc, "error")
		return
	end
	
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local interiorId = GetInteriorFromEntity(playerPed)
	local items = {}
	
	for drug, _ in pairs(Config.DrugPrices) do
		if CheckItem(drug, 1) then
			items[#items + 1] = drug
		end
	end
	
	if #items == 0 then
		TriggerEvent('cb-gangsystem:client:Notify', Translations.drugSelling.noDrugs,
			Translations.drugSelling.noDrugsDesc, "error")
		return
	end
	
	if Config.OnlySlingOutside then
		if #items > 0 and (interiorId == 0) then
			CurrentDrug = items[GetRandomIntInRange(1, #items)]
			local message = string.format(Translations.drugSelling.slingingDesc, GetItemLabel(CurrentDrug))
			TriggerEvent('cb-gangsystem:client:Notify', Translations.drugSelling.slingingLabel, message, "info")
		else
			TriggerEvent('cb-gangsystem:client:Notify', Translations.drugSelling.cantSlingHere,
				Translations.drugSelling.cantSlingHereDesc, "error")
			return
		end
	else
		if #items > 0 then
			CurrentDrug = items[GetRandomIntInRange(1, #items)]
			local message = string.format(Translations.drugSelling.slingingDesc, GetItemLabel(CurrentDrug))
			TriggerEvent('cb-gangsystem:client:Notify', Translations.drugSelling.slingingLabel, message, "info")
		else
			TriggerEvent('cb-gangsystem:client:Notify', Translations.drugSelling.cantSlingHere,
				Translations.drugSelling.cantSlingHereDesc, "error")
			return
		end
	end
	LastSling = GetGameTimer()
	Corner = coords
	IsSelling = false
	LoyaltyIncreased = false
end, false)

TriggerEvent('chat:addSuggestion', '/'..Config.SellDrugsCommand, Translations.commands.help.corner, {})