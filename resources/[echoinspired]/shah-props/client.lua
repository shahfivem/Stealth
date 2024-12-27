CreateThread(function()
    for _, prop in pairs(Config.Props) do
        local model = prop.model
        local coords = prop.coords

        -- Request the model
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(0)
        end

        local object = CreateObject(model, coords.x, coords.y, coords.z, false, false, false)

        SetEntityHeading(object, coords.w)

        FreezeEntityPosition(object, true)

        SetEntityInvincible(object, true)
    end
end)
