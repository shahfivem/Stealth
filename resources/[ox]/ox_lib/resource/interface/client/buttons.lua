local threadActive = false
local resource
local buttons, buttonStates = {}, {}

---@class InstructionalButtonProps
---@field key string Letter
---@field code number Number of the key
---@field label string Label to display as description
---@field onTap? fun() Function to call when the key is first pressed
---@field onPress? fun() Function to call when the key is pressed (hold)
---@field onRelease? fun() Function to call when the key is released

---This function highlights a button in the instructional buttons.
---This is useful for when you want to highlight a button when a certain condition is met.
---@param key string Letter
---@param state boolean Whether to highlight the button or not
local function highlightButton(key, state)
    SendNUIMessage({
        action = 'highlightInstructionalButton',
        data = {
            key = key,
            state = state
        }
    })
end

---This function starts listening for key presses.
local function startListening()
    if threadActive then return end
    threadActive = true

    CreateThread(function()
        while threadActive do
            Wait(0)
            for _, button in ipairs(buttons) do
                if not buttonStates[button.key] then
                    buttonStates[button.key] = { pressed = false }
                end
                if IsControlPressed(0, button.code) then
                    if not buttonStates[button.key].pressed then
                        buttonStates[button.key].pressed = true
                        highlightButton(button.key, true)
                        if button.onTap then
                            button.onTap()
                        end
                    end
                    if buttonStates[button.key].pressed and button.onPress then
                        button.onPress()
                    end
                end

                if IsControlJustReleased(0, button.code) then
                    if buttonStates[button.key].pressed then
                        buttonStates[button.key].pressed = false
                        highlightButton(button.key, false)
                        if button.onRelease then
                            button.onRelease()
                        end
                    end
                end
            end
        end
    end)
end

---This function stops listening for key presses.
local function stopListening()
    threadActive = false
    buttons = {}
    buttonStates = {}
    resource = nil
end

---This function opens the instructional buttons.
---@param data InstructionalButtonProps[]
---@return boolean Whether the action was successful or not
function lib.instructionalButtons(data)
    if threadActive then return false end
    buttons = data
    resource = GetInvokingResource()
    startListening()
    local _dataToSend = {}
    for _, button in ipairs(data) do
        _dataToSend[#_dataToSend + 1] = {
            key = button.key,
            label = button.label,
            highlighted = false
        }
    end
    SendNUIMessage({
        action = 'openInstructionalButtons',
        data = {
            buttons = _dataToSend
        }
    })
    return true
end

---This function closes the instructional buttons.
---@return boolean Whether the action was successful or not
function lib.closeInstructionalButtons()
    if not threadActive then return true end
    SendNUIMessage({
        action = 'closeInstructionalButtons'
    })
    stopListening()
    return true
end

AddEventHandler('onResourceStop', function(res)
    if resource ~= res then return end
    lib.closeInstructionalButtons()
end)