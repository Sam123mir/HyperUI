local a = require(script.Parent:WaitForChild('Map'))
local b = require(script.Parent.Parent.Parent:WaitForChild('instance-of'))
local c = require(script.Parent.Parent:WaitForChild('Array'):WaitForChild('reduce'))
local d = require(script.Parent.Parent.Parent:WaitForChild('es7-types'))

type Map<K, V> = d.Map<K, V>
type Table<K, V> = d.Table<K, V>

local function coerceToTable(e: Map<any, any> | Table<any, any>): Table<any, any>
	if not b(e, a) then
		return e :: Table<any, any>
	end

	
	return c(e:entries(), function(f, g)
		f[g[1] ] = g[2]
		return f
	end, {})
end

return coerceToTable
