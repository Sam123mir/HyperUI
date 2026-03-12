


























local a = require(script.Parent.Parent:WaitForChild('Type.roblox'))

local b = {}

local c = {
	__tostring = function(c)
		return string.format("RoactHostChangeEvent(%s)", c.name)
	end,
}

setmetatable(b, {
	__index = function(d, e)
		local f = {
			[a] = a.HostChangeEvent,
			name = e,
		}

		setmetatable(f, c)
		b[e] = f

		return f
	end,
})

return b
