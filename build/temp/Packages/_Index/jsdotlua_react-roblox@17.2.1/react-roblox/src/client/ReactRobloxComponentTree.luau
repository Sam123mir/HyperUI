











local a = require(script.Parent:WaitForChild('ReactRobloxHostTypes.roblox'))
type HostInstance = a.HostInstance
type TextInstance = a.TextInstance
type SuspenseInstance = a.SuspenseInstance
type Container = a.Container
type Props = a.Props

local b = require(script.Parent.Parent.Parent:WaitForChild('react-reconciler'))
type Fiber = b.Fiber
local c = require(script.Parent.Parent.Parent:WaitForChild('shared'))
type ReactScopeInstance = c.ReactScopeInstance












local d
local e
local f
local g
local h

local i
local j = c.invariant


local k: { [any]: any } = {}




local l: { [Container]: Fiber } = {}
local m: { [(HostInstance | SuspenseInstance | ReactScopeInstance)]: Fiber } =
	{}
local n: { [(HostInstance | SuspenseInstance)]: Props } = {}

local o = string.sub(tostring(math.random()), 3)
local p = "__reactFiber$" .. o
local q = "__reactContainer$" .. o





k.precacheFiberNode =
	function(r: Fiber, s: HostInstance | SuspenseInstance | ReactScopeInstance)
		m[s] = r
	end

k.uncacheFiberNode =
	function(r: HostInstance | SuspenseInstance | ReactScopeInstance)
		m[r] = nil
		n[r] = nil
	end

k.markContainerAsRoot = function(r: Fiber, s: Container)
	
	l[s] = r
	
end

k.unmarkContainerAsRoot = function(r: Container)
	
	l[r] = nil
	
end

k.isContainerMarkedAsRoot = function(r: Container): boolean
	
	return not not l[r]
	
end









k.getClosestInstanceFromNode = function(r: Instance): Fiber?
	
	local s = m[r]
	if s then
		
		return s
	end
	
	
	local t = r.Parent
	while t do
		
		
		
		
		
		
		
		
		s = m[t]
		if s then
			
			
			
			
			
			
			
			
			
			
			
			
			
			local u = s.alternate
			if
				s.child ~= nil
				or (u ~= nil and u.child ~= nil)
			then
				
				if i == nil then
					i = (require(
						script.Parent.ReactRobloxHostConfig
					) :: any).getParentSuspenseInstance
				end

				
				
				local v = i(r)
				while v ~= nil do
					
					
					
					
					
					
					
					
					local w = m[v]
					if w then
						return w
					end
					
					
					
					
					v = i(v)
					
					
					
				end
			end
			return s
		end
		r = t
		t = r.Parent
	end
	return nil
end





k.getInstanceFromNode = function(r): Fiber?
	
	if d == nil then
		local s = require(script.Parent.Parent:WaitForChild('ReactReconciler.roblox')):: any
		d = s.ReactWorkTags

		e = d.HostComponent
		f = d.HostComponent
		g = d.HostComponent
		h = d.HostComponent
	end

	local s = (r :: any)[p]
		or (r :: any)[q]
	if s then
		if
			s.tag == e
			or s.tag == f
			or s.tag == h
			or s.tag == g
		then
			return s
		else
			return nil
		end
	end
	return nil
end





k.getNodeFromInstance = function(r: Fiber): Instance | TextInstance
	if r.tag == e or r.tag == f then
		
		
		return r.stateNode
	end

	
	
	j(false, "getNodeFromInstance: Invalid argument.")
	
	error("getNodeFromInstance: Invalid argument.")
end

k.getFiberCurrentPropsFromNode =
	function(r: Instance | TextInstance | SuspenseInstance): Props
		return n[r]
	end

k.updateFiberProps = function(r: Instance | SuspenseInstance, s: Props)
	n[r] = s
end





















































return k
