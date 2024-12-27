
function getSellItemsSettings()
    local result = MySQL.query.await('SELECT settings FROM pug_sellitems WHERE id = 1 LIMIT 1')
    if result and result[1] then
        return result[1].settings
    else
        return '[]' 
    end
end


RegisterNetEvent('Pug:saveSellItemsData', function(NewSellItemsData)
    local src = source

    MySQL.query('SELECT settings FROM pug_sellitems WHERE id = 1', {}, function(results)
        local currentData = {}

        if results and #results > 0 then
            currentData = json.decode(results[1].settings) or {}
        end

        for key, value in pairs(NewSellItemsData) do
            currentData[key] = value
        end

        local updatedData = json.encode(currentData)

        MySQL.query('INSERT INTO pug_sellitems (id, settings) VALUES (1, @settings) ON DUPLICATE KEY UPDATE settings = @settings', {
            ['@settings'] = updatedData,
        }, function(result)
            if result then
                TriggerClientEvent("Pug:client:UpdateSellItemsData", -1, updatedData)
                TriggerClientEvent('Pug:client:ShowHeistNotify', src, Config.LangT["SellItemsDataSaved"])
            else
                TriggerClientEvent('Pug:client:ShowHeistNotify', src, Config.LangT["ErrorSavingSellItemsData"])
            end
        end)
    end)
end)
