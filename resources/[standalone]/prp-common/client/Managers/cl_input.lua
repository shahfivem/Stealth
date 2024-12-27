local currentPromise

-- **********************
--    Global Functions
-- **********************
-- WHEN TRIGGERED, OPEN AN INPUT BOX TO TYPE NUMBERS OR WORDS INTO IT
function OpenInputDialogue(type, message, min, max)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = type or "text",
        message = message or "No Message Provided",
        min = min or 5,
        max = max or 255
    })

    currentPromise = promise.new()
    return Citizen.Await(currentPromise)
end
exports("OpenInputDialogue", OpenInputDialogue)

-- WHEN TRIGGERED, OPEN A SELECTION DIALOGUE WITH PROVIDED OPTIONS
function OpenSelectDialogue(message, options)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "selection",
        message = message or "No Message Provided",
        options = options or {}
    })

    currentPromise = promise.new()
    return Citizen.Await(currentPromise)
end
exports("OpenSelectDialogue", OpenSelectDialogue)

-- WHEN TRIGGERED, OPEN A CONFIRM BOX WITH YES/NO OPTIONS (CUSTOMIZABLE) TO CONFIRM A USER'S SELECTION
function OpenConfirmDialogue(message, yesText, noText)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "confirm",
        message = message or "No Message Provided",
        yesText = yesText or "Yes",
        noText = noText or "No"
    })

    currentPromise = promise.new()
    return Citizen.Await(currentPromise)
end
exports("OpenConfirmDialogue", OpenConfirmDialogue)

-- **********************
--     NUI Callbacks
-- **********************
-- WHEN TRIGGERED, RETURN INPUT DATA FROM THE BOX
RegisterNUICallback("Input.ReturnData", function(data)
    SetNuiFocus(false, false)
    if (currentPromise ~= nil) then
        currentPromise:resolve(data["input"])
    end
end)
