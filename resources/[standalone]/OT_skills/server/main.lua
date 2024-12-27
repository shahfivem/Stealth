local oxmysql = exports.oxmysql
local microtime = os.microtime
local loadedskills = Config.skills
local skillData = {}
local dbcolumns = {}
local ready = false

local function registerSkill(data)
    local resource = GetInvokingResource()
    if Config.skills[data.name] ~= nil then debugPrint(string.format('%s Tried to register skill: %s but already exists', resource, data.name)) return end
    CreateThread(function()
        local counter = 0
        while not ready do
            counter += 1
            if counter >= 6000 then return debugPrint(string.format('%s Failed to register skill: %s', resource, data.name)) end
            Wait(10)
        end
        if dbcolumns[data.name] == nil then
            debugPrint(string.format('creating new column in DB for skill: %s', data.name))
            oxmysql:executeSync('ALTER TABLE `ot_skills` ADD COLUMN ' .. data.name .. ' LONGTEXT DEFAULT @data', {['@data'] = json.encode({statlevel = 0, level = 1, xp = 0})})
            for k, v in pairs(skillData) do
                skillData[k][data.name] = {}
                skillData[k][data.name] = {statlevel = 0, level = 1, xp = 0}
            end
            dbcolumns[data.name] = json.encode({statlevel = 0, level = 1, xp = 0})
        end
        Config.skills[data.name] = {}
        Config.skills[data.name].multiplier = data.multiplier or 1.5
        Config.skills[data.name].maxlevel = data.maxlevel or 30
        Config.skills[data.name].maxReward = data.maxReward or 50
        Config.skills[data.name].maxDeduction = data.maxDeduction or 50
        Config.skills[data.name].label = data?.label
        Config.skills[data.name].description = data?.description
        Config.skills[data.name].event = data?.event
        TriggerClientEvent('OT_skills:registerSkill', -1, Config.skills)
        debugPrint(string.format('%s Registered %s skill successfully', resource, data.name))
    end)
end
exports('registerSkill', registerSkill)

local function saveSkills()
    if skillData == nil or table.type(skillData) == 'empty' then return end
    debugPrint('Starting to save skills')
    local start = microtime()
    for identifier, skills in pairs(skillData) do
        local querybuilder = {}
        local options = {}
        for k, v in pairs(Config.skills) do
            if skills[k] ~= nil then
                options[#options + 1] = json.encode({statlevel = tonumber(skills[k].statlevel), level = tonumber(skills[k].level), xp = tonumber(skills[k].xp)})
                querybuilder[#querybuilder + 1] = ('%s = ?'):format(k)
            end
        end
        options[#options + 1] = tostring(identifier)
        local query = table.concat(querybuilder, ', ')
        oxmysql:executeSync('UPDATE `ot_skills` SET ' .. query .. ' WHERE identifier = ?', options)
    end
    debugPrint(string.format('Finished Saving skills, took: %.2fms', (microtime() - start) / 1000))
end

local function createUser(identifier)
    local columns = {}
    local values = {}
    local options = {}
    skillData[identifier] = {}
    for k, v in pairs(Config.skills) do
        local i = #options + 1
        options[i] = json.encode({statlevel = 0, level = 1, xp = 0})
        skillData[identifier][k] = json.decode(options[i])
        columns[#columns + 1] = ('%s'):format(k)
        values[#values + 1] = '?'
    end
    options[#options + 1] = identifier
    columns[#columns + 1] = 'identifier'
    values[#values + 1] = '?'
    columns = table.concat(columns, ', ')
    values = table.concat(values, ', ')
    oxmysql:insert_async('INSERT INTO `ot_skills` (' .. columns .. ') VALUES ('.. values .. ');', options)
end

local function getSkill(src, skill)
    if not Config.skills[skill] then debugPrint(string.format('invalid skill: %s', skill)) return end
    local identifier = GetPlayerIdentifier(src)
    return skillData[identifier][skill]
end
exports('getSkill', getSkill)

local function addXP(src, skill, amount)
    if not Config.skills[skill] then debugPrint(string.format('invalid skill: %s', skill)) return end
    if amount > Config.skills[skill].maxReward then print(src .. ' possible cheater, tried to add more xp than maxReward set in config.') return end
    local identifier = GetPlayerIdentifier(src)
    local result = skillData[identifier][skill]
    if result ~= nil and table.type(result) ~= 'empty' then
        local maxlevel = tonumber(Config.skills[skill].maxlevel)
        local newxp = tonumber(result.xp) + amount
        local nextrankValue = tonumber(result.level * 100 * Config.skills[skill].multiplier)
        if newxp >= nextrankValue and tonumber(result.level) < maxlevel then
            skillData[identifier][skill].level = tonumber(skillData[identifier][skill].level + 1)
            skillData[identifier][skill].xp = tonumber(newxp - nextrankValue)
            if Config.skills[skill].gtaSkill then
                skillData[identifier][skill].statlevel = skillData[identifier][skill].statlevel + (100 / maxlevel)
            end
            if Config.skills[skill].event then
                local eventtype = type(Config.skills[skill].event)
                if eventtype == 'string' then
                    TriggerClientEvent(Config.skills[skill].event, src)
                else
                    debugPrint(string.format('invalid level up event type for skill: %s cannot use type: %s (must be string)', skill, eventtype))
                end
            end
            TriggerClientEvent('OT_skills:notification', src, {type = 'success', description = string.format(Config.leveluptext, skill)})
        else
            if tonumber(result.level) < maxlevel then
                skillData[identifier][skill].xp = tonumber(newxp)
            end
        end
    end
    TriggerClientEvent('OT_skills:sendPlayerSkills', src, skillData[identifier])
end
exports('addXP', addXP)


-- https://www.highleaks.com on top!
-- https://www.highleaks.com on top!
-- https://www.highleaks.com on top!
-- https://www.highleaks.com on top!
-- https://www.highleaks.com on top!
-- https://www.highleaks.com on top!
-- https://www.highleaks.com on top!
-- https://www.highleaks.com on top!
-- https://www.highleaks.com on top!
-- https://www.highleaks.com on top!
-- https://www.highleaks.com on top!
-- https://www.highleaks.com on top!


local function removeXP(src, skill, amount)
    if not Config.skills[skill] then debugPrint(string.format('invalid skill: %s', skill)) return end
    if amount > Config.skills[skill].maxDeduction then print(src .. ' possible cheater, tried to add more xp than maxReward set in config.') return end
    local identifier = GetPlayerIdentifier(src)
    local result = skillData[identifier][skill]
    if result ~= nil and table.type(result) ~= 'empty' then
        local maxlevel = tonumber(Config.skills[skill].maxlevel)
        local newxp = tonumber(result.xp) - amount
        if newxp <= 0 and tonumber(result.level) > 1 then
            skillData[identifier][skill].level = tonumber(skillData[identifier][skill].level - 1)
            skillData[identifier][skill].xp = tonumber(skillData[identifier][skill].level * 100 * Config.skills[skill].multiplier)
            if Config.skills[skill].gtaSkill then
                skillData[identifier][skill].statlevel = skillData[identifier][skill].statlevel - (100 / maxlevel)
            end
            if skill == 'diving' then
                TriggerClientEvent('OT_skills:divinglevelup', src)
            end
            TriggerClientEvent('OT_skills:notification', src, {type = 'success', description = string.format(Config.leveldowntext, skill)})
        else
            if tonumber(result.level) < maxlevel then
                skillData[identifier][skill].xp = tonumber(skillData[identifier][skill].xp - amount)
            end
        end
    end
    TriggerClientEvent('OT_skills:sendPlayerSkills', src, skillData[identifier])
end
exports('removeXP', removeXP)

RegisterNetEvent('OT_skills:addXP', function(skill, amount)
    local src = source
    addXP(src, skill, amount)
end)

RegisterNetEvent('OT_skills:removeXP', function(skill, amount)
    local src = source
    removeXP(src, skill, amount)
end)

RegisterNetEvent('OT_skills:saveSkills', function()
    local src = source
    if src >= 1 then DropPlayer(src, 'triggered server only event.') return end
    saveSkills()
end)

RegisterCommand("saveskillsdb", function(source, args, rawCommand)
    if not ready then return end
    saveSkills()
end, true)

lib.callback.register('OT_skills:login', function(source)
    local identifier = GetPlayerIdentifier(source)
    local result = oxmysql:single_async('SELECT * FROM `ot_skills` WHERE identifier = @identifier', {['@identifier'] = identifier})
    if result == nil or table.type(result) == 'empty' then
        createUser(identifier)
    else
        skillData[identifier] = {}
        for x, y in pairs(Config.skills) do
            skillData[identifier][x] = json.decode(result[x])
        end
    end
    return skillData[identifier], Config.skills
end)

lib.callback.register('OT_skills:getSkills', function(source)
    local data = {}
    local identifier = GetPlayerIdentifier(source)
    local skills = skillData[identifier]
    if skills == nil or table.type(skills) == 'empty' then
        for k, v in pairs(Config.skills) do
            data[k] = {}
            data[k].statlevel = tonumber(0)
            data[k].xp = tonumber(0)
            data[k].level = tonumber(1)
        end
        return data
    else
        for k, v in pairs(Config.skills) do
            if skills[k] then
                skills[k].multiplier = v.multiplier
            else
                skills[k] = {}
                skills[k].multiplier = v.multiplier
            end
        end
        return skills
    end
end)

lib.callback.register('OT_skills:getSkill', function(source, skill)
    local data = {}
    local identifier = GetPlayerIdentifier(source)
    local skills = skillData[identifier][skill]
    if skills == nil or table.type(skills) == 'empty' then
        if Config.skills[skill] then
            data.statlevel = tonumber(0)
            data.xp = tonumber(0)
            data.level = tonumber(1)
        end
        return data
    else
        return skills
    end
end)

CreateThread(function()
    debugPrint('Checking skills database')
    local default = json.encode({statlevel = '0', level = '1', xp = '0'})
    local result = oxmysql:executeSync('SELECT COLUMN_NAME, COLUMN_DEFAULT FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @table AND TABLE_SCHEMA = DATABASE()', {['@table'] = 'ot_skills'})
    if result == nil or table.type(result) == 'empty' then debugPrint('^1Failed to verify skills database') return end
    for i = 1, #result do dbcolumns[result[i].COLUMN_NAME] = {result = result[i].COLUMN_DEFAULT} end
    for skill in pairs(loadedskills) do
        if dbcolumns[skill] == nil then
            debugPrint(string.format('^3Creating new column in DB for skill: ^0%s', skill))
            oxmysql:executeSync(string.format('ALTER TABLE `ot_skills` ADD COLUMN %s LONGTEXT DEFAULT @data', skill), {['@data'] = default})
            dbcolumns[skill] = default
        else
            if dbcolumns[skill].result == nil or dbcolumns[skill].result == 'NULL' then
                debugPrint(string.format('^3Updating column in DB for skill: ^0%s ^3to use correct default', skill))
                oxmysql:executeSync(string.format('ALTER TABLE ot_skills ALTER %s SET DEFAULT @data', skill), {['@data'] = default})
            end
        end
    end
    ready = true
    debugPrint('Skills database verified')
end)

CreateThread(function()
    local interval = Config.saveInterval == nil and 300000 or (60000 * Config.saveInterval)
    while true do
        Wait(interval)
        if ready then
            saveSkills()
        end
    end
end)