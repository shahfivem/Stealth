if not um.property.apartments then return end

if GetResourceState('sn_properties') ~= 'started' then return end

Debug('sn_properties for apartments', 'debug')

lib.callback.register('getApartments', function(source)
    local citizenid = GetCitizenID(GetPlayer(source))
    local apartments = MySQL.query.await('SELECT * FROM properties WHERE owner = ?', { citizenid })
    local found = apartments[1] ~= nil
    Debug(found and 'Houses: Found Houses' or 'Houses: Not Found')
    return found and apartments or false
end)