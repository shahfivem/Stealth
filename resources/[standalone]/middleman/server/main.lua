local function calculateAndReward(playerId, items)
    for _, item in pairs(items) do
        local playerItemCount = exports.ox_inventory:Search(playerId, 'count', item.name)
        local usableCount = playerItemCount

        if usableCount > 0 then
            -- Remove the used items
            exports.ox_inventory:RemoveItem(playerId, item.name, usableCount)

            -- Calculate the reward
            local totalReward = usableCount * item.reward.count

            -- Give the reward
            exports.ox_inventory:AddItem(playerId, item.reward.name, totalReward)
        end
    end
end

RegisterNetEvent('item_exchange:attemptExchange', function()
    local playerId = source
    local itemsRequired = Config.exchange.itemsRequired

    -- Reward the player for each item
    calculateAndReward(playerId, itemsRequired)
end)
