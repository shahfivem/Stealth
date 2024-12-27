if Config.garage ~= 'qb-garages' then return end
function onGarageEnter(property)
    TriggerEvent('qb-garages:client:setHouseGarage', property.label, true)
end