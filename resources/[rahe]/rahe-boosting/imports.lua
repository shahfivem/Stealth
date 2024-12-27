local isServer = IsDuplicityVersion()
local appId = 'rahe-boosting'

if isServer then
    CreateThread(function()
        while GetResourceState("fd_laptop") ~= "started" do
            Wait(500)
        end

        local added, errorMessage = exports.fd_laptop:addCustomApp({
            id = appId,
            name = "Boosting",
            isDefaultApp = true,
            needsUpdate = false,
            icon = 'boosting.svg',
            ui = ("https://cfx-nui-%s/tablet/nui/index.html"):format(GetCurrentResourceName()),
            deviceId = 'boosting_device',
            keepAlive = true,
            ignoreInternalLoading = true,
            windowActions = {
                isResizable = false,
                isMaximizable = false,
                isClosable = true,
                isMinimizable = true,
                isDraggable = false
            },
            windowDefaultStates = {
                isMaximized = true,
                isMinimized = false
            },
            onUseServer = function(source)
                SetTimeout(1000, function()
                    TriggerClientEvent("rahe-boosting:client:openTablet", source)
                end)
            end,
        })

        if not added then
            print("Could not add app:", errorMessage)
        end
    end)
end

if not isServer then
    function SetNuiFocus(hasCursor, disableInput) end

    function SendNUIMessage(data)
        if data.action == 'showMenu' or data.action == 'hideMenu' then
            return
        end

        exports.fd_laptop:sendAppMessage(appId, data)
    end
end
