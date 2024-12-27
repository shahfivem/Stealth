function CreateMissionPed(missionName, data)
    lib.requestModel(data['ped'].model, 5000)
    local ped = CreatePed(0, data['ped'].model, data['ped'].coords.x, data['ped'].coords.y, data['ped'].coords.z,
        data['ped'].coords.w, false, false)
    while not DoesEntityExist(ped) do Wait(1) end
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetPedCanPlayAmbientAnims(ped, true)
    TaskStartScenarioInPlace(ped, data['ped'].scenario, 0, true)
    if Target =="ox" then
        exports.ox_target:addLocalEntity(ped, {
            label = data['target'].label,
            icon = data['target'].icon,
            iconColor = nil, -- Optional: Specify if you have an icon color
            distance = data['target'].distance,
            canInteract = function(entity, distance, coords, name, bone)
                local allowPass = false
                if not data['reward_type'].acceptAnyItem then
                    for k, v in pairs(data['requirement']) do
                        if CheckItem(v.item, v.amount) then
                            allowPass = true
                        end
                    end
                else
                    for k, v in pairs(data['requirement']) do
                        allowPass = false
                        if CheckItem(v.item, v.amount) then
                            allowPass = true
                            break -- Exit the loop early if any variation is found
                        end
                    end
                end
                if CurrentMission == nil then
                    allowPass = false
                end
                if not allowPass then
                    return false
                else
                    return CurrentMission['messages'].start.subject == Config.Missions[missionName]['messages'].start.subject and allowPass
                end
            end,
            onSelect = function()
                MissionData = {
                    mission = missionName,
                    requirement = data['requirement'],
                    reward_type = data['reward_type'],
                    reward = data['reward']
                }
                if Config.UpdateLoyalty == "top3" then
                    TriggerServerEvent('cb-gangsystem:server:CompleteMission', MissionData)
                elseif Config.UpdateLoyalty == "choose" then
                    TriggerEvent('cb-gangsystem:client:chooseLoyaltyMenu')
                else
                    TriggerServerEvent('cb-gangsystem:server:CompleteMission', MissionData)
                end
            end,
        })
    elseif Target =="qb" then
        exports["qb-target"]:AddTargetEntity(ped, {
            options = {
                {
                    label = data['target'].label,
                    icon = data['target'].icon,
                    action = function()
                        MissionData = {
                            mission = missionName,
                            requirement = data['requirement'],
                            reward_type = data['reward_type'],
                            reward = data['reward']
                        }
                        if Config.UpdateLoyalty == "top3" then
                            TriggerServerEvent('cb-gangsystem:server:CompleteMission', MissionData)
                        elseif Config.UpdateLoyalty == "choose" then
                            TriggerEvent('cb-gangsystem:client:chooseLoyaltyMenu')
                        else
                            TriggerServerEvent('cb-gangsystem:server:CompleteMission', MissionData)
                        end
                    end,
                    canInteract = function(entity, distance, coords, name, bone)
                        local allowPass = false
                        if not data['reward_type'].acceptAnyItem then
                            for k, v in pairs(data['requirement']) do
                                if CheckItem(v.item, v.amount) then
                                    allowPass = true
                                end
                            end
                        else
                            for k, v in pairs(data['requirement']) do
                                allowPass = false
                                if CheckItem(v.item, v.amount) then
                                    allowPass = true
                                    break -- Exit the loop early if any variation is found
                                end
                            end
                        end
                        if CurrentMission == nil then
                            allowPass = false
                        end
                        if not allowPass then
                            return false
                        else
                            return CurrentMission['messages'].start.subject == Config.Missions[missionName]['messages'].start.subject and allowPass
                        end
                    end
                }
            },
            distance = data['target'].distance,
        })
    end
    return ped
end

function CreateGangLeader(data)
    lib.requestModel(data.model, 5000)
    local ped = CreatePed(0, data.model, data.coords.x, data.coords.y, data.coords.z, data.coords.w, false, false)
    while not DoesEntityExist(ped) do Wait(1) end
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetPedCanPlayAmbientAnims(ped, true)
    TaskStartScenarioInPlace(ped, data.scenario, 0, true)
    if Config.UseBlip then
        local blip = AddBlipForEntity(ped)
        SetBlipSprite(blip, 88)
        SetBlipColour(blip, 1)
        SetBlipScale(blip, 1.0)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(data['blip'].name or "Franklin") -- Default to "Mission Ped" if not provided
        EndTextCommandSetBlipName(blip)
    end
    if Target =="qb" then
        exports['qb-target']:AddTargetEntity(ped, {
            options = {
                {
                    label = "Gang Menu",
                    icon = "fa-solid fa-bars",
                    action = function()
                        TriggerServerEvent('cb-gangsystem:server:RefreshGangMenu')
                    end,
                    canInteract = function()
                        PlayerData = GetPlayerData()
                        local gangTag = PlayerData.gang.name
                        if gangTag == "none" then
                            return false
                        else
                            return true
                        end
                    end
                },
                {
                    type = 'client',
                    action = function()
                        TriggerEvent('cb-gangsystem:client:CheckMission')
                    end,
                    label = "Check Mission",
                    icon = "fa-brands fa-angellist",
                    canInteract = function()
                        local allowed = lib.callback.await('cb-gangsystem:server:GetCurrentMission', false)
                        return allowed
                    end
                },
                {
                    label = 'Get Established',
                    icon = 'fa-brands fa-angellist',
                    action = function()
                        TriggerServerEvent('cb-gangsystem:server:HandOverItems')
                    end,
                    canInteract = function()
                        PlayerData = GetPlayerData()
                        local gangTag = PlayerData.gang.name
                        if gangTag == "none" or gangTag == nil then
                            return true
                        end
                    end
                },
            },
            distance = data.distance,
        })
    elseif Target =="ox" then
        exports.ox_target:addLocalEntity(ped, {
            {
                label = "Gang Menu",
                icon = "fa-solid fa-bars",
                onSelect = function()
                    TriggerServerEvent('cb-gangsystem:server:RefreshGangMenu')
                end,
                canInteract = function(entity, distance, coords, name, bone)
                    local PlayerData = GetPlayerData()
                    if PlayerData == nil then return end
                    local gangTag = PlayerData.gang.name
                    return gangTag ~= "none"
                end
            },
            {
                label = "Check Mission",
                icon = "fa-brands fa-angellist",
                onSelect = function()
                    TriggerEvent('cb-gangsystem:client:CheckMission')
                end,
                canInteract = function(entity, distance, coords, name, bone)
                    return lib.callback.await('cb-gangsystem:server:GetCurrentMission', false)
                end
            },
            {
                label = 'Get Established',
                icon = 'fa-brands fa-angellist',
                onSelect = function()
                    TriggerServerEvent('cb-gangsystem:server:HandOverItems')
                end,
                canInteract = function(entity, distance, coords, name, bone)
                    local PlayerData = GetPlayerData()
                    if PlayerData == nil then return end
                    local gangTag = PlayerData.gang.name
                    return gangTag == nil or gangTag == "none"
                end
            },
            distance = data.distance
        })
    end
    return ped
end

CreateThread(function()
    if Target =="qb" then
        exports['qb-target']:AddBoxZone("BlackMarketZone1", Config.BlackMarketCoords, 1, 1, {
            name = "BlackMarketZone1",
            heading = 0,
            minZ = Config.BlackMarketCoords.z - 1,
            maxZ = Config.BlackMarketCoords.z + 1,
            debugpoly = false,
        }, {
            options = {
                {
                    type = "client",
                    action = function()
                        TriggerEvent('cb-gangsystem:client:ConfirmBlackMarketAccess')
                    end,
                    canInteract = function()
                        PlayerData = GetPlayerData()
                        if PlayerData == nil then return end
                        local gangTag = PlayerData.gang.name
                        if gangTag == nil then
                            return true
                        end
                        if gangTag ~= "none" then
                            return true
                        else
                            return false
                        end
                    end,
                    label = "Black Market",
                    icon = "fa-solid fa-cart-shopping",
                },
            },
            distance = 2.5,
        })
    elseif Target =="ox" then
        if not UsingOxInventory then
            exports.ox_target:addBoxZone({
                name = "BlackMarketZone1",
                coords = Config.BlackMarketCoords,
                size = vec3(1, 1, 2), -- Size as vector3, assuming 1x1 and height of 2 units (minZ to maxZ)
                rotation = 0, -- Heading equivalent
                debug = false, -- Debug mode
                drawSprite = false, -- Optional: Set if you need to draw a sprite
                options = {
                    {
                        type = "client",
                        onSelect = function()
                            TriggerEvent('cb-gangsystem:client:ConfirmBlackMarketAccess')
                        end,
                        label = "Black Market",
                        icon = "fa-solid fa-cart-shopping",
                        canInteract = function(entity, distance, coords, name, bone)
                            local PlayerData = GetPlayerData()
                            if PlayerData == nil then return end
                            local gangTag = PlayerData.gang.name
                            return gangTag == nil or gangTag ~= "none"
                        end
                    }
                },
                distance = 2.5 -- Interaction distance
            })
        else
            exports.ox_target:addBoxZone({
                name = "checkLoyaltyTarget",
                coords = Config.BlackMarketCoords,
                size = vec3(1, 2, 2), -- Size as vector3, assuming 1x2 units and height of 2 units (minZ to maxZ)
                rotation = 0, -- Heading equivalent
                debug = false, -- Debug mode
                drawSprite = false, -- Optional: Set if you need to draw a sprite
                options = {
                    {
                        type = "client",
                        onSelect = function()
                            TriggerEvent('cb-gangsystem:client:ConfirmBlackMarketAccess')
                        end,
                        label = "Black Market",
                        icon = "fa-solid fa-cart-shopping",
                        canInteract = function(entity, distance, coords, name, bone)
                            local PlayerData = GetPlayerData()
                            if PlayerData == nil then return end
                            local gangTag = PlayerData.gang.name
                            return gangTag == nil or gangTag ~= "none"
                        end
                    }
                },
                distance = 2.5 -- Interaction distance
            })
        end
    end

    if Config.BlueprintCrafting and not Config.UseDrawTextBlueprints then
        if Target == "qb" then
            for k, v in pairs(Config.BlueprintCraftingLocations) do
                exports['qb-target']:AddBoxZone(v.name .. "_crafting", v.coords, 2, 2, {
                    name = v.name .. "_crafting",
                    heading = 0,
                    minZ = v.coords.z - 1,
                    maxZ = v.coords.z + 1,
                    debugpoly = false,
                }, {
                    options = {
                        {
                            type = "client",
                            action = function()
                                GangTableMenu("Blueprint")
                            end,
                            icon = v.icon,
                            label = v.label,
                            canInteract = function()
                                local PlayerData = GetPlayerData()
                                if PlayerData == nil then return end
                                local gangTag = PlayerData.gang.name
                                if gangTag == "none" then
                                    return false
                                elseif gangTag ~= "none" then
                                    return true
                                end
                            end,
                        },
                    },
                    distance = 2.5,
                })
            end
        elseif Target == "ox" then
            for k, v in pairs(Config.BlueprintCraftingLocations) do
                exports.ox_target:addBoxZone({
                    name = v.name .. "_crafting",
                    coords = v.coords,
                    size = vec3(2, 2, 2), -- Size as vector3, assuming 1x1 and height of 2 units (minZ to maxZ)
                    rotation = 0, -- Heading equivalent
                    debug = false, -- Debug mode
                    drawSprite = false, -- Optional: Set if you need to draw a sprite
                    options = {
                        {
                            type = "client",
                            onSelect = function()
                                GangTableMenu("Blueprint")
                            end,
                            icon = v.icon,
                            label = v.label,
                            canInteract = function(entity, distance, coords, name, bone)
                                local PlayerData = GetPlayerData()
                                if PlayerData == nil then return end
                                local gangTag = PlayerData.gang.name
                                if gangTag == "none" then
                                    return false
                                elseif gangTag ~= "none" then
                                    return true
                                end
                            end
                        }
                    },
                    distance = 2.5 -- Interaction distance
                })
            end
        end
    end
end)

RegisterNetEvent('cb-gangsystem:client:leaderZoneTarget')
AddEventHandler('cb-gangsystem:client:leaderZoneTarget', function()
    if Target =="qb" then
        exports['qb-target']:AddBoxZone("ExitLeaderZone", Config.Bodyguard.insideCoords, 1, 1, {
            name = "ExitLeaderZone",
            heading = 0,
            minZ = Config.Bodyguard.insideCoords.z - 1,
            maxZ = Config.Bodyguard.insideCoords.z + 1,
            debugpoly = false,
        }, {
            options = {
                {
                    type = "client",
                    action = function()
                        local coords = Config.Bodyguard.outsideCoords
                        DoScreenFadeOut(500)
                        Wait(1000)
                        SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, false, false, false, false)
                        DoScreenFadeIn(500)
                    end,
                    label = "Exit Bunker",
                    icon = "fa-sharp fa-solid fa-arrow-up-from-bracket",
                },
            },
            distance = 2.5,
        })
    elseif Target =="ox" then
        exports.ox_target:addBoxZone({
            name = "ExitLeaderZone",
            coords = Config.Bodyguard.insideCoords,
            size = vec3(1, 1, 2), -- Size as vector3, assuming 1x1 and height of 2 units (minZ to maxZ)
            rotation = 0, -- Heading equivalent
            debug = false, -- Debug mode
            drawSprite = false, -- Optional: Set if you need to draw a sprite
            options = {
                {
                    type = "client",
                    onSelect = function()
                        local coords = Config.Bodyguard.outsideCoords
                        DoScreenFadeOut(500)
                        Wait(1000)
                        SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, false, false, false, false)
                        DoScreenFadeIn(500)
                    end,
                    label = "Exit Bunker",
                    icon = "fa-sharp fa-solid fa-arrow-up-from-bracket"
                }
            },
            distance = 2.5 -- Interaction distance
        })
    end
end)

RegisterNetEvent('cb-gangsystem:client:bodyguardTarget')
AddEventHandler('cb-gangsystem:client:bodyguardTarget', function(ped)
    if Target =="qb" then
        exports['qb-target']:AddTargetEntity(ped, {
            options = {
                {
                    action = function()
                        TriggerServerEvent('cb-gangsystem:server:CheckForWeapons')
                    end,
                    icon = Config.Bodyguard.icon,
                    label = Config.Bodyguard.label,
                    canInteract = function()
                        return not LocalPlayer.state.isEscorting
                    end,
                }
            },
            distance = 2
        })
    elseif Target =="ox" then
        exports.ox_target:addLocalEntity(ped, {
            icon = Config.Bodyguard.icon,
            label = Config.Bodyguard.label,
            distance = 2,
            canInteract = function()
                return not LocalPlayer.state.isEscorting
            end,
            onSelect = function()
                TriggerServerEvent('cb-gangsystem:server:CheckForWeapons')
            end,
        })
    end
end)

RegisterNetEvent('cb-gangsystem:client:checkLoyaltyTarget')
AddEventHandler('cb-gangsystem:client:checkLoyaltyTarget', function()
    if Target =="qb" then
        exports['qb-target']:AddBoxZone("checkLoyaltyTarget", Config.CheckLoyaltyTarget.coords, Config.CheckLoyaltyTarget.length, Config.CheckLoyaltyTarget.width, {
            name = "checkLoyaltyTarget",
            heading = Config.CheckLoyaltyTarget.heading,
            minZ = Config.CheckLoyaltyTarget.coords.z - 1,
            maxZ = Config.CheckLoyaltyTarget.coords.z + 1,
            debugpoly = Config.CheckLoyaltyTarget.debug,
        }, {
            options = {
                {
                    type = 'server',
                    action = function()
                        local PlayerData = GetPlayerData()
                        if PlayerData == nil then return end
                        local src = PlayerData.source
                        TriggerServerEvent('cb-gangsystem:server:checkLoyalty', src, "target")
                    end,
                    label = 'Check Loyalty',
                    icon = 'fa-solid fa-heart',
                    canInteract = function()
                        local PlayerData = GetPlayerData()
                        if PlayerData == nil then return end
                        local gangTag = PlayerData.gang.name
                        if gangTag == "none" then
                            return false
                        elseif gangTag ~= "none" then
                            return true
                        end
                    end
                }
            },
            distance = Config.CheckLoyaltyTarget.distance,
        })
    elseif Target =="ox" then
        exports.ox_target:addBoxZone({
            name = "checkLoyaltyTarget",
            coords = Config.CheckLoyaltyTarget.coords,
            size = vec3(Config.CheckLoyaltyTarget.length, Config.CheckLoyaltyTarget.width, Config.CheckLoyaltyTarget.height), -- Size as vector3, assuming 1x2 units and height of 2 units (minZ to maxZ)
            rotation = Config.CheckLoyaltyTarget.heading, -- Heading equivalent
            debug = Config.CheckLoyaltyTarget.debug, -- Debug mode
            options = {
                {
                    type = "server",
                    onSelect = function()
                        local PlayerData = GetPlayerData()
                        if PlayerData == nil then return end
                        local src = PlayerData.source
                        TriggerServerEvent('cb-gangsystem:server:checkLoyalty', src, "target")
                    end,
                    label = "Check Loyalty",
                    icon = "fa-solid fa-heart",
                    canInteract = function(entity, distance, coords, name, bone)
                        local PlayerData = GetPlayerData()
                        if PlayerData == nil then return end
                        local gangTag = PlayerData.gang.name
                        return gangTag ~= "none"
                    end
                }
            },
            distance = Config.CheckLoyaltyTarget.distance,
        })
    end
end)

-- TODO: Fix that Check Loyalty target and the way its written in the config. Could be better