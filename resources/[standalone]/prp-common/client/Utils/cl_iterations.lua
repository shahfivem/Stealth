local entityEnumerator = {
    __gc = function(enum)
        if enum.destructor and enum.handle then
            enum.destructor(enum.handle)
        end
        enum.destructor = nil
        enum.handle = nil
    end
}

-- **********************
--    Local Functions
-- **********************
-- WHEN TRIGGERED, ENUMERATE ENTITIES
local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(function()
        local iter, id = initFunc()
        if not id or (id == 0) then
            disposeFunc(iter)
            return
        end

        local enum = {handle = iter, destructor = disposeFunc}
        setmetatable(enum, entityEnumerator)

        local next = true
        repeat
            coroutine.yield(id)
            next, id = moveFunc(iter)
        until not next

        enum.destructor, enum.handle = nil, nil
        disposeFunc(iter)
    end)
end

-- **********************
--    Global Functions
-- **********************
-- WHEN TRIGGERED, ENUMERATE OBJECTS
function EnumerateObjects()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end
exports("EnumerateObjects", EnumerateObjects)

-- WHEN TRIGGERED, ENUMERATEPEDS
function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end
exports("EnumeratePeds", EnumeratePeds)

-- WHEN TRIGGERED, ENUMERATE VEHICLES
function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end
exports("EnumerateVehicles", EnumerateVehicles)

-- WHEN TRIGGERED, ENUMERATE PICKUPS
function EnumeratePickups()
    return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end
exports("EnumeratePickups", EnumeratePickups)

-- WHEN TRIGGERED, GET CLOSEST OBJECT TO PLAYER
function GetClosestObject(coords)
    local nearestDist, nearestObj = 0.0
    local myPed = PlayerPedId()

    local objects = GetGamePool("CObject")
    for object = 1, #objects do
        local obj = objects[object]
        local dist = #(coords - GetEntityCoords(obj))

        if not nearestObj or dist < nearestDist then
            nearestDist, nearestObj = dist, obj
        end
    end

    return nearestDist, nearestObj
end
exports("GetClosestObject", GetClosestObject)

-- WHEN TRIGGERED, GET NEAREST PED OF COORDINATES
function GetNearestPed(coords)
    local nearestDist, nearestPed = 0.0
    local myPed = PlayerPedId()

    for ped in EnumeratePeds() do
        if ped ~= myPed and not NetworkIsEntityConcealed(ped) then
            local dist = #(coords - GetEntityCoords(ped))

            if not nearestPed or dist < nearestDist then
                nearestDist, nearestPed = dist, ped
            end

            if GetEntityMaxHealth(ped) < 200 then
                SetEntityMaxHealth(ped, 200)
                SetEntityHealth(ped, 200)
            end
        end
    end

    return nearestDist, nearestPed
end
exports("GetNearestPed", GetNearestPed)
