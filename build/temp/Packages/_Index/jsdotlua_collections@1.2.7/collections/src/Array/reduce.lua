local a = _G.__DEV__
local b = require(script.Parent.Parent.Parent:WaitForChild('es7-types'))
type Array<T> = b.Array<T>
type reduceFn<T, U> = (previousValue: U, currentValue: T, currentIndex: number, array: Array<T>) -> U




return function<T, U>(c: Array<T>, d: reduceFn<T, U>, e: U?): U
	if a then
		if typeof(c) ~= "table" then
			error(string.format("Array.reduce called on %s", typeof(c)))
		end
		if typeof(d) ~= "function" then
			error("callback is not a function")
		end
	end

	local f = #c

	local g: T | U
	local h = 1

	if e ~= nil then
		g = e
	else
		h = 2
		if f == 0 then
			error("reduce of empty array with no initial value")
		end
		g = c[1]
	end

	for i = h, f do
		g = d(g :: U, c[i], i, c)
	end

	return g :: U
end
