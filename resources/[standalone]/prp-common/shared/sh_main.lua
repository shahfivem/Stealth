-- **********************
--    Global Functions
-- **********************
-- WHEN TRIGGERED, CAPITALIZE THE FIRST LETTER OF A WORD
function FirstToUpper(str)
    return str:gsub("^%l", string.upper)
end
exports("FirstToUpper", FirstToUpper)

-- WHEN TRIGGERED, SPLIT STRING BY DELIMITER
function StringSplit(str, delimiter)
    local result = {}
    for match in (str..delimiter):gmatch("(.-)"..delimiter) do
        result[#result + 1] = match
    end
    return result
end
exports("StringSplit", StringSplit)

-- WHEN TRIGGERED, RETURN TIME FROM START TIME
function TimeSince(start)
    local time = GetGameTimer()
    return (time - start)
end
exports("TimeSince", TimeSince)

-- WHEN TRIGGERED, RETURN AREA NAME FROM SELECTED INDEX
function GetArea(areaCode)
    if areaNames[areaCode] then
        return areaNames[areaCode]
    end
    return "Unincorporated Zone"
end
exports("GetArea", GetArea)

-- WHEN TRIGGERED, GET SIZE OF A SENT TABLE
function GetTableSize(tab)
    local size = 0
    for _ in pairs(tab) do
        size = size + 1
    end
    return size
end
exports("GetTableSize", GetTableSize)

-- WHEN TRIGGERED, RETURN IF PLAYER IS USING A DOG MODEL
function IsModelADog(ped)
    local model = GetEntityModel(ped)
    if dogModels[model] then
        return true
    end
    return false
end
exports("IsModelADog", IsModelADog)

-- WHEN TRIGGERED, RETURN VEHICLE COLOR NAME FROM SELECTED INDEX
function GetDetailedVehicleColor(colorIdx)
    if detailedVehicleColors[colorIdx] then
        return detailedVehicleColors[colorIdx]
    end
    return "Unknown Color"
end
exports("GetDetailedVehicleColor", GetDetailedVehicleColor)

-- WHEN TRIGGERED, RETURN GENERIC VEHICLE FROM SENT INDEX
function GetGenericVehicleColor(colorIdx)
    if genericVehicleColors[colorIdx] then
        return FirstToUpper(genericVehicleColors[colorIdx])
    end
    return "Unknown Color"
end
exports("GetGenericVehicleColor", GetGenericVehicleColor)

-- WHEN TRIGGERED, RETURN WEAPON NAME FROM HASH KEY
function GetWeaponNameFromHash(hash)
    for _, weapon in pairs(weaponNames) do
        if (GetHashKey(weapon) == hash) then
            return weapon
        end
    end
    return nil
end
exports("GetWeaponNameFromHash", GetWeaponNameFromHash)

-- WHEN TRIGGERED, RETURN CARDINAL DIRECTION OF HEADING
function GetCardinalDirection(heading)
    if ((heading >= 0 and heading < 45) or (heading >= 315 and heading < 360)) then
        return "North"
    elseif (heading >= 45 and heading < 135) then
        return "West"
    elseif (heading >= 135 and heading < 225) then
        return "South"
    elseif (heading >= 225 and heading < 315) then
        return "East"
    else
        return "North"
    end
end
exports("GetCardinalDirection", GetCardinalDirection)

-- WHEN TRIGGERED, SORT TABLE IN ALPHABETICAL ORDER
function SortByAlphabet(t, f)
    local a = {}
    for n in pairs(t) do
        a[#a + 1] = n
    end

    table.sort(a, f)

    local i = 0
    local iter = function()
        i = i + 1
        if a[i] == nil then
            return nil
        else
            return a[i], t[a[i]]
        end
    end
    return iter
end
exports("SortByAlphabet", SortByAlphabet)

-- WHEN TRIGGERED, TURN A NUMBER INTO A NUMBER WITH COMMAS WITH THE STRING TYPE
function NumberWithCommas(targetNumber)
    return tostring(math.floor(targetNumber)):reverse():gsub("(%d%d%d)","%1,"):gsub(",(%-?)$","%1"):reverse()
end
exports("NumberWithCommas", NumberWithCommas)

-- WHEN TRIGGERED, ROUND THE NUMBER TO THE SPECIFIED AMOUNT OF DECIMALS
function Round(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end
exports("Round", Round)