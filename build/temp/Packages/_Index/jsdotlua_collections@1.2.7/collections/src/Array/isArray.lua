return function(a: any): boolean
	if typeof(a) ~= "table" then
		return false
	end
	if next(a) == nil then
		
		return true
	end

	local b = #a

	if b == 0 then
		return false
	end

	local c = 0
	local d = 0
	for e in pairs(a) do
		if typeof(e) ~= "number" then
			return false
		end
		if e % 1 ~= 0 or e < 1 then
			return false
		end
		c += 1
		d += e
	end

	return d == (c * (c + 1) / 2)
end
