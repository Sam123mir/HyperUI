local a = require(script.Parent.Parent.Parent:WaitForChild('es7-types'))
type Array<T> = a.Array<T>
local b = require(script.Parent:WaitForChild('indexOf'))

return function<T>(c: Array<T>, d: T, e: number?): boolean
	return b(c, d, e) ~= -1
end
