

local a = game:GetService("HttpService")

local b = require(script.Parent:WaitForChild('Array'):WaitForChild('isArray'))
local c = require(script.Parent.Parent:WaitForChild('es7-types'))

type Array<T> = c.Array<T>




export type InspectOptions = {
	depth: number?
}

type FormatOptions = {
	depth: number
}

local d = 10
local e = 2


local f
local g
local h
local i
local j




local function inspect(k, l: InspectOptions?): string
	local m: InspectOptions = l or { depth = e }
	local n = m.depth or e
	m.depth = if n >= 0 then n else e
	return f(k, {}, m :: FormatOptions)
end

local function isIndexKey(k, l)
	return type(k) == "number"
		and k <= l 
		and 1 <= k 
		and math.floor(k) == k 
end

local function getTableLength(k)
	local l = 1
	local m = rawget(k, l)
	while m ~= nil do
		l += 1
		m = rawget(k, l)
	end
	return l - 1
end

local function sortKeysForPrinting(k: any, l)
	local m = type(k)
	local n = type(l)

	
	if m == n and (m == "number" or m == "string") then
		return k < l
	end

	
	return m < n
end

local function rawpairs(k)
	return next, k, nil
end

local function getFragmentedKeys(k)
	local l = {}
	local m = 0
	local n = getTableLength(k)
	for o, p in rawpairs(k) do
		if not isIndexKey(o, n) then
			m = m + 1
			l[m] = o
		end
	end
	table.sort(l, sortKeysForPrinting)
	return l, m, n
end

function f(k, l, m: FormatOptions)
	local n = typeof(k)
	if n == "string" then
		return a:JSONEncode(k)
		
	elseif n == "number" then
		if k ~= k then
			return "NaN"
		elseif k == math.huge then
			return "Infinity"
		elseif k == -math.huge then
			return "-Infinity"
		else
			return tostring(k)
		end
	elseif n == "function" then
		local o = "[function"
		local p = debug.info(k :: (any) -> any, "n")
		if p ~= nil and p ~= "" then
			o ..= " " .. p
		end
		return o .. "]"
	elseif n == "table" then
		
		
		
		
		return g(k, l, m)
	else
		return tostring(k)
	end
end

function g(k, l, m: FormatOptions)
	if table.find(l, k) ~= nil then
		return "[Circular]"
	end

	local n = { unpack(l) }
	table.insert(n, k)

	if typeof(k.toJSON) == "function" then
		local o = k:toJSON(k)

		if o ~= k then
			if typeof(o) == "string" then
				return o
			else
				return f(o, n, m)
			end
		end
	elseif b(k) then
		return h(k, n, m)
	end

	return i(k, n, m)
end

function i(k, l, m: FormatOptions)
	local n = ""
	local o = getmetatable(k)
	if o and rawget(o, "__tostring") then
		return tostring(k)
	end

	local p, q, r = getFragmentedKeys(k)

	if r == 0 and q == 0 then
		n ..= "{}"
		return n
	end
	if #l > m.depth then
		n ..= "[" .. j(k) .. "]"
		return n
	end

	local s = {}
	for t = 1, r do
		local u = f(k[t], l, m)

		table.insert(s, u)
	end

	for t = 1, q do
		local u = p[t]
		local v = f(k[u], l, m)

		table.insert(s, u .. ": " .. v)
	end

	n ..= "{ " .. table.concat(s, ", ") .. " }"
	return n
end

function h(k: Array<any>, l: Array<any>, m: FormatOptions): string
	local n = #k
	if n == 0 then
		return "[]"
	end
	if #l > m.depth then
		return "[Array]"
	end

	local o = math.min(d, n)
	local p = n - o
	local q = {}

	for r = 1, o do
		q[r] = (f(k[r], l, m))
	end

	if p == 1 then
		table.insert(q, "... 1 more item")
	elseif p > 1 then
		table.insert(q, ("... %s more items"):format(tostring(p)))
	end

	return "[" .. table.concat(q, ", ") .. "]"
end

function j(k): string
	
	
	
	

	
	

	
	
	
	

	
	return "Object"
end

return inspect
