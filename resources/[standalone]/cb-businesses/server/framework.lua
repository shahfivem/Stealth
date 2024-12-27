CreateThread(function()
    Framework = "qb-core"
    UsingOxInventory = false
    if GetResourceState('qbx_core') == 'started' then
        Framework = "qbox"
    elseif GetResourceState('qb-core') == 'started' then
        Framework = "qb-core"
    end
    if GetResourceState('ox_inventory') == 'started' then
        UsingOxInventory = true
    end
end)

function SQLQuery(query, params)
    if params then
        return MySQL.query.await(query, params)
    else
        return MySQL.query.await(query)
    end
end

function GetPlayer(target)
    if Framework == "qb-core" then
        return QBCore.Functions.GetPlayer(target)

    elseif Framework == "qbox" then
        return exports.qbx_core:GetPlayer(target)
    end
end

function GetPlayers()
    if Framework == "qb-core" then
        return QBCore.Functions.GetPlayers()

    elseif Framework == "qbox" then
        local sources = {}
        local players = exports.qbx_core:GetQBPlayers()
        for k in pairs(players) do
            sources[#sources+1] = k
        end
        return sources
    end
end

function GetDutyCount(job)
    if Framework == "qb-core" then
        local players = GetPlayers()
        local onDuty = 0
        for k, v in pairs(players) do
            local Player = GetPlayer(v)
            if Player ~= nil then
                if Player.PlayerData.job.name == job then
                    onDuty = onDuty + 1
                end
            end
        end
        return onDuty
    elseif Framework == "qbox" then
        return exports.qbx_core:GetDutyCountJob(job)
    end
end

function HasItem(source, item, amount)
    local Player = GetPlayer(source)
    if not Player then
        print("Error: Player not found.")
        return false
    end

    if not item or not amount then
        print("Error: Item or amount not specified.")
        return false
    end

    if Framework == "qb-core" then
        -- Use qb-core's built-in HasItem method
        return Player.Functions.HasItem(item, amount) ~= nil
    elseif Framework == "qbox" then
        if UsingOxInventory then
            -- Use ox_inventory to check the item's count
            local itemCount = exports.ox_inventory:Search(source, "count", item)
            if itemCount and itemCount >= amount then
                return true
            else
                return false
            end
        else
            -- Fall back to qbox's HasItem method if ox_inventory is not used
            return Player.Functions.HasItem(item, amount) ~= nil
        end
    else
        -- Unsupported framework
        print("Error: Unsupported framework specified.")
        return false
    end
end


function RemoveMoney(source, amount)
    local src = source
    local player = GetPlayer(src)
    if player then
        player.Functions.RemoveMoney('cash', amount)
        return true
    else
        return false
    end
end

function RemoveItem(source, item, amount)
    if not UsingOxInventory then
        local Player = GetPlayer(source)
        Player.Functions.RemoveItem(item, amount)
        return true
    elseif UsingOxInventory then
        exports.ox_inventory:RemoveItem(source, item, amount)
        return true
    end
    return false
end

function AddItem(source, item, amount)
    if not UsingOxInventory then
        local Player = GetPlayer(source)
        Player.Functions.AddItem(item, amount)
        return true
    elseif UsingOxInventory then
        local canCarryItem = exports.ox_inventory:CanCarryItem(source, item, amount)
        if canCarryItem then
            exports.ox_inventory:AddItem(source, item, amount)
            return true
        else
            TriggerClientEvent('cb-businesses:client:NotEnoughSpace', source)
            return false
        end
    end
end

function IsPlayerBoss(source, checkJob)
    local Player = GetPlayer(source)
    if Player ~= nil then
        return Player.PlayerData.job.isboss and (Player.PlayerData.job.name == checkJob)
    end
    return false
end

-- @param buyerId number The ID of the buyer making the payment.
-- @param employeeId number The ID of the employee receiving the payment.
-- @param amount number The amount of money to be added.
-- @param paymenttype string The type of payment (cash, bank).
-- @param job string The job identifier related to the payment.
-- @param BuyerFullName string Full name of the buyer.
-- @param jobLabel string The label or title of the job.
function AddMoneyToJobAccount(buyerId, employeeId, amount, paymenttype, job, BuyerFullName, jobLabel)
    -- Your custom stuff here
end

RegisterNetEvent("cb-businesses:server:RegisterStash")
AddEventHandler("cb-businesses:server:RegisterStash", function(stashName)
    if not UsingOxInventory and Config.UsingNewQB then
        local src = source
        exports['qb-inventory']:OpenInventory(src, stashName)
    elseif UsingOxInventory then
        local src = source
        local Player = GetPlayer(src)
        if Player == nil then return end
        exports.ox_inventory:RegisterStash(stashName, stashName, 200, 10000000, nil, nil)
        exports.ox_inventory:forceOpenInventory(src, 'stash', stashName)
    end
end)