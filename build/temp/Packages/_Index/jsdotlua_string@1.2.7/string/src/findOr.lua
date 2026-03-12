type Match = {
	index: number,
	match: string
}


local a = "([" .. ("$%^()-[].?"):gsub("(.)", "%%%1") .. "])"

local function findOr(b: string, c: { string }, d: number?): Match | nil
	

	local e = utf8.offset(b, d or 1)
	local f = {}
	for g, h in c do
		h = h:gsub(a, "%%%1")
		local i, j = string.find(b, h, e)
		if i then
			local k = string.sub(b, 1, i - 1)
			local l, m = utf8.len(k)
			if l == nil then
				error(("string `%s` has an invalid byte at position %s"):format(k, tostring(m)))
			end
			local n = l :: number + 1
			local o = {
				index = n,
				match = string.sub(b, i, j),
			}
			table.insert(f, o)
		end
	end

	
	if #f == 0 then
		return nil
	end

	
	

	local g
	for h, i in f do
		
		if g == nil then
			g = i
		end
		
		if i.index < g.index then
			g = i
		end
	end

	
	return g
end

return findOr
