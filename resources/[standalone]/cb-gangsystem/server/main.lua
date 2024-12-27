QBCore = exports['qb-core']:GetCoreObject()
Translations = Translations
GangData = {}
GangPermissions = {}
GangZoneData = {}
Missions = {}
Players = {}
factions = {}

--███████╗██╗   ██╗███╗   ██╗ ██████╗████████╗██╗ ██████╗ ███╗   ██╗███████╗
--██╔════╝██║   ██║████╗  ██║██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
--█████╗  ██║   ██║██╔██╗ ██║██║        ██║   ██║██║   ██║██╔██╗ ██║███████╗
--██╔══╝  ██║   ██║██║╚██╗██║██║        ██║   ██║██║   ██║██║╚██╗██║╚════██║
--██║     ╚██████╔╝██║ ╚████║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║███████║
--╚═╝      ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
function UpdateGangData()
    local status, err = pcall(function()
        GangData = {}
        local rows = SQLQuery(
            'SELECT DISTINCT * FROM gangs')
        for i = 1, #rows do
            GangData[rows[i].id] = {
                id = rows[i].id,
                name = rows[i].name,
                tag = rows[i].tag,
                leader_cid = rows[i].leader_cid,
                home_turf = rows[i].home_turf or "None",
                last_blueprint = rows[i].last_blueprint,
                last_home_turf = rows[i].last_home_turf,
                last_gift = rows[i].last_gift,
                penalty = rows[i].penalty,
                balance = rows[i].balance,
                last_bm_shop = rows[i].last_bm_shop,
                storage = rows[i].storage or nil,
                boss_menu = rows[i].boss_menu or nil,
                color = rows[i].color or 0,
                purchased_hints = json.decode(rows[i].purchased_hints or "[]"),
                ranks = rows[i].ranks or "Prospect, Member, Enforcer, Treasurer, Sergeant at Arms, Vice President, President",
                image = Config.GangImagePath .. rows[i].tag .. ".png",
                last_active = rows[i].last_active or nil,
                war = rows[i].war or 0,
                warOutfit = json.decode(rows[i].warOutfit) or "NA",
                prevalence = rows[i].prevalence or 0,
                warTimeout = rows[i].warTimeout or 0,
                protection = rows[i].protection or 0,
            }
        end
    end)
    
    if not status then
        lib.print.error("We've detected issues with your database. Please read the Installation Guide found at https://docs.coolbrad.com or open a ticket in our Discord for more help!")
    end
end

function UpdateGangPermissions()
    local status, err = pcall(function()
        GangPermissions = {}
        local rows = SQLQuery(
            'SELECT DISTINCT gang_id, add_money_perms, remove_money_perms, declare_turf_perms, move_gang_storage, access_storage, add_members, rename_gang, manage_ranks, change_color FROM gang_perms'
        )
        for i = 1, #rows do
            GangPermissions[rows[i].gang_id] = {
                add_money_perms = json.decode(rows[i].add_money_perms or "[]"),
                remove_money_perms = json.decode(rows[i].remove_money_perms or "[]"),
                declare_turf_perms = json.decode(rows[i].declare_turf_perms or "[]"),
                move_gang_storage = json.decode(rows[i].move_gang_storage or "[]"),
                access_storage = json.decode(rows[i].access_storage or "[]"),
                add_members = json.decode(rows[i].add_members or "[]"),
                rename_gang = json.decode(rows[i].rename_gang or "[]"),
                manage_ranks = json.decode(rows[i].manage_ranks or "[]"),
                change_color = json.decode(rows[i].change_color or "[]")
            }
        end
    end)
    
    if not status then
        lib.print.error("We've detected issues with your database. Please read the Installation Guide found at https://docs.coolbrad.com or open a ticket in our Discord for more help!")
    end
end

function GetAllGangMembers(gangID)
    local players = {}
    for _, v in pairs(GetPlayers()) do
        local Player = GetPlayer(v)
        if Player == nil then return nil end
        local playerGang = Player.PlayerData.gang.name
        local playerGangID = GetGangIDByTag(playerGang)
        if (playerGangID == gangID) then
            local firstName = Player.PlayerData.charinfo.firstname
            local lastName = Player.PlayerData.charinfo.lastname
            local cid = Player.PlayerData.citizenid
            local identification = firstName .. " " .. lastName .. " - " .. cid
            table.insert(players, { id = Player.PlayerData.source, name = identification })
        end
    end
    return players
end

function NotifyOnlineMembers(playerID, message)
    local src = playerID
    if src == nil then return nil end
    local Player = GetPlayer(src)
    if Player == nil then return nil end
    local gangTag = Player.PlayerData.gang.name
    local gangID = GetGangIDByTag(gangTag)
    local players = GetAllGangMembers(gangID)
    if players ~= nil then
        for k,v in pairs(players) do
            TriggerClientEvent('cb-gangsystem:client:Notify', v.id, GetGangNameFromID(gangID), message, "info")
        end
    end
end

function GetOnlineMemberCount(gangID)
    local count = 0
    for _, v in pairs(GetPlayers()) do
        local Player = GetPlayer(v)
        if Player == nil then return nil end
        local playerGang = Player.PlayerData.gang.name
        local playerGangID = GetGangIDByTag(playerGang)
        if (playerGangID == gangID) then
            count = count + 1
        end
    end
    return count
end

function PrevalenceDecay()
    for id, gangData in pairs(GangData) do
        local prevalence = GangData[id].prevalence
        local newPrev = prevalence - Config.Prevalence.DecayAmount
        if newPrev > Config.Prevalence.MaxPrevalence then
            newPrev = Config.Prevalence.MaxPrevalence
        elseif newPrev < Config.Prevalence.MinPrevalence then
            newPrev = Config.Prevalence.MinPrevalence
        end
        GangData[id].prevalence = newPrev
        SQLQuery("UPDATE gangs SET prevalence = ? WHERE id = ?", {newPrev, id})
    end
    local data = "Gang Prevalence for all Gangs decayed by " .. Config.Prevalence.DecayAmount
    GangSystemLog(data)
end

function PrevalenceIncrease(gangTag, type)
    local amount = 0
    local reason = nil
    if type == "Drugs" then
        amount = Config.Prevalence.Increase.Drugs
    elseif type == "Mission" then
        amount = Config.Prevalence.Increase.Mission
    elseif type == "Spray" then
        amount = Config.Prevalence.Increase.Spray
    elseif type == "Heist" then
        amount = Config.Prevalence.Increase.Heist
    end
    local gangID = GetGangIDByTag(gangTag)
    local prevalence = GangData[gangID].prevalence
    local newPrev = prevalence + amount
    if newPrev > Config.Prevalence.MaxPrevalence then
        newPrev = Config.Prevalence.MaxPrevalence
    elseif newPrev < Config.Prevalence.MinPrevalence then
        newPrev = Config.Prevalence.MinPrevalence
    end
    GangData[gangID].prevalence = newPrev
    SQLQuery("UPDATE gangs SET prevalence = ? WHERE id = ?", {newPrev, gangID})
    local data = "Gang Prevalence for " .. GangData[gangID].name .. " increased by " .. amount .. " for " .. type
    GangSystemLog(data)
end

function PrevalenceDecrease(gangTag, type)
    local amount = 0
    if type == "Vendetta" then
        amount = Config.Prevalence.Decrease.Vendetta
    elseif type == "Vendetta Police" then
        amount = Config.Prevalence.Decrease.VendettaPolice
    elseif type == "Gang Timeout" then
        amount = Config.Prevalence.Decrease.GangTimeout
    elseif type == "Staff Penalty" then
        amount = Config.Prevalence.Decrease.StaffPenalty
    elseif type == "Shooting" then
        amount = Config.Prevalence.Decrease.Shooting
    elseif type == "Shooting Community Turf" then
        amount = Config.Prevalence.Decrease.ShootingCommunityTurf
    elseif type == "Reckless Driving" then
        amount = Config.Prevalence.Decrease.RecklessDriving
    end
    if amount == 0 then return end
    local gangID = GetGangIDByTag(gangTag)
    local prevalence = GangData[gangID].prevalence
    local newPrev = prevalence - amount
    if newPrev > Config.Prevalence.MaxPrevalence then
        newPrev = Config.Prevalence.MaxPrevalence
    elseif newPrev < Config.Prevalence.MinPrevalence then
        newPrev = Config.Prevalence.MinPrevalence
    end
    GangData[gangID].prevalence = newPrev
    SQLQuery("UPDATE gangs SET prevalence = ? WHERE id = ?", {newPrev, gangID})
    local data = "Gang Prevalence for " .. GangData[gangID].name .. " decreased by " .. amount .. " for " .. type
    GangSystemLog(data)
end

-- TODO: War Cooldown

function DeleteGangFromRivalries(gangId)
    for zone, rivalryData in pairs(ActiveRivalryData) do
        local updatedCompetition = {}
        local found = false

        for _, entry in ipairs(rivalryData.competition) do
            local gangID, loyalty = entry:match("(%d+)%s*-%s*(%d+)")
            if tonumber(gangID) ~= gangId then
                table.insert(updatedCompetition, entry)
            else
                found = true
            end
        end

        if found then
            -- Update the competition data
            SQLQuery("UPDATE gang_rivalries SET competition = ? WHERE zone = ?", { json.encode(updatedCompetition), zone })

            -- Update the in-memory data
            ActiveRivalryData[zone].competition = updatedCompetition
            lib.print.info("Removed gang with ID " .. gangId .. " from rivalry in zone " .. zone)
        end
    end
end

function DeleteGangFromZones(gangId)
    -- Delete the gang from the gang_zones table
    local deleteResult = SQLQuery('DELETE FROM gang_zones WHERE gang_id = ?', {gangId})

    -- Check if the deletion was successful
    if deleteResult.affectedRows > 0 then
        -- Remove the gang from the in-memory GangZoneData
        for id, zoneData in pairs(GangZoneData) do
            if zoneData.controller == gangId then
                GangZoneData[id] = nil
            end
        end
        lib.print.info("Gang with ID " .. gangId .. " has been removed from gang zones successfully.")
    else
        lib.print.error("Could not remove gang with ID " .. gangId .. " from gang zones.")
    end
end

function DeleteGang(gangId)
    -- First, check and remove the gang from any rivalries
    DeleteGangFromRivalries(gangId)

    -- Remove the gang from the gang zones
    DeleteGangFromZones(gangId)
    
    if Framework == "qbox" then
        exports.qbx_core:RemoveGang(GetGangTagFromID(gangId))
    end

    -- Delete the gang from the SQL database
    local deleteResult = SQLQuery('DELETE FROM gangs WHERE id = ?', {gangId})
    
    -- Check if the deletion was successful
    if deleteResult.affectedRows > 0 then
        -- Remove the gang from the GangData table
        GangData[gangId] = nil
        lib.print.info("Gang with ID " .. gangId .. " has been deleted successfully.")
    else
        lib.print.error("Could not delete gang with ID " .. gangId .. ".")
    end
end

function UpdateGangZoneData()
    local status, err = pcall(function()
        GangZoneData = {}
        local rows = SQLQuery('SELECT id, name, gang_id, loyalty FROM gang_zones')
        for i = 1, #rows do
            GangZoneData[rows[i].id] = {
                id = rows[i].id,
                name = rows[i].name,
                controller = rows[i].gang_id,
                loyalty = rows[i].loyalty
            }
        end
    end)
    
    if not status then
        lib.print.error("We've detected issues with your database. Please read the Installation Guide found at https://docs.coolbrad.com or open a ticket in our Discord for more help!")
    end
end

function UpdateActiveRivalries()
    local status, err = pcall(function()
        ActiveRivalryData = {}
        local rows = SQLQuery('SELECT zone, escrow, competition, started FROM gang_rivalries')
        for i = 1, #rows do
            ActiveRivalryData[rows[i].zone] = {
                zone = rows[i].zone,
                escrow = rows[i].escrow,
                competition = json.decode(rows[i].competition or "[]"),
                started = rows[i].started
            }
        end
    end)
    
    if not status then
        lib.print.error("We've detected issues with your database. Please read the Installation Guide found at https://docs.coolbrad.com or open a ticket in our Discord for more help!")
    end
end

function ResetRivalryData(zone)
    local result = MySQL.Sync.fetchScalar("SELECT competition FROM gang_rivalries WHERE zone = @zone", { ['@zone'] = zone })
    local competitionData = json.decode(result) or {}
    local highestScore = -1
    local winningGangID = nil
    -- Iterate through the competition data to find the gang with the highest score
    for _, entry in ipairs(competitionData) do
        local gangID, loyalty = entry:match("(%d+)%s*-%s*(%d+)")
        if gangID and loyalty then
            local score = tonumber(loyalty) or 0
            if score > highestScore then
                highestScore = score
                winningGangID = tonumber(gangID)
            end
        end
    end

    -- Update the winning gang's balance with the escrow amount
    SQLQuery("UPDATE gangs SET balance = balance + ? WHERE id = ?", { ActiveRivalryData[zone].escrow, winningGangID })

    -- Delete the row corresponding to the zone from the gang_rivalries table
    SQLQuery("DELETE FROM gang_rivalries WHERE zone = ?", { zone })
    UpdateActiveRivalries()
    local data = string.format("%s received $%.0f for winning a Rivalry in %s", GetGangNameFromID(winningGangID), escrowAmount,
        zone)
    GangSystemLog(data)
end

-- This function checks if the rivalry has been ongoing for two days and ends it if so
function CheckRivalryDuration(zone)
    local currentTime = os.time()
    local rivalryStartTime = ActiveRivalryData[zone].started
    local rivalryDuration = currentTime - rivalryStartTime
    if rivalryDuration >= 2 * 24 * 60 * 60 then -- Two days in seconds
        -- End the rivalry and distribute escrow to the winning gang
        -- Add your logic here to determine the winning gang and distribute the escrow
        -- Then you can delete the timer and reset the rivalry data
        ResetRivalryData(zone)
    end
end

function IsZoneARivalry(zone)
    if ActiveRivalryData[zone] then
        return true
    end
    return false
end

function GetGangIDByTag(gangTag)
    for id, gangData in pairs(GangData) do
        if gangData.tag == gangTag then
            return id
        end
    end
    return nil
end

function GetGangAtZone(zone)
    local maxLoyalty = 0
    local controllingGangID = nil
    for _, data in pairs(GangZoneData) do
        if data.name == zone and data.loyalty > maxLoyalty then
            maxLoyalty = data.loyalty
            controllingGangID = data.controller
        end
    end
    local controllingGang = GetGangTagFromID(controllingGangID)
    return controllingGang
end

function GetGangAtZoneReturnID(zone)
    local maxLoyalty = 0
    local controllingGangID = nil
    for _, data in pairs(GangZoneData) do
        if data.name == zone and data.loyalty > maxLoyalty then
            maxLoyalty = data.loyalty
            controllingGangID = data.controller
        end
    end
    return controllingGangID
end

function StaffPenalizeTop3(gangID, penalty)
    local rows = SQLQuery(
        'SELECT id, name, loyalty FROM gang_zones WHERE gang_id = ? ORDER BY loyalty DESC LIMIT 3', { gangID })

    -- Check if there are no turfs
    if #rows == 0 then
        lib.print.error("No turfs found for the specified gang")
        return
    end

    for i = 1, 3 do
        if rows[i] then
            local newLoyalty = rows[i].loyalty - penalty
            if newLoyalty <= 0 then
                SQLQuery("DELETE FROM gang_zones WHERE id = ?", { rows[i].id })
            else
                SQLQuery("UPDATE gang_zones SET loyalty = ? WHERE id = ?", { newLoyalty, rows[i].id })
            end
        else
            lib.print.info("There are less than 3 turfs for the specified gang. Penalizing all available turfs.")
            break
        end
    end
    TriggerEvent('cb-gangsystem:server:increasePrevalence', GetGangTagFromID(gangID), "Staff Penalty")
end


function StaffPenalizeHomeTurf(gangID, gangHomeTurf, penalty)
    if gangHomeTurf == nil or gangHomeTurf == "None" or gangHomeTurf == "Taken" then
        return
    else
        local currentLoyalty = SQLQuery(
            'SELECT loyalty FROM gang_zones WHERE gang_id = ? AND name = ?', { gangID, gangHomeTurf })
        if currentLoyalty == nil or currentLoyalty[1] == nil then
            return -- Home turf not found or loyalty data missing
        end

        local newLoyalty = currentLoyalty[1].loyalty - penalty
        if newLoyalty <= 0 then
            SQLQuery("DELETE FROM gang_zones WHERE gang_id = ? AND name = ?", { gangID, gangHomeTurf })
        else
            SQLQuery("UPDATE gang_zones SET loyalty = ? WHERE gang_id = ? AND name = ?", { newLoyalty, gangID, gangHomeTurf })
        end
    end
    TriggerEvent('cb-gangsystem:server:increasePrevalence', GetGangTagFromID(gangID), "Staff Penalty")
end

function StaffIncreaseTurf(gangID, zone, increase)
    local result = SQLQuery("SELECT * FROM gang_zones WHERE gang_id = ? AND name = ?", { gangID, zone })
    if not result or not result[1] then
        -- If the row doesn't exist, add a new one
        SQLQuery("INSERT INTO gang_zones (gang_id, name, loyalty) VALUES (?, ?, ?)", { gangID, zone, increase })
    else
        -- If the row exists, update the loyalty
        SQLQuery("UPDATE gang_zones SET loyalty = loyalty + ? WHERE gang_id = ? AND name = ?", { increase, gangID, zone })
    end
end

function StaffDecreaseTurf(gangID, zone, penalty)
    -- Query the specific zone controlled by the gang
    local result = SQLQuery('SELECT loyalty FROM gang_zones WHERE gang_id = ? AND name = ?', { gangID, zone })
    
    -- If the zone is not found, return
    if not result or not result[1] then
        return
    end

    -- Calculate the new loyalty after applying the penalty
    local newLoyalty = result[1].loyalty - penalty
    if newLoyalty <= 0 then
        -- Remove the zone if loyalty drops to 0 or below
        local deleteQuery = "DELETE FROM gang_zones WHERE gang_id = ? AND name = ?"
        local deleteParams = { gangID, zone }
        SQLQuery(deleteQuery, deleteParams)
    else
        -- Update the zone's loyalty if it's still above 0
        local updateQuery = "UPDATE gang_zones SET loyalty = ? WHERE gang_id = ? AND name = ?"
        local updateParams = { newLoyalty, gangID, zone }
        SQLQuery(updateQuery, updateParams)
    end
    TriggerEvent('cb-gangsystem:server:increasePrevalence', GetGangTagFromID(gangID), "Staff Penalty")
end

function UpdateTop3ByGangID(gangID)
    -- Fetch the top 3 rows with the most 'loyalty' for the specified 'gangID'
    local rows = SQLQuery(
        'SELECT id, name, loyalty FROM gang_zones WHERE gang_id = ? ORDER BY loyalty DESC LIMIT 3', { gangID })
    -- Loop through the top 3 rows and update their 'loyalty' values
    for i = 1, #rows do
        SQLQuery("UPDATE gang_zones SET loyalty = ? WHERE id = ?", { rows[i].loyalty + Config.Loyalty.Increase.Mission, rows[i].id })
    end
    TriggerEvent('cb-gangsystem:server:increasePrevalence', GetGangTagFromID(gangID), "Mission")
    return rows
end

function UpdateLoyalty(gangID, zone, increase)
    if gangID == 0 then return end -- Do nothing if the player is not in a gang
    local result = SQLQuery("SELECT * FROM gang_zones WHERE gang_id = ? AND name = ?", { gangID, zone })
    if not result or not result[1] then
        -- If the row doesn't exist, add a new one
        SQLQuery("INSERT INTO gang_zones (gang_id, name, loyalty) VALUES (?, ?, ?)", { gangID, zone, increase })
    else
        -- If the row exists, update the loyalty
        SQLQuery("UPDATE gang_zones SET loyalty = loyalty + ? WHERE gang_id = ? AND name = ?", { increase, gangID, zone })
    end
end

function DecreaseLoyalty(gangID, zone, decrease)
    local result = SQLQuery("SELECT loyalty FROM gang_zones WHERE gang_id = ? AND name = ?", { gangID, zone })
    if result and result[1] then
        -- If the row exists, update the loyalty
        local currentLoyalty = result[1].loyalty
        local updatedLoyalty = math.max(currentLoyalty - decrease, 0) -- Ensure loyalty doesn't go negative
        if updatedLoyalty == 0 then
            -- Delete the row if loyalty is zero
            SQLQuery("DELETE FROM gang_zones WHERE gang_id = ? AND name = ?", { gangID, zone })
        else
            -- Update the loyalty if it's not zero
            SQLQuery("UPDATE gang_zones SET loyalty = ? WHERE gang_id = ? AND name = ?", { updatedLoyalty, gangID, zone })
        end
    end
end

function UpdateLoyaltyByGangIDAndChoice(gangID, zone)
    if Config.UpdateLoyalty == "top3" then
        -- Fetch the top 3 rows with the most 'loyalty' for the specified 'gangID'
        local rows = SQLQuery(
            'SELECT id, name, loyalty FROM gang_zones WHERE gang_id = ? ORDER BY loyalty DESC LIMIT 3', { gangID })
        -- Loop through the top 3 rows and update their 'loyalty' values
        for i = 1, #rows do
            SQLQuery("UPDATE gang_zones SET loyalty = ? WHERE id = ?", { rows[i].loyalty + Config.Loyalty.Increase.Mission, rows[i].id })
        end
        TriggerEvent('cb-gangsystem:server:increasePrevalence', GetGangTagFromID(gangID), "Mission")
        return rows
    elseif Config.UpdateLoyalty == "choose" then
        -- Check if the row exists for the specific 'zone' and 'gangID'
        local checkRow = SQLQuery(
            'SELECT id, name, loyalty FROM gang_zones WHERE gang_id = ? AND name = ?', { gangID, zone })
        if checkRow[1] then
            -- Update the loyalty of the specific 'zone' for the specified 'gangID'
            SQLQuery("UPDATE gang_zones SET loyalty = loyalty + ? WHERE gang_id = ? AND name = ?", { Config.Loyalty.Increase.Mission, gangID, zone })
            -- Fetch and return the updated row
            local updatedRow = SQLQuery(
                'SELECT id, name, loyalty FROM gang_zones WHERE gang_id = ? AND name = ?', { gangID, zone })
            return updatedRow
        else
            -- Add a new row with the specified 'zone' and 'gangID'
            SQLQuery("INSERT INTO gang_zones (gang_id, name, loyalty) VALUES (?, ?, ?)", { gangID, zone, Config.Loyalty.Increase.Mission })
            -- Fetch and return the newly added row
            local newRow = SQLQuery(
                'SELECT id, name, loyalty FROM gang_zones WHERE gang_id = ? AND name = ?', { gangID, zone })
            return newRow
        end
        TriggerEvent('cb-gangsystem:server:increasePrevalence', GetGangTagFromID(gangID), "Mission")
    end
end

function StaffGangTimeout(gangID, penalty)
    if penalty == 1 then
        TriggerEvent('cb-gangsystem:server:increasePrevalence', GetGangTagFromID(gangID), "Gang Timeout")
    end
    SQLQuery("UPDATE gangs SET penalty = ? WHERE id = ?", { penalty, gangID })
    GangData[gangID].penalty = penalty
end

function TransferGangOwnership(gangID, newLeaderCID)
    SQLQuery("UPDATE gangs SET leader_cid = ? WHERE id = ?", { newLeaderCID, gangID })
    GangData[gangID].leader_cid = newLeaderCID
end

function UpdateLastActive(gangID)
    local timestamp = os.date("%m-%d-%Y %H:%M")
    SQLQuery("UPDATE gangs SET last_active = ? WHERE id = ?", { timestamp, gangID })
    GangData[gangID].last_active = timestamp
end

function UpdateGangFundBalance(gangID, newBalance)
    SQLQuery("UPDATE gangs SET balance = ? WHERE id = ?", { newBalance, gangID })
    GangData[gangID].balance = newBalance
end

function ProtectGang(gangID)
    local balance = GangData[gangID].balance
    local cost = Config.ProtectionCost
    if balance >= cost then
        SQLQuery("UPDATE gangs SET protection = ? WHERE id = ?", { 1, gangID })
        GangData[gangID].protection = 1
        UpdateGangFundBalance(gangID, balance - cost)
        local data = string.format("%s was charged $%.0f for protection by Franklin", GetGangNameFromID(gangID), cost)
        GangSystemLog(data)
        return true
    else
        SQLQuery("UPDATE gangs SET protection = ? WHERE id = ?", { 0, gangID })
        GangData[gangID].protection = 0
        local data = string.format("%s tried to protect their gang but didn't have enough funds", GetGangNameFromID(gangID))
        GangSystemLog(data)
        return false
    end
end

function UnprotectGang(gangID)
    SQLQuery("UPDATE gangs SET protection = ? WHERE id = ?", { 0, gangID })
    GangData[gangID].protection = 0
end

function IsGangProtected(gangID)
    return GangData[gangID].protection == 1
end

function GetHomeTurf(gangID)
    return GangData[gangID].home_turf
end

function GetGangNameFromID(gangID)
    if GangData[gangID] then
        return GangData[gangID].name
    else
        return "none"
    end
end

function GetGangTagFromID(gangID)
    if GangData[gangID] then
        return GangData[gangID].tag
    else
        return nil
    end
end

function IsGangTimeout(gangID)
    return GangData[gangID].penalty ~= 0
end

function IsWarTimeout(gangID)
    local warTimeout = GangData[gangID].warTimeout
    local time = os.time()
    if warTimeout == 0 then
        return false
    else
        if time > warTimeout then
            GangData[gangID].warTimeout = 0
            SQLQuery('UPDATE gangs SET warTimeout = ? WHERE id = ?', { 0, gangID })
            return false
        else
            return true
        end
    end
end

function GetLastGift(gangID)
    return GangData[gangID].last_gift
end

function GetLastBlueprint(gangID)
    return GangData[gangID].last_blueprint
end

function UpdateLastGift(gangID)
    local timestamp = os.time() -- current Unix timestamp
    SQLQuery('UPDATE gangs SET last_gift = ? WHERE id = ?', { timestamp, gangID })
    GangData[gangID].last_gift = timestamp
end

function LostWar(gangID)
    local timestamp = os.time() -- current Unix timestamp
    local warTimeoutInSeconds = 48 * 60 * 60 -- 48 hours in seconds
    GangData[gangID].warTimeout = warTimeoutInSeconds
    SQLQuery('UPDATE gangs SET warTimeout = ? WHERE id = ?', { warTimeoutInSeconds, gangID })
end

function UpdateLastBlueprint(gangID)
    local timestamp = os.time() -- current Unix timestamp
    SQLQuery('UPDATE gangs SET last_blueprint = ? WHERE id = ?', { timestamp, gangID })
    GangData[gangID].last_blueprint = timestamp
end

function UpdateLastBlackMarket(gangID)
    local timestamp = os.time() -- current Unix timestamp
    SQLQuery('UPDATE gangs SET last_bm_shop = ? WHERE id = ?', { timestamp, gangID })
    GangData[gangID].last_bm_shop = timestamp
    local gangName = GetGangNameFromID(gangID)
    local data = string.format("%s accessed the Black Market", gangName)
    GangSystemLog(data)
end

function GetLastHomeTurf(gangID)
    return GangData[gangID].last_home_turf
end

function UpdateLastHomeTurf(gangID)
    local timestamp = os.time()
    SQLQuery('UPDATE gangs SET last_home_turf = ? WHERE id = ?', { timestamp, gangID })
    GangData[gangID].last_home_turf = timestamp
end

function GetDeclaredHomeTurf(home_turf)
    for _, gangData in pairs(GangData) do
        if gangData.home_turf == home_turf then
            return gangData.name
        end
    end
    return nil -- Return nil if no matching home_turf is found
end

function GetDeclaredHomeTurfReturnID(home_turf)
    for _, gangData in pairs(GangData) do
        if gangData.home_turf == home_turf then
            return gangData.id
        end
    end
    return nil -- Return nil if no matching home_turf is found
end

function GetHideoutCoords(gangID)
    local home_turf = GetHomeTurf(gangID)
    if home_turf == "None" then
        return "None"
    end
    for k, v in pairs(Config.GangZones) do
        if home_turf == v.zone then
            if v.community then
                home_turf = "Community"
            end
        end
    end
    if home_turf == "Community" then
        return "Community"
    else
        for k, v in pairs(Config.GangHideouts) do
            if home_turf == v.zone then
                return v.outsideCoords
            end
        end
    end
end

function GetTurfControllers()
    local turfControllers = {}
    for zoneID, zoneData in pairs(Config.GangZones) do
        local gangController = GetGangAtZone(zoneData.zone)
        local gangID = GetGangIDByTag(gangController)
        turfControllers[zoneData.zone] = gangID
    end
    return turfControllers
end

function GetGangTurfCount(gangId)
    local count = 0
    for _, zoneData in pairs(GangZoneData) do
        local turfControllers = GetTurfControllers()
        if Config.CountOnlyControlled then
            if turfControllers[zoneData.name] == gangId then
                print(zoneData.name)
                count = count + 1
            end
        else
            if zoneData.controller == gangId then
                count = count + 1
            end
        end
    end
    return count
end
-- Helper function to remove a player from a faction
local function remove_player(faction, player_id)
    for i = #faction, 1, -1 do
        if faction[i] == player_id then
            table.remove(faction, i)
            return true  -- Player was found and removed
        end
    end
    return false  -- Player was not found
end

-- Helper function to get the smallest faction size
local function get_smallest_faction_size(gangID)
    local gangAtWarWith = GangData[gangID].war
    local min_size = math.huge  -- Initialize to a very large number

    -- Check if there are any factions at all
    if next(factions) == nil then
        return 0  -- Return 0 if there are no factions
    end

    for factionID, players in pairs(factions) do
        -- Check if this faction is at war with the gang or is the gang itself
        if factionID == gangAtWarWith or factionID == gangID then
            if #players < min_size then
                min_size = #players  -- Update min_size if the current faction is smaller
            end
        end
    end

    return min_size == math.huge and 0 or min_size  -- If no factions were checked, return 0
end

-- Function to check a player into their faction
function WarCheckIn(player_id, gangID)
    -- Ensure faction table exists for this faction
    if not factions[gangID] then
        factions[gangID] = {}
    end

     -- Check if the player is already checked in to any faction
     for _, players in pairs(factions) do
        for _, player in ipairs(players) do
            if player == player_id then
                return "Already Checked In"  -- Player is already checked in
            end
        end
    end

    -- Get smallest faction size to maintain the +1 rule
    local smallest_faction_size = get_smallest_faction_size(gangID)

    -- Check if the current faction has more than +1 member than the smallest faction
    if #factions[gangID] <= smallest_faction_size then
        table.insert(factions[gangID], player_id)
        return "Allowed"
    else
        return "Not Allowed"
    end
end

-- Function to check a player out and boot the last checked-in player from another faction if necessary
-- Function to check a player out and boot the last checked-in player from another faction if necessary
function WarCheckOut(player_id, gangID)
    if not factions[gangID] then
        return false
    end

    -- Attempt to remove the player
    local playerRemoved = remove_player(factions[gangID], player_id)

    if playerRemoved then
        local gangAtWarWith = GangData[gangID].war

        -- Check the current faction size after the removal
        local currentFactionSize = #factions[gangID]

        -- Check if the current faction size is now 0 (i.e., the last player was removed)
        if currentFactionSize == 0 then
            factions[gangID] = nil  -- Remove the entire faction
        end

        -- Get the smallest faction size
        local smallestFactionSize = get_smallest_faction_size(gangID)

        -- Check if the opposing faction exists
        local opposingFactionSize = factions[gangAtWarWith] and #factions[gangAtWarWith] or 0

        -- Check if the opposing faction has more than 2 players than the current faction
        if opposingFactionSize >= smallestFactionSize + 2 then
            local last_player = table.remove(factions[gangAtWarWith])
        end
        return true
    else
        return false
    end
end

-- Function to stop the war for a given gang and otherGang
local function EndWar(gangID, otherGangID)
    -- Update gangs table to reset war-related data
    SQLQuery("UPDATE gangs SET war = 0 WHERE id = ?", {gangID})
    SQLQuery("UPDATE gangs SET war = 0 WHERE id = ?", {otherGangID})

    -- Update local GangData to reflect war ending
    GangData[gangID].war = 0
    GangData[otherGangID].war = 0

    -- Log the automatic war stop
    local data = string.format("The war between %s and %s has automatically ended due to time expiry!", GangData[gangID].name, GangData[otherGangID].name)
    GangSystemLog(data)
end

-- ███████╗██╗  ██╗██████╗  ██████╗ ██████╗ ████████╗███████╗
-- ██╔════╝╚██╗██╔╝██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔════╝
-- █████╗   ╚███╔╝ ██████╔╝██║   ██║██████╔╝   ██║   ███████╗
-- ██╔══╝   ██╔██╗ ██╔═══╝ ██║   ██║██╔══██╗   ██║   ╚════██║
-- ███████╗██╔╝ ██╗██║     ╚██████╔╝██║  ██║   ██║   ███████║
-- ╚══════╝╚═╝  ╚═╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝
exports('GetPlayerGangData', function(playerid)
    if playerid then
        local Player = GetPlayer(playerid)
        if Player then
            local gangTag = Player.PlayerData.gang.name
            local gangID = GetGangIDByTag(gangTag)
            if gangID ~= 0 then
                return GangData[gangID]
            else
                return "None"
            end
        else
            return "Invalid Player ID"
        end
    else
        return "No Player ID"
    end
end)

exports('IsPlayerCheckedIn', function(player_id)
    for factionID, players in pairs(factions) do
        for _, player in ipairs(players) do
            if player == player_id then
                return true  -- Player is checked in
            end
        end
    end
    return false  -- Player is not checked in
end)

exports('GetGangPrevalence', function(player_id)
    local Player = GetPlayer(player_id)
    local gangTag = Player.PlayerData.gang.name
    if gangTag == "None" or gangTag == "none" then
        return nil
    end
    local gangID = GetGangIDByTag(gangTag)
    local prevalence = GangData[gangID].prevalence
    return prevalence
end)

exports('IsGangAtWar', function(gangID)
    return (GangData[gangID].war ~= 0)
end)

exports('CustomPrevalenceIncrease', function(gangID, amount)
    local prevalence = GangData[gangID].prevalence
    local newPrev = prevalence + amount
    if newPrev > Config.Prevalence.MaxPrevalence then
        newPrev = Config.Prevalence.MaxPrevalence
    elseif newPrev < Config.Prevalence.MinPrevalence then
        newPrev = Config.Prevalence.MinPrevalence
    end
    GangData[gangID].prevalence = newPrev
    SQLQuery("UPDATE gangs SET prevalence = ? WHERE id = ?", {newPrev, gangID})
    local data = "Gang Prevalence for " .. GangData[gangID].name .. " increased by " .. amount .. " - Staff Intervention"
    GangSystemLog(data)
end)

exports('CustomPrevalenceDecrease', function(gangID, amount)
    local prevalence = GangData[gangID].prevalence
    local newPrev = prevalence - amount
    if newPrev > Config.Prevalence.MaxPrevalence then
        newPrev = Config.Prevalence.MaxPrevalence
    elseif newPrev < Config.Prevalence.MinPrevalence then
        newPrev = Config.Prevalence.MinPrevalence
    end
    GangData[gangID].prevalence = newPrev
    SQLQuery("UPDATE gangs SET prevalence = ? WHERE id = ?", {newPrev, gangID})
    local data = "Gang Prevalence for " .. GangData[gangID].name .. " decreased by " .. amount .. " - Staff Intervention"
    GangSystemLog(data)
end)

exports('IsZoneARivalry', IsZoneARivalry)

--  ████████╗██╗  ██╗██████╗ ███████╗ █████╗ ██████╗ ███████╗
--  ╚══██╔══╝██║  ██║██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔════╝
--     ██║   ███████║██████╔╝█████╗  ███████║██║  ██║███████╗
--     ██║   ██╔══██║██╔══██╗██╔══╝  ██╔══██║██║  ██║╚════██║
--     ██║   ██║  ██║██║  ██║███████╗██║  ██║██████╔╝███████║
--     ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝
CreateThread(function()
    while true do
        for id, zone in pairs(GangZoneData) do
            if zone.loyalty > 0 then
                local decreasedLoyalty = math.floor(zone.loyalty * (1 - Config.TurfDecayPercentage)) -- Decrease by 5% and round down
                if decreasedLoyalty > 0 then
                    -- Update the database with the decreased loyalty
                    SQLQuery('UPDATE gang_zones SET loyalty = ? WHERE id = ?', { decreasedLoyalty, id })
                    -- Update the data in memory
                    GangZoneData[id].loyalty = decreasedLoyalty
                else
                    -- Delete the row from the database
                    SQLQuery('DELETE FROM gang_zones WHERE id = ?', { id })
                    -- Remove the data from memory
                    GangZoneData[id] = nil
                end
            end
        end
        local time = 3600000 * Config.TurfDecayHours
        Citizen.Wait(time)
    end
end)

CreateThread(function()
    while true do
        for _, v in pairs(GetPlayers()) do
            local Player = GetPlayer(v)
            if Player == nil then return end
            local playerGang = Player.PlayerData.gang.name
            if (playerGang == "none") then
                return
            end
            if (playerGang ~= "none") then
                local gangZone = exports['cb-gangsystem']:GetGangZonePlayerIsIn(Player.PlayerData.source)
                TriggerEvent("cb-gangsystem:server:increaseLoyalty", playerGang, gangZone, "Presence")
            end
        end
        local minute = 1000 * 60
        local time = 10 * minute
        Citizen.Wait(time)
    end
end)

CreateThread(function()
    while true do
        PrevalenceDecay()
        local minute = 1000 * 60
        local time = minute * Config.Prevalence.DecayTime
        Citizen.Wait(time)
    end
end)

CreateThread(function()
    while true do
        for k, v in pairs(GangData) do
            if IsGangProtected(v.id) then
                ProtectGang(v.id)
            end
        end
        local minute = 1000 * 60
        local time = minute * Config.ProtectionLoopTime
        Citizen.Wait(time)
    end
end)

-- Thread to check and stop wars where the endTime has passed
CreateThread(function()
    while true do
        -- Fetch wars that have passed the endTime and are still active
        local currentTime = os.time()
        local wars = SQLQuery("SELECT * FROM gang_wars WHERE endTime <= ? AND warStatus = 'active'", {currentTime})
        -- Process each war that needs to be stopped
        for _, war in ipairs(wars) do
            local gangID = war.gangID
            local otherGangID = war.declareeGangID
            if war.gangScore ~= war.declareeScore then -- This checks if the war is tied. If it is tied we wait a little bit longer.
                SQLQuery("UPDATE gang_wars SET warStatus = 'Complete' WHERE id = ?", {war.id})
    
                -- End the war and declare a winner
                EndWar(gangID, otherGangID)
            end
        end
        local minute = 1000 * 60
        local time = minute * 10
        Citizen.Wait(time)
    end
end)

Citizen.CreateThread(function()
    if UsingOxInventory and Config.UseBlackMarket then
        exports.ox_inventory:RegisterShop('GangSystemBlackMarket', {
            name = Config.OxBlackMarket.name,
            inventory = Config.OxBlackMarket.inventory,
            locations = Config.OxBlackMarket.locations,
        })
    end
end)

CreateThread(function()
    UpdateGangData()
    UpdateGangPermissions()
    UpdateGangZoneData()
    UpdateActiveRivalries()
    for k, v in pairs(Config.GangZones) do
        if IsZoneARivalry(v.zone) then
            CheckRivalryDuration(v.zone)
        end
    end
    if Framework == 'qb-core' then
        for gangID, gangData in pairs(GangData) do
            local tag = gangData.tag
            local name = gangData.name
            local gangGrades = {} -- Initialize the gang ranks table
            -- Parse ranks string into a table
            local ranks = gangData.ranks
            local ranksTable = Split(ranks, ',') -- Convert ranks to a table
            local totalRanks = #ranksTable       -- Get the total number of ranks
            for i, rankName in ipairs(ranksTable) do
                local rankData = { name = rankName }
                if i == totalRanks then
                    rankData = { name = rankName, isboss = true }
                end
                gangGrades[tostring(i - 1)] = rankData
            end
            local dynamicGrades = {} -- Initialize dynamic grades table
            -- Populate dynamic grades table
            for i, gradeData in pairs(gangGrades) do
                dynamicGrades[tostring(totalRanks - i)] = gradeData
            end
            -- Add the gang with its corresponding ranks
            AddGang(tag, name, dynamicGrades)
        end
    elseif Framework == 'qbox' then
        for gangID, gangData in pairs(GangData) do
            local tag = gangData.tag
            exports.qbx_core:UpsertGangData(tag, {label = gangData.name})
            local ranksTable = Split(gangData.ranks, ',') -- Convert ranks to a table
            local totalRanks = #ranksTable       -- Get the total number of ranks
            for i, rankName in ipairs(ranksTable) do
                if i == totalRanks then
                    exports.qbx_core:UpsertGangGrade(tag, tonumber(i - 1), {name = rankName, isboss = true})
                else
                    exports.qbx_core:UpsertGangGrade(tag, tonumber(i - 1), {name = rankName})
                end
            end
        end
    end
end)