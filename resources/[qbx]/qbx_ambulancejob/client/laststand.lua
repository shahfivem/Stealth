local isEscorting = false

---@param bool boolean
---TODO: this event name should be changed within qb-policejob to be generic
AddEventHandler('hospital:client:SetEscortingState', function(bool)
    LocalPlayer.state:set('isEscorted', bool)
    isEscorting = bool
end)

---Use first aid pack on nearest player.
lib.callback.register('hospital:client:UseFirstAid', function()
    if isEscorting then
        exports.qbx_core:Notify(locale('error.impossible'), 'error')
        return
    end

    local player = GetClosestPlayer()
    if player then
        local playerId = GetPlayerServerId(player)
        TriggerServerEvent('hospital:server:UseFirstAid', playerId)
    end
end)

lib.callback.register('hospital:client:canHelp', function()
    return exports.qbx_medical:IsLaststand() and exports.qbx_medical:GetLaststandTime() <= 300
end)

---@param targetId number playerId
RegisterNetEvent('hospital:client:HelpPerson', function(targetId)
    if GetInvokingResource() then return end
    if exports.erp_progressbar:taskBar({
        length = math.random(20000, 40000),  -- Duration in milliseconds
        text = locale('progress.revive'),  -- Display text
        canCancel = true,  -- Allows canceling (equivalent to `preventCancel = false`)
        showTime = false,  -- Show remaining time (equivalent to `showTime = true`)
        animation = {
            dict = HealAnimDict,  -- Animation dictionary
            anim = HealAnim,  -- Animation clip
            stuck = true
        },
    }) == 100
    then
        exports.qbx_core:Notify(locale('success.revived'), 'success')
        TriggerServerEvent('hospital:server:RevivePlayer', targetId)
    else
        exports.qbx_core:Notify(locale('error.canceled'), 'error')
    end
end)
