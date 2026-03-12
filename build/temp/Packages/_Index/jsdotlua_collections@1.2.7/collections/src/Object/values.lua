local a = require(script.Parent.Parent.Parent:WaitForChild('es7-types'))
type Array<T> = a.Array<T>


return function<T>(b: { [string]: T } | Array<T> | string): Array<T> | Array<string>
	if b == nil then
		error("cannot extract values from a nil value")
	end
	local c = typeof(b)

	local d: Array<T> | Array<string>
	if c == "table" then
		d = {} :: Array<T>
		for e, f in pairs(b :: { [string]: T } | Array<T>) do
			table.insert(d, f)
		end
	elseif c == "string" then
		
		local e = (b :: string):len()
		d = table.create(e)
		for f = 1, e do
			(d :: Array<string>)[f] = (b :: string):sub(f, f)
		end
	end

	return d
end
