local localScene = -1
local fatigue = GetResourceKvpInt('fatigue') or 0

local function isBusy(coords, distance, v)
    local players = lib.getNearbyPlayers(coords, distance + 0.2, false)
    local busy = false
    for i = 1, #players do
        if IsEntityPlayingAnim(players[i].ped, v.animDict, v.animClip, 3) or IsEntityPlayingAnim(players[i].ped, v.enter, 'enter', 3) or IsEntityPlayingAnim(players[i].ped, v.exit, 'exit', 3) then
            busy = true
            break
        end
    end
    return busy
end

for _, position in pairs(GymBlips) do
    lib.blip.coords({
		coords = position,
		sprite = 311,
		scale = 0.7,
		name = 'Gym',
		group = 'Recreational'
	})
end

-- tried to make this as modular as possible without duplicate code, R* animation team had different plans.
for k, v in pairs(GymPoints) do
    for i = 1, #v.points do
        local point = lib.points.new({
            coords = v.points[i].xyz,
            distance = 1.6,
            scene = 0,
            objects = {},
            objectNetIds = {},
            animCoord = v.points[i].xyz,
            animRot = v.points[i].w,
        })

        function point:onEnter()
            exports['erp_prompts']:showPrompt({ pressText = 'Press E', text = v.textPrompt })
        end

        function point:onExit()
            exports['erp_prompts']:hidePrompt()
        end

        function point:nearby()
            local coords = v.usePlayerCoords and GetEntityCoords(cache.ped) or self.animCoord
            local heading = self.animRot or GetEntityHeading(cache.ped)
            heading = v.rotateHeading and heading + 180 or heading
            local animCoord
            local animRot
            if IsControlJustReleased(0, 38) and not IsSynchronizedSceneRunning(localScene) then
                if isBusy(self.coords, self.distance, v) then lib.notify('Someone is already working out here') return end
                for o = 1, #v.objects do
                    local object = v.objects[o]
                    local model = GetHashKey(object.model)
                    lib.requestModel(model, 6000)
                    self.objects[o] = CreateObject(model, coords.x, coords.y, coords.z, true, false, false)
                    AttachEntityToEntity(self.objects[o], cache.ped, GetPedBoneIndex(cache.ped, object.bone), object.coords.x, object.coords.y, object.coords.z, object.rotation.x, object.rotation.y, object.rotation.z, true, true, false, false, 2, true)
                    SetModelAsNoLongerNeeded(model)
                    self.objectNetIds[o] = NetworkGetNetworkIdFromEntity(self.objects[o])
                end
                if #self.objectNetIds > 0 then
                    TriggerServerEvent('echo_gym:server:exerciseObjects', self.objectNetIds)
                end
                if v.enter then
                    lib.requestAnimDict(v.enter, 6000)
                    if v.exit == 'amb@prop_human_seat_muscle_bench_press@enter' then v.zOffset = 0.0 end
                    animCoord = GetAnimInitialOffsetPosition(v.enter, 'enter', coords.x, coords.y, coords.z - v.zOffset, 0.0, 0.0, heading, 0.0, 2)
                    animRot = GetAnimInitialOffsetRotation(v.enter, 'enter', coords.x, coords.y, coords.z - v.zOffset, 0.0, 0.0, heading, 0.0, 2)
                    local enterScene = NetworkCreateSynchronisedScene(animCoord.x, animCoord.y, animCoord.z, animRot.x, animRot.y, animRot.z, 2, true, false, 1.0, 0.0, 1.0)
                    NetworkAddPedToSynchronisedScene(cache.ped, enterScene, v.enter, 'enter', 8.0, -8.0, 0, 0, 1000.0, 0)
                    NetworkStartSynchronisedScene(enterScene)
                    RemoveAnimDict(v.enter)
                    Wait(50)
                    while GetSynchronizedScenePhase(NetworkGetLocalSceneFromNetworkId(enterScene)) < 0.99 do Wait(0) end
                end
                lib.requestAnimDict(v.animDict, 6000)
                if v.animDict == 'amb@prop_human_seat_muscle_bench_press@idle_a' then
                    v.zOffset = 0.0
                    heading = heading + 180
                    coords = GetEntityCoords(cache.ped)
                    heading = GetEntityHeading(cache.ped)
                end
                if v.animDict == 'amb@prop_human_muscle_chin_ups@male@base' then coords = GetEntityCoords(cache.ped) + vector3(0, 0, 0.12) end
                animCoord = GetAnimInitialOffsetPosition(v.animDict, v.animClip, coords.x, coords.y, coords.z - v.zOffset, 0.0, 0.0, heading, 0.0, 2)
                animRot = GetAnimInitialOffsetRotation(v.animDict, v.animClip, coords.x, coords.y, coords.z - v.zOffset, 0.0, 0.0, heading, 0.0, 2)
                self.scene = NetworkCreateSynchronisedScene(animCoord.x, animCoord.y, animCoord.z - v.zOffset, animRot.x, animRot.y, animRot.z, 2, false, true, 1.0, 0.0, 0.0)
                NetworkAddPedToSynchronisedScene(cache.ped, self.scene, v.animDict, v.animClip, 8.0, -8.0, 0, 0, 1000.0, 0)
                NetworkStartSynchronisedScene(self.scene)
                RemoveAnimDict(v.animDict)
                Wait(50)
                localScene = NetworkGetLocalSceneFromNetworkId(self.scene)
                CreateThread(function() -- this is a second thread that gets ran alongside the ox_lib nearby thread. We control fatigue and animation speed here.
                    local animSpeed = 0.0
                    while IsSynchronizedSceneRunning(localScene) do
                        local skillbar =  exports.erp_skillcheck:taskBar(math.random(1000, 2000), math.random(8, 12))
                        fatigue = fatigue + math.random(3, 10) / 10
                        if fatigue > 100 then fatigue = 100 end
                        if skillbar == 100 then
                            animSpeed = animSpeed + 0.1
                            if animSpeed > 1.0 then animSpeed = 1.0 end
                            if fatigue <= math.random(0, 100) then -- the more fatigue you have, the less chance this tick gets triggered.
                                TriggerServerEvent('echo_gym:server:exerciseTick', k)
                            end
                        else
                            animSpeed = animSpeed - 0.1
                            if animSpeed < 0.0 then animSpeed = 0.0 end
                        end
                        if fatigue >= math.random(0, 100) then
                            ShakeGameplayCam('HAND_SHAKE', 0.0)
                            SetGameplayCamShakeAmplitude(fatigue / 100)
                            if 6 >= math.random(0, 10) then -- screen blur is completely random
                                TriggerScreenblurFadeIn(6000)
                            else
                                TriggerScreenblurFadeOut(6000)
                            end
                        end
                        SetSynchronizedSceneRate(localScene, animSpeed)
                        if #(GetEntityCoords(cache.ped) - self.coords) > 6.0 then -- if the player somehow gets away from the point (someone cuffs him or admin tp), cleanup the game
                            exports.erp_skillcheck:closeGui()
                            NetworkStopSynchronisedScene(self.scene)
                            for o = 1, #self.objects do
                                if DoesEntityExist(self.objects[o]) then
                                    DeleteEntity(self.objects[o])
                                end
                            end
                            break
                        end
                        Wait(0)
                    end
                    Wait(3000)
                    StopGameplayCamShaking(false)
                    while IsScreenblurFadeRunning() do Wait(250) end
                    TriggerScreenblurFadeOut(15000)
                end)
            end
            if IsControlJustReleased(0, 202) and IsSynchronizedSceneRunning(localScene) then
                exports.erp_skillcheck:closeGui()
                if v.exit then
                    lib.requestAnimDict(v.exit, 6000)
                    if v.exit == 'amb@prop_human_seat_muscle_bench_press@exit' then coords = GetEntityCoords(cache.ped) end
                    if v.exit == 'amb@prop_human_muscle_chin_ups@male@exit' then heading = heading + 180 end
                    animCoord = GetAnimInitialOffsetPosition(v.exit, 'exit', coords.x, coords.y, coords.z - v.zOffset, 0.0, 0.0, heading + 180, 0.0, 2)
                    animRot = GetAnimInitialOffsetRotation(v.exit, 'exit', coords.x, coords.y, coords.z - v.zOffset, 0.0, 0.0, heading + 180, 0.0, 2)
                    local exitScene = NetworkCreateSynchronisedScene(animCoord.x, animCoord.y, animCoord.z, animRot.x, animRot.y, animRot.z, 2, false, false, 1.0, 0.0, 1.0)
                    NetworkAddPedToSynchronisedScene(cache.ped, exitScene, v.exit, 'exit', 8.0, -8.0, 0, 0, 1000.0, 0)
                    NetworkStartSynchronisedScene(exitScene)
                    -- stopping this twice because of issues with hiding the skillcheck and getting the anim offset blah blah
                    NetworkStopSynchronisedScene(self.scene)
                    RemoveAnimDict(v.exit)
                    Wait(50)
                    while GetSynchronizedScenePhase(NetworkGetLocalSceneFromNetworkId(exitScene)) < 0.99 do Wait(0) end
                    if v.exit == 'amb@world_human_sit_ups@male@exit' then Wait(50) SetEntityHeading(cache.ped, heading) end
                end
                NetworkStopSynchronisedScene(self.scene)
                for o = 1, #self.objects do
                    if DoesEntityExist(self.objects[o]) then
                        DeleteEntity(self.objects[o])
                    end
                end
            end
        end
    end
end

local currentSkills = {}
CreateThread(function()
    while true do
        if not IsSynchronizedSceneRunning(localScene) then -- if we aren't working out we lower the fatigue
            fatigue = fatigue - 1
            if fatigue < 0 then fatigue = 0 end
        end
        SetResourceKvpInt('fatigue', fatigue) -- we save this to stop people from simply disconnecting to reset their fatigue
        local skills = lib.callback.await('echo_gym:callback:getSkills', 15000) -- only gets called every 15 seconds. So skills only apply when this returns something
        if skills then
            currentSkills = skills
            StatSetInt('MP0_STRENGTH', math.floor((skills.arms + skills.core) / 2), true)
            -- We use 0.35 here since everyone has this default value defined in erp-scripts. Also s_m_y_prismuscl_01 has a different value as well.
            if GetEntityModel(cache.ped) ~= joaat('s_m_y_prismuscl_01') then
                SetWeaponDamageModifier(`WEAPON_UNARMED`, math.max(0.35, ((skills.arms + skills.core) / 2) / 100))
            end
            StatSetInt('MP0_STAMINA', math.floor((skills.legs + skills.core) / 2), true)
            StatSetInt('MP0_LUNG_CAPACITY', math.floor((skills.legs + skills.core) / 2), true)
            StatSetInt('MP0_SHOOTING_ABILITY', math.floor((skills.back + skills.core + skills.arms) / 3), true) -- preferably also edit echo_combat
        end
        Wait(5000)
    end
end)

-- Server-side: Register the getSkills callback
lib.callback.register('echo_gym:callback:getSkills', function(source)
    -- Placeholder: Retrieve player's skill levels from your data storage
    local playerSkills = {
        arms = 50,    -- Default skill level for arms (replace this with your logic)
        core = 50,    -- Default skill level for core
        legs = 50,    -- Default skill level for legs
        back = 50     -- Default skill level for back
    }

    -- Example: Fetch skills from a database or server cache here
    -- Replace the logic below with your actual implementation
    local playerId = source
    -- For example, retrieve skills from a database if stored:
    -- local result = MySQL.query.await('SELECT * FROM player_skills WHERE playerId = ?', {playerId})
    -- if result and result[1] then
    --     playerSkills.arms = result[1].arms
    --     playerSkills.core = result[1].core
    --     playerSkills.legs = result[1].legs
    --     playerSkills.back = result[1].back
    -- end

    return playerSkills -- Return the skill levels to the client
end)


AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    local point = lib.points.getClosestPoint()
    if not point then return end
    if IsSynchronizedSceneRunning(localScene) then
        NetworkStopSynchronisedScene(point.scene)
    end
    for i = 1, #point.objects do
        if DoesEntityExist(point.objects[i]) then
            DeleteEntity(point.objects[i])
        end
    end
end)

exports('getSkills', function()
    return currentSkills
end)

AddScenarioBlockingArea(-1206.92, -1548.17, 3.02, -1195.28, -1591.61, 13.03, false, true, true, false)

RegisterCommand('gym', function ()
    TriggerEvent('general:checkGymStats')
end)

AddEventHandler('general:checkGymStats', function()
    lib.registerContext({
        id = 'gym_stats',
        title = 'Gym Stats',
        options = {
            {
                title = 'Core',
                progress = currentSkills.core or 0,
                readOnly = true,
                colorScheme = 'green.7'
            },
            {
                title = 'Arms',
                progress = currentSkills.arms or 0,
                readOnly = true,
                colorScheme = 'green.7'
            },
            {
                title = 'Legs',
                progress = currentSkills.legs or 0,
                readOnly = true,
                colorScheme = 'green.7'
            },
            {
                title = 'Back',
                progress = currentSkills.back or 0,
                readOnly = true,
                colorScheme = 'green.7'
            },
            {
                title = 'Chest',
                progress = currentSkills.chest or 0,
                readOnly = true,
                colorScheme = 'green.7'
            },
            {
                title = 'Fatigue',
                progress = fatigue,
                readOnly = true,
                colorScheme = 'red.7'
            }
        }
    })
    lib.showContext('gym_stats')
end)

local gymItems = { 'preworkout', 'proteinshake' }
local itemFunction = {
    ['preworkout'] = function()
        for _ = 1, 50 do
            fatigue = fatigue - 1
            if fatigue < 0 then fatigue = 0 end
            Wait(2000)
        end
    end,
    ['proteinshake'] = function()

    end
}

for i = 1, #gymItems do
    local item = gymItems[i]
    AddEventHandler(('%s:used'):format(item), function(data)
        local result = lib.callback.await('echo_gym:callback:usedItem', false, item)
        if not result then lib.notify('You can only use this once.') return end

        local label = exports.erp_inventory:getItemLabel(item)
        local success = exports.erp_progressbar:taskBar({
            length = 6000,
            text = ('Using %s'):format(label),
            animation = { dict = "mp_player_intdrink", anim = "loop" }
        }) == 100
        if not success then return end

        local hasItem = exports.erp_inventory:hasItem(item, 1, data.slot)
        if not hasItem then
            lib.notify('You no longer have this item')
            return
        end

        TriggerServerEvent('erp_inventory:removeItem', item, 1, data.slot)

        itemFunction[item]()
    end)
end


-- Register a client-side event to trigger a notification
RegisterNetEvent('echo_gym:client:notify')
AddEventHandler('echo_gym:client:notify', function(data)
    -- Make sure the data is in the correct format and trigger the notification
    if data then
        lib.notify({
            description = data.description,
            type = data.type or 'inform',  -- Default type is 'inform'
            duration = data.duration or 3000  -- Default duration is 3000ms (3 seconds)
        })
    else
        print("Invalid notification data received.")
    end
end)

