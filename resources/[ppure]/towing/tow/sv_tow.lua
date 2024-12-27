-- Helper function to remove funds
local removePlayerFunds = function(player, account, amount, reason)
    return player.Functions.RemoveMoney(account, amount, reason)
end

-- Helper function to determine which currency to use
local function FindChargeableCurrencyType(amount, cash, bank)
    if cash >= amount then
        return 'cash'
    elseif bank >= amount then
        return 'bank'
    end
    return nil
end

-- Main money removal function
local function RemoveMoney(src, amount, reason)
    local player = exports.qbx_core:GetPlayer(src)

    if not player then
        return false
    end

    local cash = player.PlayerData.money.cash or 0
    local bank = player.PlayerData.money.bank or 0
    local currencyType = FindChargeableCurrencyType(amount, cash, bank)

    if not currencyType then
        return false
    end

    return removePlayerFunds(player, currencyType, amount, reason)
end

RegisterNetEvent('erp-jobsystem:charge', function(amount)
    local src = source -- Automatically gets the triggering player's source

    -- Attempt to remove money
    local success = RemoveMoney(src, amount, 'Job charge')

    if success then
        -- Notify the player
        TriggerClientEvent('erp-jobsystem:notify', src, 'success', 'You have been charged ' .. amount .. ' dollars.')
    else
        -- Insufficient funds or failure
        TriggerClientEvent('erp-jobsystem:notify', src, 'error', 'Insufficient funds or transaction failed.')
    end
end)


local addPlayerFunds = function(player, account, amount, reason)
    return player.Functions.AddMoney(account, amount, reason)
end

-- Main money addition function
local function AddMoney(src, amount, reason)
    local player = exports.qbx_core:GetPlayer(src)

    if not player then
        return false
    end

    local cash = player.PlayerData.money.cash or 0
    local bank = player.PlayerData.money.bank or 0
    local currencyType = FindChargeableCurrencyType(amount, cash, bank)  -- Can be extended if needed to choose which account

    -- If no specific currency account needed, default to adding to cash
    if not currencyType then
        currencyType = 'cash'  -- Default to cash if nothing else
    end

    return addPlayerFunds(player, currencyType, amount, reason)
end

RegisterNetEvent('erp-jobsystem:pay', function(amount)
    local src = source -- Automatically gets the triggering player's source

    -- Attempt to remove money
    local success = AddMoney(src, amount, 'Job Payout')

    if success then
        -- Notify the player
        TriggerClientEvent('erp-jobsystem:notify', src, 'success', 'You have been Credited ' .. amount .. ' dollars for your work.')
    else
        -- Insufficient funds or failure
        TriggerClientEvent('erp-jobsystem:notify', src, 'error', 'Insufficient funds or transaction failed.')
    end
end)