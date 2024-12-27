if not GetResourceState('qb-inventory'):find('start') then return end

SetTimeout(0, function()
    function bridge.hasItem(item, amount)
        if not LocalPlayer.state['isLoggedIn'] then return false end

        local count = exports['qb-inventory']:HasItem(item, amount)

        return count
    end
end)
