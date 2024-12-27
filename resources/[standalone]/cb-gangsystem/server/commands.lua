-- ██████╗ ██████╗ ███╗   ███╗███╗   ███╗ █████╗ ███╗   ██╗██████╗ ███████╗
--██╔════╝██╔═══██╗████╗ ████║████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝
--██║     ██║   ██║██╔████╔██║██╔████╔██║███████║██╔██╗ ██║██║  ██║███████╗
--██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║╚════██║
--╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝███████║
-- ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝
Citizen.CreateThread(function()
    ---------------------------------------------------------------------------------
    -- In-Character Commands --
    ---------------------------------------------------------------------------------
    lib.addCommand("gang", {
        help = Translations.commands.help.gangInfo,
    }, function(source)
        local srcPlayer = GetPlayer(source)
        if srcPlayer == nil then return end
        local srcGangName = srcPlayer.PlayerData.gang.name
        if srcGangName == "none" or srcGangName == "None" then
            TriggerClientEvent('cb-gangsystem:client:Notify', source, "No Gang", "You are not in a gang!", "error")
            return end
        local gangID = GetGangIDByTag(srcGangName)
        local count = GetOnlineMemberCount(gangID)
        local prevalenceLevel = exports['cb-gangsystem']:GetPrevalenceLevel(GangData[gangID].prevalence)
        local prevalenceStarsMap = {
            [1] = "⭐",
            [2] = "⭐⭐",
            [3] = "⭐⭐⭐",
            [4] = "⭐⭐⭐⭐",
            [5] = "⭐⭐⭐⭐⭐"
        }
        local prevalenceStars = prevalenceStarsMap[prevalenceLevel] or ""
        TriggerClientEvent('cb-gangsystem:client:OpenUI', source, GangData, count, prevalenceStars)
    end)

    lib.addCommand(Config.StaffGangCommand, {
        help = "Staff Gang Management",
        restricted = 'group.admin'
    }, function(source)
        TriggerClientEvent('cb-gangsystem:client:GangStaffMenu', source, GangData)
    end)

    ---------------------------------------------------------------------------------
    -- Console Commands AND In-Character Commands --
    ---------------------------------------------------------------------------------
    lib.addCommand('creategang', {
        help = Translations.commands.help.createGang,
        params = {
            {
                name = 'leader',
                type = 'playerId',
                help = Translations.commands.help.playerID,
            },
            {
                name = 'tag',
                type = 'string',
                help = Translations.commands.help.gangTag,
            },
            {
                name = 'name',
                type = 'string',
                help = Translations.commands.help.gangName,
            },
        },
        restricted = 'group.admin'
    }, function(source, args)
        local leader = GetPlayer(args.leader)
        if leader == nil then return end
        local leader_cid = leader.PlayerData.citizenid
        TriggerEvent('cb-gangsystem:server:StaffAddNewGang', args.leader, leader_cid, args.name, args.tag)
    end)

    lib.addCommand("refreshGangData", {
        help = Translations.commands.help.refreshGangData,
        restricted = 'group.admin'
    }, function(source)
        UpdateGangData()
        lib.print.info("Gang Data Refreshed")
    end)

    lib.addCommand("printGangs", {
        help = "Print the Gang Data",
        restricted = 'group.admin'
    }, function(source)
        local gangs = exports.qbx_core:GetGangs()
        lib.print.info(gangs)
    end)

    lib.addCommand("printGangData", {
        help = "Print the Gang Data",
        restricted = 'group.admin'
    }, function(source)
        -- Function to format and print a key-value pair in the table
        local function printRow(key, value)
            -- Convert the value to a string (handles tables by converting them to JSON strings)
            local valueStr = type(value) == "table" and json.encode(value) or tostring(value)
            
            -- Define the format for the two columns
            local row = string.format("| %-25s | %-50s |", key, valueStr)
            
            -- Print the row
            print(row)
        end
    
        -- Define the line separator
        local lineSeparator = string.rep("-", 80)
    
        -- Iterate over all gangs in GangData
        for k, v in pairs(GangData) do
            -- Print the gang identifier as a header for each gang's data
            print(lineSeparator)
            print(string.format("| %-25s | %-50s |", "Gang Name", v.name))
            print(lineSeparator)
            
            -- Print each key-value pair for the gang
            for key, value in pairs(v) do
                printRow(key, value)
            end
            
            -- Print a line separator after each gang's data
            print(lineSeparator)
        end
    end)

    lib.addCommand("resetgang", {
        help = "Fix your Gang Roles",
        params = {
            {
                name = 'target',
                type = 'playerId',
                help = Translations.commands.help.targetPlayerID,
            },
        },
        restricted = 'group.admin'
    }, function(source, args)
        local Player = GetPlayer(args.target)
        if Player == nil then return end
        local gangTag = Player.PlayerData.gang.name
        local gangID = GetGangIDByTag(gangTag)
        TriggerEvent('cb-gangsystem:server:ResetPlayerGangData', args.target, gangID, Player)
    end)

    lib.addCommand("tpfranklin", {
        help = "Teleport to Franklin",
        params = {
            {
                name = 'target',
                type = 'playerId',
                help = Translations.commands.help.targetPlayerID,
            },
        },
        restricted = 'group.admin'
    }, function(source, args)
        TriggerClientEvent('ant-teleport:client:Teleport', args.target, Config.GangLeader.coords)
    end)

    lib.addCommand('setgang', {
        help = 'Set the Gang of a Player',
        params = {
            {
                name = 'target',
                type = 'playerId',
                help = Translations.commands.help.targetPlayerID,
            },
            {
                name = 'tag',
                type = 'string',
                help = Translations.commands.help.gangTag,
            },
            {
                name = 'rank',
                type = 'number',
                help = Translations.commands.help.gangRank,
            },
        },
        restricted = 'group.admin'
    }, function(source, args)
        local Player = GetPlayer(tonumber(args.target))
        local cid = Player.PlayerData.citizenid
        if Player then
            Player.Functions.SetGang(tostring(args.tag), tonumber(args.rank))
            local gangID = GetGangIDByTag(args.tag)
            local data = string.format("Command Successful - `/setgang %.0f %s %.0f`", tonumber(args.target), tostring(args.tag), tonumber(args.rank))
            GangSystemLog(data)
            TriggerEvent("cb-gangsystem:server:loadGangStorage")
            if args.rank == 6 then
                SQLQuery("UPDATE gangs SET leader_cid = ? WHERE id = ?", {cid, gangID})
                GangData[gangID].leader_cid = cid
            end
        else
            lib.print.error("Player is not online")
        end
    end)
end)
