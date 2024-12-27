local standardVolumeOutput = 1.0;

RegisterNetEvent('erp-sounds:PlayOnOne')
AddEventHandler('erp-sounds:PlayOnOne', function(soundFile, soundVolume)
    print("Playing sound on one:", soundFile, soundVolume)  -- Debug output
    SendNUIMessage({
        transactionType     = 'playSound',
        transactionFile     = soundFile,
        transactionVolume   = soundVolume
    })
end)


RegisterNetEvent('erp-sounds:PlayOnAll')
AddEventHandler('erp-sounds:PlayOnAll', function(soundFile, soundVolume)
    SendNUIMessage({
        transactionType     = 'playSound',
        transactionFile     = soundFile,
        transactionVolume   = soundVolume
    })
end)

RegisterNetEvent('erp-sounds:PlayWithinDistance')
AddEventHandler('erp-sounds:PlayWithinDistance', function(playerNetId, maxDistance, soundFile, soundVolume, coords)
    -- Verify if coords is provided; if not, exit the function with a debug message
    if not coords then
        print("Error: Missing 'coords' argument for erp-sounds:PlayWithinDistance")
        return
    end

    local lCoords = GetEntityCoords(PlayerPedId())
    local eCoords = coords
    local distIs = Vdist(lCoords.x, lCoords.y, lCoords.z, eCoords.x, eCoords.y, eCoords.z)

    -- Play sound if within the specified distance
    if distIs <= maxDistance then
        SendNUIMessage({
            transactionType     = 'playSound',
            transactionFile     = soundFile,
            transactionVolume   = soundVolume
        })
    end
end)


RegisterNetEvent('erp-sounds:PlayWithinDistanceOfCoords')
AddEventHandler('erp-sounds:PlayWithinDistanceOfCoords', function(maxDistance, soundFile, soundVolume,coords)
    local lCoords = GetEntityCoords(PlayerPedId())
    local distIs = Vdist(lCoords.x, lCoords.y, lCoords.z, coords[1], coords[2], coords[3])
    if(distIs <= maxDistance) then
        SendNUIMessage({
            transactionType     = 'playSound',
            transactionFile     = soundFile,
            transactionVolume   = soundVolume
        })
    end
end)

RegisterNetEvent('erp-sounds:PlayFlash')
AddEventHandler('erp-sounds:PlayFlash', function(soundFile, soundVolume,time,hold)
    SendNUIMessage({
        transactionType     = 'playSoundFlash',
        transactionFile     = soundFile,
        transactionVolume   = soundVolume,
        transactionTime     = time,
        transactionHold     = hold
    })
end)

