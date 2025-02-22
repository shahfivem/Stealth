local QBCore = exports[Config.Core]:GetCoreObject()

local function validateClass()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    local plate = QBCore.Functions.GetPlate(vehicle)
    local class = GetVehicleClass(GetVehiclePedIsUsing(PlayerPedId()))
    if class ~= 8 or class ~= 13 or class ~= 14 then return plate end
end

RegisterNetEvent("brazzers-harness:client:attachHarness", function(ItemData)
    if not IsPedInAnyVehicle(PlayerPedId(), false) then return QBCore.Functions.Notify(Lang:t("error.not_in_vehicle"), "error", 5000) end
    if not validateClass() then return QBCore.Functions.Notify(Lang:t("error.wrong_class"), "error", 5000) end
    TriggerServerEvent('brazzers-harness:server:attachHarness', validateClass(), ItemData)
end)

RegisterNetEvent('brazzers-harness:client:installHarness', function(plate, action)
    local label = 'Installing Harness'
    if action == 'uninstall' then label = 'Uninstalling Harness' end
    if exports.erp_progressbar:taskBar({
        text = label,
        length = 15000,
        disable = {
            movement = true,
            vehicle = true
        }
    }) == 100 then
        TriggerServerEvent("brazzers-harness:server:installHarness", plate, action)
    else
        QBCore.Functions.Notify(Lang:t("error.canceled_installation"), "error", 5000)
    end
end)
