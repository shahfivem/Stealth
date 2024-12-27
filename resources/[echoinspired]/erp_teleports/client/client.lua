local elevators = {
    menutype = "list",
    menulabel = "Available Lifts", 
    showBack = true,
    menu = {},
}

RegisterNetEvent("erp_teleports:callLift")
AddEventHandler("erp_teleports:callLift", function(liftName)
    local jobData = exports.qbx_core:GetGroups() -- Get the player's job data
    
    if not jobData or next(jobData) == nil then
        print("Error: No job data found for the player.")
        lib.notify({
			description = 'You are not authorized',
			type = 'error'
		})
        return
    end

    local canAccess = false
    if Config.Zones[liftName].job == 'all' then
        canAccess = true
    else
        for _, requiredJob in ipairs(Config.Zones[liftName].job) do
            if jobData[requiredJob] then  -- Check if the player has this job
                canAccess = true
                break
            end
        end
    end

    if canAccess then
        lib.notify({
			description = 'Authorized',
			type = 'success'
		})
        local heading = GetGameplayCamRelativeHeading()
        DoScreenFadeOut(1000)
        Wait(2000)
        SetEntityCoords(PlayerPedId(), type(Config.Zones[liftName].Spawn) == type({}) and Config.Zones[liftName].Spawn[1] or Config.Zones[liftName].Spawn)
        Wait(100)
        TriggerEvent('erp_teleports:setcoords', liftName)
        SetEntityHeading(PlayerPedId(), Config.Zones[liftName].Heading)
        SetGameplayCamRelativeHeading(heading)
        DoScreenFadeIn(1000)
    else
        lib.notify({
			description = 'You are not authorized',
			type = 'error'
		})
    end
end)



--
-- External Functions
--
exports( "checkLifts", function()

    local plyPos = GetEntityCoords( PlayerPedId() )

    for id, zone in pairs(Config.Zones) do

        if type(zone.Spawn) == type({}) then

            for i=1, #zone.Spawn do
                if #(zone.Spawn[i] - plyPos) < 2.0 then

                    elevators = { menutype = "list", menulabel = "Available Lifts", showBack = true, menu = {} }

                    for i=1, #zone.Access do
                        elevators.menu[i] = {label = Config.Zones[zone.Access[i]].Title, value = zone.Access[i]}
                    end

                    local unsorted = elevators.menu
                    table.sort(unsorted, function(a,b) return a.label < b.label end)
                    elevators.menu = unsorted

                    return true

                end

            end

        else

            if #(zone.Spawn - plyPos) < 2.0 then

                elevators = { menutype = "list", menulabel = "Available Lifts", showBack = true, menu = {} }

                for i=1, #zone.Access do
                    elevators.menu[i] = {label = Config.Zones[zone.Access[i]].Title, value = zone.Access[i]}
                end

                local unsorted = elevators.menu
                table.sort(unsorted, function(a,b) return a.label < b.label end)
                elevators.menu = unsorted

                return true

            end


        end

    end

    return false;

end)

exports('getLifts', function()
    return elevators
end)

AddEventHandler('fuel:findvehicle', function(toggle)

    if toggle then return end;

    elevators = {
        menutype = "list",
        menulabel = "Available Lifts", 
        showBack = true,
        menu = {},
    }
    
end)