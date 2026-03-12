local a = require(script.Parent:WaitForChild('findOr'))
local b = require(script.Parent:WaitForChild('slice'))

local c = require(script.Parent.Parent:WaitForChild('es7-types'))
type Array<T> = c.Array<T>
local d = require(script.Parent.Parent:WaitForChild('number')).MAX_SAFE_INTEGER

type Pattern = string | Array<string>

local function split(e: string, f: Pattern?, g: number?): Array<string>
	if f == nil then
		return { e }
	end
	if g == 0 then
		return {}
	end
	local h = if g == nil or g < 0 then d else g
	local i = f
	local j: Array<string>
	if typeof(i) == "string" then
		if i == "" then
			local k = {}
			for l in e:gmatch(".") do
				table.insert(k, l)
			end
			return k
		end
		j = { i }
	else
		j = i :: Array<string>
	end
	local k = 1
	local l = {}
	local m
	local n, o = utf8.len(e)
	assert(n ~= nil, ("string `%s` has an invalid byte at position %s"):format(e, tostring(o)))

	repeat
		local p = a(e, j, k)
		if p ~= nil then
			table.insert(l, b(e, k, p.index))
			local q = utf8.len(p.match)
			
			k = p.index + q :: number
		else
			table.insert(l, b(e, k, nil))
		end
		if p ~= nil then
			m = p
		end
	until p == nil or k > n or #l >= h
	if m ~= nil then
		local p, q = utf8.len(m.match)
		assert(
			p ~= nil,
			("string `%s` has an invalid byte at position %s"):format(m.match, tostring(q))
		)
		if m.index + p == n + 1 then
			table.insert(l, "")
		end
	end
	return l
end

return split
