local function slice(a: string, b: string | number, c: (string | number)?): string
	local d, e = utf8.len(a)
	assert(d ~= nil, ("string `%s` has an invalid byte at position %s"):format(a, tostring(e)))
	local f = tonumber(b)
	assert(typeof(f) == "number", "startIndexStr should be a number")

	if f + d < 0 then
		
		f = 1
	end

	if f > d then
		return ""
	end

	
	local g = d + 1
	if c ~= nil then
		
		local h = 0/0
g = tonumber(c) or h 
	end
	assert(typeof(g) == "number", "lastIndexStr should convert to number")

	if g > d then
		g = d + 1
	end

	local h = utf8.offset(a, f) :: number
	
	local i = utf8.offset(a, g) :: number - 1

	return string.sub(a, h, i)
end

return slice
