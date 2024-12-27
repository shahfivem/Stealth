SpawnedShopPeds = {}
JobPeds = {}
Businesses = {}
for key, business in pairs(Config) do
    if business and business.job then  -- Assuming each business config has a 'job' property
        Businesses[key] = business
    end
end

RegisterNetEvent("cb-businesses:server:billcustomer", function(playerId, amount, paymenttype)
    local src = source
    local Buyer = GetPlayer(playerId)
    if Buyer then
        TriggerClientEvent("cb-businesses:client:PaymentVerification", playerId, amount, paymenttype, src)
    else
        TriggerClientEvent('cb-businesses:client:Notify', src, "Invalid Player", "There is no player with this ID!", "error")
    end
end)

RegisterNetEvent("cb-businesses:server:ProcessPayment", function(buyerId, employeeId, amount, paymenttype, approved)
    local Buyer = GetPlayer(buyerId)
    local Employee = GetPlayer(employeeId)
    if Employee == nil then return end
    if Buyer == nil then return end
    local BuyerFullName = Buyer.PlayerData.charinfo.firstname .. " " .. Buyer.PlayerData.charinfo.lastname
    local job = Employee.PlayerData.job.name
    local jobLabel = Employee.PlayerData.job.label  
    if approved then
        if paymenttype == "cash" and Buyer.PlayerData.money.cash >= tonumber(amount) then
            Buyer.Functions.RemoveMoney('cash', amount)
            Employee.Functions.AddMoney('cash', amount)
        elseif paymenttype == "bank" and Buyer.PlayerData.money.bank >= tonumber(amount) then
            if Config.BankingSystem == "Renewed" then
                Buyer.Functions.RemoveMoney('bank', amount)
                local transaction = exports['Renewed-Banking']:handleTransaction(Buyer.PlayerData.citizenid, jobLabel, amount, string.format("Payment to %s", jobLabel), jobLabel, BuyerFullName, "withdraw")
                Buyer.Functions.RemoveMoney('bank', amount, string.format("Payment to %s", jobLabel))
                exports['Renewed-Banking']:handleTransaction(job, "Payment from Citizen", amount, "Payment from " .. BuyerFullName, BuyerFullName, jobLabel, "deposit", transaction.trans_id)
                exports['Renewed-Banking']:addAccountMoney(job, amount)
            elseif Config.BankingSystem == "Custom" then
                AddMoneyToJobAccount(buyerId, employeeId, amount, paymenttype, job, BuyerFullName, jobLabel)
            end
        else
            TriggerClientEvent('cb-businesses:client:Notify', employeeId, "Payment Rejected", "Buyer doesn't have enough money!", "error")
        end
    else
      TriggerClientEvent('cb-businesses:client:Notify', employeeId, "Payment Denied", "Player denied the payment!", "error")
    end
end)

lib.callback.register('cb-businesses:server:canTeleport', function(source, job)
    local src = source
    local Player = GetPlayer(src)
    local playerJob = Player.PlayerData.job.name
    if playerJob == job then
        return true
    else
        return false
    end
end)

lib.callback.register('cb-businesses:server:canCraft', function(source, item, type, job, quantity)
    local src = source
    if not src then return false end

    -- Fetch general and job-specific recipes
    local generalRecipes = type.all
    local jobRecipes = type[job]

    -- Combine both general and job-specific crafting recipes
    local combinedRecipes = {}
    if generalRecipes then
        for k, v in pairs(generalRecipes) do
            combinedRecipes[k] = v
        end
    end
    if jobRecipes then
        for k, v in pairs(jobRecipes) do
            combinedRecipes[k] = v
        end
    end

    -- Iterate through combined recipes to find the matching one
    for _, recipes in pairs(combinedRecipes) do
        for _, recipe in ipairs(recipes) do
            if recipe.result.item == item then
                -- If the recipe has no required items, it can be crafted
                if not recipe.items or #recipe.items == 0 then
                    return true
                end

                -- Check if the player has all required items for the specified quantity
                local hasAllItems = true
                for _, ingredient in ipairs(recipe.items) do
                    local requiredAmount = ingredient.amount * quantity
                    if not HasItem(src, ingredient.item, requiredAmount) then
                        hasAllItems = false
                        break
                    end
                end

                -- Return true if the player has all required items
                if hasAllItems then
                    return true
                end
            end
        end
    end

    -- If no matching recipe or missing ingredients
    return false
end)

RegisterNetEvent('cb-businesses:server:CraftItem', function(item, type, job, quantity)
    local src = source
    if not src then return end

    -- Fetch general and job-specific recipes
    local generalRecipes = type.all
    local jobRecipes = type[job]

    -- Combine both general and job-specific crafting recipes
    local combinedRecipes = {}
    if generalRecipes then
        for k, v in pairs(generalRecipes) do
            combinedRecipes[k] = v
        end
    end
    if jobRecipes then
        for k, v in pairs(jobRecipes) do
            combinedRecipes[k] = v
        end
    end

    -- Iterate through combined recipes to process crafting
    for _, recipes in pairs(combinedRecipes) do
        for _, recipe in ipairs(recipes) do
            if recipe.result.item == item then
                -- If the recipe has no required items, craft the item directly
                if not recipe.items or #recipe.items == 0 then
                    local craftedAmount = recipe.result.amount * quantity
                    if AddItem(src, recipe.result.item, craftedAmount) then
                        TriggerClientEvent('cb-businesses:client:Notify', src, "Success", 
                            string.format("You crafted %dx %s.", craftedAmount, GetItemLabel(item)), "success")
                    else
                        TriggerClientEvent('cb-businesses:client:Notify', src, "Error", "Failed to add the crafted item.", "error")
                    end
                    return
                end

                -- Verify and remove required ingredients, then craft the item
                local hasAllItems = true
                for _, ingredient in ipairs(recipe.items) do
                    local requiredAmount = ingredient.amount * quantity
                    if not HasItem(src, ingredient.item, requiredAmount) then
                        hasAllItems = false
                        break
                    end
                end

                if hasAllItems then
                    for _, ingredient in ipairs(recipe.items) do
                        local requiredAmount = ingredient.amount * quantity
                        RemoveItem(src, ingredient.item, requiredAmount)
                    end
                    local craftedAmount = recipe.result.amount * quantity
                    if AddItem(src, recipe.result.item, craftedAmount) then
                        TriggerClientEvent('cb-businesses:client:Notify', src, "Success", 
                            string.format("You crafted %dx %s.", craftedAmount, GetItemLabel(item)), "success")
                    else
                        TriggerClientEvent('cb-businesses:client:Notify', src, "Error", "Failed to add the crafted item.", "error")
                    end
                else
                    TriggerClientEvent('cb-businesses:client:Notify', src, "Error", "Missing required materials to craft this item.", "error")
                end
                return
            end
        end
    end

    -- Notify player if no recipe matches
    TriggerClientEvent('cb-businesses:client:Notify', src, "Error", "Recipe not found for this item.", "error")
end)



lib.callback.register('cb-businesses:server:StripperTakeCash', function(source, business)
    local src = source
    if src == nil then return false end
    local Player = GetPlayer(src)
    if Player == nil then return end
    local cashAmount = Player.PlayerData.money.cash
    if cashAmount >= business.stripper.cost then
        if RemoveMoney(source, business.stripper.cost) then
            return true
        else
            return false
        end
    else
        return false
    end
end)

lib.callback.register('cb-businesses:server:StrippersSpawned', function(source, job)
    return JobPeds[job]
end)

RegisterNetEvent('cb-businesses:server:SpawnStrippers')
AddEventHandler('cb-businesses:server:SpawnStrippers', function(business)
    TriggerClientEvent('cb-businesses:client:SpawnStrippers', -1, business)
end)

RegisterNetEvent('cb-businesses:server:DeletePed')
AddEventHandler('cb-businesses:server:DeletePed', function(ped)
    TriggerClientEvent('cb-businesses:client:DeletePed', -1, ped)
end)

RegisterNetEvent("cb-businesses:server:SetUniform", function(source, outfit)
    local src = source
    local Player = GetPlayer(src)
    if Player == nil then return end
    local job = Player.PlayerData.job.name
    local isBoss = IsPlayerBoss(src, Config.WhiteWidowJob)
    
    if isBoss then
        -- Convert the outfit table to a JSON string
        local outfitJson = json.encode(outfit)

        -- First, check if the job already has a row in the database
        local checkQuery = 'SELECT 1 FROM business_uniforms WHERE business = ?'
        local checkParams = { job }
        local existing = SQLQuery(checkQuery, checkParams)

        if existing[1] == nil then
            -- If no existing row is found, insert a new row
            local insertQuery = 'INSERT INTO business_uniforms (business, outfit) VALUES (?, ?)'
            local insertParams = { job, outfitJson }
            local result = SQLQuery(insertQuery, insertParams)

            if result then
                TriggerClientEvent('cb-businesses:client:Notify', src, "Success", "Uniform has been saved!", "success")
            else
                TriggerClientEvent('cb-businesses:client:Notify', src, "Error", "Could not save the uniform. Try again.", "error")
            end
        else
            -- If a row exists, update the existing uniform
            local updateQuery = 'UPDATE business_uniforms SET outfit = ? WHERE business = ?'
            local updateParams = { outfitJson, job }
            local result = SQLQuery(updateQuery, updateParams)

            if result then
                TriggerClientEvent('cb-businesses:client:Notify', src, "Success", "Uniform has been updated!", "success")
            else
                TriggerClientEvent('cb-businesses:client:Notify', src, "Error", "Could not update the uniform. Try again.", "error")
            end
        end
    else
        -- Notify the client that they're not the boss
        TriggerClientEvent('cb-businesses:client:Notify', src, "Not an Owner", "Only owners can set the company uniform!", "error")
    end
end)

lib.callback.register('cb-businesses:server:GetUniform', function(source)
    local src = source
    local Player = GetPlayer(src)
    if Player == nil then return end
    local job = Player.PlayerData.job.name
    -- Query to get the uniform for the job
    local query = 'SELECT outfit FROM business_uniforms WHERE business = ?'
    local params = { job }
    local result = SQLQuery(query, params)

    if result and #result > 0 then
        -- If a uniform is found, parse the JSON and return the outfit
        local outfit = json.decode(result[1].outfit)
        return outfit
    else
        -- If no uniform is found, return false
        return false
    end
end)

Citizen.CreateThread(function()
    for _, business in pairs(Businesses) do
        if UsingOxInventory and business.shop then
            for _, shopZone in ipairs(business.shop) do
                exports.ox_inventory:RegisterShop(shopZone.name, {
                    name = shopZone.name,
                    inventory = shopZone.inventory,
                    locations = {
                        vector3(shopZone.coords.x, shopZone.coords.y, shopZone.coords.z),
                    }
                })
            end
        end
    end
end)