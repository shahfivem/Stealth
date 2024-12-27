if Config.garage ~= 'qs-advancedgarages' then return end
function onGarageEnter(property)
    TriggerEvent('advancedgarages:SetShellGarageData', property.label, true)
end