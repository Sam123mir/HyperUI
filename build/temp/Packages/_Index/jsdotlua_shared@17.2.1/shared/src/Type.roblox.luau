
























local a = require(script.Parent:WaitForChild('Symbol.roblox'))

local b = newproxy(true)

local c = {}

local function addType(d)
	c[d] = a.named("Roact" .. d)
end

addType("HostChangeEvent")
addType("HostEvent")

function c.of(d)
	if typeof(d) ~= "table" then
		return nil
	end

	return d[b]
end

getmetatable(b).__index = c

getmetatable(b).__tostring = function()
	return "RoactType"
end

return b
