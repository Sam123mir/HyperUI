










local a = require(script.Parent.Parent:WaitForChild('shared'))


type ReactElement = a.ReactElement<any, any>

local b = require(script.Parent:WaitForChild('ReactInternalTypes'))
type Fiber = b.Fiber






















local c = require(script.Parent.Parent:WaitForChild('shared')).ReactSymbols
local d = c.REACT_FORWARD_REF_TYPE



export type Family = {
	current: any
}







type RefreshHandler = (any) -> (Family?)












local e 


local f: { [number]: Fiber } | nil 

local g = {}







local function resolveFunctionForHotReloading(h: any): any
	if _G.__DEV__ then
		if e == nil then
			
			return h
		end
		local i = e(h)
		if i == nil then
			return h
		end
		
		return i.current
	else
		return h
	end
end
g.resolveFunctionForHotReloading = resolveFunctionForHotReloading

local function resolveClassForHotReloading(h: any): any
	
	return resolveFunctionForHotReloading(h)
end
g.resolveClassForHotReloading = resolveClassForHotReloading

local function resolveForwardRefForHotReloading(h: any): any
	if _G.__DEV__ then
		if e == nil then
			
			return h
		end
		local i = e(h)
		if i == nil then
			
			if h ~= nil and typeof(h.render) == "function" then
				
				
				
				local j = resolveFunctionForHotReloading(h.render)
				if h.render ~= j then
					local k = {
						["$$typeof"] = d,
						render = j,
						
						displayName = nil,
					}
					if h.displayName ~= nil then
						k.displayName = h.displayName
					end
					return k
				end
			end
			return h
		end
		
		return i.current
	else
		return h
	end
end
g.resolveForwardRefForHotReloading = resolveForwardRefForHotReloading

g.isCompatibleFamilyForHotReloading =
	function(h: Fiber, i: ReactElement): boolean
		warn("isCompatibleFamilyForHotReloading is stubbed (returns false)")
		return false
		
		
		
		
		

		
		

		
		

		
		
		
		

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	end

g.markFailedErrorBoundaryForHotReloading = function(h: Fiber)
	if _G.__DEV__ then
		if e == nil then
			
			return
		end
		
		
		
		
		if f == nil then
			f = {}
		end
		
		table.insert(f :: { [number]: Fiber }, h)
	end
end

































































































































































































































































return g
