if not lib then return end

local Items = require 'modules.items.shared' --[[@as table<string, OxClientItem>]]

local function sendDisplayMetadata(data)
    SendNUIMessage({
		action = 'displayMetadata',
		data = data
	})
end

--- use array of single key value pairs to dictate order
---@param metadata string | table<string, string> | table<string, string>[]
---@param value? string
local function displayMetadata(metadata, value)
	local data = {}

	if type(metadata) == 'string' then
        if not value then return end

        data = { { metadata = metadata, value = value } }
	elseif table.type(metadata) == 'array' then
		for i = 1, #metadata do
			for k, v in pairs(metadata[i]) do
				data[i] = {
					metadata = k,
					value = v,
				}
			end
		end
	else
		for k, v in pairs(metadata) do
			data[#data + 1] = {
				metadata = k,
				value = v,
			}
		end
	end

    if client.uiLoaded then
        return sendDisplayMetadata(data)
    end

    CreateThread(function()
        repeat Wait(100) until client.uiLoaded

        sendDisplayMetadata(data)
    end)
end

exports('displayMetadata', displayMetadata)

---@param _ table?
---@param name string?
---@return table?
local function getItem(_, name)
    if not name then return Items end

	if type(name) ~= 'string' then return end

    name = name:lower()

    if name:sub(0, 7) == 'weapon_' then
        name = name:upper()
    end

    return Items[name]
end

setmetatable(Items --[[@as table]], {
	__call = getItem
})

---@cast Items +fun(itemName: string): OxClientItem
---@cast Items +fun(): table<string, OxClientItem>

local function Item(name, cb)
	local item = Items[name]
	if item then
		if not item.client?.export and not item.client?.event then
			item.effect = cb
		end
	end
end

local ox_inventory = exports[shared.resource]
-----------------------------------------------------------------------------------------------
-- Clientside item use functions
-----------------------------------------------------------------------------------------------
---
---
---
Item('craftingtable', function(data, slot)
    local model = "gr_prop_gr_bench_04b"
    local id = "CraftingTable"..math.random(111111,999999)
    TriggerEvent("zat-crafting:client:PlaceTable", id, model)
end)

-- Drug Data
local drugs = {
    baggedpuremeth = {
        usetime = 5000,
        label = "Snorting Cocaine",
        effects = {
            timecycle = { effect = "DRUG_gas_huffing", duration = 30000 },
            speedBoost = { multiplier = 1.5, duration = 30000 },
            preventRagdoll = { duration = 30000 },
        },
        animation = {
            dict = "mp_suicide",
            anim = "pistol",
            duration = 5000,
        },
        prop = {
            model = "prop_rolled_sock_02",
            bone = 60309,
            offset = vector3(0.1, 0, 0),
            rotation = vector3(0, 0, 0),
        },
    },
    refinedmeth = {
        usetime = 5000,
        label = "Snorting Cocaine",
        effects = {
            timecycle = { effect = "DRUG_gas_huffing", duration = 30000 },
            speedBoost = { multiplier = 1.5, duration = 30000 },
            preventRagdoll = { duration = 30000 },
        },
        prop = {
            model = "prop_rolled_sock_02",
            bone = 60309,
            offset = vector3(0.1, 0, 0),
            rotation = vector3(0, 0, 0),
        },
    },
    fent = {
        usetime = 4000,
        label = "Fentanyl",
        effects = {
            timecycle = { effect = "NG_filmic14", duration = 7000 },
        },
        animation = {
            dict = "mp_suicide",
            anim = "pill",
            duration = math.random(2000, 4000),
        },
    },
    teapot_bloomjoint = {
        usetime = 4000,
        label = "Smoking Bloom Joint",
        effects = {
            timecycle = { effect = "BloomMid", duration = 25000 },
            armour = 15,
            stress = 25
        },
        requiredItems = { "lighter", "teapotlighter" },
        joint = true, -- Indicates this is a joint
    },
    teapot_serenityjoint = {
        usetime = 4000,
        label = "Smoking Serenity Joint",
        effects = {
            timecycle = { effect = "DRUG_2_drive", duration = 25000 },
            armour = 15,
            stress = 25
        },
        requiredItems = { "lighter", "teapotlighter" },
        joint = true, -- Indicates this is a joint
    },
    -- Add more drugs here
}

local function hasRequiredItem(requiredItems)
    for _, item in ipairs(requiredItems) do
        if exports.ox_inventory:Search("count", item) > 0 then
            return true
        end
    end
    return false
end

local function applyEffects(ped, effects)
    if effects.timecycle then
        SetTimecycleModifier(effects.timecycle.effect)
        CreateThread(function()
            Wait(effects.timecycle.duration)
            SetTimecycleModifier("")
        end)
    end

    if effects.armour then
        local currentArmour = GetPedArmour(ped)
        local newArmour = math.min(100, currentArmour + effects.armour) -- Ensure max armor is capped at 100
        SetPedArmour(ped, newArmour)
    end

    if effects.stress then
        TriggerServerEvent('hud:server:RelieveStress', effects.stress)
    end

    if effects.speedBoost then
        SetRunSprintMultiplierForPlayer(PlayerId(), effects.speedBoost.multiplier)
        CreateThread(function()
            Wait(effects.speedBoost.duration)
            SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
        end)
    end

    if effects.preventRagdoll then
        SetPedCanRagdoll(ped, false)
        CreateThread(function()
            Wait(effects.preventRagdoll.duration)
            SetPedCanRagdoll(ped, true)
        end)
    end
end

local function useDrugItem(itemName, data, slot)
    local drugData = drugs[itemName]
    if not drugData then return end

    if not canJoint then
        lib.notify({ description = "You can't use this right now. Wait for the effects to wear off.", type = "error" })
        return
    end

    canJoint = false -- Prevent further item use during effects

    local ped = PlayerPedId()
    local bluntProp = nil -- Variable to store the created prop

    -- Check for required items
    if drugData.requiredItems and not hasRequiredItem(drugData.requiredItems) then
        lib.notify({ description = "You need a lighter to use this!", type = "error" })
        canJoint = true
        return
    end

    ox_inventory:useItem(data, function(item)
        if item then
            -- Handle Joint Animation and Prop
            if drugData.joint then
                local animDict = "amb@world_human_smoking_pot@male@base"
                local animation = "base"

                if IsPedArmed(ped, 7) then INVENTORY.ITEMS:SetEmptyHanded(false) end
                if not IsEntityPlayingAnim(ped, animDict, animation, 3) then
                    lib.requestAnimDict(animDict)
                    TaskPlayAnim(ped, animDict, animation, 8.0, -8, -1, 49, 0, 0, 0, 0)
                    lib.requestModel(`prop_cigar_01`) -- Replace with your joint prop if needed
                    bluntProp = CreateObject(`prop_cigar_01`, GetEntityCoords(ped), true, true, false)
                    AttachEntityToEntity(bluntProp, ped, GetPedBoneIndex(ped, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
                end
            else
                -- Play standard animation
                if drugData.animation then
                    lib.requestAnimDict(drugData.animation.dict)
                    TaskPlayAnim(ped, drugData.animation.dict, drugData.animation.anim, 1.0, -1, drugData.animation.duration, 49, 0, false, false, false)
                    Wait(drugData.animation.duration)
                    ClearPedTasks(ped)
                end
            end

            -- Progress bar
            local finished = exports["erp_progressbar"]:taskBar({
                length = drugData.usetime,
                text = drugData.label,
                disable = { combat = true },
            }) == 100

            if finished then
                TriggerServerEvent('ox_inventory:removeItem', itemName, 1)
                applyEffects(ped, drugData.effects)

                -- Reset canJoint and delete prop after effects
                CreateThread(function()
                    Wait(drugData.effects.timecycle and drugData.effects.timecycle.duration or 0)
                    if bluntProp and DoesEntityExist(bluntProp) then
                        DeleteObject(bluntProp)
                        bluntProp = nil
                    end
                    canJoint = true
                end)
            else
                canJoint = true -- Reset on progress cancel
                if bluntProp and DoesEntityExist(bluntProp) then
                    DeleteObject(bluntProp)
                    bluntProp = nil
                end
            end
        else
            canJoint = true -- Reset if item is invalid
            if bluntProp and DoesEntityExist(bluntProp) then
                DeleteObject(bluntProp)
                bluntProp = nil
            end
        end
    end)
end




-- Define Drug Items
for itemName in pairs(drugs) do
    Item(itemName, function(data, slot)
        useDrugItem(itemName, data, slot)
    end)
end



-- Call of Duty Perks Data
local codperks = {
    staminup = { 
        length = { min = 5000, max = 5000 },
        text = "Drinking StaminUP!",
        speedBoost = 1.3, -- Sprint speed multiplier
    },

    quickrevive = { 
        length = { min = 5000, max = 5000 },
        text = "Drinking Quick Revive",
        healthRegenSpeed = 25, -- Faster health regen multiplier
        sound = 'quickrevive'
    },

    juggernog = { 
        length = { min = 5000, max = 5000 },
        text = "Drinking Juggernog",
        maxHealth = 50, -- Increased max health value
    },

    deadshot = { 
        length = { min = 5000, max = 5000 },
        text = "Drinking Deadshot Daiquiri",
        recoilReduction = true, -- Simulated recoil reduction property
        damageBoost = 1.2, -- Increased damage multiplier
    },

    speedcola = { 
        length = { min = 5000, max = 5000 },
        text = "Drinking Speed Cola",
        reloadSpeedMultiplier = 0.5, -- Multiplier for faster reload (hypothetical)
    },

    doubletap = { 
        length = { min = 5000, max = 5000 },
        text = "Drinking Double Tap Root Beer",
        fireRateBoost = true, -- Property to indicate increased fire rate
    },

    electriccherry = { 
        length = { min = 5000, max = 5000 },
        text = "Drinking Electric Cherry",
        electricShockOnReload = true, -- Indicates special electric shock effect
    },

    widowswine = { 
        length = { min = 5000, max = 5000 },
        text = "Drinking Widow's Wine",
        meleeSlowEffect = true, -- Slows nearby enemies on melee attack
    }
}

local function usePerkItem(perkName, data, slot)
    local perkData = codperks[perkName]
    if not perkData then return end
    ox_inventory:useItem(data, function(item)
        if item then
            local ped = cache.ped
            if perkData.sound then
                TriggerServerEvent("erp-sounds:PlayWithinDistance", 5.0, perkData.sound, 0.08 )
            end
            local finished = exports.erp_progressbar:taskBar({
                length = math.random(perkData.length.min, perkData.length.max),
                text = perkData.text,
                animation = { dict ='amb@world_human_drinking@coffee@male@idle_a', anim = 'idle_a' },
            }) == 100

            if finished then
                TriggerServerEvent('ox_inventory:removeItem', perkName, 1)
                if perkData.speedBoost then
                    SetRunSprintMultiplierForPlayer(ped, perkData.speedBoost)
                    lib.notify({
                        text = 'You feel faster..',
                        type = 'success',
                    })
                    Wait(perkData.length.min) -- Simulating duration
                    SetRunSprintMultiplierForPlayer(ped, 1.0) -- Resetting speed multiplier
                end
                local maxHealth = GetEntityMaxHealth(cache.ped)
                local health = GetEntityHealth(cache.ped)
                if perkData.healthRegenSpeed then
                        local newHealth = math.min(maxHealth, health + perkData.healthRegenSpeed)
                        SetEntityHealth(cache.ped, newHealth)
                end
                if perkData.maxHealth then
                    AddArmourToPed(ped, perkData.maxHealth)
                end
            else
                lib.notify({ description = perkName .. " canceled.", type = "error" })
            end
        end
    end)
end

-- Define Perk Items
for perkName in pairs(codperks) do
    Item(perkName, function(data, slot)
        usePerkItem(perkName, data, slot)
    end)
end


-- length (min, max):

-- The time, in milliseconds, that the item takes to use.
-- Example: length = { min = 6000, max = 8000 } means the item usage duration will randomly be between 6 and 8 seconds.
-- text:

-- The text displayed during the item's usage (progress bar).
-- Example: text = "Bandaging Wounds" will show this message while the item is being used.
-- healthGain / overTime:

-- healthGain: Specifies how much health is restored immediately after the item's usage.
-- Example: healthGain = 100 restores 100 health points healthGainly.
-- overTime: Configures gradual healing by specifying the total health to restore and the duration (in seconds).
-- Example: overTime = { amount = 30, duration = 30 } restores 30 health points over 30 seconds (1 HP per second).
-- sound:

-- The sound effect to play after successfully using the item.
-- Example: sound = "Healing_Magic" triggers a sound named "Healing_Magic".

-- Healing Data
-- Healing Data
local heals = {
    ibuprofen = { length = { min = 18000, max = 20000 }, text = "Ibuprofen", healthGain = 100 },
    bandage = { length = { min = 6000, max = 8000 }, text = "Bandaging Wounds", healthGain = 16 },
    ifak = { length = { min = 6000, max = 8000 }, text = "Applying IFAK", gradualGain = { amount = 30, duration = 15 } },
    pbandage = { length = { min = 6000, max = 8000 }, text = "Bandaging Wounds", healthGain = 16 },
    prbandage = { length = { min = 6000, max = 8000 }, text = "Bandaging Wounds", healthGain = 16 },
    hkbandage = { length = { min = 6000, max = 8000 }, text = "Applying HK Bandage", healthGain = 16 },
    dabandage = { length = { min = 6000, max = 8000 }, text = "Applying DA Bandage", healthGain = 16 },
    sthbandage = { length = { min = 6000, max = 8000 }, text = "Applying STH Bandage", healthGain = 16 },
    swmbandage = { length = { min = 6000, max = 8000 }, text = "Applying SWM Bandage", healthGain = 16 },
    hpbandage = { length = { min = 6000, max = 8000 }, text = "Applying HP Bandage", healthGain = 16 },
    mnbandage = { length = { min = 6000, max = 8000 }, text = "Applying MN Bandage", healthGain = 16 },
    ntbandage = { length = { min = 6000, max = 8000 }, text = "Applying NT Bandage", healthGain = 16 },
    ppgbandage = { length = { min = 6000, max = 8000 }, text = "Applying PPG Bandage", healthGain = 16 },
    medicalsyringe = { length = { min = 3000, max = 5000 }, failureChance = 10, text = "Applying Syringe", healthGain = 25,  animation = { dict = "rcmpaparazzo1ig_4", anim = "miranda_shooting_up"}, sound = 'rustsyringe' },
    medbag = {
        length = { min = 18000, max = 20000 },
        text = "Working Magic",
        revive = true,
        prop = {
            model = "v_ret_ta_firstaid",
            bone = 60309, -- Left hand
            offset = vector3(0.1, 0.0, 0.0),
            rotation = vector3(0.0, 90.0, 0.0)
        },
    }
}

local function useHealItem(itemName, data, slot)
    local healData = heals[itemName]
    if not healData then return end
    ox_inventory:useItem(data, function(item)
        if item then
            if healData.failureChance and math.random(1, 100) <= healData.failureChance then
                lib.notify({ description = "You fumbled and failed to use the item correctly!", type = "error" })
                SetTimecycleModifier('BlackOut')
                Wait(1500)
                SetTimecycleModifier('')
                return
            end

            -- Attach prop
            local prop
            if healData.prop then
            local model = GetHashKey(healData.prop.model)
            lib.requestModel(model, 1000)

            prop = CreateObject(model, GetEntityCoords(cache.ped), true, true, false)
            
            AttachEntityToEntity(
                prop,
                cache.ped,
                GetPedBoneIndex(cache.ped, healData.prop.bone),
                healData.prop.offset.x,
                healData.prop.offset.y,
                healData.prop.offset.z,
                healData.prop.rotation.x,
                healData.prop.rotation.y,
                healData.prop.rotation.z,
                true,  -- p9 (Unknown, but true is common)
                false, -- useSoftPinning
                false, -- collision
                false, -- isPed
                2,     -- rotationOrder
                true   -- syncRot
            )
        end
            -- Play sound
            if healData.sound then
                TriggerServerEvent("erp-sounds:PlayWithinDistance", 5.0, healData.sound, 0.08 )
            end

            -- Progress bar
            local finished = exports.erp_progressbar:taskBar({
                length = math.random(healData.length.min, healData.length.max),
                text = healData.text,
                keepweapon = true,
                animation = {
                    dict = healData.animation and healData.animation.dict or "amb@world_human_clipboard@male@idle_a",
                    anim = healData.animation and healData.animation.anim or "idle_c",
                }
            }) == 100
            ClearPedTasks(cache.ped)
            if healData.revive then
                local target = PlayerId()
                TriggerServerEvent('hospital:server:RevivePlayer', GetPlayerServerId(target))
            end
            -- Remove prop after use
            if prop then
                DeleteObject(prop)
            end

            if finished then
                TriggerServerEvent('ox_inventory:removeItem', itemName, 1)

                local maxHealth = GetEntityMaxHealth(cache.ped)
                local health = GetEntityHealth(cache.ped)

                if healData.healthGain then
                    -- healthGain heal
                    local newHealth = math.min(maxHealth, health + healData.healthGain)
                    SetEntityHealth(cache.ped, newHealth)
                elseif healData.gradualGain then
                    -- Gradual heal over time
                    local amount = healData.gradualGain.amount
                    local duration = healData.gradualGain.duration
                    local increment = math.floor(amount / duration)
                    CreateThread(function()
                        for i = 1, duration do
                            Wait(1000)
                            health = GetEntityHealth(cache.ped)
                            if health < maxHealth then
                                SetEntityHealth(cache.ped, math.min(maxHealth, health + increment))
                            end
                        end
                    end)
                end
                TriggerEvent('evidence:client:SetStatus', 'Bandaging', 60, nil, 'Fresh Bandaging.')

            else
                lib.notify({ description = itemName .. " canceled.", type = "error" })
            end
        end
    end)
end

-- Define Healing Items
for itemName in pairs(heals) do
    Item(itemName, function(data, slot)
        useHealItem(itemName, data, slot)
    end)
end


-- Table containing armor data
local armor = {
    ['lightarmour'] = { armor = 30, length = { min = 5000, max = 7500 }, text = 'Small Armor' },
    ['medarmour'] = { armor = 60, length = { min = 7500, max = 10000 }, text = 'Medium Armor' },
    ['heavyarmour'] = { armor = 100, length = { min = 10000, max = 15000 }, text = 'Heavy Armor' }
}

local function useArmorItem(itemName, data, slot)
    local armorData = armor[itemName]
    if armorData and GetPedArmour(cache.ped) < 100 then
        ox_inventory:useItem(data, function(item)
            if item then
                lib.requestAnimDict('clothingshirt')
                lib.requestAnimDict('anim@narcotics@trash')

                TaskPlayAnim(cache.ped, 'anim@narcotics@trash', 'drop_front', 1.0, -1, 1900, 49, 3.0, false, false, false)

                CreateThread(function()
                    Wait(1950)
                    TaskPlayAnim(cache.ped, 'clothingshirt', 'try_shirt_positive_d', 1.0, -1, -1, 50, 0, false, false,
                        false)
                end)
            end

            local finished = exports["erp_progressbar"]:taskBar({
                length = math.random(armorData.length.min, armorData.length.max),
                text = armorData.text,
                keepweapon = true,
            }) == 100

            ClearPedTasks(cache.ped)

            if finished then
                AddArmourToPed(cache.ped, armorData.armor)
                print(itemName .. ' applied successfully.')
            else
                print(itemName .. ' application was canceled.')
            end
        end)
    else
        print('Player already has maximum armor.')
    end
end

-- Define Items
Item('lightarmour', function(data, slot)
    useArmorItem('lightarmour', data, slot)
end)

Item('medarmour', function(data, slot)
    useArmorItem('medarmour', data, slot)
end)

Item('heavyarmour', function(data, slot)
    useArmorItem('heavyarmour', data, slot)
end)


local effects = {
    -- @Food Shop Items 🍔

    -- General Food 🍽️
    jailfood = { hunger = 15, thirst = 10, length = { min = 5000, max = 6000 }, text = 'Eating Jail Food' },
    pizzasoup = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Pizza Soup' },
    Hospitalfood = { hunger = 15, thirst = 10, length = { min = 5000, max = 6000 }, text = 'Eating Hospital Food' },
    bread = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Bread' },
    hamburger = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Hamburger' },
    sandwich = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Sandwich' },
    donut = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Donut' },
    chips = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Chips' },
    chocolate = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Chocolate' },
    gummybears = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Gummy Bears' },
    hotdogs = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Hotdogs' },
    cookie = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Cookie' },
    edamame = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Edamame' },

    -- Good Vibes Taco Hut Food 🌮
    taco = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Taco' },
    classicfishtaco = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Classic Fish Taco' },
    fishtaco = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Fish Taco' },
    vegantaco = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Vegan Taco' },
    shrimp_taco = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Shrimp Taco' },
    alpastortaco = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Al Pastor Taco' },
    birriatacos = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Birria Tacos' },
    chimichanga = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Chimichanga' },
    burrito = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Burrito' },
    quesarito = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Quesarito' },
    tamale = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Tamale' },
    taco_salad = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Taco Salad' },
    chile_relleno = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Chile Relleno' },
    quesadilla = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Quesadilla' },
    nachos = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Nachos' },
    elote_con_chile = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Elote con Chile' },
    churro = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Churro' },
    sopapilla = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Sopapilla' },

    -- Good Vibes Taco Hut Seasonal 🌶️
    poppermummies = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Popper Mummies' },
    treslechescupcake = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Tres Leches Cupcake' },
    jackolanternempadas = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Jack-O-Lantern Empanadas' },
    fantasma = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Fantasma' },
    candyconchile = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Candy con Chile' },
    calveraconcha = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Calvera Concha' },

    -- Bishops Chicken (PA Shop) 🍗
    bishopdrumstick = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Bishop Drumstick' },
    bishopgrapes = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Bishop Grapes' },
    momssandwhiches = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Mom\'s Sandwich' },
    hotcheetos = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Hot Cheetos' },
    icecream = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Ice Cream' },

    -- SooChi Bar Food 🍣
    hotwings = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Hot Wings' },
    mozzerellasticks = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Mozzarella Sticks' },
    takoyaki = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Takoyaki' },
    ebifry = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Ebifry' },
    soochi_hotdog = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating SooChi Hotdog' },

    -- SooChi Food 🍱
    bowlofrice = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Bowl of Rice' },
    californiaroll = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating California Roll' },
    katnigiri = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Katnigiri' },
    gyoza = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Gyoza' },
    misoramen = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Miso Ramen' },
    mitarashi = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Mitarashi' },
    mixedhibachi = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Mixed Hibachi' },
    sakuramochi = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Sakura Mochi' },
    salmontempura = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Salmon Tempura' },
    spicydragonroll = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Spicy Dragon Roll' },
    spicyshoyuramen = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Spicy Shoyu Ramen' },
    teriyakichickenskewers = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Teriyaki Chicken Skewers' },
    tempura_icecream = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Tempura Ice Cream' },
    tonkotsuramen = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Tonkotsu Ramen' },
    yaiksoba = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Yaiksoba' },
    soochi_kabocha = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating SooChi Kabocha' },
    soochi_fishburger = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating SooChi Fishburger' },
    soochi_pride24cakes = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating SooChi Pride 24 Cakes' },

    -- SooChi Seasonal 🎉
    soochi_pride24sushi = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating SooChi Pride 24 Sushi' },
    soochi_pride24rolls = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating SooChi Pride 24 Rolls' },

    -- Louie's Pizza 🍕
    margheritapizzaslice = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Margherita Pizza Slice' },
    alfredopizzaslice = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Alfredo Pizza Slice' },
    workspizzaslice = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Works Pizza Slice' },
    peppizzaslice = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Pepperoni Pizza Slice' },
    pestopizzaslice = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Pesto Pizza Slice' },
    ls_cheesepizzaslice = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Cheese Pizza Slice' },
    ls_hawaiianpizzaslice = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Hawaiian Pizza Slice' },
    ls_artichokepizzaslice = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Artichoke Pizza Slice' },
    ls_bbqchickenpizzaslice = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating BBQ Chicken Pizza Slice' },

    -- Louie's 🍝
    gnocchi = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Gnocchi' },
    bruschetta = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Bruschetta' },
    chopsalad = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Chop Salad' },
    spaghetti = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Spaghetti' },
    calzone = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Calzone' },
    lasagna = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Lasagna' },
    vealparm = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Veal Parmesan' },
    fettalfredo = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Fettuccine Alfredo' },
    stuffshell = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Stuffed Shell' },
    garlicsteak = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Garlic Steak' },
    tiramisu = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Tiramisu' },
    cannoli = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Cannoli' },
    ls_garlicbread = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Garlic Bread' },
    ls_pestotort = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Pesto Tortellini' },
    coffeegelato = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Coffee Gelato' },
    gelato = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Gelato' },
    ls_saltedtart = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Salted Tart' },
    ls_ricottacheesecake = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Ricotta Cheesecake' },
    ls_lobsterrisotto = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Lobster Risotto' },
    ls_muffuletta = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Muffuletta' },
    ls_baconcarbonara = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Bacon Carbonara' },
    ls_buttercookie = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Butter Cookie' },
    ls_charcuterieboard = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Charcuterie Board' },
    -- @Drink Shop Items 🍹

    -- General Drinks 🥤
    water = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Water' },
    triadtea = { thirst = 10, caffeine = 5.0, length = { min = 5000, max = 6000 }, text = 'Drinking Triad Tea' },
    cocacola = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Coca Cola' },
    maldwine = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Maldwine' },
    eggnog = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Eggnog' },
    coffee = { thirst = 10, caffeine = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Coffee' },
    beer = { thirst = 0, alcohol = 1.0, length = { min = 5000, max = 6000 }, text = 'Drinking Beer' },
    vodka = { thirst = 0, alcohol = 3.0, length = { min = 5000, max = 6000 }, text = 'Drinking Vodka' },
    moonshine = { thirst = 0, alcohol = 4.0, stress = -150, length = { min = 5000, max = 6000 }, text = 'Drinking Moonshine' },
    fsm_vodka = { thirst = 0, alcohol = 4.0, length = { min = 5000, max = 6000 }, text = 'Drinking FSM Vodka' },
    champagne = { thirst = 0, alcohol = 2.0, stress = -150, length = { min = 5000, max = 6000 }, text = 'Drinking Champagne' },
    oldfashioned = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Old Fashioned' },
    whiskey = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Whiskey' },

    copium = { thirst = 0, stress = -1000, policeLocked = true, length = { min = 5000, max = 6000 }, text = 'Drinking Copium', prop = {
        model = "ng_proc_sodacan_01a",
        bone = 28422, -- Left hand
        offset = vector3(0.0, 0.0, 0.0),
        rotation = vector3(0.0, 0.0, 100.0)
    }, },

    copiumxtreme = { thirst = 0, stress = -500, armour = 25, policeLocked = true, length = { min = 5000, max = 6000 }, text = 'Drinking Copium Xtreme', prop = {
        model = "ng_proc_sodacan_01a",
        bone = 28422, -- Left hand
        offset = vector3(0.0, 0.0, 0.0),
        rotation = vector3(0.0, 0.0, 100.0)
    }, },

    -- @Good Vibes Taco Hut Drinks 🍹
    slushy = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Slushy' },
    cantaloupe = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Cantaloupe' },
    lemon_agua = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Lemon Agua' },
    strawberry_aqua = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Strawberry Aqua' },
    tamarind_agua = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Tamarind Agua' },
    melon_agua = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Melon Agua' },
    horchata = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Horchata' },
    champurrado = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Champurrado' },
    mangonada = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Mangonada' },
    colada = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Colada' },
    mtnshlew = { thirst = 10, caffeine = 4.0, length = { min = 5000, max = 6000 }, text = 'Drinking Mtnshlew' },
    hotchoccy = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Hot Choccy' },
    icetea = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Ice Tea' },

    -- @Good Vibes Taco Hut Seasonal 🍁
    pumpkinspicehorchata = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Pumpkin Spice Horchata' },

    -- @Bishops Chicken (PA Shop) 🍗
    bishopsthirst = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Bishop\'s Drink' },

    -- @SooChi Bar Drinks 🍸
    dirtymartini = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Dirty Martini' },
    rootbeerfloat2 = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Rootbeer Float' },
    sexonthebeach = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Sex on the Beach' },
    shirleytemple = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Shirley Temple' },
    soochi_ginfizz = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking SooChi Gin Fizz' },

    -- @SooChi Drinks 🍶
    awamori = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Awamori' },
    bullbetea = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Bullbe Tea' },
    cannedcoffee = { thirst = 10, caffeine = 4.0, length = { min = 5000, max = 6000 }, text = 'Drinking Canned Coffee' },
    lycheesoda = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Lychee Soda' },
    matchagreentea = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Matcha Green Tea' },
    milktea = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Milk Tea' },
    sake = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Sake' },
    yuzushu = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Yuzu Shu' },
    soochi_bluemilktea = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking SooChi Blue Milk Tea' },
    soochi_pride24sake = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking SooChi Pride 24 Sake' },

    -- @Burgershot Drinks 🍔
    sprunk = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Sprunk' },
    ecola = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Ecola' },
    ecolaL = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Ecola L' },
    lemonade = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Lemonade' },
    orangotang = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Orangotang' },
    sarsaparillasunset = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Sarsaparilla Sunset' },
    cupajoe = { thirst = 10, caffeine = 4.0, length = { min = 5000, max = 6000 }, text = 'Drinking Cup of Joe' },
    bs_pridefruitthirst = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Pride Fruit Drink' },

    -- @Louie's Drinks 🍷
    mojito = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Mojito' },
    limoncello = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Limoncello' },
    peachthirst = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Peach Drink' },
    sparklingwater = { thirst = 10, louies = true, length = { min = 5000, max = 6000 }, text = 'Drinking Sparkling Water' },
    italiansoda = { thirst = 10, louies = true, length = { min = 5000, max = 6000 }, text = 'Drinking Italian Soda' },
    apricotjuice = { thirst = 10, louies = true, length = { min = 5000, max = 6000 }, text = 'Drinking Apricot Juice' },
    raspitaliansoda = { thirst = 10, louies = true, length = { min = 5000, max = 6000 }, text = 'Drinking Rasp Italian Soda' },
    dragonitaliansoda = { thirst = 10, louies = true, length = { min = 5000, max = 6000 }, text = 'Drinking Dragon Italian Soda' },
    ls_casadiabloglass = { thirst = 0, alcohol = 2.0, louies = true, length = { min = 5000, max = 6000 }, text = 'Drinking Casa Diablo Glass' },
    ls_casacorteseglass = { thirst = 0, alcohol = 2.0, louies = true, length = { min = 5000, max = 6000 }, text = 'Drinking Casa Cortese Glass' },
    ls_rainbowflutefull = { thirst = 0, alcohol = 2.0, louies = true, length = { min = 5000, max = 6000 }, text = 'Drinking Rainbow Flute' },
    italiancoffee = { thirst = 10, caffeine = 4.0, length = { min = 5000, max = 6000 }, text = 'Drinking Italian Coffee' },
    ls_pinapplesoda = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Pineapple Soda' },
    ls_pumpkinlatte = { thirst = 10, caffeine = 4.0, length = { min = 5000, max = 6000 }, text = 'Drinking Pumpkin Latte' },
    ls_peppermintchocky = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Peppermint Chocky' },
    ls_appleburbon = { thirst = 0, alcohol = 3.0, length = { min = 5000, max = 6000 }, text = 'Drinking Apple Bourbon' },
    ls_aperolspritz = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Aperol Spritz' },

    -- Vanilla Unicorn Drinks (VU) 🍸
    mommymilk = { thirst = 10, sober = true, length = { min = 5000, max = 6000 }, text = 'Drinking Mommy Milk' },
    vu_dash = { thirst = 10, caffeine = 4.0, length = { min = 5000, max = 6000 }, text = 'Drinking Dash' },
    vu_loverboy = { thirst = 1.0, length = { min = 5000, max = 6000 }, text = 'Drinking Loverboy' },
    vu_blueraspsour = { thirst = 1.0, length = { min = 5000, max = 6000 }, text = 'Drinking Blue Rasp Sour' },
    vu_cherrylimeade = { thirst = 1.0, length = { min = 5000, max = 6000 }, text = 'Drinking Cherry Limeade' },
    vu_puck = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Puck' },
    vu_boot = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Boot' },
    vu_barbiemarg = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Barbie Margarita' },
    vu_btgg = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking BTGG' },
    vu_spicymarg = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Spicy Margarita' },
    vu_vodkaglass = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Vodka Glass' },
    vu_625glass = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking 625 Glass' },
    vu_brew = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Brew' },
    vu_maitai = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Mai Tai' },
    vu_sangria = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Sangria' },
    vu_cosmopolitan = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Cosmopolitan' },
    vu_snakebite = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Snakebite' },
    vu_unicorninferno = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Unicorn Inferno' },
    vu_bluevodkashot = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Blue Vodka Shot' },
    vu_vanillajello = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Vanilla Jello' },
    vu_pride24jello = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Pride 24 Jello' },
    vu_pride24fishbowl = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Pride 24 Fishbowl' },
    vu_pride24punch = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Pride 24 Punch' },
    vu_gunnerpops = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Gunner Pops' },

    -- Devil's Door Drinks 🍹
    vanillacola = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Vanilla Cola' },
    peachsoda = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Peach Soda' },
    pearsoda = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Pear Soda' },
    cucumberlimeade = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Cucumber Limeade' },
    shirley = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Shirley Temple' },
    dd_pumpcoldbrew = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Pumpkin Cold Brew' },
    dd_ocarina = { thirst = 10, caffeine = 4.0, length = { min = 5000, max = 6000 }, text = 'Drinking Ocarina' },
    dd_oysters = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Oysters' },

    -- Devil's Bar 🍸
    fourhorsemen = { thirst = 0, alcohol = 5.0, length = { min = 5000, max = 6000 }, text = 'Drinking Four Horsemen' },
    jackncoke = { thirst = 0, alcohol = 4.0, length = { min = 5000, max = 6000 }, text = 'Drinking Jack & Coke' },
    devilssunrise = { thirst = 0, alcohol = 3.0, length = { min = 5000, max = 6000 }, text = 'Drinking Devil\'s Sunrise' },
    devilsbourbon = { thirst = 0, alcohol = 4.0, length = { min = 5000, max = 6000 }, text = 'Drinking Devil\'s Bourbon' },
    dd_angryballs = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Angry Balls' },
    dd_bullet = { thirst = 0, alcohol = 4.0, length = { min = 5000, max = 6000 }, text = 'Drinking Bullet' },
    dd_caramel = { thirst = 0, alcohol = 3.0, length = { min = 5000, max = 6000 }, text = 'Drinking Caramel' },
    dd_climax = { thirst = 0, alcohol = 3.0, length = { min = 5000, max = 6000 }, text = 'Drinking Climax' },
    dd_witchdoc = { thirst = 0, alcohol = 3.0, length = { min = 5000, max = 6000 }, text = 'Drinking Witch Doctor' },
    -- THC Drinks 🍵
    teahc = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking THC Tea' },
-- @Teapot Items 🍵

-- Infused Food Items 🍴
teapot_cheesesteak_infused = { hunger = 15, caffeine = 4.0, armour = 10, length = { min = 5000, max = 6000 }, text = 'Eating Philly Cheesesteak (Infused)' },
teapot_wbrew_infused = { thirst = 10, caffeine = 4.0, armour = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Witch\'s Brew (Infused)' },
teapot_pspfrappe_infused = { thirst = 10, caffeine = 5.0, length = { min = 5000, max = 6000 }, text = 'Drinking Pumpkin Spice Frappe (Infused)' },
teapot_cstrawbs_infused = { hunger = 15, caffeine = 4.0, armour = 10, length = { min = 5000, max = 6000 }, text = 'Eating Chocolate Covered Strawberries (Infused)' },
teapot_pumpswiss_infused = { hunger = 15, caffeine = 4.0, armour = 10, length = { min = 5000, max = 6000 }, text = 'Eating Pumpkin Swiss Roll (Infused)' },
teapot_pride24macarons_infused = { hunger = 15, caffeine = 4.0, armour = 10, length = { min = 5000, max = 6000 }, text = 'Eating Love is Love Macarons (Infused)' },
teapot_pride24bites_infused = { hunger = 15, caffeine = 4.0, armour = 10, length = { min = 5000, max = 6000 }, text = 'Eating Unicorn Bites (Infused)' },
teapot_cakepop_infused = { hunger = 15, caffeine = 4.0, armour = 10, length = { min = 5000, max = 6000 }, text = 'Eating Merry Cake (Infused)' },
teapot_xmascookie_infused = { hunger = 15, caffeine = 4.0, armour = 10, length = { min = 5000, max = 6000 }, text = 'Eating Santa\'s Cookies (Infused)' },
teapot_jingle_infused = { thirst = 10, caffeine = 4.0, armour = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Jingle Juice (Infused)' },
teapot_peppermint_infused = { thirst = 10, caffeine = 4.0, armour = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Santa\'s Delight (Infused)' },
teapot_cupidskiss_infused = { thirst = 10, caffeine = 4.0, armour = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Cupid\'s Kiss (Infused)' },
teapot_loverboylatte_infused = { thirst = 10, caffeine = 5.0, length = { min = 5000, max = 6000 }, text = 'Drinking Loverboy Latte (Infused)' },
teapot_heartblossoms_infused = { hunger = 15, caffeine = 4.0, armour = 10, length = { min = 5000, max = 6000 }, text = 'Eating Heart Blossoms (Infused)' },
teapot_sweetheartsoiree_infused = { hunger = 15, caffeine = 4.0, armour = 10, length = { min = 5000, max = 6000 }, text = 'Eating Sweetheart Soiree (Infused)' },

-- Regular Food Items 🍴
teapot_cheesesteak = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Philly Cheesesteak' },
teapot_wbrew = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Witch\'s Brew' },
teapot_pspfrappe = { thirst = 10, caffeine = 5.0, length = { min = 5000, max = 6000 }, text = 'Drinking Pumpkin Spice Frappe' },
teapot_cstrawbs = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Chocolate Covered Strawberries' },
teapot_pumpswiss = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Pumpkin Swiss Roll' },
teapot_pride24drink = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Taste The Rainbow' },
teapot_pride24macarons = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Love is Love Macarons' },
teapot_pride24bites = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Unicorn Bites' },
teapot_cakepop = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Merry Cake' },
teapot_xmascookie = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Santa\'s Cookies' },
teapot_jingle = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Jingle Juice' },
teapot_peppermint = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Santa\'s Delight' },
teapot_cupidskiss = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Cupid\'s Kiss' },
teapot_loverboylatte = { thirst = 10, caffeine = 5.0, length = { min = 5000, max = 6000 }, text = 'Drinking Loverboy Latte' },
teapot_heartblossoms = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Heart Blossoms' },
teapot_sweetheartsoiree = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Sweetheart Soiree' },
teapot_hearttoast_infused = { hunger = 15, caffeine = 4.0, armour = 10, length = { min = 5000, max = 6000 }, text = 'Eating Heart Toast (Infused)' },
teapot_sandos_infused = { hunger = 15, caffeine = 4.0, armour = 10, length = { min = 5000, max = 6000 }, text = 'Eating Tea Sandos (Infused)' },
teapot_honeycomb_infused = { hunger = 15, caffeine = 4.0, armour = 10, length = { min = 5000, max = 6000 }, text = 'Eating Honeycomb Cake (Infused)' },
teapot_swissroll_infused = { hunger = 15, caffeine = 4.0, armour = 10, length = { min = 5000, max = 6000 }, text = 'Eating Strawberry Swiss Roll (Infused)' },
teapot_poptart_infused = { hunger = 15, caffeine = 4.0, armour = 10, length = { min = 5000, max = 6000 }, text = 'Eating Wildberry Poptart (Infused)' },
teapot_pan_cookie_infused = { hunger = 15, caffeine = 4.0, armour = 10, length = { min = 5000, max = 6000 }, text = 'Eating Pan Pride Cookie (Infused)' },
teapot_bi_cookie_infused = { hunger = 15, caffeine = 4.0, armour = 10, length = { min = 5000, max = 6000 }, text = 'Eating Bi Pride Cookie (Infused)' },
teapot_lesbian_cookie_infused = { hunger = 15, caffeine = 4.0, armour = 10, length = { min = 5000, max = 6000 }, text = 'Eating Lesbian Pride Cookie (Infused)' },
teapot_trans_cookie_infused = { hunger = 15, caffeine = 4.0, armour = 10, length = { min = 5000, max = 6000 }, text = 'Eating Trans Pride Cookie (Infused)' },
teapot_enby_cookie_infused = { hunger = 15, caffeine = 4.0, armour = 10, length = { min = 5000, max = 6000 }, text = 'Eating Enby Pride Cookie (Infused)' },
teapot_rainbow_infused = { thirst = 10, caffeine = 4.0, armour = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Taste The Rainbow (Infused)' },
teapot_cinna_infused = { hunger = 15, caffeine = 4.0, armour = 10, length = { min = 5000, max = 6000 }, text = 'Eating Cinnamon Roll (Infused)' },
teapot_hearttoast = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Heart Toast' },
teapot_sandos = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Tea Sandos' },
teapot_honeycomb = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Honeycomb Cake' },
teapot_swissroll = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Strawberry Swiss Roll' },
teapot_poptart = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Wildberry Poptart' },
teapot_pan_cookie = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Pan Pride Cookie' },
teapot_bi_cookie = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Bi Pride Cookie' },
teapot_lesbian_cookie = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Lesbian Pride Cookie' },
teapot_trans_cookie = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Trans Pride Cookie' },
teapot_enby_cookie = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Enby Pride Cookie' },
teapot_rainbow = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Taste The Rainbow' },
teapot_cinna = { hunger = 15, length = { min = 5000, max = 6000 }, text = 'Eating Cinnamon Roll' },

    -- Little Teapot Drinks 🍶
    teapot_maplewalnut = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Maple Walnut Tea' },
    teapot_dragon = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Dragon Tea' },
    teapot_earlgrey = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Earl Grey Tea' },
    teapot_saintcity = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Saint City Tea' },
    teapot_dirt = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Dirt Tea' },
    teapot_rasp = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Raspberry Tea' },
    teapot_frappe = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Frappe' },
    teapot_pride24thirst = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Pride 24 Drink' },
    teapot_maplewalnut_infused = { thirst = 10, caffeine = 4.0, armour = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Maple Walnut Tea (Infused)' },
    teapot_dragon_infused = { thirst = 10, caffeine = 4.0, armour = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Dragon Tea (Infused)' },
    teapot_earlgrey_infused = { thirst = 10, caffeine = 4.0, armour = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Earl Grey Tea (Infused)' },
    teapot_saintcity_infused = { thirst = 10, caffeine = 4.0, armour = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Saint City Tea (Infused)' },
    teapot_dirt_infused = { thirst = 10, caffeine = 4.0, armour = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Dirt Tea (Infused)' },
    teapot_rasp_infused = { thirst = 10, caffeine = 4.0, armour = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Raspberry Tea (Infused)' },
    teapot_frappe_infused = { thirst = 10, caffeine = 4.0, armour = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Frappe (Infused)' },
    teapot_pride24drink_infused = { thirst = 10, caffeine = 4.0, armour = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Pride 24 Drink (Infused)' },

    -- Blackwoods Bar 🍺
    bw_hooch = { thirst = 0, alcohol = 4.0, length = { min = 5000, max = 6000 }, text = 'Drinking Hooch' },
    bw_sunset = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Sunset' },
    bw_drip = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Drip' },
    bw_pruno = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Pruno' },
    bw_steroids = { thirst = 0, alcohol = 3.0, length = { min = 5000, max = 6000 }, text = 'Drinking Steroids' },
    bw_sangria = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Sangria' },
    bw_hotdogwater = { thirst = 0.9, length = { min = 5000, max = 6000 }, text = 'Drinking Hot Dog Water' },
    bw_humane = { thirst = 10, caffeine = 4.0, length = { min = 5000, max = 6000 }, text = 'Drinking Humane Drink' },
    bw_cmilk = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Milk' },
    bw_lp = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking LP' },
    bw_soda = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Soda' },
    bw_holywat = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Holy Water' },
    bw_punch = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Punch' },
    bw_dogbowl = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Dog Bowl' },
    patriotbeer = { thirst = 0, alcohol = 1.0, length = { min = 5000, max = 6000 }, text = 'Drinking Patriot Beer' },
    bw_pride24punch = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Pride 24 Punch' },
    bw_pride24hooch = { thirst = 0, alcohol = 5.0, length = { min = 5000, max = 6000 }, text = 'Drinking Pride 24 Hooch' },

    -- Just Chilling Items 🥤
    js_peanutsmoothie = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Peanut Smoothie' },
    js_strawberrysmoothie = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Strawberry Smoothie' },
    js_mangosmoothie = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Mango Smoothie' },
    js_candysmoothie = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Candy Smoothie' },
    js_cherrybomb = { thirst = 10, caffeine = 4.0, length = { min = 5000, max = 6000 }, text = 'Drinking Cherry Bomb' },

    -- Pop's Diner 🍔
    pop_malt = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Malt' },
    pop_coffee = { thirst = 10, caffeine = 4.0, length = { min = 5000, max = 6000 }, text = 'Drinking Coffee' },
    pop_hotchoco = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Hot Chocolate' },
    pop_slushie = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Slushie' },
    pop_cherrycoke = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Cherry Coke' },
    pop_canepunch = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Cane Punch' },
    pop_sweetheartshake = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Sweetheart Shake' },

    -- Red Lion 🦁
    rl_cwtch = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Cwtch' },
    rl_hct = { thirst = 10, caffeine = 4.0, length = { min = 5000, max = 6000 }, text = 'Drinking HCT' },
    rl_squeezy = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Squeezy' },
    rl_cwale = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Cwale' },
    rl_fizzy = { thirst = 0, alcohol = 3.0, length = { min = 5000, max = 6000 }, text = 'Drinking Fizzy' },
    rl_suckit = { thirst = 0, alcohol = 4.0, length = { min = 5000, max = 6000 }, text = 'Drinking Suck It' },
    rl_purplerain = { thirst = 0, alcohol = 3.0, length = { min = 5000, max = 6000 }, text = 'Drinking Purple Rain' },
    rl_lovepotion = { thirst = 10, length = { min = 5000, max = 6000 }, text = 'Drinking Love Potion' },
    rl_pride24fizz = { thirst = 0, alcohol = 3.0, length = { min = 5000, max = 6000 }, text = 'Drinking Pride 24 Fizz' },
    rl_pride24lp = { thirst = 1.0, length = { min = 5000, max = 6000 }, text = 'Drinking Pride 24 LP' },
    rl_woowoo = { thirst = 0, alcohol = 3.0, length = { min = 5000, max = 6000 }, text = 'Drinking Woo Woo' },
    rl_pint = { thirst = 0, alcohol = 2.0, length = { min = 5000, max = 6000 }, text = 'Drinking Pint' },

}

-- Generic Item Function
local function useEffectItem(itemName, data, slot)
    local effectData = effects[itemName]
    if effectData then
        ox_inventory:useItem(data, function(item)
            if item then
                if effectData.policeLocked then
                    local QBCore = exports['qb-core']:GetCoreObject()
                    local playerData = QBCore.Functions.GetPlayerData()

                    if not playerData.job or playerData.job.name ~= "police" then
                        -- Notify the player they can't use the item
                        lib.notify({
                            type = 'error',
                            text = "You can't use this idiot."
                        })
                        SetTimecycleModifier('BlackOut')
                        SetPedToRagdoll(cache.ped, 5000, 5000, 0, true, true, false)
                        Wait(5000)
                        SetTimecycleModifier('')
                        -- Exit the function to prevent further processing
                        return
                    end
                end

                -- Attach main prop
                local prop
            if data.prop then
                local model = GetHashKey(data.prop)
                lib.requestModel(model, 1000)

                prop = CreateObject(model, GetEntityCoords(cache.ped), true, true, false)

                AttachEntityToEntity(
                    prop,
                    cache.ped,
                    GetPedBoneIndex(cache.ped, 60309), -- Default bone index for right hand
                    0.1, 0.0, 0.0,                    -- Adjust offsets as needed
                    0.0, 0.0, 0.0,                    -- Adjust rotations as needed
                    true, false, false, false, 2, true
                )
            end


                -- Attach additional prop for hunger effect
                local hungerProp
                if effectData.hunger then
                    local hungerModel = GetHashKey('prop_cs_plate_01')
                    lib.requestModel(hungerModel, 1000)

                    hungerProp = CreateObject(hungerModel, GetEntityCoords(cache.ped), true, true, false)

                    AttachEntityToEntity(
                        hungerProp,
                        cache.ped,
                        GetPedBoneIndex(cache.ped, 60309), -- bone for the prop
                        0.09, 0.05, 0.02,                  -- offset
                        -10.0, -15.0, -50.0,              -- rotation
                        true,  -- p9 (Unknown, but true is common)
                        false, -- useSoftPinning
                        false, -- collision
                        false, -- isPed
                        2,     -- rotationOrder
                        true   -- syncRot
                    )
                end

                -- Play animation
                local animDict, animName
                if effectData.hunger then
                    animDict, animName = 'mp_player_inteat@burger', 'mp_player_int_eat_burger'
                elseif effectData.thirst then
                    animDict, animName = 'amb@world_human_drinking@coffee@male@idle_a', 'idle_a'
                end

                if animDict and animName then
                    lib.requestAnimDict(animDict)
                    TaskPlayAnim(cache.ped, animDict, animName, 1.0, -1, -1, 49, 0, false, false, false)
                end

                -- Progress bar and effect application
                local finished = exports["erp_progressbar"]:taskBar({
                    length = math.random(effectData.length.min, effectData.length.max),
                    text = effectData.text,
                    disable = { combat = true }
                }) == 100

                ClearPedTasks(cache.ped)
                if prop then
                    DeleteObject(prop)
                end
                if hungerProp then
                    DeleteObject(hungerProp)
                end
                if finished then
                    TriggerServerEvent('ox_inventory:removeItem', itemName, 1)    
                    if effectData.hunger then
                        local hungerAmount = effectData.hunger
                        LocalPlayer.state.hunger = math.min(100, (LocalPlayer.state.hunger or 0) + hungerAmount)
                    end
                
                    -- Update thirst
                    if effectData.thirst then
                        local thirstAmount = effectData.thirst
                        LocalPlayer.state.thirst = math.min(100, (LocalPlayer.state.thirst or 0) + thirstAmount)
                    end
                
                    -- Update stress
                    if effectData.stress then
                        local stressAmount = effectData.stress
                        TriggerServerEvent('hud:server:RelieveStress', stressAmount)
                    end
                    
                    if effectData.alcohol then
                        local duration = effectData.alcohol * 60 -- Convert to seconds
                        TriggerEvent('evidence:client:SetStatus', 'Visibly Drunk', duration* 1000, nil, 'You appear visibly intoxicated.')
                        print('Alcohol effect applied for ' .. duration .. ' seconds.')

                        -- Set drunk visual effect (optional)
                        SetPedMotionBlur(cache.ped, true)

                        -- Remove alcohol effect after duration
                        SetTimeout(duration * 1000, function()
                            SetPedMotionBlur(cache.ped, false)
                            print('Alcohol effect removed.')
                        end)
                    end

                    -- Apply caffeine effect
                    if effectData.caffeine then
                        local duration = effectData.caffeine * 60 -- Convert to seconds
                        LocalPlayer.state.caffeinated = true
                        print('Caffeine effect applied for ' .. duration .. ' seconds.')
                        TriggerEvent('evidence:client:SetStatus', 'Caffeinated', duration * 1000, nil, 'Caffeinated.')
                        -- Remove caffeine effect after duration
                        SetTimeout(duration * 1000, function()
                            LocalPlayer.state.caffeinated = false
                            print('Caffeine effect removed.')
                        end)
                    end

                    -- Optionally handle any other effects (like armor)
                    if effectData.armour then
                        local armour = GetPedArmour(cache.ped)
                        SetPedArmour(cache.ped, math.min(100, armour + effectData.armour))
                    end

                    -- Notify player of success
                    print(itemName .. ' used successfully.')
                else
                    print(itemName .. ' usage was canceled.')
                end
            else
                print('Effect data not found for ' .. itemName)
            end
        end)
    else
        print('Effect data not found for ' .. itemName)
    end
end


-- Define Items
for itemName in pairs(effects) do
    Item(itemName, function(data, slot)
        useEffectItem(itemName, data, slot)
    end)
end

-- End of custom items





client.parachute = false
Item('parachute', function(data, slot)
    if not client.parachute then
        ox_inventory:useItem(data, function(data)
            if data then
                local chute = `GADGET_PARACHUTE`
                SetPlayerParachuteTintIndex(PlayerData.id, -1)
                GiveWeaponToPed(cache.ped, chute, 0, true, false)
                SetPedGadget(cache.ped, chute, true)
                lib.requestModel(1269906701)
                client.parachute = { CreateParachuteBagObject(cache.ped, true, true), slot?.metadata?.type or -1 }
                if slot.metadata.type then
                    SetPlayerParachuteTintIndex(PlayerData.id, slot.metadata.type)
                end
            end
        end)
    end
end)

Item('phone', function(data, slot)
    local success, result = pcall(function()
        return exports.npwd:isPhoneVisible()
    end)

    if success then
        exports.npwd:setPhoneVisible(not result)
    end
end)

Item('clothing', function(data, slot)
    local metadata = slot.metadata

    if not metadata.drawable then return print('Clothing is missing drawable in metadata') end
    if not metadata.texture then return print('Clothing is missing texture in metadata') end

    if metadata.prop then
        if not SetPedPreloadPropData(cache.ped, metadata.prop, metadata.drawable, metadata.texture) then
            return print('Clothing has invalid prop for this ped')
        end
    elseif metadata.component then
        if not IsPedComponentVariationValid(cache.ped, metadata.component, metadata.drawable, metadata.texture) then
            return print('Clothing has invalid component for this ped')
        end
    else
        return print('Clothing is missing prop/component id in metadata')
    end

    ox_inventory:useItem(data, function(data)
        if data then
            metadata = data.metadata

            if metadata.prop then
                local prop = GetPedPropIndex(cache.ped, metadata.prop)
                local texture = GetPedProptextureIndex(cache.ped, metadata.prop)

                if metadata.drawable == prop and metadata.texture == texture then
                    return ClearPedProp(cache.ped, metadata.prop)
                end

                -- { prop = 0, drawable = 2, texture = 1 } = grey beanie
                SetPedPropIndex(cache.ped, metadata.prop, metadata.drawable, metadata.texture, false);
            elseif metadata.component then
                local drawable = GetPedDrawableVariation(cache.ped, metadata.component)
                local texture = GetPedtextureVariation(cache.ped, metadata.component)

                if metadata.drawable == drawable and metadata.texture == texture then
                    return -- item matches (setup defaults so we can strip?)
                end

                -- { component = 4, drawable = 4, texture = 1 } = jeans w/ belt
                SetPedComponentVariation(cache.ped, metadata.component, metadata.drawable, metadata.texture, 0);
            end
        end
    end)
end)

Item('WEAPON_PROLASER4', function (data, slot)
    ox_inventory:useItem(data, function (data)
        if data then
            exports.erp_notifications:SendAlert('inform', 'Use /lidar to toggle UI')
        end
    end)
end)

-----------------------------------------------------------------------------------------------

exports('Items', function(item) return getItem(nil, item) end)
exports('ItemList', function(item) return getItem(nil, item) end)

return Items
