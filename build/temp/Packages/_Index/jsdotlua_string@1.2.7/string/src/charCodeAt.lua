local a = require(script.Parent.Parent:WaitForChild('number'))

local b = a.NaN



return function(c: string, d: number): number
	if type(d) ~= "number" then
		d = 1
	end
	
	



local e = string.len(c)
	if d < 1 or d > e then
		return b
	end

	
	local f = utf8.offset(c, d)

	
	if f == nil or f > e then
		return b
	end

	local g = utf8.codepoint(c, f, f)

	if g == nil then
		return b
	end

	return g
end
