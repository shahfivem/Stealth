local Config = require 'config.client'

local Blips = {}

local function applyBlipSettings(blip, color, name, sprite)
    SetBlipSprite(blip, sprite)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, color)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(name)
    EndTextCommandSetBlipName(blip)
end

function Blips.getBlipSprite(pedHandle)
    local sprite = 1
    local vehicle = GetVehiclePedIsIn(pedHandle, false)
    local class = vehicle and (GetVehicleClass(vehicle))

    return class and Config.classSprites[class] or sprite
end

function Blips.changeBlipCoords(blip, coords)
    SetBlipCoords(blip, coords.x, coords.y, 0.0)
end

function Blips.addBlipForCoord(coords, blipData)
    local blip = AddBlipForCoord(coords.x, coords.y, 0.0)
    applyBlipSettings(blip, blipData.color, blipData.name, 1)

    return blip
end

function Blips.changeBlipForEntity(blip, pedHandle)
    local newSprite = Blips.getBlipSprite(pedHandle)

    if newSprite ~= GetBlipSprite(blip) then
        local color = GetBlipColour(blip)
        SetBlipSprite(blip, newSprite)
        SetBlipColour(blip, color)
    end
end

function Blips.addBlipForEntity(pedHandle, blipData)
    local blip = AddBlipForEntity(pedHandle)
    applyBlipSettings(blip, blipData.color, blipData.name, Blips.getBlipSprite(pedHandle))
    SetBlipShowCone(blip, true)
    CreateThread(function()
        while DoesBlipExist(blip) do
            local vehicle = GetVehiclePedIsIn(pedHandle, false)

            if vehicle then
                local state = Entity(vehicle).state

                if state.stateEnsured then
                    local lightsOn = state.lightsOn

                    if lightsOn then
                        SetBlipColour(blip, 1)
                        Wait(250)
                        SetBlipColour(blip, 3)
                        Wait(250)
                    else
                        SetBlipColour(blip, blipData.color)
                    end
                end
            end
            Wait(500)
        end
    end)

    return blip
end

return Blips
