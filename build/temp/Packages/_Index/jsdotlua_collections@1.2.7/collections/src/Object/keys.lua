local a = require(script.Parent.Parent:WaitForChild('Set'))
local b = require(script.Parent.Parent.Parent:WaitForChild('es7-types'))
local c = require(script.Parent.Parent.Parent:WaitForChild('instance-of'))
type Array<T> = b.Array<T>
type Set<T> = b.Set<T>
type Table = { [any]: any }

return function(d: Set<any> | Table | string): Array<string>
	if d == nil then
		error("cannot extract keys from a nil value")
	end

	local e = typeof(d)

	local f
	if e == "table" then
		f = {}
		if c(d, a) then
			return f
		end

		for g in pairs(d :: Table) do
			table.insert(f, g)
		end
	elseif e == "string" then
		local g = (d :: string):len()
		f = table.create(g)
		for h = 1, g do
			f[h] = tostring(h)
		end
	end

	return f
end
