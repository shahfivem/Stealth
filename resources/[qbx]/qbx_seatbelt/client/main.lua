local QBCore = exports['qb-core']:GetCoreObject()
local seatbeltOn = false
local harnessOn = false
local harnessHp = 20
local handbrake = 0
local sleep = 0
local harnessData = {}
local newvehicleBodyHealth = 0
local currentvehicleBodyHealth = 0
local frameBodyChange = 0
local lastFrameVehiclespeed = 0
local lastFrameVehiclespeed2 = 0
local thisFrameVehicleSpeed = 0
local tick = 0
local damagedone = false
local modifierDensity = true
local lastVehicle = nil
local veloc

-- Functions

local function EjectFromVehicle()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped,false)
    local coords = GetOffsetFromEntityInWorldCoords(veh, 1.0, 0.0, 1.0)
    SetEntityCoords(ped, coords.x, coords.y, coords.z)
    Wait(1)
    SetPedToRagdoll(ped, 5511, 5511, 0, 0, 0, 0)
    SetEntityVelocity(ped, veloc.x*4, veloc.y*4, veloc.z*4)
    local ejectspeed = math.ceil(GetEntitySpeed(ped) * 8)
    if GetEntityHealth(ped) - ejectspeed > 0 then
        SetEntityHealth(ped, GetEntityHealth(ped) - ejectspeed)
    elseif GetEntityHealth(ped) ~= 0 then
        SetEntityHealth(ped, 0)
    end
end

local function ToggleSeatbelt()
    seatbeltOn = not seatbeltOn
    TriggerEvent("seatbelt:client:ToggleSeatbelt")
    TriggerServerEvent("InteractSound_SV:PlayOnSource", seatbeltOn and "carbuckle" or "carunbuckle", 0.25)
    if seatbeltOn then
        QBCore.Functions.Notify('Seatbelt On', 'success')
    else
        QBCore.Functions.Notify('Seatbelt Off', 'error')
    end
end

local function ResetHandBrake()
    if handbrake <= 0 then return end
    handbrake -= 1
end

-- Export

function HasHarness()
    return harnessOn
end

exports("HasHarness", HasHarness)

local function ToggleHarness()
    if harnessOn then
        harnessOn = false -- Toggle off the harness
        QBCore.Functions.Notify('Harness Detached', 'error') -- Notify the player that the harness is removed
    else
        harnessOn = true -- Toggle on the harness
        QBCore.Functions.Notify('Harness Attached', 'success') -- Notify the player that the harness is attached
    end
    TriggerEvent("seatbelt:client:ToggleSeatbelt")
    TriggerServerEvent("InteractSound_SV:PlayOnSource", harnessOn and "carbuckle" or "carunbuckle", 0.25)
end



-- Main Thread

CreateThread(function()
    while true do
        sleep = 1000
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            sleep = 0
            if seatbeltOn or harnessOn then
                if IsControlJustPressed(0, 75) then
                    seatbeltOn = false
                    harnessOn = false
                end
            end
        else
            seatbeltOn = false
            harnessOn = false
        end
        Wait(sleep)
    end
end)

-- Ejection Logic

CreateThread(function()
    while true do
        Wait(0)
        local playerPed = PlayerPedId()
        local currentVehicle = GetVehiclePedIsIn(playerPed, false)
        if currentVehicle ~= 0 then
            SetPedHelmet(playerPed, false)
            lastVehicle = currentVehicle

            -- Ensure engine health does not drop below 0
            if GetVehicleEngineHealth(currentVehicle) < 0.0 then
                SetVehicleEngineHealth(currentVehicle, 0.0)
            end

            -- Manage handbrake logic
            if GetVehicleHandbrake(currentVehicle) or math.abs(GetVehicleSteeringAngle(currentVehicle)) > 25.0 then
                if handbrake == 0 then
                    handbrake = 100
                    ResetHandBrake()
                else
                    handbrake = 100
                end
            end

            -- Speed and body health tracking
            thisFrameVehicleSpeed = GetEntitySpeed(currentVehicle) * 3.6
            currentvehicleBodyHealth = GetVehicleBodyHealth(currentVehicle)

            if currentvehicleBodyHealth == 1000 and frameBodyChange ~= 0 then
                frameBodyChange = 0
            end

            if frameBodyChange ~= 0 then
                if lastFrameVehiclespeed > 110 and thisFrameVehicleSpeed < (lastFrameVehiclespeed * 0.75) and not damagedone then
                    if frameBodyChange > 18.0 then
                        -- Handle harness logic
                        if harnessOn then
                            harnessHp -= 1
                            TriggerServerEvent('seatbelt:DoHarnessDamage', harnessHp, harnessData)
                            if harnessHp <= 0 then
                                harnessOn = false
                                QBCore.Functions.Notify("Your harness is broken!", "error")
                            else
                            end
                        elseif not IsThisModelABike(currentVehicle) then
                            if math.random(math.ceil(lastFrameVehiclespeed)) > 60 then
                                -- Eject player if seatbelt is off and no harness is on
                                if not seatbeltOn then
                                    EjectFromVehicle()
                                else
                                    EjectFromVehicle()
                                end
                            end
                        end
                    end
                    damagedone = true
                    SetVehicleEngineOn(currentVehicle, false, true, true)
                end

                if currentvehicleBodyHealth < 350.0 and not damagedone then
                    damagedone = true
                    SetVehicleEngineOn(currentVehicle, false, true, true)
                    Wait(1000)
                end
            end

            if lastFrameVehiclespeed < 100 then
                Wait(100)
                tick = 0
            end

            frameBodyChange = newvehicleBodyHealth - currentvehicleBodyHealth
            if tick > 0 then
                tick -= 1
                if tick == 1 then
                    lastFrameVehiclespeed = GetEntitySpeed(currentVehicle) * 3.6
                end
            else
                if damagedone then
                    damagedone = false
                    frameBodyChange = 0
                    lastFrameVehiclespeed = GetEntitySpeed(currentVehicle) * 3.6
                end
                lastFrameVehiclespeed2 = GetEntitySpeed(currentVehicle) * 3.6
                if lastFrameVehiclespeed2 > lastFrameVehiclespeed then
                    lastFrameVehiclespeed = GetEntitySpeed(currentVehicle) * 3.6
                end
                if lastFrameVehiclespeed2 < lastFrameVehiclespeed then
                    tick = 25
                end
            end

            if tick < 0 then
                tick = 0
            end

            newvehicleBodyHealth = GetVehicleBodyHealth(currentVehicle)
            veloc = GetEntityVelocity(currentVehicle)
        else
            -- Reset values when not in a vehicle
            if lastVehicle then
                SetPedHelmet(playerPed, true)
                Wait(200)
                newvehicleBodyHealth = GetVehicleBodyHealth(lastVehicle)
                if not damagedone and newvehicleBodyHealth < currentvehicleBodyHealth then
                    damagedone = true
                    SetVehicleEngineOn(lastVehicle, false, true, true)
                    Wait(1000)
                end
                lastVehicle = nil
            end
            lastFrameVehiclespeed2 = 0
            lastFrameVehiclespeed = 0
            newvehicleBodyHealth = 0
            currentvehicleBodyHealth = 0
            frameBodyChange = 0
            Wait(2000)
        end
    end
end)


-- Events

RegisterNetEvent('seatbelt:client:UseHarness', function(ItemData, updateInfo) -- On Item Use (registered server side)
    local ped = PlayerPedId()
    local inveh = IsPedInAnyVehicle(ped, false)
    local class = GetVehicleClass(GetVehiclePedIsUsing(ped))

    if inveh and class ~= 8 and class ~= 13 and class ~= 14 then
        if not harnessOn then
            LocalPlayer.state:set("inv_busy", true, true)
            if exports.erp_progressbar:taskBar({
                text = 'Attaching Harness',
                length = 5000,
                vehicle = GetVehiclePedIsIn(cache.ped, false),
                disable = {
                    combat = true,
                    movement = true,
                    vehicle = true
                }
            }) == 100 then
                LocalPlayer.state:set("inv_busy", false, true)
                harnessOn = true  -- Attach the harness directly here
                QBCore.Functions.Notify('Harness Attached', 'success')  -- Notify that the harness was attached
                if updateInfo then
                    TriggerServerEvent('equip:harness', ItemData)
                end
                if updateInfo then
                    harnessHp = ItemData.info.uses
                    harnessData = ItemData
                end
            end
        else
            if harnessOn then
                LocalPlayer.state:set("inv_busy", true, true)
                local k = exports.erp_progressbar:taskBar({
                    text = 'Removing Harness',
                    length = 5000,
                    vehicle = GetVehiclePedIsIn(cache.ped, false),
                    disable = {
                        combat = true,
                        movement = true,
                        vehicle = true
                    }
                })
                if k == 100 then
                    harnessOn = false  -- Remove the harness directly here
                    QBCore.Functions.Notify('Harness Detached', 'error')  -- Notify that the harness was detached
                end
            end
        end
    else
        QBCore.Functions.Notify('You\'re not in a car.', 'error')
    end
end)




RegisterNetEvent('seatbelt:client:UseSeatbelt', function()
    ToggleSeatbelt()
end)

-- Register Key

RegisterCommand('toggleseatbelt', function()
    if not IsPedInAnyVehicle(PlayerPedId(), false) or IsPauseMenuActive() then return end
    local class = GetVehicleClass(GetVehiclePedIsUsing(PlayerPedId()))
    if class == 8 or class == 13 or class == 14 then return end
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    local plate = QBCore.Functions.GetPlate(vehicle)

    TriggerServerEvent('brazzers-harness:server:toggleBelt', plate)
end, false)

RegisterKeyMapping('toggleseatbelt', 'Toggle Seatbelt', 'keyboard', 'B')
