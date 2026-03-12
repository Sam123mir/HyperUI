










local a = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
type Function = (...any) -> ...any
type Error = a.Error

local b = require(script.Parent:WaitForChild('ReactInternalTypes'))
type Fiber = b.Fiber

local c = require(script.Parent:WaitForChild('ReactWorkTags'))
local d = c.HostComponent
local e = c.LazyComponent
local f = c.SuspenseComponent
local g = c.SuspenseListComponent
local h = c.FunctionComponent
local i = c.IndeterminateComponent
local j = c.ForwardRef
local k = c.SimpleMemoComponent
local l = c.ClassComponent

local m = require(script.Parent.Parent:WaitForChild('shared')).ReactComponentStackFrame
local n =
	m.describeBuiltInComponentFrame
local o =
	m.describeFunctionComponentFrame
local p = m.describeClassComponentFrame

local function describeFiber(q: Fiber): string
	
	local r: nil | Function 	
if _G.__DEV__ then
		
		local s = q._debugOwner
		if s then
			r = s.type
		end
	end
	local s 	
if _G.__DEV__ then
		s = q._debugSource
	end
	if q.tag == d then
		return n(q.type, s, r)
	elseif q.tag == e then
		return n("Lazy", s, r)
	elseif q.tag == f then
		return n("Suspense", s, r)
	elseif q.tag == g then
		return n("SuspenseList", s, r)
	elseif
		q.tag == h
		or q.tag == i
		or q.tag == k
	then
		return o(q.type, s, r)
	elseif q.tag == j then
		return o(q.type.render, s, r)
	elseif q.tag == l then
		return p(q.type, s, r)
	else
		return ""
	end
end

return {
	getStackByFiberInDevAndProd = function(q: Fiber?): string
		local r: boolean, s: Error | string = pcall(function()
			local r = ""
			local s = q
			repeat
				r ..= describeFiber(s :: Fiber)
				s = (s :: Fiber).return_
			until s == nil
			return r
		end)

		if not r then
			local t = "\nError generating stack: "
			if
				typeof(s) == "table"
				and (s :: Error).message
				and (s :: Error).stack
			then
				return t
					.. (s :: Error).message
					.. "\n"
					.. tostring((s :: Error).stack)
			end
			return t .. tostring(s)
		end

		return s :: string
	end,
}
