
local successCb
local failCb
local resultReceived = false

exports('movingmemory', function(size, success, fail)
    resultReceived = false
    successCb = success
    failCb = fail
    SendNUIMessage({
        showUI = true,
        size = size
    })
    SetNuiFocus(true,true)
end)

RegisterNUICallback('MemoryResult', function(data, cb)
    -- exports['exo-inventory']:ToggleHotBar(true) Toggle so that inventory doesnt work.. this was something I made on my own server.. 
    SetNuiFocus(false, false)
    resultReceived = true
    if data.success then
        successCb()
    else
        failCb()
    end
    cb('ok')
    -- TriggerEvent('progressbar:client:ToggleBusyness', false) -- To check if another progressbar is running
end)


-- RegisterCommand("test", function(source, args, rawCommand)
--     SendNUIMessage({
--         showUI = true,
--         size = 10
--     })
--     SetNuiFocus(true,true)
-- end)
