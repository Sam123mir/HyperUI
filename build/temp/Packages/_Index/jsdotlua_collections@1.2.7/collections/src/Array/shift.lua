local a = _G.__DEV__
local b = require(script.Parent:WaitForChild('isArray'))
local c = require(script.Parent.Parent.Parent:WaitForChild('es7-types'))
type Array<T> = c.Array<T>

return function<T>(d: Array<T>): T?
	if a then
		if not b(d) then
			error(string.format("Array.shift called on non-array %s", typeof(d)))
		end
	end

	if #d > 0 then
		return table.remove(d, 1)
	else
		return nil
	end
end
