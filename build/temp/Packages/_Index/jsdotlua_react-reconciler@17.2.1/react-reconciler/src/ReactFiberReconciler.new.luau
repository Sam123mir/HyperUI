









local a = _G.__DEV__ :: boolean
local b = require(script.Parent.Parent:WaitForChild('shared'))
type React_Component<Props, State> = b.React_Component<Props, State>
local c = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
local d = c.Array
local e = c.Object
type Function = (...any) -> ...any


local f = require(script.Parent.Parent:WaitForChild('shared')).console

type Object = { [string]: any }
type Array<T> = { [number]: T }

local g = require(script.Parent:WaitForChild('ReactInternalTypes'))
type Fiber = g.Fiber
type SuspenseHydrationCallbacks = g.SuspenseHydrationCallbacks
type FiberRoot = g.FiberRoot

local h = require(script.Parent:WaitForChild('ReactRootTags'))
type RootTag = h.RootTag

local i = require(script.Parent:WaitForChild('ReactFiberFlags'))

local j = require(script.Parent:WaitForChild('ReactFiberHostConfig'))
type Instance = j.Instance
type TextInstance = j.TextInstance
type Container = j.Container
type PublicInstance = j.PublicInstance
type RendererInspectionConfig = j.RendererInspectionConfig

local k = require(script.Parent:WaitForChild('ReactWorkTags'))
local l = k.FundamentalComponent
local m = require(script.Parent.Parent:WaitForChild('shared'))
type ReactNodeList = m.ReactNodeList

local n = require(script.Parent:WaitForChild('ReactFiberLane'))
type Lane = n.Lane
type LanePriority = n.LanePriority
local o = require(script.Parent:WaitForChild('ReactFiberSuspenseComponent.new'))
type SuspenseState = o.SuspenseState

local p = require(script.Parent:WaitForChild('ReactFiberTreeReflection'))
local q = p.findCurrentHostFiber
local r =
	p.findCurrentHostFiberWithNoPortals
local s = require(script.Parent.Parent:WaitForChild('shared')).ReactInstanceMap.get
local t = k.HostComponent
local u = k.ClassComponent
local v = k.HostRoot
local w = k.SuspenseComponent
local x = require(script.Parent.Parent:WaitForChild('shared')).getComponentName
local y = require(script.Parent.Parent:WaitForChild('shared')).invariant
local z = require(script.Parent.Parent:WaitForChild('shared')).describeError
local A =
	require(script.Parent.Parent:WaitForChild('shared')).ReactFeatureFlags.enableSchedulingProfiler
local B = require(script.Parent.Parent:WaitForChild('shared')).ReactSharedInternals
local C = require(script.Parent:WaitForChild('ReactFiberHostConfig')).getPublicInstance
local D = require(script.Parent:WaitForChild('ReactFiberContext.new'))
local E = D.findCurrentUnmaskedContext
local F = D.processChildContext
local G = D.emptyContextObject
local H = D.isContextProvider
local I = require(script.Parent:WaitForChild('ReactFiberRoot.new'))
local J = I.createFiberRoot
local K = require(script.Parent:WaitForChild('ReactFiberDevToolsHook.new'))
local L = K.injectInternals
local M = K.onScheduleRoot
local N = require(script.Parent:WaitForChild('ReactFiberWorkLoop.new')):: any
local O = N.requestEventTime
local P = N.requestUpdateLane
local Q = N.scheduleUpdateOnFiber
local R = N.flushRoot
local S = N.batchedEventUpdates
local T = N.batchedUpdates
local U = N.unbatchedUpdates
local V = N.flushSync
local W = N.flushControlled
local X = N.deferredUpdates
local Y = N.discreteUpdates
local Z = N.flushDiscreteUpdates
local _ = N.flushPassiveEffects
local aa = N.warnIfNotScopedWithMatchingAct
local ab = N.warnIfUnmockedScheduler
local ac = N.IsThisRendererActing
local ad = N.act :: (() -> ()) -> ()
local ae = require(script.Parent:WaitForChild('ReactUpdateQueue.new'))
local af = ae.createUpdate
local ag = ae.enqueueUpdate
local ah = require(script.Parent:WaitForChild('ReactCurrentFiber'))
local ai = ah.isRendering


local aj = ah.resetCurrentFiber
local ak = ah.setCurrentFiber
local al = require(script.Parent:WaitForChild('ReactTypeOfMode'))
local am = al.StrictMode
local an = n.SyncLane
local ao = n.InputDiscreteHydrationLane
local ap = n.SelectiveHydrationLane
local aq = n.NoTimestamp
local ar = n.getHighestPriorityPendingLanes
local as = n.higherPriorityLane
local at = n.getCurrentUpdateLanePriority
local au = n.setCurrentUpdateLanePriority





local av = require(script.Parent:WaitForChild('SchedulingProfiler')).markRenderScheduled

local aw = {}


aw.ReactRootTags = h

aw.ReactWorkTags = k


aw.ReactTypeOfMode = al
aw.ReactFiberFlags = i
aw.getNearestMountedFiber = p.getNearestMountedFiber
aw.findCurrentFiberUsingSlowPath =
	p.findCurrentFiberUsingSlowPath


aw.createPortal = require(script.Parent:WaitForChild('ReactPortal')).createPortal













type OpaqueRoot = FiberRoot



type BundleType = number

type DevToolsConfig = {
	bundleType: BundleType,
	version: string,
	rendererPackageName: string,
	
	
	findFiberByHostInstance: ((Instance | TextInstance) -> Fiber)?,
	rendererConfig: RendererInspectionConfig?
}

local ax
local ay

if a then
	ax = false
	ay = {}
end

local function getContextForSubtree(az: any?): Object
	if not az then
		return G
	end

	local aA = s(az)
	local aB = E(aA)

	if aA.tag == u then
		local aC = aA.type
		if H(aC) then
			return F(aA, aC, aB)
		end
	end

	return aB
end

local function findHostInstance(az: Object): PublicInstance | nil
	local aA = s(az)
	if aA == nil then
		if typeof(az.render) == "function" then
			y(false, "Unable to find node on an unmounted component.")
		else
			y(
				false,
				"Argument appears to not be a ReactComponent. Keys: %s",
				
				table.concat(e.keys(az))
			)
		end
	end
	local aB = q(aA)
	if aB == nil then
		return nil
	end
	return aB.stateNode
end

local function findHostInstanceWithWarning(
	az: Object,
	aA: string
): PublicInstance | nil
	if a then
		local aB = s(az)
		if aB == nil then
			if typeof(az.render) == "function" then
				y(false, "Unable to find node on an unmounted component.")
			else
				y(
					false,
					"Argument appears to not be a ReactComponent. Keys: %s",
					
					table.concat(e.keys(az))
				)
			end
		end
		local aC = q(aB)
		if aC == nil then
			return nil
		end
		if bit32.band(aC.mode, am) ~= 0 then
			local aD = x(aB.type) or "Component"
			if not ay[aD] then
				ay[aD] = true

				local aE = ah.current
				local aF, aG = xpcall(function()
					ak(aC)
					if bit32.band(aB.mode, am) ~= 0 then
						f.error(
[[%s is deprecated in StrictMode. %s was passed an instance of %s which is inside StrictMode. Instead, add a ref directly to the element you want to reference. Learn more about using refs safely here: https://reactjs.org/link/strict-mode-find-node]]



,
							aA,
							aA,
							aD
						)
					else
						f.error(
[[%s is deprecated in StrictMode. %s was passed an instance of %s which renders StrictMode children. Instead, add a ref directly to the element you want to reference. Learn more about using refs safely here: https://reactjs.org/link/strict-mode-find-node]]



,
							aA,
							aA,
							aD
						)
					end
				end, z)

				
				
				if aE then
					ak(aE)
				else
					aj()
				end

				if not aF then
					error(aG)
				end
			end
		end
		return aC.stateNode
	end
	return findHostInstance(az)
end

aw.createContainer = function(
	az: Container,
	aA: RootTag,
	aB: boolean,
	aC: nil | SuspenseHydrationCallbacks
): OpaqueRoot
	return J(az, aA, aB, aC)
end

aw.updateContainer = function(
	az: ReactNodeList,
	aA: OpaqueRoot,
	aB,
	aC: Function?
): Lane
	if a then
		M(aA, az)
	end
	local aD = aA.current
	local aE = O()
	if a then
		
		
		if _G.__TESTEZ_RUNNING_TEST__ then
			ab(aD)
			aa(aD)
		end
	end
	local aF = P(aD)

	if A then
		av(aF)
	end

	local aG = getContextForSubtree(aB)
	if aA.context == nil then
		aA.context = aG
	else
		aA.pendingContext = aG
	end

	if a then
		if
			ai
			and ah.current ~= nil
			and not ax
		then
			ax = true
			f.error(
[[Render methods should be a pure function of props and state; triggering nested component updates from render is not allowed. If necessary, trigger nested updates in componentDidUpdate.

Check the render method of %s.]]
,
				x((ah.current :: any).type) or "Unknown"
			)
		end
	end

	local aH = af(aE, aF)
	
	
	if az == nil then
		az = e.None
	end
	
	
	aH.payload = {
		element = az,
	}

	
	
	if aC ~= nil then
		if a then
			if typeof(aC) ~= "function" then
				f.error(
[[render(...): Expected the last optional `callback` argument to be a function. Instead received: %s.]]
,
					tostring(aC)
				)
			end
		end
		aH.callback = aC
	end

	ag(aD, aH)
	Q(aD, aF, aE)

	return aF
end


aw.batchedEventUpdates = S
aw.batchedUpdates = T
aw.unbatchedUpdates = U
aw.deferredUpdates = X
aw.discreteUpdates = Y
aw.flushDiscreteUpdates = Z
aw.flushControlled = W
aw.flushSync = V
aw.flushPassiveEffects = _
aw.IsThisRendererActing = ac
aw.act = ad

aw.getPublicRootInstance =
	function(az: OpaqueRoot): React_Component<any, any> | PublicInstance | nil
		local aA = az.current
		if not aA.child then
			return nil
		end
		if aA.child.tag == t then
			return C(aA.child.stateNode)
		else
			return aA.child.stateNode
		end
	end


local az

aw.attemptSynchronousHydration = function(aA: Fiber)
	if aA.tag == v then
		local aB: FiberRoot = aA.stateNode
		if aB.hydrate then
			
			local aC = ar(aB)
			R(aB, aC)
		end
	elseif aA.tag == w then
		local aB = O()
		V(function()
			return Q(aA, an, aB)
		end)
		
		
		
		local aC = ao
		az(aA, aC)
	end
end

local function markRetryLaneImpl(aA: Fiber, aB: Lane)
	local aC: SuspenseState? = aA.memoizedState
	if aC then
		if aC ~= nil and aC.dehydrated ~= nil then
			aC.retryLane =
				as(aC.retryLane, aB)
		end
	end
end


az = function(aA: Fiber, aB: Lane)
	markRetryLaneImpl(aA, aB)
	
	local aC = aA.alternate
	if aC then
		markRetryLaneImpl(aC, aB)
	end
end

aw.attemptUserBlockingHydration = function(aA: Fiber)
	if aA.tag ~= w then
		
		
		
		
		return
	end
	local aB = O()
	local aC = ao
	Q(aA, aC, aB)
	az(aA, aC)
end

aw.attemptContinuousHydration = function(aA: Fiber)
	if aA.tag ~= w then
		
		
		
		
		return
	end
	local aB = O()
	local aC = ap
	Q(aA, aC, aB)
	az(aA, aC)
end

aw.attemptHydrationAtCurrentPriority = function(aA: Fiber)
	if aA.tag ~= w then
		
		
		return
	end
	local aB = O()
	local aC = P(aA)
	Q(aA, aC, aB)
	az(aA, aC)
end

aw.runWithPriority = function<T>(aA: LanePriority, aB: () -> T): T
	local aC = at()
	
	au(aA)
	local aD, aE = xpcall(aB, z)
	au(aC)
	if not aD then
		error(aE)
	end
	return aE
end

aw.getCurrentUpdateLanePriority = at

aw.findHostInstance = findHostInstance

aw.findHostInstanceWithWarning = findHostInstanceWithWarning

aw.findHostInstanceWithNoPortals = function(aA: Fiber): PublicInstance?
	local aB = r(aA)
	if aB == nil then
		return nil
	end
	if aB.tag == l then
		return aB.stateNode.instance
	end
	return aB.stateNode
end

local function shouldSuspendImpl(aA)
	return false
end

aw.shouldSuspend = function(aA: Fiber): boolean
	return shouldSuspendImpl(aA)
end

local aA 
local aB 
local aC 
local aD 
local aE 
local aF 
local aG 
local aH 

if a then
	
	local function copyWithDeleteImpl(
		aI: Object,
		aJ: Array<string | number>,
		aK: number
	)
		local aL = aJ[aK]
		local aM
		if d.isArray(aI) then
			aM = d.slice(aI)
		else
			aM = table.clone(aI)
		end
		if aK + 1 == #aJ then
			if d.isArray(aM) then
				
				local aN: number = aL
				d.splice(aM, aN, 1)
			else
				aM[aL] = nil
			end
			return aM
		end
		
		aM[aL] = copyWithDeleteImpl(aI[aL], aJ, aK + 1)
		return aM
	end

	
	local function copyWithDelete(
		aI: Object,
		aJ: Array<string | number>
	): Object | Array<any>
		return copyWithDeleteImpl(aI, aJ, 0)
	end

	
	local function copyWithRenameImpl(
		aI: Object,
		aJ: Array<string | number>,
		aK: Array<string | number>,
		aL: number
	)
		local aM = aJ[aL]
		local aN
		if d.isArray(aI) then
			aN = d.slice(aI)
		else
			aN = table.clone(aI)
		end
		if aL + 1 == #aJ then
			local aO = aK[aL]
			
			aN[aO] = aN[aM]
			if d.isArray(aN) then
				d.splice(aN, aM, 1)
			else
				aN[aM] = nil
			end
		else
			
			aN[aM] = copyWithRenameImpl(
				
				aI[aM],
				aJ,
				aK,
				aL + 1
			)
		end
		return aN
	end

	
	local function copyWithRename(
		aI: Object,
		aJ: Array<string | number>,
		aK: Array<string | number>
	): Object | Array<any> | nil
		if #aJ ~= #aK then
			f.warn("copyWithRename() expects paths of the same length")
			return nil
		else
			for aL = 1, #aK do
				if aJ[aL] ~= aK[aL] then
					f.warn(
						"copyWithRename() expects paths to be the same except for the deepest key"
					)
					return nil
				end
			end
		end
		return copyWithRenameImpl(aI, aJ, aK, 0)
	end

	
	local function copyWithSetImpl(
		aI: Object,
		aJ: Array<string | number>,
		aK: number,
		aL: any
	)
		if aK >= (#aJ + 1) then
			return aL
		end
		local aM = aJ[aK]
		local aN
		if d.isArray(aI) then
			aN = d.slice(aI)
		else
			aN = table.clone(aI)
		end
		
		aN[aM] = copyWithSetImpl(aI[aM], aJ, aK + 2, aL)
		return aN
	end

	
	local function copyWithSet(
		aI: Object,
		aJ: Array<string | number>,
		aK: any
	): Object | Array<any>
		return copyWithSetImpl(aI, aJ, 1, aK)
	end

	local function findHook(aI: Fiber, aJ: number)
		
		
		local aK = aI.memoizedState
		while aK ~= nil and aJ > 1 do
			aK = aK.next
			aJ -= 1
		end
		return aK
	end

	
	aA =
		function(aI: Fiber, aJ: number, aK: Array<string | number>, aL: any)
			local aM = findHook(aI, aJ)
			if aM ~= nil then
				local aN = copyWithSet(aM.memoizedState, aK, aL)
				aM.memoizedState = aN
				aM.baseState = aN

				
				
				
				
				
				aI.memoizedProps = table.clone(aI.memoizedProps)

				Q(aI, an, aq)
			end
		end
	aB =
		function(aI: Fiber, aJ: number, aK: Array<string | number>)
			local aL = findHook(aI, aJ)
			if aL ~= nil then
				local aM = copyWithDelete(aL.memoizedState, aK)
				aL.memoizedState = aM
				aL.baseState = aM

				
				
				
				
				
				aI.memoizedProps = table.clone(aI.memoizedProps)

				Q(aI, an, aq)
			end
		end
	aC = function(
		aI: Fiber,
		aJ: number,
		aK: Array<string | number>,
		aL: Array<string | number>
	)
		local aM = findHook(aI, aJ)
		if aM ~= nil then
			local aN = copyWithRename(aM.memoizedState, aK, aL)
			aM.memoizedState = aN
			aM.baseState = aN

			
			
			
			
			
			aI.memoizedProps = table.clone(aI.memoizedProps)

			Q(aI, an, aq)
		end
	end

	
	aD = function(aI: Fiber, aJ: Array<string | number>, aK: any)
		aI.pendingProps = copyWithSet(aI.memoizedProps, aJ, aK)
		
		local aL = aI.alternate
		if aL then
			aL.pendingProps = aI.pendingProps
		end
		Q(aI, an, aq)
	end
	aE = function(aI: Fiber, aJ: Array<string | number>)
		aI.pendingProps = copyWithDelete(aI.memoizedProps, aJ)
		
		local aK = aI.alternate
		if aK then
			aK.pendingProps = aI.pendingProps
		end
		Q(aI, an, aq)
	end
	aF = function(
		aI: Fiber,
		aJ: Array<string | number>,
		aK: Array<string | number>
	)
		aI.pendingProps = copyWithRename(aI.memoizedProps, aJ, aK)
		
		local aL = aI.alternate
		if aL then
			aL.pendingProps = aI.pendingProps
		end
		Q(aI, an, aq)
	end

	aG = function(aI: Fiber)
		Q(aI, an, aq)
	end

	aH = function(aI: (Fiber) -> (boolean))
		shouldSuspendImpl = aI
	end
end

function findHostInstanceByFiber(aI: Fiber): Instance | TextInstance | nil
	local aJ = q(aI)
	if aJ == nil then
		return nil
	end
	return aJ.stateNode
end

function emptyFindFiberByHostInstance(aI: Instance | TextInstance): Fiber | nil
	return nil
end

function getCurrentFiberForDevTools()
	return ah.current
end

aw.injectIntoDevTools = function(aI: DevToolsConfig): boolean
	local aJ = aI.findFiberByHostInstance
	local aK = B.ReactCurrentDispatcher
	local aL 	
if a then
		aL = getCurrentFiberForDevTools
	end
	return L({
		bundleType = aI.bundleType,
		version = aI.version,
		rendererPackageName = aI.rendererPackageName,
		rendererConfig = aI.rendererConfig,
		overrideHookState = aA,
		overrideHookStateDeletePath = aB,
		overrideHookStateRenamePath = aC,
		overrideProps = aD,
		overridePropsDeletePath = aE,
		overridePropsRenamePath = aF,
		setSuspenseHandler = aH,
		scheduleUpdate = aG,
		currentDispatcherRef = aK,
		findHostInstanceByFiber = findHostInstanceByFiber,
		findFiberByHostInstance = aJ or emptyFindFiberByHostInstance,
		
		
		
		
		
		
		
		getCurrentFiber = aL,
	})
end

aw.robloxReactProfiling = require(script.Parent.RobloxReactProfiling)

return aw
