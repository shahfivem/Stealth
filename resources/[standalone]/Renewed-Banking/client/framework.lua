local Framework = GetResourceState('es_extended') == 'started' and 'esx' or GetResourceState('qbx_core') == 'started' and 'qbx' or GetResourceState('qb-core') == 'started' and 'qb' or 'Unknown'
FullyLoaded = false
if Framework == 'qb' or Framework == 'qbx' then
    FullyLoaded = LocalPlayer.state.isLoggedIn
elseif Framework == 'esx' then
    ESX = exports['es_extended']:getSharedObject()
    FullyLoaded = Framework == 'esx' and ESX.PlayerLoaded or false
else
	print('^6[^3Renewed-Banking^6]^0 Unsupported Framework detected!')
end

AddStateBagChangeHandler('isLoggedIn', nil, function(_, _, value)
    FullyLoaded = value
end)

local function initalizeBanking()
    CreatePeds()
    local locales = lib.getLocales()
    SendNUIMessage({
        action = 'updateLocale',
        translations = locales,
        currency = Config.currency
    })
end
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    Wait(100)
    initalizeBanking()
end)

RegisterNetEvent('esx:playerLoaded', function(xPlayer)
    Wait(100)
    FullyLoaded = true
    initalizeBanking()
end)

AddEventHandler('onResourceStart', function(resourceName)
    Wait(100)
    if resourceName ~= GetCurrentResourceName() then return end
    if not FullyLoaded then return end
    initalizeBanking()
end)


RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    DeletePeds()
end)

AddEventHandler('esx:onPlayerLogout', function()
    DeletePeds()
end)

RegisterCommand('cash', function(source)
	local cash = exports.ox_inventory:GetItemCount('cash')
	lib.notify({
		text = 'Cash Balance: $' .. cash,
		type = 'inform',
	})
end, false)

-- Handle the bank amount sent from the server
RegisterNetEvent('sendbankammount', function(amount)
    lib.notify({
        text = 'Bank Balance: $' .. amount,
        type = 'inform',
    })
end)

-- Command to fetch and display bank balance
RegisterCommand('bank', function()
    TriggerServerEvent('getbankamount') -- Trigger the server event to fetch the bank balance
end, false)


TriggerEvent('chat:addSuggestion', '/bank', 'View your main account\'s bank balance.')

TriggerEvent('chat:addSuggestion', '/cash', 'View how much cash you have.')