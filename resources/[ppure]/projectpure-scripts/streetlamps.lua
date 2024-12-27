local props = {
    [`prop_traffic_01a`] = true,
    [`prop_traffic_01b`] = true,
    [`prop_traffic_01d`] = true,
    [`prop_traffic_03a`] = true,
    [`prop_traffic_03b`] = true,
    [`prop_traffic_lightset_01`] = true,
    [`prop_ind_light_01a`] = true,
    [`prop_ind_light_01b`] = true,
    [`prop_ind_light_01c`] = true,
    [`prop_ind_light_02a`] = true,
    [`prop_ind_light_02b`] = true,
    [`prop_ind_light_02c`] = true,
    [`prop_ind_light_03a`] = true,
    [`prop_ind_light_03b`] = true,
    [`prop_ind_light_03c`] = true,
    [`prop_ind_light_04`] = true,
    [`prop_streetlight_01`] = true,
	[`prop_streetlight_02`] = true,
    [`prop_streetlight_03`] = true,
    [`prop_streetlight_03b`] = true,
    [`prop_streetlight_03c`] = true,
    [`prop_streetlight_03d`] = true,
    [`prop_streetlight_03e`] = true,
    [`prop_streetlight_14a`] = true,
    [`prop_streetlight_15a`] = true,
    [`prop_streetlight_04`] = true,
}

local devMode = GetConvarInt('sv_developer', 0) == 1

---@param entity number
---@return boolean
local function isValidEntity(entity)
	local model <const> = GetEntityModel(entity)
	if not props[model] then return false end

    local uprightValue <const> = GetEntityUprightValue(entity)
	local isUpright <const> = uprightValue > 0.95

    -- if devMode then
    --     local pos = GetEntityCoords(entity)
    --     DrawText3Ds(pos.x, pos.y, pos.z, 'Upright Value: '..uprightValue)
    -- end

	return not isUpright
end

local function removeCollisions()
	if not plyVeh then return end

	local objects = GetGamePool('CObject')
	for i=1, #objects do
		local entity = objects[i]
		if isValidEntity(entity) then
            if devMode then
                SetEntityAlpha(entity, 153, false)
            end

			SetEntityNoCollisionEntity(entity, plyVeh, false)
		end
	end
end

CreateThread(function()
	while true do
		Wait(500)
		removeCollisions()
	end
end)