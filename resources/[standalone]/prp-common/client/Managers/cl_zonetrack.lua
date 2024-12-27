local zones = {}
local insideZone = false

-- **********************
--    Global Functions
-- **********************
function AddCircleZone(name, center, radius, options)
    zones[name] = CircleZone:Create(center, radius, options)
end
exports("AddCircleZone", AddCircleZone)

function AddBoxZone(name, center, length, width, options)
    zones[name] = BoxZone:Create(center, length, width, options)
end
exports("AddBoxZone", AddBoxZone)

function AddPolyzone(name, points, options)
    zones[name] = PolyZone:Create(points, options)
end
exports("AddPolyzone", AddPolyzone)

-- **********************
--        Loops
-- **********************
CreateThread(function()
    Wait(3500)
    while true do
        Wait(500)
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        for zoneID, zoneData in pairs(zones) do
            if zones[zoneID]:isPointInside(pos) then
                insideZone = true

                TriggerEvent("Common:Client:EnteredZone", zoneID, zoneData["data"])
                while insideZone do
                    local inZonePos = GetEntityCoords(ped)
                    if not zones[zoneID]:isPointInside(inZonePos) then 
                        insideZone = false
                    end
                    Wait(250)
                end
                TriggerEvent("Common:Client:ExitedZone", zoneID)
            end
        end
    end
end)
