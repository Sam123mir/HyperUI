local function startsWith(a: string, b: string, c: number?): boolean
	if string.len(b) == 0 then
		return true
	end
	
	local d
	if c == nil or c < 1 then
		d = 1
	else
		d = c
	end

	if d > string.len(a) then
		return false
	end
	return a:find(b, d, true) == d
end

return startsWith
