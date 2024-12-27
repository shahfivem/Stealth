CreateThread(function()
    local model = GetHashKey(Config.ped.model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(100)
    end

    local ped = CreatePed(4, model, Config.ped.position.x, Config.ped.position.y, Config.ped.position.z - 1.0, Config.ped.heading, false, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)

    exports.ox_target:addLocalEntity(ped, {
        {
            name = 'item_exchange',
            label = 'Exchange Items',
            icon = 'fa-solid fa-box',
            onSelect = function()
                exports.echo_emotes:OnEmotePlay('argue', true)
                local finished = exports.erp_progressbar:taskBar({
                    text = 'Striking a deal',
                    length = 5000,
                    distcheck = 1,
                    animation = { stuck = true }
                }) == 100 if finished then
                exports.echo_emotes:EmoteCancel({ name = 'argue', forced = true })
                TriggerServerEvent('item_exchange:attemptExchange')
                else
                    exports.echo_emotes:EmoteCancel({ name = 'argue', forced = true })
            end
        end
        }
    })
end)
