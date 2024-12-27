
local IsCancelled = false

Citizen.CreateThread(function()
    AddTextEntry('RC_CANCEL', "~" .. Config.Keys.CANCEL.label .. "~ " .. Config.Text.CANCEL)
end)

function LoadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 100 )
    end
end

local IsCancelled = false

Citizen.CreateThread(function()
    AddTextEntry('RC_CANCEL', "~" .. Config.Keys.CANCEL.label .. "~ " .. Config.Text.CANCEL)
end)

function LoadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(100)
    end
end

function CancellableProgress(time, animDict, animName, flag, finish, cancel, opts)
    IsCancelled = false
    local ped = PlayerPedId()

    if not opts then opts = {} end

    if animDict then
        LoadAnimDict(animDict)
        TaskPlayAnim(ped, animDict, animName, opts.speedIn or 1.0, opts.speedOut or 1.0, -1, flag, 0, 0, 0, 0)
    end

    -- Replace internal progress bar with your custom progress bar export
    local isFinished = lib.progressBar({
        duration = time,
        label = animDict == 'timetable@maid@cleaning_window@idle_a' and 'Cleaning' or 'Spraying',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            combat = true,
            movement = true,
        },
        anim = {
            dict = animDict,
            clip = animName
        },
        prop = {
            model = `prop_paint_spray01b`,
            pos = vec3(0.03, 0.03, 0.02),
            rot = vec3(0.0, 0.0, -1.5)
        },
    })

    -- Monitor for cancel input
    while not IsCancelled and not isFinished do
        Citizen.Wait(0)

        DisableControlAction(0, Config.Keys.CANCEL.code, true)
        DisplayHelpTextThisFrame('RC_CANCEL', true)

        if IsControlPressed(0, Config.Keys.CANCEL.code) or IsDisabledControlPressed(0, Config.Keys.CANCEL.code) then
            IsCancelled = true
        end

        -- Reapply the animation if it's interrupted
        if not IsEntityPlayingAnim(ped, animDict, animName, 3) then
            TaskPlayAnim(ped, animDict, animName, opts.speedIn or 1.0, opts.speedOut or 1.0, -1, flag, 0, 0, 0, 0)
        end
    end

    -- Handle cancellation
    if IsCancelled then
        ClearPedTasksImmediately(ped)
        if cancel then
            cancel()
        end
        return
    end

    -- Stop the animation when finished
    if animDict then
        StopAnimTask(ped, animDict, animName, 1.0)
    end

    if finish then
        finish()
    end
end


function StartCancellableProgressBar(time)
    IsProgressbarDisplayed = true
    local maxProgressWidth = 0.2
    local curProgressWidth = 0.0

    FreezeEntityPosition(PlayerPedId(), true)

    local border = 0.007
    time = time / 1000

    local distFromTop = 0.91

    Citizen.CreateThread(function()
        while IsProgressbarDisplayed and curProgressWidth < 1.0 do
            Wait(0)

            curProgressWidth = curProgressWidth + (GetFrameTime()/time)

            DrawRect(
                0.5, distFromTop, 
                maxProgressWidth, 0.05, 
                0, 0, 0, 200
            )
            
            DrawRect(
                0.5, distFromTop-0.0005, 
                maxProgressWidth * curProgressWidth * 0.999, 0.05 - border, 
                0, 255, 255, 200
            )

            SetTextFont(0)
            SetTextScale(0.0, 0.4)
            SetTextColour(255, 255, 255, 255)
            SetTextDropshadow(0, 0, 0, 0, 255)
            SetTextDropShadow()
            SetTextOutline()
            SetTextJustification(0)
            SetTextEntry("RC_CF_FIXING")
            DrawText(0.5, 0.883)
        end
        IsProgressbarDisplayed = false
        FreezeEntityPosition(PlayerPedId(), false)
    end)
end

function StopCancellableProgressBar()
    IsProgressbarDisplayed = false
end
