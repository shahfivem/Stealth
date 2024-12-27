local options = {}

RegisterNUICallback("dataPost", function(id, cb)

    cb('ok')

    local option = options[id]

    local data = option.params

    if option.closeMenu ~= false and data.closeMenu ~= false then
        SetNuiFocus(false, false)
        TriggerEvent('erp-context:cancel', false)
    end

    if data.onSelect then
        return data.onSelect()
    end
    
    if data.isServer or data.serverEvent then
        if data.unpackArgs then 
            TriggerServerEvent(data.event or data.serverEvent, table.unpack(data.args))
        else
            TriggerServerEvent(data.event or data.serverEvent, data.args)
        end
    elseif data.event then
        if data.unpackArgs then
            TriggerEvent(data.event, table.unpack(data.args))
        else
            TriggerEvent(data.event, data.args)
        end
    end

end)

RegisterNUICallback("dataHover", function(id, cb)

    cb('ok')

    local option = options[id]
    local data = option.params

    if data.onHover then
        return data.onHover()
    end

    if data.hoverEvent then
        if data.unpackArgs then
            TriggerEvent(data.hoverEvent, table.unpack(data.args))
        else
            TriggerEvent(data.hoverEvent, data.args)
        end
    end
   
end)

RegisterNUICallback("cancel", function(_, cb)

    SetNuiFocus(false, false)
    TriggerEvent('erp-context:cancel', true)

    if not cb then return end
    cb('ok')

end)

RegisterNetEvent('erp-context:forceClose', function()

    SetNuiFocus(false, false)
    TriggerEvent('erp-context:cancel', true)

end)

RegisterNetEvent('erp-context:sendMenu', function(data)

    if not data then return end

    for _, button in pairs(data) do
        options[button.id] = button
    end

    SetNuiFocus(true, true)

    SendNUIMessage({
        action = "OPEN_MENU",
        data = data
    })

end)


RegisterCommand('sendtest', function ()
    local data = {
        
    }
    TriggerEvent('erp-context:sendMenu', data)
end)