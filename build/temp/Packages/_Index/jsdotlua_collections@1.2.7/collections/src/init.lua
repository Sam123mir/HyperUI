local a = require(script:WaitForChild('Array'))
local b = require(script:WaitForChild('Map'))
local c = require(script:WaitForChild('Object'))
local d = require(script:WaitForChild('Set'))
local e = require(script:WaitForChild('WeakMap'))
local f = require(script:WaitForChild('inspect'))

local g = require(script.Parent:WaitForChild('es7-types'))

export type Array<T> = g.Array<T>
export type Map<T, V> = g.Map<T, V>
export type Object = g.Object
export type Set<T> = g.Set<T>
export type WeakMap<T, V> = g.WeakMap<T, V>

return {
	Array = a,
	Object = c,
	Map = b.Map,
	coerceToMap = b.coerceToMap,
	coerceToTable = b.coerceToTable,
	Set = d,
	WeakMap = e,
	inspect = f,
}
