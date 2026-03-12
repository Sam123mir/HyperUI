










local a = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
local b = a.Set
local c = a.Map

local d = require(script.Parent:WaitForChild('ReactInternalTypes'))
type Fiber = d.Fiber
type FiberRoot = d.FiberRoot
type SuspenseHydrationCallbacks = d.SuspenseHydrationCallbacks
local e = require(script.Parent:WaitForChild('ReactRootTags'))
type RootTag = e.RootTag

local f = require(script.Parent:WaitForChild('ReactFiberHostConfig'))
local g = f.noTimeout
local h = f.supportsHydration
local i = require(script.Parent:WaitForChild('ReactFiber.new'))
local j = i.createHostRootFiber
local k = require(script.Parent:WaitForChild('ReactFiberLane'))
local l = k.NoLanes
local m = k.NoLanePriority
local n = k.NoTimestamp
local o = k.createLaneMap
local p = require(script.Parent.Parent:WaitForChild('shared')).ReactFeatureFlags
local q = p.enableSchedulerTracing
local r = p.enableSuspenseCallback

local s = require(script.Parent.Parent:WaitForChild('scheduler')).tracing
local t = s.unstable_getThreadID
local u = require(script.Parent:WaitForChild('ReactUpdateQueue.new'))
local v = u.initializeUpdateQueue
local w = e.LegacyRoot
local x = e.BlockingRoot
local y = e.ConcurrentRoot

local z = {}

local function FiberRootNode(A, B, C)
	
	local D = {
		tag = B,
		containerInfo = A,
		pendingChildren = nil,
		
		current = (nil :: any) :: Fiber,
		pingCache = nil,
		finishedWork = nil,
		timeoutHandle = g,
		context = nil,
		pendingContext = nil,
		hydrate = C,
		callbackNode = nil,
		callbackPriority = m,
		eventTimes = o(l),
		expirationTimes = o(n),

		pendingLanes = l,
		suspendedLanes = l,
		pingedLanes = l,
		expiredLanes = l,
		mutableReadLanes = l,
		finishedLanes = l,

		entangledLanes = l,
		entanglements = o(l),
	}

	if h then
		D.mutableSourceEagerHydrationData = nil
	end

	if q then
		D.interactionThreadID = t()
		D.memoizedInteractions = b.new()
		D.pendingInteractionMap = c.new()
	end
	if r then
		D.hydrationCallbacks = nil
	end

	if _G.__DEV__ then
		if B == x then
			D._debugRootType = "createBlockingRoot()"
		elseif B == y then
			D._debugRootType = "createRoot()"
		elseif B == w then
			D._debugRootType = "createLegacyRoot()"
		end
	end

	return D
end

z.createFiberRoot = function(
	A: any,
	B: RootTag,
	C: boolean,
	D: SuspenseHydrationCallbacks?
): FiberRoot
	local E: FiberRoot = FiberRootNode(A, B, C)
	if r then
		E.hydrationCallbacks = D
	end

	
	
	local F = j(B)
	E.current = F
	F.stateNode = E

	v(F)

	return E
end

return z
