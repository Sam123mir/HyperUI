local a = require(script.Parent.Parent.Parent.Parent:WaitForChild('es7-types'))
type Object = a.Object
type Array<T> = a.Array<T>
type Set<T> = a.Set<T>
type mapFn<T, U> = (element: T, index: number) -> U
type mapFnWithThisArg<T, U> = (thisArg: any, element: T, index: number) -> U

return function<T, U>(
	b: Set<T>,
	c: (mapFn<T, U> | mapFnWithThisArg<T, U>)?,
	d: Object?
	
): Array<U> | Array<T> | Array<string>
	local e = {}

	if c then
		e = {}
		for f, g in b :: any do
			if d ~= nil then
				(e :: Array<U>)[f] = (c :: mapFnWithThisArg<T, U>)(d, g, f)
			else
				(e :: Array<U>)[f] = (c :: mapFn<T, U>)(g, f)
			end
		end
	else
		e = table.clone((b :: any)._array)
	end

	return e
end
