local a = _G.__DEV__
local b = require(script.Parent:WaitForChild('isArray'))
local c = require(script.Parent.Parent.Parent:WaitForChild('es7-types'))
type Array<T> = c.Array<T>

return function<T>(d: Array<T>, ...: T): number
	if a then
		if not b(d) then
			error(string.format("Array.unshift called on non-array %s", typeof(d)))
		end
	end

	local e = select("#", ...)
	if e > 0 then
		for f = e, 1, -1 do
			local g = select(f, ...)
			table.insert(d, 1, g)
		end
	end

	return #d
end
