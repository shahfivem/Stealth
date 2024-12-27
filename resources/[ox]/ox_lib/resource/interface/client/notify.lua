function lib.notify(data, duration, style)
    local notify = {}

    if type(data) == "string" then
        notify = {
            type = "inform",
            text = data,
            length = duration,
            style = style
        }
    else
        -- Map description to text if present
        notify = {
            type = data.type or "inform",
            text = data.description or data.text,
            length = data.duration or 5000,
            style = data.style,
            title = data.title -- Include title if needed later
        }
    end

    -- Debugging log (optional)
    -- print(json.encode(notify))

    TriggerEvent('erp_notifications:client:SendAlert', notify)
end
