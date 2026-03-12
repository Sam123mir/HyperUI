local a = require(script.Parent:WaitForChild('Map'))
local b = require(script.Parent.Parent:WaitForChild('Object'))
local c = require(script.Parent.Parent.Parent:WaitForChild('instance-of'))
local d = require(script.Parent.Parent.Parent:WaitForChild('es7-types'))

type Map<K, V> = d.Map<K, V>
type Table<K, V> = d.Table<K, V>

local function coerceToMap(e: Map<any, any> | Table<any, any>): Map<any, any>
	return c(e, a) and e :: Map<any, any> 
		or a.new(b.entries(e)) 
end

return coerceToMap
