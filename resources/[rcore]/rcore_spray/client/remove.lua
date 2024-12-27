local IsCurrentlyRemoving = false

RegisterNetEvent('rcore_spray:removeClosestSpray')
AddEventHandler('rcore_spray:removeClosestSpray', function()
    if IsCurrentlyRemoving then return end

    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)

    local closestSprayLoc = nil
    local closestSprayDist = nil

    local dist = 'timetable@maid@cleaning_window@idle_a'
    local name = 'idle_a'

    for _, spray in pairs(SPRAYS) do
        local sprayPos = spray.location
        local dist = #(sprayPos - coords)

        if dist < 3.0 and (not closestSprayDist or closestSprayDist > dist) then
            closestSprayLoc = sprayPos
            closestSprayDist = dist
        end
    end

    if closestSprayLoc then

        local ragProp = CreateSprayRemoveProp(ped)
        IsCurrentlyRemoving = true

        local isFinished = exports["erp_progressbar"]:taskBar({ 
            length = Config.SPRAY_REMOVE_DURATION, 
            text = 'Cleaning', 
            runcheck = false, 
            ignoreclear = true,
            keepweapon = false,
            vehicle = false,
            distcheck = 1.0,
            animation = { dict = dist, anim = name, stuck = true }
        }) == 100

        IsCurrentlyRemoving = false
        RemoveSprayRemoveProp(ragProp)

        if not isFinished then return end
        TriggerServerEvent('rcore_spray:remove', closestSprayLoc)

    else
        exports['erp_notifications']:SendAlert('inform', 'No spray nearby')
    end
end)

function CreateSprayRemoveProp(ped)
    local ragProp = CreateObject(
        `p_loose_rag_01_s`, --`prop_ecola_can`,
        0.0, 0.0, 0.0,
        true, false, false
    )

    AttachEntityToEntity(ragProp, ped, GetPedBoneIndex(ped, 28422), x, y, z, ax, ay, az, true, true, false, true, 1, true)

    return ragProp
end

function RemoveSprayRemoveProp(ent)
    if NetworkGetEntityOwner(ent) ~= PlayerId() then
        NetworkRequestControlOfEntity(ent)
        Wait(500)
    end

    DeleteEntity(ent)
end