KeyListener = {}
KeyListener.__index = KeyListener

local QBCore = exports['qb-core']:GetCoreObject()

function GetPlayerGender()
    local gender = 'Male'
    if QBCore.Functions.GetPlayerData().charinfo.gender == 1 then
        gender = 'Female'
    end
    return gender
end
local Q_KEY = 44  -- "Q" key
local P_KEY = 199 -- "P" key
local E_KEY = 38  -- "E" key

function KeyListener:new()
    local self = setmetatable({}, KeyListener)
    self.listeners = {
        Q = false,
        P = false,
        E = false
    }
    self.isHoldingE = false
    self.holdStartTime = 0
    self.requiredHoldTime = 5000 -- 5 seconds
    self.threadActive = false
    self.scheduledTasks = {}
    return self
end

-- Function to start listening for keys
function KeyListener:startListening()
    if self.threadActive then return end
    self.threadActive = true

    CreateThread(function()
        while self.threadActive do
            Wait(0)
            self:processKeyInputs()
        end
    end)
end

-- Function to stop listening for keys
function KeyListener:stopListening()
    self.threadActive = false
    self:clearScheduledTasks()
    self.listeners.Q = false
    self.listeners.P = false
    self.listeners.E = false
    self.isHoldingE = false
end

-- Function to enable or disable key listeners
function KeyListener:setListener(key, state)
    if self.listeners[key] ~= nil then
        self.listeners[key] = state
    end
end

-- Function to handle key presses
function KeyListener:processKeyInputs()
    if self.listeners.Q and IsDisabledControlJustPressed(0, Q_KEY) then
        self:executeQAction()
    end

    if self.listeners.P and IsDisabledControlJustPressed(0, P_KEY) then
        self:executePAction()
    end

    if self.listeners.E then
        self:handleEKeyHold()
    end
end

-- Function to execute Q action
-- Function to execute Q action
function KeyListener:executeQAction()
    -- Disable the listener to prevent spamming
    self:setListener('Q', false)

    -- Get player coordinates
    local pedCoords = GetEntityCoords(PlayerPedId())
    
    -- Send dispatch alert
    exports['ps-dispatch']:CustomAlert({
        message = 'Civilian in distress',
        code = '10-51C',
        coords = pedCoords,
        gender = GetPlayerGender(),
        street = true,
        plate = GetVehiclePedIsIn(PlayerPedId(), false),
        sound = { "erp-sounds:PlayWithinDistance", 10.0, "alert_normal", 0.08 },
        jobs = { 'leo', 'ems' },
    })

    -- Schedule cooldown
    self:scheduleTask('qTimeout', function()
        self:setListener('Q', true) -- Re-enable the key after 60 seconds
        SendNUIMessage({
            action = 'updateData',
            data = { actions = { doctor = true } }
        })
    end, 60000) -- 60 seconds cooldown
end

-- Function to execute P action
function KeyListener:executePAction()
    -- Disable the listener to prevent spamming
    self:setListener('P', false)

    -- Get player coordinates
    local pedCoords = GetEntityCoords(PlayerPedId())

    -- Send dispatch alert
    exports['ps-dispatch']:CustomAlert({
        message = 'Civilian in immediate distress',
        code = '10-51A',
        coords = pedCoords,
        priority = 1,
        gender = GetPlayerGender(),
        street = true,
        plate = GetVehiclePedIsIn(PlayerPedId(), false),
        sound = { "erp-sounds:PlayWithinDistance", 10.0, "alert_normal", 0.08 },
        jobs = { 'leo', 'ems' },
    })

    -- Schedule cooldown
    self:scheduleTask('pTimeout', function()
        self:setListener('P', true) -- Re-enable the key after 60 seconds
        SendNUIMessage({
            action = 'updateData',
            data = { actions = { police = true } }
        })
    end, 60000) -- 60 seconds cooldown
end


-- Function to handle E key hold
function KeyListener:handleEKeyHold()
    if IsControlPressed(0, E_KEY) then
        if not self.isHoldingE then
            self.isHoldingE = true
            self.holdStartTime = GetGameTimer()
            SendNUIMessage({ action = 'holdStart' })
        elseif GetGameTimer() - self.holdStartTime >= self.requiredHoldTime then
            TriggerEvent('echo_deathscreen:client:holdStatus', true)
            SendNUIMessage({ action = 'holdEnd' })
            self:setListener('E', false)
    
            -- Trigger the respawn callback
            local success = lib.callback.await('qbx_medical:server:respawn')
            if success then
                print("Player respawned successfully!")
            else
                print("Respawn failed.")
            end
        end
    else
        if self.isHoldingE then
            SendNUIMessage({ action = 'holdEnd' })
            self.isHoldingE = false
        end
    end    
end

-- Function to schedule a task
function KeyListener:scheduleTask(name, callback, delay)
    self.scheduledTasks[name] = callback
    SetTimeout(delay, function()
        if not self.scheduledTasks[name] then return end
        self.scheduledTasks[name]()
        self.scheduledTasks[name] = nil
    end)
end

-- Function to cancel a scheduled task
function KeyListener:cancelScheduledTask(name)
    self.scheduledTasks[name] = nil
end

-- Function to clear all scheduled tasks
function KeyListener:clearScheduledTasks()
    self.scheduledTasks = {}
end