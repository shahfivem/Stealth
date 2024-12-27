-- List of door IDs to be locked or unlocked
local doors = {
    1037,
    1038,
    1039,
    1040,
    1041,
    1042,
    1043,
}

-- Event handler to lock doors
RegisterNetEvent('hospital:lockdoors', function()
    for _, doorId in ipairs(doors) do
        exports.ox_doorlock:setDoorState(doorId, true) -- Lock the door
    end
    print('Hospital lockdown initiated.')
end)

-- Event handler to unlock doors
RegisterNetEvent('hospital:unlockdoors', function()
    for _, doorId in ipairs(doors) do
        exports.ox_doorlock:setDoorState(doorId, false) -- Unlock the door
    end
    print('Hospital lockdown lifted.')
end)


RegisterNetEvent('erp-scripts:applySubmix', function(state)
    local src = source
    if not src then return end

    -- Ensure the client requesting has proper permissions if needed
    if state then
        -- Apply the submix filter to the player's audio
        MumbleSetSubmixForServerId(src, Microphones.submixFilter)
        print(('Submix applied to player: %s'):format(src))
    else
        -- Remove the submix filter from the player's audio
        MumbleSetSubmixForServerId(src, -1)
        print(('Submix removed from player: %s'):format(src))
    end
end)