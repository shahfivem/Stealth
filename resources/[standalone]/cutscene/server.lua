RegisterNetEvent('givestarterpistol', function()
    local playerId = source -- The player's server ID
    local success, response = exports.ox_inventory:AddItem(playerId, 'weapon_pistol', 1)
    
    if success then
    else
        print(('Failed to add item to player %d: %s'):format(playerId, response))
    end
end)
