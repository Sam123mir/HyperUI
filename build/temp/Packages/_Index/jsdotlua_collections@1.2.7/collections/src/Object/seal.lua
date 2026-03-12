local a = require(script.Parent.Parent.Parent:WaitForChild('es7-types'))
type Array<T> = a.Array<T>
type Object = a.Object

return function<T>(b: T & (Object | Array<any>)): T
	
	return (table.freeze(b :: any) :: any) :: T
end
