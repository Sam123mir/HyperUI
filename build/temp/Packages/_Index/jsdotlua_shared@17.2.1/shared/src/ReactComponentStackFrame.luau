










type Object = { [string]: any }
type Function = (...any) -> ...any

local a = require(script.Parent:WaitForChild('ReactElementType'))
type Source = a.Source


local b = require(script.Parent:WaitForChild('flowtypes.roblox'))
type React_StatelessFunctionalComponent<P> = b.React_StatelessFunctionalComponent<
	P
>
type React_ComponentType<P> = b.React_ComponentType<P>
type ReactComponent<P> = React_StatelessFunctionalComponent<P> | React_ComponentType<P>





local c = require(script.Parent:WaitForChild('ReactSymbols'))
local d = c.REACT_SUSPENSE_TYPE
local e = c.REACT_SUSPENSE_LIST_TYPE
local f = c.REACT_FORWARD_REF_TYPE
local g = c.REACT_MEMO_TYPE
local h = c.REACT_BLOCK_TYPE
local i = c.REACT_LAZY_TYPE

local j = require(script.Parent:WaitForChild('ConsolePatchingDev.roblox'))
local k = j.disableLogs
local l = j.reenableLogs

local m = require(script.Parent:WaitForChild('ReactSharedInternals'))
local n = m.ReactCurrentDispatcher



local o = "    in "



local p
local q




local function describeOwner(r: nil | ReactComponent<any>): string?
	if type(r) == "function" then
		return debug.info(r :: (any) -> any, "n")
	elseif type(r) == "table" then
		return tostring(r)
	end
	return nil
end

local function describeBuiltInComponentFrame(
	r: string,
	s: Source | nil,
	
	t: nil | ReactComponent<any>
): string
	
	
	

	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	local u 	
if _G.__DEV__ and t then
		u = describeOwner(t)
	end

	return p(r, s, u)
	
end

local r = false
local s 
if _G.__DEV__ then
	s = setmetatable({}, { __mode = "k" })
end

local function describeNativeComponentFrame(
	t: nil | ReactComponent<any>, 
	u: boolean
): string
	
	if not t or r then
		return ""
	end

	if _G.__DEV__ then
		local v = s[t]

		if v ~= nil then
			return v
		end
	end

	local v
	r = true

	
	
	
	local w

	if _G.__DEV__ then
		w = n.current
		
		
		n.current = nil
		k()
	end

	
	
	
	
	
	
	local x
	local y, z = xpcall(function()
		if u then
			
			
			
		else
			local y, z = pcall(function()
				x = debug.traceback()
				error({
					stack = x,
				})
			end)
			v = z;
			
			(t :: (...any) -> ...any)()
		end
	end, function(y)
		return {
			message = y,
			stack = x,
		}
	end)

	
	
	
	
	local A 
	
if z and v and type(z.stack) == "string" then
		
		
		local B = string.split(z.stack, "\n")
		local C = string.split(v.stack, "\n")
		
		
		local D = #B - 1
		local E = #C - 1

		while
			D >= 2
			and E >= 0
			and B[D] ~= C[E]
		do
			
			
			
			
			
			
			E = E - 1
		end

		while D >= 3 and E >= 1 do
			D = D - 1
			E = E - 1
			
			
			if B[D] ~= C[E] then
				
				
				
				
				
				if D ~= 1 or E ~= 1 then
					repeat
						D = D - 1
						E = E - 1
						
						
						if
							E < 0
							or B[D] ~= C[E]
						then
							
							
							local F = "\n" .. o .. B[D]

							if _G.__DEV__ then
								s[t] = F
							end
							
							
							
							A = F
						end
					until not (D >= 3 and E >= 1)
				end

				break
			end
		end
	end

	r = false
	if _G.__DEV__ then
		n.current = w
		l()
	end

	
	

	
	if A ~= nil then
		return A
	end

	
	
	local B = if type(t) == "function"
		then debug.info(t :: Function, "n")
		
		else if type(t) == "table" then tostring(t) else ""

	local C = ""
	if B ~= nil and B ~= "" then
		C = describeBuiltInComponentFrame(B)
	end

	if _G.__DEV__ then
		s[t] = C
	end

	return C
end


local t = "^(.*)[\\/]"

function p(
	u: string | nil,
	v: Source | nil,
	w: string | nil
): string
	local x = ""

	if _G.__DEV__ and v then
		local y = v.fileName
		local z = string.gsub(y, t, "")

		
		
		
		
		if string.match(z, "^init%.") then
			
			local A = string.match(y, t)

			if A and #A ~= 0 then
				local B = string.gsub(A, t, "")
				z = B .. "/" .. z
			end
		end

		x = " (at " .. z .. ":" .. v.lineNumber .. ")"
	elseif w then
		x = " (created by " .. w .. ")"
	end

	return "\n    in " .. (u or "Unknown") .. x
end

local function describeClassComponentFrame(
	
	u: any,
	v: nil | Source,
	
	w: nil | ReactComponent<any>
): string
	
	

	
	
	
	
	
	local x = tostring(u)
	local y 	
if _G.__DEV__ and w then
		y = describeOwner(w)
	end
	return p(x, v, y)
	
end

function q(
	
	u: nil | Function,
	v: nil | Source,
	
	w: nil | ReactComponent<any>
): string
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	if not u then
		return ""
	end
	
	
	local x = if type(u) == "function"
		then debug.info(u :: Function, "n")
		else tostring(u)
	local y 	
if _G.__DEV__ and w then
		
		y = describeOwner(w)
	end
	return p(x, v, y)
end









local function describeUnknownElementTypeFrameInDEV(
	u: any,
	v: nil | Source,
	
	w: nil | ReactComponent<any>
): string
	if not _G.__DEV__ then
		return ""
	end
	if u == nil then
		return ""
	end

	
	
	if type(u) == "table" and type(u.__ctor) == "function" then
		
		
		
		return describeClassComponentFrame(u, v, w)
	end

	if type(u) == "function" then
		
		
		
		
		
		
		
		
		
		return q(u, v, w)
	end

	if type(u) == "string" then
		return describeBuiltInComponentFrame(u, v, w)
	end

	if u == d then
		return describeBuiltInComponentFrame("Suspense", v, w)
	elseif u == e then
		return describeBuiltInComponentFrame("SuspenseList", v, w)
	end

	if type(u) == "table" then
		local x = u["$$typeof"]
		if x == f then
			return q(u.render, v, w)
		elseif x == g then
			
			return describeUnknownElementTypeFrameInDEV(u.type, v, w)
		elseif x == h then
			return q(u._render, v, w)
		elseif x == i then
			local y = u
			local z = y._payload
			local A = y._init

			local B, C = pcall(function()
				describeUnknownElementTypeFrameInDEV(
					
					A(z),
					v,
					w
				)
			end)

			if B then
				return C
			end
		end
	end

	return ""
end

return {
	
	
	
	
	describeComponentFrame = p,

	describeBuiltInComponentFrame = describeBuiltInComponentFrame,
	describeNativeComponentFrame = describeNativeComponentFrame,
	describeClassComponentFrame = describeClassComponentFrame,
	describeFunctionComponentFrame = q,
	describeUnknownElementTypeFrameInDEV = describeUnknownElementTypeFrameInDEV,
}
