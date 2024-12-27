local locale = SD.Locale.T
local beekeepingData = {} -- Table to store beekeeping data

-- Event to set the location of the beekeeper when resource starts
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
		math.randomseed(os.time())
        GlobalState.BeekeeperLocation = Beekeeping.Beekeeper.Location[math.random(#Beekeeping.Beekeeper.Location)]
    end
end)

-- Helper function to format Product Name
local FormatProductName = function(product)
    return product:gsub("(%l)(%w*)", function(a,b) return string.upper(a)..b end):gsub("-", " ")
end

-- Beekeeper Buying/Selling Logic
-- Buying Items
RegisterNetEvent('sd-beekeeping:buyProduct', function(product, quantity)
    local src = source
    local cost = 0

    if product == 'bee-house' then cost = Beekeeping.Shop.Buy['bee-house'] * quantity elseif product == 'bee-hive' then cost = Beekeeping.Shop.Buy['bee-hive'] * quantity end

    local hasMoney = SD.Money.GetPlayerAccountFunds(src, 'money', cost)

    if hasMoney >= cost then
        SD.Money.RemoveMoney(src, 'cash', cost)
        SD.Inventory.AddItem(src, product, quantity)
        TriggerClientEvent('sd_bridge:notification', src, locale('notifications.purchase_success', {product = FormatProductName(product), quantity = quantity}), 'success')
    else
        TriggerClientEvent('sd_bridge:notification', src, locale('notifications.not_enough_money'), 'error')
    end
end)

-- Selling Items
RegisterNetEvent('sd-beekeeping:sellProduct', function(product, quantity)
    local src = source
    local price = 0

    if Beekeeping.Shop.Sell[product] then
        price = Beekeeping.Shop.Sell[product] * quantity
    else
        TriggerClientEvent('sd_bridge:notification', src, 'Unknown product.', 'error')
        return
    end

    if SD.Inventory.HasItem(src, product) >= quantity then
        SD.Inventory.RemoveItem(src, product, quantity)
        SD.Money.AddMoney(src, 'cash', price)
        TriggerClientEvent('sd_bridge:notification', src, locale('notifications.sell_success', {product = FormatProductName(product), quantity = quantity}), 'success')
    else
        TriggerClientEvent('sd_bridge:notification', src, locale('notifications.not_enough_items'), 'error')
    end
end)

-- [[ USABLE ITEMS ]]
-- Beehouse
SD.Inventory.RegisterUsableItem(Beekeeping.Items.HouseItem, function(source)
    TriggerClientEvent('sd-beekeeping:objects:client:SpawnObject', source, {
        object = Beekeeping.Props.bee_house,
        hive_type = 'house',
        distance = Beekeeping.SpawnRange,
        item = Beekeeping.Items.HouseItem,
        citizenid = SD.GetIdentifier(source)
    })
end)

-- Beehive
SD.Inventory.RegisterUsableItem(Beekeeping.Items.HiveItem, function(source)
    TriggerClientEvent('sd-beekeeping:objects:client:SpawnObject', source, {
        object = Beekeeping.Props.bee_hive,
        hive_type = 'hive',
        distance = Beekeeping.SpawnRange,
        item = Beekeeping.Items.HiveItem,
        citizenid = SD.GetIdentifier(source)
    })
end)

-- Remove item
RegisterNetEvent('sd-beekeeping:server:removeItem', function(item, amount)
    local isValid = item == 'bee-house' or item == 'bee-hive'
    if not isValid then return end

    local src = source
    SD.Inventory.RemoveItem(src, item, amount)
end)

-- Function to update the honey production multiplier based on the number of workers
local updateHoneyMultiplier = function(hiveId)
    local hiveData = beekeepingData[hiveId]
    if hiveData and hiveData.hive_type == 'hive' then
        local workers = hiveData.data.workers or 0
        local level = math.floor(workers / Beekeeping.WorkerThreshold)
        hiveData.honeyMultiplier = Beekeeping.Multipliers[level] or 1.0
        hiveData.adjustedHoneyTime = math.ceil(Beekeeping.Hives.HoneyTime / hiveData.honeyMultiplier)
    end
end

local LoadBeekeepingData = function()
    MySQL.Async.fetchAll('SELECT * FROM sd_beekeeping', {}, function(results)
        for _, v in ipairs(results) do
            local hive = {
                id = v["id"],
                hive_type = v["hive_type"],
                coords = v["coords"] and json.decode(v["coords"]) or nil,
                options = v["options"] and json.decode(v["options"]) or nil,
                data = v["data"] and json.decode(v["data"]) or nil,
                citizenid = v["citizenid"],
                collaborators = v["collaborators"] and json.decode(v["collaborators"]) or nil,
                durability = v["durability"] or 100
            }

            beekeepingData[v["id"]] = hive

            if hive.hive_type == 'hive' then
                updateHoneyMultiplier(v["id"])
            end
        end

        print(("sd-beekeeping: Loaded %d beekeeping objects."):format(#results))
    end)
end

-- Event handler for creating new beekeeping object (hive or house)
--- Event: sd-beekeeping:objects:server:CreateNewObject
--- @param hive_type string The type of hive ('hive' or 'house')
--- @param coords table The coordinates where the object is placed
--- @param options table The options for the object
--- @param defaultData table The default data for the hive
--- @param citizenid string The identifier of the player placing the object
RegisterNetEvent("sd-beekeeping:objects:server:CreateNewObject", function(hive_type, coords, options, defaultData, citizenid)
    local src = source
    if (hive_type ~= 'hive' and hive_type ~= 'house') or not coords or not coords.x or not coords.y or not coords.z or not coords.w or type(options) ~= "table" or type(defaultData) ~= "table" or not citizenid then
        TriggerClientEvent('sd-beekeeping:notification', src, 'Invalid parameters provided.', 'error')
        return
    end

    local durability = 100

    if hive_type == 'hive' then
        local clientHoneyType = defaultData.honeyType or 'basic'
        if not Beekeeping.HoneyTypes[clientHoneyType] then
            defaultData.honeyType = 'basic'
        end
    end

    local data = MySQL.query.await("INSERT INTO sd_beekeeping (hive_type, coords, options, data, citizenid, durability) VALUES (?, ?, ?, ?, ?, ?)",
        {hive_type, json.encode(coords), json.encode(options), json.encode(defaultData), citizenid, durability})

    if not data or not data.insertId then
        print('failed')
        TriggerClientEvent('sd_bridge:notification', src, 'Failed to create object.', 'error')
        return
    end

    beekeepingData[data.insertId] = {
        id = data.insertId,
        hive_type = hive_type,
        coords = coords,
        options = options,
        data = defaultData,
        citizenid = citizenid,
        durability = durability,
        adjustedHoneyTime = Beekeeping.Hives.HoneyTime,
    }

    TriggerClientEvent("sd-beekeeping:objects:client:AddObject", -1, {id = data.insertId, hive_type = hive_type, coords = coords, options = options})
end)

-- Callback to request objects
lib.callback.register("sd-beekeeping:objects:server:RequestObjects", function(source)
    local player = Player(source)
    if not Beekeeping.LoadOnStart then
        if player.state.beekeepingInit then
            return nil
        end
    end

    local formattedData = {}

    for id, data in pairs(beekeepingData) do
        formattedData[id] = {
            id = data.id,
            coords = data.coords,
            hive_type = data.hive_type,
            options = { SpawnRange = data.options.SpawnRange }
        }
    end

    Player(source).state.beekeepingInit = true

    return formattedData
end)

-- Delete object event
local DeleteBeeObject = function(objectid)
    local src = source
    if objectid > 0 then
        MySQL.query.await('DELETE FROM sd_beekeeping WHERE id = ?', {objectid})
        beekeepingData[objectid] = nil
        TriggerClientEvent("sd-beekeeping:objects:client:receiveObjectDelete", -1, objectid)
    end
end

-- Function to update a single hive's collaborators and persist changes to the database
local UpdateHiveCollaborators = function(hiveData, action, collaboratorId, src, isSingle, callback)
    hiveData.collaborators = hiveData.collaborators or {}
    local collaboratorIndex = SD.Table.IndexOf(hiveData.collaborators, collaboratorId)
    local isCollaboratorPresent = collaboratorIndex ~= nil
    local message, notificationType

    if action == "add" then
        if not isCollaboratorPresent then
            table.insert(hiveData.collaborators, collaboratorId)
            message = isSingle and locale('notifications.collaborator_added_single', {identifier = collaboratorId}) or locale('notifications.collaborator_added_all', {identifier = collaboratorId})
            notificationType = 'success'
        else
            -- Collaborator already exists
            callback(false, locale('notifications.collaborator_already_added'))
            return
        end
    elseif action == "remove" then
        if isCollaboratorPresent then
            table.remove(hiveData.collaborators, collaboratorIndex)
            message = isSingle and locale('notifications.collaborator_removed_single', {identifier = collaboratorId}) or locale('notifications.collaborator_removed_all', {identifier = collaboratorId})
            notificationType = 'success'
        else
            -- Collaborator not found
            callback(false, locale('notifications.collaborator_not_found'))
            return
        end
    else
        -- Invalid action
        callback(false, 'Invalid action specified.')
        return
    end

    -- Serialize the updated collaborators list
    local serializedCollaborators = json.encode(hiveData.collaborators)

    -- Update the database directly
    MySQL.Async.execute('UPDATE sd_beekeeping SET collaborators = ? WHERE id = ?', {serializedCollaborators, hiveData.id}, function(affectedRows)
        if affectedRows > 0 then
            -- Successful update
            callback(true, message, notificationType)
        else
            -- Database update failed, revert in-memory changes
            if action == "add" then
                table.remove(hiveData.collaborators)
            elseif action == "remove" then
                table.insert(hiveData.collaborators, collaboratorId)
            end
            callback(false, locale('notifications.database_update_failed'))
            print(("sd-beekeeping: Failed to update collaborators for hive ID %d in the database."):format(hiveData.id))
        end
    end)
end

-- Function to manage collaborators across one or multiple hives
local ManageCollaborator = function(action, hiveId, citizenId, collaboratorId, applyToAll, src)
    local hivesToUpdate = {}

    if applyToAll then
        -- Gather all hives owned by the citizen
        for id, data in pairs(beekeepingData) do
            if data.citizenid == citizenId then
                table.insert(hivesToUpdate, data)
            end
        end

        if #hivesToUpdate == 0 then
            TriggerClientEvent('sd_bridge:notification', src, locale('notifications.no_hives_found'), 'error')
            return
        end
    else
        local hiveData = beekeepingData[hiveId]
        if not hiveData then 
            TriggerClientEvent('sd_bridge:notification', src, locale('notifications.hive_not_found'), 'error') 
            return 
        end

        if citizenId ~= hiveData.citizenid then 
            TriggerClientEvent('sd_bridge:notification', src, locale('notifications.not_owner_of_hive'), 'error') 
            return  
        end

        table.insert(hivesToUpdate, hiveData)
    end

    local totalHives = #hivesToUpdate
    local successfulUpdates = 0
    local failedUpdates = 0
    local errorMessages = {}

    local function onUpdateComplete(success, message, notificationType)
        if success then
            successfulUpdates = successfulUpdates + 1
        else
            failedUpdates = failedUpdates + 1
            table.insert(errorMessages, message)
        end

        -- Check if all updates have been processed
        if (successfulUpdates + failedUpdates) == totalHives then
            if applyToAll then
                if successfulUpdates > 0 then
                    -- Customize the localization message as needed
                    TriggerClientEvent('sd_bridge:notification', src, locale('notifications.collaborator_updated_all', {success = successfulUpdates, total = totalHives}), 'success')
                end

                if failedUpdates > 0 then
                    -- Customize the localization message as needed
                    TriggerClientEvent('sd_bridge:notification', src, locale('notifications.collaborator_update_partial', {failed = failedUpdates, messages = table.concat(errorMessages, "; ")}), 'error')
                end
            else
                if successfulUpdates > 0 then
                    TriggerClientEvent('sd_bridge:notification', src, message, notificationType)
                end

                if failedUpdates > 0 then
                    TriggerClientEvent('sd_bridge:notification', src, table.concat(errorMessages, "; "), 'error')
                end
            end
        end
    end

    -- Iterate through all hives to update collaborators
    for _, hiveData in ipairs(hivesToUpdate) do
        local isSingle = not applyToAll
        UpdateHiveCollaborators(hiveData, action, collaboratorId, src, isSingle, onUpdateComplete)
    end
end


-- Event handler for adding a collaborator
RegisterNetEvent('sd-beekeeping:addCollaborator', function(hiveId, collaboratorInput, applyToAll)
    local src = source
    local citizenId = SD.GetIdentifier(src)
    local collaboratorId = SD.GetIdentifier(tonumber(collaboratorInput))

    if citizenId == collaboratorId then 
        TriggerClientEvent('sd_bridge:notification', src, locale('notifications.cannot_add_self'), 'error')
        return 
    end

    if collaboratorId and collaboratorId ~= "" then
        ManageCollaborator("add", hiveId, citizenId, collaboratorId, applyToAll, src)
    else
        TriggerClientEvent('sd_bridge:notification', src, locale('notifications.collaborator_not_found_or_offline'), 'error')
    end
end)

-- Event handler for removing a collaborator
RegisterNetEvent('sd-beekeeping:removeCollaborator', function(hiveId, collaboratorIdentifier, applyToAll)
    local src = source
    local citizenId = SD.GetIdentifier(src)
    ManageCollaborator("remove", hiveId, citizenId, collaboratorIdentifier, applyToAll, src)
end)

local RemoveFromData = function(id)
    if beekeepingData[id] then beekeepingData[id] = nil end
end

RegisterNetEvent('sd-beekeeping:repairFacility', function(hiveId, repairAmount)
    local src = source
    local citizenId = SD.GetIdentifier(src)
    local pRepairAmount = repairAmount

    -- Fetch hive data
    local hiveData = beekeepingData[hiveId]
    if not hiveData then 
        TriggerClientEvent('sd_bridge:notification', src, locale('notifications.hive_not_found'), 'error')
        return 
    end

    if type(pRepairAmount) ~= 'number' or pRepairAmount <= 0 then
        TriggerClientEvent('sd_bridge:notification', src, 'Invalid repair amount', 'error')
        return
    end

    local maxRepairableAmount = 100 - hiveData.durability
    if maxRepairableAmount <= 0 then
        TriggerClientEvent('sd_bridge:notification', src, 'Hive is already fully repaired', 'error')
        return
    end

    if pRepairAmount > maxRepairableAmount then
        -- DropPlayer(src, 'Attempted to repair more than possible.')
        return
    end

    if Beekeeping.LockAccess then 
    -- Check if the player is the owner of the hive or a collaborator
        if citizenId ~= hiveData.citizenid and not (hiveData.collaborators and SD.Table.Contains(hiveData.collaborators, citizenId)) then 
            TriggerClientEvent('sd_bridge:notification', src, locale('notifications.no_permission_for_repair'), 'error')
            return 
        end
    end

    local repairCost = repairAmount * Beekeeping.Expiry.RepairCostPerOne
    local hasMoney = SD.Money.GetPlayerAccountFunds(src, 'money', repairCost)

    if hasMoney >= repairCost then
        SD.Money.RemoveMoney(src, 'cash', repairCost)
        hiveData.durability = math.min(hiveData.durability + repairAmount, 100)
    else
        TriggerClientEvent('sd_bridge:notification', src, locale('notifications.insufficient_funds_for_repair'), 'error')
    end
end)

local UpdateQueensAndWorkers = function(data)
    local spawnQueen = math.random(1, 100)
    local queens, bees, workers = 0, 0, 0

    if spawnQueen < Beekeeping.House.QueenSpawnChance and data.queens < Beekeeping.House.MaxQueens then
        queens = type(Beekeeping.House.QueensPerCapture) == 'number' and Beekeeping.House.QueensPerCapture or math.random(Beekeeping.House.QueensPerCapture[1], Beekeeping.House.QueensPerCapture[2])
        queens = math.min(queens, Beekeeping.House.MaxQueens - data.queens)
        data.queens = data.queens + queens
    end

    if data.workers < Beekeeping.House.MaxWorkers then
        bees = type(Beekeeping.House.BeesPerCapture) == 'number' and Beekeeping.House.BeesPerCapture or math.random(Beekeeping.House.BeesPerCapture[1], Beekeeping.House.BeesPerCapture[2])
        workers = bees - queens
        workers = math.min(workers, Beekeeping.House.MaxWorkers - data.workers)
        data.workers = data.workers + workers
    end
end

local UpdateHoneyAndWax = function(data)
    local honeyLevel = math.random(Beekeeping.Hives.HoneyPerTime[1], Beekeeping.Hives.HoneyPerTime[2])
    local honeyToAdd = math.min(honeyLevel, Beekeeping.Hives.MaxHoney - (data.honey or 0))
    data.honey = (data.honey or 0) + honeyToAdd

    if math.random(1, 100) <= Beekeeping.Hives.ChanceOfWax then
        local waxLevel = math.random(Beekeeping.Hives.WaxPerTime[1], Beekeeping.Hives.WaxPerTime[2])
        local waxToAdd = math.min(waxLevel, Beekeeping.Hives.MaxWax - (data.wax or 0))
        data.wax = (data.wax or 0) + waxToAdd
    end
end

local UpdateHousesProgress = function()
    for id, v in pairs(beekeepingData) do
        local data = v.data
        if v.hive_type == 'house' and data and data.time and data.queens and data.workers then
            if not (data.queens >= Beekeeping.House.MaxQueens and data.workers >= Beekeeping.House.MaxWorkers) then
                if data.time >= Beekeeping.House.CaptureTime then
                    UpdateQueensAndWorkers(data)
                    data.time = 0
                else
                    data.time = data.time + 1
                end
            end
        elseif v.hive_type == 'hive' and data.haveQueen and data.haveWorker then
            if not ((data.honey or 0) >= Beekeeping.Hives.MaxHoney and (data.wax or 0) >= Beekeeping.Hives.MaxWax) then
                if data.time >= v.adjustedHoneyTime then
                    UpdateHoneyAndWax(data)
                    data.time = 0
                else
                    data.time = data.time + 1
                end
            end
        end
    end
end

CreateThread(function()
    LoadBeekeepingData()
    while true do
        Wait(1250) UpdateHousesProgress()
    end
end)

-- Function to update durability of hives/houseslocal
local UpdateDurability = function()
    local currentTime = GetGameTimer()

    -- Loop through all beekeeping data
    for id, hive in pairs(beekeepingData) do
        if hive.durability and hive.durability > 0 then
            local decayRate = Beekeeping.Expiry.DecaySettings[hive.hive_type].DecayRate
            local decayInterval = Beekeeping.Expiry.DecaySettings[hive.hive_type].DecayInterval

            -- Check if it's time to decrement this hive's durability
            if not hive.nextUpdate or currentTime >= hive.nextUpdate then
                hive.durability = hive.durability - decayRate

                -- Check if the hive's durability has dropped to zero or below
                if hive.durability <= 0 then
                    -- Commands to handle the removal of the expired hive/house
                    MySQL.Async.execute('DELETE FROM sd_beekeeping WHERE id = ?', {id})
                    beekeepingData[id] = nil
                    TriggerClientEvent("sd-beekeeping:objects:client:receiveObjectDelete", -1, id)
                else
                    -- Set the next update time based on the current time and decay interval
                    hive.nextUpdate = currentTime + decayInterval * 60000
                end
            end
        end
    end
end

-- Thread to periodically check and update durability
CreateThread(function()
    while true do
        UpdateDurability() Wait(60000)
    end
end)

-- Function to save all beekeeping data.
local SaveAllBeekeepingData = function()
    print('Attempting to save all beekeeping data!')

    local queries = {}
    for id, hive in pairs(beekeepingData) do
        queries[#queries+1] = {
            query = 'UPDATE sd_beekeeping SET data = ?, collaborators = ?, durability = ? WHERE id = ?',
            values = { json.encode(hive.data), json.encode(hive.collaborators or {}), hive.durability or 100, id }
        }
    end

    -- Perform batch update in a single transaction
    MySQL.Async.transaction(queries, {}, function()
    end, function(error)
    end)
end

-- Evaluate the configured saving method and set up appropriate handlers
if Beekeeping.Saving.Method == 'interval' then
    -- Thread to periodically update the Database, saving all beekeeping data.
    CreateThread(function()
        while true do
            Wait(Beekeeping.Saving.Interval * 60000)  -- Use configured interval
            SaveAllBeekeepingData()
        end
    end)
elseif Beekeeping.Saving.Method == 'txadmin' then
    -- Event handler to save all beekeeping data on a server restart/shutdown using txAdmin
    AddEventHandler('txAdmin:events:serverShuttingDown', function()
        SaveAllBeekeepingData()  -- Call the function that saves all beekeeping data
    end)
end

-- Event handler for saving all data when the resource stops
AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        SaveAllBeekeepingData()

        if not Beekeeping.LoadOnStart then
            warn('Objects are set to load on player login.')
            warn('If you want to load objects on resource start, set "LoadOnStart" to true in the config.')
        end
    end
end)

-- Withdrawing Bee's from Houses
RegisterNetEvent('sd-beekeeping:withdrawBee', function(id, type, amount)
    local src = source
    local citizenId = SD.GetIdentifier(src)
    local hive = beekeepingData[id]
    local withdrawAmount = math.abs(tonumber(amount) or 0)

    if not hive or not hive.data then 
        TriggerClientEvent('sd_bridge:notification', src, locale('notifications.no_access'), 'error')
        return 
    end

    local data = hive.data

    if Beekeeping.LockAccess then
        if citizenId ~= hive.citizenid and not (hive.collaborators and SD.Table.Contains(hive.collaborators, citizenId)) then 
            TriggerClientEvent('sd_bridge:notification', src, locale('notifications.no_access'), 'error')
            return 
        end
    end

    if data[type] and data[type] >= amount then
        local item
        if type == 'queens' then item = Beekeeping.Items.QueenItem else item = Beekeeping.Items.WorkerItem end

        if SD.Inventory.CanCarry(src, tostring(item), withdrawAmount) then
            SD.Inventory.AddItem(src, tostring(item), withdrawAmount)
            data[type] = data[type] - withdrawAmount
            local serializedData = json.encode(hive.data)
            
            MySQL.Async.execute('UPDATE sd_beekeeping SET data = ? WHERE id = ?', {serializedData, id}, function(affectedRows)
        end)
    else
        TriggerClientEvent('sd_bridge:notification', src, locale('notifications.not_enough_inventory'), 'error')
    end
    else
        TriggerClientEvent('sd_bridge:notification', src, locale('notifications.not_enough_bees'), 'error')
    end
end)

-- Withdrawing Product from Hives
--- Event handler for withdrawing product from a hive
--- Event: sd-beekeeping:withdrawProduct
--- @param id number The hive ID
--- @param type string The product type ('honey' or 'wax')
--- @param amount number The amount to withdraw
RegisterNetEvent('sd-beekeeping:withdrawProduct', function(id, type, amount)
    local src = source
    local citizenId = SD.GetIdentifier(src)
    local hive = beekeepingData[id]
    local withdrawAmount = math.abs(tonumber(amount) or 0)

    if not hive or not hive.data then
        TriggerClientEvent('sd_bridge:notification', src, locale('notifications.no_access'), 'error')
        return
    end

    local data = hive.data

    if Beekeeping.LockAccess then
        if citizenId ~= hive.citizenid and not (hive.collaborators and SD.Table.Contains(hive.collaborators, citizenId)) then
            TriggerClientEvent('sd_bridge:notification', src, locale('notifications.no_access'), 'error')
            return
        end
    end

    if data[type] and data[type] >= amount then
        local item
        if type == 'honey' then
            local honeyType = data.honeyType or 'basic'
            item = Beekeeping.HoneyTypes[honeyType].item or Beekeeping.Items.HoneyItem
        else
            item = Beekeeping.Items.WaxItem
        end

        local canCarry = SD.Inventory.CanCarry(src, tostring(item), withdrawAmount)
        if canCarry then
            SD.Inventory.AddItem(src, tostring(item), withdrawAmount)
            data[type] = data[type] - withdrawAmount

            local serializedData = json.encode(hive.data)
            MySQL.Async.execute('UPDATE sd_beekeeping SET data = ? WHERE id = ?', {serializedData, id}, function(affectedRows)
            end)
        else
            TriggerClientEvent('sd_bridge:notification', src, locale('notifications.not_enough_inventory'), 'error')
        end
    else
        TriggerClientEvent('sd_bridge:notification', src, locale('notifications.not_enough_product'), 'error')
    end
end)

RegisterNetEvent('sd-beekeeping:removeStructure', function(id)
    local src = source
    local hive = beekeepingData[id]
    local citizenId = SD.GetIdentifier(src)

    if not hive or not hive.data then 
        TriggerClientEvent('sd_bridge:notification', src, locale('notifications.no_access'), 'error')
        return 
    end

    if Beekeeping.LockAccess then 
        if citizenId ~= hive.citizenid and not (hive.collaborators and SD.Table.Contains(hive.collaborators, citizenId)) then 
            TriggerClientEvent('sd_bridge:notification', src, locale('notifications.no_access'), 'error')
            return 
        end
    end

    RemoveFromData(id)
    DeleteBeeObject(id)
end)

-- Insert queen into Hive
RegisterNetEvent('sd-beekeeping:insertQueen', function(id)
    local src = source
    local citizenId = SD.GetIdentifier(src)
    local hive = beekeepingData[id]

    if not hive or not hive.data then 
        TriggerClientEvent('sd_bridge:notification', src, locale('notifications.no_access'), 'error')
        return 
    end

    if Beekeeping.LockAccess then 
        if citizenId ~= hive.citizenid and not (hive.collaborators and SD.Table.Contains(hive.collaborators, citizenId)) then 
            TriggerClientEvent('sd_bridge:notification', src, locale('notifications.no_access'), 'error')
            return 
        end
    end

    if SD.Inventory.HasItem(src, Beekeeping.Items.QueenItem) >= 1 then
        SD.Inventory.RemoveItem(src, Beekeeping.Items.QueenItem, Beekeeping.Hives.NeededQueens)
        if hive.hive_type == 'hive' then
            hive.data.haveQueen = true
            -- Serialize the updated data
            local serializedData = json.encode(hive.data)
            MySQL.Async.execute('UPDATE sd_beekeeping SET data = ? WHERE id = ?', {serializedData, id}, function(affectedRows)
            end)
        else
            return
        end
    else
        TriggerClientEvent('sd_bridge:notification', src, locale('notifications.not_enough_queens', {needed = Beekeeping.Hives.NeededQueens}), 'error')
    end
end)

-- Insert worker into Hive.
RegisterNetEvent('sd-beekeeping:insertWorker', function(id, amount)
    local src = source
    local citizenId = SD.GetIdentifier(src)
    local hive = beekeepingData[id]
    local workerAmount = math.abs(tonumber(amount) or 0)

    if not hive or not hive.data then 
        TriggerClientEvent('sd_bridge:notification', src, locale('notifications.no_access'), 'error')
        return 
    end

    if Beekeeping.LockAccess then 
    -- Check if the player is the owner of the hive/house or a collaborator
        if citizenId ~= hive.citizenid and not (hive.collaborators and SD.Table.Contains(hive.collaborators, citizenId)) then 
            TriggerClientEvent('sd_bridge:notification', src, locale('notifications.no_access'), 'error')
            return 
        end
    end

    if workerAmount <= 0 then
        TriggerClientEvent('sd_bridge:notification', src, locale('notifications.invalid_worker_amount'), 'error')
        return
    end

    if SD.Inventory.HasItem(src, Beekeeping.Items.WorkerItem) >= workerAmount then
        if hive.hive_type == 'hive' then
            -- Check if adding workers exceeds the maximum limit
            if (hive.data.workers or 0) + workerAmount > Beekeeping.Hives.MaxWorkers then
                TriggerClientEvent('sd_bridge:notification', src, locale('notifications.too_many_workers', {max = Beekeeping.Hives.MaxWorkers}), 'error')
                return
            end

            SD.Inventory.RemoveItem(src, Beekeeping.Items.WorkerItem, workerAmount)
            hive.data.workers = (hive.data.workers or 0) + workerAmount
            if not hive.data.haveWorker and hive.data.workers >= Beekeeping.Hives.NeededWorkers then
                hive.data.haveWorker = true
                hive.data.honey = 0
                hive.data.wax = 0
            end

            -- Update honey production multiplier
            updateHoneyMultiplier(id)

            -- Serialize the updated data
            local serializedData = json.encode(hive.data)

            -- Execute database update
            MySQL.Async.execute('UPDATE sd_beekeeping SET data = ? WHERE id = ?', {serializedData, id}, function(affectedRows)
            end)
        else
            return
        end
    else
        TriggerClientEvent('sd_bridge:notification', src, locale('notifications.not_enough_workers', {needed = workerAmount}), 'error')
    end
end)

lib.callback.register('sd-beekeeping:getHiveData', function(source, hiveId)
    local id = hiveId if beekeepingData[id] then return beekeepingData[id] else return false end
end)

lib.callback.register('sd-beekeeping:getHiveMembersData', function(source, hiveId)
    local id = hiveId if beekeepingData[id] then return { citizenid = beekeepingData[id].citizenid, collaborators = beekeepingData[id].collaborators } else return false end
end)

lib.callback.register('sd-beekeeping:server:CheckHiveCount', function(source, data)
    local maxLimit = (data.hive_type == 'house') and Beekeeping.Max.Houses or Beekeeping.Max.Hives local count = 0
    for _, hive in pairs(beekeepingData) do if hive.citizenid == data.citizenid and hive.hive_type == data.hive_type then count = count + 1 end end
    return count >= maxLimit
end)

SD.CheckVersion('sd-versions/sd-beekeeping') -- Check version of specified resource