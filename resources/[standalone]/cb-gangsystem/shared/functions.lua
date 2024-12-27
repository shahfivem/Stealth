-- ███████╗██╗   ██╗███╗   ██╗ ██████╗████████╗██╗ ██████╗ ███╗   ██╗███████╗
-- ██╔════╝██║   ██║████╗  ██║██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
-- █████╗  ██║   ██║██╔██╗ ██║██║        ██║   ██║██║   ██║██╔██╗ ██║███████╗
-- ██╔══╝  ██║   ██║██║╚██╗██║██║        ██║   ██║██║   ██║██║╚██╗██║╚════██║
-- ██║     ╚██████╔╝██║ ╚████║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║███████║
-- ╚═╝      ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
-- Function to check if a rank has a specific permission
function GetPermissionKey(permission)
    local permissionKeys = {
        add_money_perms = "add_money_perms",
        access_storage = "access_storage",
        manage_ranks = "manage_ranks",
        remove_money_perms = "remove_money_perms",
        declare_turf_perms = "declare_turf_perms",
        move_gang_storage = "move_gang_storage",
        change_color = "change_color",
        add_members = "add_members",
        rename_gang = "rename_gang",
        declare_war_outfit = "declare_war_outfit"
    }
    return permissionKeys[permission]
end

function HasPermission(gangID, rank, permission)
    local GangPermissions = lib.callback.await('cb-gangsystem:server:GetGangPermissions', false)
    local permissionKey = GetPermissionKey(permission)
    
    if GangPermissions[gangID] and permissionKey then
        local permissions = GangPermissions[gangID][permissionKey]
        
        if permissions then
            for _, existingRank in ipairs(permissions) do
                if tonumber(existingRank) == tonumber(rank) then
                    return true
                end
            end
        end
    end
    
    return false
end

function IsPoliceJob(job)
    for k, v in pairs(Config.PoliceJobs) do
        if job == v then
            return true
        end
    end
    return false
end

function GetGangID(GangData, gangName)
    for id, gangData in pairs(GangData) do
        if gangData.tag == gangName then
            return id
        end
    end
    return nil
end

function DrawPolyZonesForZones(turfControllers, GangData)
    PlayerData = GetPlayerData()
    if PlayerData == nil then return end
    if PlayerData.gang == nil then return end
    local gangTag = PlayerData.gang.name
    local gangID = GetGangID(GangData, gangTag)
    if gangID == nil and Config.ShowZonesOnlyGang then return end
    for _, blip in ipairs(ZoneBlips) do
        RemoveBlip(blip)
    end
    ZoneBlips = {} -- Clear the blips table
    for zoneIndex, zoneData in pairs(Config.GangZones) do
        local controllingGang = Config.EmptyTurfGangColor
        if turfControllers[zoneData.zone] ~= nil then
            controllingGang = GangData[turfControllers[zoneData.zone]].color
        end
        if controllingGang == 0 then
            controllingGang = Config.EmptyTurfGangColor
        end
        for _, partData in ipairs(zoneData.parts) do
            local x1, y1, z1 = partData.x1, partData.y1, zoneData.coords.z
            local x2, y2, z2 = partData.x2, partData.y1, zoneData.coords.z
            local x3, y3, z3 = partData.x2, partData.y2, zoneData.coords.z
            local x4, y4, z4 = partData.x1, partData.y2, zoneData.coords.z

            -- Calculate the center of the zone for blip placement
            local centerX = (x1 + x2 + x3 + x4) / 4
            local centerY = (y1 + y2 + y3 + y4) / 4

            -- Calculate the width and height of the zone
            local width = math.abs(x2 - x1)
            local height = math.abs(y3 - y2)

            local blip = AddBlipForArea(centerX, centerY, z1, width, height)
            SetBlipDisplay(blip, 3)
            SetBlipRotation(blip, 0)
            SetBlipColour(blip, controllingGang)
            SetBlipAlpha(blip, 120)

            -- Store the blip handle
            table.insert(ZoneBlips, blip)
        end
    end
end

function FetchStaffPenaltyAmounts()
    return Config.StaffPenaltyAmounts[1] or {} -- Adjust if you have multiple configurations
end

function DeleteCreatedObjects()
    for _, object in ipairs(CreatedObjects) do
        DeleteObject(object)
    end
    CreatedObjects = {}
end

function IsDuplicateStorage(gangID)
    for _, storage in ipairs(CurrentGangStorages) do
        if storage.storage == gangID then
            return true
        end
    end
    return false
end

function Split(str, delimiter)
    local result = {}
    local from = 1
    local delim_from, delim_to = string.find(str, delimiter, from)
    while delim_from do
        table.insert(result, string.sub(str, from, delim_from - 1))
        from = delim_to + 1
        delim_from, delim_to = string.find(str, delimiter, from)
    end
    table.insert(result, string.sub(str, from))
    return result
end

-- ███████╗██╗  ██╗██████╗  ██████╗ ██████╗ ████████╗███████╗
-- ██╔════╝╚██╗██╔╝██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔════╝
-- █████╗   ╚███╔╝ ██████╔╝██║   ██║██████╔╝   ██║   ███████╗
-- ██╔══╝   ██╔██╗ ██╔═══╝ ██║   ██║██╔══██╗   ██║   ╚════██║
-- ███████╗██╔╝ ██╗██║     ╚██████╔╝██║  ██║   ██║   ███████║
-- ╚══════╝╚═╝  ╚═╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝
exports('GetTurfName', function(turf_tag)
    for k, v in pairs(Config.GangZones) do
        if v.zone == turf_tag then
            return v.label
        end
    end
    return nil
end)

exports('IsCommunityTurf', function(turf_tag)
    for k, v in pairs(Config.GangZones) do
        if v.zone == turf_tag then
            return v.community
        end
    end
    return nil
end)

exports('GetGangZonePlayer', function(coords)
    for _, gangZone in pairs(Config.GangZones) do
        for _, part in ipairs(gangZone.parts) do
            if (coords.x >= part.x1 and coords.x <= part.x2) and (coords.y >= part.y1 and coords.y <= part.y2) then
                return gangZone.zone
            end
        end
    end
    return nil
end)

exports('GetGangZonePlayerIsIn', function(source)
    local player = source
    local ped = GetPlayerPed(player)
    local playerCoords = GetEntityCoords(ped)
    for _, gangZone in pairs(Config.GangZones) do
        for _, part in ipairs(gangZone.parts) do
            if (playerCoords.x >= part.x1 and playerCoords.x <= part.x2) and (playerCoords.y >= part.y1 and playerCoords.y <= part.y2) then
                return gangZone.zone
            end
        end
    end
    return nil
end)

exports('GetGangZoneCoords', function(zone)
    for k, v in pairs(Config.GangZones) do
        if zone == v.zone then
            return v.coords
        end
    end
end)

exports('GetPrevalenceLevel', function(prevalence)
    local stars = Config.Prevalence.Stars
    local thresholds = {
        {stars.five, 5},
        {stars.four, 4},
        {stars.three, 3},
        {stars.two, 2},
        {stars.one, 1}
    }
    for _, threshold in ipairs(thresholds) do
        if prevalence >= threshold[1] then
            return threshold[2]
        end
    end
    return 1
end)

exports('AllowedByPrevalence', function(prevalence, action)
    local prevalenceLevel = exports['cb-gangsystem']:GetPrevalenceLevel(prevalence)
    if action == "Gifts" then
        if prevalenceLevel >= Config.Prevalence.PrevalenceLockout.Gifts then
            return true
        else
            return false
        end
    elseif action == "Missions" then
        if prevalenceLevel >= Config.Prevalence.PrevalenceLockout.Missions then
            return true
        else
            return false
        end
    elseif action == "Presence" then
        if prevalenceLevel >= Config.Prevalence.PrevalenceLockout.Presence then
            return true
        else
            return false
        end
    elseif action == "Drugs" then
        if prevalenceLevel >= Config.Prevalence.PrevalenceLockout.Drugs then
            return true
        else
            return false
        end
    elseif action == "Heist1" then
        if prevalenceLevel >= Config.Prevalence.PrevalenceLockout.Heist1 then
            return true
        else
            return false
        end
    elseif action == "Heist2" then
        if prevalenceLevel >= Config.Prevalence.PrevalenceLockout.Heist2 then
            return true
        else
            return false
        end
    elseif action == "Heist3" then
        if prevalenceLevel >= Config.Prevalence.PrevalenceLockout.Heist3 then
            return true
        else
            return false
        end
    end
end)