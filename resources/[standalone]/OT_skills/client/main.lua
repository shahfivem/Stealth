local IsPedSwimmingUnderWater = IsPedSwimmingUnderWater
local oxygen = 100
local skillData = {}
local resetvalue = nil
cooldowns = {}
ped = cache.ped
vehicle = cache.vehicle
seat = cache.seat


lib.onCache('ped', function(value)
    ped = value
end)

lib.onCache('vehicle', function(value)
    vehicle = value
end)

lib.onCache('seat', function(value)
    seat = value
    if Config.useDrivingSkillEffects then
        if seat == -1 then
            for i = 1, 6 do
                SetTyreTractionLossMultiplier(vehicle, i - 1, 1.0 - (skillData['driving'].level / 100))
            end
            resetvalue = vehicle
        else
            if resetvalue ~= nil then
                for i = 1, 6 do
                    SetTyreTractionLossMultiplier(resetvalue, i - 1, 1.0)
                end
                resetvalue = nil
            end
        end
    end
end)


local function SendReactMessage(action, data)
  SendNUIMessage({
    action = action,
    data = data
  })
end

local function toggleNuiFrame(shouldShow)
  SetNuiFocus(shouldShow, shouldShow)
  SendReactMessage('setVisible', shouldShow)
end

local function updateUi()
    local data = {skills = {}}
    for k, v in pairs(skillData) do
      local nextxp = tonumber(v.level * 100 * Config.skills[k].multiplier)
      local percent = (v.xp / nextxp) * 100
      data.skills[#data.skills + 1] = {label = Config.skills[k].label, xp = math.round(v.xp, 1), level = v.level, percent = percent, description = Config.skills[k].description}
    end
    table.sort(data.skills, function(a, b) return a.label < b.label end)
    SendReactMessage('setData', data)
end

function openMenu()
    updateUi()
    toggleNuiFrame(true)
end
RegisterNetEvent('OT_skills:openmenu', openMenu)
exports('openMenu', openMenu)

local function getSkill(skill)
    if not Config.skills[skill] then return end
    return skillData[skill]
end
exports('getSkill', getSkill)

local function getMaxOxygen()
    return oxygen
end
exports('getMaxOxygen', getMaxOxygen)


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


local function handleDiving(hasTank)
    local mult = skillData['diving'].level * 1.5
    if hasTank then
        oxygen = tonumber(string.format("%.1f", (mult + 60)))
    elseif not hasTank then
        oxygen = tonumber(string.format("%.1f", (mult + 10)))
    end
    SetEnableScuba(ped, hasTank)
    SetPedMaxTimeUnderwater(ped, oxygen)
    SetPlayerUnderwaterTimeRemaining(cache.playerId, oxygen)
end
exports('handleDiving', handleDiving)

local function setupDiving()
    local mult = skillData['diving'].level * 1.5
    oxygen = tonumber(string.format("%.1f", (mult + 10)))
    SetEnableScuba(ped, false)
    SetPedMaxTimeUnderwater(ped, oxygen)
    SetPlayerUnderwaterTimeRemaining(cache.playerId, oxygen)
end
exports('setupDiving', setupDiving)

local function updateStats(init)
    if Config.useStrengthSkillEffects and skillData['strength'] ~= nil then
        setNativeSkill(`MP0_STRENGTH`, skillData['strength'].statlevel)
        local strengthModifier = tonumber(string.format("%.2f", ((Config.maxStrengthMult / Config.skills['strength'].maxlevel) * skillData['strength'].level)))
        SetWeaponDamageModifier(`weapon_unarmed`, strengthModifier)
    end
    if Config.useStaminaSkillEffects and skillData['stamina'] ~= nil then
        setNativeSkill(`MP0_STAMINA`, skillData['stamina'].statlevel)
    end
    if (Config.useDivingSkillEffects and skillData['diving'] ~= nil) and init then
        setupDiving()
    end
    if Config.useShootingSkillEffects and skillData['shooting'] ~= nil then
        setNativeSkill(`MP0_SHOOTING_ABILITY`, skillData['shooting'].statlevel)
    end
    if Config.useDrivingSkillEffects and skillData['driving'] ~= nil then
        setNativeSkill(`MP0_WHEELIE_ABILITY`, skillData['driving'].statlevel)
    end
    updateUi()
end

function loadPlayer()
    skillData = {}
    cooldowns = {}
    local skills, config = lib.callback.await('OT_skills:login', false)
    if skills == nil or table.type(skills) == 'empty' then notify({type = 'inform', description = 'Error occured fetching skill data.'}) return end
    skillData = skills
    if config == nil or table.type(config) == 'empty' then notify({type = 'inform', description = 'Error occured registering skill data.'}) return end
    Config.skills = config
    if Config.useStaminaSkillEffects then StatSetInt(`MP0_STAMINA`, 0, true) end
    updateStats(true)
end
exports('loadPlayer', loadPlayer)

RegisterNetEvent('OT_skills:registerSkill', function(config)
    if config == nil or table.type(config) == 'empty' then notify({type = 'inform', description = 'Error occured registering skill data.'}) return end
    Config.skills = config
end)

RegisterNetEvent('OT_skills:sendPlayerSkills', function(skills)
    if skills == nil or table.type(skills) == 'empty' then notify({type = 'inform', description = 'Error occured fetching skill data.'}) return end
    skillData = skills
    updateStats()
end)

RegisterNetEvent('OT_skills:divinglevelup', function()
    while IsPedSwimmingUnderWater(ped) or LocalPlayer.state.invBusy do
        Wait(10)
    end
    handleDiving(LocalPlayer.state.scubagear)
end)

RegisterNUICallback('hideFrame', function(_, cb)
  toggleNuiFrame(false)
  cb({})
end)