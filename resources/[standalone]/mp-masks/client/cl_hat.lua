local function HatOn(data, slot)
    local metadata = slot.metadata
    if not metadata or not metadata.drawableId then
        print("This hat has no data. Do not spawn it in. Instead, go to a clothing store then remove the hat")
        return
    end

    local currentHat = GetPedPropIndex(cache.ped, 0)
    if currentHat ~= -1 then
        -- Remove the current hat
        local currentTexture = GetPedPropTextureIndex(cache.ped, 0)
        
        RequestAnimDict('veh@common@fp_helmet@')
        while not HasAnimDictLoaded('veh@common@fp_helmet@') do Wait(0) end
        lib.notify({
            text = 'Replacing Hat',
            type = 'inform',
            duration = 2000
        })
        TaskPlayAnim(cache.ped, "veh@common@fp_helmet@", "take_off_helmet_stand", 3.5, -8, -1, 49, 0, 0, 0, 0)
        Citizen.Wait(800)
        ClearPedProp(cache.ped, 0)
        Citizen.Wait(400)
        ClearPedTasks(cache.ped)

        -- Return the current hat to the player's inventory
        TriggerServerEvent("mp-masks:server:GiveHatItem", currentHat, currentTexture)
    end

    -- Equip the new hat
    exports.ox_inventory:useItem(data, function(data)
        if data then
            RequestAnimDict('missheistdockssetup1hardhat@')
            while not HasAnimDictLoaded('missheistdockssetup1hardhat@') do Wait(0) end

            metadata = data.metadata
            TaskPlayAnim(cache.ped, "missheistdockssetup1hardhat@", "put_on_hat", 3.5, -8, -1, 49, 0, 0, 0, 0)
            Citizen.Wait(1300)
            SetPedPropIndex(cache.ped, 0, metadata.drawableId, metadata.textureId, true)
            ClearPedTasks(cache.ped)

            if GetResourceState('illenium-appearance') ~= 'started' then return end
            local appearance = exports['illenium-appearance']:getPedAppearance(cache.ped)
            TriggerServerEvent("illenium-appearance:server:saveAppearance", appearance)
        end
    end)
end
exports('hat', HatOn)

local function HatOff(hat, tex)
    if GetPedPropIndex(cache.ped, 0) == -1 then
        exports.qbx_core:Notify("You are not wearing a hat", "error")
        return
    end

    RequestAnimDict('veh@common@fp_helmet@')
    while not HasAnimDictLoaded('veh@common@fp_helmet@') do Wait(0) end

    local HatDrawable, HatTexture = GetPedPropIndex(cache.ped, 0), GetPedPropTextureIndex(cache.ped, 0)
    TaskPlayAnim(cache.ped, "veh@common@fp_helmet@", "take_off_helmet_stand", 3.5, -8, -1, 49, 0, 0, 0, 0)
    Citizen.Wait(800)
    ClearPedProp(cache.ped, 0)
    Citizen.Wait(400)
    ClearPedTasks(cache.ped)

    TriggerServerEvent("mp-masks:server:GiveHatItem", HatDrawable, HatTexture)

    if GetResourceState('illenium-appearance') ~= 'started' then return end
    local appearance = exports['illenium-appearance']:getPedAppearance(cache.ped)
    TriggerServerEvent("illenium-appearance:server:saveAppearance", appearance)
end

local function ToggleHat()
    local hat = GetPedPropIndex(cache.ped, 0)
    local tex = GetPedPropTextureIndex(cache.ped, 0)

    local hasHat = exports.ox_inventory:Search('count', 'hat')

    if hat == -1 then
        if hasHat >= 1 then
            HatOn()
        else
            exports.qbx_core:Notify("You don't have a hat", "error")
        end
    else
        HatOff(hat, tex)
    end
end

RegisterCommand("hat", function()
    ToggleHat()
end, false)
