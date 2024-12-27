local config = require 'config.client'
local price = require 'config.shared'.price

RegisterNetEvent('qbx_carwash:client:washCar', function()
    if source == '' then return end
    if lib.progressBar({
        duration = 2000,  -- Duration in milliseconds
        label = locale('progress.checking_in'),  -- Display text
        canCancel = true,  -- Allows canceling (equivalent to `preventCancel = false`)
        showTime = true,  -- Show remaining time (equivalent to `showTime = true`)
        anim = {
            dict = 'missheistdockssetup1clipboard@base',  -- Animation dictionary
            clip = 'base',  -- Animation clip
            flag = 16  -- Animation flag
        },
        prop = {
            {
                model = 'prop_notepad_01',  -- Prop model
                bone = 18905,  -- Bone ID
                pos = vector3(0.1, 0.02, 0.05),  -- Prop position
                rot = vector3(10.0, 0.0, 0.0)  -- Prop rotation
            },
            {
                model = 'prop_pencil_01',  -- Prop model
                bone = 58866,  -- Bone ID
                pos = vector3(0.11, -0.02, 0.001),  -- Prop position
                rot = vector3(-120.0, 0.0, 0.0)  -- Prop rotation
            }
        },
    })
     then -- if completed
        WashDecalsFromVehicle(cache.vehicle, 1.0)
    else -- if canceled
        exports.qbx_core:Notify(locale('canceled'), 'error')
    end
end)

local function createCarWashBlip(coords)
    local carWash = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(carWash, 100)
    SetBlipDisplay(carWash, 4)
    SetBlipScale(carWash, 0.75)
    SetBlipAsShortRange(carWash, true)
    SetBlipColour(carWash, 37)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(locale('label'))
    EndTextCommandSetBlipName(carWash)
end

for i = 1, #config.locations do
    local coords = config.locations[i]
    createCarWashBlip(coords)
    if config.useTarget then
        exports.ox_target:addSphereZone({
            coords = coords,
            radius = 7.5,
            debug = config.polyDebug,
            options = {
                {
                    label = locale('wash_prompt', price),
                    icon = 'fas fa-car-on',
                    serverEvent = 'qbx_carwash:server:startWash',
                },
            },
        })
    else
        lib.zones.sphere({
            coords = coords,
            radius = 7.5,
            debug = config.polyDebug,
            inside = function()
                if not exports("taskBar", taskBar)() then
                    qbx.drawText3d({text = locale('wash_prompt', price), coords = coords})
                    if IsControlJustPressed(0, 38) then
                        if GetVehicleDirtLevel(cache.vehicle) > config.dirtLevel then
                            local netId = NetworkGetNetworkIdFromEntity(cache.vehicle)
                            TriggerServerEvent('qbx_carwash:server:startWash', netId)
                        else
                            exports.qbx_core:Notify(locale('not_dirty'), 'error')
                        end
                    end
                else
                    qbx.drawText3d({text = locale('not_available'), coords = coords})
                end
            end,
        })
    end
end
