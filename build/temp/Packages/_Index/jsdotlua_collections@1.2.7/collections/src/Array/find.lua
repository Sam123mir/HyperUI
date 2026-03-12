local a = require(script.Parent.Parent.Parent:WaitForChild('es7-types'))
type Array<T> = a.Array<T>
type PredicateFunction<T> = (value: T, index: number, array: Array<T>) -> boolean

return function<T>(b: Array<T>, c: PredicateFunction<T>): T | nil
	for d = 1, #b do
		local e = b[d]
		if c(e, d, b) then
			return e
		end
	end
	return nil
end
