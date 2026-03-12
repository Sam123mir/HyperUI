local a = require(script.Parent:WaitForChild('boolean'))
local b = require(script.Parent:WaitForChild('collections'))
local c = require(script.Parent:WaitForChild('console'))
local d = require(script.Parent:WaitForChild('math'))
local e = require(script.Parent:WaitForChild('number'))
local f = require(script.Parent:WaitForChild('string'))
local g = require(script.Parent:WaitForChild('symbol-luau'))
local h = require(script.Parent:WaitForChild('timers'))
local i = require(script.Parent:WaitForChild('es7-types'))

local j = require(script:WaitForChild('AssertionError'))
local k = require(script:WaitForChild('Error'))
local l = require(script:WaitForChild('Promise'))
local m = require(script:WaitForChild('extends'))
local n = require(script.Parent:WaitForChild('instance-of'))

export type Array<T> = i.Array<T>
export type AssertionError = j.AssertionError
export type Error = k.Error
export type Map<T, V> = i.Map<T, V>
export type Object = i.Object

export type PromiseLike<T> = l.PromiseLike<T>
export type Promise<T> = l.Promise<T>

export type Set<T> = i.Set<T>
export type Symbol = g.Symbol
export type Timeout = h.Timeout
export type Interval = h.Interval
export type WeakMap<T, V> = b.WeakMap<T, V>

return {
	Array = b.Array,
	AssertionError = j,
	Boolean = a,
	console = c,
	Error = k,
	extends = m,
	instanceof = n,
	Math = d,
	Number = e,
	Object = b.Object,
	Map = b.Map,
	coerceToMap = b.coerceToMap,
	coerceToTable = b.coerceToTable,
	Set = b.Set,
	WeakMap = b.WeakMap,
	String = f,
	Symbol = g,
	setTimeout = h.setTimeout,
	clearTimeout = h.clearTimeout,
	setInterval = h.setInterval,
	clearInterval = h.clearInterval,
	util = {
		inspect = b.inspect,
	},
}
