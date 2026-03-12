local a = require(script.Parent.Parent.Parent:WaitForChild('es7-types'))
type Array<T> = a.Array<T>







return function<T>(b: Array<T>, c: T, d: number?): number
	local e = d or 1
	local f = #b

	
	
	
	if e < 1 then
		e = math.max(f - math.abs(e), 1)
	end

	for g = e, f do
		if b[g] == c then
			return g
		end
	end

	return -1
end
