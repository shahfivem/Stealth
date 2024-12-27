function HowManyInput(items, craftItem, recipeResultAmount, duration, label, dict, clip)
    PlayerData = GetPlayerData()
    local input = lib.inputDialog("How Many?", {
        {type = 'number', label = "Enter Amount", min = 1, description = "Enter the amount you wish to craft", icon = 'hashtag'},
    })
    if input ~= nil then
        local craftAmount = input[1]
        local pass = lib.callback.await('cb-gangsystem:server:CanCraft', false, items, craftAmount)
        if not pass then
            TriggerEvent('cb-gangsystem:client:Notify', "Not Enough Materials", "You don't have enough materials to craft this.", "error")
        else
            CraftItem(items, craftAmount, craftItem, recipeResultAmount, duration, label, dict, clip)
        end
    end
end

function RenameRankInput(gangID, grade)
    local input = lib.inputDialog("Rename Rank", {
        {
            type = 'input',
            label = "Rank Name",
            icon = "fa-solid fa-font",
            required = true
        },
    })
    if input ~= nil then
        local newRankName = input[1]
        TriggerServerEvent('cb-gangsystem:server:renameRank', newRankName, gangID, grade)
    end
end

function RenameGangInput(gangID)
    local input = lib.inputDialog("Rename Gang", {
        {
            type = 'input',
            label = "New Gang Name",
            icon = "fa-solid fa-font",
            required = true
        },
    })
    if input ~= nil then
        local newRankName = input[1]
        local phoneNumber = nil
        TriggerServerEvent('cb-gangsystem:server:renameGang', newRankName, gangID)
    end
end

function StaffModifyWarScore_Input(gangID, modifier, warID)
    local input = lib.inputDialog(modifier.." War Score", {
        {
            type = 'number',
            label = "Amount",
            icon = "hashtag",
            required = true
        },
    })
    if input ~= nil then
        local modifyAmount = input[1]
        local GangData = lib.callback.await('cb-gangsystem:server:ModifyWarScore', false, gangID, modifyAmount, modifier, warID)
        if GangData then
            TriggerEvent('cb-gangsystem:client:Notify', "War Score Modified", "You modified the War Score for " .. GangData[gangID].name, "success")
        else
            TriggerEvent('cb-gangsystem:client:Notify', "War Score Error", "There was an error editing the War Score. Please try again!", "error")
        end
    end
end

function StaffModifyPrevalenceInput(gangID, modifier)
    local input = lib.inputDialog(modifier.." Prevalence", {
        {
            type = 'number',
            label = "Amount",
            icon = "hashtag",
            required = true
        },
    })
    if input ~= nil then
        local modifyAmount = input[1]
        local GangData = lib.callback.await('cb-gangsystem:server:StaffModifyPrevalence', false, gangID, modifyAmount, modifier)
        if GangData then
            TriggerEvent('cb-gangsystem:client:Notify', "Prevalence Modified", "You modified the Gang Prevalence for " .. GangData[gangID].name, "success")
        else
            TriggerEvent('cb-gangsystem:client:Notify', "War Score Error", "There was an error editing the Prevalence. Please try again!", "error")
        end
    end
end

RegisterNetEvent('cb-gangsystem:client:AddMemberInputMenu')
AddEventHandler('cb-gangsystem:client:AddMemberInputMenu', function(nearbyPlayers)
    local input = lib.inputDialog("Add New Member", {
        {
            type = 'select',
            label = "Citizen",
            icon = "fa-solid fa-users-viewfinder",
            options = nearbyPlayers,
            value = nearbyPlayers[1] and nearbyPlayers[1].value or nil,
            required = true
        },
    })
    if input ~= nil then
        local nearbyPlayer = input[1]
        TriggerServerEvent('cb-gangsystem:server:AddMemberGetPlayerData', nearbyPlayer)
    end
end)

RegisterNetEvent('cb-gangsystem:client:removeMoneyFromFund')
AddEventHandler('cb-gangsystem:client:removeMoneyFromFund', function(balance)
    local PlayerData = GetPlayerData()
    local gangTag = PlayerData.gang.name
    local input = lib.inputDialog("Withdraw Cash", {
        {
            type = 'slider',
            label = "Withdrawal Amount ($)",
            min = 0,
            max = balance,
            description = "Select the amount you wish to Withdraw",
            icon = "fa-solid fa-money-bill",
            default = 0,
            required = true,
        },
    })

    if input ~= nil then
        local depositAmount = input[1]
        ConfirmWithdrawal(gangTag, depositAmount)
    end
end)

RegisterNetEvent('cb-gangsystem:client:ManageMembersMenu')
AddEventHandler('cb-gangsystem:client:ManageMembersMenu', function(onlinePlayers)
    if Framework ~= "qbox" then -- Using online players only for frameworks that are NOT QBOX
        local input = lib.inputDialog("Gang Management", {
            {
                type = 'select',
                label = "Citizen",
                description = "Gang Member",
                icon = "fa-solid fa-users-viewfinder",
                options = onlinePlayers,
                value = onlinePlayers[1] and onlinePlayers[1].value or nil,
                required = true
            },
        })
        if input ~= nil then
            local selectedPlayer = input[1]
            TriggerServerEvent('cb-gangsystem:server:getPlayerData', selectedPlayer)
        end
    else
        local input = lib.inputDialog("Gang Management", {
            {
                type = 'select',
                label = "Citizen",
                description = "Gang Member",
                icon = "fa-solid fa-users-viewfinder",
                options = onlinePlayers,
                value = onlinePlayers[1] and onlinePlayers[1].value or nil,
                required = true
            },
        })
        if input ~= nil then
            local selectedPlayer = input[1]
            TriggerServerEvent('cb-gangsystem:server:getPlayerData', selectedPlayer)
        end
    end
end)

-- TODO: Revisit gang creation. Seemed to be some sort of issue with getting the leaders data to store in player_groups table of database

RegisterNetEvent('cb-gangsystem:client:CreateGangInputMenu')
AddEventHandler('cb-gangsystem:client:CreateGangInputMenu', function()
    local PlayerData = GetPlayerData()
    if PlayerData == nil then return end
    local cid = PlayerData.citizenid
    local input = lib.inputDialog("Articles of Incorporation", {
        {type = 'input', label = "Name", description = "Gang Name", icon = "fa-solid fa-id-card-clip", required = true, min = 4, max = 16},
        {type = 'input', label = "Tag", description = "Gang Tag (e.g. The Bloods = \"bld\")", icon = "fa-solid fa-hashtag", required = true, min = 3, max = 3},
    })
    if input ~= nil then
        local citizenID = cid
        local name = input[1]
        local tag = string.lower(input[2])
        TriggerServerEvent('cb-gangsystem:server:AddNewGang', citizenID, name, tag)
    else
        TriggerEvent('cb-gangsystem:client:Notify', "Form Not Complete", "You didn\'t fill out the Form", "error")
        TriggerEvent('cb-gangsystem:client:CreateGangInputMenu')
    end
end)