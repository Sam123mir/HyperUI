local a = _G.__DEV__
local b = require(script.Parent.Parent.Parent:WaitForChild('es7-types'))
type Array<T> = b.Array<T>
type Object = b.Object
type callbackFn<T> = (element: T, index: number, array: Array<T>) -> boolean
type callbackFnWithThisArg<T, U> = (thisArg: U, element: T, index: number, array: Array<T>) -> boolean



return function<T, U>(c: Array<T>, d: callbackFn<T> | callbackFnWithThisArg<T, U>, e: U?): Array<T>
	if a then
		if typeof(c) ~= "table" then
			error(string.format("Array.filter called on %s", typeof(c)))
		end
		if typeof(d) ~= "function" then
			error("callback is not a function")
		end
	end

	local f = #c
	local g = {}
	local h = 1

	if e == nil then
		for i = 1, f do
			local j = c[i]
			if j ~= nil then
				if (d :: callbackFn<T>)(j, i, c) then
					g[h] = j
					h += 1
				end
			end
		end
	else
		for i = 1, f do
			local j = c[i]
			if j ~= nil then
				if (d :: callbackFnWithThisArg<T, U>)(e, j, i, c) then
					g[h] = j
					h += 1
				end
			end
		end
	end

	return g
end
