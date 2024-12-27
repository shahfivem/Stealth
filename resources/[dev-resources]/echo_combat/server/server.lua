RegisterNetEvent('echo_combat:purchaseAttachments', function(data)
    local src = source
    local weaponSlot = data.weaponSlot
    local newAttachments = data.attachmentData

    -- Retrieve the player's current weapon from the specified slot
    local currentWeapon = exports.ox_inventory:GetItem(src, weaponSlot)

    if currentWeapon and currentWeapon.metadata then
        -- Initialize or update the attachments metadata
        currentWeapon.metadata.attachments = newAttachments

        -- Use ox_inventory to update the metadata dynamically
        exports.ox_inventory:SetMetadata(src, weaponSlot, currentWeapon.metadata)

        -- Notify the player of success
        TriggerClientEvent('ox_lib:notify', src, {type = 'success', description = 'Weapon attachments updated!'})
    else
        -- Notify the player if the update failed
        TriggerClientEvent('ox_lib:notify', src, {type = 'error', description = 'Failed to update attachments. Ensure you have the weapon equipped.'})
    end
end)
