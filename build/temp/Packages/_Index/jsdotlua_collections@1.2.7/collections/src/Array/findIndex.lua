local a = require(script.Parent.Parent.Parent:WaitForChild('es7-types'))
type Array<T> = a.Array<T>
type PredicateFunction<T> = (T, number, Array<T>) -> boolean

return function<T>(b: Array<T>, c: PredicateFunction<T>): number
	for d = 1, #b do
		local e = b[d]
		if c(e, d, b) then
			return d
		end
	end
	return -1
end
