function disableWeatherSync()
    if (GetResourceState('qb-weathersync') == 'started') or (GetResourceState('qbx_weathersync') == 'started') then
        TriggerEvent('qb-weathersync:client:DisableSync')
    elseif GetResourceState('weathersync') == 'started' then
        TriggerEvent('weathersync:toggleSync')
    elseif GetResourceState('cd_easytime') == 'started' then
        TriggerEvent('cd_easytime:PauseSync', false)
    elseif (GetResourceState('vSync') == 'started' or GetResourceState('Renewed-Weathersync') == 'started') then
        TriggerEvent('vSync:toggle', false)
    end
end

function enableWeatherSync()
    if (GetResourceState('qb-weathersync') == 'started') or (GetResourceState('qbx_weathersync') == 'started') then
        TriggerEvent('qb-weathersync:client:EnableSync')
    elseif GetResourceState('weathersync') == 'started' then
        TriggerEvent('weathersync:toggleSync')
    elseif GetResourceState('cd_easytime') == 'started' then
        TriggerEvent('cd_easytime:PauseSync', true)
    elseif (GetResourceState('vSync') == 'started' or GetResourceState('Renewed-Weathersync') == 'started') then
        TriggerEvent('vSync:toggle', true)
    end
end

exports('disableWeatherSync', disableWeatherSync)
exports('enableWeatherSync', enableWeatherSync)