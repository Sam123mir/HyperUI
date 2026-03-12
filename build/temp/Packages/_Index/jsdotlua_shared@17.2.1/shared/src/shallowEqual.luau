









local a = require(script.Parent:WaitForChild('objectIs'))






local function shallowEqual(b, c)
	if a(b, c) then
		return true
	end

	if
		typeof(b) ~= "table"
		or b == nil
		or typeof(c) ~= "table"
		or c == nil
	then
		return false
	end

	
	
	for d, e in b do
		if not a(c[d], e) then
			return false
		end
	end

	for d, e in c do
		if not a(b[d], e) then
			return false
		end
	end

	return true
end

return shallowEqual
