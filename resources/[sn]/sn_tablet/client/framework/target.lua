function addTargetZone(id, coords, size, options)
    if Config.target == 'qb-target' then
        for i, data in pairs(options) do options[i].action = data.onSelect end
        exports['qb-target']:AddBoxZone(id, coords.xyz, size.y, size.x, {
            name = id,
            heading = coords.w,
            debugPoly = Config.debug.taget,
            minZ = coords.z - size.z/2,
            maxZ = coords.z + size.z/2,
        }, {
            options = options,
            distance = 2.0,
        })
        return id
    elseif Config.target == 'ox_target' then
        for i,option in pairs(options) do options[i].distance = 2.0 options[i].items = option.item end
        return exports.ox_target:addBoxZone({
            coords = coords.xyz,
            size = size,
            rotation = coords.w,
            debug = Config.debug.taget,
            debugColour = debugColor,
            options = options,
        })
    end
end

function removeTargetZone(id)
    if Config.target == 'qb-target' then
        exports['qb-target']:RemoveZone(id)
    elseif Config.target == 'ox_target' then
        exports.ox_target:removeZone(id) 
    end
end

function addTargetEntity(entity, options)
    if Config.target == 'qb-target' then
        for i, data in pairs(options) do options[i].action = data.onSelect end
        exports['qb-target']:AddTargetEntity(entity, {
            options = options,
            distance = 2.0,
        })
    elseif Config.target == 'ox_target' then
        for i,option in pairs(options) do options[i].distance = 2.0 options[i].items = option.item end
        exports.ox_target:addLocalEntity(entity, options)
    end
end

function addGlobalObject(options)
    local resource = GetInvokingResource()
    if Config.target == 'qb-target' then
        for i, data in pairs(options) do options[i].action = data.onSelect end
        exports['qb-target']:AddGlobalObject({
            options = options,
            distance = 2.0,
        })
    elseif Config.target == 'ox_target' then
        for i,option in pairs(options) do 
            options[i].name = resource..'_'..string.gsub(options[i].label, ' ', '')
            options[i].distance = 2.0 
            options[i].items = option.item
        end
        exports.ox_target:addGlobalObject(options)
    end
end

function removeGlobalObject(options)
    local resource = GetInvokingResource()
    if Config.target == 'qb-target' then
        exports['qb-target']:RemoveGlobalObject(options)
    elseif Config.target == 'ox_target' then
        if type(options) == 'table' then
            for i, option in pairs(options) do 
                options[i] = resource..'_'..string.gsub(options[i], ' ', '') 
            end
        else
            options = resource..'_'..string.gsub(options[i], ' ', '')
        end
        exports.ox_target:removeGlobalObject(options)
    end
end

function addTargetModel(models, options)
    local resource = GetInvokingResource()
    if Config.target == 'qb-target' then
        for i, data in pairs(options) do options[i].action = data.onSelect end
        exports['qb-target']:AddTargetModel(models, {
            options = options,
            distance = 2.0,
        })
    elseif Config.target == 'ox_target' then
        for i,option in pairs(options) do 
            options[i].name = resource..'_'..string.gsub(options[i].label, ' ', '')
            options[i].distance = 2.0
            options[i].items = option.item
        end
        exports.ox_target:addModel(models, options)
    end
end

function removeTargetModel(models, options)
    local resource = GetInvokingResource()
    if Config.target == 'qb-target' then
        exports['qb-target']:RemoveTargetModel(models, options)
    elseif Config.target == 'ox_target' then
        if type(options) == 'table' then
            for i, option in pairs(options) do 
                options[i] = resource..'_'..string.gsub(options[i], ' ', '') 
            end
        else
            options = resource..'_'..string.gsub(options[i], ' ', '')
        end
        exports.ox_target:removeModel(models, options)
    end
end

exports('addTargetZone', addTargetZone)
exports('removeTargetZone', removeTargetZone)
exports('addTargetEntity', addTargetEntity)
exports('addGlobalObject', addGlobalObject)
exports('removeGlobalObject', removeGlobalObject)
exports('addTargetModel', addTargetModel)
exports('removeTargetModel', removeTargetModel)