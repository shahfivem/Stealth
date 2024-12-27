-- ██████╗ █████╗ ██╗     ██╗     ██████╗  █████╗  ██████╗██╗  ██╗███████╗
--██╔════╝██╔══██╗██║     ██║     ██╔══██╗██╔══██╗██╔════╝██║ ██╔╝██╔════╝
--██║     ███████║██║     ██║     ██████╔╝███████║██║     █████╔╝ ███████╗
--██║     ██╔══██║██║     ██║     ██╔══██╗██╔══██║██║     ██╔═██╗ ╚════██║
--╚██████╗██║  ██║███████╗███████╗██████╔╝██║  ██║╚██████╗██║  ██╗███████║
-- ╚═════╝╚═╝  ╚═╝╚══════╝╚══════╝╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝
lib.callback.register('cb-gangsystem:server:GetCurrentMission', function(source)
    local src = source
    local Player = GetPlayer(src)
    if Player == nil then return end
    return Missions[Player.PlayerData.citizenid] and Missions[Player.PlayerData.citizenid].current or nil
end)

lib.callback.register('cb-gangsystem:server:addMoneyToFund', function(source, gangTag, depositAmount)
    local src = source
    local Player = GetPlayer(src)
    if Player == nil then return end
    local firstName = Player.PlayerData.charinfo.firstname
    local lastName = Player.PlayerData.charinfo.lastname
    local cid = Player.PlayerData.citizenid
    local gangID = GetGangIDByTag(gangTag)
    local gangName = GetGangNameFromID(gangID)
    local balance = GangData[gangID].balance
    if Player.Functions.RemoveMoney('cash', depositAmount) then
        local newBalance = balance + depositAmount
        UpdateGangFundBalance(gangID, newBalance)
        local data = string.format("%s %s (%s) added money to Gang Fund. `Gang: %s` `Amount: $%.0f` `Balance: $%.0f`", firstName, lastName, cid, gangName, depositAmount, newBalance)
        GangSystemLog(data)
        return true
    else
        return false
    end
end)

lib.callback.register('cb-gangsystem:server:CheckZoneForRivalry', function(source, zone)
    local zoneRivalry = IsZoneARivalry(zone)
    if zoneRivalry then
        return true
    else
        return false
    end
end)

lib.callback.register('cb-gangsystem:server:DoesGangExist', function(source, gangTag)
    local gangID = GetGangIDByTag(gangTag)
    if GangData[gangID] then
        return true
    else
        return false
    end
end)

lib.callback.register('cb-gangsystem:server:GetRoutingBucket', function(source)
    local src = source
    local bucket = GetPlayerRoutingBucket(src)
    return bucket
end)

lib.callback.register('cb-gangsystem:server:CheckWarOutfit', function(source)
    local src = source
    local Player = GetPlayer(src)
    if Player == nil then return end
    local gangTag = Player.PlayerData.gang.name
    local gang_id = GetGangIDByTag(gangTag)
    local warOutfit = GangData[gang_id].warOutfit
    return warOutfit
end)

lib.callback.register('cb-gangsystem:server:WarCheckIn', function(source)
    local src = source
    local Player = GetPlayer(src)
    if Player == nil then return end
    local gangTag = Player.PlayerData.gang.name
    local gangID = GetGangIDByTag(gangTag)
    return WarCheckIn(src, gangID)
end)

lib.callback.register('cb-gangsystem:server:WarCheckOut', function(source)
    local src = source
    local Player = GetPlayer(src)
    if Player == nil then return end
    local gangTag = Player.PlayerData.gang.name
    local gangID = GetGangIDByTag(gangTag)
    return WarCheckOut(src, gangID)
end)

lib.callback.register('cb-gangsystem:GetCopCount', function(_)
    return PlayersWithJob()
end)

lib.callback.register('cb-gangsystem:GetGangData', function(_)
    return GangData
end)

lib.callback.register('cb-gangsystem:server:IsPlayerCheckedIn', function(player_id)
    return exports['cb-gangsystem']:IsPlayerCheckedIn(player_id)
end)

lib.callback.register('cb-gangsystem:server:GetGangPermissions', function(source)
    return GangPermissions
end)

lib.callback.register('cb-gangsystem:server:SendGuidebookMessage', function(player_id, message)
    TriggerClientEvent('cb-gangsystem:client:Notify', player_id, "Help", message, "info")
end)

lib.callback.register('cb-gangsystem:server:GetAllWars', function()
    local wars = SQLQuery("SELECT * FROM gang_wars")
    return wars
end)

lib.callback.register('cb-gangsystem:server:StaffModifyPrevalence', function(source, gangID, amount, modifier)
    if modifier == "Increase" then
        exports['cb-gangsystem']:CustomPrevalenceIncrease(gangID, amount)
        return GangData
    elseif modifier == "Decrease" then
        exports['cb-gangsystem']:CustomPrevalenceDecrease(gangID, amount)
        return GangData
    end
    return false
end)

lib.callback.register('cb-gangsystem:server:ModifyPrevalence', function(source, gangID, amount, modifier)
    if modifier == "Increase" then
        exports['cb-gangsystem']:CustomPrevalenceIncrease(gangID, amount)
        return GangData
    elseif modifier == "Decrease" then
        exports['cb-gangsystem']:CustomPrevalenceDecrease(gangID, amount)
        return GangData
    end
    return false
end)

lib.callback.register('cb-gangsystem:server:ModifyWarScore', function(source, gangID, modifyAmount, modifier, warID)
    local wars = SQLQuery("SELECT * FROM gang_wars")
    for _, war in ipairs(wars) do
        if war.id == warID then
            if war.declareeGangID == gangID and war.warStatus == "Active" then
                local score = war.declareeScore
                local newScore = score
                if modifier == "Increase" then
                    newScore = score + modifyAmount
                elseif modifier == "Decrease" then
                    newScore = score - modifyAmount
                    if newScore < 0 then
                        newScore = 0
                    end
                end
                SQLQuery("UPDATE gang_wars SET declareeScore = ? WHERE id = ?", {newScore, war.id})
                return GangData
            elseif war.gangID == gangID and war.warStatus == "Active" then
                local score = war.gangScore
                local newScore = score
                if modifier == "Increase" then
                    newScore = score + modifyAmount
                elseif modifier == "Decrease" then
                    newScore = score - modifyAmount
                    if newScore < 0 then
                        newScore = 0
                    end
                end
                SQLQuery("UPDATE gang_wars SET gangScore = ? WHERE id = ?", {newScore, war.id})
                return GangData
            end
        end
    end
end)

lib.callback.register('cb-gangsystem:server:AllowedByPrevalence', function(source, gangTag, action)
    local gangID = GetGangIDByTag(gangTag)
    local prevalence = GangData[gangID].prevalence
    return exports['cb-gangsystem']:AllowedByPrevalence(prevalence, action)
end)

lib.callback.register('cb-gangsystem:server:DrugSaleMultiplier', function(source)
    local policeCount = PlayersWithJob()
    if Config.Debug then 
        lib.print.info(string.format("Online Cops: %d", policeCount)) 
    end
    local drugSaleMultiplier = Config.DrugSaleMultiplier(policeCount)
    if Config.Debug then 
        lib.print.info(string.format("Drug Sale Multiplier: %.2f", drugSaleMultiplier)) 
    end
    return drugSaleMultiplier
end)

lib.callback.register('cb-gangsystem:server:CanCraft', function(source, items, requestedAmount)
    local src = source
    if src == nil then
        return false
    end
    for _, ingredient in ipairs(items) do
        local requiredAmount = requestedAmount * ingredient.amount
        if HasItem(src, ingredient.item, requiredAmount) then
        else
            return false
        end
    end
    return true
end)

lib.callback.register('cb-gangsystem:server:CheckLastBlueprint', function(source)
    local Player = GetPlayer(source)
    if not Player then 
        return "Not Player"
    end

    local gangTag = Player.PlayerData.gang.name
    local gang_id = GetGangIDByTag(gangTag)
    local inTimeout = IsGangTimeout(gang_id)
    local warTimeout = IsWarTimeout(gang_id)


    -- Check if Blueprints timeout is enabled and the gang is in timeout
    if Config.GangTimeout.Blueprints and inTimeout then
        return "Gang Timeout"
    end

    if Config.WarTimeout.Blueprints and warTimeout then
        return "War Timeout"
    end

    local atWar = GangData[gang_id].war ~= 0
    if atWar and not Config.GangWars.Modifiers.blueprints then
        return "Gang War"
    end

    local lastBP = GetLastBlueprint(gang_id)
    if not lastBP or os.time() - lastBP >= 3600 * Config.BlueprintTableWaitTime then
        return "Access Granted"
    else
        return "Not Ready Yet"
    end
end)

lib.callback.register('cb-gangsystem:server:CheckLastBlueprintPerson', function(source)
    local Player = GetPlayer(source)
    if not Player then 
        return "Not Player"
    end

    local gangTag = Player.PlayerData.gang.name
    local gang_id = GetGangIDByTag(gangTag)
    local inTimeout = IsGangTimeout(gang_id)
    local warTimeout = IsWarTimeout(gang_id)

    -- Check if Blueprints timeout is enabled and the gang is in timeout
    if Config.GangTimeout.Blueprints and inTimeout then
        return "Gang Timeout"
    end

    if Config.WarTimeout.Blueprints and warTimeout then
        return "War Timeout"
    end

    local atWar = GangData[gang_id].war ~= 0
    if atWar and not Config.GangWars.Modifiers.blueprints then
        return "Gang War"
    end

    local lastBP = Player.PlayerData.metadata['lastBlueprint']
    if not lastBP or os.time() - lastBP >= 3600 * Config.BlueprintTableWaitTime then
        return "Access Granted"
    else
        return "Not Ready Yet"
    end
end)

lib.callback.register('cb-gangsystem:server:CheckLastGift', function(source)
    local Player = GetPlayer(source)
    if not Player then 
        return "Error"
    end
    local gangTag = Player.PlayerData.gang.name
    local gang_id = GetGangIDByTag(gangTag)
    local inTimeout = IsGangTimeout(gang_id)
    local warTimeout = IsWarTimeout(gang_id)
    local homeTurf = GangData[gang_id].home_turf
    -- Check if Gifts timeout is enabled and the gang is in timeout
    if Config.GangTimeout.Gifts and inTimeout then
        return "Timeout"
    end
    if Config.WarTimeout.Gifts and warTimeout then
        return "War Timeout"
    end
    if homeTurf == "Taken" then
        return "Taken"
    elseif homeTurf == "None" then
        return "No-Home-Turf"
    end
    local last_gift = GetLastGift(gang_id)
    if os.time() - last_gift >= 24 * 60 * 60 or last_gift == 0 then
        return "Allowed"
    else
        return "Not-Allowed"
    end
end)

lib.callback.register('cb-gangsystem:server:CanStartMission', function(source)
    local Player = GetPlayer(source)
    if not Player then 
        return "Error"
    end
    local cid = Player.PlayerData.citizenid
    local sourceGangTag = Player.PlayerData.gang.name
    local sourceGangID = GetGangIDByTag(sourceGangTag)
    if (sourceGangTag == "none") or (sourceGangTag == nil) then
        return "False"
    end
    local home_turf = GetHomeTurf(sourceGangID)
    if home_turf == nil or home_turf == "None" then
        return "No-Home-Turf"
    end
    if home_turf == "Taken" then
        return "Taken"
    end
    local inTimeout = IsGangTimeout(sourceGangID)
    local warTimeout = IsWarTimeout(sourceGangID)
    -- Check if GangMissions timeout is enabled and the gang is in timeout
    if Config.GangTimeout.GangMissions and inTimeout then
        return "Timeout"
    end
    if Config.WarTimeout.GangMissions and warTimeout then
        return "War Timeout"
    end
    if sourceGangTag ~= "none" and sourceGangTag ~= nil then
        local missionData = Missions[cid]
        if not missionData or (missionData.completed < Config.MaxMissions and missionData.current == nil) then
            return "True"
        elseif missionData.current ~= nil then
            return "Current-Mission"
        else
            return "False"
        end
    else
        return "False"
    end
end)

lib.callback.register('cb-gangsystem:server:AccessGangTable', function(source, zone)
    local Player = GetPlayer(source)
    if not Player then 
        return "Not Player"
    end

    local gangTag = Player.PlayerData.gang.name
    local gang_id = GetGangIDByTag(gangTag)
    if gang_id == nil then
        return "No Gang ID"
    end

    local inTimeout = IsGangTimeout(gang_id)
    local warTimeout = IsWarTimeout(gang_id)

    -- Check if GangHideout timeout is enabled and the gang is in timeout
    if Config.GangTimeout.GangHideout and inTimeout then
        return "Gang Timeout"
    end

    if Config.WarTimeout.GangHideout and warTimeout then
        return "War Timeout"
    end

    local atWar = GangData[gang_id].war ~= 0
    if atWar and not Config.GangWars.Modifiers.hideouts then
        return "Gang War"
    end

    local home_turf = GetHomeTurf(gang_id)
    local hasSpecialTurf = home_turf == zone

    if hasSpecialTurf then
        if home_turf ~= "Taken" then
            local gangAtZone = GetGangAtZoneReturnID(home_turf)
            if gangAtZone == gang_id then
                return "Access Granted"
            end
        else
            return "Home Turf Taken"
        end
    else
        return "No Turf"
    end
end)

lib.callback.register('cb-gangsystem:server:CanDeclareHomeTurf', function(source)
    local Player = GetPlayer(source)
    if not Player then 
        return false
    end
    local gangTag = Player.PlayerData.gang.name
    local gang_id = GetGangIDByTag(gangTag)
    if (gangTag == "none" or gangTag == nil) or not (Player.PlayerData.citizenid == GangData[gang_id].leader_cid) then
        return false
    end
    local last_home_turf = GetLastHomeTurf(gang_id)
    if last_home_turf == nil then
        lib.print.error("last_home_turf is nil")
        return false
    end
    if last_home_turf == 0 then
        return true
    end
    local currentTime = os.time()
    local twentyFourHoursInSeconds = 24 * 60 * 60
    local time = Config.DeclareHomeTurf_Cooldown * twentyFourHoursInSeconds
    if currentTime - last_home_turf < time then
        return false
    else
        return true
    end
end)

lib.callback.register('cb-gangsystem:server:GetLastBlackMarket', function(source)
    local Player = GetPlayer(source)
    if not Player then 
        return false
    end
    local gangTag = Player.PlayerData.gang.name
    local gang_id = GetGangIDByTag(gangTag)
    local last_bm_shop = GangData[gang_id].last_bm_shop
    local currentTime = os.time()
    local twentyFourHoursInSeconds = 24 * 60 * 60
    local time = Config.BlackMarketCooldown * twentyFourHoursInSeconds
    if currentTime - last_bm_shop < time then
        return false
    else
        return true
    end
end)

lib.callback.register('cb-gangsystem:server:IsGangLeader', function(source)
    local Player = GetPlayer(source)
    if not Player then 
        return false
    end
    local gangTag = Player.PlayerData.gang.name
    local gangID = GetGangIDByTag(gangTag)
    return Player.PlayerData.citizenid == GangData[gangID].leader_cid
end)
