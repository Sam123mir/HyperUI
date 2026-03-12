local a = _G.__DEV__
local b = require(script.Parent:WaitForChild('isArray'))
local c = require(script.Parent.Parent.Parent:WaitForChild('es7-types'))
type Array<T> = c.Array<T>

local d = [[Array.concat(...) only works with array-like tables but it received an object-like table.
You can avoid this error by wrapping the object-like table into an array. Example: `concat({1, 2}, {a = true})` should be `concat({1, 2}, { {a = true} }`]]




local function concat<T, S>(e: Array<T> | T, ...: Array<S> | S): Array<T> & Array<S>
	local f
	local g = 0

	if b(e) then
		f = table.clone(e :: Array<T>)
		g = #(e :: Array<T>)
	else
		g += 1
		f = {}
		f[g] = e :: T
	end

	for h = 1, select("#", ...) do
		local i = select(h, ...)
		local j = typeof(i)
		if i == nil then
			
		elseif j == "table" then
			
			
			
			if a then
				if not b(i) then
					error(d)
				end
			end
			for k = 1, #i do
				g += 1
				f[g] = i[k]
			end
		else
			g += 1
			f[g] = i
		end
	end

	return (f :: any) :: Array<T> & Array<S>
end

return concat
