local currentAmmo = {}

local currentAmmo = {}

RegisterNetEvent('echo_combat:setWeaponInfo', function(weaponId, information)
    local currentWeapon = exports.ox_inventory:getCurrentWeapon()
    if not currentWeapon or weaponId ~= currentWeapon.slot then return end

    local metadata = currentWeapon.metadata or {}
    local currentMagazine = metadata.magazine or 0
    local ammo = 0

    -- Update ammo based on provided information
    if information.ammo and not information.magazine then
        ammo = math.ceil(information.ammo)
    elseif currentMagazine ~= information.magazine then
        ammo = currentMagazine -- Use current magazine if information doesn't contain ammo
    end

    -- Update weapon metadata with ammo and magazine
    metadata.ammo = ammo
    metadata.magazine = information.magazine or currentMagazine

    -- Check if attachments are part of the information
    if information.components then
        metadata.components = information.components
    end

    -- Update the inventory metadata
    exports.ox_inventory:SetMetadata(currentWeapon.slot, metadata)

    print('Weapon Metadata Updated:', json.encode(metadata))
end)


local function handleWeaponUsage(slot, data)
    local item = PlayerData.inventory[slot]
    if not item then return end

    local weapon = exports.ox_inventory:getCurrentWeapon()
    if not weapon then return lib.notify({type = 'error', description = 'No weapon equipped.'}) end

    if data.component then
        -- Handle attachments
        local components = data.client.component
        if not components then return end

        for _, component in ipairs(components) do
            if DoesWeaponTakeWeaponComponent(weapon.hash, component) and not HasPedGotWeaponComponent(PlayerPedId(), weapon.hash, component) then
                GiveWeaponComponentToPed(PlayerPedId(), weapon.hash, component)

                -- Add to metadata
                table.insert(weapon.metadata.components, component)
                exports.ox_inventory:SetMetadata(slot, weapon.metadata)

                lib.notify({type = 'success', description = 'Attachment applied successfully!'})
                return
            end
        end

        lib.notify({type = 'error', description = 'Failed to apply attachment. Component incompatible or already applied.'})
    end
end




exports('getWeaponData', function()
    return exports.ox_inventory:getCurrentWeapon()
end)

lib.callback.register('echo_combat:getWeaponData', function()
    return exports.ox_inventory:getCurrentWeapon()
end)

