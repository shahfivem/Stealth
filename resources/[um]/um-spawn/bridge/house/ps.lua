if not um.property.apartments then return end

if GetResourceState('sn_properties') ~= 'started' then return end

Debug('sn_properties for apartments', 'debug')

lib.callback.register('getHouses', function(source)
    local citizenid = GetCitizenID(GetPlayer(source))
    local houses = MySQL.query.await('SELECT * FROM properties WHERE owner = ?', { citizenid })
    local found = houses[1] ~= nil
    Debug(found and 'Houses: Found Houses' or 'Houses: Not Found')
    return found and houses or false
end)
