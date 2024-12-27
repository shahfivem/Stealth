Config = {}

Config.Framework = 'QBCORE' -- OX | ESX | QBCORE
Config.saveInterval = 5 -- minutes between saves
Config.useStrengthSkillEffects = true
Config.maxStrengthMult = 1.2 -- i reccomend keeping this between 1.0 and 1.5
Config.useStaminaSkillEffects = true
Config.useDivingSkillEffects = false
Config.useDrivingSkillEffects = false
Config.useShootingSkillEffects = false
Config.leveluptext = 'You leveled up %s'
Config.leveldowntext = 'You downgraded %s'
Config.shootingpracModels = {
    [`gr_prop_gr_target_02b`] = true,
    [`gr_prop_gr_target_04a`] = true,
    [`gr_prop_gr_target_04b`] = true,
    [`gr_prop_gr_target_04c`] = true,
    [`gr_prop_gr_target_04d`] = true,
    [`gr_prop_gr_target_05a`] = true,
    [`gr_prop_gr_target_05b`] = true,
    [`gr_prop_gr_target_05c`] = true,
    [`gr_prop_gr_target_05d`] = true,
    [`gr_prop_gr_target_w_02a`] = true,
    [`gr_prop_gr_target_w_02b`] = true
}

Config.skills = {
    ['drugs'] = {
        multiplier = 2.5,
        maxlevel = 30,
        maxReward = 20, 
        maxDeduction = 20,
        label = 'Drugs',
        description = 'Plant, tend, harvest, cut, refine and package quality illegal substances.'
    },
    ['crafting'] = {
        multiplier = 2.5,
        maxlevel = 30,
        maxReward = 20, 
        maxDeduction = 20,
        label = 'Crafting',
        description = 'Highly skilled craftsmen are able to make fully functional and/or decorative items.'
    },
    ['chemistry'] = {
        multiplier = 2.5,
        maxlevel = 30,
        maxReward = 20, 
        maxDeduction = 20,
        label = 'Chemistry',
        description = 'Experienced chemists can concoct the finest ingredients for high quality chemical reactions.'
    },
    ['stamina'] = {
        multiplier = 2.0,
        maxlevel = 30,
        maxReward = 20, 
        maxDeduction = 20,
        gtaSkill = true,
        cooldown = 10000,
        label = 'Stamina',
        description = 'Raise your endurance to overcome any obstacle.'
    },
    ['strength'] = {
        multiplier = 2.0,
        maxlevel = 30,
        maxReward = 20, 
        maxDeduction = 20,
        gtaSkill = true,
        cooldown = 5000,
        label = 'Strength',
        description = 'Ensure you are in the best possible shape to overcome any opponent.'
    },
    ['driving'] = {
        multiplier = 1.5,
        maxlevel = 30,
        maxReward = 20, 
        maxDeduction = 20,
        gtaSkill = true,
        cooldown = 15000,
        label = 'Driving',
        description = 'Take full control of every vehicle on any terrain ahead.'
    },
    ['diving'] = {
        multiplier = 1.5,
        maxlevel = 30,
        maxReward = 50,
        maxDeduction = 50,
        cooldown = 10000,
        event = 'OT_skills:divinglevelup', -- client event to trigger when the player levels up
        label = 'Diving',
        description = 'Plunge head-first into the seas, explore the depths and expand your lung capacity.'
    },
    ['shooting'] = {
        multiplier = 1.5,
        maxlevel = 30,
        maxReward = 20, 
        maxDeduction = 20,
        gtaSkill = true,
        cooldown = 5000,
        label = 'Shooting',
        description = 'Showcase your marksmanship by discharging your firearm at various targets.'
    },
    ['gunsmithing'] = {
        multiplier = 2.5,
        maxlevel = 30,
        maxReward = 20,
        maxDeduction = 20,
        label = 'Gunsmithing',
        description = 'A master gunsmith can assemble and modify even the rarest of firearms.'
    },
    ['woodcutting'] = {
        multiplier = 2.5,
        maxlevel = 30,
        maxReward = 20, 
        maxDeduction = 20,
        label = 'Woodcuting',
        description = 'Lumberjacks can produce the highest quality timber.'
    },
    ['mixology'] = {
        multiplier = 2.5,
        maxlevel = 30,
        maxReward = 20, 
        maxDeduction = 20,
        label = 'Mixology',
        description = 'Mixologists have the ability to make and serve superior beverages.'
    },
    ['cooking'] = {
        multiplier = 2.5,
        maxlevel = 30,
        maxReward = 20, 
        maxDeduction = 20,
        label = 'Cooking',
        description = 'Express your culinary expertise in the kitchen; bake, grill, roast, steam or boil your ingredients to create the perfect dish.'
    }
}