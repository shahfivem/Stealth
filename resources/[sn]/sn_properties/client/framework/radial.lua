function addRadialItem(id, data)
    if Config.radial == 'ox_lib' then
        data.onSelect = function()
            TriggerEvent(data.event, data)
        end
        lib.addRadialItem(data)
    elseif Config.radial == 'qb-radialmenu' then
        data.title = data.label
        exports['qb-radialmenu']:AddOption(id, data)
    end
end

function removeRadialItem(id)
    if Config.radial == 'ox_lib' then
        lib.removeRadialItem(id)
    elseif Config.radial == 'qb-radialmenu' then
        RemoveOption(id)
    end
end