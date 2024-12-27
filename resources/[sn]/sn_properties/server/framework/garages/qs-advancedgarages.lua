if Config.garage ~= 'qs-advancedgarages' then return end
function loadGarages(source, garages)
    TriggerClientEvent('advancedgarages:GetShellGarageData', source or -1, garages)
end

function removeGarage(property)
    TriggerClientEvent('advancedgarages:AddShellGarage', -1, property, nil)
end