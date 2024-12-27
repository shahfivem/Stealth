local skillMapping = {
    ChinUps = 'arms',
    BenchPress = 'core',
    Squats = 'legs',
    Deadlifts = 'back'
}

lib.callback.register('echo_gym:callback:getSkills', function(source)
    local playerIdentifier = ('player_%s_skills'):format(source) -- Unique key for each player
    local playerSkillsJson = GetResourceKvpString(playerIdentifier) -- Retrieve KVP as JSON string

    -- Default skill values
    local defaultSkills = {
        arms = 50,
        core = 50,
        legs = 50,
        back = 50
    }

    -- Parse existing skills from KVP or return defaults
    if playerSkillsJson then
        local playerSkills = json.decode(playerSkillsJson)
        return playerSkills
    else
        return defaultSkills
    end
end)

RegisterNetEvent('echo_gym:server:exerciseTick', function(exerciseName)
    local source = source
    local playerIdentifier = ('player_%s_skills'):format(source)
    local playerSkillsJson = GetResourceKvpString(playerIdentifier)

    -- Default skill values
    local skills = playerSkillsJson and json.decode(playerSkillsJson) or {
        arms = 0,
        core = 0,
        legs = 0,
        back = 0
    }

    -- Map exerciseName to the correct skill
    local skillType = skillMapping[exerciseName]

    -- Increment the specific skill type
    if skillType and skills[skillType] then
        -- Slower increment logic: Based on current skill value
        local increment = math.random(1, 5) / 10 -- Small increment (0.1 to 0.5)
        local currentSkill = skills[skillType]

        -- Add diminishing returns: Higher skill = slower progress
        if currentSkill < 50 then
            increment = increment + math.random(5, 10) / 10 -- Faster below 50 (0.5 to 1.0)
        elseif currentSkill < 75 then
            increment = increment + math.random(2, 5) / 10 -- Slower between 50-75 (0.2 to 0.5)
        end

        skills[skillType] = skills[skillType] + increment
        if skills[skillType] > 100 then skills[skillType] = 100 end -- Cap at 100

        if skills[skillType] then
            -- Skill increased successfully
            print(('[DEBUG] Skill %s increased to %.1f'):format(skillType, skills[skillType]))
        
            -- Trigger a success notification using the new event
            TriggerClientEvent('echo_gym:client:notify', source, {
                title = 'Skill Increased',
                description = ('Skill %s increased to %.1f'):format(skillType, skills[skillType]),
                type = 'success',  -- Success notification
                duration = 3000,    -- Duration in milliseconds
            })
        else
            -- Invalid skill or exercise name
            print(('[ERROR] Invalid exerciseName: %s'):format(exerciseName))
        
            -- Trigger an error notification using the new event
            TriggerClientEvent('echo_gym:client:notify', source, {
                title = 'Error',
                description = ('Invalid exercise name: %s'):format(exerciseName),
                type = 'error',     -- Error notification
                duration = 3000,    -- Duration in milliseconds
            })
        end
    end        
    -- Save the updated skills back into KVP
    SetResourceKvp(playerIdentifier, json.encode(skills))
end)




