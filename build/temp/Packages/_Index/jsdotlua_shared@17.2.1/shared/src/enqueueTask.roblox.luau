








local a = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
local b = a.setTimeout

return function(c)
	
	return b(c, 0)
end
