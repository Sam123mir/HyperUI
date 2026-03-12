














local a = require(script.Parent:WaitForChild('console'))





local b = 0
local c
local d
local e
local f
local g
local h
local i

local j = function() end

local k = {}




k.disabledLog = j

k.disableLogs = function()
	if _G.__DEV__ then
		if b == 0 then
			c = a.log
			d = a.info
			e = a.warn
			f = a.error
			g = a.group
			h = a.groupCollapsed
			i = a.groupEnd

			a.info = j
			a.log = j
			a.warn = j
			a.error = j
			a.group = j
			a.groupCollapsed = j
			a.groupEnd = j
		end

		b = b + 1
	end
end

k.reenableLogs = function()
	if _G.__DEV__ then
		b = b - 1

		if b == 0 then
			a.log = c
			a.info = d
			a.warn = e
			a.error = f
			a.group = g
			a.groupCollapsed = h
			a.groupEnd = i
		end

		if b < 0 then
			a.error(
[[disabledDepth fell below zero. This is a bug in React. Please file an issue.]]			

)
		end
	end
end

return k
