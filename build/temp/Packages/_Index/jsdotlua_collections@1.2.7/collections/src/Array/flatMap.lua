local a = _G.__DEV__
local b = require(script.Parent:WaitForChild('flat'))
local c = require(script.Parent:WaitForChild('map'))
local d = require(script.Parent.Parent.Parent:WaitForChild('es7-types'))
type Array<T> = d.Array<T>
type callbackFn<T, U> = (element: T, index: number, array: Array<T>) -> U
type callbackFnWithThisArg<T, U, V> = (thisArg: V, element: T, index: number, array: Array<T>) -> U

local function flatMap<T, U, V>(
	e: Array<T>,
	f: callbackFn<T, U> | callbackFnWithThisArg<T, U, V>,
	g: V?
): Array<U>
	if a then
		if typeof(e) ~= "table" then
			error(string.format("Array.flatMap called on %s", typeof(e)))
		end
		if typeof(f) ~= "function" then
			error("callback is not a function")
		end
	end
	return b(c(e, f, g))
end

return flatMap
