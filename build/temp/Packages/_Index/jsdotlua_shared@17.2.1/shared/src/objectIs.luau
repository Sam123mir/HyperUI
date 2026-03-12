














local function is(a: any, b: any): boolean
	return a == b and (a ~= 0 or 1 / a == 1 / b) or a ~= a and b ~= b 
end


local a = is

return a
