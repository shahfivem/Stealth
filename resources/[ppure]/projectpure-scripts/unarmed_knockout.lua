--┌≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈┐
--│                                                       │
--│  #     Knocked Out                                    │
--│                                                       │
--│                                                       │
--│  Knockout With effect {When knocked out,              │ 
--│        While knocked out}                             │
--│                                                       │
--│                                                       │
--│                                                       │
--│                                                       │
--│               			                  │ 
--│  @ Modification upon need by Rango!(zaki)             │
--│                                                       │
--│  Contact (discord) : Zaki#1196                        │
--│                                                       │
--└≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈┘

local knockedOut = false
local wait = 07
local count = 60

Citizen.CreateThread(function()
    while true do
        -- Wait(1)
        local sleep = 1
        local active = false
        local myPed = PlayerPedId()
        -- With melee weapon or unarmed only
        if IsPedInMeleeCombat(myPed) then
            active = true
            -- Without any kind of weapon {UNARMED ONLY}
            if (HasPedBeenDamagedByWeapon(myPed, GetHashKey(`WEAPON_UNARMED`, `WEAPON_BATON`, `WEAPON_BAT`, `WEAPON_KNUCKLE`, `WEAPON_FLASHLIGHT`, `WEAPON_BLUELIGHT`), 0)) then
                active = true
                -- Health to be knocked out
                if GetEntityHealth(myPed) < 135 then
                    active = true
                    SetPlayerInvincible(PlayerId(), false)
                    -- Position taken by your Ped
                    SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
                    --  Effect
                    ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 2.5)
                    -- Time to wait
                    wait = 07
                    TaskPlayAnim(myPedm, 'random@mugging4', 'flee_backward_loop_shopkeeper', 3)
                    knockedOut = true
                    -- Health af-ter knockout preferably dont make it more than 150 (50 %) because people will abuse with it {No need to go to hospital or so}
                    SetEntityHealth(myPed, 140)
                end
            end
        end

        if knockedOut == true then
            active = true
            --Your ped is able to die
            SetPlayerInvincible(PlayerId(), false)
            DisablePlayerFiring(PlayerId(), true)
            SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
            ResetPedRagdollTimer(myPed)
            -- Red Cam
            SetTimecycleModifier("REDMIST")
            -- Cam vibration
            ShakeGameplayCam("VIBRATE_SHAKE", 1.0)
            if wait >= 0 then
                count = count - 1
                if count == 0 then

                    count = 60
                    wait = wait - 1
                    --- in case bark
                    if GetEntityHealth(myPed) <= 50 then
                        -- Ped healing 
                        SetEntityHealth(myPed, GetEntityHealth(myPed) + 2)

                    end
                end
            else
                -- Remove red cam
                SetTimecycleModifier("")
                SetTransitionTimecycleModifier("")
                ClearPedTasks(myPed)
                SetPlayerInvincible(PlayerId(), false)
                knockedOut = false
            end
        end
        if not active then
            wait = 200
        end
        Wait(sleep)

    end
end)
