local a = require(script.Parent.Parent.Parent:WaitForChild('es7-types'))
type Array<T> = a.Array<T>



return function<T>(b: Array<T>, c: number?, d: number?): Array<T>
	if typeof(b) ~= "table" then
		error(string.format("Array.slice called on %s", typeof(b)))
	end
	local e = #b

	local f = c or 1
	local g
	if d == nil or d > e + 1 then
		g = e + 1
	else
		g = d
	end

	if f > e + 1 then
		return {}
	end

	local h = {}

	if f < 1 then
		f = math.max(e - math.abs(f), 1)
	end
	if g < 1 then
		g = math.max(e - math.abs(g), 1)
	end

	local i = f
	local j = 1
	while i < g do
		h[j] = b[i]
		i = i + 1
		j = j + 1
	end

	return h
end
