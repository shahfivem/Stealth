-- Handles the creation of airdrops
RegisterNetEvent('airdrops:create', function(coords)
    local src = source
    -- Broadcast to all clients to spawn an airdrop at the given location
    TriggerClientEvent('airdrops:newDrop', -1, nil, coords)
end)

-- Handles cleanup for an airdrop
RegisterNetEvent('airdrops:removeDrop', function()
    -- Notify all clients to clean up the active airdrop
    TriggerClientEvent('airdrops:removeDrop', -1)
end)

-- Define the loot table
local lootTable = {
        {
            items = {
                { item = 'WEAPON_MICROSMG', quantity = 2 },
                { item = 'subammo', quantity = 5 }
            },
            chance = 50
        },
        {
            items = {
                { item = 'WEAPON_ASSAULTRIFLE', quantity = 2 },
                { item = 'rifleammo', quantity = 5 }
            },
            chance = 15
        },
        {
            items = {
                { item = 'rifleammo', quantity = 3 },
                { item = 'WEAPON_HEAVYRIFLE', quantity = 1 }
            },
            chance = 15
        },
        -- New Guns and Ammunition
        {
            items = {
                { item = 'WEAPON_SMG', quantity = 2 },
                { item = 'subammo', quantity = 6 }
            },
            chance = 25
        },
        {
            items = {
                { item = 'WEAPON_ASSAULTSHOTGUN', quantity = 1 },
                { item = 'shotgunammo', quantity = 3 }
            },
            chance = 20
        },
        {
            items = {
                { item = 'WEAPON_ADVANCEDRIFLE', quantity = 1 },
                { item = 'rifleammo', quantity = 5 }
            },
            chance = 10
        },
    }    

-- Function to calculate loot based on the loot table
function getLoot()
    local roll = math.random(1, 100) -- Generate a random number between 1 and 100
    local cumulative = 0

    for _, loot in ipairs(lootTable) do
        cumulative = cumulative + loot.chance
        if roll <= cumulative then
            return loot.items
        end
    end
    return {} -- No loot if no conditions are met
end

-- Register callback for airdrops:collect
lib.callback.register('airdrops:collect', function(source)
    local lootItems = getLoot()

    if #lootItems > 0 then
        for _, loot in ipairs(lootItems) do
            local success = exports.ox_inventory:AddItem(source, loot.item, loot.quantity)
            if not success then
                -- Optionally notify the player about failed items
                exports.qbx_core:Notify("Screenshot this and open a ticket. Failed to add " .. loot.item, 'error', 8000)
            end
        end
        return true -- At least one item was added
    else
        return false -- No loot
    end
end)


