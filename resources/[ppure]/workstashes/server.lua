-- Stashes configuration
local stashes = {
    {
        id = 'taco_hut',
        label = 'Taco Hut Food',
        slots = 100,
        weight = 50000,
        groups = { taco = 0 }, -- Group required to access the stash
        owner = false,
    },
    {
        id = 'blackwoods_food',
        label = 'Blackwoods Food',
        slots = 100,
        weight = 50000,
        groups = { blackwoods = 0 }, -- Group required to access the stash
        owner = false,
    },
    {
        id = 'soochies_food',
        label = 'Soochies Food',
        slots = 100,
        weight = 50000,
        groups = { soochi = 0 }, -- Group required to access the stash
        owner = false,
    },
    {
        id = 'enchanted_shop',
        label = 'Enchanted Shop',
        slots = 100,
        weight = 50000,
        groups = { enchanted = 0 }, -- Group required to access the stash
        owner = false,
    },
    {
        id = 'just_chilling',
        label = 'Just Chilling',
        slots = 100,
        weight = 50000,
        groups = { justchilling = 0 }, -- Group required to access the stash
        owner = false,
    },
    {
        id = 'emsstore',
        label = 'EMS Insurance',
        slots = 100,
        weight = 50000,
        owner = false,
    },
}

-- Register predefined stashes on server start
AddEventHandler('onServerResourceStart', function(resourceName)
    if resourceName == 'ox_inventory' or resourceName == GetCurrentResourceName() then
        for _, stash in ipairs(stashes) do
            exports.ox_inventory:RegisterStash(stash.id, stash.label, stash.slots, stash.weight, stash.owner, stash.groups)
        end
    end
end)

-- Cache for created PD Rack stashes
local createdPDRackStashes = {}

local function createPDRackStash(vehiclePlate)
    local stashId = ('PD RACK_%s'):format(vehiclePlate)

    if createdPDRackStashes[stashId] then
        return
    end

    exports.ox_inventory:RegisterStash(
        stashId, 
        ('PD Rack - %s'):format(vehiclePlate),
        50,
        20000,
        false,
        { police = 0 }
    )

    createdPDRackStashes[stashId] = true
    print(('Stash registered: %s'):format(stashId))
end

RegisterNetEvent('createPDRackStash', function(vehiclePlate)
    local src = source

    if not vehiclePlate or vehiclePlate == '' then
        print('Invalid vehicle plate from player:', src)
        return
    end

    createPDRackStash(vehiclePlate)
end)





-- EMS
-- Server-side event to handle player revival using the qbx_medical export
RegisterNetEvent('medical:server:revivePlayer', function(targetPlayerId)
    if targetPlayerId then
        -- Call the qbx_medical:Revive export
        exports.qbx_medical:Heal(targetPlayerId)
        print(('Revived player with ID: %s'):format(targetPlayerId))
    else
        print('Error: Invalid target player ID passed to medical:server:revivePlayer')
    end
end)

