RegisterNetEvent('giveitem', function()
    local source = source  -- Get the source (player ID) that triggered the event
    local playerPed = GetPlayerPed(source)  -- Get the player's ped
    local playerCoords = GetEntityCoords(playerPed)  -- Get the player's coordinates

    -- Define the target coordinates (the location where the player should be)
    local targetCoords = vector3(1734.98, -1636.74, 112.53)
    local radius = 5.0  -- Define a small radius for the check

    -- Check if the player is within the radius of the target coordinates
    if #(playerCoords - targetCoords) < radius then
        -- Player is within the valid area, proceed with giving the item
        exports.ox_inventory:AddItem(source, 'laptop', 1)
        -- Optionally log the successful item give
        print("Item given to player: " .. source)
    else
        -- Player is not within the valid area, do not give the item
        print("Player not in valid area, item not given.")
    end
end)
