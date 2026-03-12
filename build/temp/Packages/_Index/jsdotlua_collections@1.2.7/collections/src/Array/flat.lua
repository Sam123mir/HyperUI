local a = _G.__DEV__
local b = require(script.Parent:WaitForChild('isArray'))
local c = require(script.Parent.Parent.Parent:WaitForChild('es7-types'))
type Array<T> = c.Array<T>
local function flat<T>(d: Array<T>, e: number?): Array<T>
	if a then
		if typeof(d) ~= "table" then
			error(string.format("Array.flat called on %s", typeof(d)))
		end
		if e ~= nil and typeof(e) ~= "number" then
			error("depth is not a number or nil")
		end
	end
	local f = e or 1
	local g = {}

	for h, i in d do
		if b(i) then
			local j = (i :: any) :: Array<T>
			local k: Array<T> = if f > 1 then flat(j, f - 1) else j
			for l, m in k do
				table.insert(g, m)
			end
		else
			table.insert(g, i)
		end
	end

	return g
end

return flat
