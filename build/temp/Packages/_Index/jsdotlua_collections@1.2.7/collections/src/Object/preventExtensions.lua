local a = require(script.Parent.Parent.Parent:WaitForChild('es7-types'))
type Array<T> = a.Array<T>
type Object = a.Object




local function preventExtensions<T>(b: T & (Object | Array<any>)): T
	local c = tostring(b)

	return (
		setmetatable(b :: any, {
			__newindex = function(d, e, f)
				local g = ("%q (%s) is not a valid member of %s"):format(tostring(e), typeof(e), c)

				error(g, 2)
			end,
			__metatable = false,
		}) :: any
	) :: T
end

return preventExtensions
