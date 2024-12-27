-- Weapon Recoil: Recoil (vertical and horizontal) for individual weapon; 0.0 means no recoil at all, 0.1 means default
-- If horizontal is to 0.1 (or .1), you don't need to define it here
-- I did for the first weapon here so we're aware it's an option

local WeaponRecoil = {

	[`weapon_tacticalrifle`] = {
		vertical = .31,
		horizontal = .15
	},
	[`weapon_MK18`] = {
		vertical = .15,
	},
	[`weapon_specialcarbine`] = {
		vertical = .11,
	},
	[`weapon_heavyrifle`] = {
		vertical = .19,
	},
	[`weapon_glock17`] = {
		vertical = .21,
	},
	[`weapon_fnx45`] = {
		vertical = .21,
	},
	[`WEAPON_GLOCK18`] = {
		vertical = .80,
		horizontal = .20
	},
	[`weapon_minismg`] = {
		vertical = .80,
	},
	[`WEAPON_TEC9`] = {
		vertical = .20,
	},
	[`weapon_combatmg`] = {
		vertical = .15,
	},
	[`weapon_m249`] = {
		vertical = .15,
	},
	[`weapon_m60`] = {
		vertical = .15,
	},
	[`weapon_assaultrifle`] = {
		vertical = .23,
	},
	[`weapon_rpg`] = {
		vertical = .48,
	},
	[`weapon_combatpdw`] = {
		vertical = .11,
	},
	[`weapon_assaultsmg`] = {
		vertical = .18,
	},
	[`weapon_smg_mk2`] = {
		vertical = .26,
	},
	[`weapon_microsmg`] = {
		vertical = .48,
	},
	[`weapon_carbinerifle_mk2`] = {
		vertical = .30,
		horizontal = .14
	},
	[`weapon_mp5`] = {
		vertical = .26,
		
	},
}

-- Group recoil: This is the recoil for the group overall if it is lacking an invidivual weapon recoil; 0.0 means no recoil at all

local GroupRecoilConfig = {
	[416676503] = {
		vertical = .20,
	}, -- Handgun
	[-957766203] = {
		vertical = .17,
	}, -- Submachine
	[860033945] = {
		vertical = .22,
	}, -- Shotgun
	[970310034] = {
		vertical = .17,
	}, -- Assault Rifle
	[1159398588] = {
		vertical = .18,
	}, -- LMG
	[3082541095] = {
		vertical = .15,
	}, -- Sniper
	[2725924767] = {
		vertical = .3,
	} -- Heavy
}
local GroupRecoil = {table.unpack(GroupRecoilConfig)}

local function ChangeWeaponGroupRecoil(group, vertical)
    GroupRecoil[group] = { vertical = vertical }
end

local function GetStressRecoil()
    
    return 0.625
    
end


local isMoving = false
local storedRecoils = {}

CreateThread(function()
	local IsPedArmed = IsPedArmed
	local IsPedShooting = IsPedShooting
	local GetCurrentPedWeapon = GetCurrentPedWeapon
	local GetEntitySpeed = GetEntitySpeed
	local GetGameplayCamRelativeHeading = GetGameplayCamRelativeHeading
	local GetGameplayCamRelativePitch = GetGameplayCamRelativePitch
	local GetFollowPedCamViewMode = GetFollowPedCamViewMode
	local GetVehicleClass = GetVehicleClass
	local GetWeapontypeGroup = GetWeapontypeGroup
	local GetWeaponRecoilShakeAmplitude = GetWeaponRecoilShakeAmplitude
	local SetWeaponRecoilShakeAmplitude = SetWeaponRecoilShakeAmplitude
	local SetGameplayCamRelativeHeading = SetGameplayCamRelativeHeading
	local SetGameplayCamRelativePitch = SetGameplayCamRelativePitch

	while true do
		local isArmed = IsPedArmed(plyPed, 4) -- Checking if they are armed
		local _, weapon = GetCurrentPedWeapon(plyPed, true) -- Get's the ped's weapon

		Wait(isArmed and 0 or 1000) -- Optimization reasons

		if isArmed and not plyVeh.id then
			if storedRecoils[weapon] then
				SetWeaponRecoilShakeAmplitude(weapon, storedRecoils[weapon])
				storedRecoils[weapon] = nil
			end
		elseif isArmed and plyVeh.id then
			if not storedRecoils[weapon] then
				storedRecoils[weapon] = GetWeaponRecoilShakeAmplitude(weapon)
				SetWeaponRecoilShakeAmplitude(weapon, 4.5)
			end
		end

		if isArmed and IsPedShooting(plyPed) then -- Check if they are armed and dangerous (shooting)
			local movementSpeed = math.ceil( GetEntitySpeed(plyPed) ) -- Getting the speed of the ped

			local stressRecoil = GetStressRecoil() -- Grab recoil multiplier based on stress

			local camHeading = GetGameplayCamRelativeHeading()
			-- local headingFactor = math.random(10,40+movementSpeed)/100

			local horizontalFactor = 0

			if movementSpeed <= 1 then
				horizontalFactor = math.random(14, 19)
			elseif movementSpeed <= 2 then
				horizontalFactor = math.random(20, 30)
			elseif movementSpeed <= 3 then
				horizontalFactor = math.random(32, 40)
			else
				horizontalFactor = math.random(41, 50)
			end

			horizontalFactor /= 100

			local weaponRecoil = WeaponRecoil[ weapon ] or GroupRecoil[ GetWeapontypeGroup(weapon) ] or { vertical = 0.1, horizontal = 0.1 }
			local horizontalRecoil = (horizontalFactor * stressRecoil) * ((weaponRecoil.horizontal or 0.1) * 10)

			local rightLeft = math.random(1, 4) -- Chance to move left or right
			if rightLeft == 1 then -- If chance is 1, move right
				SetGameplayCamRelativeHeading(camHeading + horizontalRecoil)
			elseif rightLeft == 3 then -- If chance is 3, move left
				SetGameplayCamRelativeHeading(camHeading - horizontalRecoil)
			end

			if not isMoving then -- Checks if the recoil is already being vertically adjusted
				isMoving = true -- Sets the moving var to true

				local farRange = math.ceil( 75 + (movementSpeed * 1.5) ) -- Faster the player is moving, the higher the random range for recoil
				local recoil = math.random(50, farRange) / 100 -- Random math from 50-farRange and then divides by 100

				local finalRecoilTarget = (recoil * (weaponRecoil.vertical * 10)) * stressRecoil -- Working out the target for recoil
				if GetFollowPedCamViewMode() == 4 then
					finalRecoilTarget = finalRecoilTarget / 9.5
				end

				local isBike = plyVeh.class == 13 or plyVeh.class == 8

				CreateThread(function()
					local currentRecoil = 0.0 -- Sets a default value for current recoil at 0

					repeat
						Wait(0)

						local bump = math.random(5, 20) / 100

						SetGameplayCamRelativePitch(GetGameplayCamRelativePitch()+(isBike and (math.random(27, 32) / 10) or bump), 0.2) -- Move the camera pitch up by 0.1
						currentRecoil += bump -- Increment current recoil
					until currentRecoil >= finalRecoilTarget -- Repeat until the currentRecoil variable reaches the desirred recoil target

					isMoving = false -- Sets the moving var to false	
				end)
			end
		end
	end
end)

RegisterNetEvent('echo_combat:changeWeaponGroupRecoil', function(group, data)
    if data == 'reset' then
        ChangeWeaponGroupRecoil(group, GroupRecoilConfig[group])
        print('Weapon group ('..group..') recoil reset to default')
        return
    end

    ChangeWeaponGroupRecoil(group, data)
    print('Weapon group ('..group..') recoil changed to '..json.encode(data))
end)
