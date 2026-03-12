











local a = require(script.Parent.Parent:WaitForChild('shared')).console

local b = require(script.Parent:WaitForChild('ReactInternalTypes'))
type Fiber = b.Fiber
local c = require(script.Parent:WaitForChild('ReactFiberHostConfig'))
type Container = c.Container
type SuspenseInstance = c.SuspenseInstance
local d = require(script.Parent:WaitForChild('ReactFiberSuspenseComponent.new'))
type SuspenseState = d.SuspenseState

local e = require(script.Parent.Parent:WaitForChild('shared')).invariant

local f = require(script.Parent.Parent:WaitForChild('shared')).ReactInstanceMap.get
local g = require(script.Parent.Parent:WaitForChild('shared')).ReactSharedInternals
local h = require(script.Parent.Parent:WaitForChild('shared')).getComponentName
local i = require(script.Parent:WaitForChild('ReactWorkTags'))
local j = i.ClassComponent
local k = i.HostComponent
local l = i.HostRoot
local m = i.HostPortal
local n = i.HostText
local o = i.FundamentalComponent
local p = i.SuspenseComponent
local q = require(script.Parent:WaitForChild('ReactFiberFlags'))
local r = q.NoFlags
local s = q.Placement
local t = q.Hydrating
local u =
	require(script.Parent.Parent:WaitForChild('shared')).ReactFeatureFlags.enableFundamentalAPI

local v = g.ReactCurrentOwner

local w = {}

local function getNearestMountedFiber(x: Fiber): Fiber?
	local y = x
	
	local z: Fiber | nil = x
	if not x.alternate then
		
		
		local A = y
		repeat
			y = A
			if bit32.band(y.flags, bit32.bor(s, t)) ~= r then
				
				
				
				z = y.return_
			end
			A = y.return_
		until not A
	else
		while y.return_ do
			y = y.return_
		end
	end
	if y.tag == l then
		
		
		return z
	end
	
	
	return nil
end
w.getNearestMountedFiber = getNearestMountedFiber

w.getSuspenseInstanceFromFiber = function(x: Fiber): SuspenseInstance?
	if x.tag == p then
		local y: SuspenseState? = x.memoizedState
		if y == nil then
			local z = x.alternate
			if z ~= nil then
				y = z.memoizedState
			end
		end
		if y then
			return y.dehydrated
		end
	end
	return nil
end

w.getContainerFromFiber = function(x: Fiber): Container?
	return if x.tag == l then x.stateNode.containerInfo else nil
end

w.isFiberMounted = function(x: Fiber): boolean
	return getNearestMountedFiber(x) == x
end



w.isMounted = function(x): boolean
	if _G.__DEV__ then
		local y: any = v.current
		if y ~= nil and y.tag == j then
			local z: Fiber = y
			local A = z.stateNode
			if not A._warnedAboutRefsInRender then
				a.error(
[[%s is accessing isMounted inside its render() function. render() should be a pure function of props and state. It should never access something that requires stale data from the previous render, such as refs. Move this logic to componentDidMount and componentDidUpdate instead.]]



,
					h(z.type) or "A component"
				)
			end
			A._warnedAboutRefsInRender = true
		end
	end

	local y: Fiber? = f(x)
	if not y then
		return false
	else
		
		local z: any = y
		return getNearestMountedFiber(z) == y
	end
end

local function assertIsMounted(x)
	e(
		getNearestMountedFiber(x) == x,
		"Unable to find node on an unmounted component."
	)
end

local function findCurrentFiberUsingSlowPath(x: Fiber): Fiber?
	local y = x.alternate
	if not y then
		
		local z = getNearestMountedFiber(x)
		e(z ~= nil, "Unable to find node on an unmounted component.")
		if z ~= x then
			return nil
		end
		return x
	end
	
	
	
	local z: Fiber = x
	local A: Fiber = y
	while true do
		local B = z.return_
		if B == nil then
			
			break
		end
		local C = B.alternate
		if C == nil then
			
			
			
			
			local D = B.return_
			if D ~= nil then
				z = D
				A = D
				continue
			end
			
			break
		end

		
		
		
		if B.child == C.child then
			local D = B.child
			while D do
				if D == z then
					
					assertIsMounted(B)
					return x
				end
				if D == A then
					
					assertIsMounted(B)
					return y
				end
				D = D.sibling
			end
			
			
			e(false, "Unable to find node on an unmounted component.")
		end

		if z.return_ ~= A.return_ then
			
			
			
			
			z = B
			A = C
		else
			
			
			
			
			
			local D = false
			local E = B.child
			while E do
				if E == z then
					D = true
					z = B
					A = C
					break
				end
				if E == A then
					D = true
					A = B
					z = C
					break
				end
				E = E.sibling
			end
			if not D then
				
				E = C.child
				while E do
					if E == z then
						D = true
						z = C
						A = B
						break
					end
					if E == A then
						D = true
						A = C
						z = B
						break
					end
					E = E.sibling
				end
				e(
					D,
[[Child was not found in either parent set. This indicates a bug in React related to the return pointer. Please file an issue.]]				

)
			end
		end

		e(
			z.alternate == A,
[[Return fibers should always be each others' alternates. This error is likely caused by a bug in React. Please file an issue.]]		

)
	end
	
	
	e(z.tag == l, "Unable to find node on an unmounted component.")
	if z.stateNode.current == z then
		
		return x
	end
	
	return y
end
w.findCurrentFiberUsingSlowPath = findCurrentFiberUsingSlowPath

w.findCurrentHostFiber = function(x: Fiber): Fiber?
	local y = findCurrentFiberUsingSlowPath(x)
	if not y then
		return nil
	end

	
	
	local z: Fiber = y :: Fiber
	while true do
		local A = z.child
		if z.tag == k or z.tag == n then
			return z
		elseif A then
			A.return_ = z
			z = A
			continue
		end
		if z == y then
			return nil
		end
		local B = z.return_
		local C = z.sibling
		while not C do
			if not B or B == y then
				return nil
			end
			
			z = B :: Fiber
		end
		
		(C :: Fiber).return_ = B :: Fiber
		z = C :: Fiber
	end
	
	
	return nil
end

w.findCurrentHostFiberWithNoPortals = function(x: Fiber): Fiber?
	local y = findCurrentFiberUsingSlowPath(x)
	if not y then
		return nil
	end

	
	local z: Fiber = y :: Fiber
	while true do
		local A = z.child
		if
			z.tag == k
			or z.tag == n
			or (u and z.tag == o)
		then
			return z
		elseif A and z.tag ~= m then
			A.return_ = z
			z = A
			continue
		end
		if z == y then
			return nil
		end
		local B = z.return_
		local C = z.sibling
		while not C do
			if not B or B == y then
				return nil
			end
			
			z = B :: Fiber
		end
		
		(C :: Fiber).return_ = B :: Fiber
		z = C :: Fiber
	end
	
	
	return nil
end

w.isFiberSuspenseAndTimedOut = function(x: Fiber): boolean
	local y = x.memoizedState
	return x.tag == p
		and y ~= nil
		and y.dehydrated == nil
end

w.doesFiberContain = function(x: Fiber, y: Fiber): boolean
	local z = y
	local A = x.alternate
	while z ~= nil do
		if z == x or z == A then
			return true
		end
		
		z = z.return_ :: Fiber
	end
	return false
end

return w
