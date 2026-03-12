
local a = "([" .. ("$%^()-[].?"):gsub("(.)", "%%%1") .. "])"




return function(b: string, c: string, d: number?): number
	local e = #b
	local f = if d ~= nil then if d < 1 then 1 else d :: number else 1

	if #c == 0 then
		return if f > e then e else f
	end

	if f > e then
		return -1
end

	c = c:gsub(a, "%%%1")
	local g = #c

	for h = f, e do
		if string.sub(b, h, h + g - 1) == c then
			return h
		end
	end

	return -1
end
