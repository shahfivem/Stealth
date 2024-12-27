local locale = SD.Locale.T -- Variable to store translation function

-- Function to get the colour
local GetProgressColor = function(pourcentage, inverted)
    if inverted then
        if pourcentage > 75 then return '#2a9d8f' end
        if pourcentage > 50 then return '#e9c46a' end
        if pourcentage > 30 then return '#f4a261' end
        if pourcentage > 0 then return '#e63946' end
    end
    if pourcentage > 75 then return '#e63946' end
    if pourcentage > 50 then return '#f4a261' end
    if pourcentage > 30 then return '#e9c46a' end
    if pourcentage > 0 then return '#2a9d8f' end
end

-- Ped Creation Function
local CreatePedAtCoords = function(pedModel, coords, scenario)
    local options = {
        {
            action = function()
                OpenBeekeepingMenu()
            end,
            icon = Beekeeping.Beekeeper.Interaction.Icon,
            label = locale('target.beekeeper'),
            canInteract = function()
                return true
            end
        },
    }

    local pedData = {
        model = pedModel,           -- Model of the ped (string or hash)
        coords = coords,            -- Coordinates where the ped will appear
        scenario = scenario,        -- Scenario the ped will enact
        distance = 50,              -- Distance at which the ped spawns
        freeze = true,              -- Freeze the ped
        debug = false,              -- Enable debugging to visualize the point
        targetOptions = {           -- Target interaction options
            options = options,
            distance = Beekeeping.Beekeeper.Interaction.Distance
        },
        interactionType = Beekeeping.Interaction -- Add the interaction type to the data
    }

    -- Create the ped at the point using the SD.Ped module
    local point = SD.Ped.CreatePedAtPoint(pedData)
    
    return point
end

-- Thread for Ped Creation
CreateThread(function()
    while not GlobalState.BeekeeperLocation do Wait(0) end
    if Beekeeping.Beekeeper.Enable then local ped = CreatePedAtCoords(Beekeeping.Beekeeper.Model, GlobalState.BeekeeperLocation, Beekeeping.Beekeeper.Scenario) end
end)

-- Beekeeper Blip Creation Thread
CreateThread(function()
    if Beekeeping.Beekeeper.Enable and Beekeeping.Blip.Enable then
        local coords = GlobalState.BeekeeperLocation
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, Beekeeping.Blip.Sprite)
        SetBlipDisplay(blip, Beekeeping.Blip.Display)
        SetBlipScale(blip, Beekeeping.Blip.Scale)
        SetBlipAsShortRange(blip, true)
        SetBlipColour(blip, Beekeeping.Blip.Colour)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Beekeeping.Blip.Name)
        EndTextCommandSetBlipName(blip)
    end
end)

-- Menu Function for the beekeeper
-- Function to handle Purchasing Tools/Objects
OpenPurchaseBeekeepingMenu = function()
    local purchaseElements = {
        {
            title = locale('beekeeper.buy_bee_house'),
            description = locale('beekeeper.purchase_bee_house_desc'),
            icon = 'home',
            product = 'bee-house',
            price = Beekeeping.Shop.Buy['bee-house']
        },
        {
            title = locale('beekeeper.buy_bee_hive'),
            description = locale('beekeeper.purchase_bee_hive_desc'),
            icon = 'fa-brands fa-hive',
            product = 'bee-hive',
            price = Beekeeping.Shop.Buy['bee-hive']
        },
        {
            title = locale('beekeeper.return_main_menu'),
            icon = 'arrow-left',
            onSelect = OpenBeekeepingMenu
        }
    }

    for _, element in ipairs(purchaseElements) do
        if element.product then
            element.onSelect = function()
                local input = lib.inputDialog('Purchase ' .. element.title, {
                    {type = 'number', label = 'Quantity', required = true, min = 1}
                })

                if not input or not input[1] then return end
                local quantity = tonumber(input[1])
                if quantity and quantity > 0 then
                    local totalCost = element.price * quantity
                    OpenConfirmationDialog('buy', element.product, quantity, totalCost, 'sd-beekeeping:buyProduct')
                end
            end
        end
    end

    lib.registerContext({
        id = 'purchase_beekeeping_menu',
        title = locale('beekeeper.purchase_tools_title'),
        options = purchaseElements
    })

    lib.showContext('purchase_beekeeping_menu')
end

-- Function to handle Selling Beekeeping Items
OpenSellBeekeepingMenu = function()
    local sellElements = {}

    for honeyKey, honeyData in pairs(Beekeeping.HoneyTypes) do
        table.insert(sellElements, {
            title = locale('beekeeper.sell_honey', {honey_name = honeyData.displayName}),
            description = locale('beekeeper.sell_honey_desc', {honey_name = honeyData.displayName}),
            icon = 'jar',
            product = honeyData.item,
            price = (Beekeeping.Shop.Sell[honeyData.item] or 0)
        })
    end

    table.insert(sellElements, {
        title = locale('beekeeper.sell_wax'),
        description = locale('beekeeper.sell_wax_desc'),
        icon = 'fa-brands fa-hive',
        product = 'bee-wax',
        price = Beekeeping.Shop.Sell['bee-wax']
    })

    table.insert(sellElements, {
        title = locale('beekeeper.return_main_menu'),
        icon = 'arrow-left',
        onSelect = OpenBeekeepingMenu
    })

    for _, element in ipairs(sellElements) do
        if element.product then
            element.onSelect = function()
                local input = lib.inputDialog(locale('beekeeper.sell_quantity_title', {product = element.title}), {
                    {type = 'number', label = locale('beekeeper.quantity_label'), required = true, min = 1}
                })

                if not input or not input[1] then return end
                local quantity = tonumber(input[1])
                if quantity and quantity > 0 then
                    local totalPrice = element.price * quantity
                    OpenConfirmationDialog('sell', element.product, quantity, totalPrice, 'sd-beekeeping:sellProduct')
                end
            end
        end
    end

    -- Register the selling context menu
    lib.registerContext({
        id = 'sell_beekeeping_menu',
        title = locale('beekeeper.sell_products_title'),
        options = sellElements
    })

    -- Show the selling menu
    lib.showContext('sell_beekeeping_menu')
end

OpenConfirmationDialog = function(actionType, product, quantity, totalCost, serverEvent)
    local dialogTitle = locale('beekeeper.transaction_confirmation_title')
    local productName = locale('beekeeper.' .. product:gsub("-", "_"))
    
    local baseMessageKey = actionType == 'buy' and 'beekeeper.confirm_purchase' or 'beekeeper.confirm_sale'
    local baseMessage = locale(baseMessageKey)
    
    local confirmMessage = baseMessage:gsub("{quantity}", quantity)
    confirmMessage = confirmMessage:gsub("{product}", productName)
    confirmMessage = confirmMessage:gsub("{totalCost}", totalCost)   
    local icon = (actionType == 'buy' and 'dollar-sign' or 'hand-holding-usd')

    lib.registerContext({
        id = 'confirmation_dialog',
        title = dialogTitle,
        options = {
            {
                title = (actionType == 'buy' and 'Confirm Purchase' or 'Confirm Sale'),
                description = confirmMessage,
                icon = icon,
                onSelect = function()
                    TriggerServerEvent(serverEvent, product, quantity)
                    lib.hideContext()
                end
            },
            {
                title = 'Cancel',
                icon = 'times',
                onSelect = function()
                    lib.hideContext()
                end
            }
        }
    })

    lib.showContext('confirmation_dialog')
end

-- Function to open the main Beekeeping Menu
OpenBeekeepingMenu = function()
    local elements = {
        {
            title = locale('beekeeper.purchase_tools'),
            icon = 'tools',
            description = locale('beekeeper.purchase_tools_desc'),
            onSelect = OpenPurchaseBeekeepingMenu
        },
        {
            title = locale('beekeeper.sell_items'),
            icon = 'dollar-sign',
            description = locale('beekeeper.sell_items_desc'),
            onSelect = OpenSellBeekeepingMenu
        }
    }

    lib.registerContext({
        id = 'beekeeping_main_menu',
        title = locale('beekeeper.main_menu_title'),
        options = elements
    })

    lib.showContext('beekeeping_main_menu')
end

-- [[ BEE HOUSE ]]
RegisterNetEvent('sd-beekeeping:openBeeHouse', function(data)
    lib.callback('sd-beekeeping:getHiveMembersData', false, function(hMemberData)
        if not hMemberData then 
            print('Error retrieving Data') 
            return 
        end

        local owner = hMemberData.citizenid
        local citizenid = SD.GetIdentifier()
        local collaborators = hMemberData.collaborators or {}

        if Beekeeping.LockAccess then
            if tostring(citizenid) ~= tostring(owner) and not SD.Table.Contains(collaborators, citizenid) then
                SD.ShowNotification(locale('notifications.no_access'), 'error')
                return
            end

            local mainMenuOptions = {
                {
                    title = locale('houses.main_menu_title'),
                    description = locale('houses.main_menu_description'),
                    icon = 'fa-solid fa-house-user',
                    onSelect = function()
                        openBeeHouseMenu(data)
                    end
                },
                {
                    title = locale('collaborators_menu.collaborators_menu_title'),
                    description = locale('collaborators_menu.collaborators_menu_description'),
                    icon = 'fa-solid fa-user-friends',
                    onSelect = function()
                        openCollaboratorsMenu(hMemberData, data.id, "house")
                    end
                }
            }

            lib.registerContext({
                id = 'sdbeekeeping_house_menu',
                title = locale('houses.menu_title'),
                options = mainMenuOptions,
            })
            lib.showContext('sdbeekeeping_house_menu')
        else
            openBeeHouseMenu(data)
        end
    end, data.id)
end) 

-- openBeeHouseMenu Function
openBeeHouseMenu = function(data)
    lib.callback('sd-beekeeping:getHiveData', false, function(hData)
        if not hData or type(hData) ~= 'table' then print('Error retrieving Data') return end
        local hiveData = hData.data
        local hiveOptions = {}
        if hiveData then
            local owner = hData.citizenid 
            local citizenid = SD.GetIdentifier()
            local collaborators = hData.collaborators or {}

            -- Capturing Bees
            hiveOptions[#hiveOptions+1] = {
                title = locale('houses.capturing'),
                description = locale('houses.capturing_description', {progress = (hiveData.time / Beekeeping.House.CaptureTime) * 100}),
                icon = 'fa-solid fa-spinner fa-spin',
                progress = (hiveData.time / Beekeeping.House.CaptureTime) * 100,
            }

            -- Queens Management
            hiveOptions[#hiveOptions+1] = {
                title = locale('houses.queens', {currentQueens = hiveData.queens, maxQueens = Beekeeping.House.MaxQueens}),
                description = locale('houses.queens_description', {currentQueens = hiveData.queens, maxQueens = Beekeeping.House.MaxQueens}),
                icon = SD.GetItemImage(Beekeeping.Items.QueenItem),
                progress = (hiveData.queens / Beekeeping.House.MaxQueens) * 100,
                colorScheme = GetProgressColor((hiveData.queens / Beekeeping.House.MaxQueens) * 100),
                arrow = true,
                onSelect = function()
                    if hiveData.queens <= 0 then 
                        TriggerEvent('sd-beekeeping:openBeeHouse', hData) 
                        SD.ShowNotification(locale('notifications.not_enough_bees'), 'error') 
                        return 
                    end
                    WithdrawBeeDialog(hData.id, 'queens', hiveData.queens, hData)
                end
            }

            -- Workers Management
            hiveOptions[#hiveOptions+1] = {
                title = locale('houses.workers', {currentWorkers = hiveData.workers, maxWorkers = Beekeeping.House.MaxWorkers}),
                description = locale('houses.workers_description', {currentWorkers = hiveData.workers, maxWorkers = Beekeeping.House.MaxWorkers}),
                icon = SD.GetItemImage(Beekeeping.Items.WorkerItem),
                progress = (hiveData.workers / Beekeeping.House.MaxWorkers) * 100,
                colorScheme = GetProgressColor((hiveData.workers / Beekeeping.House.MaxWorkers) * 100),
                arrow = true,
                onSelect = function()
                    if hiveData.workers <= 0 then 
                        TriggerEvent('sd-beekeeping:openBeeHouse', hData) 
                        SD.ShowNotification(locale('notifications.not_enough_bees'), 'error') 
                        return 
                    end
                    WithdrawBeeDialog(hData.id, 'workers', hiveData.workers, hData)
                end
            }

            -- Maintenance and Repair Option
            if Beekeeping.Expiry.EnableExpiration then
                local durability = hData.durability or 100
                local repairCost = (100 - durability) * Beekeeping.Expiry.RepairCostPerOne
                local canRepair = durability < 100

                hiveOptions[#hiveOptions+1] = {
                    title = locale('houses.maintenance_and_repair_title'),
                    description = locale('houses.maintenance_and_repair_description'),
                    icon = "fa-solid fa-screwdriver-wrench",
                    onSelect = function()
                        openMaintenanceMenu(hData, repairCost, canRepair, data, "house")
                    end
                }
            end

            -- Refresh House Data Option
            hiveOptions[#hiveOptions+1] = {
                title = locale('houses.refresh'),
                description = locale('houses.refresh_description'),
                icon = 'fa-solid fa-rotate',
                onSelect = function()
                    openBeeHouseMenu(hData)  -- Refresh with updated data
                end
            }

            -- Destroy House Option
            hiveOptions[#hiveOptions+1] = {
                title = locale('houses.destroy'),
                description = locale('houses.destroy_description'),
                icon = 'fa-solid fa-trash',
                onSelect = function()
                    OpenDeleteConfirmDialog(hData.id, hData, 'house', locale('houses.confirm_destroy'))
                end
            }

            if Beekeeping.LockAccess then 
                -- Return to Main Menu
                hiveOptions[#hiveOptions+1] = {
                    title = locale('misc.return_to_menu'),
                    icon = 'arrow-left',
                    onSelect = function()
                        TriggerEvent('sd-beekeeping:openBeeHouse', data)
                    end
                }
            end
        else
            hiveOptions = {{
                title = locale('notifications.title'),
                description = locale('notifications.house_error'),
                icon = 'fa-solid fa-ban'
            }}
        end

        lib.registerContext({
            id = 'sdbeekeeping_house_menu',
            title = locale('houses.title'),
            options = hiveOptions,
        })

        lib.showContext('sdbeekeeping_house_menu')
    end, data.id)
end

WithdrawBeeDialog = function(id, type, max, originalData)
    lib.hideContext()
    local title
    if type == 'queens' then title = locale('houses.withdraw_queens')
    elseif type == 'workers' then title = locale('houses.withdraw_workers') end

    local input = lib.inputDialog(title, {
        {
            type = 'slider',
            min = 1,
            max = max,
            step = 1,
            icon = 'fa-solid fa-hashtag'
        }
    })

    if input then
        TriggerServerEvent('sd-beekeeping:withdrawBee', id, type, input[1])
        Wait(50)
        TriggerEvent('sd-beekeeping:openBeeHouse', originalData)
    end
end

OpenDeleteConfirmDialog = function(id, originalData, type, header)
    lib.hideContext()
    local confirmed = lib.alertDialog({
        header = header,
        centered = true,
        cancel = true,
        size = 'md'
    })
    
    if confirmed == 'confirm' then TriggerServerEvent('sd-beekeeping:removeStructure', id) end
end

RegisterNetEvent('sd-beekeeping:openBeeHive', function(data)
    lib.callback('sd-beekeeping:getHiveMembersData', false, function(hMemberData)
        if not hMemberData then 
            print('Error retrieving Data') 
            return 
        end

        local owner = hMemberData.citizenid
        local citizenid = SD.GetIdentifier()
        local collaborators = hMemberData.collaborators or {}

        if Beekeeping.LockAccess then 
            if tostring(citizenid) ~= tostring(owner) and not SD.Table.Contains(collaborators, citizenid) then
                SD.ShowNotification(locale('notifications.no_access'), 'error')
                return
            end

            local mainMenuOptions = {
                {
                    title = locale('hives.main_menu_title'),
                    description = locale('hives.main_menu_description'),
                    icon = 'fa-brands fa-hive',
                    onSelect = function()
                        openBeeHive(data)
                    end
                },
                {
                    title = locale('collaborators_menu.collaborators_menu_title'),
                    description = locale('collaborators_menu.collaborators_menu_description'),
                    icon = 'fa-solid fa-user-friends',
                    onSelect = function()
                        openCollaboratorsMenu(hMemberData, data.id, "hive")
                    end
                }
            }

            lib.registerContext({
                id = 'sdbeekeeping_hive_menu',
                title = locale('hives.menu_title'),
                options = mainMenuOptions,
            })
            lib.showContext('sdbeekeeping_hive_menu')
        else
            openBeeHive(data)
        end
    end, data.id)
end)

openBeeHive = function(data)
    local originalData = data
    lib.callback('sd-beekeeping:getHiveData', false, function(hData)
        if not hData or type(hData) ~= 'table' then print('Error retrieving Data') return end
        local hiveData = hData.data
        local hiveOptions = {}
        if hiveData then
            local owner = hData.citizenid
            local citizenid = SD.GetIdentifier()
            local collaborators = hData.collaborators or {}
            local honeyType = hiveData.honeyType or 'basic'
            local honeyData = Beekeeping.HoneyTypes[honeyType]
            local honeyDisplayName = honeyData.displayName or 'Bee Honey'
            local honeyItem = honeyData.item or Beekeeping.Items.HoneyItem

            -- Hive Production Status
            local isProductionDisabled = not hiveData.haveQueen or (hiveData.workers or 0) < Beekeeping.Hives.NeededWorkers
            local adjustedHoneyTime = hData.adjustedHoneyTime or Beekeeping.Hives.HoneyTime
            hiveOptions[#hiveOptions+1] = {
                title = locale('hives.producing_status', {status = isProductionDisabled and locale('hives.status_inactive') or locale('hives.status_active')}),
                description = locale('hives.producing_description'),
                icon = 'fa-brands fa-hive',
                iconColor = isProductionDisabled and 'red' or 'green',
                progress = (hiveData.time / adjustedHoneyTime) * 100,
                disabled = isProductionDisabled 
            }

            -- Insert Queens
            if not hiveData.haveQueen then
                hiveOptions[#hiveOptions+1] = {
                    title = locale('hives.insert_queens_title', {needed = Beekeeping.Hives.NeededQueens}),
                    description = locale('hives.insert_queens_description', {needed = Beekeeping.Hives.NeededQueens}),
                    icon = SD.GetItemImage(Beekeeping.Items.QueenItem),
                    onSelect = function()
                        TriggerServerEvent('sd-beekeeping:insertQueen', data.id)
                    end
                }
            end

            -- Insert Workers
            if not hiveData.haveWorker then
                hiveOptions[#hiveOptions+1] = {
                    title = locale('hives.insert_workers_title', {needed = Beekeeping.Hives.NeededWorkers}),
                    description = locale('hives.insert_workers_description', {needed = Beekeeping.Hives.NeededWorkers}),
                    icon = SD.GetItemImage(Beekeeping.Items.WorkerItem),
                    onSelect = function()
                        local input = lib.inputDialog(locale('hives.insert_worker_amount'), {
                            {type = 'number', required = true, min = Beekeeping.Hives.NeededWorkers}
                        })
            
                        if not input or not input[1] then return end
                        local workerAmount = tonumber(input[1])
                        if workerAmount and workerAmount >= Beekeeping.Hives.NeededWorkers then
                            TriggerServerEvent('sd-beekeeping:insertWorker', data.id, workerAmount)
                        else
                            SD.ShowNotification(locale('notifications.not_enough_workers', {needed = Beekeeping.Hives.NeededWorkers}), 'error')
                        end
                    end
                }
            end

            -- Honey Level
            if hiveData.haveQueen and hiveData.haveWorker then
                hiveOptions[#hiveOptions+1] = {
                    title = locale('hives.honey_level_title_with_type', {honeyType = honeyDisplayName, currentHoney = hiveData.honey, maxHoney = Beekeeping.Hives.MaxHoney}),
                    description = locale('hives.honey_level_description_with_type', {honeyType = honeyDisplayName}),
                    icon = SD.GetItemImage(honeyItem),
                    progress = (hiveData.honey / Beekeeping.Hives.MaxHoney) * 100,
                    colorScheme = GetProgressColor((hiveData.honey / Beekeeping.Hives.MaxHoney) * 100),
                    arrow = true,
                    onSelect = function()
                        if hiveData.honey <= 0 then 
                            openBeeHive(originalData) 
                            SD.ShowNotification(locale('notifications.not_enough_product'), 'error') 
                            return 
                        end
                        WithdrawProductDialog(data.id, 'honey', hiveData.honey, originalData, honeyType)
                    end
                }
            end

            -- Wax Level
            if hiveData.haveQueen and hiveData.haveWorker then
                hiveOptions[#hiveOptions+1] = {
                    title = locale('hives.wax_level_title', {currentWax = hiveData.wax, maxWax = Beekeeping.Hives.MaxWax}),
                    description = locale('hives.wax_level_description'),
                    icon = SD.GetItemImage(Beekeeping.Items.WaxItem),
                    progress = (hiveData.wax / Beekeeping.Hives.MaxWax) * 100,
                    colorScheme = GetProgressColor((hiveData.wax / Beekeeping.Hives.MaxWax) * 100),
                    arrow = true,
                    onSelect = function()
                        if hiveData.wax <= 0 then 
                            openBeeHive(originalData) 
                            SD.ShowNotification(locale('notifications.not_enough_product'), 'error') 
                            return 
                        end
                        WithdrawProductDialog(data.id, 'wax', hiveData.wax, originalData)
                    end
                }

                hiveOptions[#hiveOptions+1] = {
                    title = locale('hives.worker_management'),
                    description = locale('hives.worker_management_description'),
                    icon = 'fa-solid fa-briefcase',
                    onSelect = function()
                        openWorkerManagementMenu(hiveData, originalData)
                    end
                }

            if Beekeeping.Expiry.EnableExpiration then
                local durability = hData.durability or 100
                local repairCost = (100 - durability) * Beekeeping.Expiry.RepairCostPerOne
                local canRepair = durability < 100

                hiveOptions[#hiveOptions+1] = {
                    title = locale('hives.maintenance_and_repair_title'),
                    description = locale('hives.maintenance_and_repair_description'),
                    icon = "fa-solid fa-screwdriver-wrench",
                    onSelect = function()
                        openMaintenanceMenu(hData, repairCost, canRepair, data, "hive")
                    end
                }
            end

            -- Refresh Option
            hiveOptions[#hiveOptions+1] = {
                title = locale('hives.refresh'),
                description = locale('hives.refresh_description'),
                icon = 'fa-solid fa-rotate',
                onSelect = function()
                    openBeeHive(originalData)
                end
            }
        end
            -- Destruction Option
            hiveOptions[#hiveOptions+1] = {
                title = locale('hives.destroy'),
                description = locale('hives.destroy_description'),
                icon = 'fa-solid fa-trash',
                onSelect = function()
                    OpenDeleteConfirmDialog(data.id, originalData, 'hive', locale('hives.confirm_destroy'))
                end
            }

            if Beekeeping.LockAccess then 
                hiveOptions[#hiveOptions+1] = {
                title = locale('misc.return_to_menu'),
                icon = 'arrow-left',
                onSelect = function()
                    TriggerEvent('sd-beekeeping:openBeeHive', data)
                end
            }
        end
        else
            hiveOptions = {{
                title = locale('notifications.title'),
                description = locale('notifications.hive_error'),
                icon = 'fa-solid fa-ban'
            }}
        end

        lib.registerContext({
            id = 'sdbeekeeping_hive_menu',
            title = locale('hives.menu_title'),
            options = hiveOptions,
        })

        lib.showContext('sdbeekeeping_hive_menu')
    end, data.id)
end

openWorkerManagementMenu = function(hiveData, originalData)
    local workerMenuOptions = {
        {
            title = locale('hives.insert_workers_title'),
            description = locale('hives.insert_more_workers'),
            icon = SD.GetItemImage(Beekeeping.Items.WorkerItem),
            onSelect = function()
                local input = lib.inputDialog(locale('hives.insert_worker_amount'), {
                    {type = 'number', required = true, min = 1}
                })

                if input and input[1] then
                    local workerAmount = tonumber(input[1])
                    if workerAmount and workerAmount > 0 then
                        TriggerServerEvent('sd-beekeeping:insertWorker', originalData.id, workerAmount)
                    end
                end
            end
        },
        {
            title = locale('hives.worker_level_title', {currentWorkers = hiveData.workers or 0, maxWorkers = Beekeeping.Hives.MaxWorkers}),
            description = locale('hives.worker_level_description'),
            icon = SD.GetItemImage(Beekeeping.Items.WorkerItem),
            progress = ((hiveData.workers or 0) / Beekeeping.Hives.MaxWorkers) * 100,
            colorScheme = GetProgressColor(((hiveData.workers or 0) / Beekeeping.Hives.MaxWorkers) * 100)
        },

    {
        title = locale('misc.return_to_menu'),
        icon = 'fa-solid fa-arrow-left',
        onSelect = function()
            openBeeHive(originalData)
        end
    }}


    lib.registerContext({
        id = 'sdbeekeeping_hive_worker_menu',
        title = locale('hives.worker_management'),
        options = workerMenuOptions,
})
lib.showContext('sdbeekeeping_hive_worker_menu')
end

openCollaboratorsMenu = function(hData, hiveId, buildingType)
    local collaboratorMenuOptions = {}
    local owner = hData.citizenid
    local citizenid = SD.GetIdentifier()
    local collaborators = hData.collaborators or {}

    -- Display the Leader (Owner)
    collaboratorMenuOptions[#collaboratorMenuOptions+1] = {
        title = locale('collaborators_menu.owner_title', {owner = owner}),
        description = locale('collaborators_menu.owner_description'),
        icon = 'fa-solid fa-crown',
    }

    -- List Current Collaborators and Option to Remove (For Owner)
    if #collaborators > 0 then
        for _, collaborator in ipairs(collaborators) do
            collaboratorMenuOptions[#collaboratorMenuOptions+1] = {
                title = collaborator,
                description = locale('collaborators_menu.collaborator_listed_description'),
                icon = 'fa-solid fa-user-tag',
                onSelect = tostring(citizenid) == tostring(owner) and function()
                    openRemoveCollaboratorConfirmMenu(hiveId, collaborator)
                end or nil
            }
        end
    else
        collaboratorMenuOptions[#collaboratorMenuOptions+1] = {
            title = locale('collaborators_menu.no_collaborators_title'),
            description = locale('collaborators_menu.no_collaborators_description'),
            icon = 'fa-solid fa-user-slash',
            disabled = true
        }
    end

    -- Option to Add a Collaborator (Only if the player is the owner)
    if tostring(citizenid) == tostring(owner) then
        collaboratorMenuOptions[#collaboratorMenuOptions+1] = {
            title = locale('collaborators_menu.add_collaborator_title'),
            description = locale('collaborators_menu.add_collaborator_description'),
            icon = 'fa-solid fa-user-plus',
            onSelect = function()
                local input = lib.inputDialog(locale('collaborators_menu.add_collaborator_title'), {
                    {
                        type = 'input',
                        label = locale('collaborators_menu.add_collaborator_prompt'),
                        required = true,
                        placeholder = locale('collaborators_menu.add_collaborator_placeholder'),
                        icon = 'fa-solid fa-id-badge',
                    },
                    {
                        type = 'checkbox',
                        label = locale('collaborators_menu.add_to_all_facilities_label'),
                        description = locale('collaborators_menu.add_to_all_facilities_description'),
                        default = false,
                    }
                })

                if input and input[1] then
                    local collaboratorIdentifier = input[1]
                    local addToAll = input[2] -- Boolean value from the checkbox

                    TriggerServerEvent('sd-beekeeping:addCollaborator', hiveId, collaboratorIdentifier, addToAll)
                end
            end
        }
    end

    collaboratorMenuOptions[#collaboratorMenuOptions+1] = {
        title = locale('misc.return_to_menu'),
        icon = 'arrow-left',
        onSelect = function()
            if buildingType == "hive" then
                TriggerEvent('sd-beekeeping:openBeeHive', {id = hiveId})
            elseif buildingType == "house" then
                TriggerEvent('sd-beekeeping:openBeeHouse', {id = hiveId})
            end
        end
    }

    lib.registerContext({
        id = 'sdbeekeeping_hive_collaborators_menu',
        title = locale('collaborators_menu.collaborators_menu_title'),
        options = collaboratorMenuOptions,
    })
    lib.showContext('sdbeekeeping_hive_collaborators_menu')
end

openRemoveCollaboratorConfirmMenu = function(hiveId, collaborator)
    local input = lib.inputDialog(locale('collaborators_menu.remove_collaborator_title'), {
        {
            type = 'checkbox',
            label = locale('collaborators_menu.remove_from_all_facilities_label'),
            description = locale('collaborators_menu.remove_from_all_facilities_description'),
            default = false,
        }
    })

    if input then
        local removeFromAll = input[1]
        TriggerServerEvent('sd-beekeeping:removeCollaborator', hiveId, collaborator, removeFromAll)
    end
end

openMaintenanceMenu = function(hData, repairCost, canRepair, originalData, buildingType)
    local maintenanceMenuOptions = {
        {
            title = locale('maintenance_menu.durability_status_title'),
            description = locale('maintenance_menu.durability_status_description', {durability = hData.durability or 100}),
            icon = 'fa-solid fa-hammer',
            progress = hData.durability or 100
        },
        {
            title = locale('maintenance_menu.repair_hive_title'),
            description = locale('maintenance_menu.repair_hive_description', {repairCost = repairCost}),
            icon = 'fa-solid fa-wrench',
            disabled = not canRepair,
            onSelect = function()
                if canRepair then
                    local input = lib.inputDialog(locale('maintenance_menu.repair_hive_input_title'), {
                        {
                            type = 'slider',
                            min = 1,
                            max = 100 - (hData.durability or 100),
                            step = 1,
                            icon = 'fa-solid fa-hashtag',
                            label = locale('maintenance_menu.repair_hive_input_description', {costPerUnit = Beekeeping.Expiry.RepairCostPerOne})
                        }
                    })

                    if input then
                        local repairAmount = tonumber(input[1])
                        local totalCost = repairAmount * Beekeeping.Expiry.RepairCostPerOne
                        openRepairConfirmationMenu(hData.id, repairAmount, totalCost, originalData, buildingType)
                    end
                end
            end
        },
        {
            title = locale('maintenance_menu.return_to_hive_menu'),
            icon = 'fa-solid fa-arrow-left',
            onSelect = function()
                if buildingType == "hive" then
                    openBeeHive(originalData)
                elseif buildingType == "house" then
                    openBeeHouseMenu(originalData)
                end
            end
        }
    }

    -- Register and show the maintenance menu
    lib.registerContext({
        id = 'sdbeekeeping_hive_maintenance_menu',
        title = locale('maintenance_menu.title'),
        options = maintenanceMenuOptions,
    })
    lib.showContext('sdbeekeeping_hive_maintenance_menu')
end

openRepairConfirmationMenu = function(hiveId, repairAmount, totalCost, originalData)
    local confirmMenuOptions = {
        {
            title = locale('maintenance_menu.confirm_repair'),
            description = locale('maintenance_menu.confirm_repair_description', {repairAmount = repairAmount, totalCost = totalCost}),
            icon = 'fa-solid fa-check',
            onSelect = function()
                -- Trigger a server event to handle the repair
                TriggerServerEvent('sd-beekeeping:repairFacility', hiveId, repairAmount, totalCost)
                if buildingType == "hive" then
                    openBeeHive(originalData)
                elseif buildingType == "house" then
                    openBeeHouseMenu(originalData)
                end
            end
        },
        {
            title = locale('maintenance_menu.cancel_repair'),
            icon = 'fa-solid fa-times',
            onSelect = function()
                if buildingType == "hive" then
                    openBeeHive(originalData)
                elseif buildingType == "house" then
                    openBeeHouseMenu(originalData)
                end
            end
        }
    }

    lib.registerContext({
        id = 'sdbeekeeping_hive_repair_confirmation_menu',
        title = locale('maintenance_menu.confirm_repair_title'),
        options = confirmMenuOptions,
    })
    lib.showContext('sdbeekeeping_hive_repair_confirmation_menu')
end

WithdrawProductDialog = function(id, type, max, originalData, honeyType)
    lib.hideContext()
    local title
    if type == 'honey' then 
        title = locale('hives.withdraw_honey_with_type', {honeyType = Beekeeping.HoneyTypes[honeyType].displayName or 'Bee Honey'})
    elseif type == 'wax' then 
        title = locale('hives.withdraw_wax') 
    end

    local input = lib.inputDialog(title, {
        {
            type = 'slider',
            min = 1,
            max = max,
            step = 1,
            icon = 'fa-solid fa-hashtag'
        }
    })

    if input then
        TriggerServerEvent('sd-beekeeping:withdrawProduct', id, type, input[1])
        Wait(50)
        openBeeHive(originalData)
    end
end