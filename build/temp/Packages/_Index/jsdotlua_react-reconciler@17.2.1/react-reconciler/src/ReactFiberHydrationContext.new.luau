











local a = require(script.Parent.Parent:WaitForChild('shared')).console


local function unimplemented(b: string)
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. b)
	error("FIXME (roblox): " .. b .. " is unimplemented", 2)
end

local b = require(script.Parent:WaitForChild('ReactInternalTypes'))
type Fiber = b.Fiber
local c = require(script.Parent:WaitForChild('ReactFiberHostConfig'))
type Instance = c.Instance
type TextInstance = c.TextInstance
type HydratableInstance = c.HydratableInstance
type SuspenseInstance = c.SuspenseInstance
type Container = c.Container
type HostContext = c.HostContext

local d = require(script.Parent:WaitForChild('ReactFiberSuspenseComponent.new'))
type SuspenseState = d.SuspenseState

local e = require(script.Parent:WaitForChild('ReactWorkTags'))
local f = e.HostComponent
local g = e.HostText
local h = e.HostRoot
local i = e.SuspenseComponent
local j = require(script.Parent:WaitForChild('ReactFiberFlags'))
local k = j.Placement
local l = j.Hydrating


local m = require(script.Parent.Parent:WaitForChild('shared')).invariant

local n = require(script.Parent:WaitForChild('ReactFiber.new'))

local o = n.createFiberFromDehydratedFragment

local p = c.supportsHydration
local q = c.getNextHydratableSibling
local r = c.getFirstHydratableChild
local s = c.canHydrateInstance
local t = c.canHydrateTextInstance
local u = c.canHydrateSuspenseInstance
local v = c.hydrateInstance
local w = c.hydrateTextInstance
local x = c.hydrateSuspenseInstance
local y =
	c.getNextHydratableInstanceAfterSuspenseInstance
local z =
	c.didNotMatchHydratedContainerTextInstance
local A =
	c.didNotMatchHydratedTextInstance
local B = c.shouldSetTextContent











local C =
	require(script.Parent.Parent:WaitForChild('shared')).ReactFeatureFlags.enableSuspenseServerRenderer
local D = require(script.Parent:WaitForChild('ReactFiberLane')).OffscreenLane



local E: Fiber? 
local F: nil | HydratableInstance 
local G: boolean = false

function warnIfHydrating()
	if _G.__DEV__ then
		if G then
			a.error(
				"We should not be hydrating here. This is a bug in React. Please file a bug."
			)
		end
	end
end

function enterHydrationState(H: Fiber): boolean
	if not p then
		return false
	end

	local I = H.stateNode.containerInfo
	F = r(I)
	E = H
	G = true
	return true
end

function reenterHydrationStateFromDehydratedSuspenseInstance(
	H: Fiber,
	I: SuspenseInstance
): boolean
	if not p then
		return false
	end

	F = q(I)
	popToNextHostParent(H)
	G = true
	return true
end

function deleteHydratableInstance(H: Fiber?, I: HydratableInstance)
	unimplemented("deleteHydratableInstance")
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	

	
	
	
	
	
	
	
	
end

function insertNonHydratedInstance(H: Fiber?, I: Fiber)
	unimplemented("insertNonHydratedInstance")
	I.flags = bit32.bor(bit32.band(I.flags, bit32.bnot(l)), k)
	if _G.__DEV__ then
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	end
end

function tryHydrate(H, I)
	if H.tag == f then
		local J = H.type
		local K = H.pendingProps
		local L = s(I, J, K)
		if L ~= nil then
			H.stateNode = L
			return true
		end
		return false
	elseif H.tag == g then
		local J = H.pendingProps
		local K = t(I, J)
		if K ~= nil then
			H.stateNode = K
			return true
		end
		return false
	elseif H.tag == i then
		if C then
			local J: nil | SuspenseInstance =
				u(I)
			if J ~= nil then
				local K: SuspenseState = {
					dehydrated = J,
					retryLane = D,
				}
				H.memoizedState = K
				
				
				
				
				local L =
					o(J)
				L.return_ = H
				H.child = L
				return true
			end
		end
		return false
	else
		return false
	end
end

function tryToClaimNextHydratableInstance(H: Fiber)
	if not G then
		return
	end
	local I = F
	if not I then
		
		insertNonHydratedInstance(E, H)
		G = false
		E = H
		return
	end
	
	local J = I :: HydratableInstance
	if not tryHydrate(H, I) then
		
		
		
		I = q(J)
		if not I or not tryHydrate(H, I) then
			
			insertNonHydratedInstance(E, H)
			G = false
			E = H
			return
		end
		
		
		
		
		deleteHydratableInstance(E, J)
	end
	E = H
	F = r(I)
end

function prepareToHydrateHostInstance(
	H: Fiber,
	I: Container,
	J: HostContext
): boolean
	if not p then
		m(
			false,
[[Expected prepareToHydrateHostInstance() to never be called. This error is likely caused by a bug in React. Please file an issue.]]		

)
	end

	local K: Instance = H.stateNode
	local L = v(
		K,
		H.type,
		H.memoizedProps,
		I,
		J,
		H
	)
	
	H.updateQueue = L
	
	
	if L ~= nil then
		return true
	end
	return false
end

function prepareToHydrateHostTextInstance(H: Fiber): boolean
	if not p then
		m(
			false,
[[Expected prepareToHydrateHostTextInstance() to never be called. This error is likely caused by a bug in React. Please file an issue.]]		

)
	end

	local I: TextInstance = H.stateNode
	local J: string = H.memoizedProps
	local K = w(I, J, H)
	if _G.__DEV__ then
		if K then
			
			
			local L = E
			if L ~= nil then
				if L.tag == h then
					local M = L.stateNode.containerInfo
					z(
						M,
						I,
						J
					)
				elseif L.tag == f then
					local M = L.type
					local N = L.memoizedProps
					local O = L.stateNode
					A(
						M,
						N,
						O,
						I,
						J
					)
				end
			end
		end
	end
	return K
end

function prepareToHydrateHostSuspenseInstance(H: Fiber)
	if not p then
		m(
			false,
[[Expected prepareToHydrateHostSuspenseInstance() to never be called. This error is likely caused by a bug in React. Please file an issue.]]		

)
	end

	local I: SuspenseState = H.memoizedState
	local J: nil | SuspenseInstance
	if I ~= nil then
		J = I.dehydrated
	else
		J = nil
	end

	m(
		J,
[[Expected to have a hydrated suspense instance. This error is likely caused by a bug in React. Please file an issue.]]	

)
	x(J, H)
end

function skipPastDehydratedSuspenseInstance(H: Fiber): nil | HydratableInstance
	if not p then
		m(
			false,
[[Expected skipPastDehydratedSuspenseInstance() to never be called. This error is likely caused by a bug in React. Please file an issue.]]		

)
	end
	local I: SuspenseState = H.memoizedState
	local J: nil | SuspenseInstance
	if I ~= nil then
		J = I.dehydrated
	else
		J = nil
	end
	m(
		J,
[[Expected to have a hydrated suspense instance. This error is likely caused by a bug in React. Please file an issue.]]	

)
	return y(J)
end

function popToNextHostParent(H: Fiber)
	local I = H.return_
	while
		I ~= nil
		and I.tag ~= f
		and I.tag ~= h
		and I.tag ~= i
	do
		I = I.return_
	end
	E = I
end

function popHydrationState(H: Fiber): boolean
	if not p then
		return false
	end
	if H ~= E then
		
		
		return false
	end
	if not G then
		
		
		
		popToNextHostParent(H)
		G = true
		return false
	end

	local I = H.type

	
	
	
	
	
	if
		H.tag ~= f
		or (
			I ~= "head"
			and I ~= "body"
			and not B(I, H.memoizedProps)
		)
	then
		local J = F
		while J do
			deleteHydratableInstance(H, J)
			J = q(J)
		end
	end

	popToNextHostParent(H)
	if H.tag == i then
		F = skipPastDehydratedSuspenseInstance(H)
	else
		if E then
			F = q(H.stateNode)
		else
			F = nil
		end
	end
	return true
end

function resetHydrationState()
	if not p then
		return
	end

	E = nil
	F = nil
	G = false
end

function getIsHydrating(): boolean
	return G
end

return {
	warnIfHydrating = warnIfHydrating,
	enterHydrationState = enterHydrationState,
	getIsHydrating = getIsHydrating,
	reenterHydrationStateFromDehydratedSuspenseInstance = reenterHydrationStateFromDehydratedSuspenseInstance,
	resetHydrationState = resetHydrationState,
	tryToClaimNextHydratableInstance = tryToClaimNextHydratableInstance,
	prepareToHydrateHostInstance = prepareToHydrateHostInstance,
	prepareToHydrateHostTextInstance = prepareToHydrateHostTextInstance,
	prepareToHydrateHostSuspenseInstance = prepareToHydrateHostSuspenseInstance,
	popHydrationState = popHydrationState,
}
