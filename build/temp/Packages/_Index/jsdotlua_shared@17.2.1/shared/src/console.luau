



















local a = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
local b = a.console
local c = require(script.Parent:WaitForChild('consoleWithStackDev'))

if _G.__DEV__ then
	local d = setmetatable({
		warn = c.warn,
		error = c.error,
	}, {
		__index = b,
	})
	return d
end

return b
