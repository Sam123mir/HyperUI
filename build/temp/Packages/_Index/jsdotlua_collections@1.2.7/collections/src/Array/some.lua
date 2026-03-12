local a = require(script.Parent.Parent.Parent:WaitForChild('es7-types'))
type Array<T> = a.Array<T>
type Object = a.Object


type callbackFn<T> = (element: T, index: number, array: Array<T>) -> boolean
type callbackFnWithThisArg<T, U> = (thisArg: U, element: T, index: number, array: Array<T>) -> boolean



return function<T, U>(b: Array<T>, c: callbackFn<T> | callbackFnWithThisArg<T, U>, d: U?): boolean
	if typeof(b) ~= "table" then
		error(string.format("Array.some called on %s", typeof(b)))
	end
	if typeof(c) ~= "function" then
		error("callback is not a function")
	end

	for e, f in b do
		if d ~= nil then
			if f ~= nil and (c :: callbackFnWithThisArg<T, U>)(d, f, e, b) then
				return true
			end
		else
			if f ~= nil and (c :: callbackFn<T>)(f, e, b) then
				return true
			end
		end
	end
	return false
end
