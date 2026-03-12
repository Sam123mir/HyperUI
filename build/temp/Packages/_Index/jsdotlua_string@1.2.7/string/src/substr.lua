return function(a: string, b: number, c: number?): string
	if c and c <= 0 then
		return ""
	end
	return string.sub(a, b, c and b + c - 1 or nil)
end
