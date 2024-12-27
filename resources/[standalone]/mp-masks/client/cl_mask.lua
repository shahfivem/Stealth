local function MaskOn(data, slot)
    local metadata = slot.metadata
    if not metadata or not metadata.drawableId then
        print("This mask has no data. Do not spawn it in. Instead, go to a clothing store then remove the mask")
        return
    end

    local currentMask = GetPedDrawableVariation(cache.ped, 1)
    if currentMask ~= 0 then
        -- If already wearing a mask, remove the current one first
        local currentTexture = GetPedTextureVariation(cache.ped, 1)
        local currentPalette = GetPedPaletteVariation(cache.ped, 1)
        
        RequestAnimDict('missfbi4')
        while not HasAnimDictLoaded('missfbi4') do Wait(0) end
        lib.notify({
            text = 'Replacing Mask',
            type = 'inform',
            duration = 2000
        })
        TaskPlayAnim(cache.ped, "missfbi4", "takeoff_mask", 3.5, -8, -1, 49, 0, 0, 0, 0)
        Citizen.Wait(1000)
        SetPedComponentVariation(cache.ped, 1, 0, 0, currentPalette)
        ClearPedTasks(cache.ped)

        -- Return the current mask item to the player
        TriggerServerEvent("mp-masks:server:GiveMaskItem", currentMask, currentTexture)
    end

    -- Equip the new mask
    exports.ox_inventory:useItem(data, function(data)
        if data then
            RequestAnimDict('mp_masks@on_foot')
            while not HasAnimDictLoaded('mp_masks@on_foot') do Wait(0) end

            metadata = data.metadata
            TaskPlayAnim(cache.ped, "mp_masks@on_foot", "put_on_mask", 3.5, -8, -1, 49, 0, 0, 0, 0)
            Citizen.Wait(500)
            SetPedComponentVariation(cache.ped, 1, metadata.drawableId, metadata.textureId)
            ClearPedTasks(cache.ped)

            if GetResourceState('illenium-appearance') ~= 'started' then return end
            local appearance = exports['illenium-appearance']:getPedAppearance(cache.ped)
            TriggerServerEvent("illenium-appearance:server:saveAppearance", appearance)
        end
    end)
end
exports('mask', MaskOn)

local function MaskOff(mask, tex)
    if GetPedDrawableVariation(cache.ped, 1) == 0 then
        exports.qbx_core:Notify("You are not wearing a mask", "error")
        return
    end

    RequestAnimDict('missfbi4')
    while not HasAnimDictLoaded('missfbi4') do Wait(0) end

    local MaskDrawable, MaskTexture, MaskPalette = GetPedDrawableVariation(cache.ped, 1), GetPedTextureVariation(cache.ped, 1), GetPedPaletteVariation(cache.ped, 1)
    TaskPlayAnim(cache.ped, "missfbi4", "takeoff_mask", 3.5, -8, -1, 49, 0, 0, 0, 0)
    Citizen.Wait(1000)
    SetPedComponentVariation(cache.ped, 1, 0, 0, MaskPalette)
    ClearPedTasks(cache.ped)

    TriggerServerEvent("mp-masks:server:GiveMaskItem", MaskDrawable, MaskTexture)

    if GetResourceState('illenium-appearance') ~= 'started' then return end
    local appearance = exports['illenium-appearance']:getPedAppearance(cache.ped)
    TriggerServerEvent("illenium-appearance:server:saveAppearance", appearance)
end

local function ToggleMask()
    local mask = GetPedDrawableVariation(cache.ped, 1)
    local tex = GetPedTextureVariation(cache.ped, 1)

    local hasMask = exports.ox_inventory:Search('count', 'mask')

    if mask == 0 then
        if hasMask >= 1 then
            MaskOn()
        else
            exports.qbx_core:Notify("You don't have a mask", "error")
        end
    else
        MaskOff(mask, tex)
    end
end

RegisterCommand("mask", function()
    ToggleMask()
end, false)
