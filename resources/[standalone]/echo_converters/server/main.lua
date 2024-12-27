RegisterNetEvent("echo_converters:server:cutConverter")
AddEventHandler("echo_converters:server:cutConverter", function(entityId)
    local entity = NetworkGetEntityFromNetworkId(entityId)
    if entity then
        -- Set the state to mark the converter as lost
        Entity(entity).state.alreadyCut = true
        Entity(entity).state:set('converterLost', true, true) -- Set the converterLost state to true
        if exports.ox_inventory:CanCarryItem(source, "catalytic_converter", 1) then
            exports.ox_inventory:AddItem(source, "catalytic_converter", 1)
        else
            TriggerClientEvent("ox_lib:notify", source, {
                text = "You don't have enough space in your inventory to carry the catalytic converter.",
                type = "error",
                duration = 5000
            })
        end
    end
end)
