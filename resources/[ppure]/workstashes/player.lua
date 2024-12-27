local function isPolice()
    return QBX.PlayerData.job.type == 'leo' and QBX.PlayerData.job.onduty
end

local function isEms()
    return QBX.PlayerData.job.type == 'ems' and QBX.PlayerData.job.onduty
end

exports.ox_target:addGlobalPlayer({
    {
        label = "Revive Player", -- Label shown in targeting menu
        icon = "fas fa-heartbeat", -- Optional: FontAwesome icon
        canInteract = function(entity)
            -- Restrict interaction to EMS players on duty
            return lib.callback.await('police:server:isPlayerDead', false, entity)
        end,
        onSelect = function(data)
            -- Trigger the revive action
            local targetPlayer = NetworkGetPlayerIndexFromPed(data.entity)
            if targetPlayer then
                TriggerEvent('medical:emsRevive', targetPlayer)
            else
                print('Invalid player entity for revive')
            end
        end,
        distance = 2.5,
        anyItem = true,
        items = {'emsmedbag', 'medbag'}
    }
})


exports.ox_target:addGlobalPlayer({
    {
        label = "Fine",
        canInteract = function(entity)
            -- Allow interaction if the player is police or ambulance and on duty
            return isPolice()
        end,
        onSelect = function(data)
            local ped = NetworkGetPlayerIndexFromPed(data.entity)
            local pedId = GetPlayerServerId(ped)

            -- Use lib.inputDialog for fine amount input
            local input = lib.inputDialog('Fine Person', {
                {
                    label = 'Amount',
                    placeholder = 'Enter fine amount',
                    type = 'number',
                    required = true,
                    min = 1
                }
            })

            -- Handle the input
            if not input then
                exports['erp_notifications']:SendAlert('inform', 'Fine canceled.')
                return
            end

            local amount = tonumber(input[1])
            if amount == nil or amount <= 0 then
                exports['erp_notifications']:SendAlert('inform', 'Invalid amount.')
                return
            end

            -- Trigger fine event
            TriggerServerEvent("police:server:BillPlayer", pedId, amount)
        end,
        distance = 1.2
    }
})


local function SpikeStrip()
	local ped = PlayerPedId()
    local testdic = "weapons@first_person@aim_rng@generic@projectile@thermal_charge@"
    local testanim = "plant_floor"

    if IsPedArmed(ped, 7) then TriggerEvent("erp_inventory:weapons:setEmptyHanded", false) end

    RequestAnimDict(testdic)

    while not HasAnimDictLoaded(testdic) and not handCuffed do Citizen.Wait(0) end

    if IsEntityPlayingAnim(ped, testdic, testanim, 3) then 
        ClearPedSecondaryTask(ped)
    else
        local animLength = GetAnimDuration(testdic, testanim)
        TaskPlayAnim(ped, testdic, testanim, 1.0, 1.0, -1, 48, -1, 0, 0, 0)
	end
end


AddEventHandler('medical:treatwounds', function(target)
    local isOnDuty = QBX.PlayerData.job.onduty -- Store on-duty state for reuse
    if isEms() then
        -- EMS On Duty Actions
        local count = math.random(4, 6)
        for i = 1, count do
            SpikeStrip()
            Wait(3000)
        end
        TriggerServerEvent('hospital:server:TreatWounds', GetPlayerServerId(target))
    elseif not isOnDuty then
        -- EMS Off Duty Actions
        local count = math.random(4, 6)
        for i = 1, count do
            SpikeStrip()
            Wait(3000)
        end
        TriggerServerEvent("ox_inventory:removeItem", "emsfirstaidkit", 1)
        exports['erp_notifications']:SendAlert('inform', 'You used a first aid kit', 3000)
        TriggerServerEvent('hospital:server:TreatWounds', GetPlayerServerId(target))
    else
        -- Not EMS or not allowed to perform the action
        exports['erp_notifications']:SendAlert('error', 'You are not EMS or not allowed to perform this action!', 3000)
    end 
end)



AddEventHandler('medical:emsRevive', function(target)
    local isOnDuty = QBX.PlayerData.job.onduty
    if isEms() then
        -- EMS On Duty Actions
        TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
        Wait(math.random(8000, 12000))
        ClearPedTasks(PlayerPedId())
        TriggerServerEvent('hospital:server:RevivePlayer', GetPlayerServerId(target))
    elseif not isOnDuty then
        -- EMS Off Duty Actions
        TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
        Wait(math.random(8000, 12000))
        ClearPedTasks(PlayerPedId())
        TriggerServerEvent('ox_inventory:removeItem', 'emsmedbag', 1)
        exports['erp_notifications']:SendAlert('inform', 'You used a medical bag', 3000)
        TriggerServerEvent('hospital:server:RevivePlayer', GetPlayerServerId(target))
    else
        -- No actions if not EMS
        exports['erp_notifications']:SendAlert('error', 'You are not EMS or not allowed to perform this action!', 3000)
    end
end)



