local function setPlayerPosition(coords)
    local ped = cache.ped
    SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z)
    SetEntityHeading(ped, coords.w or coords.a or coords.h or GetEntityHeading(cache.ped))
    FreezeEntityPosition(ped, false)
end

local function destroyCamera()
    DestroyStableCam(true)
    DestroyCoordsCam(true)
end

local function setPlace(data)
    if ForceDeadPedLastLocation() then return end

    local placeType = data.place
    if placeType == 'lastloc' then
        setPlayerPosition(GetLastLocation())
        OnPlayerLoaded()
        InsideHouseorApartments()
    elseif placeType == 'coords' then
        setPlayerPosition(GetEntityCoords(cache.ped))
        OnPlayerLoaded(true)
    elseif placeType == 'properties' then
        OnPlayerLoaded()
        if data.id ~= nil then
            if GetResourceState('ps-housing') == 'started' then
                TriggerServerEvent('ps-housing:server:enterProperty', tostring(data.type), data.id, 'spawn')
            elseif GetResourceState('qbx_properties') == 'started' then
                TriggerServerEvent('qbx_properties:server:enterProperty', { id = data.id, isSpawn = true })
            elseif GetResourceState('bcs_housing') == 'started' then
                TriggerEvent('Housing:client:EnterHome', data.id)
            else
                TriggerEvent("qb-apartments:client:LastLocationHouse", data.type, data.id)
            end
            Debug('Apartments: | Properties Name: ' .. data.id .. ' | | ' .. 'Properties Type:' .. data.type)
        else
            if GetResourceState('ps-housing') == 'started' then
                TriggerServerEvent('ps-housing:server:enterProperty', tostring(data.type), 'spawn')
            elseif GetResourceState('qbx_properties') == 'started' then
                TriggerServerEvent('qbx_properties:server:enterProperty', { id = data.type, isSpawn = true })
            elseif GetResourceState('bcs_housing') == 'started' then
                TriggerEvent('Housing:client:EnterHome', data.type)
            else
                TriggerEvent('qb-houses:client:LastLocationHouse', data.type)
            end
            Debug('Houses: | Properties Name: ' .. data.type)
        end
        Wait(500)
    elseif placeType == 'bookmarks' then
        setPlayerPosition(data.coords)
        OnPlayerLoaded(true)
    elseif placeType == 'rentApartment' then
        OnPlayerLoaded()
        if GetResourceState('ps-housing') == 'started' then
            TriggerServerEvent('ps-housing:server:createNewApartment', data.label)
        elseif GetResourceState('qbx_properties') == 'started' then
            TriggerServerEvent('qbx_properties:server:apartmentSelect', tonumber(data.type))
        elseif GetResourceState('bcs_housing') == 'started' then
            TriggerServerEvent("Housing:server:CreateApartment", data.type)
        else
            TriggerServerEvent("apartments:server:CreateApartment", data.type, data.label, true, true)
        end
        Debug('Rent Apartment: ' .. data.type)
    end
end

RegisterNUICallback('spawn', function(data, cb)
    local place = data.place
    CloseNui(place)
    DoScreenFadeOut(250)
    Wait(500)
    destroyCamera()
    setPlace(data)
    Debug('Location: ' .. place .. ' Spawned')
    Wait(500)
    DoScreenFadeIn(1000)
    um.hud(false)
    if place ~= 'properties' and place ~= 'rentApartment' then
        MoveToPlayerFromSky()
    end
    cb(1 or 'ok')
end)

function ForceDeadPedLastLocation()
    if not um.main.forceDeadPedLastLocation then return false end

    local player = GetPlayerDataQB()
    local isDead, lastStand = player?.metadata.isdead, player?.metadata.inlaststand
    Debug('ForceDeadPedLastLocation | ' .. tostring(isDead) .. ' | ' .. tostring(lastStand))

    if isDead or lastStand then
        setPlayerPosition(GetLastLocation())
        OnPlayerLoaded()
        InsideHouseorApartments()
        return true
    end

    return false
end
