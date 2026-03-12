






local a = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
local b = a.console
local c = a.Array

local d = require(script.Parent:WaitForChild('ReactSharedInternals'))








local e

local f = {}
f.warn = function(g, ...)
	if _G.__DEV__ then
		e("warn", g, { ... })
	end
end
f.error = function(g, ...)
	if _G.__DEV__ then
		e("error", g, { ... })
	end
end

function e(g, h, i)
	
	
	if _G.__DEV__ then
		local j = d.ReactDebugCurrentFrame
		local k = j.getStackAddendum()

		if k ~= "" then
			h ..= "%s"
			
			i = c.slice(i, 1)
			table.insert(i, k)
		end

		local l = c.map(i, tostring)
		
		table.insert(l, 1, "Warning: " .. h)
		
		
		
		b[g](unpack(l))
	end
end

return f
