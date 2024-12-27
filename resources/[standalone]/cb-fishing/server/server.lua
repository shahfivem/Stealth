function GetRandomRewardShore()
    local totalChance = 0

    for _, reward in pairs(Config.ShoreFishing) do
        totalChance = totalChance + reward.chance
    end

    local randomValue = math.random(1, totalChance)
    local cumulativeChance = 0

    for _, reward in pairs(Config.ShoreFishing) do
        cumulativeChance = cumulativeChance + reward.chance
        if randomValue <= cumulativeChance then
            return reward.name, reward.rep
        end
    end
end

function GetRandomRewardLake()
    local totalChance = 0

    for _, reward in pairs(Config.LakeFishing) do
        totalChance = totalChance + reward.chance
    end

    local randomValue = math.random(1, totalChance)
    local cumulativeChance = 0

    for _, reward in pairs(Config.LakeFishing) do
        cumulativeChance = cumulativeChance + reward.chance
        if randomValue <= cumulativeChance then
            return reward.name, reward.rep
        end
    end
end

function GetRandomRewardDeepSea()
    local totalChance = 0

    for _, reward in pairs(Config.DeepSeaFishing) do
        totalChance = totalChance + reward.chance
    end

    local randomValue = math.random(1, totalChance)
    local cumulativeChance = 0

    for _, reward in pairs(Config.DeepSeaFishing) do
        cumulativeChance = cumulativeChance + reward.chance
        if randomValue <= cumulativeChance then
            return reward.name, reward.rep
        end
    end
end

function GetRandomRewardsNet()
    local rewards = {}
    local numRewards = math.random(Config.MinNet, Config.MaxNet)
    for i = 1, numRewards do
        local totalChance = 0
        for _, reward in pairs(Config.NetFishing) do
            totalChance = totalChance + reward.chance
        end

        local randomValue = math.random(1, totalChance)
        local cumulativeChance = 0

        for _, reward in pairs(Config.NetFishing) do
            cumulativeChance = cumulativeChance + reward.chance
            if randomValue <= cumulativeChance then
                table.insert(rewards, {name = reward.name, rep = reward.rep})
                break
            end
        end
    end
    return rewards
end

function GetRandomRewardsTreasureBox()
    local rewards = {}
    local numRewards = math.random(Config.MinTreasureBox, Config.MaxTreasureBox)
    for i = 1, numRewards do
        -- Calculate the total chance for the current reward selection
        local totalChance = 0
        for _, reward in pairs(Config.TreasureBoxRewards) do
            totalChance = totalChance + reward.chance
        end
        -- Choose a random value within the total chance
        local randomValue = math.random(1, totalChance)
        local cumulativeChance = 0
        -- Select a reward based on randomValue
        for _, reward in pairs(Config.TreasureBoxRewards) do
            cumulativeChance = cumulativeChance + reward.chance
            if randomValue <= cumulativeChance then
                -- Add the reward to the list (allows duplicates)
                table.insert(rewards, {name = reward.name})
                break
            end
        end
    end

    return rewards
end

function GetRandomRewardsTreasureChest()
    local rewards = {}
    local numRewards = math.random(Config.MinTreasureChest, Config.MaxTreasureChest)
    for i = 1, numRewards do
        -- Calculate the total chance for the current reward selection
        local totalChance = 0
        for _, reward in pairs(Config.TreasureChestRewards) do
            totalChance = totalChance + reward.chance
        end
        -- Choose a random value within the total chance
        local randomValue = math.random(1, totalChance)
        local cumulativeChance = 0
        -- Select a reward based on randomValue
        for _, reward in pairs(Config.TreasureChestRewards) do
            cumulativeChance = cumulativeChance + reward.chance
            if randomValue <= cumulativeChance then
                -- Add the reward to the list (allows duplicates)
                table.insert(rewards, {name = reward.name, rep = reward.rep})
                break
            end
        end
    end
    return rewards
end

CreateThread( function()
    if Framework == "qb-core" then
        QBCore.Functions.CreateUseableItem('fishingrod', function(source)
            local Player = GetPlayer(source)
           TriggerClientEvent('cb-fishing:client:userod', source)
        end)
        
        QBCore.Functions.CreateUseableItem('deepsearod', function(source)
            local Player = GetPlayer(source)
           TriggerClientEvent('cb-fishing:client:deepsea', source)
        end)
        
        QBCore.Functions.CreateUseableItem('anchor', function(source)
            local Player = GetPlayer(source)
           TriggerClientEvent('cb-fishing:client:useanchor', source)
        end)
        
        QBCore.Functions.CreateUseableItem('net', function(source)
            local Player = GetPlayer(source)
           TriggerClientEvent('cb-fishing:client:usenet', source)
        end)
        
        QBCore.Functions.CreateUseableItem('treasurechest', function(source)
            local hasItem = HasItem(source, 'lockpick', 1)
            if hasItem then
                local success = lib.callback.await('cb-fishing:client:opentreasurechest', source)
                if success then
                    if RemoveItem(source, item, 1) and RemoveItem(source, 'lockpick', 1) then
                        GiveTreasureChestReward(source)
                    end
                else
                    TriggerClientEvent('cb-fishing:client:Notify', source, "Cancelled", 'You cancelled the action!', "error")
                end
            else
                TriggerClientEvent('cb-fishing:client:Notify', source, "Missing Item", 'You need a lockpick to open the chest!', "error")
            end
        end)
        
        QBCore.Functions.CreateUseableItem('treasurebox', function(source)
            local hasItem = HasItem(source, 'lockpick', 1)
            if hasItem then
                local success = lib.callback.await('cb-fishing:client:opentreasurebox', source)
                if success then
                    if RemoveItem(source, item, 1) and RemoveItem(source, 'lockpick', 1) then
                        GiveTreasureBoxReward(source)
                    end
                else
                    TriggerClientEvent('cb-fishing:client:Notify', source, "Cancelled", 'You cancelled the action!', "error")
                end
            else
                TriggerClientEvent('cb-fishing:client:Notify', source, "Missing Item", 'You need a lockpick to open the chest!', "error")
            end
        end)
    elseif Framework == "qbox" then
        exports.qbx_core:CreateUseableItem('fishingrod', function(source, item)
            local src = source
            local Player = GetPlayer(src)
            if Player == nil then return end
            TriggerClientEvent('cb-fishing:client:userod', src)
        end)

        exports.qbx_core:CreateUseableItem('deepsearod', function(source, item)
            local src = source
            local Player = GetPlayer(src)
            if Player == nil then return end
            TriggerClientEvent('cb-fishing:client:deepsea', source)
        end)

        exports.qbx_core:CreateUseableItem('anchor', function(source, item)
            local src = source
            local Player = GetPlayer(src)
            if Player == nil then return end
            TriggerClientEvent('cb-fishing:client:useanchor', source)
        end)

        exports.qbx_core:CreateUseableItem('net', function(source, item)
            local src = source
            local Player = GetPlayer(src)
            if Player == nil then return end
            TriggerClientEvent('cb-fishing:client:usenet', source)
        end)

        exports.qbx_core:CreateUseableItem('treasurechest', function(source, item)
            local hasItem = HasItem(source, 'lockpick', 1)
            if hasItem then
                local success = lib.callback.await('cb-fishing:client:opentreasurechest', source)
                if success then
                    if RemoveItem(source, item, 1) and RemoveItem(source, 'lockpick', 1) then
                        GiveTreasureChestReward(source)
                    end
                else
                    TriggerClientEvent('cb-fishing:client:Notify', source, "Cancelled", 'You cancelled the action!', "error")
                end
            else
                TriggerClientEvent('cb-fishing:client:Notify', source, "Missing Item", 'You need a lockpick to open the chest!', "error")
            end
        end)

        exports.qbx_core:CreateUseableItem('treasurebox', function(source, item)
            local hasItem = HasItem(source, 'lockpick', 1)
            if hasItem then
                local success = lib.callback.await('cb-fishing:client:opentreasurebox', source)
                if success then
                    if RemoveItem(source, item, 1) and RemoveItem(source, 'lockpick', 1) then
                        GiveTreasureBoxReward(source)
                    end
                else
                    TriggerClientEvent('cb-fishing:client:Notify', source, "Cancelled", 'You cancelled the action!', "error")
                end
            else
                TriggerClientEvent('cb-fishing:client:Notify', source, "Missing Item", 'You need a lockpick to open the chest!', "error")
            end
        end)
    end
end)

RegisterNetEvent('cb-fishing:server:catchfishshore', function()
    local src = source
    local Player = GetPlayer(src)
    local selectedReward, rep = GetRandomRewardShore()
    local fishingrep = GetFishingRep(src)
    local repreward = fishingrep + rep
    local firstName = Player.PlayerData.charinfo.firstname
    local lastName = Player.PlayerData.charinfo.lastname
    local cid = Player.PlayerData.citizenid

    if not Player then return end
    local success = lib.callback.await('cb-fishing:client:FishingMinigame', src)
    if success then
        TriggerClientEvent("cb-fishing:client:announcement", src, rep)
        SetFishingRep(src, repreward)
        if not AddItem(src, selectedReward, 1) then
            TriggerClientEvent('cb-fishing:client:Notify', src, "Fishing", 'You don\'t have enough space in your inventory', "error")
            return
        end
        local data = string.format('%s %s (%s) received %s `Earned Rep: %.0f` `Total Rep: %.0f`', firstName, lastName, cid, selectedReward, rep, repreward)
        FishingLog(data)
    else
        TriggerClientEvent('cb-fishing:client:Notify', src, "Fishing", 'You failed to catch the fish!', "error")
    end
end)

RegisterNetEvent('cb-fishing:server:catchfishlake', function()
    local src = source
    local Player = GetPlayer(src)
    local selectedReward, rep = GetRandomRewardLake()
    local fishingrep = GetFishingRep(src)
    local repreward = fishingrep + rep
    local firstName = Player.PlayerData.charinfo.firstname
    local lastName = Player.PlayerData.charinfo.lastname
    local cid = Player.PlayerData.citizenid
 
    if not Player then return end
    local success = lib.callback.await('cb-fishing:client:FishingMinigame', src)
    if success then
        TriggerClientEvent("cb-fishing:client:announcement", src, rep)
        SetFishingRep(src, repreward)
        if not AddItem(src, selectedReward, 1) then
            TriggerClientEvent('cb-fishing:client:Notify', src, "Fishing", 'You don\'t have enough space in your inventory', "error")
            return
        end
        local data = string.format('%s %s (%s) received %s `Earned Rep: %.0f` `Total Rep: %.0f`', firstName, lastName, cid, selectedReward, rep, repreward)
        FishingLog(data)
    else
        TriggerClientEvent('cb-fishing:client:Notify', src, "Fishing", 'You failed to catch the fish!', "error")
    end
end)

RegisterNetEvent('cb-fishing:server:catchfishdeepsea', function(rep)
    local src = source
    local Player = GetPlayer(src)
    local selectedReward, rep = GetRandomRewardDeepSea()
    local fishingrep = GetFishingRep(src)
    local repreward = fishingrep + rep
    local firstName = Player.PlayerData.charinfo.firstname
    local lastName = Player.PlayerData.charinfo.lastname
    local cid = Player.PlayerData.citizenid
 
    if not Player then return end
    local success = lib.callback.await('cb-fishing:client:DeepSeaMinigame', src)
    if success then
        SetFishingRep(src, repreward)
        if not AddItem(src, selectedReward, 1) then
            TriggerClientEvent('cb-fishing:client:Notify', src, "Fishing", 'You don\'t have enough space in your inventory', "error")
            return
        end
        local data = string.format('%s %s (%s) received %s `Earned Rep: %.0f` `Total Rep: %.0f`', firstName, lastName, cid, selectedReward, rep, repreward)
        FishingLog(data)
    else
        TriggerClientEvent('cb-fishing:client:Notify', src, "Fishing", 'You failed to catch the fish!', "error")
    end
end)

function GiveTreasureBoxReward(source)
    local src = source
    local Player = GetPlayer(src)
    local selectedRewards = GetRandomRewardsTreasureBox()
    if not Player then return end
    for _, reward in ipairs(selectedRewards) do
        local rewardName = reward.name
        if not AddItem(src, rewardName, 1) then
            print(rewardName)
            TriggerClientEvent('cb-fishing:client:Notify', src, "Fishing", 'You don\'t have enough space in your inventory', "error")
            return
        end
    end
end

function GiveTreasureChestReward(source)
    local src = source
    local Player = GetPlayer(src)
    local selectedRewards = GetRandomRewardsTreasureChest()
    if not Player then return end
    for _, reward in ipairs(selectedRewards) do
        local rewardName = reward.name
        if not AddItem(src, rewardName, 1) then
            TriggerClientEvent('cb-fishing:client:Notify', src, "Fishing", 'You don\'t have enough space in your inventory', "error")
            return
        end
    end
end

RegisterNetEvent('cb-fishing:server:catchfishnet', function()
    local src = source
    local Player = GetPlayer(src)
    local selectedRewards, rep = GetRandomRewardsNet()
    local fishingrep = GetFishingRep(src)
    local firstName = Player.PlayerData.charinfo.firstname
    local lastName = Player.PlayerData.charinfo.lastname
    local cid = Player.PlayerData.citizenid

    if not Player then return end

    local totalRep = 0
    local rewardName = nil
    for _, reward in ipairs(selectedRewards) do
        rewardName = reward.name
        local rewardRep = reward.rep
        totalRep = totalRep + rewardRep
        if not AddItem(src, rewardName, 1) then
            TriggerClientEvent('cb-fishing:client:Notify', src, "Fishing", 'You don\'t have enough space in your inventory', "error")
            return
        end
        TriggerClientEvent("cb-fishing:client:announcement", src, totalRep)
    end
    local newFishingRep = fishingrep + totalRep
    SetFishingRep(src, newFishingRep)
    local data = string.format('%s %s (%s) received %s `Earned Rep: %.0f` `Total Rep: %.0f`', firstName, lastName, cid, rewardName, rep, totalRep)
    FishingLog(data)
end)

RegisterNetEvent('cb-fishing:server:removefishingbait', function()
    local src = source
    local Player = GetPlayer(src)
 
    if not Player then return end
    Player.Functions.RemoveItem(Config.FishingBait, 1)
end)

RegisterNetEvent('cb-fishing:server:removedeepseabait', function()
    local src = source
    local Player = GetPlayer(src)
 
    if not Player then return end
    Player.Functions.RemoveItem(Config.DeepSeaBait, 1)
end)

RegisterNetEvent('cb-fishing:server:removechum', function()
    local src = source
    local Player = GetPlayer(src)
 
    if not Player then return end
    Player.Functions.RemoveItem('bagoffishchum', 1)
end)

RegisterNetEvent('cb-fishing:server:removeanchor', function()
    local src = source
    local Player = GetPlayer(src)
 
    if not Player then return end
    Player.Functions.RemoveItem("anchor", 1)
end)

RegisterNetEvent('cb-fishing:server:removelockpick', function()
    local src = source
    local Player = GetPlayer(src)
 
    if not Player then return end
    Player.Functions.RemoveItem('lockpick', 1)
end)

RegisterServerEvent("cb-fishing:server:sellfish")
AddEventHandler("cb-fishing:server:sellfish", function(args)
    local src = source
    local Player = GetPlayer(src)
    local item = args
    for k, v in pairs(Config.FishWholesale) do
        if v.item == item then
            if Player.Functions.GetItemByName(item) ~= nil then
                local amount = Player.Functions.GetItemByName(item).amount
                local pay = v.price
                Player.Functions.RemoveItem(item, amount)
                Player.Functions.AddMoney('cash', pay * amount)
                TriggerClientEvent('cb-fishing:client:Notify', src, "Fishing", 'You have successfully sold ' ..amount .. "x " .. v.name.. " for $"..pay * amount, "success")
                TriggerClientEvent('cb-fishing:client:fishbuyer', src)
            else
                TriggerClientEvent('cb-fishing:client:Notify', src, "Fishing", 'You don\'t have ' .. v.name .. " in your inventory", "error")
                TriggerClientEvent('cb-fishing:client:fishbuyer', src)
            end
        end
    end
end)

RegisterServerEvent("cb-fishing:server:sellfishpremium")
AddEventHandler("cb-fishing:server:sellfishpremium", function(args)
    local src = source
    local Player = GetPlayer(src)
    local item = args
    for k, v in pairs(Config.FishWholesalePremium) do
        if v.item == item then
            if Player.Functions.GetItemByName(item) ~= nil then
                local amount = Player.Functions.GetItemByName(item).amount
                local pay = v.price
                Player.Functions.RemoveItem(item, amount)
                Player.Functions.AddMoney('cash', pay * amount)
                TriggerClientEvent('cb-fishing:client:Notify', src, "Fishing", 'You have successfully sold ' ..amount .. "x " .. v.name.. " for $"..pay * amount, "success")
                TriggerClientEvent('cb-fishing:client:fishbuyerpremium', src)
            else
                TriggerClientEvent('cb-fishing:client:Notify', src, "Fishing", 'You don\'t have ' .. v.name .. " in your inventory", "error")
                TriggerClientEvent('cb-fishing:client:fishbuyerpremium', src)
            end
        end
    end
end)

RegisterServerEvent("cb-fishing:server:sellfishillegalmarket")
AddEventHandler("cb-fishing:server:sellfishillegalmarket", function(args)
    local src = source
    local Player = GetPlayer(src)
    local item = args
    for k, v in pairs(Config.FishIllegalMarket) do
        if v.item == item then
            if Player.Functions.GetItemByName(item) ~= nil then
                local amount = Player.Functions.GetItemByName(item).amount
                local pay = v.price
                Player.Functions.RemoveItem(item, amount)
                Player.Functions.AddMoney('cash', pay * amount)
                TriggerClientEvent('cb-fishing:client:Notify', src, "Fishing", 'You have successfully sold ' ..amount .. "x " .. v.name.. " for $"..pay * amount, "success")
                TriggerClientEvent('cb-fishing:client:illegalfishmarket', src)
            else
                TriggerClientEvent('cb-fishing:client:Notify', src, "Fishing", 'You don\'t have ' .. v.name .. " in your inventory", "error")
                TriggerClientEvent('cb-fishing:client:illegalfishmarket', src)
            end
        end
    end
end)


Citizen.CreateThread(function()
    if UsingOxInventory then
        exports.ox_inventory:RegisterShop('FishingShop', {
            name = Config.FishingShop.name,
            inventory = Config.FishingShop.inventory,
            locations = Config.FishingShop.locations,
        })
    end
end)