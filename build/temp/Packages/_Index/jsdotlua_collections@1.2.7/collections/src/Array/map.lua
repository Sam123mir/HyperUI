local a = _G.__DEV__
local b = require(script.Parent.Parent.Parent:WaitForChild('es7-types'))
type Array<T> = b.Array<T>
type Object = b.Object
type callbackFn<T, U> = (element: T, index: number, array: Array<T>) -> U
type callbackFnWithThisArg<T, U, V> = (thisArg: V, element: T, index: number, array: Array<T>) -> U



return function<T, U, V>(c: Array<T>, d: callbackFn<T, U> | callbackFnWithThisArg<T, U, V>, e: V?): Array<U>
	if a then
		if typeof(c) ~= "table" then
			error(string.format("Array.map called on %s", typeof(c)))
		end
		if typeof(d) ~= "function" then
			error("callback is not a function")
		end
	end

	local f = #c
	local g = {}
	local h = 1

	while h <= f do
		local i = c[h]

		if i ~= nil then
			local j

			if e ~= nil then
				j = (d :: callbackFnWithThisArg<T, U, V>)(e, i, h, c)
			else
				j = (d :: callbackFn<T, U>)(i, h, c)
			end

			g[h] = j
		end
		h += 1
	end

	return g
end
