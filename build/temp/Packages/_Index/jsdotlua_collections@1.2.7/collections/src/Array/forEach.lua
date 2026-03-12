local a = _G.__DEV__
local b = require(script.Parent.Parent.Parent:WaitForChild('es7-types'))
type Array<T> = b.Array<T>
type Object = b.Object
type callbackFn<T> = (element: T, index: number, array: Array<T>) -> ()
type callbackFnWithThisArg<T, U> = (thisArg: U, element: T, index: number, array: Array<T>) -> ()



return function<T, U>(c: Array<T>, d: callbackFn<T> | callbackFnWithThisArg<T, U>, e: U?): ()
	if a then
		if typeof(c) ~= "table" then
			error(string.format("Array.forEach called on %s", typeof(c)))
		end
		if typeof(d) ~= "function" then
			error("callback is not a function")
		end
	end

	local f = #c
	local g = 1

	while g <= f do
		local h = c[g]

		if e ~= nil then
			(d :: callbackFnWithThisArg<T, U>)(e, h, g, c)
		else
			(d :: callbackFn<T>)(h, g, c)
		end

		if #c < f then
			
			f = #c
		end
		g += 1
	end
end
