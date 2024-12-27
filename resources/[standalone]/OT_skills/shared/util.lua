skillCount = 0
for k, v in pairs(Config.skills) do
    skillCount = skillCount + 1
end

function round(num)
    local mult = 10 ^ (2)
    return math.floor(num * mult + 0.5) / mult
end

function float(value)
    return tonumber(string.format("%.2f", value))
end

function int(value)
    return math.floor(tonumber(value))
end

function DumpTable(table, nb)
	if nb == nil then
		nb = 0
	end

	if type(table) == 'table' then
		local s = ''
		for i = 1, nb + 1, 1 do
			s = s .. "    "
		end

		s = '{\n'
		for k,v in pairs(table) do
			if type(k) ~= 'number' then k = '"'..k..'"' end
			for i = 1, nb, 1 do
				s = s .. "    "
			end
			s = s .. '['..k..'] = ' .. DumpTable(v, nb + 1) .. ',\n'
		end

		for i = 1, nb, 1 do
			s = s .. "    "
		end

		return s .. '}'
	else
		return tostring(table)
	end
end

function debugPrint(str)
    print(string.format('^2[%s] %s^0', 'OT_skills', str))
end