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

function GetPlayerData()
    if Framework == "qb-core" then
        return QBCore.Functions.GetPlayerData()
    elseif Framework == "qbox" then
        return QBX.PlayerData
    end
end

function GetPlayerJob()
    if Framework == "qbox" then
        return QBX.PlayerData.job.name
    else
        -- TODO: QB-Core Stuff
    end
end

function GetPlayerJobLabel()
    if Framework == "qbox" then
        return QBX.PlayerData.job.label
    else
        -- TODO: QB-Core Stuff
    end
end

function IsOnDuty()
    if Framework == "qbox" then
        return QBX.PlayerData.job.onduty
    else
        -- TODO: QB-Core Stuff
    end
end

function ShowTextUI(text)
    lib.showTextUI(text, {
        position = "left-center",
        icon = 'mask',
        style = {
            borderRadius = 0,
            backgroundColor = '#41e5ff',
            color = 'black'
        }
    })
end

function HideTextUI()
    lib.hideTextUI()
end

function IsPlayerBoss(checkJob)
    return GetPlayerData().job.isboss and (GetPlayerData().job.name == checkJob)
end

function GetItemLabel(item)
    if GetResourceState('ox_inventory') == 'started' then
        return exports.ox_inventory:Items(item).label
    else
        return QBCore.Shared.Items[item].label
    end
end

function GetItemImage(item)
    if GetResourceState('ox_inventory') == 'started' then
        if exports.ox_inventory:Items(item).client.image ~= nil then
            return exports.ox_inventory:Items(item).client.image
        else
            return "nui://" .. Config.InventoryImage .. item .. ".png"
        end
    else
        return "nui://" .. Config.InventoryImage .. QBCore.Shared.Items[item].image
    end
end

function TeleportPlayer(coords)
    SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, 0, 0, 0, false)
end

function OpenStash(gangName)
    if UsingOxInventory then
        TriggerServerEvent("cb-businesses:server:RegisterStash", gangName)
    elseif Config.UsingNewQB then
        TriggerServerEvent("cb-businesses:server:RegisterStash", gangName)
    else
        TriggerServerEvent("inventory:server:OpenInventory", "stash", gangName, {maxweight = Config.GangStashes.maxWeight, slots = Config.GangStashes.slots})
        TriggerEvent("inventory:client:SetCurrentStash", gangName)
    end
end

RegisterNetEvent('cb-businesses:client:Notify', function(label, message, notifyType)
    if notifyType == "info" then
        lib.notify({
            title = label,
            description = message,
            duration = 7500,
            position = 'top-right',
            icon = 'circle-info',
            iconColor = '#0000FF'
        })
    elseif notifyType == "success" then
        lib.notify({
            title = label,
            description = message,
            duration = 7500,
            position = 'top-right',
            icon = 'circle-check',
            iconColor = '#008000'
        })
    elseif notifyType == "error" then
        lib.notify({
            title = label,
            description = message,
            duration = 7500,
            position = 'top-right',
            icon = 'ban',
            iconColor = '#C53030'
        })
    end
end)

RegisterNetEvent('cb-businesses:client:NotEnoughSpace', function()
    lib.notify({
        title = "Not Enough Space",
        description = "You don't have enough space in your inventory to take more items!",
        duration = 7500,
        position = 'center-right',
        icon = 'ban',
        iconColor = '#C53030'
    })
end)

function HasItemClient(item, amount)
    if amount == nil then amount = 1 end
    if UsingOxInventory then
        local itemCount = exports.ox_inventory:GetItemCount(item)
        if not itemCount then
            return false
        elseif itemCount >= amount then
            return true
        else
            return false
        end
    else
        return QBCore.Functions.HasItem(item, amount)
    end
end

function GetItemCountClient(item)
    if amount == nil then amount = 1 end
    if UsingOxInventory then
        local itemCount = exports.ox_inventory:GetItemCount(item)
        if not itemCount then
            return false
        elseif itemCount >= amount then
            return true
        else
            return false
        end
    else
        return QBCore.Functions.HasItem(item, amount)
    end
end

function GetPlayerOutfit(ped)
    local outfit = {
        mask = {
            drawable = GetPedDrawableVariation(ped, 1),
            texture = GetPedTextureVariation(ped, 1)
        },
        hair = {
            drawable = GetPedDrawableVariation(ped, 2),
            texture = GetPedTextureVariation(ped, 2)
        },
        torso = {
            drawable = GetPedDrawableVariation(ped, 3),
            texture = GetPedTextureVariation(ped, 3)
        },
        legs = {
            drawable = GetPedDrawableVariation(ped, 4),
            texture = GetPedTextureVariation(ped, 4)
        },
        bags = {
            drawable = GetPedDrawableVariation(ped, 5),
            texture = GetPedTextureVariation(ped, 5)
        },
        shoes = {
            drawable = GetPedDrawableVariation(ped, 6),
            texture = GetPedTextureVariation(ped, 6)
        },
        accessories = {
            drawable = GetPedDrawableVariation(ped, 7),
            texture = GetPedTextureVariation(ped, 7)
        },
        undershirts = {
            drawable = GetPedDrawableVariation(ped, 8),
            texture = GetPedTextureVariation(ped, 8)
        },
        bodyarmor = {
            drawable = GetPedDrawableVariation(ped, 9),
            texture = GetPedTextureVariation(ped, 9)
        },
        decals = {
            drawable = GetPedDrawableVariation(ped, 10),
            texture = GetPedTextureVariation(ped, 10)
        },
        tops = {
            drawable = GetPedDrawableVariation(ped, 11),
            texture = GetPedTextureVariation(ped, 11)
        },
        hats = {
            drawable = GetPedDrawableVariation(ped, 1),
            texture = GetPedTextureVariation(ped, 1)
        },
        glasses = {
            drawable = GetPedDrawableVariation(ped, 1),
            texture = GetPedTextureVariation(ped, 1)
        },
        ears = {
            drawable = GetPedDrawableVariation(ped, 1),
            texture = GetPedTextureVariation(ped, 1)
        },
        watches = {
            drawable = GetPedDrawableVariation(ped, 1),
            texture = GetPedTextureVariation(ped, 1)
        },
        bracelets = {
            drawable = GetPedDrawableVariation(ped, 1),
            texture = GetPedTextureVariation(ped, 1)
        }
    }
    return outfit
end