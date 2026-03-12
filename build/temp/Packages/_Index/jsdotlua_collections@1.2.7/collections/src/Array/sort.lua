local a = require(script.Parent.Parent:WaitForChild('Object'):WaitForChild('None'))
local b = require(script.Parent.Parent.Parent:WaitForChild('es7-types'))
type Array<T> = b.Array<T>
type Comparable = (any, any) -> number
local c = function<T>(c: T, d: T): boolean
	return type(c) .. tostring(c) < type(d) .. tostring(d)
end

return function<T>(d: Array<T>, e: Comparable?): Array<T>
	
	local f = c
	if e ~= nil and e ~= a then
		if typeof(e :: any) ~= "function" then
			error("invalid argument to Array.sort: compareFunction must be a function")
		end
		f = function<T>(g: T, h: T)
			local i = e(g, h)
			if typeof(i) ~= "number" then
				
				
				
				
				error(("invalid result from compare function, expected number but got %s"):format(typeof(i)))
			end
			return i < 0
		end
	end
	table.sort(d, f)
	return d
end
