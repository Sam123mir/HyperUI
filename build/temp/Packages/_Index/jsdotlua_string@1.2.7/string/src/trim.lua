local a = require(script.Parent:WaitForChild('trimStart'))
local b = require(script.Parent:WaitForChild('trimEnd'))

return function(c: string): string
	return a(b(c))
end
