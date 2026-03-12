
local a = require(script.Parent.Parent.Parent:WaitForChild('es7-types'))
type Array<T> = a.Array<T>

return function<T>(b: Array<T>): Array<T>
	local c = #b
	local d = 1
	while d < c do
		b[d], b[c] = b[c], b[d]
		d = d + 1
		c = c - 1
	end
	return b
end
