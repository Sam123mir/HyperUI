








local a = require(script.Parent:WaitForChild('ReactSymbols'))
local b = a.REACT_CONTEXT_TYPE
local c = a.REACT_FORWARD_REF_TYPE
local d = a.REACT_FRAGMENT_TYPE
local e = a.REACT_PROFILER_TYPE
local f = a.REACT_PROVIDER_TYPE
local g = a.REACT_DEBUG_TRACING_MODE_TYPE
local h = a.REACT_STRICT_MODE_TYPE
local i = a.REACT_SUSPENSE_TYPE

local j = a.REACT_MEMO_TYPE
local k = a.REACT_LAZY_TYPE
local l = a.REACT_FUNDAMENTAL_TYPE

local m = a.REACT_BLOCK_TYPE
local n = a.REACT_SERVER_BLOCK_TYPE
local o = a.REACT_LEGACY_HIDDEN_TYPE




return function(p)
	local q = typeof(p)
	if q == "string" or q == "function" then
		return true
	end

	
	if
		p == d
		or p == e
		or p == g
		or p == h
		or p == i
		or p == o
		
		
		
	then
		return true
	end

	if q == "table" then
		
		
		if p.isReactComponent then
			return true
		end

		if
			p["$$typeof"] == k
			or p["$$typeof"] == j
			or p["$$typeof"] == f
			or p["$$typeof"] == b
			or p["$$typeof"] == c
			or p["$$typeof"] == l
			or p["$$typeof"] == m
			or p[1] == n
		then
			return true
		end
	end

	return false
end
