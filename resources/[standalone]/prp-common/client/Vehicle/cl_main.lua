local tireBones = {"wheel_lf", "wheel_rf", "wheel_lm1", "wheel_rm1", "wheel_lm2", "wheel_rm2", "wheel_lm3", "wheel_rm3", "wheel_lr", "wheel_rr"}
local letters = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"}

local frunks = {
    [`penetrator`] = true,
    [`reaper`] = true,
    [`ninef2`] = true
}

local doors = {
    ["bonnet"] = 4,
    ["boot"] = 5,
    ["door_dside_f"] = 0,
    ["door_dside_r"] = 2,
    ["door_hatch_l"] = 0,
    ["door_hatch_r"] = 1,
    ["door_pside_f"] = 1,
    ["door_pside_r"] = 3
}

local tireIndex = {
    ["wheel_lf"] = 0,
    ["wheel_rf"] = 1,
    ["wheel_lm1"] = 2,
    ["wheel_rm1"] = 3,
    ["wheel_lm2"] = 45,
    ["wheel_rm2"] = 47,
    ["wheel_lm3"] = 46,
    ["wheel_rm3"] = 48,
    ["wheel_lr"] = 4,
    ["wheel_rr"] = 5
}

-- **********************
--    Local Functions
-- **********************
-- WHEN TRIGGERED, CHECK IF A PLATE IS ALREADY IN USE
local function IsPlateUsed(plate)
    local result = exports["prp-nexus"]:ExecuteServerCallback("Common:Server:IsPlateUsed", plate)
    return result
end

-- **********************
--    Global Functions
-- **********************
-- RETURNS VEHICLE IN FRONT OR BEHIND PLAYER
function GetVehInFrontOfPlayer(distance, rear)
    if rear then -- FLIPS DISTANCE IF REAR BOOL IS TRUE
        distance = -distance
    end

    local veh
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)

    for i = -2.0, 2.0, 0.1 do -- START LOOKING FOR OUR VEHICLE
        -- USE RAYCAST TO FIND THE VEHICLE IN FRONT OF THE PLAYER
        local offset = GetOffsetFromEntityInWorldCoords(ped, 0.0, distance, 0.0)
        local result = StartShapeTestCapsule(pos["x"], pos["y"], pos["z"] + i, offset["x"], offset["y"], offset["z"], 1.0, 10, ped, 0)

        -- IF WE FOUND OUR VEHICLE, RETURN IT
        local _, _, _, _, veh = GetShapeTestResult(result)
        if (veh ~= nil and veh ~= 0) and IsEntityAVehicle(veh) then
            return veh
        end
    end
    return veh -- IF WE FAILED, RETURN NIL
end
exports("GetVehInFrontOfPlayer", GetVehInFrontOfPlayer)

-- WHEN TRIGGERED, GET CLOSEST VEHICLE TIRE
function GetClosestVehicleTire(veh)
    local minDistance = 1.0
    local closestTire

    local pos = GetEntityCoords(PlayerPedId())
    for i = 1, #tireBones do
        local bonePos = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh, tireBones[i]))
        local distance = #(pos - vector3(bonePos["x"], bonePos["y"], bonePos["z"]))

        if (closestTire == nil) then
            if (distance <= minDistance) then
                closestTire = {["bone"] = tireBones[i], ["boneDist"] = distance, ["bonePos"] = bonePos, ["tireIndex"] = tireIndex[tireBones[i]]}
            end
        else
            if (distance < closestTire["boneDist"]) then
                closestTire = {["bone"] = tireBones[i], ["boneDist"] = distance, ["bonePos"] = bonePos, ["tireIndex"] = tireIndex[tireBones[i]]}
            end
        end
    end
    return closestTire
end
exports("GetClosestVehicleTire", GetClosestVehicleTire)

-- WHEN TRIGGERED, GET CLOSEST VEHICLE DOOR
function GetClosestVehicleDoor(coords, vehicle, enterable, handles)
    local nearestDist, nearestDoor, nearestCoords = 0.0

    for boneName, doorIndex in pairs(doors) do
        local handleName = handles and boneName:gsub("door", "handle")
        local handleIndex = handles and GetEntityBoneIndexByName(vehicle, handleName) or -1
        local boneIndex = handleIndex == -1 and GetEntityBoneIndexByName(vehicle, boneName) or handleIndex

        if boneIndex ~= -1 and not enterable or doorIndex < 4 then
            local boneCoords = GetEntityBonePosition_2(vehicle, boneIndex)
            local dist = boneCoords and #boneCoords > 0.001 and #(boneCoords - coords)
            
            if dist and (not nearestDoor or dist < nearestDist) then
                nearestDist, nearestDoor, nearestCoords = dist, doorIndex, boneCoords
            end
        end
    end

    return {["id"] = nearestDoor, ["dist"] = nearestDist, ["pos"] = nearestCoords}
end
exports("GetClosestVehicleDoor", GetClosestVehicleDoor)

-- WHEN TRIGGERED, GET CLOSEST VEHICLE DOOR (SECOND VERSION)
function GetClosestVehicleDoor_2(veh)
    local returnDoors = {}
    local vehBack, vehFront = GetModelDimensions(GetEntityModel(veh))

    for door = 0, 5 do
        if DoesVehicleHaveDoor(veh, door) then
            if door == 4 then
                returnDoors[door] = GetOffsetFromEntityInWorldCoords(veh, 0.0, vehFront["y"], 0.0)
            elseif door == door then
                returnDoors[door] = GetOffsetFromEntityInWorldCoords(veh, 0.0, vehBack["y"], 0.0)
            else
                returnDoors[door] = GetEntryPositionOfDoor(veh, door)
            end
        end
    end

    local closestDoor = {["dist"] = 99, ["id"] = 99}
    local pos = GetEntityCoords(PlayerPedId())
    for doorID, door in pairs(returnDoors) do
        local doorDist = #(pos - door)
        if doorDist <= closestDoor["dist"] and not IsVehicleDoorDamaged(veh, doorID) then
            closestDoor = {["dist"] = doorDist, ["id"] = doorID, ["pos"] = door}
        end
    end
    return closestDoor
end
exports("GetClosestVehicleDoor_2", GetClosestVehicleDoor_2)

-- WHEN TRIGGERED, GENERATE A UN-USED RANDOM LICENSE PLATE
function GenerateRandomPlate()
    local licensePlate = ""
    local licensePlateDigits = {}

    while IsPlateUsed(licensePlate) do
        licensePlate = ""
        local rng = mwc(GetGameTimer() * GetInstanceId())
        licensePlateDigits[1] = rng:random(0, 9)
        licensePlateDigits[2] = rng:random(0, 9)
        licensePlateDigits[3] = letters[rng:random(1, 26)]
        licensePlateDigits[4] = letters[rng:random(1, 26)]
        licensePlateDigits[5] = letters[rng:random(1, 26)]
        licensePlateDigits[6] = rng:random(0, 9)
        licensePlateDigits[7] = rng:random(0, 9)
        licensePlateDigits[8] = rng:random(0, 9)

        for i = 1, #licensePlateDigits do
            licensePlate = licensePlate .. licensePlateDigits[i]
        end
    end

    exports["prp-nexus"]:ExecuteServerCallback("Common:Server:ReservePlate", licensePlate)
    return licensePlate
end
exports("GenerateRandomPlate", GenerateRandomPlate)

-- WHEN TRIGGERED, SPAWNS VEHICLE AT A SPECIFIC POSITION
function SpawnVehicle(model, pos, randomizeFuel, isBoosting)
    if type(model) == "string" then
        model = GetHashKey(model)
    end
    local modelName = GetLabelText(GetDisplayNameFromVehicleModel(model))

    -- ENSURE MODEL IS LOADED BEFORE TRYING TO CREATE VEHICLE
    while not HasModelLoaded(model) do
        Wait(10)
        LoadModel(model, 15)
    end

    local veh = exports["prp-nexus"]:ExecuteServerCallback("Common:Server:CreateNewVehicle", model, pos, modelName)
    if not veh or not veh["succeeded"] then
        exports["prp-ui"]:SendAlert("error", "Something went wrong spawning the vehicle!", 5000)
        return 0
    end

    while not NetworkDoesNetworkIdExist(veh["netID"]) do
        Wait(100)
    end
    veh["ent"] = NetworkGetEntityFromNetworkId(veh["netID"])
    exports["prp-sync"]:GetEntityControl(veh["ent"])

    -- NETWORKING
    --NetworkUseHighPrecisionBlending(veh["netID"], false)
    SetNetworkIdExistsOnAllMachines(veh["netID"], true)
    SetNetworkIdCanMigrate(veh["netID"], true)

    -- BASIC PROPERTIES
    SetVehicleOnGroundProperly(veh["ent"])
    SetVehicleHasBeenOwnedByPlayer(veh["ent"], true)
    SetVehRadioStation(veh["ent"], "OFF")
    if not randomizeFuel then
        exports["prp-vehicles"]:SetFuel(veh["ent"], 100)
    end

    if isBoosting then
        --print("Boosting vehicle")
        local entityModel = GetEntityModel(veh["ent"])
        TriggerServerEvent("ES:Server:FlagVehicle", {
            ["status"] = true,
            ["flag"] = "Boosted High Value Vehicle",
            ["veh"] = VehToNet(veh["ent"]),
            ["model"] = GetLabelText(GetDisplayNameFromVehicleModel(entityModel))
        })
        exports["prp-sync"]:SetEntityFlag(veh["ent"], "installedGPSTracker", true)
        exports["prp-sync"]:SetEntityFlag(veh["ent"], "highValueVehicle", true)
        exports["prp-vehicles"]:SetFuel(veh["ent"], 100)
        exports["prp-sync"]:SetEntityFlag(veh["ent"], "noVehicleLoot", true)
        SetEntityVisible(veh["ent"], false)
    end
    -- PERSIST AND FREE FROM MEMORY
    SetEntityAsMissionEntity(veh["ent"], true)
    SetModelAsNoLongerNeeded(model)
    return veh["ent"]
end
exports("SpawnVehicle", SpawnVehicle)

-- WHEN TRIGGERED, GET SEAT PLAYER IS IN INSIDE VEHICLE
function FindSeatPedIsIn(ped, veh)
    if not veh or not DoesEntityExist(veh) then -- CHECK IF VEHICLE EXISTS
        return
    end

    -- FIND SEAT PLAYER IS IN AND RETURN INDEX
    for seatIndex = -1, GetVehicleMaxNumberOfPassengers(veh) do
        if GetPedInVehicleSeat(veh, seatIndex) == ped then
            return seatIndex
        end
    end
end
exports("FindSeatPedIsIn", FindSeatPedIsIn)

-- WHEN TRIGGERED, FIND FIRST SEAT AVAILABLE INSIDE VEHICLE
function FindFirstFreeVehicleSeat(veh)
    if not veh or not DoesEntityExist(veh) then -- CHECK IF VEHICLE EXISTS
        return
    end

    -- FIND SEAT PLAYER IS IN AND RETURN INDEX
    for seatIndex = -1, GetVehicleMaxNumberOfPassengers(veh) do
        if IsVehicleSeatFree(veh, seatIndex) then
            return seatIndex
        end
    end
end
exports("FindFirstFreeVehicleSeat", FindFirstFreeVehicleSeat)

-- WHEN TRIGGERED, GET NEAREST TRUNK OF VEHICLE
function GetTrunkInfo(veh, offset)
    if not veh or not DoesEntityExist(veh) then -- SANITY CHECKS
        return { false }
    end

    local coords
    local trunkBone = GetEntityBoneIndexByName(veh, "boot")

    local doorL = GetEntityBoneIndexByName(veh, "door_dside_r")
    local doorR = GetEntityBoneIndexByName(veh, "door_pside_r")
    local doorIndexes = {}

    if frunks[GetEntityModel(veh)] then
        trunkBone = GetEntityBoneIndexByName(veh, "bonnet")
        coords = GetWorldPositionOfEntityBone(veh, trunkBone)

        doorIndexes[4] = true
    end

    if trunkBone ~= -1 then
        coords = GetWorldPositionOfEntityBone(veh, trunkBone)
        doorIndexes[5] = true
    else
        if doorL ~= -1 and doorR ~= -1 then
            coords = (GetWorldPositionOfEntityBone(veh, doorL) + GetWorldPositionOfEntityBone(veh, doorR)) * 0.5

            doorIndexes[2] = true
            doorIndexes[3] = true
        elseif doorL ~= -1 then
            coords = GetWorldPositionOfEntityBone(veh, doorL)
            doorIndexes[2] = true
        elseif doorR ~= -1 then
            coords = GetWorldPositionOfEntityBone(veh, doorR)
            doorIndexes[3] = true
        end
    end

    if coords == nil then
        return { false }
    end

    local offsetCoords
    local canReach = true

    if offset then
        local forward = GetEntityForwardVector(veh)
        local trunkDir = coords - GetEntityCoords(veh)
        local dot = Dot(forward, trunkDir)

        if dot < 0.0 then
            forward = forward * -1
        end

        offsetCoords = coords + forward * offset
    end

    return { true, coords, doorIndexes, offsetCoords }
end
exports("GetTrunkInfo", GetTrunkInfo)
