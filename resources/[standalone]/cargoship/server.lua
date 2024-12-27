local createdStashes = {} -- Tracks all registered stashes
local Config = {
    EventInterval = 30 * 60 * 1000, -- 30-minute cooldown
    EventDuration = 30 * 60 * 1000, -- 30-minute event duration
    CratePositions = Cargo.Config.CratePositions,
    HealthPackPositions = Cargo.Config.HealthPackZones
}
local eventCooldown = false -- Track if the event is on cooldown
-- Server event to register cargo crate stashes
RegisterNetEvent('cargoship:server:RegisterCrateStash', function(crateId, pos)
    local stashId = "cargo_stash_" .. crateId
    local src = source
    -- Select a random tier for the loot
    local tier = math.random(1, 4)
    local lootTier = Cargo.Config["WeaponsTier" .. tier]

    -- Register the stash with ox_inventory
    exports.ox_inventory:RegisterStash(stashId, "Cargo Crate", 20, 2000)

    -- Add random loot from the selected tier
    for _, item in ipairs(lootTier) do
        exports.ox_inventory:AddItem(stashId, item.name, item.quantity)
    end

    -- Track the stash
    table.insert(createdStashes, stashId)

    -- Notify client
    TriggerClientEvent('ox_lib:notify', src, {
        text = "[CargoShip] Stash is ready to loot.",
        duration = 5000,
        type = 'success'
    })
    TriggerClientEvent('cargoship:client:SetupLootTarget', -1, crateId, pos, stashId)

    print("[CargoShip] Registered Stash with Tier " .. tier .. " for crate: " .. crateId)
end)

-- Server event to register health pack stashes
RegisterNetEvent('healthpacks:server:RegisterHealthCrate', function(crateId, pos)
    local stashId = "health_stash_" .. crateId
    local src = source
    -- Use HealthPackItems from the config for loot
    local lootItems = Cargo.Config.HealthPackItems

    -- Register the stash with ox_inventory
    exports.ox_inventory:RegisterStash(stashId, "Health Crate", 10, 1000)

    -- Add loot items to the stash
    for _, item in ipairs(lootItems) do
        exports.ox_inventory:AddItem(stashId, item.name, item.quantity)
    end

    -- Track the stash
    table.insert(createdStashes, stashId)

    -- Notify client
    TriggerClientEvent('healthpacks:client:SetupLootTarget', -1, crateId, pos, stashId)

    print("[HealthPacks] Registered health crate: " .. stashId .. " at position: " .. json.encode(pos))
end)

-- Server event to clean up all stashes
RegisterNetEvent('cargoship:server:ClearAllStashes', function()
    for _, stashId in ipairs(createdStashes) do
        exports.ox_inventory:ClearInventory(stashId) -- Clear all items from the stash
        print("[Cleanup] Cleared inventory for stash: " .. stashId)
    end

    -- Reset the stash tracker
    createdStashes = {}

    -- Notify admins or players (if needed)
    TriggerClientEvent('ox_lib:notify', -1, {
        text = "[CargoShip] All event stashes have been cleaned up.",
        duration = 5000,
        type = 'inform'
    })
end)


RegisterNetEvent('guards:server:LootWeapon', function ()
    exports.ox_inventory:AddItem({source, Cargo.Config.GuardWeapon, 1})
end)


Citizen.CreateThread(function()
    while true do
        if not eventCooldown then
            CleanupEvent()
            Wait(360 * 1000)
            StartEvent()
            eventCooldown = true
            Citizen.Wait(Config.EventDuration + Config.EventInterval)
            eventCooldown = false
        else
            Citizen.Wait(1000)
        end
    end
end)
