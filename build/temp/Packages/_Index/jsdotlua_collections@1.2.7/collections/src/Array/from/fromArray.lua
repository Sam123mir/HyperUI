local a = require(script.Parent.Parent.Parent.Parent:WaitForChild('es7-types'))
type Object = a.Object

type Array<T> = a.Array<T>
type mapFn<T, U> = (element: T, index: number) -> U
type mapFnWithThisArg<T, U> = (thisArg: any, element: T, index: number) -> U

return function<T, U>(
	b: Array<T>,
	c: (mapFn<T, U> | mapFnWithThisArg<T, U>)?,
	d: Object?
	
): Array<U> | Array<T> | Array<string>
	local e = {}

	if c then
		local f = #(b :: Array<T>)
		e = table.create(f)
		for g = 1, f do
			if d ~= nil then
				(e :: Array<U>)[g] = (c :: mapFnWithThisArg<T, U>)(d, (b :: Array<T>)[g], g)
			else
				(e :: Array<U>)[g] = (c :: mapFn<T, U>)((b :: Array<T>)[g], g)
			end
		end
	else
		e = table.clone(b :: Array<T>)
	end

	return e
end
