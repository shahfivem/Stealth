Citizen.CreateThread(function()
    while true do
        SetPedSuffersCriticalHits(GetPlayerPed(-1), true)
        Wait(1)
    end
end)