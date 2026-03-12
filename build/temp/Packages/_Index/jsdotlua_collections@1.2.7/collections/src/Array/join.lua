local a = require(script.Parent.Parent.Parent:WaitForChild('es7-types'))
type Array<T> = a.Array<T>
local b = require(script.Parent:WaitForChild('map'))

return function<T>(c: Array<T>, d: string?): string
	if #c == 0 then
		return ""
	end
	
	local e = b(c, function(e)
		return tostring(e)
	end)

	return table.concat(e, d or ",")
end
