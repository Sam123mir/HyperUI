
local a = require(script.Parent:WaitForChild('isInteger'))
local b = require(script.Parent:WaitForChild('MAX_SAFE_INTEGER'))

return function(c)
	return a(c) and math.abs(c) <= b
end
