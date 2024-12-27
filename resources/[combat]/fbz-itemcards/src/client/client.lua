local display = false
local openid = false

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end

RegisterNetEvent('fbz-flashable:client:DisplayCard')
AddEventHandler('fbz-flashable:client:DisplayCard', function(itemName)
    if display or openid then return end

    local ped = cache.ped
    local propname = "prop_cs_r_business_card"
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local prop = CreateObject(GetHashKey(propname), x, y, z + 0.2, true, true, true)
    local boneIndex = GetPedBoneIndex(ped, 28422)

    loadAnimDict("paper_1_rcm_alt1-9")
    AttachEntityToEntity(prop, ped, boneIndex, 0.12, 0.01, -0.06, -310.0, 10.0, 150.0, true, true, false, true, 1, true)
    TaskPlayAnim(ped, "paper_1_rcm_alt1-9", "player_one_dual-9", 3.0, -1, -1, 50, 0, false, false, false)

    Wait(3400)

    DeleteEntity(prop)
    ClearPedTasks(ped)

    if Shared.Items[itemName] then
        local item = Shared.Items[itemName]
        SendNUIMessage({
            action = 'show',
            image = item['metadata'] and item['metadata']['source-image'] or item['source-image'],
            title = item['title'],
            description = item['description']
        })
        SetNuiFocusKeepInput(true)
        SetNuiFocus(true, false)
        display = true
        openid = true
    end
end)


RegisterNetEvent('fbz-flashable:client:ShowNearby')
AddEventHandler('fbz-flashable:client:ShowNearby', function(source, itemName)
    if Shared.Items[itemName] then
        local item = Shared.Items[itemName]
        SendNUIMessage({
            action = 'show',
            image = item['source-image'],
            title = item['title'],
            description = item['description']
        })
    end
end)

RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false, false)
    TriggerServerEvent('fbz-flashable:client:CardClosed')
    display = false
    openid = false
    cb('ok')
end)