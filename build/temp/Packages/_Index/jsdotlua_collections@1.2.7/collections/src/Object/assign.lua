local a = require(script.Parent:WaitForChild('None'))
local b = require(script.Parent.Parent.Parent:WaitForChild('es7-types'))
type Object = b.Object








return function<T, U, V, W>(c: T, d: U?, e: V?, f: W?, ...): T & U & V & W
	if d ~= nil and typeof(d :: any) == "table" then
		for g, h in pairs(d :: any) do
			if h == a then
				(c :: any)[g] = nil
			else
				(c :: any)[g] = h
			end
		end
	end

	if e ~= nil and typeof(e :: any) == "table" then
		for g, h in pairs(e :: any) do
			if h == a then
				(c :: any)[g] = nil
			else
				(c :: any)[g] = h
			end
		end
	end

	if f ~= nil and typeof(f :: any) == "table" then
		for g, h in pairs(f :: any) do
			if h == a then
				(c :: any)[g] = nil
			else
				(c :: any)[g] = h
			end
		end
	end

	for g = 1, select("#", ...) do
		local h = select(g, ...)

		if h ~= nil and typeof(h) == "table" then
			for i, j in pairs(h) do
				if j == a then
					(c :: any)[i] = nil
				else
					(c :: any)[i] = j
				end
			end
		end
	end

	
	return (c :: any) :: T & U & V & W
end
