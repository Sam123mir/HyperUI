local a = require(script.Parent.Parent.Parent:WaitForChild('es7-types'))
type Array<T> = a.Array<T>




return function<T>(b: Array<T>, c: number, d: number?, ...: T): Array<T>
	
	if c > #b then
		local e = select("#", ...)
		for f = 1, e do
			local g = select(f, ...)
			table.insert(b, g)
		end
		return {}
	else
		local e = #b
		
		
		
		if c < 1 then
			c = math.max(e - math.abs(c), 1)
		end

		local f = {} :: Array<T>
		
		
		local g: number = d or e
		if g > 0 then
			local h = math.min(e, c + math.max(0, g - 1))

			for i = c, h do
				local j = table.remove(b, c) :: T
				table.insert(f, j)
			end
		end

		local h = select("#", ...)
		
		for i = h, 1, -1 do
			local j = select(i, ...)
			table.insert(b, c, j)
		end

		return f
	end
end
