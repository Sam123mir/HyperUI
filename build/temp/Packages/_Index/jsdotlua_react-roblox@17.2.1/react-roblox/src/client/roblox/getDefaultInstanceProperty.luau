

























local a = require(script.Parent.Parent.Parent.Parent:WaitForChild('shared')).Symbol

local b = a.named("Nil")
local c = {}

local function tryPropertyName(d, e)
	return d[e]
end

local function getDefaultInstanceProperty(d, e)
	local f = c[d]

	if f then
		local g = f[e]

		
		
		if g == b then
			return true, nil
		end

		if g ~= nil then
			return true, g
		end
	else
		f = {}
		c[d] = f
	end

	local g = Instance.new(d)
	local h, i = pcall(tryPropertyName, g, e)

	g:Destroy()

	if h then
		if i == nil then
			f[e] = b
		else
			f[e] = i
		end
	end

	return h, i
end

return getDefaultInstanceProperty
