local isHoldingModifierDown = false

-- KEY MAPPINGS
RegisterKeyMapping("interact", "[General] Interaction Key~", "KEYBOARD", "E")
RegisterKeyMapping("+controlmodifier", "[General] ~b~Key Modifier~", "KEYBOARD", "LSHIFT")
RegisterKeyMapping("clearwaypoint", "[General] Clear Waypoint~", "KEYBOARD", "")

-- **********************
--    Global Functions
-- **********************
-- WHEN TRIGGERED, RETURN IF PLAYER IS HOLDING KEY MODIFIER DOWN
function IsHoldingKeyModifier()
    return isHoldingModifierDown
end
exports("IsHoldingKeyModifier", IsHoldingKeyModifier)

-- WHEN TRIGGERED, DOT
function Dot(a, b)
    return (a["x"] * b["x"]) + (a["y"] * b["y"]) + (a["z"] * b["z"])
end
exports("Dot", Dot)

-- WHEN TRIGGERED, RETURN VERTICAL DISTANCE OF COORDS
function CheckVerticalDistance(v1, v2, d1, d2)
    return math.sqrt((v1.x - v2.x)^2 + (v1.y - v2.y)^2) < d1 and math.abs(v1.z - v2.z) < d2
end
exports("CheckVerticalDistance", CheckVerticalDistance)

-- WHEN TRIGGERED, ASSIST RAYCAST WITH THIS FUNCTION
function CameraForwardVec()
    local rot = (math.pi / 180.0) * GetGameplayCamRot(2)
    return vector3(-math.sin(rot["z"]) * math.abs(math.cos(rot["x"])), math.cos(rot["z"]) * math.abs(math.cos(rot["x"])), math.sin(rot["x"]))
end
exports("CameraForwardVec", CameraForwardVec)

-- WHEN TRIGGERED, ROTATION UTILITY FUNCTION FOR THE COORD GRABBER
function FromRotation(vector)
    local pitch, yaw = (vector.x % 360.0) / 180.0 * math.pi, (vector.z % 360.0) / 180.0 * math.pi
    return vector3(math.cos(yaw) * math.cos(pitch), math.sin(yaw) * math.cos(pitch), math.sin(pitch))
end
exports("FromRotation", FromRotation)

-- WHEN TRIGGERED, ROTATE ANGLES TO VECTOR FORM (USES VECTOR3 NATIVE)
function RotAnglesToVec(rot)
    local x, z = math.rad(rot["x"]), math.rad(rot["z"])
    local num = math.abs(math.cos(x))
    return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
end
exports("RotAnglesToVec", RotAnglesToVec)

-- WHEN TRIGGERED, SHOW FLOATING HELP TEXT AT A POSITION
function FloatingHelpText(message, pos)
    AddTextEntry(message, message)
    SetFloatingHelpTextWorldPosition(1, pos)
    SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)

    BeginTextCommandDisplayHelp(message)
    EndTextCommandDisplayHelp(2 or 0, false, true, -1)
end
exports("FloatingHelpText", FloatingHelpText)

-- WHEN TRIGGERED, RETURN TRUE IF ANY DOOR OF A VEHICLE IS OPEN
function IsAnyDoorOpen(veh)
    for door = 0, GetVehicleNumberOfPassengers(veh) do
        if DoesVehicleHaveDoor(veh, door) then
            local angle = GetVehicleDoorAngleRatio(veh, door)
            if (angle > 0) then
                return true
            end
        end
    end
    return false
end
exports("IsAnyDoorOpen", IsAnyDoorOpen)

-- WHEN TRIGGERED, DRAW 3D TEXT AT SPECIFIC COORDINATES
function DrawText3D(x, y, z, text, drawRect)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    if onScreen then
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)

        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(true)
        SetTextDropShadow()
        AddTextComponentString(text)
        DrawText(_x, _y)

        if drawRect then
            local factor = (string.len(text)) / 370
            DrawRect(_x, (_y + 0.0125), (0.011 + factor), 0.03, 0, 82, 85, 75)
        end
    end
end
exports("DrawText3D", DrawText3D)

-- WHEN TRIGGERED, DO RAYCASTING
function Raycast(dist)
    local camRot, camCoords = GetGameplayCamRot(), GetGameplayCamCoord()
    local forwardVector = {
        x = (-math.sin((math.pi / 180) * camRot["z"]) * math.abs(math.cos((math.pi / 180) * camRot["x"]))),
        y = (math.cos((math.pi / 180) * camRot["z"]) * math.abs(math.cos((math.pi / 180) * camRot["x"]))),
        z = (math.sin((math.pi / 180) * camRot["x"]))
    }
    local cx, cy, cz = table.unpack(camCoords)

    local distance = dist or 2.0
    if GetFollowPedCamViewMode() ~= 4 then
        distance = distance + #(GetPedBoneCoords(PlayerPedId(), 0x796E, 0.0, 0.0, 0.0) - camCoords)
    end
    local dx, dy, dz = cx + forwardVector["x"] * distance, cy + forwardVector["y"] * distance, cz + forwardVector["z"] * distance

    local ray = StartShapeTestRay(cx, cy, cz, dx, dy, dz, -1, PlayerPedId(), 1)
    local a, b, c, d, ent = GetShapeTestResult(ray)
    return {a = a, b = b, HitPosition = c, HitCoords = d, HitEntity = ent}
end
exports("Raycast", Raycast)

-- WHEN TRIGGERED, RETURN ENTITY PLAYER IS LOOKING AT
function GetEntityPlayerIsLookingAt(dist, radius, flag, ignore)
    local distance = dist or 3.0
    local pos = GetPedBoneCoords(PlayerPedId(), 31086)
    local forwardVectors = CameraForwardVec()

    local forwardCoords = pos + (forwardVectors * (IsPedSittingInAnyVehicle(PlayerPedId()) and distance + 1.5 or distance))
    if not forwardVectors then return end

    local handle = StartShapeTestSweptSphere(pos["x"], pos["y"], pos["z"], forwardCoords["x"], forwardCoords["y"], forwardCoords["z"], radius or 0.2, flag or 286, ignore, 0)
    local _, hit, targetCoords, _, targetEntity = GetShapeTestResult(handle)
    if not hit and targetEntity == 0 then return end

    local entityType = GetEntityType(targetEntity)
    return targetEntity, entityType, targetCoords
end
exports("GetEntityPlayerIsLookingAt", GetEntityPlayerIsLookingAt)

-- WHEN TRIGGERED, RETURN STREET NAME WITH CROSS (IF ABLE) AND AREA NAME
function GetStreetLocation(pos)
    if not pos then -- SANITY CHECK
        return "Unknown Location"
    end

    local street, cross = GetStreetNameAtCoord(pos["x"], pos["y"], pos["z"])
    local zone = areaNames[GetNameOfZone(pos["x"], pos["y"], pos["z"])]
    local primaryStreetName, crossStreetname = GetStreetNameFromHashKey(street), GetStreetNameFromHashKey(cross)

    -- PREVENTS AN ERROR WHEN CONCATENATING A NIL VALUE. HAPPENS IN AREAS SUCH AS TUNNELS
    if (zone == nil or zone == "") then
        zone = "Unincorporated Zone"
    end

    -- PREVENTS AN ERROR WHEN CONCATENATING A NIL VALUE
    local currentStreetName = primaryStreetName
    if (currentStreetName == nil or currentStreetName == "") then
        currentStreetName = " "
    end

    -- FINALLY RETURN THE STREET NAME AND CROSS
    if (crossStreetname ~= nil and crossStreetname ~= "") then
        currentStreetName = currentStreetName .. " / " .. crossStreetname .. " in " .. zone
    else
        currentStreetName = currentStreetName .. " in " .. zone
    end
    return currentStreetName
end
exports("GetStreetLocation", GetStreetLocation)

-- WHEN TRIGGERED, GETS CLOSEST PLAYER BASED OFF RADIUS
function GetClosestPlayer(radius)
    local closestPlayer, closestDist = -1, 99999999
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)

    for _, player in pairs(GetActivePlayers()) do -- ITERATE THROUGH ACTIVE PLAYERS TO FIND CLOSEST ONE
        local target = GetPlayerPed(player)
        if (target ~= ped) then
            local targetPos = GetEntityCoords(target)
            local dist = #(targetPos - pos)
            if (dist < closestDist and dist <= radius) then
                closestPlayer, closestDist = player, dist
                break
            end
        end
    end

    -- RETURN OUR CLOSEST PLAYER
    if (closestDist ~= 99999999) then
        return closestPlayer
    end
    return nil
end
exports("GetClosestPlayer", GetClosestPlayer)

-- WHEN TRIGGERED, RETURN PED/PLAYER IN FRONT OF PLAYER
function GetPedInFrontOfPlayer(distance, isAlive)
    local flag -- CHANGES FLAG IF WANTED ALIVE OR DEAD
    if isAlive then
        flag = 4
    else
        flag = 8
    end

    -- START LOOKING FOR OUR PED
    local target
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    for i = -2.0, 1.0, 0.1 do
        -- USE RAYCAST TO FIND THE PED IN FRONT OF THE PLAYER
        local offset = GetOffsetFromEntityInWorldCoords(ped, 0.0, distance, 0.0)
        local result = StartShapeTestCapsule(pos["x"], pos["y"], pos["z"] + i, offset["x"], offset["y"], offset["z"], 1.0, flag, ped, 0)

        -- IF WE FOUND OUR TARGET, RETURN IT
        local _, _, _, _, target = GetShapeTestResult(result)
        if (target ~= nil and target ~= 0) then
            return target
        end
    end
    return target -- IF WE FAILED, RETURN NIL
end
exports("GetPedInFrontOfPlayer", GetPedInFrontOfPlayer)

-- WHEN TRIGGERED, BEGIN A FAILSAFE FOR LOADING INTO SOMETHING TO PREVENT SCUFF/DEATH
function FloatUntilSafe(obj)
    FreezeEntityPosition(PlayerPedId(), true)

    local count = 200
    while count > 0 do
        Wait(150)
        if HasCollisionLoadedAroundEntity(PlayerPedId()) == 1 and HasCollisionForModelLoaded(GetEntityModel(obj)) == 1 and HasModelLoaded(GetEntityModel(obj)) == 1 then
            count = -9
            break
        end
        count = count - 1
        print("[FloatUntilSafe]: Making sure you do not get scuffed or killed... our count is:", count)
    end

    FreezeEntityPosition(PlayerPedId(), false)
    return count <= -9 and true or false
end
exports("FloatUntilSafe", FloatUntilSafe)

-- WHEN TRIGGERED, CHECK IF PLAYER IS BEHIND AN ENTITY
function IsBehindEntity(ped, target)
    -- COORDINATES AND DIMENSIONS GRABBING
    local myPos = GetEntityCoords(ped)
    local closestDims = GetModelDimensions(GetEntityModel(target))

    local rearOfEnt = GetOffsetFromEntityInWorldCoords(target, 0.0, closestDims["y"], 0.0)
    local frontOfEnt = GetOffsetFromEntityInWorldCoords(target, 0.0, closestDims["y"] + 0.01, 0.0)

    -- RETURN IF PLAYER IS BEHIND ENTITY
    return #(myPos - rearOfEnt) < #(myPos - frontOfEnt) and true or false 
end
exports("IsBehindEntity", IsBehindEntity)

-- WHEN TRIGGERED, SPAWNS OBJECT AT A SPECIFIC POSITION
function SpawnObject(objHash, objPos, noOffset, freezeObj)
    if type(objHash) == "string" then -- NORMALIZE IF STRING
        objHash = GetHashKey(objHash)
    end

    LoadModel(objHash, 15)
    local obj = exports["prp-nexus"]:ExecuteServerCallback("Common:Server:CreateNewObject", objHash, objPos, noOffset, freezeObj)
    if not obj or not obj["succeeded"] then
        exports["prp-ui"]:SendAlert("error", "Something went wrong spawning the object!", 5000)
        return 0
    end

    while not NetworkDoesNetworkIdExist(obj["netID"]) do
        Wait(100)
    end
    obj["ent"] = NetworkGetEntityFromNetworkId(obj["netID"])
    exports["prp-sync"]:GetEntityControl(obj["ent"])

    -- NETWORKING
    SetNetworkIdExistsOnAllMachines(obj["netID"], true)
    SetNetworkIdCanMigrate(obj["netID"], true)

    -- PERSIST AND FREE FROM MEMORY
    SetEntityAsMissionEntity(obj["ent"], true)
    SetModelAsNoLongerNeeded(objHash)
    return obj["ent"]
end
exports("SpawnObject", SpawnObject)

-- WHEN TRIGGERED, WAIT FOR GROUND TO PROPERLY SHOW UP
function WaitForGround(coords, timeout)
    if not coords then
        coords = GetEntityCoords(PlayerPedId())
    end

    local startTime = GetGameTimer()
    local hasGround, groundZ

    while GetGameTimer() - startTime < (timeout or 6000) do
        hasGround, groundZ = GetGroundZFor_3dCoord(coords.x, coords.y, coords.z)

        if hasGround then
            break
        else
            Wait(0)
        end
    end

    return hasGround, groundZ
end
exports("WaitForGround", WaitForGround)

-- WHEN TRIGGERED, SPAWNS PED AT A SPECIFIC POSITION
function SpawnPed(pedType, pedModelHash, pedCoords)
    if type(pedModelHash) == "string" then -- TURN STRING HASH TO NUMBER
        pedModelHash = GetHashKey(pedModelHash)
    end

    -- LOAD MODEL
    LoadModel(pedModelHash, 15)

    -- RELAY TO SERVER FOR CREATIONS
    local ped = exports["prp-nexus"]:ExecuteServerCallback("Common:Server:CreateNewPed", pedType, pedModelHash, pedCoords)
    if not ped or not ped["succeeded"] then
        exports["prp-ui"]:SendAlert("error", "Something went wrong spawning the ped!", 5000)
        return 0
    end

    -- MAKE SURE CLIENT IS AWARE OF NET ID
    local pedNetID = ped["netID"]
    while not NetworkDoesNetworkIdExist(pedNetID) do
        Wait(100)
    end

    -- GET ENTITY FROM NETWORK ID
    local pedHandle = NetToPed(pedNetID)
    exports["prp-sync"]:GetEntityControl(pedHandle)

    -- PERSIST AND FREE FROM MEMORY
    SetEntityAsMissionEntity(pedHandle, true, true)
    SetModelAsNoLongerNeeded(pedModelHash)
    return pedHandle
end
exports("SpawnPed", SpawnPed)

-- ***********************
--        Commands
-- ***********************
-- WHEN TRIGGERED, CALL INTERACTION KEY EVENTS
RegisterCommand("interact", function()
    TriggerEvent("Common:Client:DoInteraction")
end)

-- WHEN TRIGGERED, ACTIVATE CONTROL MODIFIER
RegisterCommand("+controlmodifier", function()
    isHoldingModifierDown = true
end)

-- WHEN TRIGGERED, DEACTIVATE CONTROL MODIFIER
RegisterCommand("-controlmodifier", function()
    isHoldingModifierDown = false
end)

-- WHEN TRIGGERED, CLEAR ACTIVE WAYPOINT
RegisterCommand("clearwaypoint", function()
    SetWaypointOff()
end)

-- ***********************
--         Events
-- ***********************
-- WHEN TRIGGERED, SET WAYPOINT
RegisterNetEvent("Common:Client:ManageWaypoint", function(manageType, pos)
    if not manageType or not pos then -- SANITY CHECKS
        return
    end

    if manageType == "Set" then
        SetNewWaypoint(pos["x"], pos["y"])
    elseif manageType == "Clear" then
        SetWaypointOff()
    end
end)