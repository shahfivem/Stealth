--------------- [[ qb-houses ]] ---------------

local function exportHandlerQB(exportName, func)
    AddEventHandler(('__cfx_export_qb-houses_%s'):format(exportName), function(setCB)
        setCB(func)
    end)
end

exportHandlerQB('hasKey', function(_, identifier, property_id)
    return true
end)