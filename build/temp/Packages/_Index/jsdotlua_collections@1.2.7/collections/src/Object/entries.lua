local a = require(script.Parent.Parent.Parent:WaitForChild('es7-types'))
type Array<T> = a.Array<T>
type Map<K, V> = a.Map<K, V>
type Tuple<T, V> = a.Tuple<T, V>

return function<T>(b: string | { [string]: T } | Array<T> | Map<any, T>): Array<Tuple<string, T>>
	assert(b :: any ~= nil, "cannot get entries from a nil value")
	local c = typeof(b)

	local d: Array<Tuple<string, T>> = {}
	if c == "table" then
		for e, f in pairs(b :: { [string]: T } | Array<T>) do
			
			table.insert(d, { e, f })
		end
	elseif c == "string" then
		
		for e = 1, string.len(b :: string) do
			d[e] = { tostring(e), string.sub(b :: string, e, e) }
		end
	end

	return d
end
