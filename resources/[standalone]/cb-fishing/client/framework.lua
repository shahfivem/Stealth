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

function GetFishingRep(source)
    local PlayerData = GetPlayerData()
    local fishingrep = 0
    if Framework == "qb-core" then
        fishingrep = PlayerData.metadata["fishing"]
        if fishingrep == nil then
            fishingrep = 0
        end
        return fishingrep
    else
        fishingrep = PlayerData.metadata["fishing"]
        if fishingrep == nil then
            fishingrep = 0
        end
        return fishingrep
    end
end

RegisterNetEvent('cb-fishing:client:Notify', function(label, message, notifyType, time)
    if not time then time = 7500 end
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
end)

function CheckItem(item, amount)
    if amount == nil or amount == 0 then amount = 1 end
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

function GetItemImage(item)
    if UsingOxInventory then
        return exports.ox_inventory:Items(item).client.image
    else
        return QBCore.Shared.Items[item].image
    end
end

function Progressbar(text, language, duration)
	local success = exports.erp_progressbar:taskBar({
        text = text,
        length = duration,
        animation = {}
    })
    
    if success == 100 then
        return true
    else
        return false
    end
end

function FishingMinigame()
    local success = lib.skillCheck(
        {
            {
                areaSize = 50,
                speedMultiplier = 0.5
            }, {
                areaSize = 50,
                speedMultiplier = 0.5
            }, {
                areaSize = 50,
                speedMultiplier = 0.5
            }
        },
        {'w', 'a', 's', 'd'}
    )
    return success
end

function DeepSeaFishingMinigame()
    local success = lib.skillCheck(
        {
            {
                areaSize = 50,
                speedMultiplier = 0.5
            }, {
                areaSize = 50,
                speedMultiplier = 0.5
            }, {
                areaSize = 50,
                speedMultiplier = 0.5
            }
        },
        {'w', 'a', 's', 'd'}
    )
    return success
end