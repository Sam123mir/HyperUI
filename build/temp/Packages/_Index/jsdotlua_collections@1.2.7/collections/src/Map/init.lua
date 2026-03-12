local a = require(script.Parent.Parent:WaitForChild('es7-types'))

local b = require(script:WaitForChild('Map'))
local c = require(script:WaitForChild('coerceToMap'))
local d = require(script:WaitForChild('coerceToTable'))

export type Map<K, V> = a.Map<K, V>

return {
	Map = b,
	coerceToMap = c,
	coerceToTable = d,
}
