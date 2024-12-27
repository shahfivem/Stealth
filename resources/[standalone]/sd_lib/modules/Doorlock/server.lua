--- @class SD.Doorlock
SD.Doorlock = {}

-- Table of resources for toggling doors.
local resources = { {name = "ox_doorlock"}, {name = "qb-doorlock"}, {name = "nui-doorlock"}, {name = "cd_doorlock"}, {name = "doors_creator"} }

-- Function to get door ID from label for jaksam's doors_creator
local GetDoorIdFromLabel = function(label, callback)
    local query = 'SELECT id FROM doorscreator_doors WHERE label = ?'
    exports.oxmysql:execute(query, { label }, function(result)
        if result and #result > 0 then
            callback(result[1].id)
        else
            callback(nil)  -- No door found with the given label
        end
    end)
end

-- Function to automatically detect the running door lock resource and return the appropriate update function.
local SelectDoorLock = function()
    for _, resource in ipairs(resources) do
        if GetResourceState(resource.name) == 'started' then
            if resource.name == "ox_doorlock" then
                return function(data)
                    local DoorIds = {}
                    for i, name in ipairs(data.doorNames or {}) do
                        DoorIds[i] = exports.ox_doorlock:getDoorFromName(name).id
                    end
                    local index = SD.Table.IndexOf(data.doorNames, data.id)
                    if index and DoorIds[index] then
                        TriggerEvent('ox_doorlock:setState', DoorIds[index], data.locked and 1 or 0)
                    end
                end
            elseif resource.name == "qb-doorlock" then
                return function(data)
                    TriggerEvent('qb-doorlock:server:updateState', data.id, data.locked, false, false, data.enablesounds, false, false)
                end
            elseif resource.name == "nui-doorlock" then
                return function(data)
                    TriggerEvent('nui_doorlock:server:updateState', data.id, data.locked, false, false, data.enablesounds)
                end
            elseif resource.name == "cd_doorlock" then
                return function(data)
                    TriggerClientEvent('cd_doorlock:SetDoorState_name', source, data.locked, data.id, data.location)
                end
            elseif resource.name == "doors_creator" then
                return function(data)
                    GetDoorIdFromLabel(data.id, function(doorId)
                        exports["doors_creator"]:setDoorState(doorId, data.locked and 1 or 0)
                    end)
                end
            end
        end
    end

    return function(data)  -- Fallback if none of the resources are started
        error("No supported door lock resource is currently running.")
    end
end

-- Utilize the dynamically selected function for door state updates.
local UpdateDoorState = SelectDoorLock()

-- Public function to update door state
SD.Doorlock.UpdateState = function(data)
    UpdateDoorState(data)
end

return SD.Doorlock