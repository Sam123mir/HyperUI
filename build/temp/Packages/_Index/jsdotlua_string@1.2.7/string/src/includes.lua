
local a = "([" .. ("$%^()-[].?"):gsub("(.)", "%%%1") .. "])"

local function includes(b: string, c: string, d: (string | number)?): boolean
	local e, f = utf8.len(b)
	assert(e ~= nil, ("string `%s` has an invalid byte at position %s"):format(b, tostring(f)))
	if e == 0 then
		return false
	end

	if #c == 0 then
		return true
	end

	local g = 1
	if d ~= nil then
		g = tonumber(d) or 1
		if g > e then
			return false
		end
	end

	if g < 1 then
		g = 1
	end

	local h = utf8.offset(b, g)
	local i = c:gsub(a, "%%%1")
	local j, k = string.find(b, i, h)
	return j ~= nil
end

return includes
