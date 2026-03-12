local function lastIndexOf(a: string, b: string, c: number?): number
	local d = string.len(a)
	local e
	if c then
		e = c
	else
		e = d
	end
	if c and c < 1 then
		e = 1
	end
	if c and c > d then
		e = d
	end
	if b == "" then
		
		return e :: number
	end

	local f, g
	
	local h: number? = 0
	repeat
		f = g
		
		g, h = string.find(a, b, h :: number + 1, true)
	until g == nil or g > e

	if f == nil then
		return -1
end
	
	return f :: number
end

return lastIndexOf
