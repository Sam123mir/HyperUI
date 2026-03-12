local function endsWith(a: string, b: string, c: number?): boolean
	local d = b:len()
	if d == 0 then
		return true
	end
	local e = a:len()
	local f = c or e
	if f > e then
		f = e
	end
	if f < 1 then
		return false
	end
	local g = f - d + 1
	return a:find(b, g, true) == g
end

return endsWith
