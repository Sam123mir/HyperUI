local a = require(script.Parent.Parent.Parent.Parent:WaitForChild('es7-types'))
type Object = a.Object
type Array<T> = a.Array<T>

type mapFn<T, U> = (element: T, index: number) -> U
type mapFnWithThisArg<T, U> = (thisArg: any, element: T, index: number) -> U

return function<T, U>(
	b: string,
	c: (mapFn<T, U> | mapFnWithThisArg<T, U>)?,
	d: Object?
	
): Array<U> | Array<T> | Array<string>
	local e = {}

	local f = #b
	e = table.create(f)
	if c then
		for g = 1, f do
			if d ~= nil then
				(e :: Array<U>)[g] = (c :: mapFnWithThisArg<T, U>)(d, string.sub(b, g, g) :: any, g)
			else
				(e :: Array<U>)[g] = (c :: mapFn<T, U>)(string.sub(b, g, g) :: any, g)
			end
		end
	else
		for g = 1, f do
			(e :: Array<string>)[g] = string.sub(b, g, g)
		end
	end

	return e
end
