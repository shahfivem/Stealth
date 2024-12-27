--███████╗██╗   ██╗███████╗███╗   ██╗████████╗███████╗
--██╔════╝██║   ██║██╔════╝████╗  ██║╚══██╔══╝██╔════╝
--█████╗  ██║   ██║█████╗  ██╔██╗ ██║   ██║   ███████╗
--██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║╚██╗██║   ██║   ╚════██║
--███████╗ ╚████╔╝ ███████╗██║ ╚████║   ██║   ███████║
--╚══════╝  ╚═══╝  ╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    StartupPrint()
end)

local firstRun = true
RegisterNetEvent("cb-gangsystem:server:DrawGangZones")
AddEventHandler("cb-gangsystem:server:DrawGangZones", function(source)
    Citizen.CreateThread(function()
        while true do
            UpdateGangZoneData()
            local turfControllers = GetTurfControllers()
            TriggerClientEvent('cb-gangsystem:client:redrawZones', source, turfControllers, GangData)
            Citizen.Wait(firstRun and 5000 or 60000)
            firstRun = false
        end
    end)
end)

RegisterNetEvent("cb-gangsystem:server:RegisterStash")
AddEventHandler("cb-gangsystem:server:RegisterStash", function(stashName)
    if not UsingOxInventory and Config.UsingNewQB then
        local src = source
        exports['qb-inventory']:OpenInventory(src, stashName)
    elseif UsingOxInventory then
        local src = source
        local Player = GetPlayer(src)
        if Player == nil then return end
        exports.ox_inventory:RegisterStash(stashName, stashName, 200, 2000000, nil, nil)
        exports.ox_inventory:forceOpenInventory(src, 'stash', stashName)
    end
end)

RegisterNetEvent("cb-gangsystem:server:loadGangStorage")
AddEventHandler("cb-gangsystem:server:loadGangStorage", function()
    TriggerClientEvent('cb-gangsystem:client:RemoveStorageZone', -1)
    -- Gather gangs with non-nil storages
    local gangStorages = {}
    for _, gangInfo in pairs(GangData) do
        if gangInfo.storage ~= nil and gangInfo.storage ~= "(NULL)" then
            table.insert(gangStorages, { id = gangInfo.id, storage = gangInfo.storage })
        end
    end
    -- Trigger client event and pass the gang storages table
    TriggerClientEvent("cb-gangsystem:client:updateGangStorage", -1, gangStorages, GangData)
end)

RegisterServerEvent("cb-gangsystem:server:changeStorageCoords")
AddEventHandler("cb-gangsystem:server:changeStorageCoords", function(coords)
    local src = source
    local Player = GetPlayer(src)
    if Player == nil then return end
    local gangTag = Player.PlayerData.gang.name
    local gangID = GetGangIDByTag(gangTag)
    local formatCoords = string.format("vector3(%.2f, %.2f, %.2f)", coords.x, coords.y, coords.z)
    SQLQuery("UPDATE gangs SET storage = ? WHERE id = ?", {formatCoords, gangID})
    GangData[gangID].storage = formatCoords
    TriggerEvent("cb-gangsystem:server:loadGangStorage")
end)

RegisterServerEvent("cb-gangsystem:server:ResetGangStorage")
AddEventHandler("cb-gangsystem:server:ResetGangStorage", function(gangID)
    SQLQuery("UPDATE gangs SET storage = ? WHERE id = ?", {"(NULL)", gangID})
    GangData[gangID].storage = "(NULL)"
    TriggerEvent("cb-gangsystem:server:loadGangStorage")
end)

RegisterServerEvent("cb-gangsystem:server:SaveWarOutfit")
AddEventHandler("cb-gangsystem:server:SaveWarOutfit", function(variations)
    local src = source
    local Player = GetPlayer(src)
    if Player == nil then return end
    local gangTag = Player.PlayerData.gang.name
    local gangID = GetGangIDByTag(gangTag)
    SQLQuery("UPDATE gangs SET warOutfit = ? WHERE id = ?", {json.encode(variations), gangID})
    GangData[gangID].warOutfit = variations
end)

RegisterServerEvent("cb-gangsystem:server:ToggleProtection")
AddEventHandler("cb-gangsystem:server:ToggleProtection", function(gangID, currentlyProtected)
    local src = source
    local fund = GangData[gangID].balance
    local cost = Config.ProtectionCost
    if not currentlyProtected then
        if not ProtectGang(gangID) then
            TriggerClientEvent('cb-gangsystem:client:Notify', src, "Not Enough Funds", "You do not have enough money in your Gang Fund to protect your Gang!", "error")
            return
        else
            TriggerClientEvent('cb-gangsystem:client:Notify', src, "Protected", "Your gang is now protected!", "success")
            local data = string.format("Gang %s has started protection", GangData[gangID].name)
          --  GangSystemLog(data)
        end
    else
        UnprotectGang(gangID)
        TriggerClientEvent('cb-gangsystem:client:Notify', src, "Protection Ended", "You do not have enough money in your Gang Fund to protect your Gang!", "error")
        local data = string.format("Gang %s has ended protection", GangData[gangID].name)
       -- GangSystemLog(data)
    end
end)

-- TODO: Make it so when the player changes out of hte war outfit when at war, they are auto dropped from check in. Loop every 10 mintues
RegisterServerEvent("cb-gangsystem:server:InitiateGangWar")
AddEventHandler("cb-gangsystem:server:InitiateGangWar", function(declareeGangID, gangID, type, zone)
    local src = source
    SQLQuery("UPDATE gangs SET war = ? WHERE id = ?", {gangID, declareeGangID})
    SQLQuery("UPDATE gangs SET war = ? WHERE id = ?", {declareeGangID, gangID})
    -- Get current time and calculate the end time (24 hours later)
    local startTime = os.time()
    local endTime = startTime + (24 * 60 * 60)  -- Add 24 hours (86400 seconds)

    local decalreeGangName = GangData[declareeGangID].name
    local gangName = GangData[gangID].name

    -- Insert the war data into the new 'gang_wars' table, including the endTime as a Unix timestamp
    SQLQuery("INSERT INTO gang_wars (declareeGangID, gangID, declareeGangName, gangName, warType, zone, startTime, endTime) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", {declareeGangID, gangID, decalreeGangName, gangName, type, zone, startTime, endTime})

    -- Update local data for both gangs in GangData
    GangData[gangID].war = declareeGangID
    GangData[declareeGangID].war = gangID

    if type == "Turf" then
        GangData[gangID].warZone = zone
        GangData[declareeGangID].warZone = zone
    end

    local warType = type
    if warType == "Turf" then
        warType = "Turf War for " .. exports['cb-gangsystem']:GetTurfName(zone)
    elseif warType == "Color" then
        warType = "Color War"
    elseif warType == "Regular" then
        warType = "Regular War"
    end
    NotifyOnlineMembers(src, string.format("War has been declared on %s", GangData[gangID].name))
end)

RegisterServerEvent("cb-gangsystem:server:StaffStopWar")
AddEventHandler("cb-gangsystem:server:StaffStopWar", function(gangID)
    local otherGang = GangData[gangID].war
    SQLQuery("UPDATE gangs SET war = 0 WHERE id = ?", {gangID})
    SQLQuery("UPDATE gangs SET war = 0 WHERE id = ?", {otherGang})
    GangData[gangID].war = 0
    GangData[otherGang].war = 0

    local endTime = os.time()  -- Set endTime to current time (Unix timestamp)
    SQLQuery("UPDATE gang_wars SET warStatus = 'Complete', endTime = ? WHERE (gangID = ? AND declareeGangID = ?) OR (gangID = ? AND declareeGangID = ?)", {endTime, gangID, otherGang, otherGang, gangID})

    local data = string.format("The war between %s and %s has been stopped by the Gods!", GangData[gangID].name, GangData[otherGang].name)
    GangSystemLog(data)
    exports['fm-logs']:createLog({
        LogType = "Gang War", -- The log type
        Message = "Gang Stop war", -- The message of the log
        Level = "info", -- The level of the log (can be filtered on Fivemerr) (info by default)
        Resource = "cb-gangsystem", -- Resource where the log is coming from (If not provided, `fm-logs` will be set by default)
        Metadata = {
            GangData[gangID].name,
            GangData[otherGang].name,
        }
    })
end)

RegisterServerEvent("cb-gangsystem:server:GangSurrender")
AddEventHandler("cb-gangsystem:server:GangSurrender", function(gangID)
    local otherGang = GangData[gangID].war
    SQLQuery("UPDATE gangs SET war = 0 WHERE id = ?", {gangID})
    SQLQuery("UPDATE gangs SET war = 0 WHERE id = ?", {otherGang})

    GangData[gangID].war = 0
    GangData[otherGang].war = 0
    local wars = SQLQuery("SELECT * FROM gang_wars")
    local warType = nil
    local warZone = nil
    for _, war in ipairs(wars) do
        if (war.declareeGangID == gangID or war.gangID == gangID) and war.warStatus == "Active" then
            warType = war.warType
            if warType == "Turf" then
                warZone = war.zone
            end
            SQLQuery("UPDATE gang_wars SET surrenderGang = ? WHERE id = ?", {gangID, war.id})
        end
    end
    SQLQuery("UPDATE gangs SET warOutfit = ? WHERE id = ?", {"NA", gangID})
    GangData[gangID].warOutfit = "NA"

    SQLQuery("UPDATE gangs SET warOutfit = ? WHERE id = ?", {"NA", otherGang})
    GangData[otherGang].warOutfit = "NA"

    local endTime = os.time()  -- Set endTime to current time (Unix timestamp)
    SQLQuery("UPDATE gang_wars SET warStatus = 'Complete', endTime = ? WHERE (gangID = ? AND declareeGangID = ?) OR (gangID = ? AND declareeGangID = ?)", {endTime, gangID, otherGang, otherGang, gangID})

    if warType == "Regular" then
        DecreaseLoyalty(gangID, GetHomeTurf(gangID), Config.Loyalty.Decrease.LostRegularWar)
    elseif warType == "Color" then
        DecreaseLoyalty(gangID, GetHomeTurf(gangID), Config.Loyalty.Decrease.LostColorWar)
    elseif warType == "Turf" then
        DecreaseLoyalty(gangID, GetHomeTurf(gangID), Config.Loyalty.Decrease.LostTurfWar)
    end
    LostWar(gangID, warType)
    local data = string.format("%s surrendered to %s. The war has been stopped", GangData[gangID].name, GangData[otherGang].name)
    GangSystemLog(data)
end)

-- Some random ideas
--TODO: Maybe clear the war outfits after each war, allow that to be configurable in the config.lua
RegisterNetEvent("cb-gangsystem:server:increasePrevalence")
AddEventHandler("cb-gangsystem:server:increasePrevalence", function(gangTag, increaseType)
    PrevalenceIncrease(gangTag, increaseType)
end)

RegisterNetEvent("cb-gangsystem:server:decreasePrevalence")
AddEventHandler("cb-gangsystem:server:decreasePrevalence", function(gangTag, decreaseType)
    PrevalenceDecrease(gangTag, decreaseType)
end)

RegisterNetEvent("cb-gangsystem:server:increaseLoyalty")
AddEventHandler("cb-gangsystem:server:increaseLoyalty", function(gangTag, zone, increaseType)
    local src = source
    local gangID = GetGangIDByTag(gangTag)
    if gangID == nil then return end -- Do nothing if the player is not part of any gang
    for k, v in pairs(GangData) do
        if v.home_turf == zone then
            if IsGangProtected(v.id) then
                if gangID ~= v.id then
                    TriggerClientEvent('cb-gangsystem:client:Notify', src, "Protection", "This gang is protected! You must Declare War to take the Turf", "info")
                    return
                end
            end
        end
    end
    if increaseType == "Drugs" and (zone ~= nil) then
        UpdateLoyalty(gangID, zone, Config.Loyalty.Increase.Drugs)
    elseif increaseType == "Spray" and (zone ~= nil) then
        UpdateLoyalty(gangID, zone, Config.Loyalty.Increase.Spray)
    elseif increaseType == "Capture" and (zone ~= nil) then
        UpdateLoyalty(gangID, zone, Config.Loyalty.Increase.Capture)
    elseif increaseType == "Leader Capture" and (zone ~= nil) then
        UpdateLoyalty(gangID, zone, Config.Loyalty.Increase.LeaderCapture)
    elseif increaseType == "Presence" and (zone ~= nil) then
        if exports['cb-gangsystem']:AllowedByPrevalence(GangData[gangID].prevalence, "Presence") then
            UpdateLoyalty(gangID, zone, Config.Loyalty.Increase.Presence)
            local data = string.format("%s earned %.0f loyalty in %s for maintaining a presence in the turf", GangData[gangID].name, Config.Loyalty.Increase.Presence, exports['cb-gangsystem']:GetTurfName(zone))
           -- GangSystemLog(data)
            exports['fm-logs']:createLog({
                LogType = "Loyalty Increase", -- The log type
                Message = "Loyalty Increase", -- The message of the log
                Level = "info", -- The level of the log (can be filtered on Fivemerr) (info by default)
                Resource = "cb-gangsystem", -- Resource where the log is coming from (If not provided, `fm-logs` will be set by default)
                Metadata = {
                    cid = cid,
                    gangID = GetGangNameFromID(gangID),
                    zone = zone,
                    
                }
            })
        end
    elseif increaseType == "Vendetta" and (zone ~= nil) then
        UpdateLoyalty(gangID, zone, Config.Loyalty.Increase.Vendetta)
    end
    UpdateGangZoneData()
    local gangAtZone = GetGangAtZoneReturnID(zone)
    if Config.OptionalNotifications.OnTurfIncrease then
        if gangAtZone ~= nil then
            for id, data in pairs(GangZoneData) do
                if data.name == zone and data.loyalty > 0 then
                    for _, v in pairs(GetPlayers()) do
                        local Player = GetPlayer(v)
                        if Player == nil then return end
                        local gangTag = Player.PlayerData.gang.name
                        local playerGangID = GetGangIDByTag(gangTag)
                        if (playerGangID == GangData[gangAtZone].id and (playerGangID ~= gangID)) then
                            if increaseType == "Drugs" then
                                TriggerClientEvent('cb-gangsystem:client:Notify', Player.PlayerData.source,
                                    Translations.info.gangTurf, string.format(Translations.info.someoneSelling, exports['cb-gangsystem']:GetTurfName(zone)), "info")
                            elseif increaseType == "Spray" then
                                TriggerClientEvent('cb-gangsystem:client:Notify', Player.PlayerData.source,
                                    Translations.info.gangTurf, string.format(Translations.info.someoneSpraying, exports['cb-gangsystem']:GetTurfName(zone)), "info")
                            end
                        end
                    end
                end
            end
        end
    end
end)

RegisterNetEvent("cb-gangsystem:server:decreaseLoyalty")
AddEventHandler("cb-gangsystem:server:decreaseLoyalty", function(gangID, zone, decrease, decreaseType)
    if decreaseType == "Vendetta" then
        DecreaseLoyalty(gangID, zone, decrease)
        UpdateGangZoneData()
    elseif decreaseType == "NPC" then
        DecreaseLoyalty(gangID, zone, decrease)
        UpdateGangZoneData()
    elseif decreaseType == "Vendetta Police" then
        DecreaseLoyalty(gangID, zone, decrease)
        UpdateGangZoneData()
    end
end)

RegisterNetEvent("cb-gangsystem:server:renameRank")
AddEventHandler("cb-gangsystem:server:renameRank", function(newRankName, gangID, grade)
    -- Update GangData with the new rank name
    if GangData[gangID] then
        -- Split the ranks string into a table
        local ranksTable = {}
        for rank in GangData[gangID].ranks:gmatch("[^,]+") do
            table.insert(ranksTable, rank)
        end

        -- Check if the grade is within the range of ranksTable
        if grade >= 0 and grade <= #ranksTable then
            -- Update the specific grade with the new rank name
            ranksTable[grade + 1] = newRankName
            -- Join the ranks table back into a string
            local newRanksString = table.concat(ranksTable, ",")
            -- Update the ranks string in the database
            MySQL.Async.execute('UPDATE gangs SET ranks = @newRanks WHERE id = @gangID',
                { ["@newRanks"] = newRanksString, ["@gangID"] = gangID }, function(rowsChanged)
                    if rowsChanged > 0 then
                        -- Optionally, you may want to broadcast the updated GangData to clients
                        -- TriggerClientEvent('cb-gangsystem:client:updateGangData', -1, GangData)
                    else
                        lib.print.error("No rows updated in the database")
                    end
                end)

            -- Update GangData with the new ranks string
            GangData[gangID].ranks = newRanksString
        else
            lib.print.error("Grade is out of range")
        end
    else
        lib.print.error("GangData does not contain gangID:", gangID)
    end
end)

-- Build a pattern from bad words
local badWordsPattern = table.concat(Config.BadWords, "|"):lower()

-- Function to check if a string contains any bad words
local function containsBadWords(name)
    local lowerName = string.lower(name)  -- Convert the name to lowercase for case-insensitive matching
    for _, badWord in ipairs(Config.BadWords) do
        -- Check if the lowercased name contains the bad word
        if string.match(lowerName, badWord) then
            return true
        end
    end
    return false
end

RegisterNetEvent("cb-gangsystem:server:renameGang")
AddEventHandler("cb-gangsystem:server:renameGang", function(newGangName, gangID)
    local playerId = source  -- Get the player's ID
    local oldGangName = GangData[gangID].name

    -- Check for bad words in the new gang name
    if containsBadWords(newGangName) then
        -- Drop the player for using a bad name
        DropPlayer(playerId, "You have been removed for using inappropriate language.")
        local data = string.format("Player with ID: %.0f attempted to name their gang `%s` which contains a blacklisted word. Staff intervention may be necessary. @everyone", playerId, newGangName)
        GangSystemLog(data)
        return  -- Exit the function
    end

    for id, gangInfo in pairs(GangData) do
        if gangInfo.name == newGangName then
            TriggerClientEvent('cb-gangsystem:client:Notify', playerId, "Error Changing Name", string.format("There is already a Gang named %s. Please pick another name and try again!", newGangName), "error")
            return
        end
    end

    -- Update GangData and database with the new gang name
    if GangData[gangID] then
        -- Update the name in the database
        MySQL.Async.execute('UPDATE gangs SET name = @newGangName WHERE id = @gangID', 
            { ["@newGangName"] = newGangName, ["@gangID"] = gangID }, function(rowsChanged)
                if rowsChanged > 0 then
                    GangData[gangID].name = newGangName
                    TriggerClientEvent('cb-gangsystem:client:Notify', playerId, "Changed Gang Name", string.format("You renamed your gang to %s", newGangName), "success")
                else
                    lib.print.error("No rows updated in the database")
                end
            end)
    else
        lib.print.error("GangData does not contain gangID:", gangID)
    end
end)

-- Function to get eligible missions based on the player's prevalence level
function GetEligibleMissions(playerPrevalenceLevel)
    local missionPool = {}

    -- Loop through the available missions in the config
    for missionName, missionData in pairs(Config.Missions) do
        local minPrevalenceLevel = missionData['prevalenceLevel'] or 0

        -- Check if player's prevalence level is equal or greater than mission's required level
        if playerPrevalenceLevel >= minPrevalenceLevel then
            table.insert(missionPool, missionData)
        end
    end

    return missionPool
end

RegisterNetEvent('cb-gangsystem:server:StartMission', function(data)
    local src = source
    if src == nil then return end
    local Player = GetPlayer(src)
    if Player == nil then return end
    local firstName = Player.PlayerData.charinfo.firstname
    local lastName = Player.PlayerData.charinfo.lastname
    local gangTag = Player.PlayerData.gang.name
    local gang_id = GetGangIDByTag(gangTag)
    if gang_id == nil then return end
    if Missions[Player.PlayerData.citizenid] and Missions[Player.PlayerData.citizenid].completed >= Config.MaxMissions then return end
    if Missions[Player.PlayerData.citizenid] and Missions[Player.PlayerData.citizenid].current ~= nil then return end
    local prevalence = GangData[gang_id].prevalence

    -- Get player's prevalence level
    local playerPrevalenceLevel = exports['cb-gangsystem']:GetPrevalenceLevel(prevalence)

    -- Fetch eligible missions based on prevalence level
    local eligibleMissions = GetEligibleMissions(playerPrevalenceLevel)

    -- If no eligible missions, notify player and exit
    if #eligibleMissions == 0 then
        TriggerClientEvent('cb-gangsystem:client:Notify', src, "Nothing", "You do not not have enough prevalence to help me! Try again later!", "error")
        return
    end

    -- Select a random mission from the eligible pool
    local randomIndex = math.random(1, #eligibleMissions)
    local RandomMission = eligibleMissions[randomIndex]

    -- Update the player's mission data
    if Missions[Player.PlayerData.citizenid] then
        Missions[Player.PlayerData.citizenid].current = RandomMission
        Missions[Player.PlayerData.citizenid].completed = Missions[Player.PlayerData.citizenid].completed + 1
    else
        Missions[Player.PlayerData.citizenid] = {}
        Missions[Player.PlayerData.citizenid].current = RandomMission
        Missions[Player.PlayerData.citizenid].completed = 0
    end

    -- Notify the player of the mission start
    TriggerClientEvent('cb-gangsystem:client:Notify', src, RandomMission.messages.start.subject, RandomMission.messages.start.message, "info")
    TriggerClientEvent('cb-gangsystem:client:StartMission', src, RandomMission)

    -- Log the mission start
    local logData = string.format("%s %s started a Gang Mission. `Mission:` %s", firstName, lastName, RandomMission.messages.start.subject)
    GangSystemLog(logData)
end)

RegisterNetEvent('cb-gangsystem:server:CheckMission', function(mission)
    local src = source
    if src == nil then return end
    TriggerClientEvent('cb-gangsystem:client:Notify', src, mission['messages'].start.subject, mission['messages'].start.message, "info")
end)

RegisterNetEvent('cb-gangsystem:server:Vendetta', function(playerID, killerID, weapon, gangZone)
    if gangZone ~= nil then
        local victimPlayer = GetPlayer(playerID)
        if victimPlayer == nil then return end
        local victimJob = victimPlayer.PlayerData.job.name
        local attackerPlayer = GetPlayer(killerID)
        if attackerPlayer == nil then return end
        if victimPlayer == nil then return end
        local victimFullName = victimPlayer.PlayerData.charinfo.firstname .. " " .. victimPlayer.PlayerData.charinfo.lastname
        local victimGangTag = victimPlayer.PlayerData.gang.name
        local attackerGangTag = attackerPlayer.PlayerData.gang.name
        local victimGang = GetGangIDByTag(victimGangTag)
        local attackerGang = GetGangIDByTag(attackerGangTag)
        local victimGangName
        local attackerGangName
        if victimGang == attackerGang then
            if not Config.VendettaSystem.OwnGangMembers then
                return
            end
        end
        if victimGang ~= nil then
            victimGangName = GetGangNameFromID(victimGang)
        else
            victimGangName = "No Gang Affiliation"
        end
        if victimGangTag == "none" then
            return
        elseif attackerPlayer ~= nil then
            local attackerFullName = attackerPlayer.PlayerData.charinfo.firstname .. " " .. attackerPlayer.PlayerData.charinfo.lastname
            if attackerGang ~= nil then
                attackerGangName = GetGangNameFromID(attackerGang)
                if attackerGangTag == "none" then
                    return
                else
                    if IsPoliceJob(victimJob) then
                        local homeTurf = GetHomeTurf(attackerGang)
                        if homeTurf == nil or homeTurf == "None" then return end
                        TriggerEvent('cb-gangsystem:server:decreaseLoyalty', attackerGang, homeTurf, Config.Loyalty.Decrease.VendettaPolice, "Vendetta Police")
                        TriggerEvent('cb-gangsystem:server:decreasePrevalence', attackerGangTag, "Vendetta Police")
                        local data = string.format("%s (%s) downed a Police Officer with %s. Loyalty decreased by %.0f in `%s`.", attackerFullName, attackerGangName, tostring(weapon), Config.Loyalty.Decrease.VendettaPolice, exports['cb-gangsystem']:GetTurfName(gangZone))
                        GangSystemLog(data)
                    end

                    if not (GangData[attackerGang].war == 0) then -- If the gang is at war do this
                        local attackerSrc = attackerPlayer.PlayerData.source
                        local isAttackerCheckedIn = exports['cb-gangsystem']:IsPlayerCheckedIn(attackerSrc)
                        if victimGang ~= nil then -- If the victim is part of a gang do this
                            if victimGang == GangData[attackerGang].war then -- If the victim is the gang the attacker is at war with do this
                                local victimSrc = victimPlayer.PlayerData.source
                                local isPlayerCheckedIn = exports['cb-gangsystem']:IsPlayerCheckedIn(victimSrc)
                                if isPlayerCheckedIn then
                                    if isAttackerCheckedIn then
                                        local wars = SQLQuery("SELECT * FROM gang_wars")
                                        for _, war in ipairs(wars) do
                                            if war.warStatus == "Active" then
                                                local weaponGroup = GetWeapontypeGroup(weapon)
                                                if attackerGang == war.declareeGangID then
                                                    local warScore = SQLQuery("SELECT declareeScore FROM gang_wars WHERE declareeGangID = ? and warStatus = 'Active'", {attackerGang})
                                                    local killPoints = Config.KillPoints[weaponGroup]
                                                    local newWarScore = warScore + killPoints
                                                    SQLQuery("UPDATE gang_wars SET declareeScore = ? WHERE declareeGangID = ? and warStatus = 'Active'", {newWarScore, attackerGang})
                                                elseif war.gangID == attackerGang then
                                                    local warScore = SQLQuery("SELECT gangScore FROM gang_wars WHERE gangID = ? and warStatus = 'Active'", {attackerGang})
                                                    local killPoints = Config.KillPoints[weaponGroup]
                                                    local newWarScore = warScore + killPoints
                                                    SQLQuery("UPDATE gang_wars SET gangScore = ? WHERE gangID = ? and warStatus = 'Active'", {newWarScore, attackerGang})
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end

                    -- Decrease for the victim Gang
                    TriggerEvent('cb-gangsystem:server:decreaseLoyalty', victimGang, gangZone,
                    Config.Loyalty.Decrease.Vendetta, "Vendetta")
                    local data = string.format("%s (%s) was killed by %s (%s) with %s. Loyalty decreased by %.0f in `%s`.", victimFullName, victimGangName, attackerFullName, attackerGangName, tostring(weapon), Config.Loyalty.Decrease.Vendetta, gangZone)
                    GangSystemLog(data)
                    
                    TriggerEvent('cb-gangsystem:server:decreasePrevalence', attackerGangTag, "Vendetta")
                    if exports['cb-gangsystem']:AllowedByPrevalence(GangData[attackerGang].prevalence, "Vendetta") then
                        TriggerEvent('cb-gangsystem:server:increaseLoyalty', attackerGang, gangZone, "Vendetta")
                        local data2 = string.format("Loyalty increased by %.0f in `%s` for %s for downing a rival gang member in gang territory.", Config.Loyalty.Decrease.Vendetta, gangZone, attackerGangName)
                        GangSystemLog(data2)
                    end
                end
            end
        end
    end
end)

RegisterNetEvent('cb-gangsystem:server:NPCKilled', function(playerID, weapon, gangZone)
    local src = playerID
    if src == nil then return end
    if gangZone ~= nil then
        local Player = GetPlayer(src)
        if Player == nil then return end
        local playerGangTag = Player.PlayerData.gang.name
        local playerGang = GetGangIDByTag(playerGangTag)
        if playerGang == nil then
            return
        else
            TriggerEvent('cb-gangsystem:server:decreaseLoyalty', playerGang, gangZone, Config.Loyalty.Decrease.NPCKilled, "NPC")
            TriggerClientEvent('cb-gangsystem:client:Notify', src, Translations.info.hurtingLocals, Translations.info.hurtingLocalsDesc, "info")
        end
    end
end)

RegisterNetEvent('cb-gangsystem:server:resetGang', function(tag)
    local Player = GetPlayer(source)
    if Player == nil then return end
    Player.Functions.SetGang(tag, 0)
    local notifyLabel = Translations.success.gangDataReset
    local notifyMessage = Translations.success.gangDataResetDesc
    TriggerClientEvent('cb-gangsystem:client:Notify', source, notifyLabel, notifyMessage, "success")
end)

RegisterNetEvent('cb-gangsystem:server:ManageMembers')
AddEventHandler('cb-gangsystem:server:ManageMembers', function(gangID)
    local src = source
    local srcPlayer = GetPlayer(src)
    if srcPlayer == nil then return end
    local srcGang = srcPlayer.PlayerData.gang.name
    local srcGangID = GetGangIDByTag(srcGang)
    if src == nil then return end
    local players = {}
    if Framework ~= "qbox" then
        for _, v in pairs(GetPlayers()) do
            
            local Player = GetPlayer(v)
            if Player == nil then return end
            local playerGang = Player.PlayerData.gang.name
            local playerGangID = GetGangIDByTag(playerGang)
            if (playerGangID == gangID) then
                local firstName = Player.PlayerData.charinfo.firstname
                local lastName = Player.PlayerData.charinfo.lastname
                local cid = Player.PlayerData.citizenid
                local identification = firstName .. " " .. lastName .. " - " .. cid
                if cid ~= GangData[gangID].leader_cid then
                    table.insert(players, { value = Player.PlayerData.source, label = identification })
                end
            end
        end
        TriggerClientEvent('cb-gangsystem:client:ManageMembersMenu', src, players)
    else
        for _, v in pairs(exports.qbx_core:GetGroupMembers(srcGang, "gang")) do
            for a, b in pairs(v) do
                if a == "citizenid" and b ~= GangData[srcGangID].leader_cid then  -- Check if the key is "citizenid" and exclude the leader
                    local gangMemberPlayerObject = GetOfflinePlayer(b)
                    if gangMemberPlayerObject == nil then return end
                    local gangMemberName = gangMemberPlayerObject.PlayerData.charinfo.firstname .. " " .. gangMemberPlayerObject.PlayerData.charinfo.lastname
                    table.insert(players, {value = b, label = gangMemberName})
                end
            end
        end
        TriggerClientEvent('cb-gangsystem:client:ManageMembersMenu', src, players)
    end
end)

RegisterNetEvent('cb-gangsystem:server:getNearbyPlayers')
AddEventHandler('cb-gangsystem:server:getNearbyPlayers', function(coords)
    local src = source
    if src == nil then return end
    local players = {}
    local locationCoords = coords
    local nearbyPlayers = lib.getNearbyPlayers(locationCoords, 5, false) -- Adjust the max distance as needed
    for _, playerData in ipairs(nearbyPlayers) do
        local playerId = playerData.id
        if playerId ~= src then -- Exclude the source player
            local Player = GetPlayer(playerId)
            if Player then
                local firstName = Player.PlayerData.charinfo.firstname
                local lastName = Player.PlayerData.charinfo.lastname
                local cid = Player.PlayerData.citizenid
                local identification = firstName .. " " .. lastName .. " - " .. cid
                table.insert(players, { value = Player.PlayerData.source, label = identification })
            end
        end
    end
    TriggerClientEvent('cb-gangsystem:client:AddMemberInputMenu', src, players)
end)

RegisterServerEvent("cb-gangsystem:server:getPlayerData")
AddEventHandler("cb-gangsystem:server:getPlayerData", function(selectedPlayer)
    if Framework ~= "qbox" then
        local src = source
        local Player = GetPlayer(selectedPlayer)
        if Player == nil then return end
        local firstName = Player.PlayerData.charinfo.firstname
        local lastName = Player.PlayerData.charinfo.lastname
        local fullName = firstName .. " " .. lastName
        local gangTag = Player.PlayerData.gang.name
        local gangID = GetGangIDByTag(gangTag)
        local rankLevel = Player.PlayerData.gang.grade.level
        local cid = Player.PlayerData.citizenid
        local rankName
        local rankNames = Split(GangData[gangID].ranks, ',')
        local rankCount = #rankNames
        local gradeIndex = tonumber(rankLevel)
        if gradeIndex and gradeIndex >= 0 and gradeIndex < rankCount then
            local gradeName = rankNames[gradeIndex + 1]
            if gradeName then
                rankName = gradeName
            end
        end
        local selectedPlayerSrc = Player.PlayerData.source
        local selectedPlayerData = {
            playerSource = selectedPlayerSrc,
            playerName = fullName,
            citizenid = cid,
            rank = rankName,
            level = rankLevel,
            boss = (cid == GangData[gangID].leader_cid)
        }
        TriggerClientEvent('cb-gangsystem:client:selectedMemberManage', src, selectedPlayerData)
    else
        local src = source
        local selectedPlayerObject = GetPlayerByCitizenID(selectedPlayer)
        if selectedPlayerObject == nil then
            selectedPlayerObject = GetOfflinePlayer(selectedPlayer)
            if selectedPlayerObject == nil then
                TriggerClientEvent('cb-gangsystem:client:Notify', src, "Vacation", "This person is on vacation. Try again later!", "error")
                return
            end
        end
        local firstName = selectedPlayerObject.PlayerData.charinfo.firstname
        local lastName = selectedPlayerObject.PlayerData.charinfo.lastname
        local fullName = firstName .. " " .. lastName
        local gangTag = selectedPlayerObject.PlayerData.gang.name
        local gangID = GetGangIDByTag(gangTag)
        local rankLevel = selectedPlayerObject.PlayerData.gang.grade.level
        local cid = selectedPlayerObject.PlayerData.citizenid
        local rankName
        local rankNames = Split(GangData[gangID].ranks, ',')
        local rankCount = #rankNames
        local gradeIndex = tonumber(rankLevel)
        if gradeIndex and gradeIndex >= 0 and gradeIndex < rankCount then
            local gradeName = rankNames[gradeIndex + 1]
            if gradeName then
                rankName = gradeName
            end
        end
        local selectedPlayerData = {
            playerName = fullName,
            citizenid = cid,
            rank = rankName,
            level = rankLevel,
            boss = (cid == GangData[gangID].leader_cid)
        }
        TriggerClientEvent('cb-gangsystem:client:selectedMemberManage', src, selectedPlayerData)
    end
end)

RegisterServerEvent("cb-gangsystem:server:changeGangColor")
AddEventHandler("cb-gangsystem:server:changeGangColor", function(gangTag, color)
    local gangID = GetGangIDByTag(gangTag)
    local src = source
    SQLQuery("UPDATE gangs SET color = ? WHERE id = ?", {color, gangID})
    GangData[gangID].color = color
    TriggerClientEvent('cb-gangsystem:client:Notify', src, Translations.success.gangColorChanged, Translations.success.gangColorChangedDesc, "success")
end)

RegisterServerEvent("cb-gangsystem:server:CapturePlayer")
AddEventHandler("cb-gangsystem:server:CapturePlayer", function(closestPlayer, capturer)
    local capturedPlayer = GetPlayer(closestPlayer)
    if capturedPlayer == nil then return end
    local capturedPlayerGangTag = capturedPlayer.PlayerData.gang.name
    local capturedPlayerGangID = GetGangIDByTag(capturedPlayerGangTag)
    local capturedPlayerGangName = GangData[capturedPlayerGangID].name
    local capturedPlayerFullName = capturedPlayer.PlayerData.charinfo.firstname .. " " .. capturedPlayer.PlayerData.charinfo.lastname
    local capturedPlayerCID = capturedPlayer.PlayerData.citizenid
    local capturedGangLeaderCID = GangData[capturedPlayerGangID].leader_cid
    local leaderCaptured = false
    if capturedGangLeaderCID == capturedPlayerCID then
        leaderCaptured = true
    end
    local capturerPlayer = GetPlayer(capturer)
    if capturerPlayer == nil then return end
    local capturerGangTag = capturerPlayer.PlayerData.gang.name
    local capturerGangID = GetGangIDByTag(capturerGangTag)
    local capturerGangName = GangData[capturerGangID].name
    local capturerFullName = capturerPlayer.PlayerData.charinfo.firstname .. " " .. capturerPlayer.PlayerData.charinfo.lastname
    local capturerCID = capturerPlayer.PlayerData.citizenid
    local capturerWar = GangData[capturerGangID].war
    if Config.CapturePed.onlyAtWar then
        if capturerWar == 0 then
            TriggerClientEvent('cb-gangsystem:client:Notify', capturer, "Not At War", "You are not at war! Why are you capturing this individual?", "error")
        elseif capturerWar == capturedPlayerGangID then
            local warPoints = 0
            TriggerClientEvent('cb-gangsystem:client:Captured', closestPlayer)
            if leaderCaptured then
                warPoints = Config.warPoints.leader
                TriggerClientEvent('cb-gangsystem:client:Notify', capturer, "Captured", "You captured the leader of the enemy Gang!", "success")
            else
                warPoints = Config.warPoints.member
                TriggerClientEvent('cb-gangsystem:client:Notify', capturer, "Captured", "You captured a member of the enemy Gang!", "success")
            end

            local wars = SQLQuery("SELECT * FROM gang_wars")
            for _, war in ipairs(wars) do
                if war.warStatus == "Active" then
                    if capturerGangID == war.declareeGangID then
                        local warScore = SQLQuery("SELECT declareeScore FROM gang_wars WHERE declareeGangID = ? and warStatus = 'Active'", {capturerGangID})
                        local newWarScore = warScore + warPoints
                        SQLQuery("UPDATE gang_wars SET declareeScore = ? WHERE declareeGangID = ? and warStatus = 'Active'", {newWarScore, capturerGangID})
                    elseif capturerGangID == war.gangID then
                        local warScore = SQLQuery("SELECT gangScore FROM gang_wars WHERE gangID = ? and warStatus = 'Active'", {capturerGangID})
                        local newWarScore = warScore + warPoints
                        SQLQuery("UPDATE gang_wars SET gangScore = ? WHERE gangID = ? and warStatus = 'Active'", {newWarScore, capturerGangID})
                    end
                end
            end
        end
    else
        local homeTurf = GetHomeTurf(capturerGangID)
        if homeTurf == nil or homeTurf == "None" then return end
        TriggerClientEvent('cb-gangsystem:client:Captured', closestPlayer)
        
        if leaderCaptured then
            TriggerEvent('cb-gangsystem:server:increaseLoyalty', capturerGangID, homeTurf, "Leader Capture")
            TriggerClientEvent('cb-gangsystem:client:Notify', capturer, "Captured", "You captured the leader of the enemy Gang!", "success")
        else
            TriggerEvent('cb-gangsystem:server:increaseLoyalty', capturerGangID, homeTurf, "Capture")
            TriggerClientEvent('cb-gangsystem:client:Notify', capturer, "Captured", "You captured a member of the enemy Gang!", "success")
        end
    end
    local data = string.format("%s (%s) from %s captured %s (%s) from %s", capturerFullName, capturerCID, capturerGangName, capturedPlayerFullName, capturedPlayerCID, capturedPlayerGangName)
    GangSystemLog(data)
end)

RegisterServerEvent("cb-gangsystem:server:ResetBossMenuLocation")
AddEventHandler("cb-gangsystem:server:ResetBossMenuLocation", function(gangID)
    SQLQuery("UPDATE gangs SET boss_menu = ? WHERE id = ?", { "(NULL)", gangID })
    GangData[gangID].boss_menu = "(NULL)"
    TriggerEvent("cb-gangsystem:server:loadBossMenu")
end)

RegisterServerEvent("cb-gangsystem:server:AddMemberGetPlayerData")
AddEventHandler("cb-gangsystem:server:AddMemberGetPlayerData", function(nearbyPlayer)
    local src = source
    local Player = GetPlayer(nearbyPlayer)
    if Player == nil then return end
    local firstName = Player.PlayerData.charinfo.firstname
    local lastName = Player.PlayerData.charinfo.lastname
    local fullName = firstName .. " " .. lastName
    local cid = Player.PlayerData.citizenid
    local selectedPlayerSrc = Player.PlayerData.source
    local selectedPlayerData = {
        playerSource = selectedPlayerSrc,
        playerName = fullName,
        citizenid = cid,
    }
    TriggerClientEvent('cb-gangsystem:client:ConfirmAddMember', src, selectedPlayerData)
end)

RegisterServerEvent("cb-gangsystem:server:AddMemberToGang")
AddEventHandler("cb-gangsystem:server:AddMemberToGang", function(selectedPlayer)
    local src = source
    local srcPlayer = GetPlayer(src)
    if srcPlayer == nil then return end
    local Player = GetPlayer(selectedPlayer.playerSource)
    if Player == nil then return end
    local firstName = Player.PlayerData.charinfo.firstname
    local lastName = Player.PlayerData.charinfo.lastname
    local cid = Player.PlayerData.citizenid
    local rankLevel = 0
    local gangTag = srcPlayer.PlayerData.gang.name
    local gangID = GetGangIDByTag(gangTag)
    local gangName = GetGangNameFromID(gangID)
    Player.Functions.SetGang(gangTag, rankLevel)
    local data = string.format("%s %s (%s) was added to %s", firstName, lastName, cid, gangName)
    GangSystemLog(data)
    TriggerClientEvent('cb-gangsystem:client:Notify', src, Translations.success.memberAdded, string.format(Translations.success.memberAddedDesc, firstName .. " " .. lastName, gangName), "info")
end)

RegisterServerEvent("cb-gangsystem:server:promoteMember")
AddEventHandler("cb-gangsystem:server:promoteMember", function(selectedPlayer)
    if Framework ~= "qbox" then
        local src = source
        if src == nil then return end
        local Player = GetPlayer(selectedPlayer.playerSource)
        local playerOffline = false
        if Player == nil then
            playerOffline = true
            if Framework == "qb-core" then
                Player = GetOfflinePlayer(selectedPlayer.citizenid)
                if Player == nil then return end
            elseif Framework == "qbox" then
                Player = GetOfflinePlayer(selectedPlayer.citizenid)
                if Player == nil then return end
            else
                return
            end
        end
        local firstName = Player.PlayerData.charinfo.firstname
        local lastName = Player.PlayerData.charinfo.lastname
        local fullName = firstName .. " " .. lastName
        local cid = Player.PlayerData.citizenid
        local rankLevel = Player.PlayerData.gang.grade.level
        local selectedPlayerSrc = Player.PlayerData.source
        local newRankLevel = rankLevel + 1
        local gangTag = Player.PlayerData.gang.name
        local gangID = GetGangIDByTag(gangTag)
        local gangName = GetGangNameFromID(gangID)
        if newRankLevel == 6 then
            TriggerClientEvent('cb-gangsystem:client:ConfirmGangTransfer', src, selectedPlayer)
        else
            Player.Functions.SetGang(gangTag, newRankLevel)
            local data = string.format("%s (%s) was promoted to Rank %.0f in %s", fullName, cid, newRankLevel, gangName)
            GangSystemLog(data)
            local notifyMessage = string.format(Translations.success.gangMemberPromotedDesc, fullName)
            TriggerClientEvent('cb-gangsystem:client:Notify', src, Translations.success.gangMemberPromoted, notifyMessage, "success")
            local selectedPlayerNotifyMessage = string.format(Translations.success.gangPromotionDesc, GangData[gangID].name)
            TriggerClientEvent('cb-gangsystem:client:Notify', selectedPlayerSrc, Translations.success.gangPromotion, selectedPlayerNotifyMessage, "info")
        end
    else
        local src = source
        if src == nil then return end
        local selectedPlayerObject = exports.qbx_core:GetPlayerByCitizenId(selectedPlayer.citizenid)
        local firstName = selectedPlayerObject.PlayerData.charinfo.firstname
        local lastName = selectedPlayerObject.PlayerData.charinfo.lastname
        local fullName = firstName .. " " .. lastName
        local cid = selectedPlayerObject.PlayerData.citizenid
        local rankLevel = selectedPlayerObject.PlayerData.gang.grade.level
        local selectedPlayerSrc = selectedPlayerObject.PlayerData.source
        local newRankLevel = rankLevel + 1
        local gangTag = selectedPlayerObject.PlayerData.gang.name
        local gangID = GetGangIDByTag(gangTag)
        local gangName = GetGangNameFromID(gangID)
        if newRankLevel == 6 then
            TriggerClientEvent('cb-gangsystem:client:ConfirmGangTransfer', src, selectedPlayer)
        else
            selectedPlayerObject.Functions.SetGang(gangTag, newRankLevel)
            exports.qbx_core:Save(selectedPlayerObject.PlayerData.source)
            local data = string.format("%s (%s) was promoted to Rank %.0f in %s", fullName, cid, newRankLevel, gangName)
            GangSystemLog(data)
            local notifyMessage = string.format(Translations.success.gangMemberPromotedDesc, fullName)
            TriggerClientEvent('cb-gangsystem:client:Notify', src, Translations.success.gangMemberPromoted, notifyMessage, "success")
            local selectedPlayerNotifyMessage = string.format(Translations.success.gangPromotionDesc, GangData[gangID].name)
            TriggerClientEvent('cb-gangsystem:client:Notify', selectedPlayerSrc, Translations.success.gangPromotion, selectedPlayerNotifyMessage, "info")
        end
    end
end)

RegisterServerEvent("cb-gangsystem:server:TransferGangOwnership")
AddEventHandler("cb-gangsystem:server:TransferGangOwnership", function(selectedPlayer)
    local src = source
    if src == nil then return end
    local Player = GetPlayer(selectedPlayer.playerSource)
    if Player == nil then return end
    local srcPlayer = GetPlayer(src)
    if srcPlayer == nil then return end
    local firstName = Player.PlayerData.charinfo.firstname
    local lastName = Player.PlayerData.charinfo.lastname
    local fullName = firstName .. " " .. lastName
    local cid = Player.PlayerData.citizenid
    local rankLevel = Player.PlayerData.gang.grade.level
    local selectedPlayerSrc = Player.PlayerData.source
    local newRankLevel = rankLevel + 1
    local gangTag = Player.PlayerData.gang.name
    local gangID = GetGangIDByTag(gangTag)
    local gangName = GetGangNameFromID(gangID)
    
    -- Set the Rank of the New Leader
    Player.Functions.SetGang(gangTag, newRankLevel)
    srcPlayer.Functions.SetGang(gangTag, 1)
    TransferGangOwnership(gangID, cid)

    local data = string.format("%s (%s) was promoted to Rank %.0f in %s", fullName, cid, newRankLevel, gangName)
    GangSystemLog(data)
    local notifyMessage = string.format(Translations.success.gangMemberPromotedDesc, fullName)
    TriggerClientEvent('cb-gangsystem:client:Notify', src, Translations.success.gangMemberPromoted, notifyMessage, "success")
    local selectedPlayerNotifyMessage = string.format(Translations.success.gangPromotionDesc, GangData[gangID].name)
    TriggerClientEvent('cb-gangsystem:client:Notify', selectedPlayerSrc, Translations.success.gangPromotion, selectedPlayerNotifyMessage, "info")
end)

RegisterServerEvent("cb-gangsystem:server:DisbandGang")
AddEventHandler("cb-gangsystem:server:DisbandGang", function()
    local src = source
    if src == nil then return end
    local srcPlayer = GetPlayer(src)
    if srcPlayer == nil then return end
    local gangTag = srcPlayer.PlayerData.gang.name
    local gangID = GetGangIDByTag(gangTag)
    if Framework == "qb-core" then
        for _, v in pairs(GetPlayers()) do
            local Player = GetPlayer(v)
            if Player == nil then return end
            local selectedPlayerGang = Player.PlayerData.gang.name
            local selectedPlayerGangID = GetGangIDByTag(selectedPlayerGang)
            if selectedPlayerGangID == gangID then
                Player.Functions.SetGang(tostring('none'), 0)
                TriggerClientEvent('cb-gangsystem:client:Notify', src, Translations.info.gangDisbanded, Translations.info.gangDisbandedDesc, "info")
            end
        end
    elseif Framework == "qbox" then
        local members = FetchPlayersInGang(gangTag)
        for i = 1, #members do
            exports.qbx_core:RemovePlayerFromGang(members[i].citizenid, gangTag)
        end
    end
    DeleteGang(gangID)
    TriggerEvent('cb-gangsystem:server:loadGangStorage')
end)

RegisterServerEvent("cb-gangsystem:server:demoteMember")
AddEventHandler("cb-gangsystem:server:demoteMember", function(selectedPlayer)
    local src = source
    local Player = GetPlayer(selectedPlayer.playerSource)
    local playerOffline = false

    if Player == nil then
        playerOffline = true
        if Framework == "qb-core" then
            Player = GetOfflinePlayer(selectedPlayer.citizenid)
            if Player == nil then return end
        elseif Framework == "qbox" then
            Player = GetOfflinePlayer(selectedPlayer.citizenid)
            if Player == nil then return end
        else
            return
        end
    end

    local firstName = Player.PlayerData.charinfo.firstname
    local lastName = Player.PlayerData.charinfo.lastname
    local fullName = firstName .. " " .. lastName
    local cid = Player.PlayerData.citizenid
    local rankLevel = Player.PlayerData.gang.grade.level
    local newRankLevel = rankLevel - 1
    local gangTag = Player.PlayerData.gang.name
    local gangID = GetGangIDByTag(gangTag)
    local gangName = GetGangNameFromID(gangID)

    -- Check if player is the leader or rank cannot be lowered further
    if (cid == GangData[gangID].leader_cid) then
        local notifyLabel = Translations.error.cannotDemote
        local notifyMessage = Translations.error.cannotDemoteDesc
        TriggerClientEvent('cb-gangsystem:client:Notify', src, notifyLabel, notifyMessage, "error")
        return
    elseif newRankLevel <= 0 then
        local notifyLabel = Translations.error.cannotDemote
        local notifyMessage = string.format(Translations.error.cannotDemoteDesc2, fullName)
        TriggerClientEvent('cb-gangsystem:client:Notify', src, notifyLabel, notifyMessage, "error")
        return
    end

    -- Demote the player
    Player.Functions.SetGang(gangTag, newRankLevel)

    -- If the player is offline, save their updated data
    if Framework == "qbox" and playerOffline then
        exports.qbx_core:SaveOffline(Player.PlayerData)
    end

    -- Log the demotion
    local data = string.format("%s (%s) was demoted to Rank %.0f in %s", fullName, cid, newRankLevel, gangName)
    GangSystemLog(data)

    -- Notify the user who initiated the demotion
    local notifyLabel = Translations.error.demoted
    local notifyMessage = string.format(Translations.error.demotedDesc, fullName)
    TriggerClientEvent('cb-gangsystem:client:Notify', src, notifyLabel, notifyMessage, "error")

    -- Notify the demoted player
    local selectedPlayerNotifyLabel = Translations.error.srcDemoted
    local selectedPlayerNotifyMessage = string.format(Translations.error.srcDemotedDesc, GangData[gangID].name)
    TriggerClientEvent('cb-gangsystem:client:Notify', selectedPlayer.playerSource, selectedPlayerNotifyLabel, selectedPlayerNotifyMessage, "info")
end)

RegisterServerEvent("cb-gangsystem:server:kickMember")
AddEventHandler("cb-gangsystem:server:kickMember", function(selectedPlayer)
    local src = source
    local Player = GetPlayer(selectedPlayer.playerSource)
    if Player == nil then
        if Framework == "qb-core" then
            return
        elseif Framework == "qbox" then
            Player = GetOfflinePlayer(selectedPlayer.citizenid)
            if Player == nil then return end
        else
            return
        end
    end
    local firstName = Player.PlayerData.charinfo.firstname
    local lastName = Player.PlayerData.charinfo.lastname
    local fullName = firstName .. " " .. lastName
    local cid = Player.PlayerData.citizenid
    local gangTag = Player.PlayerData.gang.name
    local gangID = GetGangIDByTag(gangTag)
    local gangName = GetGangNameFromID(gangID)
    if (cid == GangData[gangID].leader_cid) then
        local notifyLabel = Translations.error.cannotKick
        local notifyMessage = Translations.error.cannotKickDesc
        TriggerClientEvent('cb-gangsystem:client:Notify', src, notifyLabel, notifyMessage, "error")
    else
        Player.Functions.SetGang("none", 0)
        local data = string.format("%s (%s) was kicked from %s", fullName, cid, gangName)
        GangSystemLog(data)
        local notifyLabel = Translations.error.kickedMember
        local notifyMessage = string.format(Translations.error.kickedMemberDesc, fullName, GangData[gangID].name)
        TriggerClientEvent('cb-gangsystem:client:Notify', src, notifyLabel, notifyMessage, "success")
        local selectedPlayerNotifyLabel = Translations.error.playerKicked
        local selectedPlayerNotifyMessage = string.format(Translations.error.playerKickedDesc, GangData[gangID].name)
        TriggerClientEvent('cb-gangsystem:client:Notify', selectedPlayer.playerSource, selectedPlayerNotifyLabel,selectedPlayerNotifyMessage, "info")
        TriggerEvent("cb-gangsystem:server:loadGangStorage")
    end
end)

RegisterNetEvent('cb-gangsystem:server:AddNewGang', function(citizenID, name, tag)
    local src = source
    if src == nil then return end
    local Player = GetPlayer(src)
    if Player == nil then return end
    local fullName = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname
    
    -- Notify the player about the gang creation
    TriggerClientEvent('cb-gangsystem:client:Notify', src, Translations.info.gangCreated, Translations.info.gangCreatedDesc, "info")
    
    -- Log the gang creation
    local data = string.format("**New Gang Created** `Gang Name:` %s `Gang Tag:` %s `Leader Name:` %s `Leader CID:` %s", 
        name, tag, fullName, Player.PlayerData.citizenid)
    GangSystemLog(data)
    exports['fm-logs']:createLog({
        LogType = "Gang Created", -- The log type
        Message = "Someone Created a gang", -- The message of the log
        Level = "info", -- The level of the log (can be filtered on Fivemerr) (info by default)
        Resource = "cb-gangsystem", -- Resource where the log is coming from (If not provided, `fm-logs` will be set by default)
        Metadata = {
            name = name,
            tag = tag,
            fullName = fullName,
            
        }
    })
    
    -- Insert the new gang into the 'gangs' table
    SQLQuery(string.format(
        "INSERT INTO gangs (tag, name, balance, color, leader_cid, image) VALUES ('%s', '%s', 0, %.0f, '%s', '%s')", 
        tag, name, Config.DefaultGangColor, citizenID, Config.DefaultGangImage))
    
    -- Fetch the id of the newly created gang
    local result = SQLQuery(string.format("SELECT id FROM gangs WHERE tag = '%s'", tag))
    
    if result[1] ~= nil then
        local gangID = result[1].id
        
        -- Insert default permissions into 'gang_perms' table
        SQLQuery(string.format("INSERT INTO gang_perms (gang_id) VALUES (%d)", gangID))
    end
    
    -- Update gang data, set gang for player, and trigger player data update event
    UpdateGangData()
    CreateGang(tag, name)
    Player.Functions.SetGang(tostring(tag), 6)
end)

RegisterNetEvent('cb-gangsystem:server:StaffAddNewGang', function(target, citizenID, name, tag)
    local Player = GetPlayer(target)
    if Player == nil then return end
    local fullName = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname
    
    -- Notify the player about the gang creation
    TriggerClientEvent('cb-gangsystem:client:Notify', target, Translations.info.gangCreated,
        Translations.info.gangCreatedDesc, "info")
    
    -- Log the gang creation
    local data = string.format("**Staff Created Gang** `Gang Name:` %s `Gang Tag:` %s `Leader Name:` %s `Leader CID:` %s", 
        name, tag, fullName, Player.PlayerData.citizenid)
    GangSystemLog(data)
    -- Insert the new gang into the 'gangs' table
    SQLQuery(string.format("INSERT INTO gangs (tag, name, balance, color, leader_cid) VALUES ('%s', '%s', 0, 39, '%s')", 
        tag, name, citizenID))
    
    -- Fetch the id of the newly created gang
    local result = SQLQuery(string.format("SELECT id FROM gangs WHERE tag = '%s'", tag))
    
    if result[1] ~= nil then
        local gangID = result[1].id
        
        -- Insert default permissions into 'gang_perms' table
        SQLQuery(string.format("INSERT INTO gang_perms (gang_id) VALUES (%d)", gangID))
    end
    
    -- Update gang data, set gang for player, and trigger player data update event
    UpdateGangData()
    CreateGang(tag, name)
    Player.Functions.SetGang(tostring(tag), 6)
end)

RegisterNetEvent('cb-gangsystem:server:HandOverItems', function()
    local src = source
    if src == nil then return end
    local Player = GetPlayer(src)
    if Player == nil then return end
    local missingItems = {}
    
    -- Check for required items
    for item, amount in pairs(Config.RequiredItems.items) do
        if not HasItem(src, item, amount) then
            table.insert(missingItems, {name = item, count = amount})
        end
    end

    -- Check for required cash
    local cashAmount = Player.PlayerData.money.cash
    if cashAmount < Config.RequiredItems.cash then
        table.insert(missingItems, {name = "cash", count = Config.RequiredItems.cash - cashAmount})
    end

    if #missingItems == 0 then
        -- Remove items
        for item, amount in pairs(Config.RequiredItems.items) do
            RemoveItem(src, item, amount)
        end
        -- Remove cash
        Player.Functions.RemoveMoney('cash', Config.RequiredItems.cash, "Start Criminal Organization")
        TriggerClientEvent('cb-gangsystem:client:CreateGangInputMenu', src)
    else
        -- Notify the player of the missing items
        local missingItemsList = {}
        for _, item in pairs(missingItems) do
            table.insert(missingItemsList, item.count .. "x " .. GetItemLabel(item.name))
        end
        TriggerClientEvent('cb-gangsystem:client:Notify', src, "Missing Items", "You are missing the following items: " .. table.concat(missingItemsList, ", "), "error")
    end
end)

RegisterNetEvent('cb-gangsystem:server:CompleteHeist', function(source)
    local src = source
    local Player = GetPlayer(src)
    local gangTag = Player.PlayerData.gang.name
    TriggerEvent('cb-gangsystem:server:increasePrevalence', gangTag, "Heist")
end)

RegisterNetEvent('cb-gangsystem:server:CompleteMission', function(data, zone)
    local src = source
    if src == nil then return end
    local Player = GetPlayer(src)
    if Player == nil then return end
    local firstName = Player.PlayerData.charinfo.firstname
    local lastName = Player.PlayerData.charinfo.lastname
    local gangName = Player.PlayerData.gang.label
    local gangTag = Player.PlayerData.gang.name
    local gangID = GetGangIDByTag(gangTag)
    local reward = ""
    local rewardAmount = 0
    if (gangID == nil) then
        TriggerClientEvent('cb-gangsystem:client:Notify', src, Translations.error.noGangForMission,
            Translations.error.noGangForMissionDesc, "error")
        return
    end
    local Mission = Config.Missions[data.mission]
    if Mission == nil then return end
    Missions[Player.PlayerData.citizenid].current = nil
    Missions[Player.PlayerData.citizenid].completed = Missions[Player.PlayerData.citizenid].completed + 1
    TriggerClientEvent('cb-gangsystem:client:FinishMission', src)
    if Mission['messages'].finish then
        if Config.UpdateLoyalty == "top3" then
            local rows = UpdateTop3ByGangID(gangID)
            local turf = ""
            for i = 1, #rows do
                if i > 1 then
                    turf = turf .. ", "
                end
                turf = turf .. exports['cb-gangsystem']:GetTurfName(rows[i].name)
                local gangAtZone = GetGangAtZone(rows[i].name)
                if gangAtZone ~= nil then
                    for _, v in pairs(GetPlayers()) do
                        local checkPlayer = GetPlayer(v)
                        if checkPlayer == nil then goto continue end  -- Skip to the next iteration if checkPlayer is nil
                        local checkPlayerGang = checkPlayer.PlayerData.gang.name
                        if checkPlayerGang == gangAtZone then
                            if checkPlayerGang ~= gangTag then
                                TriggerClientEvent('cb-gangsystem:client:Notify', checkPlayer.PlayerData.source, "Rival Gang Mission", "A rival Gang completed a Gang Mission which caused a decrease in reputation for one of your turfs!", "info")
                            end
                        end
                        ::continue::
                    end
                end
            end
            TriggerClientEvent('cb-gangsystem:client:Notify', src, Translations.success.missionComplete, Mission['messages'].finish.message, "success")
            local messageDesc = string.format(Translations.info.repIncreased, gangName, turf)
            TriggerClientEvent('cb-gangsystem:client:Notify', src, Translations.success.loyaltyIncreased, messageDesc, "info")
        elseif Config.UpdateLoyalty == "choose" then
            local gangAtZone = GetGangAtZone(zone)
            local rows = UpdateLoyaltyByGangIDAndChoice(gangID, zone)
            local turf = ""
            for i = 1, #rows do
                if i > 1 then
                    turf = turf .. ", "
                end
                turf = turf .. exports['cb-gangsystem']:GetTurfName(rows[i].name)
            end
            TriggerClientEvent('cb-gangsystem:client:Notify', src, Translations.success.missionComplete,
                Mission['messages'].finish.message, "success")
            local messageDesc = string.format(Translations.info.repIncreased, gangName, turf)
            TriggerClientEvent('cb-gangsystem:client:Notify', src, Translations.success.loyaltyIncreased, messageDesc,
                "info")
        elseif Config.UpdateLoyalty == "none" then
            TriggerClientEvent('cb-gangsystem:client:Notify', src, Translations.success.missionComplete,
                Mission['messages'].finish.message, "success")
        end
    end
    if Mission['reward_type'].acceptAnyItem then
        for k, v in pairs(Mission['requirement']) do
            local checkItem = Player.Functions.GetItemByName(v.item)
            if checkItem ~= nil then
                RemoveItem(src, v.item, v.amount)
                return
            end
        end
    else
        for k, v in pairs(Mission['requirement']) do
            RemoveItem(src, v.item, v.amount)
        end
    end
    if Mission['reward_type'].type == 'random' then
        for _, item in pairs(Mission['reward']) do
            local chance = math.random(0, 100)
            if item.chance >= chance then
                if item.type == 'item' then
                    if AddItem(src, item.name, item.amount) then
                        reward = item.name
                        rewardAmount = item.amount
                        local data = string.format("**%s** **%s** (%s - %s) completed a mission. `Mission:` %s `Reward:` %.0fx %s", firstName, lastName,
                        Player.PlayerData.citizenid, gangName, Mission['messages'].start.subject, rewardAmount, reward)
                        GangSystemLog(data)
                        exports['fm-logs']:createLog({
                            LogType = "Gang Systsem", -- The log type
                            Message = "Mission Completed", -- The message of the log
                            Level = "info", -- The level of the log (can be filtered on Fivemerr) (info by default)
                            Resource = "cb-gangsystem", -- Resource where the log is coming from (If not provided, `fm-logs` will be set by default)
                            Metadata = {
                                firstName = firstName,
                                lastName = lastName,
                                gangName = gangName,
                                rewardAmount = rewardAmount,
                                reward = reward,
                            }
                        })
                    end
                    if Mission['reward_type'].single then return end
                elseif item.type == 'cash' then
                    Player.Functions.AddMoney('cash', item.amount, "Misssion-Reward")
                    reward = "Cash"
                    rewardAmount = item.amount
                    local data = string.format("**%s** **%s** (%s - %s) completed a mission. `Mission:` %s `Reward:` %.0fx %s", firstName, lastName,
                        Player.PlayerData.citizenid, gangName, Mission['messages'].start.subject, rewardAmount, reward)
                    GangSystemLog(data)
                    exports['fm-logs']:createLog({
                        LogType = "Gang Systsem", -- The log type
                        Message = "Mission Completed", -- The message of the log
                        Level = "info", -- The level of the log (can be filtered on Fivemerr) (info by default)
                        Resource = "cb-gangsystem", -- Resource where the log is coming from (If not provided, `fm-logs` will be set by default)
                        Metadata = {
                            firstName = firstName,
                            lastName = lastName,
                            gangName = gangName,
                            rewardAmount = rewardAmount,
                            reward = reward,
                        }
                    })
                    if Mission['reward_type'].single then return end
                elseif item.type == 'bank' then
                    Player.Functions.AddMoney('bank', item.amount, "Mission Reward")
                    reward = "Bank"
                    rewardAmount = item.amount
                    local data = string.format("**%s** **%s** (%s - %s) completed a mission. `Mission:` %s `Reward:` %.0fx %s", firstName, lastName,
                        Player.PlayerData.citizenid, gangName, Mission['messages'].start.subject, rewardAmount, reward)
                    GangSystemLog(data)
                    exports['fm-logs']:createLog({
                        LogType = "Gang Systsem", -- The log type
                        Message = "Mission Completed", -- The message of the log
                        Level = "info", -- The level of the log (can be filtered on Fivemerr) (info by default)
                        Resource = "cb-gangsystem", -- Resource where the log is coming from (If not provided, `fm-logs` will be set by default)
                        Metadata = {
                            firstName = firstName,
                            lastName = lastName,
                            gangName = gangName,
                            rewardAmount = rewardAmount,
                            reward = reward,
                        }
                    })
                    if Mission['reward_type'].single then return end
                end
            end
        end
    elseif Mission['reward_type'].type == 'tier' then
        local total_tier_chance = 0
        for k, data in pairs(Mission['reward']) do
            total_tier_chance = total_tier_chance + data.chance
        end
        local tier_chance = math.random(1, total_tier_chance)
        local tier = nil
        local range2_start = 0
        for k, data in pairs(Mission['reward']) do
            local range2_end = range2_start + data.chance
            if tier_chance >= range2_start and tier_chance < range2_end then
                tier = k
                break
            end
            range2_start = range2_end
        end

        if tier then
            local total_chance = 0
            for _, item in pairs(Mission['reward'][tier].items) do
                total_chance = total_chance + item.chance
            end

            local selected_item = nil
            local random_num = math.random(1, total_chance)
            local range_start = 0
            for _, item in pairs(Mission['reward'][tier].items) do
                local range_end = range_start + item.chance
                if random_num >= range_start and random_num < range_end then
                    selected_item = item
                    break
                end
                range_start = range_end
            end

            if selected_item then
                if selected_item.type == 'item' then
                    if AddItem(src, selected_item.name, selected_item.amount) then
                        reward = selected_item.name
                        rewardAmount = selected_item.amount
                        local data = string.format("**%s** **%s** (%s - %s) completed a mission. `Mission:` %s `Reward:` %.0fx %s", firstName, lastName,
                            Player.PlayerData.citizenid, gangName, Mission['messages'].start.subject, rewardAmount, reward)
                        GangSystemLog(data)
                        exports['fm-logs']:createLog({
                            LogType = "Gang Systsem", -- The log type
                            Message = "Mission Completed", -- The message of the log
                            Level = "info", -- The level of the log (can be filtered on Fivemerr) (info by default)
                            Resource = "cb-gangsystem", -- Resource where the log is coming from (If not provided, `fm-logs` will be set by default)
                            Metadata = {
                                firstName = firstName,
                                lastName = lastName,
                                gangName = gangName,
                                rewardAmount = rewardAmount,
                                reward = reward,
                            }
                        })
                    end
                elseif selected_item.type == 'cash' then
                    Player.Functions.AddMoney('cash', selected_item.amount, "Mission-Reward")
                    reward = "Cash"
                    rewardAmount = selected_item.amount
                    local data = string.format("**%s** **%s** (%s - %s) completed a mission. `Mission:` %s `Reward:` %.0fx %s", firstName, lastName,
                        Player.PlayerData.citizenid, gangName, Mission['messages'].start.subject, rewardAmount, reward)
                    GangSystemLog(data)
                    exports['fm-logs']:createLog({
                        LogType = "Gang Systsem", -- The log type
                        Message = "Mission Completed", -- The message of the log
                        Level = "info", -- The level of the log (can be filtered on Fivemerr) (info by default)
                        Resource = "cb-gangsystem", -- Resource where the log is coming from (If not provided, `fm-logs` will be set by default)
                        Metadata = {
                            firstName = firstName,
                            lastName = lastName,
                            gangName = gangName,
                            rewardAmount = rewardAmount,
                            reward = reward,
                        }
                    })
                elseif selected_item.type == 'bank' then
                    Player.Functions.AddMoney('bank', selected_item.amount, "Mission Reward")
                    reward = "Bank"
                    rewardAmount = selected_item.amount
                    local data = string.format("**%s** **%s** (%s - %s) completed a mission. `Mission:` %s `Reward:` %.0fx %s", firstName, lastName,
                        Player.PlayerData.citizenid, gangName, Mission['messages'].start.subject, rewardAmount, reward)
                    GangSystemLog(data)
                    exports['fm-logs']:createLog({
                        LogType = "Gang Systsem", -- The log type
                        Message = "Mission Completed", -- The message of the log
                        Level = "info", -- The level of the log (can be filtered on Fivemerr) (info by default)
                        Resource = "cb-gangsystem", -- Resource where the log is coming from (If not provided, `fm-logs` will be set by default)
                        Metadata = {
                            firstName = firstName,
                            lastName = lastName,
                            gangName = gangName,
                            rewardAmount = rewardAmount,
                            reward = reward,
                        }
                    })
                end
            end
        end
    end
end)

RegisterServerEvent('cb-gangsystem:server:GetHideoutCoords', function(gangTag)
    local src = source
    if src == nil then return end
    local gangID = GetGangIDByTag(gangTag)
    local coords = GetHideoutCoords(gangID)
    if coords ~= "None" and coords ~= "Community" then
        TriggerClientEvent('cb-gangsystem:client:setWaypoint', src, coords)
        local notifyLabel = Translations.success.coordsMarked
        local notifyMessage = Translations.success.coordsMarkedDesc
        TriggerClientEvent('cb-gangsystem:client:Notify', src, notifyLabel, notifyMessage, "success")
    elseif coords == "Community" then
        local notifyLabel = Translations.error.communityTurf
        local notifyMessage = Translations.error.communityTurfDesc
        TriggerClientEvent('cb-gangsystem:client:Notify', src, notifyLabel, notifyMessage, "error")
    else
        local notifyLabel = Translations.error.noGangHideout
        local notifyMessage = Translations.error.noGangHideoutDesc
        TriggerClientEvent('cb-gangsystem:client:Notify', src, notifyLabel, notifyMessage, "error")
    end
end)

RegisterServerEvent('cb-gangsystem:server:TakeGift', function()
    local src = source
    if src == nil then return end
    local Player = GetPlayer(src)
    local firstName = Player.PlayerData.charinfo.firstname
    local lastName = Player.PlayerData.charinfo.lastname
    local randomItem = math.random(1, #Config.GiftItems)
    for k, v in pairs(Config.GiftItems) do
        if k == randomItem then
            local gangTag = Player.PlayerData.gang.name
            local gang_id = GetGangIDByTag(gangTag)
            local gangName = Player.PlayerData.gang.label
            local last_gift = GetLastGift(gang_id)
            if (last_gift == nil or last_gift == 0) then
                if AddItem(src, v.item, v.amount) then
                    UpdateLastGift(gang_id)
                    local data = string.format("**%s** **%s** (%s - %s) received a Gift. `Reward:` %.0fx %s", firstName, lastName, Player.PlayerData.citizenid, gangName, v.amount, GetItemLabel(v.item))
                    GangSystemLog(data)
                    exports['fm-logs']:createLog({
                        LogType = "Gang Systsem", -- The log type
                        Message = "Mission Completed", -- The message of the log
                        Level = "info", -- The level of the log (can be filtered on Fivemerr) (info by default)
                        Resource = "cb-gangsystem", -- Resource where the log is coming from (If not provided, `fm-logs` will be set by default)
                        Metadata = {
                            firstName = firstName,
                            lastName = lastName,
                            gangName = gangName,
                            last_gift = last_gift,
                        }
                    })
                end
            else
                local currentTime = os.time()
                local twentyFourHoursInSeconds = 24 * 60 * 60 -- 24 hours in seconds
                if not (currentTime - last_gift < twentyFourHoursInSeconds) then
                    if AddItem(src, v.item, v.amount) then
                        local gift = v.item
                        UpdateLastGift(gang_id)
                        local data = string.format("**%s** **%s** (%s - %s) received a Gift. `Reward:` %.0fx %s", firstName, lastName,
                            Player.PlayerData.citizenid, gangName, v.amount, GetItemLabel(gift))
                        GangSystemLog(data)
                        exports['fm-logs']:createLog({
                            LogType = "Gang Systsem", -- The log type
                            Message = "Mission Completed", -- The message of the log
                            Level = "info", -- The level of the log (can be filtered on Fivemerr) (info by default)
                            Resource = "cb-gangsystem", -- Resource where the log is coming from (If not provided, `fm-logs` will be set by default)
                            Metadata = {
                                firstName = firstName,
                                lastName = lastName,
                                gangName = gangName,
                                gift = gift,
                            }
                        })
                    end
                end
            end
        end
    end
end)

RegisterServerEvent("cb-gangsystem:server:Craft")
AddEventHandler("cb-gangsystem:server:Craft", function(items, craftAmount, resultItem, recipeResultAmount)
    local _source = source
    if _source == nil then return end
    local Player = GetPlayer(_source)
    if Player == nil then return end
    local firstName = Player.PlayerData.charinfo.firstname
    local lastName = Player.PlayerData.charinfo.lastname
    local fullName = firstName .. " " .. lastName
    local cid = Player.PlayerData.citizenid
    local sourceGangTag = Player.PlayerData.gang.name
    local sourceGangID = GetGangIDByTag(sourceGangTag)
    local gangName = GetGangNameFromID(sourceGangID)
    local removeItems = {}
    for _, ingredient in ipairs(items) do
        local itemName = ingredient.item
        local amount = ingredient.amount
        local remove = ingredient.remove
        if not HasItem(_source, itemName, amount) then
            local notifyLabel = Translations.error.notEnough
            local notifyMessage = Translations.error.notEnoughDesc
            TriggerClientEvent('cb-gangsystem:client:Notify', _source, notifyLabel, notifyMessage, "error")
            return
        else
            table.insert(removeItems, { name = itemName, amount = amount, remove = remove })
        end
    end    
    -- Remove required items
    for _, item in ipairs(removeItems) do
        if item.remove then
            local removeAmount = item.amount * craftAmount
            RemoveItem(_source, item.name, removeAmount)
        end
    end
    -- Add crafted item
    local addAmount = craftAmount * recipeResultAmount
    if AddItem(_source, resultItem, addAmount) then
        local data = string.format("%s (%s) crafted %.0fx %s `Gang Name:` **%s**", fullName, cid, addAmount, GetItemLabel(resultItem), gangName)
        GangSystemLog(data)
        exports['fm-logs']:createLog({
            LogType = "Gang Systsem", -- The log type
            Message = "Hideout Items Crafted", -- The message of the log
            Level = "info", -- The level of the log (can be filtered on Fivemerr) (info by default)
            Resource = "cb-gangsystem", -- Resource where the log is coming from (If not provided, `fm-logs` will be set by default)
            Metadata = {
                fullName = fullName,
                cid = cid,
                addAmount = addAmount,
                resultItem = resultItem,
                gangName = gangName,
            }
        })
        local notifyLabel = Translations.success.crafted
        local resultLabel = GetItemLabel(resultItem)
        local notifyMessage = string.format(Translations.success.craftedDesc, resultLabel)
        TriggerClientEvent('cb-gangsystem:client:Notify', _source, notifyLabel, notifyMessage, "success")
    end
end)

RegisterServerEvent('cb-gangsystem:server:UpdateLastBlackMarket', function(gangTag)
    local gangID = GetGangIDByTag(gangTag)
    UpdateLastBlackMarket(gangID)
end)

RegisterServerEvent('cb-gangsystem:server:CheckForWeapons', function()
    local src = source
    if src == nil then return end
    local Player = GetPlayer(src)
    local job = Player.PlayerData.job.name
    HasBannedItems = false
    RestrictedJob = false
    for k, v in pairs(Config.PoliceJobs) do
        if job == v then
            RestrictedJob = true
            local notifyLabel = Translations.error.bodyguardLabel
            local notifyMessage = Translations.error.isPlayerCop
            TriggerClientEvent('cb-gangsystem:client:Notify', src, notifyLabel, notifyMessage, "error")
            return
        end
    end
    for _, item in ipairs(Config.BannedItems) do
        local bannedItem = Player.Functions.GetItemByName(item)
        if bannedItem ~= nil then
            HasBannedItems = true
        end
    end
    if not HasBannedItems then
        TriggerClientEvent("cb-gangsystem:client:TeleportNoBucket", src, Config.Bodyguard.insideCoords)
    else
        local notifyLabel = Translations.error.bodyguardLabel
        local notifyMessage = Translations.error.bannedItems
        TriggerClientEvent('cb-gangsystem:client:Notify', src, notifyLabel, notifyMessage, "error")
    end
end)

RegisterServerEvent("cb-gangsystem:server:newqbinventory", function()
    exports['qb-inventory']:CreateShop({
        name = Config.BlackMarket.label,
        label = Config.BlackMarket.label,
        slots = #Config.BlackMarket.items,
        items = Config.BlackMarket.items
    })
end)

RegisterServerEvent("cb-gangsystem:server:newqbshop", function()
    exports['qb-inventory']:OpenShop(source, Config.BlackMarket.label)
end)

RegisterServerEvent("cb-gangsystem:server:checkLoyalty")
AddEventHandler("cb-gangsystem:server:checkLoyalty", function(source, type)
    local src = source
    UpdateGangZoneData()
    local checkLoyaltyData = {}
    for zoneID, zoneData in pairs(Config.GangZones) do
        local gangController = GetGangAtZone(zoneData.zone)
        local gangControllerID = GetGangIDByTag(gangController)
        checkLoyaltyData[zoneData.zone] = gangControllerID
    end
    TriggerClientEvent('cb-gangsystem:client:checkLoyaltyMenu', src, GangData, checkLoyaltyData, type)
end)

RegisterServerEvent("cb-gangsystem:server:checkLoyaltyDetails")
AddEventHandler("cb-gangsystem:server:checkLoyaltyDetails", function(zone)
    local src = source
    local checkLoyaltyData = {} -- Table to store turf controllers
    UpdateGangZoneData()        -- Ensure GangZoneData is up-to-date
    UpdateActiveRivalries()
    for id, data in pairs(GangZoneData) do
        if data.name == zone and data.loyalty > 0 then
            -- Add the gang zone data to turfControllers if it matches the zone and has loyalty > 0
            table.insert(checkLoyaltyData, {
                id = data.id,
                name = data.name,
                controller = GetGangTagFromID(data.controller),
                gangID = data.controller,
                loyalty = data.loyalty
            })
        end
    end
    TriggerClientEvent('cb-gangsystem:client:ZoneLoyaltyDetails', src, checkLoyaltyData, zone, ActiveRivalryData,
        GangData)
end)

RegisterServerEvent("cb-gangsystem:server:DeclareHomeTurf")
AddEventHandler("cb-gangsystem:server:DeclareHomeTurf", function(source, zone)
    UpdateGangZoneData()
    local Player = GetPlayer(source)
    if Player == nil then return end
    local firstName = Player.PlayerData.charinfo.firstname
    local lastName = Player.PlayerData.charinfo.lastname
    local leaderName = firstName .. " " .. lastName
    local cid = Player.PlayerData.citizenid
    local leader_cid = cid
    local zone_tag = zone
    local zoneName = exports['cb-gangsystem']:GetTurfName(zone)
    local sourceGangTag = Player.PlayerData.gang.name
    local sourceGangID = GetGangIDByTag(sourceGangTag)
    local sourceGangName = Player.PlayerData.gang.label
    local gangAtZone = GetGangAtZoneReturnID(zone_tag)
    local contestingGangName
    local GangAtZoneID = nil
    if gangAtZone ~= nil then
        GangAtZoneID = GangData[gangAtZone].id
    end
    if (GangAtZoneID == sourceGangID) then                        -- If there's no gang at that zone, or if the Player's gang controlls the turf, do this
        local isContested = GetDeclaredHomeTurfReturnID(zone_tag) -- Search the database and find out if any gang has this turf as their home turf
        if isContested == sourceGangID then                       -- If Player's Gang already has this as their Home Turf, do this
            local notifyLabel = "Cannot Declare Home Turf"
            local notifyMessage = "This is already your Home Turf!"
            TriggerClientEvent('cb-gangsystem:client:Notify', source, notifyLabel, notifyMessage, "error")
        elseif (isContested ~= sourceGangID) and (isContested ~= nil) then -- Else if turf is contested by another Gang do this
            contestingGangName = GetDeclaredHomeTurf(zone_tag)             -- Get the Declared Home Turf of the contesting Gang
            local sqlQuery = "UPDATE gangs SET home_turf = ? WHERE id = ?" -- Update Database
            MySQL.Async.execute(sqlQuery, { "Taken", isContested }, function(rowsChanged)
                if rowsChanged > 0 then
                    GangData[isContested].home_turf = "Taken"
                end
            end)
            MySQL.Async.execute(sqlQuery, { zone_tag, sourceGangID }, function(rowsChanged)
                if rowsChanged > 0 then
                    GangData[sourceGangID].home_turf = zone_tag
                end
            end)
            UpdateLastHomeTurf(sourceGangID)
            local notifyLabel = "Home Turf Taken"
            local notifyMessage = "You took the home turf of another gang. Be careful out there!"
            if contestingGangName == nil then
                local data = string.format("**%s** declared **%s** as their new Home Turf. `Leader:` %s `Leader CID:` %s", sourceGangName, zoneName,
                    leaderName, leader_cid)
                GangSystemLog(data)
                exports['fm-logs']:createLog({
                    LogType = "Gang Systsem", -- The log type
                    Message = "Home Turf Taken", -- The message of the log
                    Level = "info", -- The level of the log (can be filtered on Fivemerr) (info by default)
                    Resource = "cb-gangsystem", -- Resource where the log is coming from (If not provided, `fm-logs` will be set by default)
                    Metadata = {
                        sourceGangName = sourceGangName,
                        zoneName= zoneName,
                        leaderName = leaderName,
                        leader_cid = leader_cid,
                    }
                })
            else
                local data = string.format("**%s** declared **%s** as their new Home Turf, taking it from %s. `Leader:` %s `Leader CID:` %s", sourceGangName,
                    zoneName, contestingGangName, leaderName, leader_cid)
                GangSystemLog(data)
                exports['fm-logs']:createLog({
                    LogType = "Gang Systsem", -- The log type
                    Message = "Home Turf Taken", -- The message of the log
                    Level = "info", -- The level of the log (can be filtered on Fivemerr) (info by default)
                    Resource = "cb-gangsystem", -- Resource where the log is coming from (If not provided, `fm-logs` will be set by default)
                    Metadata = {
                        sourceGangName = sourceGangName,
                        zoneName = zoneName,
                        contestingGangName = contestingGangName,
                        leaderName = leaderName,
                        leader_cid = leader_cid,
                    }
                })
            end
            TriggerClientEvent('cb-gangsystem:client:Notify', source, notifyLabel, notifyMessage, "success")
        else
            local sqlQuery = "UPDATE gangs SET home_turf = ? WHERE id = ?"
            MySQL.Async.execute(sqlQuery, { zone_tag, sourceGangID }, function(rowsChanged)
                if rowsChanged > 0 then
                    GangData[sourceGangID].home_turf = zone_tag
                    local notifyLabel = "New Home Turf"
                    local messageDesc = string.format("You declared %s as your Home Turf", zoneName)
                    local notifyMessage = messageDesc
                    local data = string.format("**%s** declared **%s** as their new Home Turf. `Leader:` %s `Leader CID:` %s", sourceGangName, zoneName,
                        leaderName, leader_cid)
                    GangSystemLog(data)
                    exports['fm-logs']:createLog({
                        LogType = "Gang Systsem", -- The log type
                        Message = "Home turf declared", -- The message of the log
                        Level = "info", -- The level of the log (can be filtered on Fivemerr) (info by default)
                        Resource = "cb-gangsystem", -- Resource where the log is coming from (If not provided, `fm-logs` will be set by default)
                        Metadata = {
                            sourceGangName = sourceGangName,
                            zoneName = zoneName,
                            leaderName = leaderName,
                            leader_cid = leader_cid,
                        }
                    })
                    TriggerClientEvent('cb-gangsystem:client:Notify', source, notifyLabel, notifyMessage, "success")
                else
                    lib.print.error("NOTHING WAS UPDATED IN gangs TABLE (cb-gangsystem:server:364)")
                    TriggerClientEvent('cb-gangsystem:client:DeclareHomeTurfMenu', source)
                end
            end)
            UpdateLastHomeTurf(sourceGangID)
        end
    elseif (GangAtZoneID ~= sourceGangID) and (GangAtZoneID ~= nil) then
        local notifyLabel = zoneName
        local notifyMessage = "Territory is controlled, you need to fight for it!"
        TriggerClientEvent('cb-gangsystem:client:Notify', source, notifyLabel, notifyMessage, "error")
        TriggerClientEvent('cb-gangsystem:client:DeclareHomeTurfMenu', source)
    elseif (GangAtZoneID == nil) then
        local notifyLabel = zoneName
        local notifyMessage = "You should make a presence in the turf before deciding to make it your home."
        TriggerClientEvent('cb-gangsystem:client:Notify', source, notifyLabel, notifyMessage, "error")
        TriggerClientEvent('cb-gangsystem:client:DeclareHomeTurfMenu', source)
    end
end)

RegisterServerEvent("cb-gangsystem:server:StaffPenalizeTop3")
AddEventHandler("cb-gangsystem:server:StaffPenalizeTop3", function(args)
    local src = source
    StaffPenalizeTop3(args.gangID, args.penalty)
    local gangName = GetGangNameFromID(args.gangID)
    local message = string.format(Translations.info.gangPenalizedTop3, gangName, args.penalty)
    print(message)
    TriggerClientEvent('cb-gangsystem:client:Notify', src, Translations.info.gangPenalized, message, "info")
end)

RegisterServerEvent("cb-gangsystem:server:getGangBankDetails")
AddEventHandler("cb-gangsystem:server:getGangBankDetails", function()
    local src = source
    local Player = GetPlayer(src)
    if Player == nil then return end
    local gangTag = Player.PlayerData.gang.name
    local gangID = GetGangIDByTag(gangTag)
    local balance = GangData[gangID].balance
    TriggerClientEvent('cb-gangsystem:client:manageGangFund', src, GangData, balance)
end)

RegisterServerEvent("cb-gangsystem:server:removeMoneyFromFund")
AddEventHandler("cb-gangsystem:server:removeMoneyFromFund", function(gangTag, withdrawalAmount)
    local src = source
    local Player = GetPlayer(src)
    local firstName = Player.PlayerData.charinfo.firstname
    local lastName = Player.PlayerData.charinfo.lastname
    local cid = Player.PlayerData.citizenid
    local gangID = GetGangIDByTag(gangTag)
    local gangName = GetGangNameFromID(gangID)
    local balance = GangData[gangID].balance
    if Player.Functions.AddMoney('cash', withdrawalAmount, "Gang Fund Withdrawal") then
        local newBalance = balance - withdrawalAmount
        UpdateGangFundBalance(gangID, newBalance)
        local data = string.format("%s %s (%s) removed money from Gang Fund. `Gang: %s` `Amount: $%.0f` `Balance: $%.0f`", firstName, lastName, cid,
            gangName, withdrawalAmount, newBalance)
        GangSystemLog(data)
    end
end)

RegisterServerEvent("cb-gangsystem:server:StaffPenalizeHomeTurf")
AddEventHandler("cb-gangsystem:server:StaffPenalizeHomeTurf", function(args)
    local src = source
    if src == nil then return end
    local gangID = args.gangID
    local gangHomeTurf = GetHomeTurf(gangID)
    StaffPenalizeHomeTurf(gangID, gangHomeTurf, args.penalty)
    if gangHomeTurf ~= "None" and gangHomeTurf ~= "Taken" and gangHomeTurf ~= nil then
        local gangName = GetGangNameFromID(args.gangID)
        local message = string.format(Translations.info.gangPenalizedHomeTurf, gangName, args.penalty, gangHomeTurf)
        GangSystemLog(message)
        TriggerClientEvent('cb-gangsystem:client:Notify', src, Translations.info.gangPenalized, message, "info")
    end
end)

RegisterServerEvent("cb-gangsystem:server:StaffGangTimeout")
AddEventHandler("cb-gangsystem:server:StaffGangTimeout", function(gangID)
    local src = source
    if src == nil then return end
    StaffGangTimeout(gangID, 1)
    local gangName = GetGangNameFromID(gangID)
    local message = string.format(Translations.info.gangTimeoutMessage, gangName)
    GangSystemLog(message)
    TriggerClientEvent('cb-gangsystem:client:Notify', src, Translations.info.gangPenalized, message, "info")
end)

RegisterServerEvent("cb-gangsystem:server:StaffRemoveGangTimeout")
AddEventHandler("cb-gangsystem:server:StaffRemoveGangTimeout", function(gangID)
    local src = source
    if src == nil then return end
    StaffGangTimeout(gangID, 0)
    local gangName = GetGangNameFromID(gangID)
    local message = string.format(Translations.info.removedGangTimeoutMessage, gangName)
    GangSystemLog(message)
    TriggerClientEvent('cb-gangsystem:client:Notify', src, Translations.info.removeGangTimeout, message, "info")
end)

RegisterServerEvent("cb-gangsystem:server:StaffDeleteGang")
AddEventHandler("cb-gangsystem:server:StaffDeleteGang", function(gangID)
    local src = source
    for _, v in pairs(GetPlayers()) do
        local Player = GetPlayer(v)
        if Player == nil then return end
        local gangTag = Player.PlayerData.gang.name
        local playerGangID = GetGangIDByTag(gangTag)
        local citizenID = Player.PlayerData.citizenid
        if playerGangID == gangID then
            RemoveFromGang(Player, citizenID, gangTag)
            TriggerClientEvent('cb-gangsystem:client:Notify', src, Translations.info.gangDisbanded, Translations.info.gangDisbandedDesc, "info")
        end
    end
    DeleteGang(gangID)
    TriggerEvent("cb-gangsystem:server:loadGangStorage")
end)

RegisterServerEvent("cb-gangsystem:server:StaffIncreaseTurf")
AddEventHandler("cb-gangsystem:server:StaffIncreaseTurf", function(args)
    local src = source
    if src == nil then return end
    if (args.gangID ~= nil) and (args.zone ~= nil) and (args.increase ~= nil) then
        StaffIncreaseTurf(args.gangID, args.zone, args.increase)
        local gangName = GetGangNameFromID(args.gangID)
        local message = string.format(Translations.info.loyaltyIncreaseMessage, gangName, args.zone)
        print(message)
        GangSystemLog(message)
        TriggerClientEvent('cb-gangsystem:client:Notify', src, Translations.success.loyaltyIncreased, message, "info")
    end
end)

RegisterServerEvent("cb-gangsystem:server:StaffDecreaseTurf")
AddEventHandler("cb-gangsystem:server:StaffDecreaseTurf", function(args)
    local src = source
    if src == nil then return end
    if (args.gangID ~= nil) and (args.zone ~= nil) and (args.increase ~= nil) then
        StaffDecreaseTurf(args.gangID, args.zone, args.increase)
        local gangName = GetGangNameFromID(args.gangID)
        local message = string.format(Translations.info.loyaltyDecreaseMessage, gangName, args.zone)
        print(message)
        GangSystemLog(message)
        TriggerClientEvent('cb-gangsystem:client:Notify', src, Translations.success.loyaltyIncreased, message, "info")
    end
end)

RegisterServerEvent("cb-gangsystem:server:SetRoutingBucket")
AddEventHandler("cb-gangsystem:server:SetRoutingBucket", function(bucket)
    local _source = source
    local Player = GetPlayer(_source)
    if _source == nil then return end
    SetPlayerRoutingBucket(_source, bucket)
    Player.Functions.SetMetaData('gangHideout', bucket)
    if bucket ~= 0 and bucket ~= nil then
        TriggerClientEvent('cb-gangsystem:client:SpawnInsideZones', _source)
    end
end)

RegisterServerEvent('cb-gangsystem:server:CheckForPurchasedHints')
AddEventHandler('cb-gangsystem:server:CheckForPurchasedHints', function(gangTag)
    local gangID = GetGangIDByTag(gangTag)
    local purchasedHints = GangData[gangID].purchased_hints
    TriggerClientEvent('cb-gangsystem:client:HintMenu', source, purchasedHints)
end)

RegisterServerEvent('cb-gangsystem:server:UpdatePurchasedHints')
AddEventHandler('cb-gangsystem:server:UpdatePurchasedHints', function(gangTag, hintID, hintCost)
    local src = source
    local Player = GetPlayer(src)
    if Player == nil then return end
    local gangID = GetGangIDByTag(gangTag)
    if Player.PlayerData.money.cash >= hintCost then
        EnoughMoney = true
    end
    if not EnoughMoney then
        TriggerClientEvent('cb-gangsystem:client:Notify', src, Translations.error.notEnoughMoney,
            Translations.error.notEnoughMoneyDesc, "error")
        return
    end
    Player.Functions.RemoveMoney('cash', hintCost)
    local result = MySQL.Sync.fetchAll("SELECT purchased_hints FROM gangs WHERE id = @gangID", { ['@gangID'] = gangID })
    local purchasedHints = json.decode(result[1].purchased_hints) -- Decode JSON string to Lua table

    -- Check if the hintID is already in the permissions array
    local alreadyExists = false
    for i, existingRank in ipairs(purchasedHints) do
        if existingRank == hintID then
            alreadyExists = true
            break
        end
    end

    -- If the hintID doesn't exist, add it to the permissions array
    if not alreadyExists then
        table.insert(purchasedHints, hintID)
    end

    -- Update the database with the modified permissions
    MySQL.Sync.execute("UPDATE gangs SET purchased_hints = @purchasedHints WHERE id = @gangID", {
        ['@purchasedHints'] = json.encode(purchasedHints), -- Encode Lua table to JSON string
        ['@gangID'] = gangID
    })

    -- Update the GangData with the modified permissions
    if GangData[gangID] then
        GangData[gangID].purchased_hints = purchasedHints
    end
end)

-- Function to update gang permissions
local function updatePermissions(gangID, permission, rank, dbColumn)
    -- Retrieve the current permissions from the database
    local result = SQLQuery("SELECT " .. dbColumn .. " FROM gang_perms WHERE gang_id = @gangID", { ['@gangID'] = gangID })
    local perms = json.decode(result[1][dbColumn]) -- Decode JSON string to Lua table

    -- Check if the rank is already in the permissions array
    local alreadyExists = false
    local indexToRemove = nil
    for i, existingRank in ipairs(perms) do
        if existingRank == rank then
            alreadyExists = true
            indexToRemove = i
            break
        end
    end

    -- If the rank doesn't exist, add it to the permissions array
    if not alreadyExists then
        table.insert(perms, rank)
    else
        -- If the rank exists, remove it from the permissions array
        table.remove(perms, indexToRemove)
    end

    -- Update the database with the modified permissions
    SQLQuery("UPDATE gang_perms SET " .. dbColumn .. " = @perms WHERE gang_id = @gangID", {
        ['@perms'] = json.encode(perms), -- Encode Lua table to JSON string
        ['@gangID'] = gangID
    })

    -- Update the GangData with the modified permissions
    if GangPermissions[gangID] then
        GangPermissions[gangID][dbColumn] = perms
    end
end

RegisterServerEvent('cb-gangsystem:server:UpdateGangPermissions')
AddEventHandler('cb-gangsystem:server:UpdateGangPermissions', function(gangID, permission, rank)
    local src = source
    local dbColumn = GetPermissionKey(permission)
    
    if dbColumn then
        updatePermissions(gangID, permission, rank, dbColumn)
    end

    TriggerClientEvent('cb-gangsystem:client:ManageGangPermsMenu', src, GangData, rank)
end)

RegisterServerEvent("cb-gangsystem:server:refreshGangRanks")
AddEventHandler("cb-gangsystem:server:refreshGangRanks", function()
    local src = source
    TriggerClientEvent('cb-gangsystem:client:ManageGangPermsPreMenu', src, GangData)
end)

RegisterServerEvent("cb-gangsystem:server:RefreshGangMenu")
AddEventHandler("cb-gangsystem:server:RefreshGangMenu", function()
    TriggerClientEvent('cb-gangsystem:client:GangMenu', source, GangData)
end)

RegisterServerEvent("cb-gangsystem:server:RefreshGangManagementMenu")
AddEventHandler("cb-gangsystem:server:RefreshGangManagementMenu", function(gangID)
    TriggerClientEvent('cb-gangsystem:server:ManageMembers', gangID)
end)

RegisterServerEvent("cb-gangsystem:server:StartRivalry")
AddEventHandler("cb-gangsystem:server:StartRivalry", function(zone)
    local src = source
    local Player = GetPlayer(src)
    if Player.Functions.RemoveMoney('cash', Config.Rivalry.Cost) then
        local timestamp = os.time() -- current Unix timestamp
        local source = source
        local result = SQLQuery("SELECT * FROM gang_rivalries WHERE zone = ?", {zone})
        if not result or not result[1] then
            -- If the row doesn't exist, add a new one
            SQLQuery("INSERT INTO gang_rivalries (zone, escrow, competition, started) VALUES (?, ?, ?, ?)", {zone, Config.Rivalry.Cost, "[]", timestamp})
            UpdateActiveRivalries()
        else
            local notifyLabel = Translations.error.existingRivalry
            local message = Translations.error.existingRivalryDesc
            TriggerClientEvent('cb-gangsystem:client:Notify', source, notifyLabel, message, "error")
        end
    else
        local notifyLabel = Translations.error.notEnoughMoney
        local message = Translations.error.notEnoughMoneyDesc
        TriggerClientEvent('cb-gangsystem:client:Notify', source, notifyLabel, message, "error")
    end
end)

RegisterServerEvent("cb-gangsystem:server:LeaveGang")
AddEventHandler("cb-gangsystem:server:LeaveGang", function()
    local src = source
    if src == nil then return end
    local Player = GetPlayer(src)
    local firstName = Player.PlayerData.charinfo.firstname
    local lastName = Player.PlayerData.charinfo.lastname
    local fullName = firstName .. " " .. lastName
    local cid = Player.PlayerData.citizenid
    local gangName = Player.PlayerData.gang.label
    local gangRank = Player.PlayerData.gang.grade.level
    local gangTag = Player.PlayerData.gang.name
    local gangID = GetGangIDByTag(gangTag)
    if (Player.PlayerData.citizenid ~= GangData[gangID].leader_cid) and gangRank ~= 6 then
        Player.Functions.SetGang(tostring('none'), tonumber(0))
        local data = string.format("%s (%s) left %s", fullName, cid, gangName)
        GangSystemLog(data)
        local message = string.format(Translations.info.leftGangMessage, gangName)
        local notifyLabel = Translations.info.leftGang
        TriggerClientEvent('cb-gangsystem:client:Notify', src, notifyLabel, message, "error")
        TriggerEvent("cb-gangsystem:server:loadGangStorage")
    else
        local message = Translations.error.cannotLeave
        local notifyLabel = Translations.error.cannotLeaveDesc
        TriggerClientEvent('cb-gangsystem:client:Notify', src, notifyLabel, message, "error")
    end
end)

RegisterServerEvent('cb-gangsystem:server:RandomBlueprint', function()
    local src = source
    if src == nil then return end
    local Player = GetPlayer(src)
    if Player == nil then return end
    
    -- Calculate total chance sum
    local totalChance = 0
    for _, item in ipairs(Config.BlueprintTableItems) do
        totalChance = totalChance + item.chance
    end
    local gangTag = Player.PlayerData.gang.name
    local gang_id = GetGangIDByTag(gangTag)
    local gangName = Player.PlayerData.gang.label
    local lastBP = GetLastBlueprint(gang_id)
    local inTimeout = IsGangTimeout(gang_id)
    local warTimeout = IsWarTimeout(gang_id)
    if (lastBP == nil or lastBP == 0) and not inTimeout and not warTimeout then
        for i=1, Config.NumberOfBlueprints do
            -- Generate random item based on chances
            local randomValue = math.random(1, totalChance)
            local cumulativeChance = 0
            local randomItem = nil
            for _, item in ipairs(Config.BlueprintTableItems) do
                cumulativeChance = cumulativeChance + item.chance
                if randomValue <= cumulativeChance then
                    randomItem = item.item
                    break
                end
            end
            if not randomItem then
                return
            end
            if AddItem(src, randomItem, 1) then
                if Config.BlueprintSystemType == "gang" then
                    UpdateLastBlueprint(gang_id)
                else
                    local timestamp = os.time()
                    Player.Functions.SetMetaData('lastBlueprint', timestamp)
                end
                local data = string.format("Gang Received Blueprint. `Gang Name:` %s `Item Received:` %s", gangName, randomItem)
                GangSystemLog(data)
                exports['fm-logs']:createLog({
                    LogType = "Gang System", -- The log type
                    Message = "Blueprint Received", -- The message of the log
                    Level = "info", -- The level of the log (can be filtered on Fivemerr) (info by default)
                    Resource = "cb-gangsystem", -- Resource where the log is coming from (If not provided, `fm-logs` will be set by default)
                    Metadata = {
                        gangName = gangName,
                        randomItem = randomItem,
                    }
                })
            end
        end
    elseif (not lastBP or os.time() - lastBP >= 3600 * Config.BlueprintTableWaitTime) and not inTimeout and not warTimeout then
        for i=1, Config.NumberOfBlueprints do
            -- Generate random item based on chances
            local randomValue = math.random(1, totalChance)
            local cumulativeChance = 0
            local randomItem = nil
            for _, item in ipairs(Config.BlueprintTableItems) do
                cumulativeChance = cumulativeChance + item.chance
                if randomValue <= cumulativeChance then
                    randomItem = item.item
                    break
                end
            end
            if not randomItem then
                lib.print.error("No item selected")
                return
            end
            if AddItem(src, randomItem, 1) then
                if Config.BlueprintSystemType == "gang" then
                    UpdateLastBlueprint(gang_id)
                else
                    local timestamp = os.time()
                    Player.Functions.SetMetaData('lastBlueprint', timestamp)
                end
                local data = string.format("Gang Received Blueprint. `Gang Name:` %s `Item Received:` %s", gangName, randomItem)
                GangSystemLog(data)
                exports['fm-logs']:createLog({
                    LogType = "Gang System", -- The log type
                    Message = "Blueprint Received", -- The message of the log
                    Level = "info", -- The level of the log (can be filtered on Fivemerr) (info by default)
                    Resource = "cb-gangsystem", -- Resource where the log is coming from (If not provided, `fm-logs` will be set by default)
                    Metadata = {
                        gangName = gangName,
                        randomItem = randomItem,
                    }
                })
            end
        end
    end
end)

RegisterServerEvent("cb-gangsystem:server:EnterHideoutLog")
AddEventHandler("cb-gangsystem:server:EnterHideoutLog", function()
    local _source = source
    if _source == nil then return end
    local Player = GetPlayer(_source)
    local cid = Player.PlayerData.citizenid
    local fullName = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname
    local gangName = Player.PlayerData.gang.label
    local data = string.format("%s (%s) entered a Gang Hideout. `Gang Name:` %s", fullName, cid, gangName)
    GangSystemLog(data)
    exports['fm-logs']:createLog({
        LogType = "Gang System", -- The log type
        Message = "Blueprint Received", -- The message of the log
        Level = "info", -- The level of the log (can be filtered on Fivemerr) (info by default)
        Resource = "cb-gangsystem", -- Resource where the log is coming from (If not provided, `fm-logs` will be set by default)
        Metadata = {
            fullName = fullName,
            cid = cid,
            gangName = gangName,
        }
    })
end)

RegisterServerEvent("cb-gangsystem:server:PoliceSetup")
AddEventHandler("cb-gangsystem:server:PoliceSetup", function()
    local _source = source
    if _source == nil then return end
    local Player = GetPlayer(_source)
    local cid = Player.PlayerData.citizenid
    local fullName = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname
    local gangName = Player.PlayerData.gang.label
    local data = string.format("%s (%s | %s) sold to an undercover police officer", fullName, cid, gangName)
    GangSystemLog(data)
end)

RegisterServerEvent("cb-gangsystem:server:CheckForInvalidRank")
AddEventHandler("cb-gangsystem:server:CheckForInvalidRank", function(cid, gangTag, gangRank)
    local gangID = GetGangIDByTag(gangTag)
    local src = source
    local Player = GetPlayer(source)
    if gangRank >= 6 and (cid ~= GangData[gangID].leader_cid) then
        TriggerEvent('cb-gangsystem:server:ResetPlayerGangData', source, gangID, Player)
    elseif gangRank > 6 and (cid == GangData[gangID].leader_cid) then
        TriggerEvent('cb-gangsystem:server:ResetPlayerGangData', src, gangID, Player)
        Player.Functions.SetGang(GangData[gangID].tag, 6)
    end
end)

RegisterServerEvent("cb-gangsystem:server:UpdateLastActive")
AddEventHandler("cb-gangsystem:server:UpdateLastActive", function(gangTag)
    local gangID = GetGangIDByTag(gangTag)
    UpdateLastActive(gangID)
end)

RegisterServerEvent("cb-gangsystem:server:ResetPlayerGangData")
AddEventHandler("cb-gangsystem:server:ResetPlayerGangData", function(src, playerGangID, Player)
    if src == nil then return end
    if playerGangID ~= 0 then
        for gangID, gangData in pairs(GangData) do
            if playerGangID == gangID then
                Player.Functions.SetGang(GangData[gangID].tag, 0)
                local notifyLabel = Translations.success.gangDataReset
                local notifyMessage = Translations.success.gangDataResetDesc
                TriggerClientEvent('cb-gangsystem:client:Notify', src, notifyLabel, notifyMessage, "success")
            end
        end
    else
        Player.Functions.SetGang("none", 0)
        local notifyLabel = Translations.success.gangDataReset
        local notifyMessage = Translations.success.gangDataResetDesc
        TriggerClientEvent('cb-gangsystem:client:Notify', src, notifyLabel, notifyMessage, "success")
    end
end)

RegisterServerEvent("cb-gangsystem:server:PlayerGangNoExist")
AddEventHandler("cb-gangsystem:server:PlayerGangNoExist", function()
    local src = source
    if src == nil then return end
    local Player = GetPlayer(source)
    if Player == nil then return end
    local gangTag = Player.PlayerData.gang.name
    local gangID = GetGangIDByTag(gangTag)
    if gangID ~= nil then
        Player.Functions.SetGang("none", 0)
        TriggerClientEvent('cb-gangsystem:client:Notify', src, Translations.info.gangDisbanded, Translations.info.gangDisbandedDesc, "info")
    end
end)


RegisterNetEvent("cb-gangsystem:server:attemptSell")
AddEventHandler("cb-gangsystem:server:attemptSell", function(drug)
    local source = source
    if source == nil then return end
    local Player = GetPlayer(source)
    local prices = Config.DrugPrices[drug]
    if not prices then return end
    math.randomseed(math.floor(os.clock() + 20))
    local price = math.random(prices.Min, prices.Max)

    -- Amount.
    math.randomseed(math.floor(os.clock() + 42))
    local amount = math.max(
        math.ceil(math.min(Player.Functions.GetItemByName(drug).amount or 0, prices.Cap) * math.random()), 1)

    Players[source] = { drug = drug, price = price, amount = amount }
    TriggerClientEvent("cb-gangsystem:client:attemptSell", source, price, amount)
end)

RegisterNetEvent("cb-gangsystem:server:sellDrugs")
AddEventHandler("cb-gangsystem:server:sellDrugs", function(zone, isRivalry, gangTag, loyaltyEarned)
    local source = source
    if source == nil then return end
    local Player = GetPlayer(source)
    local gangID = GetGangIDByTag(gangTag)
    local cid = Player.PlayerData.citizenid
    local firstName = Player.PlayerData.charinfo.firstname
    local lastName = Player.PlayerData.charinfo.lastname
    local cache = Players[source]
    if not cache then return end
    local itemCheck = Player.Functions.GetItemByName(cache.drug)
    if itemCheck.amount < cache.amount then
        TriggerClientEvent("cb-gangsystem:client:stopSelling", source)
        return
    end
    local price = cache.amount * cache.price

    -- Check the number of turfs controlled by the gang
    local turfCount = GetGangTurfCount(gangID)
    if Config.LimitGangTurfs then
        print(turfCount)
        print(Config.MaxGangTurfs)
        if turfCount > Config.MaxGangTurfs then
            price = math.ceil(price * 0.7)
            TriggerClientEvent('cb-gangsystem:client:Notify', source, "Too Many Turfs", string.format("Upkeep was %.0f%% because you control more than %.0f turfs", Config.UpkeepPercentage * 100, Config.MaxGangTurfs), "info")
        end
    end

    if Config.UseZoneModifier then
        local controllingGang = GetGangAtZoneReturnID(zone)
        if controllingGang == gangID and controllingGang ~= nil and gangID ~= nil then
            price = math.ceil(price * Config.ZoneModifier)
            if Config.OptionalNotifications.ZoneModifier then
                TriggerClientEvent('cb-gangsystem:client:Notify', source, Translations.drugSelling.zoneModifier, Translations.drugSelling.zoneModifierDesc, "info")
            end
        end
    end

    if isRivalry then
        local timestamp = os.time() -- current Unix timestamp
        local result = SQLQuery("SELECT * FROM gang_rivalries WHERE zone = ?", { zone })
        if result and result[1] then
            -- Rivalry exists, update the competition column
            local existingCompetition = json.decode(result[1].competition or "[]")
            local updatedCompetition = {}
            local gangFound = false
            for i, entry in ipairs(existingCompetition) do
                local existingGangID, existingLoyalty = entry:match("(%d+)%s*-%s*(%d+)")
                if existingGangID and tonumber(existingGangID) == gangID then
                    -- Gang found in existing competition, update loyalty earned
                    local newLoyalty = tonumber(existingLoyalty) + loyaltyEarned
                    local updatedEntry = string.format("%d - %d", gangID, newLoyalty)
                    table.insert(updatedCompetition, updatedEntry)
                    gangFound = true
                else
                    table.insert(updatedCompetition, entry)
                end
            end
            if not gangFound then
                -- Gang not found in existing competition, add new entry
                local newEntry = string.format("%d - %d", gangID, loyaltyEarned)
                table.insert(updatedCompetition, newEntry)
            end
            -- Update the database with the modified competition
            SQLQuery("UPDATE gang_rivalries SET competition = ?, started = ? WHERE zone = ?", { json.encode(updatedCompetition), timestamp, zone })
            UpdateActiveRivalries() -- Update ActiveRivalryData table
        end
        price = math.ceil(price * (1 - Config.Rivalry.EscrowPercentage))
        local addToEscrow = math.ceil(price * Config.Rivalry.EscrowPercentage)
        TriggerClientEvent('cb-gangsystem:client:Notify', source, Translations.drugSelling.gangRivalry, string.format(Translations.drugSelling.gangRivalryDesc, addToEscrow), "info")

        -- Retrieve the current escrow amount from the database
        local result = MySQL.Sync.fetchScalar("SELECT escrow FROM gang_rivalries WHERE zone = @zone",
            { ['@zone'] = zone })
        local currentEscrow = tonumber(result) or 0

        -- Update the escrow amount with the new addition
        local newEscrow = currentEscrow + addToEscrow
        MySQL.Sync.execute("UPDATE gang_rivalries SET escrow = @escrow WHERE zone = @zone",
            { ['@escrow'] = newEscrow, ['@zone'] = zone })
        local data = string.format("%s added `$%.0f` into escrow for a Rivalry in %s", GetGangNameFromID(gangID), addToEscrow,
        exports['cb-gangsystem']:GetTurfName(zone))
        GangSystemLog(data)
    end
    -- Drug Sale Multiplier System --
    local policeCount = PlayersWithJob()
    local drugSaleMultiplier = Config.DrugSaleMultiplier(policeCount)
    local newPrice = math.ceil(price * drugSaleMultiplier)
    -- End of Drug Sale Multiplier System
    RemoveItem(source, cache.drug, cache.amount)
    if Config.DirtyCashItem == nil then
        Player.Functions.AddMoney("cash", newPrice, "Sell Drugs")
    else
        local dirtyCashItem = Config.DirtyCashItem
        if not AddItem(source, dirtyCashItem, newPrice) then
            print("There was an error adding dirty cash!")
        end
    end
    TriggerClientEvent("cb-gangsystem:client:sellDrugs", source, newPrice)
    DrugSaleLog(string.format("%s %s (%s | %s) sold `%.0fx %s` for `$%.0f` in `%s` at <t:%d:T>", firstName, lastName, cid, GetGangNameFromID(gangID) or "N/A", cache.amount, GetItemLabel(cache.drug), newPrice, zone, os.time()))
    exports['fm-logs']:createLog({
        LogType = "Drug Sales", -- The log type
        Message = "Someone sold some drugs", -- The message of the log
        Level = "info", -- The level of the log (can be filtered on Fivemerr) (info by default)
        Resource = "cb-Gangsystem", -- Resource where the log is coming from (If not provided, `fm-logs` will be set by default)
        Metadata = {
            firstName = firstName,
            lastName = lastName,
            cid = cid,
            gangID = GetGangNameFromID(gangID),
            newPrice = newPrice,
            zone = zone,
        }
    })
    Players[source] = nil
end)

AddEventHandler('QBCore:Server:OnGangUpdate', function(source, gang)
    TriggerClientEvent('cb-gangsystem:client:RegisterGangRadial', source)
end)
