local isScreenBlackedOut = false

CreateThread(function()
    while true do
        local res = GetIsWidescreen()
        
        if not res and not isScreenBlackedOut then
            isScreenBlackedOut = true
        elseif res and isScreenBlackedOut then
            isScreenBlackedOut = false
        end

        if isScreenBlackedOut then
            DrawRect(0.5, 0.5, 1.0, 1.0, 0, 0, 0, 240)
            drawCenteredText("You may not use stretched resolution, change to a normal resolution.")
            Wait(0)
        else
            Wait(5000)
        end
    end
end)

function drawCenteredText(text)
    SetTextFont(4)
    SetTextScale(0.0, 0.5)
    SetTextColour(255, 255, 255, 255)
    SetTextOutline()
    SetTextCentre(true)
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(0.5, 0.5)
end