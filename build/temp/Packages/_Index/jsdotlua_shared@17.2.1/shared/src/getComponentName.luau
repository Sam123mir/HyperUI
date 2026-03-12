









type Function = (...any) -> ...any
local a = require(script.Parent:WaitForChild('console'))


type LazyComponent<T, P> = {
	["$$typeof"]: number,
	_payload: P,
	_init: (payload: P) -> T
}

local b = require(script.Parent:WaitForChild('ReactSymbols'))
local c = b.REACT_CONTEXT_TYPE
local d = b.REACT_FORWARD_REF_TYPE
local e = b.REACT_FRAGMENT_TYPE
local f = b.REACT_PORTAL_TYPE
local g = b.REACT_MEMO_TYPE
local h = b.REACT_PROFILER_TYPE
local i = b.REACT_PROVIDER_TYPE
local j = b.REACT_STRICT_MODE_TYPE
local k = b.REACT_SUSPENSE_TYPE
local l = b.REACT_SUSPENSE_LIST_TYPE
local m = b.REACT_LAZY_TYPE
local n = b.REACT_BLOCK_TYPE
local o = require(script.Parent:WaitForChild('ReactTypes'))
type ReactContext<T> = o.ReactContext<T>
type ReactProviderType<T> = o.ReactProviderType<T>

local p = require(script.Parent:WaitForChild('ErrorHandling.roblox')).describeError

local function getWrappedName(q: any, r: any, s: string): string
	
	local t = "<function>"
	if typeof(r) == "table" then
		t = r.displayName or r.name or ""
	end
	return q.displayName
		or (
			t ~= "" and string.format("%s(%s)", s, t)
			or s
		)
end

local function getContextName(q: ReactContext<any>): string
	return q.displayName or "Context"
end

local function getComponentName(q: any): string | nil
	if q == nil then
		
		return nil
	end
	local r = typeof(q)

	if _G.__DEV__ then
		if r == "table" and typeof(q.tag) == "number" then
			a.warn(
[[Received an unexpected object in getComponentName(). This is likely a bug in React. Please file an issue.]]			

)
		end
	end

	if r == "function" then
		
		
		local s = debug.info((q :: any) :: Function, "n")
		
		if s and string.len(s) > 0 then
			return s
		else
			return nil
		end
	end

	if r == "string" then
		return (q :: any) :: string
	end

	if q == e then
		return "Fragment"
	elseif q == f then
		return "Portal"
	elseif q == h then
		return "Profiler"
	elseif q == j then
		return "StrictMode"
	elseif q == k then
		return "Suspense"
	elseif q == l then
		return "SuspenseList"
	end

	if r == "table" then
		local s = q["$$typeof"]
		if s == c then
			local t: ReactContext<any> = q :: any
			return getContextName(t) .. ".Consumer"
		elseif s == i then
			local t: ReactProviderType<any> = q :: any
			return getContextName(t._context) .. ".Provider"
		elseif s == d then
			return getWrappedName(q, q.render, "ForwardRef")
		elseif s == g then
			return getComponentName(q.type)
		elseif s == n then
			return getComponentName(q._render)
		elseif s == m then
			local t: LazyComponent<any, any> = q :: any
			local u = t._payload
			local v = t._init

			
			local w, x = xpcall(v, p, u)
			if w then
				return getComponentName(x)
			else
				return nil
			end
		else
			
			
			
			
			if q.displayName then
				return q.displayName
			end
			if q.name then
				return q.name
			end
			
			local t = getmetatable(q)
			if t and rawget(t, "__tostring") then
				return tostring(q)
			end
		end
	end

	return nil
end

return getComponentName
