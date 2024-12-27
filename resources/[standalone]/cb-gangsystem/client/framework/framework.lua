if GetResourceState('qbx_core') == 'started' then
    Framework = "qbox"
elseif GetResourceState('qb-core') == 'started' then
    Framework = "qb-core"
    QBCore = exports['qb-core']:GetCoreObject()
end
if GetResourceState('qb-target') == 'started' then
    Target = "qb"
elseif GetResourceState('ox_target') == 'started' then
    Target = "ox"
end
UsingOxInventory = GetResourceState('ox_inventory') == 'started'

function GetPlayerData()
    if Framework == "qb-core" then
        return QBCore.Functions.GetPlayerData()
    elseif Framework == "qbox" then
        return QBX.PlayerData
    end
end

function OpenStash(gangName)
    if UsingOxInventory then
        TriggerServerEvent("cb-gangsystem:server:RegisterStash", gangName)
    elseif Config.UsingNewQB then
        TriggerServerEvent("cb-gangsystem:server:RegisterStash", gangName)
    else
        TriggerServerEvent("inventory:server:OpenInventory", "stash", gangName, {maxweight = Config.GangStashes.maxWeight, slots = Config.GangStashes.slots})
        TriggerEvent("inventory:client:SetCurrentStash", gangName)
    end
end

function CheckItem(item, amount)
    if not UsingOxInventory and Framework == "qb-core" then
        return QBCore.Functions.HasItem(item, amount)
    elseif UsingOxInventory then
        if UsingOxInventory then
            local itemCount = exports.ox_inventory:Search("count", item)
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
    return false
end

RegisterNetEvent('cb-gangsystem:client:Notify', function(label, message, notifyType, time)
    if not time then time = 7500 end
    if Config.Notify == "ox" then
        if notifyType == "info" then
            lib.notify({
                title = label,
                description = message,
                duration = time,
                position = 'center-right',
                icon = 'circle-info',
                iconColor = '#0000FF'
            })
        elseif notifyType == "success" then
            lib.notify({
                title = label,
                description = message,
                duration = time,
                position = 'center-right',
                icon = 'circle-check',
                iconColor = '#008000'
            })
        elseif notifyType == "error" then
            lib.notify({
                title = label,
                description = message,
                duration = time,
                position = 'center-right',
                icon = 'ban',
                iconColor = '#C53030'
            })
        end
    elseif Config.Notify == "qb" then
        QBCore.Functions.Notify(message, notifyType, time)
    elseif Config.Notify == "okok" then
        exports['okokNotify']:Alert(label, message, time, notifyType, true)
    elseif Config.Notify == "other" then
        -- Place your custom notify event here
    end
end)

function GetItemImage(item)
    if UsingOxInventory then
        return exports.ox_inventory:Items(item).image
    else
        return QBCore.Shared.Items[item].image
    end
end

function CustomDispatchNotify()
    -- Put your custom dispatch event here for Drug Selling
    print("Did you put something in the CustomDispatchNotify function!")
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

function RegisterRadialMenu()
    if Config.OxRadialMenu then
        lib.registerRadial({
            id = 'gang_menu',
            items = {
                {
                    label = 'Sell Drugs',
                    icon = 'cannabis',
                    onSelect = function()
                        ExecuteCommand(Config.SellDrugsCommand)
                    end
                },
                {
                    label = 'Add Member',
                    icon = 'user',
                    onSelect = function()
                        local playerPed = PlayerPedId()
                        local playerCoords = GetEntityCoords(playerPed)
                        TriggerServerEvent('cb-gangsystem:server:getNearbyPlayers', playerCoords)
                    end
                },
            }
        })
        lib.addRadialItem({
            {
                id = 'gang',
                label = 'Gang System',
                icon = 'mask',
                menu = 'gang_menu'
            }
        })
    end
end