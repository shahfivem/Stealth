local keyListener = KeyListener:new()
local response

local previousActions = {
    police = false,
    doctor = false,
    hold = false
}

-- Functions
---@param actions { police?: boolean, doctor?: boolean, hold?: boolean }
local function handleActions(actions)
    if not actions then return end

    -- Handle police action
    if actions.police ~= nil then
        if actions.police and not previousActions.police then
            keyListener:setListener('P', true)
        elseif not actions.police and previousActions.police then
            keyListener:setListener('P', false)
        end
        keyListener:cancelScheduledTask('pTimeout')
        previousActions.police = actions.police
    end

    -- Handle doctor action
    if actions.doctor ~= nil then
        if actions.doctor and not previousActions.doctor then
            keyListener:setListener('Q', true)
        elseif not actions.doctor and previousActions.doctor then
            keyListener:setListener('Q', false)
        end
        keyListener:cancelScheduledTask('qTimeout')
        previousActions.doctor = actions.doctor
    end

    -- Handle hold action
    if actions.hold ~= nil then
        if actions.hold and not previousActions.hold then
            keyListener:setListener('E', true)
        elseif not actions.hold and previousActions.hold then
            keyListener:setListener('E', false)
        end
        previousActions.hold = actions.hold
    end
end

local function startScreen(data)
    if response then return end
    response = promise.new()
    SendNUIMessage({
        action = 'openScreen',
        data = data
    })
    handleActions(data.actions)
    keyListener:startListening()
    return Citizen.Await(response)
end
exports('startScreen', startScreen)

local function hide()
    keyListener:stopListening()
    SendNUIMessage({
        action = 'hide'
    })
    if response then
        response:resolve(nil)
        response = nil
    end
    previousActions = {
        police = false,
        doctor = false,
        hold = false
    }
    return true
end
exports('hide', hide)

local function updateData(data)
    SendNUIMessage({
        action = 'updateData',
        data = data
    })
    handleActions(data.actions)
    return true
end
exports('updateData', updateData)

-- NUI Callbacks
RegisterNUICallback('timerFinished', function(_, cb)
    local promise = response
    response = nil
    if promise then promise:resolve(true) end
    cb('ok')
end)