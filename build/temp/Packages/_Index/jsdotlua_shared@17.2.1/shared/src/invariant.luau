



















local a = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
local b = a.Error

local function invariant(c, d, ...)
	
	
	
	if not c then
		error(b(string.format(d, ...)))
	end
end

return invariant
