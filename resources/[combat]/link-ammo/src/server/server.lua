local inv = exports.ox_inventory

for key, ammo in pairs(Shared.Ammo) do
    exports(key, function(event, item, inventory, slot, data)
        if event == 'usingItem' then
            local cGun = inv:GetCurrentWeapon(inventory.id)

            -- Check if cGun is nil before proceeding with comparisons
            if not cGun then
                TriggerClientEvent('ox_lib:notify', inventory.id, {description = 'No Weapon equipped!', type = 'error'})
                return false
            end

            if cGun.metadata.ammo and cGun.metadata.ammo >= 250 then
                TriggerClientEvent('ox_lib:notify', inventory.id, {description = 'Weapon full!', type = 'error'})
                return false
            else
                for _, weapon in ipairs(ammo.weapons) do
                    if cGun.name == weapon then
                        TriggerClientEvent('link-ammo:progressbar', inventory.id, cGun.label, ammo.amount)
                        return true
                    end
                end
                TriggerClientEvent('ox_lib:notify', inventory.id, {description = 'Wrong Weapon equipped!', type = 'error'})
                return false
            end
        end

        if event == 'usedItem' then
            local cGun = inv:GetCurrentWeapon(inventory.id)

            -- Make sure cGun and its metadata exist before adding ammo
            if cGun and cGun.metadata then
                Wait(3500)
                cGun.metadata.ammo = (cGun.metadata.ammo or 0) + ammo.amount
                inv:SetMetadata(inventory.id, cGun.slot, cGun.metadata)
                SetPedAmmo(GetPlayerPed(inventory.id), cGun.name, cGun.metadata.ammo)
            else
                TriggerClientEvent('ox_lib:notify', inventory.id, {description = 'Error adding ammo to the weapon!', type = 'error'})
            end
        end
    end)
end

