local a = _G.__DEV__
local b = require(script.Parent.Parent.Parent:WaitForChild('es7-types'))
type Array<T> = b.Array<T>
type Object = b.Object
type callbackFn<T> = (element: T, index: number, array: Array<T>) -> boolean
type callbackFnWithThisArg<T, U> = (self: U, element: T, index: number, array: Array<T>) -> boolean



return function<T, U>(c: Array<T>, d: callbackFn<T> | callbackFnWithThisArg<T, U>, e: U?): boolean
	if a then
		if typeof(c) ~= "table" then
			error(string.format("Array.every called on %s", typeof(c)))
		end
		if typeof(d) ~= "function" then
			error("callback is not a function")
		end
	end

	local f = #c
	local g = 1

	while g <= f do
		local h = c[g]
		local i

		if h ~= nil then
			if e ~= nil then
				i = (d :: callbackFnWithThisArg<T, U>)(e, h, g, c)
			else
				i = (d :: callbackFn<T>)(h, g, c)
			end

			if not i then
				return false
			end
		end
		g += 1
	end
	return true
end
