---@param type string
function GangTableMenu(type)
    for recipeType, recipes in pairs(Config.CraftingRecipes) do
        if type == recipeType and type ~= "Blueprint" then
            local craftingOptions = {}
            local scrollMessageAdded = false  -- Flag to check if the scroll message is added
            for itemName, recipe in pairs(recipes) do
                local description = Translations.menus.general.requirements
                for _, ingredient in ipairs(recipe.items) do
                    description = description .. "\n" .. ingredient.amount .. "x " .. GetItemLabel(ingredient.item)
                end
                -- Check if the scroll message has been added before inserting it
                if not scrollMessageAdded then
                    table.insert(craftingOptions, {
                        title = Translations.menus.general.dontForgetToScroll,
                        disabled = true,
                    })
                    scrollMessageAdded = true  -- Set the flag to true after adding the message
                end

                table.insert(craftingOptions, {
                    title = recipe.result.label,
                    description = description,
                    icon = GetItemImage(recipe.result.item),
                    image = GetItemImage(recipe.result.item),
                    arrow = true,
                    onSelect = function()
                        HowManyInput(recipe.items, recipe.result.item, recipe.result.amount, recipe.duration, recipe.result.label, recipe.dict, recipe.clip)
                    end
                })
            end
            lib.registerContext({
                id = 'GangTableMenu' .. type,
                title = string.format(Translations.menus.gangTableMenu.title, type),
                options = craftingOptions
            })
            lib.showContext('GangTableMenu' .. type)
        elseif type == "Blueprint" then
            SpecialGangTableMenu("Blueprint")
        end
    end
end

function SaveWarOutfitConfirmationMenu(gangId, outfit)
    local menuOptions = {}
    table.insert(menuOptions, {
        title = Translations.menus.saveWarOutfit,
        icon = "fa-solid fa-shirt",
        iconColor = "green",
        description = Translations.menus.saveWarOutfit.confirmDesc,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:SaveWarOutfit', outfit)
            TriggerEvent('cb-gangsystem:client:Notify', Translations.success.outfitSaved, Translations.success.outfitSavedDesc, "success")
        end
    })
    table.insert(menuOptions, {
        title = Translations.menus.general.no,
        icon = "fa-solid fa-shirt",
        iconColor = "red",
        description = "Selecting this will not change the war outfit, and close the menu!",
        onSelect = function()
            return
        end
    })
    lib.registerContext({
        id = 'SaveWarOutfitConfirmationMenu',
        title = "Confirm Changes",
        options = menuOptions
    })
    lib.showContext('SaveWarOutfitConfirmationMenu')
end

function ShowWarHistoryDetailsActive(GangData, gangID, warID)
    local wars = lib.callback.await('cb-gangsystem:server:GetAllWars', false)
    local menuOptions = {}
    for _, war in ipairs(wars) do
        if war.id == warID then
            local warType = war.warType
            if war.warType == "Turf" then
                warType = "War for " .. exports['cb-gangsystem']:GetTurfName(war.zone)
            end
            table.insert(menuOptions, {
                title = GangData[war.declareeGangID].name .. " vs. " .. GangData[war.gangID].name,
                description = warType,
                icon = "fa-solid fa-gun",
                iconColor = "red",
                arrow = false,
                disabled = true,
            })
            table.insert(menuOptions, {
                title = GangData[war.declareeGangID].name .. " - " .. war.declareeScore,
                icon = "fa-solid fa-gun",
                iconColor = "purple",
                arrow = false,
                disabled = false,
                onSelect = function()
                    lib.showContext('ShowWarHistoryDetailsActive')
                end
            })
            table.insert(menuOptions, {
                title = GangData[war.gangID].name .. " - " .. war.gangScore,
                icon = "fa-solid fa-gun",
                iconColor = "purple",
                arrow = false,
                disabled = false,
                onSelect = function()
                    lib.showContext('ShowWarHistoryDetailsActive')
                end
            })
        end
    end
    table.insert(menuOptions, {
        title = "Go Back",
        icon = "fa-solid fa-arrow-left",
        iconColor = "orange",
        arrow = false,
        onSelect = function()
            ShowWarHistoryMenu(GangData, gangID)
        end
    })

    -- Register the context menu with all the gangs
    lib.registerContext({
        id = 'ShowWarHistoryDetailsActive',
        title = "War Details",
        options = menuOptions
    })
    
    -- Show the context menu
    lib.showContext('ShowWarHistoryDetailsActive')
end

function OpenGangStorageMenu(GangData, gangID)
    local menuOptions = {}
    local gangRank = GetPlayerData().gang.grade.level
    local moveStoragePerms = HasPermission(gangID, gangRank, "move_gang_storage")
    table.insert(menuOptions, {
        title = "Open Storage",
        description = "Open storage for your Gang",
        icon = "fa-solid fa-boxes",
        iconColor = "green",
        arrow = false,
        onSelect = function()
            local gangName = GangData[gangID].name
            OpenStash(gangName)
        end
    })

    table.insert(menuOptions, {
        title = "Move Storage",
        description = "Move the storage location for your Gang",
        icon = "fa-solid fa-boxes",
        iconColor = "orange",
        disabled = not ((not moveStoragePerms) or (PlayerData.citizenid == GangData[gangID].leader_cid)),
        arrow = false,
        onSelect = function()
            TriggerEvent('cb-gangsystem:client:changeStorageCoords')
        end
    })

    if Config.EnableResetGangStorage then
        table.insert(menuOptions, {
            title = "Reset Storage",
            description = "Reset the storage location for your Gang",
            icon = "fa-solid fa-boxes",
            iconColor = "red",
            arrow = false,
            disabled = not (PlayerData.citizenid == GangData[gangID].leader_cid),
            onSelect = function()
                TriggerEvent('cb-gangsystem:client:ResetGangStorage', gangID)
            end
        })
    end

    -- Register the context menu with all the gangs
    lib.registerContext({
        id = 'OpenGangStorageMenu',
        title = "War Details",
        options = menuOptions
    })
    
    -- Show the context menu
    lib.showContext('OpenGangStorageMenu')
end


function ShowWarHistoryMenu(GangData, gangID)
    local wars = lib.callback.await('cb-gangsystem:server:GetAllWars', false)
    local menuOptions = {}

    for _, war in ipairs(wars) do
        -- Fetch war details and prepare title and description
        local warDescription = string.format("War Type: %s | Status: ACTIVE WAR" , war.warType)

        if war.warStatus == "Active" then
            -- Insert the war as a menu option
            table.insert(menuOptions, {
                title = war.declareeGangName .. " vs. " .. war.gangName,
                icon = "fa-solid fa-gun",
                iconColor = "purple",
                description = warDescription,
                onSelect = function()
                    ShowWarHistoryDetailsActive(GangData, gangID, war.id)
                end
            })
        end
    end
    for _, war in ipairs(wars) do
        local gangScore = war.gangScore
        local declareeGangScore = war.declareeScore
        local winningGang = "Undecided"
        local playerLosingGang = false
        local playerWinningGang = false
    
        -- Determine the winning gang based on score or surrender
        if war.surrenderGang == 0 then  -- No surrender, normal score comparison
            if gangScore > declareeGangScore then
                winningGang = war.gangID
            elseif declareeGangScore > gangScore then
                winningGang = war.declareeGangID
            end
        else  -- Surrender occurred
            if war.surrenderGang == war.gangID then
                winningGang = war.declareeGangID
            else
                winningGang = war.gangID
            end
        end
    
        -- Determine if the player's gang is the winning or losing gang
        if winningGang ~= "Undecided" then
            if winningGang == gangID then
                playerWinningGang = true  -- Player's gang won
            elseif war.gangID == gangID or war.declareeGangID == gangID then
                playerLosingGang = true  -- Player's gang is involved but lost
            end
        end
    
        -- Get the name of the winning gang (or "Undecided")
        local winningGangName = "Undecided"
        if winningGang ~= "Undecided" then
            winningGangName = GangData[winningGang].name
        end
    
        local iconColor = "orange"
        if playerWinningGang then
            iconColor = "green"
        elseif playerLosingGang then
            iconColor = "red"
        end

        -- Description for the war
        local warDescription = string.format("War Type: %s | Status: %s | Winner: %s", war.warType, war.warStatus, winningGangName)
    
        -- Only show completed wars
        if war.warStatus == "Complete" then
            -- Insert the war as a menu option
            table.insert(menuOptions, {
                title = war.declareeGangName .. " vs. " .. war.gangName,
                icon = "fa-solid fa-gun",
                iconColor = iconColor,
                arrow = false,
                description = warDescription,
                onSelect = function()
                    lib.showContext('GangWarHistoryMenu')
                end
            })
        end
    end    

    table.insert(menuOptions, {
        title = "Go Back",
        icon = "fa-solid fa-arrow-left",
        iconColor = "orange",
        arrow = false,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:RefreshGangMenu')
        end
    })

    -- Register the context menu with all the gangs
    lib.registerContext({
        id = 'GangWarHistoryMenu',
        title = "War Menu",
        options = menuOptions
    })
    
    -- Show the context menu
    lib.showContext('GangWarHistoryMenu')
end

function ShowWarMenu(gangID)
    local menuOptions = {}
    local gangRank = GetPlayerData().gang.grade.level
    local changeOutfitPermissions = HasPermission(gangID, gangRank, "declare_war_outfit")
    if changeOutfitPermissions then
        table.insert(menuOptions, {
            title = "Declare War Outfit",
            icon = "fa-solid fa-shirt",
            iconColor = "teal",
            description = "Check-In with Franklin and take part in War",
            onSelect = function()
                local outfit = GetPlayerOutfit(cache.ped)
                SaveWarOutfitConfirmationMenu(gangID, outfit)
            end
        })
    end

    table.insert(menuOptions, {
        title = "Check In",
        icon = "fa-solid fa-clipboard",
        iconColor = "black",
        description = "Check-In with Franklin and take part in War",
        onSelect = function()
            if Config.GangWars.RequireOutfitsDuringWar then
                local warOutfit = lib.callback.await('cb-gangsystem:server:CheckWarOutfit', false)
                if warOutfit == 'NA' or warOutfit == nil then
                    TriggerEvent('cb-gangsystem:client:Notify', "No War Outfit", "You do not have a War Outfit set. Have one of your Leaders come speak to me!", "error")
                    return
                else
                    -- Table mapping component names to their respective component IDs
                    local componentIds = {
                        mask = 1,
                        hair = 2,
                        torso = 3,
                        legs = 4,
                        bags = 5,
                        shoes = 6,
                        accessories = 7,
                        undershirts = 8,
                        bodyarmor = 9,
                        decals = 10,
                        tops = 11
                    }

                    -- Iterate through the warOutfit table and apply each component variation
                    for k, v in pairs(warOutfit) do
                        -- Check if the component name exists in the mapping
                        if componentIds[k] then
                            SetPedComponentVariation(cache.ped, componentIds[k], v.drawable, v.texture, 0)
                        end
                    end

                    -- Additional components like hats, glasses, ears, watches, and bracelets are separate from the main components
                    SetPedPropIndex(cache.ped, 0, warOutfit.hats.drawable, warOutfit.hats.texture, true)        -- Hats
                    SetPedPropIndex(cache.ped, 1, warOutfit.glasses.drawable, warOutfit.glasses.texture, true)  -- Glasses
                    SetPedPropIndex(cache.ped, 2, warOutfit.ears.drawable, warOutfit.ears.texture, true)        -- Ears
                    SetPedPropIndex(cache.ped, 6, warOutfit.watches.drawable, warOutfit.watches.texture, true)  -- Watches
                    SetPedPropIndex(cache.ped, 7, warOutfit.bracelets.drawable, warOutfit.bracelets.texture, true)  -- Bracelets
                    -- TODO: Lots of testing with this. Ensure that drawables and textures are being saved correctly. We want to ensure that these are the outfits that are used during war
                end
            end
            local checkInResult = lib.callback.await('cb-gangsystem:server:WarCheckIn', false)
            if checkInResult == "Allowed" then
                TriggerEvent('cb-gangsystem:client:Notify', "Check In", "You checked in to the war. Be careful out there!", "success")
            elseif checkInResult == "Not Allowed" then
                TriggerEvent('cb-gangsystem:client:Notify', "Check In", "I will only allow you to have a +1 advantage. This keeps you safe and things fair. Try again later!", "error")
            elseif checkInResult == "Already Checked In" then
                TriggerEvent('cb-gangsystem:client:Notify', "Check In", "You are already checked in. Get your head on straight!", "error")
            end
            -- TODO: Add a system that checks periodically if the player is wearing the War Outfit. Apply war penalties if the player is checked in and NOT wearing the war Outfit. Add advanced notifications
            -- "You are checked in, but not wearing the War Outfit. Penalties will be applied in 10 minutes, and will continue to apply every 30 seconds until you check out or change your outfit to the War Outfit"
        end
    })
    local PlayerData = GetPlayerData()
    local disableCheckOut = lib.callback.await('cb-gangsystem:server:IsPlayerCheckedIn', false, PlayerData.source)
    table.insert(menuOptions, {
        title = "Check Out",
        icon = "fa-solid fa-hiking",
        iconColor = "orange",
        description = "Check Out of the War",
        disabled = not disableCheckOut,
        onSelect = function()
            local checkOutResult =  lib.callback.await('cb-gangsystem:server:WarCheckOut', false)
            if checkOutResult then
                TriggerEvent('cb-gangsystem:client:Notify', "Check Out", "You checked out of the war. Don't be gone too long!", "success")
            else
                TriggerEvent('cb-gangsystem:client:Notify', "Check Out", "There was an error checking you out. Try again!", "error")
            end
        end
    })

    table.insert(menuOptions, {
        title = "Surrender",
        icon = "fa-solid fa-flag",
        iconColor = "white",
        description = "Raise the white flag and surrender to the rival gang. This ends the war.",
        onSelect = function()
            SurrenderConfirmationMenu(gangID)
        end
    })

    table.insert(menuOptions, {
        title = "Go Back",
        icon = "fa-solid fa-arrow-left",
        iconColor = "orange",
        arrow = false,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:RefreshGangMenu')
        end
    })

    -- Register the context menu with all the gangs
    lib.registerContext({
        id = 'GangWarMenu',
        title = "War Menu",
        options = menuOptions
    })
    
    -- Show the context menu
    lib.showContext('GangWarMenu')
end

function StopGangWarConfirm(GangData, gangId)
    local menuOptions = {}
    table.insert(menuOptions, {
        title = "Yes",
        icon = "fa-solid fa-gun",
        iconColor = "green",
        description = "Selecting this will stop the war",
        onSelect = function()
            TriggerServerEvent("cb-gangsystem:server:StaffStopWar", gangId)
            TriggerEvent('cb-gangsystem:client:Notify', "War Stopped", "You stopped the war between two gangs!", "success")
            local PlayerData = GetPlayerData()
            NotifyOnlineMembers(PlayerData.source, "The War has been stopped by the Gods!")
        end
    })
    table.insert(menuOptions, {
        title = "No",
        icon = "fa-solid fa-gun",
        iconColor = "red",
        description = "Selecting this will allow the war to continue",
        onSelect = function()
            return
        end
    })

    -- Register the context menu with all the gangs
    lib.registerContext({
        id = 'StopGangWarConfirm',
        title = "Are You Sure?",
        options = menuOptions
    })
    
    -- Show the context menu
    lib.showContext('StopGangWarConfirm')
end

function SurrenderConfirmationMenu(gangId)
    local menuOptions = {}
    table.insert(menuOptions, {
        title = "Yes",
        icon = "fa-solid fa-flag",
        iconColor = "white",
        description = "Selecting this will end the war",
        onSelect = function()
            TriggerServerEvent("cb-gangsystem:server:GangSurrender", gangId)
            TriggerEvent('cb-gangsystem:client:Notify', "War Stopped", "You surrendered to the rival gang!", "success")
            -- TODO: Send notification to other gang that they surrendered
        end
    })
    table.insert(menuOptions, {
        title = "No",
        icon = "fa-solid fa-gun",
        iconColor = "red",
        description = "Allow the war to continue!",
        onSelect = function()
            return
        end
    })

    -- Register the context menu with all the gangs
    lib.registerContext({
        id = 'SurrenderConfirmationMenu',
        title = "Confirm Surrender",
        options = menuOptions
    })
    
    -- Show the context menu
    lib.showContext('SurrenderConfirmationMenu')
end

function StaffModifyWarScoreMenu_SelectGang(GangData, warID, modifier)
    local menuOptions = {}
    local wars = lib.callback.await('cb-gangsystem:server:GetAllWars', false)
    for _, war in ipairs(wars) do
        if war.id == warID then
            table.insert(menuOptions, {
                title = GangData[war.gangID].name,
                icon = GangData[war.gangID].image,
                image = GangData[war.gangID].image,
                onSelect = function()
                    StaffModifyWarScore_Input(war.gangID, modifier, warID)
                end
            })
            table.insert(menuOptions, {
                title = GangData[war.declareeGangID].name,
                icon = GangData[war.declareeGangID].image,
                image = GangData[war.declareeGangID].image,
                onSelect = function()
                    StaffModifyWarScore_Input(war.declareeGangID, modifier, warID)
                end
            })
        end
    end
    lib.registerContext({
        id = 'StaffModifyWarScoreMenu_SelectGang',
        title = "Choose Gang",
        options = menuOptions
    })
    
    -- Show the context menu
    lib.showContext('StaffModifyWarScoreMenu_SelectGang')
end

function SelectedGangWarManageMenu(GangData, declareeID, warID)
    local menuOptions = {}
    local wars = lib.callback.await('cb-gangsystem:server:GetAllWars', false)
    for _, war in ipairs(wars) do
        if war.id == warID then
            table.insert(menuOptions, {
                title = "Stop Gang War",
                description = "Stop the Gang War completely with no winner.",
                icon = "fa-solid fa-trash",
                iconColor = "red",
                onSelect = function()
                    StopGangWarConfirm(GangData, declareeID)
                end
            })
            table.insert(menuOptions, {
                title = "End Gang War",
                description = "End the Gang War right now. Whoever has the higher score will win the war.",
                icon = "fa-solid fa-stop",
                iconColor = "red",
                onSelect = function()
                    -- TODO: End Gang War with a winner if the war score is not tied
                end
            })
            table.insert(menuOptions, {
                title = "Increase War Score",
                description = "Increase the War Score for a participating Gang",
                icon = "fa-solid fa-arrow-up",
                iconColor = "green",
                onSelect = function()
                    StaffModifyWarScoreMenu_SelectGang(GangData, war.id, "Increase")
                end
            })
            table.insert(menuOptions, {
                title = "Decrease War Score",
                description = "Decrease the War Score for a participating Gang",
                icon = "fa-solid fa-arrow-down",
                iconColor = "red",
                onSelect = function()
                    StaffModifyWarScoreMenu_SelectGang(GangData, war.id, "Decrease")
                end
            })
        end
    end
    table.insert(menuOptions, {
        title = "Go Back",
        icon = "fa-solid fa-arrow-left",
        iconColor = "orange",
        arrow = false,
        onSelect = function()
            lib.showContext('ManageGangWarMenu')
        end
    })
    lib.registerContext({
        id = 'SelectedGangWarManageMenu',
        title = "Manage Gang War",
        options = menuOptions
    })
    
    -- Show the context menu
    lib.showContext('SelectedGangWarManageMenu')
end

function ManageGangWarMenu(GangData)
    local activeWars = {}
    local wars = lib.callback.await('cb-gangsystem:server:GetAllWars', false)

    for _, war in ipairs(wars) do
        if war.warStatus == "Active" then
            table.insert(activeWars, {
                title = GangData[war.declareeGangID].name .. " vs. " .. GangData[war.gangID].name,
                icon = "fa-solid fa-gun",
                iconColor = "red",
                description = war.warType,
                onSelect = function()
                    SelectedGangWarManageMenu(GangData, war.declareeGangID, war.id)
                end
            })
        end
    end

    -- Check if there are no active wars
    if #activeWars == 0 then
        table.insert(activeWars, {
            title = "No Active Wars",
            icon = "fa-solid fa-info-circle",
            iconColor = "gray",
            description = "There are currently no active wars to stop.",
            disabled = true,
        })
    end

    table.insert(activeWars, {
        title = "Go Back",
        icon = "fa-solid fa-arrow-left",
        iconColor = "orange",
        arrow = false,
        onSelect = function()
            lib.showContext('gangStaffMenu')
        end
    })

    -- Register the context menu with all the gangs
    lib.registerContext({
        id = 'ManageGangWarMenu',
        title = "Active Gang Wars",
        options = activeWars
    })
    
    -- Show the context menu
    lib.showContext('ManageGangWarMenu')
end

function ConfirmTurfWarStart(playerGangId, gangId, type, zone, GangData)
    local confirmOptions = {}
    table.insert(confirmOptions, {
        title = "Yes",
        icon = "fa-solid fa-flag",
        iconColor = "red",
        description = "Declare war on " .. GangData[gangId].name .. " for " .. exports['cb-gangsystem']:GetTurfName(zone),
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:InitiateGangWar', playerGangId, gangId, type, zone)
        end
    })

    table.insert(confirmOptions, {
        title = "No",
        icon = "fa-solid fa-flag",
        iconColor = "white",
        description = "Keep the peace....for now!",
        onSelect = function()
            return
        end
    })

    -- Register the context menu with all the gangs
    lib.registerContext({
        id = 'ConfirmTurfWarStart',
        title = "Confirm Turf War",
        options = confirmOptions
    })
    
    -- Show the context menu
    lib.showContext('ConfirmTurfWarStart')
end

function ConfirmColorWarStart(playerGangId, gangId, type, GangData)
    local confirmOptions = {}
    table.insert(confirmOptions, {
        title = "Yes",
        icon = "fa-solid fa-flag",
        iconColor = "red",
        description = "Declare war on " .. GangData[gangId].name,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:InitiateGangWar', playerGangId, gangId, type)
        end
    })

    table.insert(confirmOptions, {
        title = "No",
        icon = "fa-solid fa-flag",
        iconColor = "white",
        description = "Keep the peace....for now!",
        onSelect = function()
            return
        end
    })

    -- Register the context menu with all the gangs
    lib.registerContext({
        id = 'ConfirmColorWarStart',
        title = "Confirm Turf War",
        options = confirmOptions
    })
    
    -- Show the context menu
    lib.showContext('ConfirmColorWarStart')
end

function ConfirmRegularWarStart(playerGangId, gangId, type, GangData)
    local confirmOptions = {}
    table.insert(confirmOptions, {
        title = "Yes",
        icon = "fa-solid fa-flag",
        iconColor = "red",
        description = "Declare war on " .. GangData[gangId].name,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:InitiateGangWar', playerGangId, gangId, type)
        end
    })

    table.insert(confirmOptions, {
        title = "No",
        icon = "fa-solid fa-flag",
        iconColor = "white",
        description = "Keep the peace....for now!",
        onSelect = function()
            return
        end
    })

    -- Register the context menu with all the gangs
    lib.registerContext({
        id = 'ConfirmRegularWarStart',
        title = "Confirm Regular War",
        options = confirmOptions
    })
    
    -- Show the context menu
    lib.showContext('ConfirmRegularWarStart')
end

function SelectTurfForWarMenu(playerGangId, gangId, GangData)
    local turfOptions = {}
    for k, v in pairs(Config.GangZones) do
        local description
        if v.community then
            description = "Community Turf"
        else
            description = "Gang Turf"
        end
        table.insert(turfOptions, {
            title = v.label,
            icon = "fa-solid fa-flag",
            iconColor = "orange",
            description = description,
            onSelect = function()
                ConfirmTurfWarStart(playerGangId, gangId, "Turf", v.zone, GangData)
            end
        })
    end

    -- Register the context menu with all the gangs
    lib.registerContext({
        id = 'SelectTurfForWarMenu',
        title = "Select Turf",
        options = turfOptions
    })
    
    -- Show the context menu
    lib.showContext('SelectTurfForWarMenu')
end

function SelectWarType(playerGangId, gangId, GangData)
    local warTypeOptions = {}
        table.insert(warTypeOptions, {
            title = "Turf War",
            description = "Are you beefing over turf?",
            icon = "fa-solid fa-flag",
            image = GangData[gangId].image,
            arrow = true,
            onSelect = function()
                SelectTurfForWarMenu(playerGangId, gangId, GangData)
            end
        })
        table.insert(warTypeOptions, {
            title = "Color War",
            description = "Are you beefing over colors?",
            icon = "fa-solid fa-palette",
            image = GangData[gangId].image,
            arrow = true,
            onSelect = function()
                ConfirmColorWarStart(playerGangId, gangId, "Color", GangData)
            end
        })

        table.insert(warTypeOptions, {
            title = "Regular War",
            description = "Is a rival gang non-compliant with your advances? Maybe a show of force can help...",
            icon = "fa-solid fa-gun",
            image = GangData[gangId].image,
            arrow = true,
            onSelect = function()
                ConfirmRegularWarStart(playerGangId, gangId, "Regular", GangData)
            end
        })

    -- Register the context menu with all the gangs
    lib.registerContext({
        id = 'SelectWarType',
        title = "Select War Type",
        options = warTypeOptions
    })
    
    -- Show the context menu
    lib.showContext('SelectWarType')
end

function SelectGangForWarMenu(GangData, playerGangId)
    local gangOptions = {}
    
    for gangId, gangInfo in pairs(GangData) do
        -- Check if the gang is not the player's own gang
        if gangId ~= playerGangId then
            table.insert(gangOptions, {
                title = gangInfo.name,
                description = "Home Turf: " .. gangInfo.home_turf,
                icon = gangInfo.image,
                image = gangInfo.image,
                arrow = true,
                onSelect = function()
                    local isAtWar = not (GangData[gangId].war == 0)
                    if not isAtWar then
                        SelectWarType(playerGangId, gangId, GangData)
                    else
                        TriggerEvent('cb-gangsystem:client:Notify', "Already At War", "This gang is already at war. Let them finish first or consider joining the war as an ally.", "error")
                    end
                end
            })
        end
    end

    -- Register the context menu with all the gangs
    lib.registerContext({
        id = 'SelectGangForWarMenu',
        title = "Select Gang",
        options = gangOptions
    })
    
    -- Show the context menu
    lib.showContext('SelectGangForWarMenu')
end

function OpenHelpMenu()
    local menuItems = {}

    table.insert(menuItems, {
        title = "Gang Prevalence",
        description = "Tell me about Gang Prevalence",
        icon = "fa-solid fa-star",
        iconColor = "yellow",
        arrow = true,
        onSelect = function()
            local message = "Gang Prevalence measures how well your crew is working within the systems I’ve set up. Are you handling the missions I’ve assigned? Moving enough product to keep the locals satisfied? Getting in on heists? Or are you just causing me headaches by drawing heat from the cops? These are just some of the things that impact your Gang Prevalence. And keep this in mind—it directly affects what kind of work I throw your way. If you can’t prove your worth, don’t expect to get the high-paying jobs."
            local messageSent = lib.callback.await('cb-gangsystem:server:SendGuidebookMessage', false, message)
            if messageSent then
                TriggerEvent('cb-gangsystem:client:Notify', "Message Sent", "Check your phone, I sent you a text message explaining things!", "success")
            elseif not messageSent then
                TriggerEvent('cb-gangsystem:client:Notify', "Gang Help", message, "info", 20000)
            end
        end
    })

    table.insert(menuItems, {
        title = "Gang Loyalty",
        description = "Tell me about Gang Loyalty",
        icon = "fa-solid fa-ranking-star",
        iconColor = "gold",
        arrow = true,
        onSelect = function()
            local message = "Loyalty defines your gang’s influence in any given territory. When it comes to turf wars, it’s simple—whoever’s got the most Loyalty calls the shots. That’s how you take control. There are plenty of ways to build up your Loyalty, but the big earners? Pushing product and helping me. If I were you, I’d start there."
            local messageSent = lib.callback.await('cb-gangsystem:server:SendGuidebookMessage', false, message)
            if messageSent then
                TriggerEvent('cb-gangsystem:client:Notify', "Message Sent", "Check your phone, I sent you a text message explaining things!", "success")
            elseif not messageSent then
                TriggerEvent('cb-gangsystem:client:Notify', "Gang Help", message, "info", 20000)
            end
        end
    })

    table.insert(menuItems, {
        title = "Gang War",
        description = "Tell me about Gang Wars",
        icon = "fa-solid fa-gun",
        iconColor = "red",
        arrow = true,
        onSelect = function()
            local message = "War is always the last option. In a perfect world, you’d all get along, and I wouldn’t have to clean up your messes. " .. 
            "But this isn't a perfect world, is it? If you're set on declaring war against a rival family, understand this: you're going to have to give up some \"things\" until it’s resolved." .. 
            "I’ve made it clear to all the other families - war should never be the first move. But if you’re reckless enough to get into one, make sure you win. " ..
            "At all costs. I don’t have patience for failures, and believe me, losing comes with consequences."
            local messageSent = lib.callback.await('cb-gangsystem:server:SendGuidebookMessage', false, message)
            if messageSent then
                TriggerEvent('cb-gangsystem:client:Notify', "Message Sent", "Check your phone, I sent you a text message explaining things!", "success")
            elseif not messageSent then
                TriggerEvent('cb-gangsystem:client:Notify', "Gang Help", message, "info", 20000)
            end
        end
    })

    table.insert(menuItems, {
        title = "Gang Missions",
        description = "Tell me about Gang Missions",
        icon = "fa-solid fa-arrows-down-to-people",
        iconColor = "teal",
        arrow = true,
        onSelect = function()
            local message = "I'm a busy man these days, managing a lot of people and a lot of business. My hands-on days might be behind me, but don’t think I’m out of the game. I still like to get involved when the need arises. From time to time, I’ll need favors—real work. And when I do, I’ll be counting on you and your crew to handle it. Pull through for me, and trust me, I’m a rich man. There’ll be a serious reward waiting for you if you get the job done right."
            local messageSent = lib.callback.await('cb-gangsystem:server:SendGuidebookMessage', false, message)
            if messageSent then
                TriggerEvent('cb-gangsystem:client:Notify', "Message Sent", "Check your phone, I sent you a text message explaining things!", "success")
            elseif not messageSent then
                TriggerEvent('cb-gangsystem:client:Notify', "Gang Help", message, "info", 20000)
            end
        end
    })

    lib.registerContext({
        id = 'OpenHelpMenu',
        title = "Help Menu",
        options = menuItems
    })
    
    -- Show the context menu
    lib.showContext('OpenHelpMenu')
end

RegisterNetEvent('cb-gangsystem:client:GangMenu', function(GangData)
    local PlayerData = GetPlayerData()
    if PlayerData == nil then return end
    local gangTag = PlayerData.gang.name
    local gangID = GetGangID(GangData, gangTag)
    local gangName = GangData[gangID].name
    local gangRank = PlayerData.gang.grade.level
    local declareTurfPerms = HasPermission(gangID, gangRank, "declare_turf_perms")
    local accessStoragePerms = HasPermission(gangID, gangRank, "access_storage")
    local moveStoragePerms = HasPermission(gangID, gangRank, "move_gang_storage")
    local addMoneyPerms = HasPermission(gangID, gangRank, "add_money_perms")
    local removeMoneyPerms = HasPermission(gangID, gangRank, "remove_money_perms")
    local isLeader = (PlayerData.citizenid == GangData[gangID].leader_cid)
    local declareHomeTurfDesc = nil
    local accessStoragePermsDesc = nil
    if isLeader then
        addMoneyPerms = true
        removeMoneyPerms = true
        declareTurfPerms = true
        accessStoragePerms = true
        moveStoragePerms = true
    end
    if not declareTurfPerms then
        declareHomeTurfDesc = "You do not have permission to declare a Home Turf"
    end
    if not accessStoragePerms then
        accessStoragePermsDesc = "You do not have access to the Gang Storage"
    end
    local options = {}
    if Config.OptionalMenuItems.dontForgetToScroll then
        table.insert(options, {
            title = "-------🛑 Don't forget to Scroll 🛑-------",
            disabled = true,
        })
    end
    if Config.OptionalNotifications.HomeTurfTaken then
        if GangData[gangID].home_turf == "Taken" then
            TriggerEvent('cb-gangsystem:client:Notify', "Home Turf Taken", "You took the home turf of another gang. Be careful out there!", "info")
        end
    end
    local starsDisplay = string.rep("⭐", exports['cb-gangsystem']:GetPrevalenceLevel(GangData[gangID].prevalence))
    table.insert(options, {
        title = "Gang Prevalence - "..starsDisplay,
        description = "How does Franklin and the locals perceive your Gang?",
        icon = "fa-solid fa-star",
        iconColor = "yellow",
        disabled = true,
        arrow = true,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:getGangBankDetails', gangID)
        end
    })

    if Config.AllowGangProtection and GangData[gangID].protection ~= 0 then
        table.insert(options, {
            title = "Protected",
            description = "Protect your turf while you are away!",
            icon = "fa-solid fa-toggle-on",
            iconColor = "green",
            disabled = false,
            arrow = true,
            onSelect = function()
                TriggerServerEvent('cb-gangsystem:server:ToggleProtection', gangID, true)
            end
        })
    else
        table.insert(options, {
            title = "Not Protected",
            description = "Protect your turf while you are away!",
            icon = "fa-solid fa-toggle-off",
            iconColor = "red",
            disabled = false,
            arrow = true,
            onSelect = function()
                TriggerServerEvent('cb-gangsystem:server:ToggleProtection', gangID, false)
            end
        })
    end

    table.insert(options, {
        title = "Gang Fund",
        description = "Add or Remove money from your Gang Account",
        icon = "fa-solid fa-bank",
        iconColor = "purple",
        disabled = not addMoneyPerms and not removeMoneyPerms,
        arrow = true,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:getGangBankDetails', gangID)
        end
    })
    if Config.UseHintsSystem then
        table.insert(options, {
            title = "Hints",
            description = "I know everything there is to know. I will sell you information for a fee",
            icon = "fa-solid fa-puzzle-piece",
            iconColor = "gold",
            arrow = true,
            onSelect = function()
                local gangTag = PlayerData.gang.name
                TriggerServerEvent('cb-gangsystem:server:CheckForPurchasedHints', gangTag)
            end
        })
    end
    if Config.MoveableGangStorage then
        if GangData[gangID].storage == "(NULL)" or  GangData[gangID].storage == nil then
            table.insert(options, {
                title = "Gang Storage",
                description = accessStoragePermsDesc or "Utilize storage for your entire Gang",
                icon = "fa-solid fa-boxes-stacked",
                disabled = not moveStoragePerms,
                iconColor = "brown",
                arrow = true,
                onSelect = function()
                    MoveGangStorage()
                end
            })
        end
    else
        table.insert(options, {
            title = "Gang Storage",
            description = accessStoragePermsDesc or "Utilize storage for your entire Gang",
            icon = "fa-solid fa-boxes-stacked",
            disabled = not accessStoragePerms,
            iconColor = "brown",
            arrow = true,
            onSelect = function()
                OpenStash(gangName)
            end
        })
    end
    table.insert(options, {
        title = "Gang Management",
        description = "Manage Gang",
        icon = "fa-solid fa-users",
        iconColor = "teal",
        arrow = true,
        onSelect = function()
            TriggerEvent('cb-gangsystem:client:ManageMembersPreMenu', GangData)
        end
    })
    if Config.UseBlackMarket and not UsingOxInventory then
        table.insert(options, {
            title = "Black Market",
            description = "Purchase from the Black Market",
            icon = "fa-solid fa-cart-shopping",
            iconColor = "green",
            arrow = true,
            onSelect = function()
                TriggerEvent('cb-gangsystem:client:ConfirmBlackMarketAccess')
            end
        })
    end
    table.insert(options, {
        title = "Declare Home Turf",
        description = declareHomeTurfDesc or "Declare the turf you wish to call home. Choose wisely!",
        icon = "fa-solid fa-flag",
        iconColor = "orange",
        disabled = not declareTurfPerms,
        arrow = true,
        onSelect = function()
            local allowed = lib.callback.await('cb-gangsystem:server:CanDeclareHomeTurf', false)
            if allowed then
                TriggerEvent('cb-gangsystem:client:DeclareHomeTurfMenu', GangData)
            else
                TriggerEvent('cb-gangsystem:client:Notify', "Cooldown", "You need to wait the cooldown before declaring for a new Home Turf.", "error")
            end
        end
    })
    if Config.Gifts then
        local disableGifts = true
        local giftsDesc = "I have nothing to give you right now because you are at war!"
        if GangData[gangID].war == 0 or (GangData[gangID].war ~= 0 and Config.GangWars.Modifiers.gifts) then
            if exports['cb-gangsystem']:AllowedByPrevalence(GangData[gangID].prevalence, "Gifts") then
                disableGifts = false
                giftsDesc = "I'll have something new for you every day!"
            else
                giftsDesc = "Increase your Gang Prevalence and then we'll talk!"
            end
        end
        table.insert(options, {
            title = "Accept Gift",
            description = giftsDesc,
            icon = "fa-solid fa-gift",
            iconColor = "yellow",
            arrow = true,
            disabled = disableGifts,
            onSelect = function()
                local allowed = lib.callback.await('cb-gangsystem:server:CheckLastGift', false)
                if allowed == "Allowed" then
                    TriggerServerEvent('cb-gangsystem:server:TakeGift')
                elseif allowed == "Taken" then
                    TriggerEvent('cb-gangsystem:client:Notify', "Home Turf Taken", "Home Turf has been taken over by a rival Gang. Handle that first or declare a new one.", "error")
                elseif allowed == "No-Home-Turf" then
                    TriggerEvent('cb-gangsystem:client:Notify', "No Home Turf", "Your Gang does not control a Home Turf. Declare one.", "error")
                elseif allowed == "Timeout" then
                    TriggerEvent('cb-gangsystem:client:Notify', "Gang Timeout", "Your Gang is in Gang Timeout. Improve your standing with the Gods.", "error")
                elseif allowed == "War Timeout" then
                    TriggerEvent('cb-gangsystem:client:Notify', "War Timeout", "Losing a war has its costs. Try again later.", "error")
                else
                    TriggerEvent('cb-gangsystem:client:Notify', "Nothing Yet", "I don't have anything for you yet.", "error")
                end
            end
        })
    end
    if Config.EnableMissions then
        local disableMissions = true
        local missionsDesc = "Focus on the war effort first, then come talk to me about helping!"
        local allowed = lib.callback.await('cb-gangsystem:server:CanStartMission', false)
        if GangData[gangID].war == 0 or (GangData[gangID].war ~= 0 and Config.GangWars.Modifiers.missions) then
            if exports['cb-gangsystem']:AllowedByPrevalence(GangData[gangID].prevalence, "Missions") then
                disableMissions = false
                missionsDesc = "Looking to help out? I'm always needing some extra hands."
            else
                missionsDesc = "Increase your Gang Prevalence and then we'll talk!"
            end
        end
        if allowed ~= "Current-Mission" then
            table.insert(options, {
                title = "Lend a Hand",
                description = missionsDesc,
                disabled = disableMissions,
                icon = "fa-solid fa-handshake-simple",
                iconColor = "brown",
                arrow = true,
                onSelect = function()
                    if allowed == "True" then
                        TriggerServerEvent('cb-gangsystem:server:StartMission')
                    elseif allowed == "Taken" then
                        local notifyLabel = "Home Turf Taken"
                        local notifyMessage = "Home Turf has been taken over by a rival Gang. Handle that first or declare a new one."
                        TriggerEvent('cb-gangsystem:client:Notify', notifyLabel, notifyMessage, "error")
                    elseif allowed == "Current-Mission" then
                        TriggerEvent('cb-gangsystem:client:Notify', "Finish Current Mission", "I already gave you a task. Focus on that first.", "error")
                    elseif allowed == "Timeout" then
                        TriggerEvent('cb-gangsystem:client:Notify', "Gang Timeout", "Your Gang is in Gang Timeout. Improve your standing with the Gods.", "error")
                    elseif allowed == "War Timeout" then
                        TriggerEvent('cb-gangsystem:client:Notify', "War Timeout", "Losing a war has its costs. Try again later.", "error")
                    elseif allowed == "No-Home-Turf" then
                        TriggerEvent('cb-gangsystem:client:Notify', "No Home Turf", "Your Gang does not control a Home Turf. Declare one.", "error")
                    end
                end
            })
        end
    end
    local isAtWar = not (GangData[gangID].war == 0)
    if Config.GangWars.Enabled then
        table.insert(options, {
            title = "War History",
            description = "Show active and past Gang Wars",
            icon = "fa-solid fa-clipboard",
            iconColor = "green",
            arrow = true,
            onSelect = function()
                ShowWarHistoryMenu(GangData, gangID)
            end
        })
        if isAtWar then
            table.insert(options, {
                title = "War Menu",
                description = "Show the War Menu",
                icon = "fa-solid fa-gun",
                iconColor = "black",
                arrow = true,
                onSelect = function()
                    ShowWarMenu(gangID)
                end
            })
        else
            table.insert(options, {
                title = "Start Gang War",
                description = "Start a Gang War with a rival Gang",
                icon = "fa-solid fa-gun",
                iconColor = "black",
                arrow = true,
                onSelect = function()
                    SelectGangForWarMenu(GangData, gangID)
                end
            })
        end
    end
    --[[
    table.insert(options, {
        title = "Gang Help",
        description = "Need help with something? I might be able to help you!",
        icon = "fa-solid fa-circle-info",
        iconColor = "teal",
        arrow = true,
        onSelect = function()
            OpenHelpMenu()
        end
    })]]
    local isAtWar = not (GangData[gangID].war == 0)
    local disbandGangDesc = "Disband the entire criminal organization"
    if isAtWar then
        disbandGangDesc = "Finish the war before disbanding your gang!"
    end
    if not isLeader then
        table.insert(options, {
            title = "Leave Gang",
            description = "Leave your current Gang or Criminal Organization",
            icon = "fa-solid fa-person-hiking",
            iconColor = "red",
            disabled = isLeader,
            arrow = true,
            onSelect = function()
                TriggerEvent('cb-gangsystem:client:LeaveGangConfirmation')
            end
        })
    else
        table.insert(options, {
            title = "Disband Gang",
            description = disbandGangDesc,
            icon = "fa-solid fa-trash",
            iconColor = "red",
            disabled = isAtWar,
            arrow = true,
            onSelect = function()
                DisbandGangConfirmation()
            end
        })
    end
    lib.registerContext({
        id = 'GangMenu',
        title = GangData[gangID].name,
        options = options
    })
    lib.showContext('GangMenu')
end)

function DisbandGangConfirmation()
    local PlayerData = GetPlayerData()
    if PlayerData == nil then return end
    local gangName = PlayerData.gang.label
    local options = {}
    table.insert(options,
        {
            title = "Are you sure you want to disband your Gang?",
            icon = "fa-solid fa-person-hiking",
            arrow = false,
            disabled = true,
        })
    table.insert(options, {
        title = "Yes",
        description = string.format("Disband %s", gangName),
        icon = "fa-solid fa-thumbs-up",
        iconColor = "green",
        arrow = false,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:DisbandGang')
        end
    })
    table.insert(options, {
        title = "No",
        description = "Stay in " .. gangName,
        icon = "fa-solid fa-thumbs-down",
        iconColor = "red",
        arrow = false,
        onSelect = function()
            lib.hideContext(true)
        end
    })
    lib.registerContext({
        id = 'DisbandGangConfirmation',
        title = "Disband Gang",
        options = options
    })
    lib.showContext('DisbandGangConfirmation')
end

function StaffDeleteGangConfirmation(gangID)
    local options = {}
    table.insert(options,
        {
            title = "Are you sure you want to disband the Gang?",
            icon = "fa-solid fa-person-hiking",
            arrow = false,
            disabled = true,
        })
    table.insert(options, {
        title = "Yes",
        description = string.format("Disband and Delete the Gang"),
        icon = "fa-solid fa-thumbs-up",
        iconColor = "green",
        arrow = false,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:StaffDeleteGang', gangID)
        end
    })
    table.insert(options, {
        title = "No",
        description = "Cancel and Keep the Gang",
        icon = "fa-solid fa-thumbs-down",
        iconColor = "red",
        arrow = false,
        onSelect = function()
            lib.hideContext(true)
        end
    })
    lib.registerContext({
        id = 'StaffDeleteGangConfirmation',
        title = "Staff Delete Gang",
        options = options
    })
    lib.showContext('StaffDeleteGangConfirmation')
end

RegisterNetEvent('cb-gangsystem:client:HintMenu', function(purchasedHints)
    local hintPurchased = "fa-solid fa-toggle-on"
    local hintNotPurchased = "fa-solid fa-toggle-off"
    local hintPurchasedColor = "green"
    local hintNotPurchasedColor = "red"
    local hintOptions = {}
    table.insert(hintOptions, {
        title = "Gang Hideout",
        description = "Do you need help finding your Gang Hideout?",
        icon = "fa-solid fa-map-location-dot",
        iconColor = "pink",
        arrow = true,
        onSelect = function()
            local gangTag = PlayerData.gang.name
            TriggerServerEvent('cb-gangsystem:server:GetHideoutCoords', gangTag)
        end
    })
    for k, v in pairs(Config.LocationHints) do
        local existing = false
        for _, existingPurchasedHints in ipairs(purchasedHints) do
            if tonumber(existingPurchasedHints) == tonumber(k) then
                existing = true
            end
        end
        if existing then
            table.insert(hintOptions, {
                title = v.label,
                description = v.description,
                icon = hintPurchased,
                iconColor = hintPurchasedColor,
                arrow = false,
                disabled = true,
            })
        elseif not existing then
            table.insert(hintOptions, {
                title = v.label,
                description = string.format("Cost: $%.0f", v.cost),
                icon = hintNotPurchased,
                iconColor = hintNotPurchasedColor,
                arrow = false,
                onSelect = function()
                    TriggerEvent('cb-gangsystem:client:confirmHintPurchase', k)
                end,
            })
        end
    end
    table.insert(hintOptions, {
        title = "Go Back",
        icon = "fa-solid fa-arrow-left",
        arrow = false,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:RefreshGangMenu')
        end
    })
    lib.registerContext({
        id = 'HintMenu',
        title = "Hints",
        options = hintOptions
    })
    lib.showContext('HintMenu')
end)

RegisterNetEvent('cb-gangsystem:client:ShowGangInfo', function(GangData, leaderName)
    local PlayerData = GetPlayerData()
    if PlayerData == nil then return end
    local gangTag = PlayerData.gang.name
    local gangID = GetGangID(GangData, gangTag)
    local options = {}
    local GangStatus = "Active / Good Standing"
    local GangStatusColor = "green"
    local home_turf = GangData[gangID].home_turf
    local homeTurfIconColor = "green"
    if home_turf == nil or home_turf == "None" then
        home_turf = "No Home Turf"
        homeTurfIconColor = "yellow"
    elseif home_turf ~= "Taken" then
        home_turf = exports['cb-gangsystem']:GetTurfName(GangData[gangID].home_turf)
        homeTurfIconColor = "red"
    end
    if GangData[gangID].penalty == 1 then
        GangStatus = "Gang Timeout"
        GangStatusColor = "red"
    end
    table.insert(options, {
        title = "Gang Name",
        description = GangData[gangID].name,
        icon = "fa-solid fa-id-card-clip",
        image = GangData[gangID].image,
        arrow = false,
    })
    local data = GangData[gangID]
    if data then
        local rankNames = Split(data.ranks, ',')
        local rankCount = #rankNames

        -- Ensure the grade level is within the range of available ranks
        local gradeLevel = PlayerData.gang.grade.level
        local gradeIndex = tonumber(gradeLevel)
        if gradeIndex and gradeIndex >= 0 and gradeIndex < rankCount then
            local gradeName = rankNames[gradeIndex + 1]
            if gradeName then
                table.insert(options, {
                    title = "Gang Rank",
                    description = gradeName,
                    icon = "fa-solid fa-ranking-star",
                    arrow = false,
                })
            end
        end
    end
    table.insert(options, {
        title = "Leader Name",
        description = leaderName,
        icon = "fa-solid fa-user",
        arrow = false,
    })
    table.insert(options, {
        title = "Home Turf",
        description = home_turf,
        icon = "fa-solid fa-house",
        iconColor = homeTurfIconColor,
        arrow = false,
    })
    table.insert(options, {
        title = "Gang Status",
        description = GangStatus,
        icon = "fa-solid fa-star",
        iconColor = GangStatusColor,
        arrow = false,
    })
    lib.registerContext({
        id = 'GangInfoMenu',
        title = GangData[gangID].name,
        options = options
    })
    lib.showContext('GangInfoMenu')
end)

RegisterNetEvent('cb-gangsystem:client:confirmHintPurchase', function(hintID)
    local PlayerData = GetPlayerData()
    local gangTag = PlayerData.gang.name
    local hintLabel
    local hintCost
    local options = {}
    for k, v in pairs(Config.LocationHints) do
        if k == hintID then
            hintCost = v.cost
            hintLabel = v.label
            break
        end
    end
    table.insert(options, {
        title = string.format("Purchase %s Hint", hintLabel),
        description = "Upon purchasing your entire gang will have access to the hint.",
        icon = "fa-solid fa-thumbs-up",
        iconColor = "green",
        arrow = false,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:UpdatePurchasedHints', gangTag, hintID, hintCost)
        end
    })
    table.insert(options, {
        title = "No",
        icon = "fa-solid fa-thumbs-down",
        iconColor = "red",
        arrow = false,
        onSelect = function()
            -- Do Stuff
        end
    })
    lib.registerContext({
        id = 'confirmHintPurchase',
        title = "Confirm Purchase",
        options = options
    })
    lib.showContext('confirmHintPurchase')
end)

RegisterNetEvent('cb-gangsystem:client:ChooseColorMenu', function()
    local PlayerData = GetPlayerData()
    local gangTag = PlayerData.gang.name
    local options = {}
    for k, v in pairs(Config.GangColors) do
        table.insert(options, {
            title = v.name,
            icon = "fa-solid fa-palette",
            iconColor = v.iconColor,
            image = v.image,
            arrow = false,
            onSelect = function()
                TriggerServerEvent('cb-gangsystem:server:changeGangColor', gangTag, v.id)
            end
        })
    end
    table.insert(options, {
        title = "Go Back",
        icon = "fa-solid fa-arrow-left",
        arrow = false,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:RefreshGangMenu')
        end
    })
    lib.registerContext({
        id = 'ChooseColorMenu',
        title = "Change Gang Color",
        options = options
    })
    lib.showContext('ChooseColorMenu')
end)

RegisterNetEvent('cb-gangsystem:client:ConfirmBlackMarketAccess')
AddEventHandler('cb-gangsystem:client:ConfirmBlackMarketAccess', function(selectedPlayerData)
    local PlayerData = GetPlayerData()
    local cooldownTimeHours = Config.BlackMarketCooldown * 24 -- Convert days to hours
    local options = {}
    
    table.insert(options, {
        title = "Confirm access to Black Market",
        description = string.format("The Black Market is only online every %.2f hours. If you access it now your entire gang will need to wait until it is online again.", cooldownTimeHours),
        icon = "fa-solid fa-id-card-clip",
        arrow = false,
        disabled = true
    })
    table.insert(options, {
        title = "Yes",
        description = "Access the Black Market",
        icon = "fa-solid fa-thumbs-up",
        iconColor = "green",
        arrow = false,
        onSelect = function()
            local allowed = lib.callback.await('cb-gangsystem:server:GetLastBlackMarket', false)
            if allowed then
                local PlayerData = GetPlayerData()
                local gangTag = PlayerData.gang.name

                if not Config.UsingNewQB and not UsingOxInventory then
                    TriggerServerEvent("inventory:server:OpenInventory", "shop", "market", Config.BlackMarket)
                elseif not UsingOxInventory then
                    TriggerServerEvent("cb-gangsystem:server:newqbinventory")
                    TriggerServerEvent("cb-gangsystem:server:newqbshop")
                elseif UsingOxInventory then
                    exports.ox_inventory:openInventory('shop', { type = 'GangSystemBlackMarket', id = 1 })
                end
                TriggerServerEvent("cb-gangsystem:server:UpdateLastBlackMarket", gangTag)
            else
                TriggerEvent('cb-gangsystem:client:Notify', "Unavailable", "The Black Market is not online right now.", "error")
            end
        end
    })
    lib.registerContext({
        id = 'ConfirmBlackMarketAccess',
        title = "Confirm Access",
        options = options
    })
    lib.showContext('ConfirmBlackMarketAccess')
end)

RegisterNetEvent('cb-gangsystem:client:ManageMembersPreMenu', function(GangData)
    local PlayerData = GetPlayerData()
    if PlayerData == nil then return end
    local gangTag = PlayerData.gang.name
    local gangID = GetGangID(GangData, gangTag)
    local options = {}
    local isLeader = (PlayerData.citizenid == GangData[gangID].leader_cid)
    local changeColorPermsDesc = nil
    local addMemberPermsDesc = nil
    local renameGangPermsDesc = nil
    local manageRanksPermsDesc = nil
    local gangRank = PlayerData.gang.grade.level
    local changeColorPerms = HasPermission(gangID, gangRank, "change_color")
    local addMemberPerms = HasPermission(gangID, gangRank, "add_members")
    local renameGangPerms = HasPermission(gangID, gangRank, "rename_gang")
    local manageRanksPerms = HasPermission(gangID, gangRank, "manage_ranks")

    if isLeader then
        changeColorPerms = true
        addMemberPerms = true
        renameGangPerms = true
        manageRanksPerms = true
    end
    if not changeColorPerms then
        changeColorPermsDesc = "You do not have permission to change the gang color"
    end
    if not manageRanksPerms then
        manageRanksPermsDesc = "You don't have permission to manage ranks"
    end
    if not addMemberPerms then
        addMemberPermsDesc = "You do not have permission to add new members"
    end
    if not renameGangPerms then
        renameGangPermsDesc = "You do not have permission to rename the Gang"
    end
    table.insert(options, {
        title = "Manage Member Ranks",
        description = manageRanksPermsDesc or "Promote / Demote Members",
        icon = "fa-solid fa-ranking-star",
        disabled = not manageRanksPerms,
        iconColor = "orange",
        arrow = true,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:ManageMembers', gangID)
        end
    })
    table.insert(options, {
        title = "Add Gang Member",
        description = addMemberPermsDesc or "Add a new member to your Gang",
        icon = "fa-solid fa-user",
        iconColor = "green",
        disabled = not addMemberPerms,
        arrow = true,
        onSelect = function()
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            TriggerServerEvent('cb-gangsystem:server:getNearbyPlayers', playerCoords)
        end
    })
    table.insert(options, {
        title = "Gang Permissions",
        description = "Manage your Gang Member's permissions",
        icon = "fa-solid fa-scale-balanced",
        iconColor = "black",
        arrow = true,
        onSelect = function()
            TriggerEvent('cb-gangsystem:client:ManageGangPermsPreMenu', GangData)
        end
    })
    table.insert(options, {
        title = "Change Gang Color",
        description = changeColorPermsDesc or "Change the color of your Gang",
        icon = "fa-solid fa-palette",
        disabled = not changeColorPerms,
        iconColor = "orange",
        arrow = true,
        onSelect = function()
            TriggerEvent('cb-gangsystem:client:ChooseColorMenu', GangData)
        end
    })
    table.insert(options, {
        title = "Rename Gang",
        description = renameGangPermsDesc or "Rename your Gang",
        icon = "fa-solid fa-font",
        iconColor = "blue",
        disabled = not renameGangPerms,
        arrow = true,
        onSelect = function()
            RenameGangInput(gangID)
        end
    })
    table.insert(options, {
        title = "Go Back",
        icon = "fa-solid fa-arrow-left",
        arrow = false,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:RefreshGangMenu')
        end
    })
    lib.registerContext({
        id = 'ManageMembersPreMenu',
        title = "Gang Management",
        options = options
    })
    lib.showContext('ManageMembersPreMenu')
end)

RegisterNetEvent('cb-gangsystem:client:ManageGangPermsPreMenu', function(GangData)
    local PlayerData = GetPlayerData()
    if PlayerData == nil then return end
    local gangTag = PlayerData.gang.name
    local gangID = GetGangID(GangData, gangTag)
    local gangRank = PlayerData.gang.grade.level
    local isLeader = (PlayerData.citizenid == GangData[gangID].leader_cid)
    local options = {}
    local gangRoles = {} -- Initialize the gangRoles table

    -- Check if ranks field exists and is not nil
    if GangData[gangID] and GangData[gangID].ranks then
        -- Parse ranks string into a table
        local ranks = {}
        for rank in GangData[gangID].ranks:gmatch("[^,]+") do
            table.insert(ranks, rank)
        end

        -- Iterate over ranks and create roles table
        for i, rankName in ipairs(ranks) do
            table.insert(gangRoles, {
                gangID = gangID,
                gradeID = i,
                gradeName = rankName
            })
        end

        -- Iterate over the sorted gangRoles table and insert options
        for i = 1, #gangRoles do -- #gangRoles - 1 if you don't want the Boss Rank to show on the menu
            local role = gangRoles[i]
            if role.gangID == gangID then
                local disabled = true
                if tonumber(gangRank) >= tonumber(role.gradeID) then
                    disabled = false
                end
                if tonumber(gangRank) == 6 then
                    disabled = false
                end
                table.insert(options, {
                    title = role.gradeName,
                    description = string.format("Manage permissions for %s", role.gradeName),
                    icon = "fa-solid fa-user-secret",
                    iconColor = "white",
                    arrow = true,
                    disabled = disabled,
                    onSelect = function()
                        TriggerEvent('cb-gangsystem:client:ManageGangPermsMenu', GangData, role.gradeID - 1,
                            role.gradeName)
                    end
                })
            end
        end
    else
        lib.print.error("Ranks field is missing or nil for gangID:", gangID)
    end

    table.insert(options, {
        title = "Go Back",
        icon = "fa-solid fa-arrow-left",
        arrow = false,
        onSelect = function()
            lib.showContext('ManageMembersPreMenu')
        end
    })

    lib.registerContext({
        id = 'ManageGangPermsPreMenu',
        title = "Gang Management",
        options = options
    })
    lib.showContext('ManageGangPermsPreMenu')
end)

RegisterNetEvent('cb-gangsystem:client:ManageGangPermsMenu')
AddEventHandler('cb-gangsystem:client:ManageGangPermsMenu', function(GangData, grade, gradeName)
    local PlayerData = GetPlayerData()
    if PlayerData == nil then return end
    local gangTag = PlayerData.gang.name
    local gangID = GetGangID(GangData, gangTag)
    local addMoneyPerms = HasPermission(gangID, grade, "add_money_perms")
    local removeMoneyPerms = HasPermission(gangID, grade, "remove_money_perms")
    local declareTurfPerms = HasPermission(gangID, grade, "declare_turf_perms")
    local changeColorPerms = HasPermission(gangID, grade, "change_color")
    local accessStoragePerms = HasPermission(gangID, grade, "access_storage")
    local moveStoragePerms = HasPermission(gangID, grade, "move_gang_storage")
    local renameGangPerms = HasPermission(gangID, grade, "rename_gang")
    local addMemberPerms = HasPermission(gangID, grade, "add_members")

    -- Default Colors
    local onColor = "green"
    local offColor = "red"

    -- Default Icons
    local onIcon = "fa-solid fa-toggle-on"
    local offIcon = "fa-solid fa-toggle-off"

    -- Variables
    local addMoneyIcon = offIcon
    local addMoneyColor = offColor
    local removeMoneyIcon = offIcon
    local removeMoneyColor = offColor
    local declareHomeTurfIcon = offIcon
    local declareHomeTurfColor = offColor
    local changeColorIcon = offIcon
    local changeColorColor = offColor
    local accessStorageIcon = offIcon
    local accessStorageColor = offColor
    local moveStorageIcon = offIcon
    local moveStorageColor = offColor
    local renameGangIcon = offIcon
    local renameGangColor = offColor
    local addMemberIcon = offIcon
    local addMemberColor = offColor

    local options = {}
    if addMoneyPerms then
        addMoneyIcon = onIcon
        addMoneyColor = onColor
    end
    if removeMoneyPerms then
        removeMoneyIcon = onIcon
        removeMoneyColor = onColor
    end
    if declareTurfPerms then
        declareHomeTurfIcon = onIcon
        declareHomeTurfColor = onColor
    end
    if changeColorPerms then
        changeColorIcon = onIcon
        changeColorColor = onColor
    end
    if accessStoragePerms then
        accessStorageIcon = onIcon
        accessStorageColor = onColor
    end
    if moveStoragePerms then
        moveStorageIcon = onIcon
        moveStorageColor = onColor
    end
    if renameGangPerms then
        renameGangIcon = onIcon
        renameGangColor = onColor
    end
    if addMemberPerms then
        addMemberIcon = onIcon
        addMemberColor = onColor
    end
    -- Disable the options if the rank is the Leader
    local disabled = false
    if grade == 6 then -- If the player tries to edit the Leader permissions, don't let them
        disabled = true
        addMoneyIcon = onIcon
        addMoneyColor = onColor
        removeMoneyIcon = onIcon
        removeMoneyColor = onColor
        declareHomeTurfIcon = onIcon
        declareHomeTurfColor = onColor
        changeColorIcon = onIcon
        changeColorColor = onColor
        accessStorageIcon = onIcon
        accessStorageColor = onColor
        moveStorageIcon = onIcon
        moveStorageColor = onColor
        renameGangIcon = onIcon
        renameGangColor = onColor
        addMemberIcon = onIcon
        addMemberColor = onColor
    end
    table.insert(options, {
        title = "Rename Rank",
        description = "You can rename this Rank to whatever you want",
        icon = "fa-solid fa-font",
        iconColor = "white",
        arrow = false,
        onSelect = function()
            RenameRankInput(gangID, grade)
        end
    })
    table.insert(options, {
        title = "Gang Fund - Add",
        description = "Allow this rank to ADD money to the Gang Fund",
        icon = addMoneyIcon,
        iconColor = addMoneyColor,
        disabled = disabled,
        arrow = false,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:UpdateGangPermissions', gangID, "add_money_perms", grade)
        end
    })
    table.insert(options, {
        title = "Gang Fund - Remove",
        description = "Allow this rank to REMOVE money from the Gang Fund",
        icon = removeMoneyIcon,
        iconColor = removeMoneyColor,
        disabled = disabled,
        arrow = false,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:UpdateGangPermissions', gangID, "remove_money_perms", grade)
        end
    })
    table.insert(options, {
        title = "Declare Home Turf",
        description = "Allow this rank to declare a new Home Turf",
        icon = declareHomeTurfIcon,
        iconColor = declareHomeTurfColor,
        disabled = disabled,
        arrow = false,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:UpdateGangPermissions', gangID, "declare_turf_perms", grade)
        end
    })
    table.insert(options, {
        title = "Change Gang Color",
        description = "Change the color of your Gang",
        icon = changeColorIcon,
        iconColor = changeColorColor,
        disabled = disabled,
        arrow = false,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:UpdateGangPermissions', gangID, "change_color", grade)
        end
    })
    table.insert(options, {
        title = "Gang Storage",
        description = "Utilize storage for your entire Gang",
        icon = accessStorageIcon,
        iconColor = accessStorageColor,
        disabled = disabled,
        arrow = false,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:UpdateGangPermissions', gangID, "access_storage", grade)
        end
    })

    table.insert(options, {
        title = "Move Gang Storage",
        description = "Move the Storage for your entire Gang",
        icon = moveStorageIcon,
        iconColor = moveStorageColor,
        disabled = disabled,
        arrow = false,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:UpdateGangPermissions', gangID, "move_gang_storage", grade)
        end
    })
    table.insert(options, {
        title = "Add Gang Members",
        description = "Add members to the Gang",
        icon = addMemberIcon,
        iconColor = addMemberColor,
        disabled = disabled,
        arrow = false,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:UpdateGangPermissions', gangID, "add_members", grade)
        end
    })
    table.insert(options, {
        title = "Rename Gang",
        description = "Rename the Gang",
        disabled = disabled,
        icon = renameGangIcon,
        iconColor = renameGangColor,
        arrow = false,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:UpdateGangPermissions', gangID, "rename_gang", grade)
        end
    })
    table.insert(options, {
        title = "Go Back",
        icon = "fa-solid fa-arrow-left",
        arrow = false,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:refreshGangRanks')
        end
    })
    lib.registerContext({
        id = 'ManageGangPermsMenu',
        title = "Manage Permissions",
        options = options
    })
    lib.showContext('ManageGangPermsMenu')
end)

RegisterNetEvent('cb-gangsystem:client:GangStorageMenu')
AddEventHandler('cb-gangsystem:client:GangStorageMenu', function()
    local PlayerData = GetPlayerData()
    if PlayerData == nil then return end
    local gangName = PlayerData.gang.label
    local options = {}
    table.insert(options, {
        title = "Open Gang Storage",
        description = "Access a Storage Container for your Gang",
        icon = "fa fa-circle",
        arrow = false,
        onSelect = function()
            OpenStash(gangName)
        end
    })
    table.insert(options, {
        title = "Move Gang Storage",
        description = "Move the Storage for your entire Gang",
        icon = "fa fa-circle",
        arrow = false,
        onSelect = function()
            TriggerEvent('cb-gangsystem:client:MoveGangStorage')
        end
    })
    
    lib.registerContext({
        id = 'GangStorageMenu',
        title = "Confirm New Member",
        options = options
    })
    lib.showContext('GangStorageMenu')
end)

RegisterNetEvent('cb-gangsystem:client:updateGangStorage', function(storageData, GangData)
    CurrentGangStorages = {} -- Reset the current gang storages
    local PlayerData = GetPlayerData()
    if PlayerData == nil then return end
    local gangTag = PlayerData.gang.name
    local gangID = GetGangID(GangData, gangTag)
    if (gangID == 0) or (gangID == nil) then return end
    local gangName = GangData[gangID].name
    for k,v in pairs(storageData) do
        -- Remove "vector3(" and ")" from the string
        local storageString = string.gsub(v.storage, "vector3%(", ""):gsub("%)", "")

        -- Split the string into separate numbers for x, y, and z
        local x, y, z = string.match(storageString, "([^,]+),([^,]+),([^,]+)")

        -- Convert the strings to numbers
        x, y, z = tonumber(x), tonumber(y), tonumber(z)

        -- Check if conversion was successful
        if x and y and z then
            if gangID == v.id then
                table.insert(CurrentGangStorages, { storage = gangID })
                if gangID == 0 or gangID == nil then return end
                if gangID ~= v.id then return end

                -- Define the box zone
                StorageZone = lib.zones.box({
                    coords = vector3(x, y, z),
                    size = vector3(5, 5, 2),
                    rotation = 0,
                    onEnter = function()
                        ShowTextUI('[E] - Gang Storage')
                    end,
                    onExit = function()
                        HideTextUI()
                    end,
                    inside = function()
                        if IsControlJustPressed(1, 38) then
                            OpenGangStorageMenu(GangData, gangID)
                        end
                    end,
                    debug = false
                })
            end
        else
            lib.print.error("Failed to parse storage vector components: " .. tostring(v.storage))
        end
    end
end)

RegisterNetEvent('cb-gangsystem:client:changeStorageCoords', function()
    TriggerEvent('cb-gangsystem:client:Notify', "Moving Gang Storage", "Press E to set your Gang Storage", "info")
    StorageZone:remove()
    local updating = true
    local notificationTime = GetGameTimer() -- Get the current game time
    while updating do
        Citizen.Wait(0) -- Allow other threads to run

        -- Show notification every 5 seconds
        if GetGameTimer() - notificationTime >= 7500 then
            TriggerEvent('cb-gangsystem:client:Notify', "Moving Gang Storage", "Press E to set your Gang Storage", "info")
            notificationTime = GetGameTimer() -- Reset the timer
        end

        if IsControlJustPressed(0, 38) then -- "E" key
            local coords = GetEntityCoords(PlayerPedId())
            TriggerServerEvent('cb-gangsystem:server:changeStorageCoords', coords)
            updating = false -- Break the loop
        end
    end
end)

RegisterNetEvent('cb-gangsystem:client:ResetGangStorage', function(gangID)
    StorageZone:remove()
    TriggerServerEvent('cb-gangsystem:server:ResetGangStorage', gangID)
end)

RegisterNetEvent('cb-gangsystem:client:RemoveStorageZone', function()
    if StorageZone then
        StorageZone:remove()
    end
end)


RegisterNetEvent('cb-gangsystem:client:ConfirmAddMember')
AddEventHandler('cb-gangsystem:client:ConfirmAddMember', function(selectedPlayerData)
    local PlayerData = GetPlayerData()
    local gangName = PlayerData.gang.label
    local options = {}
    table.insert(options, {
        title = string.format("Are you sure you want to add %s to %s", selectedPlayerData.playerName, gangName),
        description = string.format("Full Name: %s / Citizen ID: %s", selectedPlayerData.playerName,
            selectedPlayerData.citizenid),
        icon = "fa-solid fa-id-card-clip",
        arrow = false,
        disabled = true
    })
    table.insert(options, {
        title = "Yes",
        icon = "fa-solid fa-thumbs-up",
        iconColor = "green",
        arrow = false,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:AddMemberToGang', selectedPlayerData)
        end
    })
    table.insert(options, {
        title = "No",
        icon = "fa-solid fa-thumbs-down",
        iconColor = "red",
        arrow = false,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:RefreshGangMenu')
        end
    })
    table.insert(options, {
        title = "Go Back",
        icon = "fa-solid fa-arrow-left",
        arrow = false,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:RefreshGangMenu')
        end
    })
    lib.registerContext({
        id = 'ConfirmAddMember',
        title = "Confirm New Member",
        options = options
    })
    lib.showContext('ConfirmAddMember')
end)

RegisterNetEvent('cb-gangsystem:client:manageGangFund')
AddEventHandler('cb-gangsystem:client:manageGangFund', function(GangData, balance)
    local PlayerData = GetPlayerData()
    if PlayerData == nil then return end
    local gangTag = PlayerData.gang.name
    local gangID = GetGangID(GangData, gangTag)
    local gangRank = PlayerData.gang.grade.level
    local addMoneyPerms = HasPermission(gangID, gangRank, "add_money_perms")       -- Checks if the player DOESNT have Add Money Permissions
    local removeMoneyPerms = HasPermission(gangID, gangRank, "remove_money_perms") -- Checks if the player DOESNT have Add Money Permissions
    if (PlayerData.citizenid == GangData[gangID].leader_cid) then
        addMoneyPerms = false
        removeMoneyPerms = false
    end
    local addMoneyDesc = "Add money to the Gang Fund"
    local removeMoneyDesc = "Remove money from the Gang Fund"
    if addMoneyPerms then
        addMoneyDesc = "You do not have permission to add money to the Gang Fund"
    end
    if removeMoneyPerms then
        removeMoneyDesc = "You do not have permission to remove money from the Gang Fund"
    end
    local options = {}
    table.insert(options, {
        title = string.format("Current Balance: $%.0f", balance),
        icon = "fa-solid fa-dollar-sign",
        arrow = false,
        disabled = true
    })
    table.insert(options, {
        title = "Add Money",
        description = addMoneyDesc,
        icon = "fa-solid fa-money-bill",
        iconColor = "green",
        arrow = false,
        disabled = addMoneyPerms,
        onSelect = function()
            local cashAmount = PlayerData.money.cash
            local input = lib.inputDialog("Deposit Cash", {
                {
                    type = 'number',
                    label = "Deposit Amount ($)",
                    min = 0,
                    max = cashAmount,
                    description = "Select the amount you wish to Deposit",
                    icon = "fa-solid fa-money-bill",
                    default = 0,
                    required = true,
                },
            })
            if input ~= nil then
                local depositAmount = input[1]
                ConfirmDeposit(gangTag, depositAmount)
            end
        end
    })
    table.insert(options, {
        title = "Remove Money",
        description = removeMoneyDesc,
        icon = "fa-solid fa-money-bill",
        iconColor = "red",
        arrow = false,
        disabled = removeMoneyPerms,
        onSelect = function()
            TriggerEvent('cb-gangsystem:client:removeMoneyFromFund', balance)
        end
    })
    table.insert(options, {
        title = "Go Back",
        icon = "fa-solid fa-arrow-left",
        arrow = false,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:RefreshGangMenu')
        end
    })
    lib.registerContext({
        id = 'ManageFund',
        title = "Manage Gang Fund",
        options = options
    })
    lib.showContext('ManageFund')
end)

function ConfirmDeposit(gangTag, depositAmount)
    local options = {}
    table.insert(options, {
        title = string.format("Confirm Deposit of $%.0f?", depositAmount),
        icon = "fa-solid fa-dollar-sign",
        arrow = false,
        disabled = true
    })
    table.insert(options, {
        title = "Yes",
        description = string.format("Add $%.0f to the Gang Fund", depositAmount),
        icon = "fa-solid fa-thumbs-up",
        arrow = false,
        onSelect = function()
            local moneyAdded = lib.callback.await('cb-gangsystem:server:addMoneyToFund', false, gangTag, depositAmount)
            if not moneyAdded then
                TriggerEvent('cb-gangsystem:client:Notify', "Gang Fund", "There was an error adding money into the account", "error")
            end
        end
    })
    table.insert(options, {
        title = "Go Back",
        icon = "fa-solid fa-arrow-left",
        arrow = false,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:RefreshGangMenu')
        end
    })
    lib.registerContext({
        id = 'ConfirmDeposit',
        title = "Confirm Deposit",
        options = options
    })
    lib.showContext('ConfirmDeposit')
end

function ConfirmWithdrawal(gangTag, withdrawalAmount)
    local options = {}
    table.insert(options, {
        title = string.format("Confirm Withdrawal of $%.0f?", withdrawalAmount),
        icon = "fa-solid fa-dollar-sign",
        arrow = false,
        disabled = true
    })
    table.insert(options, {
        title = "Yes",
        description = string.format("Remove $%.0f from Gang Fund", withdrawalAmount),
        icon = "fa-solid fa-thumbs-up",
        arrow = false,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:removeMoneyFromFund', gangTag, withdrawalAmount)
        end
    })
    table.insert(options, {
        title = "Go Back",
        icon = "fa-solid fa-arrow-left",
        arrow = false,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:RefreshGangMenu')
        end
    })
    lib.registerContext({
        id = 'ConfirmWithdrawal',
        title = "Confirm Withdrawal",
        options = options
    })
    lib.showContext('ConfirmWithdrawal')
end

RegisterNetEvent('cb-gangsystem:client:selectedMemberManage')
AddEventHandler('cb-gangsystem:client:selectedMemberManage', function(selectedPlayerData)
    local options = {}
    table.insert(options, {
        title = "Full Name",
        description = selectedPlayerData.playerName,
        icon = "fa-solid fa-user",
        arrow = false,
        disabled = true
    })
    table.insert(options, {
        title = "Citizen ID",
        description = selectedPlayerData.citizenid,
        icon = "fa-solid fa-id-card-clip",
        arrow = false,
        disabled = true
    })
    table.insert(options, {
        title = "Gang Rank",
        description = selectedPlayerData.rank,
        icon = "fa-solid fa-ranking-star",
        arrow = false,
        disabled = true
    })
    table.insert(options, {
        title = "Promote",
        description = "Promote Gang Member to a higher rank",
        icon = "fa-solid fa-thumbs-up",
        iconColor = "green",
        arrow = false,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:promoteMember', selectedPlayerData)
        end
    })
    table.insert(options, {
        title = "Demote",
        description = "Demote Gang Member to a lower rank",
        icon = "fa-solid fa-thumbs-down",
        iconColor = "red",
        arrow = false,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:demoteMember', selectedPlayerData)
        end
    })
    table.insert(options, {
        title = "Kick from Gang",
        description = "Kick a member from the Gang",
        icon = "fa-solid fa-person-hiking",
        iconColor = "black",
        arrow = false,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:kickMember', selectedPlayerData)
        end
    })
    table.insert(options, {
        title = "Go Back",
        icon = "fa-solid fa-arrow-left",
        iconColor = "orange",
        arrow = false,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:RefreshGangMenu')
        end
    })
    lib.registerContext({
        id = 'ManageMember',
        title = "Gang Management",
        options = options
    })
    lib.showContext('ManageMember')
end)

RegisterNetEvent('cb-gangsystem:client:ConfirmGangTransfer', function(selectedPlayer)
    local PlayerData = GetPlayerData()
    local gangName = PlayerData.gang.label
    local options = {}
    table.insert(options,
        {
            title = "Transfer Gang Ownership",
            icon = "fa-solid fa-person-hiking",
            arrow = false,
            disabled = true,
        })
    table.insert(options, {
        title = "Yes",
        description = string.format("Transfer ownership of %s?", gangName),
        icon = "fa-solid fa-thumbs-up",
        iconColor = "green",
        arrow = false,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:TransferGangOwnership', selectedPlayer)
        end
    })
    table.insert(options, {
        title = "No",
        description = "Cancel Transfer of Ownership",
        icon = "fa-solid fa-thumbs-down",
        iconColor = "red",
        arrow = false,
        onSelect = function()
            lib.hideContext(true)
        end
    })
    lib.registerContext({
        id = 'LeaveGangConfirmation',
        title = "Leave Gang",
        options = options
    })
    lib.showContext('LeaveGangConfirmation')
end)

RegisterNetEvent('cb-gangsystem:client:LeaveGangConfirmation', function()
    local PlayerData = GetPlayerData()
    local gangName = PlayerData.gang.label
    local options = {}
    table.insert(options,
        {
            title = string.format("Are you sure you want to leave %s?", gangName),
            icon = "fa-solid fa-person-hiking",
            arrow = false,
            disabled = true,
        })
    table.insert(options, {
        title = "Yes",
        description = string.format("Leave %s", gangName),
        icon = "fa-solid fa-thumbs-up",
        iconColor = "green",
        arrow = false,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:LeaveGang')
        end
    })
    table.insert(options, {
        title = "No",
        description = "Stay in " .. gangName,
        icon = "fa-solid fa-thumbs-down",
        iconColor = "red",
        arrow = false,
        onSelect = function()
            lib.hideContext(true)
        end
    })
    lib.registerContext({
        id = 'LeaveGangConfirmation',
        title = "Leave Gang",
        options = options
    })
    lib.showContext('LeaveGangConfirmation')
end)

RegisterNetEvent('cb-gangsystem:client:chooseLoyaltyMenu', function()
    local PlayerData = GetPlayerData()
    local firstName = PlayerData.charinfo.firstname
    local lastName = PlayerData.charinfo.lastname
    local menuItems = {
        {
            title = firstName .. " " .. lastName,
            description = "Which territory would you like to add Loyalty to?",
            disabled = true
        }
    }
    for k, v in pairs(Config.GangZones) do
        table.insert(menuItems, {
            title = v.label,
            icon = "fa-solid fa-circle-dot",
            event = "cb-gangsystem:client:confirmTerritoryChoice",
            args = v.zone
        })
    end
    lib.registerContext({
        id = 'chooseLoyaltyMenu',
        title = "Choose Loyalty Menu",
        options = menuItems
    })
    lib.showContext('chooseLoyaltyMenu')
end)

RegisterNetEvent('cb-gangsystem:client:confirmTerritoryChoice', function(zone)
    local PlayerData = GetPlayerData()
    local firstName = PlayerData.charinfo.firstname
    local lastName = PlayerData.charinfo.lastname
    for k, v in pairs(Config.GangZones) do
        if v.zone == zone then
            ZoneLabel = v.label
        end
    end
    local menuItems = {
        {
            title = firstName .. " " .. lastName,
            description = string.format("Are you sure you want to add Loyalty in %s?", ZoneLabel),
            disabled = true
        }
    }
    table.insert(menuItems, {
        title = "Yes",
        icon = "fa-solid fa-thumbs-up",
        iconColor = "green",
        event = "cb-gangsystem:client:CompleteMission",
        args = zone
    })
    table.insert(menuItems, {
        title = "No",
        icon = "fa-solid fa-thumbs-down",
        iconColor = "red",
        event = "cb-gangsystem:client:chooseLoyaltyMenu",
    })
    lib.registerContext({
        id = 'confirmTerritoryChoice',
        title = "Confirm Choice",
        options = menuItems
    })
    lib.showContext('confirmTerritoryChoice')
end)

RegisterNetEvent('cb-gangsystem:client:DeclareHomeTurfMenu', function()
    local PlayerData = GetPlayerData()
    local sourceGangName = PlayerData.gang.label
    local firstName = PlayerData.charinfo.firstname
    local lastName = PlayerData.charinfo.lastname
    local menuItems = {}
    for k, v in pairs(Config.GangZones) do
        local description
        if v.community then
            description = "Community Turf"
        else
            description = "Gang Turf"
        end
        table.insert(menuItems, {
            title = v.label,
            icon = "fa-solid fa-flag",
            iconColor = "orange",
            description = description,
            onSelect = function()
                TriggerServerEvent("cb-gangsystem:server:DeclareHomeTurf", PlayerData.source, v.zone)
            end
        })
    end
    table.insert(menuItems, {
        title = "Go Back",
        icon = "fa-solid fa-arrow-left",
        arrow = false,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:RefreshGangMenu')
        end
    })
    lib.registerContext({
        id = 'DeclareHomeTurfMenu',
        title = "Declare Home Turf",
        options = menuItems
    })
    lib.showContext('DeclareHomeTurfMenu')
end)

RegisterNetEvent('cb-gangsystem:client:GangPenaltyMenu', function(receivedGangData)
    local menuItems = {
        {
            title = "Select the Gang you wish to Penalize",
            disabled = true
        }
    }
    for i, gang in pairs(receivedGangData) do
        table.insert(menuItems, {
            title = gang.name,
            icon = "fa-solid fa-user-secret",
            event = "cb-gangsystem:client:GangPenaltyOptions",
            args = gang.id
        })
    end
    lib.registerContext({
        id = 'GangPenaltyMenu',
        title = "Gang Penalty Menu",
        options = menuItems
    })
    lib.showContext('GangPenaltyMenu')
end)

RegisterNetEvent('cb-gangsystem:client:checkLoyaltyMenu', function(GangData, turfControllers, type)
    local PlayerData = GetPlayerData()
    local playerPed = PlayerPedId()
    local playerGang = PlayerData.gang.label
    local menuItems = {}
    if Config.OptionalMenuItems.dontForgetToScroll then
        table.insert(menuItems, {
            title = "-------🛑 Don't forget to Scroll 🛑-------",
            disabled = true,
        })
    end
    local coords = GetEntityCoords(playerPed)
    local gangZone = exports['cb-gangsystem']:GetGangZonePlayer(coords)
    if not Config.FogOfWar or (type == "target") then
        for zoneID, zoneData in pairs(Config.GangZones) do
            local controllingGang = "No Gang Presence"
            local controllingGangImage = Config.DefaultGangImage
            local colorScheme = "red"
            if turfControllers[zoneData.zone] ~= nil then
                controllingGang = GangData[turfControllers[zoneData.zone]].name
                controllingGangImage = GangData[turfControllers[zoneData.zone]].image
                if controllingGang == playerGang then
                    colorScheme = "green"
                end
            end
            if controllingGang == "No Gang Presence" then
                colorScheme = "yellow"
            end
            if zoneData.zone == gangZone then
                table.insert(menuItems, {
                    title = string.format("Current Zone - %s", zoneData.label),
                    description = string.format('%s', controllingGang),
                    icon = "fa-solid fa-flag",
                    iconColor = colorScheme,
                    iconAnimation = 'spinPulse',
                    image = controllingGangImage,
                    onSelect = function()
                        TriggerServerEvent('cb-gangsystem:server:checkLoyaltyDetails', zoneData.zone)
                    end
                })
            else
                table.insert(menuItems, {
                    title = zoneData.label,
                    description = string.format('%s', controllingGang),
                    icon = "fa-solid fa-flag",
                    iconColor = colorScheme,
                    image = controllingGangImage,
                    onSelect = function()
                        TriggerServerEvent('cb-gangsystem:server:checkLoyaltyDetails', zoneData.zone)
                    end
                })
            end
        end
    else
        for zoneID, zoneData in pairs(Config.GangZones) do
            local controllingGang = "No Gang Presence"
            local controllingGangImage = Config.DefaultGangImage
            local colorScheme = "red"
            if turfControllers[zoneData.zone] ~= nil then
                controllingGang = GangData[turfControllers[zoneData.zone]].name
                controllingGangImage = GangData[turfControllers[zoneData.zone]].image
                if controllingGang == playerGang then
                    colorScheme = "green"
                end
            end
            if controllingGang == "No Gang Presence" then
                colorScheme = "yellow"
            end

            if zoneData.zone == gangZone then
                table.insert(menuItems, {
                    title = string.format("Current Zone - %s", zoneData.label),
                    description = string.format('%s', controllingGang),
                    icon = "fa-solid fa-flag",
                    iconColor = colorScheme,
                    iconAnimation = 'spinPulse',
                    image = controllingGangImage,
                    disabled = not (controllingGang == playerGang),
                    onSelect = function()
                        TriggerServerEvent('cb-gangsystem:server:checkLoyaltyDetails', zoneData.zone)
                    end
                })
            elseif controllingGang == playerGang then
                table.insert(menuItems, {
                    title = zoneData.label,
                    description = string.format('%s', controllingGang),
                    icon = "fa-solid fa-flag",
                    iconColor = colorScheme,
                    image = controllingGangImage,
                    onSelect = function()
                        TriggerServerEvent('cb-gangsystem:server:checkLoyaltyDetails', zoneData.zone)
                    end
                })
            end
        end
    end
    lib.registerContext({
        id = 'checkLoyaltyMenu',
        title = "Gang Loyalty",
        options = menuItems
    })
    lib.showContext('checkLoyaltyMenu')
end)

RegisterNetEvent('cb-gangsystem:client:ZoneLoyaltyDetails', function(turfControllers, zone, ActiveRivalryData, GangData)
    local PlayerData = GetPlayerData()
    if PlayerData == nil then return end
    local playerGangTag = PlayerData.gang.name
    local playerGangID = GetGangID(GangData, playerGangTag)
    local menuTitle = "Zone Details"
    local menuItems = {}
    local isRivalry = false
    if Config.OptionalMenuItems.zoneActionsDivider then
        table.insert(menuItems, {
            title = "Zone Actions",
            icon = "fa-solid fa-circle-info",
            iconColor = "blue",
            disabled = true
        })
    end
    if Config.Rivalry.Enabled then
        for i, rivalry in pairs(ActiveRivalryData) do
            if rivalry.zone == zone then
                isRivalry = true
            end
        end
        if isRivalry then
            table.insert(menuItems, {
                title = "View Rivalry Details",
                description = "See who's leading the Rivalry",
                icon = "fa-solid fa-trophy",
                iconColor = "pink",
                onSelect = function()
                    TriggerEvent("cb-gangsystem:client:ViewRivalryDetails", zone, ActiveRivalryData, GangData)
                end
            })
        end
        if not isRivalry and Config.Rivalry.Enabled then
            table.insert(menuItems, {
                title = "Start Rivalry",
                description = "A portion of all drug proceeds will go directly to Franklin. Whoever sells the most at the end of the Rivalry will take all the money in Escrow",
                icon = "fa-solid fa-bolt",
                iconColor = "red",
                onSelect = function()
                    TriggerEvent('cb-gangsystem:client:ConfirmRivalry', exports['cb-gangsystem']:GetTurfName(zone), zone)
                end
            })
        end
    end
    table.insert(menuItems, {
        title = "Locate Zone",
        description = "Mark the Zone on your GPS",
        icon = "fa-solid fa-map",
        iconColor = "orange",
        onSelect = function()
            local coords = exports['cb-gangsystem']:GetGangZoneCoords(zone)
            SetNewWaypoint(coords.x, coords.y)
            local notifyLabel = "Check GPS"
            local notifyMessage = "Zone marked on your GPS."
            TriggerEvent('cb-gangsystem:client:Notify', notifyLabel, notifyMessage, "success")
        end
    })
    if Config.OptionalMenuItems.zoneDetailsDivider then
        table.insert(menuItems, {
            title = "Gang Presence by Gang",
            icon = "fa-solid fa-circle-info",
            iconColor = "blue",
            disabled = true
        })
    end
    for _, turfController in ipairs(turfControllers) do
        menuTitle = string.format('%s', exports['cb-gangsystem']:GetTurfName(turfController.name))
        if playerGangID == turfController.gangID then
            table.insert(menuItems, {
                title = GangData[turfController.gangID].name,
                description = string.format("Loyalty: %.0f", turfController.loyalty),
                image = GangData[turfController.gangID].image,
                icon = "fa-solid fa-gun",
                iconColor = "green"
            })
        else
            table.insert(menuItems, {
                title = GangData[turfController.gangID].name,
                description = string.format("Loyalty: %.0f", turfController.loyalty),
                image = GangData[turfController.gangID].image,
                icon = "fa-solid fa-gun",
                iconColor = "red"
            })
        end
    end
    if menuTitle == "Zone Details" then
        table.insert(menuItems, {
            title = "No Gang Presence",
            description = "There is no Gang Presence in this zone.",
            icon = "fa-solid fa-gun",
        })
    end
    table.insert(menuItems, {
        title = "Go Back",
        icon = "fa-solid fa-arrow-left",
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:checkLoyalty', PlayerData.source)
        end,
    })
    lib.registerContext({
        id = 'LoyaltyDetails',
        title = menuTitle,
        options = menuItems
    })
    lib.showContext('LoyaltyDetails')
end)

RegisterNetEvent('cb-gangsystem:client:ViewRivalryDetails')
AddEventHandler('cb-gangsystem:client:ViewRivalryDetails', function(zone, ActiveRivalryData, GangData)
    local menuItems = {}
    local PlayerData = GetPlayerData()
    if PlayerData == nil then return end
    local gangTag = PlayerData.gang.name
    local gangID = GetGangID(GangData, gangTag)

    for _, rivalryData in pairs(ActiveRivalryData) do
        if rivalryData.zone == zone then
            table.insert(menuItems, {
                title = string.format("Escrowed Cash: $%.0f", tonumber(rivalryData.escrow)),
                description = "This is the amount that the winning Gang will receive when the Rivalry is over.",
                icon = "fa-solid fa-money-bill",
                iconColor = "green",
                iconAnimation = 'beat',
                arrow = false,
                onSelect = function()
                    TriggerEvent('cb-gangsystem:client:ViewRivalryDetails', zone, ActiveRivalryData, GangData)
                end
            })
            for _, competitionEntry in ipairs(rivalryData.competition) do
                local rivalGangID, loyaltyEarned = competitionEntry:match("(%d+)%s*-%s*(%d+)")
                if rivalGangID then
                    local rivalGangLabel = GangData[tonumber(rivalGangID)].name  -- Replace with actual gang label retrieval
                    local rivalGangLoyalty = tonumber(loyaltyEarned)  -- Convert loyaltyEarned to number
                    local description = string.format("Earned Loyalty: %d", rivalGangLoyalty)
                    if rivalGangID == gangID then
                        table.insert(menuItems, {
                            title = rivalGangLabel,
                            description = description,
                            icon = "fa-solid fa-gun",
                            iconColor = "green",
                            arrow = false,
                            onSelect = function()
                                TriggerEvent('cb-gangsystem:client:ViewRivalryDetails', zone, ActiveRivalryData,
                                    GangData)
                            end
                        })
                    else
                        table.insert(menuItems, {
                            title = rivalGangLabel,
                            description = description,
                            icon = "fa-solid fa-gun",
                            iconColor = "red",
                            arrow = false,
                            onSelect = function()
                                TriggerEvent('cb-gangsystem:client:ViewRivalryDetails', zone, ActiveRivalryData, GangData)
                            end
                        })
                    end
                end
            end
            break -- Once we find the rivalry data for the specified zone, we can break the loop
        end
    end
    table.insert(menuItems, {
        title = "Go Back",
        icon = "fa-solid fa-arrow-left",
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:checkLoyalty', PlayerData.source)
        end
    })

    -- Register context menu with dynamic menu items
    lib.registerContext({
        id = 'RivalryDetails',
        title = "Rivalry Details",
        options = menuItems
    })
    lib.showContext('RivalryDetails')
end)

RegisterNetEvent('cb-gangsystem:client:ConfirmRivalry', function(zoneLabel, zone)
    local menuItems = {}
    table.insert(menuItems, {
        title = string.format("Start Rivalry Cost: $%.0f", Config.Rivalry.Cost),
        icon = "fa-solid fa-money-bill",
        iconColor = "pink",
        arrow = false,
        disabled = true,
    })
    table.insert(menuItems, {
        title = "Yes",
        description = string.format("Start a Rivalry in %s for $%.0f?", zoneLabel, Config.Rivalry.Cost),
        icon = "fa-solid fa-thumbs-up",
        iconColor = "green",
        arrow = false,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:StartRivalry', zone)
        end
    })
    table.insert(menuItems, {
        title = "No",
        description = "Back to Gang Menu",
        icon = "fa-solid fa-thumbs-down",
        iconColor = "red",
        arrow = false,
        onSelect = function()
            TriggerServerEvent('cb-gangsystem:server:RefreshGangMenu')
        end
    })
    lib.registerContext({
        id = 'ConfirmRivalry',
        title = "Confirm Rivalry",
        options = menuItems
    })
    lib.showContext('ConfirmRivalry')
end)

RegisterNetEvent('cb-gangsystem:client:GangStaffOptions', function(gangID)
    local menuItems = {}
    table.insert(menuItems, {
        title = "Increase Turf",
        description = "Increase the loyalty in a specific Turf",
        icon = "fa-solid fa-up-long",
        iconColor = "green",
        event = "cb-gangsystem:client:StaffIncreaseTurf",
        args = gangID
    })
    table.insert(menuItems, {
        title = "Decrease Turf",
        description = "Decrease the loyalty in a specific Turf",
        icon = "fa-solid fa-down-long",
        iconColor = "red",
        event = "cb-gangsystem:client:StaffDecreaseTurf",
        args = gangID
    })
    table.insert(menuItems, {
        title = "Increase Prevalence",
        description = "Increase the Gang Prevalence",
        icon = "fa-solid fa-arrow-up",
        iconColor = "green",
        onSelect = function()
            StaffModifyPrevalenceInput(gangID, "Increase")
        end
    })
    table.insert(menuItems, {
        title = "Decrease Prevalence",
        description = "Decrease the Gang Prevalence",
        icon = "fa-solid fa-arrow-down",
        iconColor = "red",
        onSelect = function()
            StaffModifyPrevalenceInput(gangID, "Decrease")
        end
    })
    table.insert(menuItems, {
        title = "Penalize Top 3 Turfs",
        description = "Penalize the Top 3 turfs that the Gang controls",
        event = "cb-gangsystem:client:StaffPenalizeTop3",
        icon = "fa-solid fa-ranking-star",
        iconColor = "orange",
        args = gangID
    })
    table.insert(menuItems, {
        title = "Penalize Home Turf",
        description = "Penalize the Home Turf that the Gang controls",
        event = "cb-gangsystem:client:StaffPenalizeHomeTurf",
        icon = "fa-solid fa-house",
        iconColor = "pink",
        args = gangID
    })
    table.insert(menuItems, {
        title = "Gang Timeout",
        description = "Place the Gang in Gang Timeout",
        event = "cb-gangsystem:client:StaffGangTimeout",
        icon = "fa-solid fa-handcuffs",
        iconColor = "black",
        args = gangID
    })
    table.insert(menuItems, {
        title = "Remove Gang Timeout",
        description = "Remove the Gang from Gang Timeout",
        event = "cb-gangsystem:client:StaffRemoveGangTimeout",
        icon = "fa-solid fa-rotate-right",
        iconColor = "teal",
        args = gangID
    })
    table.insert(menuItems, {
        title = "Reset Gang Storage",
        description = "Moves the Gang Storage back to the Mafia Hideout",
        serverEvent = "cb-gangsystem:server:ResetGangStorage",
        icon = "fa-solid fa-arrows-rotate",
        iconColor = "purple",
        args = gangID
    })
    table.insert(menuItems, {
        title = "Delete Gang",
        description = "Disband the Gang entirely",
        onSelect = function()
            StaffDeleteGangConfirmation(gangID)
        end,
        icon = "fa-solid fa-trash",
        iconColor = "red",
        args = gangID
    })
    table.insert(menuItems, {
        title = "Rename Gang",
        description = "Rename the Gang",
        onSelect = function()
            RenameGangInput(gangID)
        end,
        icon = "fa-solid fa-font",
        iconColor = "yellow",
        args = gangID
    })
    lib.registerContext({
        id = 'gangStaffMenu',
        title = "Staff Options",
        options = menuItems
    })
    lib.showContext('gangStaffMenu')
end)

function StaffGangManagementMenu(receivedGangData)
    local menuItems = {}
    for i, gang in pairs(receivedGangData) do
        table.insert(menuItems, {
            title = gang.name,
            icon = string.format("%s%s.png", Config.GangImagePath, gang.tag),
            image = string.format("%s%s.png", Config.GangImagePath, gang.tag),
            description = string.format("Leader Citizen ID: %s \n Tag: %s \n Home Turf: %s \n Last Active: %s", gang.leader_cid, gang.tag, gang.home_turf, gang.last_active),
            event = "cb-gangsystem:client:GangStaffOptions",
            args = gang.id
        })
    end
    table.insert(menuItems, {
        title = "Go Back",
        icon = "fa-solid fa-arrow-left",
        iconColor = "orange",
        arrow = false,
        onSelect = function()
            lib.showContext('gangStaffMenu')
        end
    })
    lib.registerContext({
        id = 'StaffGangManagementMenu',
        title = "Gang Staff Menu",
        options = menuItems
    })
    lib.showContext('StaffGangManagementMenu')
end

RegisterNetEvent('cb-gangsystem:client:GangStaffMenu', function(receivedGangData)
    local menuItems = {}
    table.insert(menuItems, {
        title = "Gang Management",
        description = "Manage a gang",
        onSelect = function()
            StaffGangManagementMenu(receivedGangData)
        end,
        icon = "fa-solid fa-user",
        iconColor = "orange",
    })
    table.insert(menuItems, {
        title = "War Management",
        description = "Manage a Gang War",
        onSelect = function()
            ManageGangWarMenu(receivedGangData)
        end,
        icon = "fa-solid fa-gun",
        iconColor = "red",
    })
    lib.registerContext({
        id = 'gangStaffMenu',
        title = "Gang Staff Menu",
        options = menuItems
    })
    lib.showContext('gangStaffMenu')
end)

RegisterNetEvent('cb-gangsystem:client:StaffIncreaseTurf', function(gangID)
    local menuItems = {}
    for k, v in pairs(Config.GangZones) do
        table.insert(menuItems, {
            title = v.label,
            event = "cb-gangsystem:client:StaffIncreaseTurfChooseAmount",
            args = { zone = v.zone, gangID = gangID }
        })
    end
    lib.registerContext({
        id = 'StaffIncreaseTurf',
        title = "Gang Zone",
        options = menuItems
    })
    lib.showContext('StaffIncreaseTurf')
end)

RegisterNetEvent('cb-gangsystem:client:StaffDecreaseTurf', function(gangID)
    local menuItems = {}
    for k, v in pairs(Config.GangZones) do
        table.insert(menuItems, {
            title = v.label,
            event = "cb-gangsystem:client:StaffDecreaseTurfChooseAmount",
            args = { zone = v.zone, gangID = gangID }
        })
    end
    lib.registerContext({
        id = 'StaffDecreaseTurf',
        title = "Gang Zone",
        options = menuItems
    })
    lib.showContext('StaffDecreaseTurf')
end)

RegisterNetEvent('cb-gangsystem:client:StaffIncreaseTurfChooseAmount')
AddEventHandler('cb-gangsystem:client:StaffIncreaseTurfChooseAmount', function(arguments)
    local menuItems = {}
    local staffPenaltyAmounts = FetchStaffPenaltyAmounts()
    for _, penalty in ipairs(staffPenaltyAmounts) do
        table.insert(menuItems, {
            title = tostring(penalty),
            description = string.format("Equal to %.1f Drug Sales", penalty/Config.Loyalty.Increase.Drugs),
            serverEvent = "cb-gangsystem:server:StaffIncreaseTurf",
            args = { gangID = arguments.gangID, zone = arguments.zone, increase = penalty }
        })
    end
    lib.registerContext({
        id = 'StaffIncreaseTurfChooseAmount',
        title = "Penalty Amount",
        options = menuItems
    })
    lib.showContext('StaffIncreaseTurfChooseAmount')
end)

RegisterNetEvent('cb-gangsystem:client:StaffDecreaseTurfChooseAmount')
AddEventHandler('cb-gangsystem:client:StaffDecreaseTurfChooseAmount', function(arguments)
    local menuItems = {}
    local staffPenaltyAmounts = FetchStaffPenaltyAmounts()
    for _, penalty in ipairs(staffPenaltyAmounts) do
        table.insert(menuItems, {
            title = tostring(penalty),
            description = string.format("Equal to %.1f Drug Sales", penalty/Config.Loyalty.Increase.Drugs),
            serverEvent = "cb-gangsystem:server:StaffDecreaseTurf",
            args = { gangID = arguments.gangID, zone = arguments.zone, increase = penalty }
        })
    end
    lib.registerContext({
        id = 'StaffDecreaseTurfChooseAmount',
        title = "Penalty Amount",
        options = menuItems
    })
    lib.showContext('StaffDecreaseTurfChooseAmount')
end)


RegisterNetEvent('cb-gangsystem:client:StaffPenalizeTop3')
AddEventHandler('cb-gangsystem:client:StaffPenalizeTop3', function(gangID)
    local menuItems = {}
    local staffPenaltyAmounts = FetchStaffPenaltyAmounts()
    for _, penalty in ipairs(staffPenaltyAmounts) do
        table.insert(menuItems, {
            title = tostring(penalty),
            description = string.format("Equal to %.1f Drug Sales", penalty/Config.Loyalty.Increase.Drugs),
            serverEvent = "cb-gangsystem:server:StaffPenalizeTop3",
            args = { gangID = gangID, penalty = penalty }
        })
    end
    table.insert(menuItems, {
        title = "Go Back",
        icon = "fa-solid fa-arrow-left",
        event = "cb-gangsystem:client:GangPenaltyOptions",
        args = gangID
    })
    lib.registerContext({
        id = 'StaffPenalizeTop3',
        title = "Penalty Amount",
        options = menuItems
    })
    lib.showContext('StaffPenalizeTop3')
end)

RegisterNetEvent('cb-gangsystem:client:StaffPenalizeHomeTurf', function(gangID)
    local menuItems = {}
    local staffPenaltyAmounts = FetchStaffPenaltyAmounts()
    for _, penalty in ipairs(staffPenaltyAmounts) do
        table.insert(menuItems, {
            title = tostring(penalty),
            description = string.format("Equal to %.1f Drug Sales", penalty/Config.Loyalty.Increase.Drugs),
            serverEvent = "cb-gangsystem:server:StaffPenalizeHomeTurf",
            args = { gangID = gangID, penalty = penalty }
        })
    end
    table.insert(menuItems, {
        title = "Go Back",
        icon = "fa-solid fa-arrow-left",
        event = "cb-gangsystem:client:GangPenaltyOptions",
        args = gangID
    })
    lib.registerContext({
        id = 'StaffPenalizeHomeTurf',
        title = "Penalty Amount",
        options = menuItems
    })
    lib.showContext('StaffPenalizeHomeTurf')
end)

RegisterNetEvent('cb-gangsystem:client:StaffGangTimeout', function(gangID)
    local menuItems = {
        {
            title = "Gang Timeout",
            description = "Are you sure you want to put this gang in Gang Timeout?",
            disabled = true,
        }
    }
    table.insert(menuItems, {
        title = "Yes",
        icon = "fa-solid fa-thumbs-up",
        iconColor = "green",
        serverEvent = "cb-gangsystem:server:StaffGangTimeout",
        args = gangID
    })
    table.insert(menuItems, {
        title = "No",
        icon = "fa-solid fa-thumbs-down",
        iconColor = "red",
        event = "cb-gangsystem:client:GangPenaltyOptions",
        args = gangID
    })
    lib.registerContext({
        id = 'ConfirmStaffGangTimeout',
        title = "Confirm Gang Timeout",
        options = menuItems
    })
    lib.showContext('ConfirmStaffGangTimeout')
end)

RegisterNetEvent('cb-gangsystem:client:StaffRemoveGangTimeout', function(gangID)
    local menuItems = {
        {
            title = "Gang Timeout",
            description = "Are you sure you want to remove this gang from Gang Timeout?",
            disabled = true,
        }
    }
    table.insert(menuItems, {
        title = "Yes",
        icon = "fa-solid fa-thumbs-up",
        iconColor = "green",
        serverEvent = "cb-gangsystem:server:StaffRemoveGangTimeout",
        args = gangID
    })
    table.insert(menuItems, {
        title = "No",
        icon = "fa-solid fa-thumbs-down",
        iconColor = "red",
        event = "cb-gangsystem:client:GangPenaltyOptions",
        args = gangID
    })
    lib.registerContext({
        id = 'StaffRemoveGangTimeout',
        title = "Remove Gang Timeout",
        options = menuItems
    })
    lib.showContext('StaffRemoveGangTimeout')
end)

-- TODO: Franklin sends text messages when stuff like Blueprints are ready
-- TODO: Stop Re-Registering Context Menus. This can be more optimized
function SpecialGangTableMenu(name)
    if name == "Blueprint" then
        lib.registerContext({
            id = 'BlueprintTableMenu',
            title = "Blueprint Table",
            options = {
                {
                    title = "Craft Blueprint",
                    description = "Craft a random Blueprint",
                    icon = "fa-solid fa-pencil",
                    arrow = true,
                    onSelect = function()
                        if Config.BlueprintSystemType == "gang" then
                            local pass = lib.callback.await('cb-gangsystem:server:CheckLastBlueprint', false)
                            if pass == "Access Granted" then
                                if exports.erp_progressbar:taskBar({
                                    length = Config.BlueprintCraftDuration,
                                    text = "Drawing Blueprints...",
                                    animation = {
                                        stuck = true
                                    }
                                }) == 100 then
                                    TriggerServerEvent('cb-gangsystem:server:RandomBlueprint')
                                else
                                    SpecialGangTableMenu("Blueprint")
                                end
                            elseif pass == "Gang Timeout" then
                                TriggerEvent('cb-gangsystem:client:Notify', "Gang Timeout",
                                "Improve your standing with the Gods!", "error")
                            elseif pass == "War Timeout" then
                                TriggerEvent('cb-gangsystem:client:Notify', "War Timeout",
                                "Losing a war has it's costs. Try again later.", "error")
                            elseif pass == "Gang War" then
                                TriggerEvent('cb-gangsystem:client:Notify', "Gang War",
                                    "You are at war! Settle the beef first!", "error")
                            elseif pass == "Not Ready Yet" then
                                TriggerEvent('cb-gangsystem:client:Notify', "Not Ready Yet",
                                    string.format("Blueprint is not ready yet. 1 Blueprint every %.0f hours!", Config.BlueprintTableWaitTime), "error")
                            end
                        else
                            local pass = lib.callback.await('cb-gangsystem:server:CheckLastBlueprintPerson', false)
                            if pass == "Access Granted" then
                                if exports.erp_progressbar:taskBar({
                                    length = Config.BlueprintCraftDuration,
                                    text = "Drawing Blueprints...",
                                    animation = {
                                        stuck = true
                                    }
                                }) == 100 then
                                    TriggerServerEvent('cb-gangsystem:server:RandomBlueprint')
                                else
                                    SpecialGangTableMenu("Blueprint")
                                end
                            elseif pass == "Gang Timeout" then
                                TriggerEvent('cb-gangsystem:client:Notify', "Gang Timeout",
                                "Improve your standing with the Gods!", "error")
                            elseif pass == "War Timeout" then
                                TriggerEvent('cb-gangsystem:client:Notify', "War Timeout",
                                "Losing a war has it's costs. Try again later.", "error")
                            elseif pass == "Gang War" then
                                TriggerEvent('cb-gangsystem:client:Notify', "Gang War",
                                    "You are at war! Settle the beef first!", "error")
                            elseif pass == "Not Ready Yet" then
                                TriggerEvent('cb-gangsystem:client:Notify', "Not Ready Yet",
                                    string.format("Blueprint is not ready yet. 1 Blueprint every %.0f hours!", Config.BlueprintTableWaitTime), "error")
                            end
                        end
                    end
                },
            }
        })
        lib.showContext('BlueprintTableMenu')
    end
end