RegisterNetEvent('link-ammo:progressbar')
AddEventHandler('link-ammo:progressbar', function(weaponLabel, amount)
    local playerPed = PlayerPedId()
    if IsPedArmed(playerPed, 6) then
        local finished = exports.erp_progressbar:taskBar({
            length = 3500,
            text = ('Loading %s rounds'):format(amount),
            keepweapon = true,
            stopRunning = true
        })

        if finished == 100 then
            TriggerEvent('link-ammo:reload')
        end
    else
        TriggerEvent('ox_lib:notify', {description = 'You are not armed!', type = 'error'})
    end
end)


-- Registering the reload event
RegisterNetEvent('link-ammo:reload')
AddEventHandler('link-ammo:reload', function()
    local playerPed = PlayerPedId()
    if IsPedArmed(playerPed, 6) then
        MakePedReload(playerPed)
    elseif not IsPedArmed(playerPed, 6) then
        TriggerEvent('ox_lib:notify', {description = 'You are not armed!', type = 'error'})
    end
end)

-- Flag to track whether a reload has been triggered
local hasReloaded = false

local function autoReloadIfEmpty()
    local playerPed = PlayerPedId() -- Get the player's ped
    local weaponHash = GetSelectedPedWeapon(playerPed)
    local _, ammoInClip = GetAmmoInClip(playerPed, weaponHash)

    if ammoInClip == 0 and not hasReloaded then
        -- Trigger a reload and set the flag
        MakePedReload(playerPed)
        hasReloaded = true
    elseif ammoInClip > 0 and hasReloaded then
        -- Reset the flag when ammo is replenished
        hasReloaded = false
    end
end

-- Monitor ammo periodically
CreateThread(function()
    while true do
        Wait(500) -- Check every half a second
        local playerPed = PlayerPedId() -- Only valid on the client
        if IsPedArmed(playerPed, 4) then -- Check if the player has a gun
            autoReloadIfEmpty()
        end
    end
end)

