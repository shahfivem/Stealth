if Config.garage ~= 'qb-garages' then return end
function loadGarages(source, garages)
    TriggerClientEvent('qb-garages:client:houseGarageConfig', source or -1, garages)
end

function removeGarage(property)
    TriggerClientEvent('qb-garages:client:removeHouseGarage', -1, property)
end
