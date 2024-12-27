local loopIndex, sleep = 0, 550
local markers, nearbyMarkers = {}, {}
local showMarkers = true

-- **********************
--    Global Functions
-- **********************
-- WHEN TRIGGERED, ADD MARKER TO THE TABLE FOR THE LOOP TO USE
function AddMarker(name, markerProperties)
    markers[name] = markerProperties
end
exports("AddMarker", AddMarker)

-- WHEN TRIGGERED, REMOVE MARKER FROM THE TABLE
function RemoveMarker(name)
    if markers[name] then
        markers[name] = nil
    end
end
exports("RemoveMarker", RemoveMarker)

-- **********************
--        Events
-- **********************
-- WHEN TRIGGERED, TOGGLE THE MARKERS SETTING IF PLAYER WANTS THEM OR NOT
AddEventHandler("UI:Client:PreferencesChanged", function(userSettings)
    showMarkers = userSettings["showHelpfulMarkers"] == nil and true or userSettings["showHelpfulMarkers"]
end)

-- WHEN TRIGGERED, TOGGLE THE SAVED MARKERS SETTING IF PLAYER WANTED THEM OR NOT
AddEventHandler("Uchuu:Client:CharacterSpawned", function()
    local _showMarkers = exports["prp-ui"]:GetPreferences("user")["showHelpfulMarkers"]
    showMarkers = _showMarkers == nil and true or _showMarkers
end)

-- **********************
--         Loops
-- **********************
-- LOOP FOR MARKER MANAGEMENT
CreateThread(function()
    Wait(3500)

    while true do
        Wait(sleep)
        loopIndex = loopIndex + 1
        if (loopIndex % 10 == 0) then
            nearbyMarkers = {}
            local pos = GetEntityCoords(PlayerPedId())
            for _, marker in pairs(markers) do
                local range = 7.2
                if marker[25] then
                    range = marker[25]
                end

                local markerPos = vector3(marker[2], marker[3], marker[4])
                if #(pos - markerPos) <= range then
                    nearbyMarkers[#nearbyMarkers + 1] = marker
                end
            end
            loopIndex = 0
        end

        if #nearbyMarkers >= 1 and showMarkers then
            sleep = 3
            for _, marker in pairs(nearbyMarkers) do
                DrawMarker(table.unpack(marker))
            end
        else
            sleep = 550
        end
    end
end)
