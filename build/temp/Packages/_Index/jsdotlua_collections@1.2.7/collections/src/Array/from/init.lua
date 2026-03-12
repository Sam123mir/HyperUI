local a = require(script.Parent.Parent:WaitForChild('Set'))
local b = require(script.Parent.Parent:WaitForChild('Map'):WaitForChild('Map'))
local c = require(script.Parent:WaitForChild('isArray'))
local d = require(script.Parent.Parent.Parent:WaitForChild('instance-of'))
local e = require(script.Parent.Parent.Parent:WaitForChild('es7-types'))

local f = require(script:WaitForChild('fromString'))
local g = require(script:WaitForChild('fromSet'))
local h = require(script:WaitForChild('fromMap'))
local i = require(script:WaitForChild('fromArray'))

type Array<T> = e.Array<T>
type Object = e.Object
type Set<T> = e.Set<T>
type Map<K, V> = e.Map<K, V>
type mapFn<T, U> = (element: T, index: number) -> U
type mapFnWithThisArg<T, U> = (thisArg: any, element: T, index: number) -> U

return function<T, U>(
	j: string | Array<T> | Set<T> | Map<any, any>,
	k: (mapFn<T, U> | mapFnWithThisArg<T, U>)?,
	l: Object?
	
): Array<U> | Array<T> | Array<string>
	if j == nil then
		error("cannot create array from a nil value")
	end
	local m = typeof(j)

	local n: Array<U> | Array<T> | Array<string>

	if m == "table" and c(j) then
		n = i(j :: Array<T>, k, l)
	elseif d(j, a) then
		n = g(j :: Set<T>, k, l)
	elseif d(j, b) then
		n = h(j :: Map<any, any>, k, l)
	elseif m == "string" then
		n = f(j :: string, k, l)
	else
		n = {}
	end

	return n
end
