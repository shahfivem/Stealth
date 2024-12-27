if Config.garage ~= 'qbx_garages' then return end
function loadGarages(source, garages)
    for _, garage in pairs(garages) do
        local property = properties[garage.propertyId]
        exports.qbx_garages:RegisterGarage('propertyGarage_'..property.id, {
            label = garage.label,
            vehicleType = 'car',
            groups = property.owner,
            accessPoints = {
                {
                    coords = garage.takeVehicle,
                    spawn = garage.takeVehicle,
                }
            },
        })
    end
end

function removeGarage(property)
    TriggerClientEvent('qb-garages:client:removeHouseGarage', -1, property)
end
