local a = _G.__DEV__

local b = require(script.Parent.Parent.Parent:WaitForChild('es7-types'))
type Array<T> = b.Array<T>
type Object = b.Object

return function(c: Object | Array<any>): boolean
	if a then
		print("Luau now has a direct table.isfrozen call that can save the overhead of this library function call")
	end
	return table.isfrozen(c)
end
