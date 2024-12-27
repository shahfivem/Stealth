local config = require 'config.client'
local sharedConfig = require 'config.shared'
local doctorCount = 0
local deathScreenActive = false
local canRespawn = false
local function getDoctorCount()
    return lib.callback.await('qbx_ambulancejob:server:getNumDoctors')
end

local function displayRespawnText()
    local deathTime = exports.qbx_medical:GetDeathTime()
    if deathTime > 0 and doctorCount > 0 then
    
        CreateThread(function()
            deathScreenActive = true
            exports.echo_deathscreen:startScreen({
                duration = GetConvarInt('sv_developer', 0) == 1 and 10 or 300,
                label = "INCAPACITATED",
                description = "Interact with EMS using /me",
                actions = { police = true, hold = false, doctor = true },
                holdButton = "LOCAL EMS"
            })
            deathScreenActive = false
            if exports.qbx_medical:IsDead() then
                deathScreenActive = true
                exports.echo_deathscreen:updateData({
                    label = "YOU ARE DEAD",
                    description = "Press below buttons for action or wait for EMS",
                    actions = { police = false, hold = true, doctor = false },
                    holdButton = "LOCAL EMS"
                })
                actionPromise = promise.new()
                canRespawn = Citizen.Await(actionPromise)
            end
        end)
    end
end

---@param ped number
local function playDeadAnimation(ped)
    if IsInHospitalBed then
        if not IsEntityPlayingAnim(ped, InBedDict, InBedAnim, 3) then
            lib.playAnim(ped, InBedDict, InBedAnim, 1.0, 1.0, -1, 1, 0, false, false, false)
        end
    else
        exports.qbx_medical:PlayDeadAnimation()
    end
end

---@param ped number
local function handleDead(ped)
    if not IsInHospitalBed then
        displayRespawnText()
    end

    playDeadAnimation(ped)
end

---Player is able to send a notification to EMS there are any on duty
local function handleRequestingEms()
    if not EmsNotified then
        qbx.drawText2d({ text = locale('info.request_help'), coords = vec2(1.0, 1.40), scale = 0.6 })
        if IsControlJustPressed(0, 47) then
            TriggerServerEvent('hospital:server:ambulanceAlert', locale('info.civ_down'))
            EmsNotified = true
        end
    else
        qbx.drawText2d({ text = locale('info.help_requested'), coords = vec2(1.0, 1.40), scale = 0.6 })
    end
end

local function handleLastStand()
    local laststandTime = exports.qbx_medical:GetLaststandTime()
    if laststandTime > config.laststandTimer or doctorCount == 0 then
        CreateThread(function()
            deathScreenActive = true
            exports.echo_deathscreen:startScreen({
                duration = laststandTime,
                label = "INCAPACITATED",
                description = "Interact with EMS using /me",
                actions = { police = true, hold = false, doctor = true },
                holdButton = "LOCAL EMS"
            })
            deathScreenActive = false
            if exports.qbx_medical:IsDead() then
                deathScreenActive = true
                exports.echo_deathscreen:updateData({
                    label = "YOU ARE DEAD",
                    description = "Press below buttons for action or wait for EMS",
                    actions = { police = false, hold = true, doctor = false },
                    holdButton = "LOCAL EMS"
                })
                actionPromise = promise.new()
                canRespawn = Citizen.Await(actionPromise)
            end
        end)
    end
end

---Set dead and last stand states.
CreateThread(function()
    while true do
        local isDead = exports.qbx_medical:IsDead()
        local inLaststand = exports.qbx_medical:IsLaststand()
        if isDead or inLaststand then
            LocalPlayer.state.invHotkeys = false
            if isDead then
                handleDead(cache.ped)
            elseif inLaststand then
                handleLastStand()
            end
            Wait(0)
        else
            LocalPlayer.state.invHotkeys = true
            Wait(1000)
        end
    end
end)

CreateThread(function()
    while true do
        doctorCount = getDoctorCount()
        Wait(60000)
    end
end)