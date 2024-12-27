local entityDebugging = false

-- **********************
--    Local Functions
-- **********************
-- WHEN TRIGGERED, DRAW TEXT SPECIFICALLY FOR THE ENTITY DEBUGGER
local function DrawDebugText(text, x, y)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(x, y)
end

-- **********************
--    Global Functions
-- **********************
-- WHEN TRIGGERED, ENABLE ENTITY DEBUGGER TO SHOW ITS DATA
function EntityDebugger()
    entityDebugging = not entityDebugging
    while entityDebugging do
        Wait(0)

        local ent = Raycast(100)["HitEntity"]
        if (GetEntityType(ent) == 0) then
            ent = lastHit
        else
            lastHit = ent
        end

        local pos = GetEntityCoords(ent)
        local found, x, y = GetScreenCoordFromWorldCoord(pos["x"], pos["y"], pos["z"])
        if found then
            DrawDebugText("Model: " .. GetEntityModel(ent), x, y)
            DrawDebugText("Coords: " .. GetEntityCoords(ent), x, y + 0.03)
            DrawDebugText("Yaw: " .. GetEntityRotation(ent), x, y + 0.06)
            DrawDebugText("Relationship Group: " .. GetPedRelationshipGroupHash(ent) or 0, x, y + 0.09)
        end
    end
end
exports("EntityDebugger", EntityDebugger)
