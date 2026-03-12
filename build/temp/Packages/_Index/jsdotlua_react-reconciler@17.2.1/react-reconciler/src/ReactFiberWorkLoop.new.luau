









local a = _G.__DEV__
local b = _G.__YOLO__


local c = require(script.Parent.Parent:WaitForChild('shared')).console
local d = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
local e = d.Set
type Set<T> = d.Set<T>
type Array<T> = d.Array<T>

local f: any = {}

local g = require(script.Parent.Parent:WaitForChild('shared'))
type Thenable<T> = g.Thenable<T>
type Wakeable = g.Wakeable

local h = require(script.Parent:WaitForChild('ReactInternalTypes'))
type Fiber = h.Fiber
type FiberRoot = h.FiberRoot
type ReactPriorityLevel = h.ReactPriorityLevel
local i = require(script.Parent:WaitForChild('ReactFiberLane'))
type Lanes = i.Lanes
type Lane = i.Lane

local j = require(script.Parent.Parent:WaitForChild('scheduler'))


type Interaction = j.Interaction

local k = require(script.Parent:WaitForChild('ReactFiberSuspenseComponent.new'))
type SuspenseState = k.SuspenseState
local l = require(script.Parent:WaitForChild('ReactFiberStack.new'))
type StackCursor<T> = l.StackCursor<T>

local m = require(script.Parent.Parent:WaitForChild('shared')).ReactFeatureFlags






local n = m.enableDebugTracing
local o = m.enableSchedulingProfiler
local p = m.skipUnmountedBoundaries
local q = m.enableDoubleInvokingEffects
local r = require(script.Parent.Parent:WaitForChild('shared'))

type Dispatcher = r.Dispatcher
local s = require(script.Parent.Parent:WaitForChild('shared')).describeError
local t = r.ReactSharedInternals
local u = r.invariant

local v = require(script.Parent:WaitForChild('SchedulerWithReactIntegration.new'))
local w = v.scheduleCallback
local x = v.cancelCallback
local y = v.getCurrentPriorityLevel
local z = v.runWithPriority
local A = v.shouldYield
local B = v.requestPaint
local C = v.now
local D = v.NoPriority
local E = v.ImmediatePriority
local F = v.UserBlockingPriority
local G = v.NormalPriority
local H = v.flushSyncCallbackQueue
local I = v.scheduleSyncCallback










local J = require(script.Parent:WaitForChild('DebugTracing'))










local K = require(script.Parent:WaitForChild('SchedulingProfiler'))

local L = require(script.Parent.Parent:WaitForChild('scheduler')).tracing
local M, N =
	L.__interactionsRef, L.__subscriberRef

local O = require(script.Parent:WaitForChild('ReactFiberHostConfig'))











local P = require(script.Parent:WaitForChild('ReactFiber.new'))



local Q = require(script.Parent:WaitForChild('ReactTypeOfMode'))






local R = require(script.Parent:WaitForChild('ReactWorkTags'))










local S = require(script.Parent:WaitForChild('ReactRootTags')).LegacyRoot
local T = require(script.Parent:WaitForChild('ReactFiberFlags'))
type Flags = T.Flags











local U = i.SyncLane
local V = i.SyncBatchedLane
local W = i.NoTimestamp
local X = i.findUpdateLane
local Y = i.findTransitionLane
local Z = i.findRetryLane
local _ = i.includesSomeLane
local aa = i.isSubsetOfLanes
local ab = i.mergeLanes
local ac = i.removeLanes
local ad = i.pickArbitraryLane
local ae = i.hasDiscreteLanes
local af = i.includesNonIdleWork
local ag = i.includesOnlyRetries
local ah = i.includesOnlyTransitions
local ai = i.getNextLanes
local aj = i.returnNextLanesPriority
local ak = i.setCurrentUpdateLanePriority
local al = i.getCurrentUpdateLanePriority
local am = i.markStarvedLanesAsExpired
local an =
	i.getLanesToRetrySynchronouslyOnError
local ao = i.getMostRecentEventTime
local ap = i.markRootUpdated
local aq = i.markRootSuspended
local ar = i.markRootPinged
local as = i.markRootExpired
local at = i.markDiscreteUpdatesExpired
local au = i.markRootFinished
local av = i.schedulerPriorityToLanePriority
local aw = i.lanePriorityToSchedulerPriority
local ax = require(script.Parent:WaitForChild('ReactFiberTransition'))




local ay = require(script.Parent:WaitForChild('ReactFiberUnwindWork.new')):: any
local az = ay.unwindWork
local aA = ay.unwindInterruptedWork
local aB = require(script.Parent:WaitForChild('ReactFiberThrow.new')):: any
local aC = aB.throwException
local aD = aB.createRootErrorUpdate
local aE = aB.createClassErrorUpdate
local aF = require(script.Parent:WaitForChild('ReactFiberCommitWork.new'))
local aG =
	aF.commitBeforeMutationLifeCycles
local aH = aF.commitPlacement
local aI = aF.commitWork
local aJ = aF.commitDeletion
local aK = aF.commitPassiveUnmount
local aL =
	aF.commitPassiveUnmountInsideDeletedTree
local aM = aF.commitPassiveMount
local aN = aF.commitDetachRef



local aO = aF.invokeLayoutEffectMountInDEV
local aP = aF.invokePassiveEffectMountInDEV
local aQ = aF.invokeLayoutEffectUnmountInDEV
local aR =
	aF.invokePassiveEffectUnmountInDEV
local aS = aF.recursivelyCommitLayoutEffects

local aT = require(script.Parent.Parent:WaitForChild('promise'))

local aU = require(script.Parent:WaitForChild('ReactUpdateQueue.new')).enqueueUpdate

local aV =
	require(script.Parent:WaitForChild('ReactFiberNewContext.new')).resetContextDependencies


local aW = require(script.Parent.RobloxReactProfiling)


local aX


local aY = {
	resetHooksAfterThrowRef = (nil :: any) :: (...any) -> ...any,
	ContextOnlyDispatcherRef = (nil :: any) :: Dispatcher,
	getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = (nil :: any) :: (...any) -> ...any,
	originalBeginWorkRef = (nil :: any) :: (...any) -> ...any,
	completeWorkRef = (nil :: any) :: (...any) -> ...any,
}


local aZ =
	function(aZ: Fiber | nil, a_: Fiber, a0: Lanes): Fiber | nil
		if not aY.originalBeginWorkRef then
			aY.originalBeginWorkRef =
				require(script.Parent:WaitForChild('ReactFiberBeginWork.new')).beginWork
		end
		return aY.originalBeginWorkRef(aZ, a_, a0)
	end

local a_ =
	function(a_: Fiber | nil, a0: Fiber, a1: Lanes): Fiber | nil
		if not aY.completeWorkRef then
			aY.completeWorkRef =
				require(script.Parent:WaitForChild('ReactFiberCompleteWork.new')).completeWork
		end
		return (aY.completeWorkRef :: any)(a_, a0, a1)
	end

local a0

local function initReactFiberHooks()
	a0 = require(script.Parent:WaitForChild('ReactFiberHooks.new'))	
aY.resetHooksAfterThrowRef = a0.resetHooksAfterThrow
	aY.ContextOnlyDispatcherRef = a0.ContextOnlyDispatcher
	aY.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef =
		a0.getIsUpdatingOpaqueValueInRenderPhaseInDEV
end


local a1 = function(): ()
	if not aY.resetHooksAfterThrowRef then
		initReactFiberHooks()
	end
	return aY.resetHooksAfterThrowRef()
end


local a2 = function(): Dispatcher
	if not aY.ContextOnlyDispatcherRef then
		initReactFiberHooks()
	end
	return aY.ContextOnlyDispatcherRef
end


local a3 = function(): boolean?
	if not aY.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef then
		initReactFiberHooks()
	end
	return aY.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef()
end

local a4 = require(script.Parent:WaitForChild('ReactCapturedValue')).createCapturedValue
local a5 = l.push
local a6 = l.pop
local a7 = l.createCursor

local a8 = require(script.Parent:WaitForChild('ReactProfilerTimer.new'))


local a9 = require(script.Parent.Parent:WaitForChild('shared')).getComponentName
local ba = require(script.Parent:WaitForChild('ReactStrictModeWarnings.new'))
local bb = require(script.Parent:WaitForChild('ReactCurrentFiber'))


local bc = bb.current
local bd = bb.resetCurrentFiber
local be = bb.setCurrentFiber
local bf = require(script.Parent.Parent:WaitForChild('shared')).ReactErrorUtils
local bg = bf.invokeGuardedCallback
local bh = bf.hasCaughtError
local bi = bf.clearCaughtError
local bj = require(script.Parent:WaitForChild('ReactFiberDevToolsHook.new')).onCommitRoot
local bk = require(script.Parent:WaitForChild('ReactTestSelectors')).onCommitRoot


local bl = require(script.Parent.Parent:WaitForChild('shared')).enqueueTask
local bm = require(script.Parent:WaitForChild('ReactFiberTreeReflection')).doesFiberContain

local bn = t.ReactCurrentDispatcher
local bo = t.ReactCurrentOwner
local bp = t.IsSomeRendererActing
local bq, br




local bs: { [string]: any } = {}

type ExecutionContext = number

local bt = 
	0b0000000
local bu = 
	0b0000001
local bv = 
	0b0000010
local bw = 
	0b0000100
local bx = 
	0b0001000
local by = 
	0b0010000
local bz = 
	0b0100000
local bA = 
	0b1000000

f.NoContext = bt
f.RetryAfterError = bA



type RootExitStatus = number

local bB: { [string]: RootExitStatus } = {
	Incomplete = 0,
	FatalErrored = 1,
	Errored = 2,
	Suspended = 3,
	SuspendedWithDelay = 4,
	Completed = 5,
}


local bC: ExecutionContext = bt

local bD: FiberRoot? 

local bE: Fiber? 

local bF: Lanes = i.NoLanes









f.subtreeRenderLanes = i.NoLanes
local bG: StackCursor<Lanes> = a7(i.NoLanes)


local bH: RootExitStatus = bB.Incomplete

local bI: any 




local bJ: Lanes = i.NoLanes


local bK = require(script.Parent:WaitForChild('ReactFiberWorkInProgress'))
local bL: (value: Lanes?) -> Lanes =
	bK.workInProgressRootSkippedLanes 

local bM: Lanes = i.NoLanes

local bN: Lanes = i.NoLanes

local bO: FiberRoot | nil 



local bP: number = 0
local bQ: number = 500



local bR: number = math.huge


local bS = 500


local bT: Fiber | nil 

local function resetRenderTimer()
	bR = C() + bS
end

f.getRenderTargetTime = function(): number
	return bR
end

local bU = false
local bV 
local bW: Set<any> | nil 

local bX: boolean = false
local bY: FiberRoot? 
local bZ: ReactPriorityLevel = D
local b_: Lanes = i.NoLanes

local b0: Set<h.FiberRoot> | nil 


local b1 = 50
local b2: number = 0
local b3: FiberRoot | nil 

local b4 = 50
local b5: number = 0






local b6: nil | Array<Lane | Lanes> 




local b7: number = W
local b8: Lanes = i.NoLanes
local b9: Lanes = i.NoLanes

local ca: nil | Fiber 
local cb: boolean = false

f.getWorkInProgressRoot = function(): FiberRoot?
	return bD
end

f.requestEventTime = function()
	if
		bit32.band(bC, bit32.bor(by, bz))
		~= bt
	then
		
		return C()
	end
	
	if b7 ~= W then
		
		return b7
	end
	
	b7 = C()
	return b7
end





f.requestUpdateLane = function(cc: Fiber): Lane
	
	local cd = cc.mode
	if bit32.band(cd, Q.BlockingMode) == Q.NoMode then
		return U :: Lane
	elseif bit32.band(cd, Q.ConcurrentMode) == Q.NoMode then
		return if y() == E
			then U :: Lane
			else V :: Lane
	elseif
		not m.deferRenderPhaseUpdateToNextBatch
		and bit32.band(bC, by) ~= bt
		and bF ~= i.NoLanes
	then
		
		
		
		
		
		
		
		
		
		return ad(bF)
	end

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	if b8 == i.NoLanes then
		b8 = bJ
	end

	local ce = ax.requestCurrentTransition()
		~= ax.NoTransition
	if ce then
		if b9 ~= i.NoLanes then
			if bO ~= nil then
				b9 = bO.pendingLanes
			else
				b9 = i.NoLanes
			end
		end
		return Y(b8, b9)
	end

	
	
	local cf = y()

	
	
	
	
	
	
	local cg
	if
		
		bit32.band(bC, bw) ~= bt
		and cf == F
	then
		cg =
			X(i.InputDiscreteLanePriority, b8)
	else
		local ch = av(cf)

		if m.decoupleUpdatePriorityFromScheduler then
			
			
			
			local ci = al()

			if
				ch ~= ci
				and ci ~= i.NoLanePriority
			then
				if a then
					c.error(
						"Expected current scheduler lane priority %s to match current update lane priority %s",
						tostring(ch),
						tostring(ci)
					)
				end
			end
		end

		cg = X(ch, b8)
	end

	return cg
end

function requestRetryLane(cc: Fiber): Lane
	
	
	

	
	local cd = cc.mode
	if bit32.band(cd, Q.BlockingMode) == Q.NoMode then
		return U :: Lane
	elseif bit32.band(cd, Q.ConcurrentMode) == Q.NoMode then
		return if y() == E
			then U :: Lane
			else V :: Lane
	end

	
	if b8 == i.NoLanes then
		b8 = bJ
	end
	return Z(b8)
end

f.scheduleUpdateOnFiber = function(
	cc: Fiber,
	cd: Lane,
	ce: number
): FiberRoot | nil
	bs.checkForNestedUpdates()

	local cf = bs.markUpdateLaneFromFiberToRoot(cc, cd)
	if cf == nil then
		return nil
	end

	
	ap(cf, cd, ce)

	if cf == bD then
		
		
		
		
		
		bs.warnAboutRenderPhaseUpdatesInDEV(cc)

		if
			m.deferRenderPhaseUpdateToNextBatch
			or bit32.band(bC, by) == bt
		then
			bM =
				ab(bM, cd)
		end
		if bH == bB.SuspendedWithDelay then
			
			
			
			
			
			
			bs.markRootSuspended(cf, bF)
		end
	end

	
	
	local cg = y()

	if cd == U then
		if
			
			bit32.band(bC, bx) ~= bt
			
			and bit32.band(bC, bit32.bor(by, bz))
				== bt
		then
			
			bs.schedulePendingInteractions(cf, cd)

			
			
			
			bs.performSyncWorkOnRoot(cf)
		else
			aX(cf, ce)
			bs.schedulePendingInteractions(cf, cd)
			if bC == bt then
				
				
				
				
				
				resetRenderTimer()
				H()
			end
		end
	else
		
		if
			bit32.band(bC, bw) ~= bt
			
			
			and (
				cg == F
				or cg == E
			)
		then
			
			
			if b0 == nil then
				b0 = e.new({ cf })
			else
				b0:add(cf)
			end
		end
		
		aX(cf, ce)
		bs.schedulePendingInteractions(cf, cd)
	end

	
	
	
	
	
	bO = cf
	return cf
end





bs.markUpdateLaneFromFiberToRoot = function(cc: Fiber, cd: Lane): FiberRoot?
	
	cc.lanes = ab(cc.lanes, cd)
	local ce = cc.alternate
	if ce ~= nil then
		ce.lanes = ab(ce.lanes, cd)
	end
	if a then
		if
			ce == nil
			and bit32.band(
					cc.flags,
					bit32.bor(T.Placement, T.Hydrating)
				)
				~= T.NoFlags
		then
			bs.warnAboutUpdateOnNotYetMountedFiberInDEV(cc)
		end
	end
	
	local cf = cc
	local cg = cc.return_
	while cg ~= nil do
		cg.childLanes = ab(cg.childLanes, cd)
		ce = cg.alternate
		if ce ~= nil then
			ce.childLanes = ab(ce.childLanes, cd)
		else
			if a then
				if
					bit32.band(
						cg.flags,
						bit32.bor(T.Placement, T.Hydrating)
					) ~= T.NoFlags
				then
					bs.warnAboutUpdateOnNotYetMountedFiberInDEV(cc)
				end
			end
		end
		cf = cg
		cg = cg.return_
	end
	if cf.tag == R.HostRoot then
		local ch: FiberRoot = cf.stateNode
		return ch
	else
		return nil
	end
end






aX = function(cc: FiberRoot, cd: number)
	local ce = cc.callbackNode

	
	
	am(cc, cd)

	
	local cf
	if cc == bD then
		cf = bF
	else
		cf = i.NoLanes
	end
	local cg = ai(cc, cf)
	
	local ch = aj()

	if cg == i.NoLanes then
		
		if ce ~= nil then
			x(ce)
			cc.callbackNode = nil
			cc.callbackPriority = i.NoLanePriority
		end
		return
	end

	
	if ce ~= nil then
		local ci = cc.callbackPriority
		if ci == ch then
			
			return
		end
		
		
		x(ce)
	end

	
	local ci
	if ch == i.SyncLanePriority then
		
		
		ci = I(function()
			
			local cj = aW.profileRootBeforeUnitOfWork(cc)
			local ck = bs.performSyncWorkOnRoot(cc)
			aW.profileRootAfterYielding(cj)
			return ck
		end)
	elseif ch == i.SyncBatchedLanePriority then
		ci = w(E, function()
			
			local cj = aW.profileRootBeforeUnitOfWork(cc)
			local ck = bs.performSyncWorkOnRoot(cc)
			aW.profileRootAfterYielding(cj)
			return ck
		end)
	else
		local cj =
			aw(ch)
		ci = w(cj, function()
			
			local ck = aW.profileRootBeforeUnitOfWork(cc)
			local cl = bs.performConcurrentWorkOnRoot(cc)
			aW.profileRootAfterYielding(ck)
			return cl
		end)
	end

	cc.callbackPriority = ch
	cc.callbackNode = ci
end




bs.performConcurrentWorkOnRoot = function(cc): (() -> ...any) | nil
	
	
	b7 = W
	b8 = i.NoLanes
	b9 = i.NoLanes

	u(
		bit32.band(bC, bit32.bor(by, bz)) == bt,
		"Should not already be working."
	)

	
	
	local cd = cc.callbackNode
	local ce = f.flushPassiveEffects()
	if ce then
		
		
		if cc.callbackNode ~= cd then
			
			
			
			return nil
			
		
end
	end

	
	
	local cf = ai(
		cc,
		if cc == bD
			then bF
			else i.NoLanes
	)
	if cf == i.NoLanes then
		
		return nil
	end

	local cg = bs.renderRootConcurrent(cc, cf)

	if
		_(bJ, bM)
	then
		
		
		
		
		
		
		bs.prepareFreshStack(cc, i.NoLanes)
	elseif cg ~= bB.Incomplete then
		if cg == bB.Errored then
			bC = bit32.bor(bC, bA)

			
			
			if cc.hydrate then
				cc.hydrate = false
				O.clearContainer(cc.containerInfo)
			end

			
			
			
			
			cf = an(cc)
			if cf ~= i.NoLanes then
				cg = bs.renderRootSync(cc, cf)
			end
		end

		if cg == bB.FatalErrored then
			local ch = bI
			bs.prepareFreshStack(cc, i.NoLanes)
			bs.markRootSuspended(cc, cf)
			aX(cc, C())
			error(ch)
		end

		
		
		local ch: Fiber = cc.current.alternate :: any
		cc.finishedWork = ch
		cc.finishedLanes = cf
		bs.finishConcurrentRender(cc, cg, cf)
	end

	aX(cc, C())
	if cc.callbackNode == cd then
		
		
		return function()
			return bs.performConcurrentWorkOnRoot(cc)
		end
	end
	
	return nil :: any
end



local cc = 0
local cd = false

function shouldForceFlushFallbacksInDEV()
	
	return a and cc > 0
end

bs.finishConcurrentRender = function(ce, cf, cg)
	if
		cf == bB.Incomplete
		or cf == bB.FatalErrored
	then
		u(false, "Root did not complete. This is a bug in React.")
	
	
	
	elseif cf == bB.Errored then
		
		
		bs.commitRoot(ce)
	elseif cf == bB.Suspended then
		bs.markRootSuspended(ce, cg)

		
		
		if
			ag(cg)
			
			and not shouldForceFlushFallbacksInDEV()
		then
			
			
			local ch = bP
				+ bQ
				- C()
			
			if ch > 10 then
				local ci = ai(ce, i.NoLanes)
				if ci ~= i.NoLanes then
					
					return
				end
				local cj = ce.suspendedLanes
				if not aa(cj, cg) then
					
					
					
					
					local ck = f.requestEventTime()
					ar(ce, cj, ck)
					return
				end

				
				
				
				ce.timeoutHandle = O.scheduleTimeout(function()
					return bs.commitRoot(ce)
				end, ch)
				return
			end
		end
		
		bs.commitRoot(ce)
	elseif cf == bB.SuspendedWithDelay then
		bs.markRootSuspended(ce, cg)

		if ah(cg) then
			
			
			
			return
		end

		if not shouldForceFlushFallbacksInDEV() then
			
			
			
			
			
			

			local ch = ao(ce, cg)
			local ci = ch
			local cj = C() - ci
			local ck = jnd(cj) - cj

			
			if ck > 10 then
				
				
				ce.timeoutHandle = O.scheduleTimeout(function()
					return bs.commitRoot(ce)
				end, ck)
				return
			end
		end
		
		bs.commitRoot(ce)
	elseif cf == bB.Completed then
		
		bs.commitRoot(ce)
	else
		u(false, "Unknown root exit status.")
	end
end

bs.markRootSuspended = function(ce, cf)
	
	
	
	
	cf = ac(cf, bN)
	cf = ac(cf, bM)
	aq(ce, cf)
end



bs.performSyncWorkOnRoot = function(ce)
	u(
		bit32.band(bC, bit32.bor(by, bz)) == bt,
		"Should not already be working."
	)

	f.flushPassiveEffects()

	local cf
	local cg
	if
		ce == bD
		and _(ce.expiredLanes, bF)
	then
		
		
		cf = bF
		cg = bs.renderRootSync(ce, cf)
		if
			_(
				bJ,
				bM
			)
		then
			
			
			
			
			
			
			
			
			cf = ai(ce, cf)
			cg = bs.renderRootSync(ce, cf)
		end
	else
		cf = ai(ce, i.NoLanes)
		cg = bs.renderRootSync(ce, cf)
	end

	if ce.tag ~= S and cg == bB.Errored then
		bC = bit32.bor(bC, bA)

		
		
		if ce.hydrate then
			ce.hydrate = false
			O.clearContainer(ce.containerInfo)
		end

		
		
		
		
		cf = an(ce)
		if cf ~= i.NoLanes then
			cg = bs.renderRootSync(ce, cf)
		end
	end

	if cg == bB.FatalErrored then
		local ch = bI
		bs.prepareFreshStack(ce, i.NoLanes)
		bs.markRootSuspended(ce, cf)
		aX(ce, C())
		error(ch)
	end

	
	
	local ch: Fiber = ce.current.alternate :: any
	ce.finishedWork = ch
	ce.finishedLanes = cf
	bs.commitRoot(ce)

	
	
	aX(ce, C())

	return nil
end

f.flushRoot = function(ce: FiberRoot, cf: Lanes)
	as(ce, cf)
	aX(ce, C())
	if
		bit32.band(bC, bit32.bor(by, bz))
		== bt
	then
		resetRenderTimer()
		H()
	end
end

f.getExecutionContext = function(): ExecutionContext
	return bC
end

f.flushDiscreteUpdates = function()
	
	
	
	
	if
		bit32.band(
			bC,
			bit32.bor(bu, by, bz)
		) ~= bt
	then
		if a then
			if bit32.band(bC, by) ~= bt then
				c.error(
[[unstable_flushDiscreteUpdates: Cannot flush updates when React is already rendering.]]				

)
			end
		end
		
		
		
		return
	end
	bs.flushPendingDiscreteUpdates()
	
	
	f.flushPassiveEffects()
end

f.deferredUpdates = function<A>(ce: () -> A): A
	if m.decoupleUpdatePriorityFromScheduler then
		local cf = al()
		
		local cg, ch
		if not b then
			
			ak(i.DefaultLanePriority)
			cg, ch =
				xpcall(z, s, G, ce)
		else
			cg = true
			ak(i.DefaultLanePriority)
			ch = z(G, ce)
		end

		
		ak(cf)

		if cg then
			return ch
		else
			error(ch)
		end
	else
		return z(G, ce)
	end
end

bs.flushPendingDiscreteUpdates = function()
	if b0 ~= nil then
		
		
		local ce = b0
		b0 = nil
		ce:forEach(function(cf)
			at(cf)
			aX(cf, C())
		end)
	end
	
	H()
end

f.batchedUpdates = function<A, R>(ce: (A) -> R, cf: A): R
	local cg = bC
	bC = bit32.bor(bC, bu)

	
	local ch, ci
	if not b then
		ch, ci = xpcall(ce, s, cf)
	else
		ch = true
		ci = ce(cf)
	end

	
	bC = cg
	if bC == bt then
		
		resetRenderTimer()
		H()
	end

	if ch then
		return ci
	else
		error(ci)
	end
end

f.batchedEventUpdates = function<A, R>(ce: (A) -> R, cf: A): R
	local cg = bC
	bC = bit32.bor(bC, bv)

	
	local ch, ci
	if not b then
		ch, ci = xpcall(ce, s, cf)
	else
		ch = true
		ci = ce(cf)
	end

	
	bC = cg
	if bC == bt then
		
		resetRenderTimer()
		H()
	end

	if ch then
		return ci
	else
		error(ci)
	end
end

f.discreteUpdates =
	function<A, B, C, D, R>(ce: (A, B, C, D) -> R, cf: A, cg: B, ch: C, ci: D): R
		local cj = bC
		bC = bit32.bor(bC, bw)

		if m.decoupleUpdatePriorityFromScheduler then
			local ck = al()
			
			ak(i.InputDiscreteLanePriority)
			local cl, cm = xpcall(
				z,
				s,
				F,
				function()
					return ce(cf, cg, ch, ci)
				end
			)

			
			ak(ck)
			bC = cj
			if bC == bt then
				
				resetRenderTimer()
				H()
			end

			if cl then
				return cm
			else
				error(cm)
			end
		else
			local ck, cl = xpcall(
				z,
				s,
				F,
				function()
					return ce(cf, cg, ch, ci)
				end
			)

			
			bC = cj
			if bC == bt then
				
				resetRenderTimer()
				H()
			end

			if ck then
				return cl
			else
				error(cl)
			end
		end
	end

f.unbatchedUpdates = function<A, R>(ce: (A) -> R, cf: A): R
	local cg = bC
	bC = bit32.band(bC, bit32.bnot(bu))
	bC = bit32.bor(bC, bx)
	
	local ch, ci
	if not b then
		ch, ci = xpcall(ce, s, cf)
	else
		ch = true
		ci = ce(cf)
	end

	
	bC = cg
	if bC == bt then
		
		resetRenderTimer()
		H()
	end

	if ch then
		return ci
	else
		error(ci)
	end
end

f.flushSync = function<A, R>(ce: (A) -> R, cf: A): R
	local cg = bC
	if
		(bit32.band(cg, bit32.bor(by, bz)))
		~= bt
	then
		if a then
			c.error(
[[flushSync was called from inside a lifecycle method. React cannot flush when React is already rendering. Consider moving this call to a scheduler task or micro task.]]			


)
		end
		return ce(cf)
	end
	bC = bit32.bor(bC, bu)

	if m.decoupleUpdatePriorityFromScheduler then
		local ch = al()

		
		ak(i.SyncLanePriority)
		
		local ci, cj
		if not b then
			if ce then
				ci, cj = xpcall(
					z,
					s,
					E,
					function()
						return ce(cf)
					end
				)
			else
				ci = true
				
				cj = nil :: any
			end
		else
			ci = true
			ak(i.SyncLanePriority)
			if ce then
				cj = z(E, function()
					return ce(cf)
				end)
			else
				
				cj = nil :: any
			end
		end

		
		ak(ch)
		bC = cg
		
		
		
		H()

		if not ci then
			error(cj)
		end
		return cj
	else
		
		local ch, ci
		if not b then
			if ce then
				ch, ci = xpcall(
					z,
					s,
					E,
					function()
						return ce(cf)
					end
				)
			else
				ch = true
				
				ci = nil :: any
			end
		else
			ch = true
			if ce then
				ci = z(E, function()
					return ce(cf)
				end)
			else
				
				ci = nil :: any
			end
		end
		
		bC = cg
		
		
		
		H()
		if not ch then
			error(ci)
		end
		return ci
	end
end

f.flushControlled = function(ce: () -> any)
	local cf = bC
	bC = bit32.bor(bC, bu)
	if m.decoupleUpdatePriorityFromScheduler then
		local cg = al()
		
		ak(i.SyncLanePriority)
		local ch, ci =
			xpcall(z, s, E, ce)

		
		ak(cg)

		bC = cf
		if bC == bt then
			
			resetRenderTimer()
			H()
		end

		if not ch then
			error(ci)
		end
	else
		local cg, ch =
			xpcall(z, s, E, ce)
		
		bC = cf
		if bC == bt then
			
			resetRenderTimer()
			H()
		end

		if not cg then
			error(ch)
		end
	end
end

f.pushRenderLanes = function(ce: Fiber, cf: Lanes)
	a5(bG, f.subtreeRenderLanes, ce)
	f.subtreeRenderLanes = ab(f.subtreeRenderLanes, cf)
	bJ = ab(bJ, cf)
end

f.popRenderLanes = function(ce: Fiber)
	f.subtreeRenderLanes = bG.current
	a6(bG, ce)
end

bs.prepareFreshStack = function(ce: FiberRoot, cf: Lanes)
	ce.finishedWork = nil
	ce.finishedLanes = i.NoLanes

	local cg = ce.timeoutHandle
	if cg ~= O.noTimeout then
		
		
		ce.timeoutHandle = O.noTimeout
		
		O.cancelTimeout(cg)
	end

	if bE ~= nil then
		local ch = bE.return_
		while ch ~= nil do
			aA(ch)
			ch = ch.return_
		end
	end
	bD = ce
	bE = P.createWorkInProgress(ce.current, nil)
	bF = cf
	f.subtreeRenderLanes = cf
	bJ = cf
	bH = bB.Incomplete
	bI = nil
	bL(i.NoLanes)
	bM = i.NoLanes
	bN = i.NoLanes

	if m.enableSchedulerTracing then
		b6 = nil
	end

	if a then
		ba.discardPendingWarnings()
	end
end

bs.handleError = function(ce, cf): ()
	while true do
		local cg = bE
		
		local ch, ci = pcall(function()
			
			aV()
			a1()
			bd()
			
			
			bo.current = nil

			if cg == nil or cg.return_ == nil then
				
				
				
				
				bH = bB.FatalErrored
				bI = cf
				
				
				
				
				
				
				bE = nil
				
				return
			end

			
			if
				m.enableProfilerTimer
				and bit32.band(
						(cg :: Fiber).mode,
						Q.ProfileMode
					)
					~= 0
			then
				
				
				
				a8.stopProfilerTimerIfRunningAndRecordDelta(
					cg :: Fiber,
					true
				)
			end

			
			aC(
				ce,
				(cg :: Fiber).return_,
				cg :: Fiber,
				cf,
				bF,
				f.onUncaughtError,
				f.renderDidError
			)
			bs.completeUnitOfWork(cg)
		end)
		if not ch then
			
			cf = ci
			if bE == cg and cg ~= nil then
				
				
				cg = cg.return_
				bE = cg
			else
				cg = bE
			end
			continue
		end
		
		return
	end
end

bs.pushDispatcher = function()
	local ce = bn.current

	
	bn.current = a2()
	if ce == nil then
		
		
		

		
		return a2()
	else
		return ce
	end
end

bs.popDispatcher = function(ce)
	bn.current = ce
end

bs.pushInteractions = function(ce)
	if m.enableSchedulerTracing then
		local cf: Set<Interaction>? = M.current
		M.current = ce.memoizedInteractions
		return cf
	end
	return nil
end

bs.popInteractions = function(ce)
	if m.enableSchedulerTracing then
		M.current = ce
	end
end

f.markCommitTimeOfFallback = function(): ()
	bP = C()
end

f.markSkippedUpdateLanes = function(ce: Lane | Lanes): ()
	bK.markSkippedUpdateLanes(ce)
end

f.renderDidSuspend = function(): ()
	if bH == bB.Incomplete then
		bH = bB.Suspended
	end
end

f.renderDidSuspendDelayIfPossible = function(): ()
	if
		bH == bB.Incomplete
		or bH == bB.Suspended
	then
		bH = bB.SuspendedWithDelay
	end

	
	
	if
		bD ~= nil
		and (
			af(bL())
			or af(bM)
		)
	then
		
		
		
		
		
		
		
		bs.markRootSuspended(bD, bF)
	end
end

f.renderDidError = function()
	if bH ~= bB.Completed then
		bH = bB.Errored
	end
end



f.renderHasNotSuspendedYet = function(): boolean
	
	
	return bH == bB.Incomplete
end

bs.renderRootSync = function(ce: FiberRoot, cf: Lanes)
	local cg = bC
	bC = bit32.bor(bC, by)
	local ch = bs.pushDispatcher()

	
	
	if bD ~= ce or bF ~= cf then
		bs.prepareFreshStack(ce, cf)
		bs.startWorkOnPendingInteractions(ce, cf)
	end

	local ci = bs.pushInteractions(ce)

	if a then
		if n then
			J.logRenderStarted(cf)
		end
	end

	if o then
		K.markRenderStarted(cf)
	end

	while true do
		
		local cj, ck
		if not b then
			cj, ck = xpcall(bs.workLoopSync, s)
		else
			cj = true
			bs.workLoopSync()
		end

		if not cj then
			bs.handleError(ce, ck)
		else
			break
		end
	end
	aV()
	if m.enableSchedulerTracing then
		bs.popInteractions(ci)
	end

	bC = cg
	bs.popDispatcher(ch)

	if bE ~= nil then
		
		u(
			false,
[[Cannot commit an incomplete root. This error is likely caused by a bug in React. Please file an issue.]]		

)
	end

	if a then
		if n then
			J.logRenderStopped()
		end
	end

	if o then
		K.markRenderStopped()
	end

	
	bD = nil
	bF = i.NoLanes

	return bH
end



bs.workLoopSync = function()
	
	while bE ~= nil do
		bs.performUnitOfWork(bE)
	end
end

bs.renderRootConcurrent = function(ce: FiberRoot, cf: Lanes)
	local cg = bC
	bC = bit32.bor(bC, by)
	local ch = bs.pushDispatcher()

	
	
	if bD ~= ce or bF ~= cf then
		resetRenderTimer()
		bs.prepareFreshStack(ce, cf)
		bs.startWorkOnPendingInteractions(ce, cf)
	end

	local ci = bs.pushInteractions(ce)

	if a then
		if n then
			J.logRenderStarted(cf)
		end
	end

	if o then
		K.markRenderStarted(cf)
	end

	while true do
		
		local cj, ck
		if not b then
			
			cj, ck = xpcall(bs.workLoopConcurrent, s)
			if cj then
				ck = "break"
			end
		else
			cj = true
			ck = "break"
			bs.workLoopConcurrent()
		end

		if ck == "break" then
			break
		end
		if not cj then
			bs.handleError(ce, ck)
		end
	end
	aV()
	if m.enableSchedulerTracing then
		bs.popInteractions(ci)
	end

	bs.popDispatcher(ch)
	bC = cg

	if a then
		if n then
			J.logRenderStopped()
		end
	end

	
	if bE ~= nil then
		
		if o then
			K.markRenderYielded()
		end
		return bB.Incomplete
	else
		
		if o then
			K.markRenderStopped()
		end

		
		bD = nil
		bF = i.NoLanes

		
		return bH
	end
end


bs.workLoopConcurrent = function()
	
	while bE ~= nil and not A() do
		bs.performUnitOfWork(bE)
	end
end

bs.performUnitOfWork = function(ce: Fiber): ()
	
	local cf = aW.profileUnitOfWorkBefore(ce)

	
	
	
	local cg = ce.alternate
	be(ce)

	local ch
	if
		m.enableProfilerTimer
		and bit32.band(ce.mode, Q.ProfileMode)
			~= Q.NoMode
	then
		a8.startProfilerTimer(ce)
		ch = bs.beginWork(cg, ce, f.subtreeRenderLanes)
		a8.stopProfilerTimerIfRunningAndRecordDelta(ce, true)
	else
		ch = bs.beginWork(cg, ce, f.subtreeRenderLanes)
	end

	bd()
	ce.memoizedProps = ce.pendingProps
	if ch == nil then
		
		bs.completeUnitOfWork(ce)
	else
		bE = ch
	end

	bo.current = nil

	
	aW.profileUnitOfWorkAfter(cf)
end

bs.completeUnitOfWork = function(ce: Fiber)
	
	
	local cf = ce
	repeat
		
		
		
		local cg = cf.alternate
		local ch = cf.return_

		
		if
			bit32.band(cf.flags, T.Incomplete)
			== T.NoFlags
		then
			be(cf)
			local ci
			if
				not m.enableProfilerTimer
				or bit32.band(cf.mode, Q.ProfileMode)
					== Q.NoMode
			then
				ci = a_(cg, cf, f.subtreeRenderLanes)
			else
				a8.startProfilerTimer(cf)
				ci = a_(cg, cf, f.subtreeRenderLanes)
				
				a8.stopProfilerTimerIfRunningAndRecordDelta(
					cf,
					false
				)
			end
			bd()

			if ci ~= nil then
				
				bE = ci
				return
			end
		else
			
			
			
			local ci = az(cf, f.subtreeRenderLanes)

			

			if ci ~= nil then
				
				
				
				
				ci.flags = bit32.band(ci.flags, T.HostEffectMask)
				bE = ci
				return
			end

			if
				m.enableProfilerTimer
				and bit32.band(cf.mode, Q.ProfileMode)
					~= Q.NoMode
			then
				
				a8.stopProfilerTimerIfRunningAndRecordDelta(
					cf,
					false
				)

				
				
				local cj = cf.actualDuration or 0
				local ck = cf.child
				while ck ~= nil do
					cj += ck.actualDuration or 0
					ck = ck.sibling
				end
				cf.actualDuration = cj
			end

			if ch ~= nil then
				
				ch.flags =
					bit32.bor(ch.flags, T.Incomplete)
				ch.subtreeFlags = T.NoFlags
				ch.deletions = nil
			end
		end

		local ci = cf.sibling
		if ci ~= nil then
			
			bE = ci
			return
		end
		
		
		cf = ch :: any
		
		bE = cf
	until cf == nil

	
	if bH == bB.Incomplete then
		bH = bB.Completed
	end
end

bs.commitRoot = function(ce)
	local cf = y()
	z(E, function()
		
		aW.profileCommitBefore()
		local cg = bs.commitRootImpl(ce, cf)
		aW.profileCommitAfter()
		return cg
	end)
	return nil
end


bs.commitRootImpl = function(ce: FiberRoot, cf)
	repeat
		
		
		
		
		
		
		f.flushPassiveEffects()
	until bY == nil
	flushRenderPhaseStrictModeWarningsInDEV()

	u(
		bit32.band(bC, bit32.bor(by, bz)) == bt,
		"Should not already be working."
	)

	
	local cg = ce.finishedWork :: Fiber
	local ch = ce.finishedLanes

	if a then
		if n then
			J.logCommitStarted(ch)
		end
	end

	if o then
		K.markCommitStarted(ch)
	end

	if cg == nil then
		if a then
			if n then
				J.logCommitStopped()
			end
		end

		if o then
			K.markCommitStopped()
		end

		return nil
	end
	ce.finishedWork = nil
	ce.finishedLanes = i.NoLanes

	u(
		cg ~= ce.current,
[[Cannot commit the same tree as before. This error is likely caused by a bug in React. Please file an issue.]]	

)

	
	
	ce.callbackNode = nil

	
	
	local ci = ab(cg.lanes, cg.childLanes)
	au(ce, ci)

	
	
	
	if b0 ~= nil then
		if
			not ae(ci)
			and b0:has(ce)
		then
			b0:delete(ce)
		end
	end

	if ce == bD then
		
		bD = nil
		bE = nil
		bF = i.NoLanes
		
		
		
	
end

	
	
	
	
	
	local cj = bit32.band(
		cg.subtreeFlags,
		bit32.bor(
			T.BeforeMutationMask,
			T.MutationMask,
			T.LayoutMask,
			T.PassiveMask
		)
	) ~= T.NoFlags
	local ck = bit32.band(
		cg.flags,
		bit32.bor(
			T.BeforeMutationMask,
			T.MutationMask,
			T.LayoutMask,
			T.PassiveMask
		)
	) ~= T.NoFlags

	if cj or ck then
		local cl
		if m.decoupleUpdatePriorityFromScheduler then
			cl = al()
			ak(i.SyncLanePriority)
		end

		local cm = bC
		bC = bit32.bor(bC, bz)
		local cn = bs.pushInteractions(ce)

		
		bo.current = nil

		
		
		

		
		
		
		ca = O.prepareForCommit(ce.containerInfo)
		cb = false

		bs.commitBeforeMutationEffects(cg)

		
		ca = nil

		if m.enableProfilerTimer then
			
			
			a8.recordCommitTime()
		end

		
		bs.commitMutationEffects(cg, ce, cf)

		if cb then
			O.afterActiveInstanceBlur()
		end
		O.resetAfterCommit(ce.containerInfo)

		
		
		
		
		ce.current = cg

		
		
		
		if a then
			if n then
				J.logLayoutEffectsStarted(ch)
			end
		end
		if o then
			K.markLayoutEffectsStarted(ch)
		end

		if a then
			be(cg)
			bg(
				nil,
				aS,
				nil,
				cg,
				ce,
				
				f.captureCommitPhaseError,
				f.schedulePassiveEffectCallback
			)
			if bh() then
				local co = bi()
				bq(cg, cg, co)
			end
			bd()
		else
			
			local co, cp
			if not b then
				
				co, cp = xpcall(
					aS,
					s,
					cg,
					ce,
					f.captureCommitPhaseError,
					f.schedulePassiveEffectCallback
				)
			else
				co = true
				aS(
					cg,
					ce,
					f.captureCommitPhaseError,
					f.schedulePassiveEffectCallback
				)
			end

			if not co then
				bq(cg, cg, cp)
			end
		end

		if a then
			if n then
				J.logLayoutEffectsStopped()
			end
		end
		if o then
			K.markLayoutEffectsStopped()
		end

		
		if
			bit32.band(cg.subtreeFlags, T.PassiveMask)
				~= T.NoFlags
			or bit32.band(cg.flags, T.PassiveMask)
				~= T.NoFlags
		then
			if not bX then
				bX = true
				w(G, function()
					f.flushPassiveEffects()
					return nil
				end)
			end
		end

		
		
		B()

		if m.enableSchedulerTracing then
			bs.popInteractions(cn)
		end
		bC = cm

		if
			m.decoupleUpdatePriorityFromScheduler
			and cl ~= nil
		then
			
			ak(cl)
		end
	else
		
		ce.current = cg
		
		
		
		if m.enableProfilerTimer then
			a8.recordCommitTime()
		end
	end

	local cl = bX

	if bX then
		
		
		bX = false
		bY = ce
		b_ = ch
		bZ = cf
	end

	
	ci = ce.pendingLanes

	
	if ci ~= i.NoLanes then
		if m.enableSchedulerTracing then
			if b6 ~= nil then
				local cm = b6
				b6 = nil
				for cn = 1, #cm do
					scheduleInteractions(
						ce,
						cm[cn],
						ce.memoizedInteractions
					)
				end
			end
			bs.schedulePendingInteractions(ce, ci)
		end
	else
		
		
		bW = nil
	end

	if a and q then
		if not cl then
			commitDoubleInvokeEffectsInDEV(ce.current, false)
		end
	end

	if m.enableSchedulerTracing then
		if not cl then
			
			
			
			
			bs.finishPendingInteractions(ce, ch)
		end
	end

	if ci == U then
		
		
		if ce == b3 then
			b2 += 1
		else
			b2 = 0
			b3 = ce
		end
	else
		b2 = 0
	end

	bj(cg.stateNode, cf)

	if a then
		bk()
	end

	
	
	aX(ce, C())

	if bU then
		bU = false
		local cm = bV
		bV = nil
		
		error(cm)
	end

	if bit32.band(bC, bx) ~= bt then
		if a then
			if n then
				J.logCommitStopped()
			end
		end

		if o then
			K.markCommitStopped()
		end

		
		
		
		
		return nil
	end

	
	H()

	if a then
		if n then
			J.logCommitStopped()
		end
	end

	if o then
		K.markCommitStopped()
	end

	return nil
end

bs.commitBeforeMutationEffects = function(ce: Fiber)
	local cf = ce
	while cf ~= nil do
		if cf.deletions ~= nil then
			bs.commitBeforeMutationEffectsDeletions(cf.deletions)
		end

		if cf.child ~= nil then
			local cg =
				bit32.band(cf.subtreeFlags, T.BeforeMutationMask)
			if cg ~= T.NoFlags then
				bs.commitBeforeMutationEffects(cf.child)
			end
		end

		if a then
			be(cf)
			bg(nil, bs.commitBeforeMutationEffectsImpl, nil, cf)
			if bh() then
				local cg = bi()
				f.captureCommitPhaseError(cf, cf.return_, cg)
			end
			bd()
		else
			
			local cg, ch
			if not b then
				cg, ch =
					xpcall(bs.commitBeforeMutationEffectsImpl, s, cf)
			else
				cg = true
				bs.commitBeforeMutationEffectsImpl(cf)
			end

			if not cg then
				f.captureCommitPhaseError(cf, cf.return_, ch)
			end
		end
		
		cf = cf.sibling :: Fiber
	end
end

bs.commitBeforeMutationEffectsImpl = function(ce: Fiber)
	local cf = ce.alternate
	local cg = ce.flags

	if not cb and ca ~= nil then
		
		
		if
			ce.tag == R.SuspenseComponent
			and aF.isSuspenseBoundaryBeingHidden(cf, ce)
			and bm(ce, ca)
		then
			cb = true
			O.beforeActiveInstanceBlur()
		end
	end

	if bit32.band(cg, T.Snapshot) ~= T.NoFlags then
		be(ce)
		aG(cf, ce)
		bd()
	end

	if bit32.band(cg, T.Passive) ~= T.NoFlags then
		
		
		if not bX then
			bX = true
			w(G, function()
				f.flushPassiveEffects()
				return nil
			end)
		end
	end
end

bs.commitBeforeMutationEffectsDeletions = function(ce: Array<Fiber>)
	for cf = 1, #ce do
		local cg = ce[cf]

		
		
		
		
		if bm(cg, (ca :: any) :: Fiber) then
			cb = true
			O.beforeActiveInstanceBlur()
		end
	end
end

bs.commitMutationEffects =
	function(ce: Fiber, cf: FiberRoot, cg: ReactPriorityLevel)
		local ch = ce
		while ch ~= nil do
			local ci = ch.deletions
			if ci ~= nil then
				
				for cj, ck in ci do
					
					local cl, cm = xpcall(
						aJ,
						s,
						cf,
						ck,
						ch,
						cg
					)
					if not cl then
						f.captureCommitPhaseError(ck, ch, cm)
					end
				end
			end

			if ch.child ~= nil then
				local cj =
					bit32.band(ch.subtreeFlags, T.MutationMask)
				if cj ~= T.NoFlags then
					bs.commitMutationEffects(ch.child, cf, cg)
				end
			end

			if a then
				be(ch)
				bg(
					nil,
					bs.commitMutationEffectsImpl,
					nil,
					ch,
					cf,
					cg
				)
				if bh() then
					local cj = bi()
					f.captureCommitPhaseError(ch, ch.return_, cj)
				end
				bd()
			else
				
				local cj, ck
				if not b then
					cj, ck = xpcall(
						bs.commitMutationEffectsImpl,
						s,
						ch,
						cf,
						cg
					)
				else
					cj = true
					bs.commitMutationEffectsImpl(ch, cf, cg)
				end
				if not cj then
					f.captureCommitPhaseError(ch, ch.return_, ck)
				end
			end
			
			ch = ch.sibling :: Fiber
		end
	end

bs.commitMutationEffectsImpl =
	function(ce: Fiber, cf: FiberRoot, cg)
		local ch = ce.flags
		
		
		
		
		

		if bit32.band(ch, T.Ref) ~= 0 then
			local ci = ce.alternate
			if ci ~= nil then
				aN(ci)
			end
			
			
			
			
			
			
			
		end

		
		
		
		
		local ci = bit32.band(
			ch,
			bit32.bor(
				T.Placement,
				T.Update,
				T.Hydrating
			)
		)
		if ci == T.Placement then
			aH(ce)
			
			
			
			
			ce.flags = bit32.band(ce.flags, bit32.bnot(T.Placement))
		elseif ci == T.PlacementAndUpdate then
			
			aH(ce)
			
			
			ce.flags = bit32.band(ce.flags, bit32.bnot(T.Placement))

			
			local cj = ce.alternate
			aI(cj, ce)
		
		
		
		
		
		
		
		
		elseif ci == T.Update then
			local cj = ce.alternate
			aI(cj, ce)
		end
	end

bs.commitMutationEffectsDeletions =
	function(ce: Array<Fiber>, cf: Fiber, cg: FiberRoot, ch)
		
		for ci, cj in ce do
			
			local ck, cl = xpcall(
				aJ,
				s,
				cg,
				cj,
				cf,
				ch
			)
			if not ck then
				f.captureCommitPhaseError(cj, cf, cl)
			end
		end
	end

f.schedulePassiveEffectCallback = function()
	if not bX then
		bX = true
		w(G, function()
			f.flushPassiveEffects()
			return nil
		end)
	end
end


local ce
f.flushPassiveEffects = function(): boolean
	
	if bZ ~= D then
		local cf = if bZ
				> G
			then G
			else bZ
		bZ = D
		if m.decoupleUpdatePriorityFromScheduler then
			local cg = al()

			
			ak(av(cf))
			
			local ch, ci
			if not b then
				ch, ci = xpcall(
					z,
					s,
					cf,
					ce
				)
			else
				ch = true
				ak(
					av(cf)
				)
				ci = z(cf, ce)
			end

			
			ak(cg)

			if not ch then
				error(ci)
			end
			return ci
		else
			return z(cf, ce)
		end
	end
	return false
end

br = function(cf, cg: Fiber): ()
	local ch = cg
	while ch ~= nil do
		local ci 		
if
			m.enableProfilerTimer
			and m.enableProfilerCommitHooks
		then
			if ch.tag == R.Profiler then
				ci = bT
				bT = ch
			end
		end

		local cj =
			bit32.band(ch.subtreeFlags, T.PassiveMask)

		if ch.child ~= nil and cj ~= T.NoFlags then
			br(cf, ch.child)
		end

		if
			bit32.band(ch.flags, T.Passive) ~= T.NoFlags
		then
			if a then
				be(ch)
				bg(nil, aM, nil, cf, ch)
				if bh() then
					local ck = bi()
					f.captureCommitPhaseError(ch, ch.return_, ck)
				end
				bd()
			else
				
				local ck, cl
				if not b then
					ck, cl =
						xpcall(aM, s, cf, ch)
				else
					ck = true
					aM(cf, ch)
				end

				if not ck then
					f.captureCommitPhaseError(ch, ch.return_, cl)
				end
			end
		end

		if
			m.enableProfilerTimer
			and m.enableProfilerCommitHooks
		then
			if ch.tag == R.Profiler then
				
				
				if ci ~= nil then
					ci.stateNode.passiveEffectDuration += ch.stateNode.passiveEffectDuration
				end

				bT = ci
			end
		end

		
		ch = ch.sibling :: Fiber
	end
end

local function flushPassiveUnmountEffects(cf: Fiber): ()
	local cg = cf
	while cg ~= nil do
		local ch = cg.deletions
		if ch ~= nil then
			for ci = 1, #ch do
				local cj = ch[ci]
				bs.flushPassiveUnmountEffectsInsideOfDeletedTree(cj, cg)

				
				bs.detachFiberAfterEffects(cj)
			end
		end

		local ci = cg.child
		if ci ~= nil then
			
			
			
			
			local cj =
				bit32.band(cg.subtreeFlags, T.PassiveMask)
			if cj ~= T.NoFlags then
				flushPassiveUnmountEffects(ci)
			end
		end

		local cj = bit32.band(cg.flags, T.Passive)
		if cj ~= T.NoFlags then
			be(cg)
			aK(cg)
			bd()
		end

		
		cg = cg.sibling :: Fiber
	end
end

bs.flushPassiveUnmountEffectsInsideOfDeletedTree =
	function(cf: Fiber, cg: Fiber)
		if
			bit32.band(cf.subtreeFlags, T.PassiveStatic)
			~= T.NoFlags
		then
			
			
			
			
			local ch = cf.child
			while ch ~= nil do
				bs.flushPassiveUnmountEffectsInsideOfDeletedTree(
					ch,
					cg
				)
				ch = ch.sibling
			end
		end

		if
			bit32.band(cf.flags, T.PassiveStatic)
			~= T.NoFlags
		then
			be(cf)
			aL(
				cf,
				cg
			)
			bd()
		end
	end

ce = function()
	if bY == nil then
		return false
	end

	
	local cf = bY :: FiberRoot
	local cg = b_
	bY = nil
	b_ = i.NoLanes

	u(
		bit32.band(bC, bit32.bor(by, bz)) == bt,
		"Cannot flush passive effects while already rendering."
	)

	if a then
		if n then
			J.logPassiveEffectsStarted(cg)
		end
	end

	if o then
		K.markPassiveEffectsStarted(cg)
	end

	local ch = bC
	bC = bit32.bor(bC, bz)
	local ci = bs.pushInteractions(cf)

	
	
	
	
	
	
	flushPassiveUnmountEffects(cf.current)
	br(cf, cf.current)

	if a then
		if n then
			J.logPassiveEffectsStopped()
		end
	end

	if o then
		K.markPassiveEffectsStopped()
	end

	if a and q then
		commitDoubleInvokeEffectsInDEV(cf.current, true)
	end

	if m.enableSchedulerTracing then
		bs.popInteractions(ci)
		bs.finishPendingInteractions(cf, cg)
	end

	bC = ch

	H()

	
	
	if bY == nil then
		b5 = 0
	else
		b5 = b5 + 1
	end

	return true
end

f.isAlreadyFailedLegacyErrorBoundary = function(cf): boolean
	return
		bW ~= nil
			and bW:has(cf)
end

f.markLegacyErrorBoundaryAsFailed = function(cf)
	if bW == nil then
		bW = e.new({ cf })
	else
		bW:add(cf)
	end
end


local function prepareToThrowUncaughtError(cf)
	if not bU then
		bU = true
		bV = cf
	end
end
f.onUncaughtError = prepareToThrowUncaughtError

bq = function(cf: Fiber, cg: Fiber, ch)
	local ci = a4(ch, cg)
	
	local cj =
		aD(cf, ci, U, f.onUncaughtError)
	aU(cf, cj)
	local ck = f.requestEventTime()
	local cl = bs.markUpdateLaneFromFiberToRoot(cf, U)
	if cl ~= nil then
		ap(cl, U, ck)
		aX(cl, ck)
		bs.schedulePendingInteractions(cl, U)
	end
end






f.captureCommitPhaseError =
	function(cf: Fiber, cg, ch)
		if cf.tag == R.HostRoot then
			
			
			bq(cf, cf, ch)
			return
		end

		local ci 		
if p then
			ci = cg
		else
			ci = cf.return_
		end

		while ci ~= nil do
			if ci.tag == R.HostRoot then
				bq(ci, cf, ch)
				return
			else
				if ci.tag == R.ClassComponent then
					local cj = ci.type
					local ck = ci.stateNode
					if
						typeof(cj.getDerivedStateFromError) == "function"
						or (
							typeof(ck.componentDidCatch) == "function"
							and not f.isAlreadyFailedLegacyErrorBoundary(ck)
						)
					then
						local cl = a4(ch, cf)
						local cm = aE(ci, cl, U)
						aU(ci, cm)
						local cn = f.requestEventTime()
						local co = bs.markUpdateLaneFromFiberToRoot(ci, U)
						if co ~= nil then
							ap(co, U, cn)
							aX(co, cn)
							bs.schedulePendingInteractions(co, U)
						end
						return
					end
				end
				ci = ci.return_
			end
		end
	end

f.pingSuspendedRoot =
	function(cf: FiberRoot, cg: Wakeable, ch: Lanes)
		local ci = cf.pingCache
		if ci ~= nil then
			
			
			ci[cg] = nil
		end

		local cj = f.requestEventTime()
		ar(cf, ch, cj)

		if
			bD == cf
			and aa(bF, ch)
		then
			
			
			

			
			

			
			
			if
				bH == bB.SuspendedWithDelay
				or bH == bB.Suspended
					and ag(bF)
					and C() - bP < bQ
			then
				
				bs.prepareFreshStack(cf, i.NoLanes)
			else
				
				
				bN =
					ab(bN, ch)
			end
		end

		aX(cf, cj)
		bs.schedulePendingInteractions(cf, ch)
	end

function retryTimedOutBoundary(cf: Fiber, cg: Lane)
	
	
	
	
	if cg == i.NoLane then
		cg = requestRetryLane(cf)
	end
	
	local ch = f.requestEventTime()
	local ci = bs.markUpdateLaneFromFiberToRoot(cf, cg)
	if ci ~= nil then
		ap(ci, cg, ch)
		aX(ci, ch)
		bs.schedulePendingInteractions(ci, cg)
	end
end










f.resolveRetryWakeable = function(cf: Fiber, cg: Wakeable)
	local ch = i.NoLane 
	local ci 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	ci = cf.stateNode
	

	if ci ~= nil then
		
		
		ci:delete(cg)
	end

	retryTimedOutBoundary(cf, ch)
end











function jnd(cf: number): number
	if cf < 120 then
		return 120
	elseif cf < 480 then
		return 480
	elseif cf < 1080 then
		return 1080
	elseif cf < 1920 then
		return 1920
	elseif cf < 3000 then
		return 3000
	elseif cf < 4320 then
		return 4320
	else
		return math.ceil(cf / 1960) * 1960
	end
end

bs.checkForNestedUpdates = function()
	if b2 > b1 then
		b2 = 0
		b3 = nil
		u(
			false,
[[Maximum update depth exceeded. This can happen when a component repeatedly calls setState inside componentWillUpdate or componentDidUpdate. React limits the number of nested updates to prevent infinite loops.]]		



)
	end

	if a then
		if b5 > b4 then
			b5 = 0
			c.error(
[[Maximum update depth exceeded. This can happen when a component calls setState inside useEffect, but useEffect either doesn't have a dependency array, or one of the dependencies changes on every render.]]			



)
		end
	end
end

function flushRenderPhaseStrictModeWarningsInDEV()
	if a then
		ba.flushLegacyContextWarning()

		if m.warnAboutDeprecatedLifecycles then
			ba.flushPendingUnsafeLifecycleWarnings()
		end
	end
end

function commitDoubleInvokeEffectsInDEV(cf: Fiber, cg: boolean)
	if a and q then
		be(cf)
		invokeEffectsInDev(
			cf,
			T.MountLayoutDev,
			aQ
		)
		if cg then
			invokeEffectsInDev(
				cf,
				T.MountPassiveDev,
				aR
			)
		end

		invokeEffectsInDev(
			cf,
			T.MountLayoutDev,
			aO
		)
		if cg then
			invokeEffectsInDev(
				cf,
				T.MountPassiveDev,
				aP
			)
		end
		bd()
	end
end

function invokeEffectsInDev(
	cf: Fiber,
	cg: Flags,
	ch: (fiber: Fiber) -> ()
): ()
	if a and q then
		local ci = cf
		while ci ~= nil do
			if ci.child ~= nil then
				local cj = bit32.band(ci.subtreeFlags, cg)
				if cj ~= T.NoFlags then
					invokeEffectsInDev(ci.child, cg, ch)
				end
			end

			if bit32.band(ci.flags, cg) ~= T.NoFlags then
				ch(ci)
			end
			
			ci = ci.sibling :: Fiber
		end
	end
end


local cf: any 
bs.warnAboutUpdateOnNotYetMountedFiberInDEV = function(cg)
	if a then
		if bit32.band(bC, by) ~= bt then
			
			return
		end

		if
			bit32.band(
				cg.mode,
				bit32.bor(Q.BlockingMode, Q.ConcurrentMode)
			) == 0
		then
			return
		end

		local ch = cg.tag
		if
			ch ~= R.IndeterminateComponent
			and ch ~= R.HostRoot
			and ch ~= R.ClassComponent
			and ch ~= R.FunctionComponent
			and ch ~= R.ForwardRef
			and ch ~= R.MemoComponent
			and ch ~= R.SimpleMemoComponent
			and ch ~= R.Block
		then
			
			return
		end

		
		
		local ci = a9(cg.type) or "ReactComponent"
		if cf ~= nil then
			if cf[ci] then
				return
			end
			cf[ci] = true
		else
			
			cf = { [ci] = true }
		end

		local cj = bb.current
		local ck, cl = pcall(function()
			be(cg)
			c.error(
[[Can't perform a React state update on a component that hasn't mounted yet. This indicates that you have a side-effect in your render function that asynchronously later calls tries to update the component. Move this work to useEffect instead.]]			



)
		end)

		
		if cj then
			be(cg)
		else
			bd()
		end

		if not ck then
			error(cl)
		end
	end
end


if a and m.replayFailedUnitOfWorkWithInvokeGuardedCallback then
	local cg 	
bs.beginWork = function(ch, ci, cj)
		
		
		

		
		
		local ck =
			P.assignFiberPropertiesInDEV(cg, ci)
		local cl, cm =
			xpcall(aZ, s, ch, ci, cj)
		if not cl then
			local cn = cm

			if
				cn ~= nil
				and typeof(cn) == "table"
				and typeof(cn.andThen) == "function"
			then
				
				error(cn)
			end

			
			
			aV()
			a1()
			
			

			
			aA(ci)

			
			P.assignFiberPropertiesInDEV(ci, ck)

			if
				m.enableProfilerTimer
				and bit32.band(ci.mode, Q.ProfileMode) ~= 0
			then
				
				a8.startProfilerTimer(ci)
			end

			
			bg(nil, aZ, nil, ch, ci, cj)

			if bh() then
				local co = bi()
				
				
				error(co)
			else
				
				error(cn)
			end
		end

		return cm
	end
else
	bs.beginWork = aZ
end

local cg = false
local ch
if a then
	ch = {}
end

bs.warnAboutRenderPhaseUpdatesInDEV = function(ci: Fiber): ()
	if a then
		if
			bb.isRendering
			and bit32.band(bC, by) ~= bt
			and not a3()
		then
			if
				ci.tag == R.FunctionComponent
				or ci.tag == R.ForwardRef
				or ci.tag == R.SimpleMemoComponent
			then
				local cj = (function()
					if bE ~= nil then
						return a9((bE :: Fiber).type)
					end
					return "Unknown"
				end)()
				
				local ck = cj
				
				
				if ch[ck] == nil then
					ch[ck] = true
					local cl = a9(ci.type)
						or "Unknown"
					c.error(
[[Cannot update a component (`%s`) while rendering a different component (`%s`). To locate the bad setState() call inside `%s`, follow the stack trace as described in https://reactjs.org/link/setstate-in-render]]

,
						cl,
						cj,
						cj
					)
				end
			elseif ci.tag == R.ClassComponent then
				if not cg then
					c.error(
[[Cannot update during an existing state transition (such as within `render`). Render methods should be a pure function of props and state.]]					


)
					cg = true
				end
			end
		end
	end
end


f.IsThisRendererActing = { current = false }

f.warnIfNotScopedWithMatchingAct = function(ci: Fiber)
	if a then
		if
			O.warnsIfNotActing == true
			and bp.current == true
			and f.IsThisRendererActing.current ~= true
		then
			local cj = bb.current
			local ck, cl = pcall(function()
				be(ci)
				

				
				
				
				c.error(
[[It looks like you're using the wrong act() around your test interactions.
Be sure to use the matching version of act() corresponding to your renderer:

-- for react-roblox:
local React = require(Packages.React)
-- ...
React.TestUtils.act(function() ... end)

-- for react-test-renderer:
local TestRenderer = require(Packages.ReactTestRenderer)
-- ...
TestRenderer.act(function() ... end)]]				)
			end)

			
			if cj then
				be(ci)
			else
				bd()
			end

			if not ck then
				error(cl)
			end
		end
	end
end

f.warnIfNotCurrentlyActingEffectsInDEV = function(ci: Fiber): ()
	if a then
		if
			O.warnsIfNotActing == true
			and bit32.band(ci.mode, Q.StrictMode) ~= Q.NoMode
			and bp.current == false
			and f.IsThisRendererActing.current == false
		then
			
			c.error(
[=[An update to %s ran an effect, but was not wrapped in act(...).

When testing, code that causes React state updates should be wrapped into act(...):

act(function()
  --[[ fire events that update state ]]
end)
--[[ assert on the output ]]

This ensures that you're testing the behavior the user would see in the real client. Learn more at https://reactjs.org/link/wrap-tests-with-act]=],
				a9(ci.type)
			)
		end
	end
end

f.warnIfNotCurrentlyActingUpdatesInDEV = function(ci: Fiber): ()
	if a then
		if
			O.warnsIfNotActing == true
			and bC == bt
			and bp.current == false
			and f.IsThisRendererActing.current == false
		then
			local cj = bc
			local ck, cl = pcall(function()
				be(ci)
				
				c.error(
[=[An update to %s inside a test was not wrapped in act(...).

When testing, code that causes React state updates should be wrapped into act(...):

act(function()
  --[[ fire events that update state ]]
end)
--[[ assert on the output ]]

This ensures that you're testing the behavior the user would see in the client application. Learn more at https://reactjs.org/link/wrap-tests-with-act]=],
					a9(ci.type)
				)
			end)

			
			if cj then
				be(ci)
			else
				bd()
			end

			if ck then
				return cl
			end
		end
	end
	
	return
end


local ci = false





f.warnIfUnmockedScheduler = function(cj: Fiber)
	if a then
		if
			ci == false
			and j.unstable_flushAllWithoutAsserting == nil
		then
			if
				bit32.band(cj.mode, Q.BlockingMode) ~= 0
				or bit32.band(cj.mode, Q.ConcurrentMode) ~= 0
			then
				ci = true
				

				
				
				
				c.error(
[[In Concurrent or Sync modes, the 'scheduler' module needs to be mocked to guarantee consistent behaviour across tests and client application. For example, with Jest: 
jest.mock('scheduler', function() return require(@pkg/scheduler).unstable_mock end)

For more info, visit https://reactjs.org/link/mock-scheduler]]				

)
			elseif m.warnAboutUnmockedScheduler == true then
				ci = true
				

				
				
				
				c.error(
[[Starting from React v18, the 'scheduler' module will need to be mocked to guarantee consistent behaviour across tests and client applications. For example, with Jest: 
jest.mock('scheduler', function() return require(@pkg/scheduler).unstable_mock end)

For more info, visit https://reactjs.org/link/mock-scheduler]]				


)
			end
		end
	end
end

function computeThreadID(cj: FiberRoot, ck: Lane | Lanes)
	
	
	
	
	return ck * 1000 + cj.interactionThreadID
end

f.markSpawnedWork = function(cj: Lane | Lanes)
	if not m.enableSchedulerTracing then
		return
	end
	if b6 == nil then
		b6 = { cj }
	else
		
		table.insert(b6 :: Array<number>, cj)
	end
end

function scheduleInteractions(
	cj: FiberRoot,
	ck: Lane | Lanes,
	cl: Set<Interaction>
)
	if not m.enableSchedulerTracing then
		return
	end

	if cl.size > 0 then
		local cm = cj.pendingInteractionMap
		local cn = cm:get(ck)
		if cn ~= nil then
			cl:forEach(function(co)
				if not cn:has(co) then
					
					co.__count += 1
				end

				cn:add(co)
			end)
		else
			cm:set(ck, e.new(cl))

			
			for co, cp in cl do
				cp.__count += 1
			end
		end

		local co = N.current
		if co ~= nil then
			local cp = computeThreadID(cj, ck)
			co.onWorkScheduled(cl, cp)
		end
	end
end

bs.schedulePendingInteractions = function(cj: FiberRoot, ck: Lane | Lanes)
	
	
	
	if not m.enableSchedulerTracing then
		return
	end

	scheduleInteractions(cj, ck, M.current)
end

bs.startWorkOnPendingInteractions = function(cj: FiberRoot, ck: Lanes)
	
	if not m.enableSchedulerTracing then
		return
	end

	
	
	
	local cl: Set<Interaction> = e.new()
	cj.pendingInteractionMap:forEach(function(cm, cn)
		if _(ck, cn) then
			cm:forEach(function(co)
				cl:add(co)
			end)
		end
	end)

	
	
	
	
	
	
	cj.memoizedInteractions = cl :: any

	if cl.size > 0 then
		local cm = N.current
		if cm ~= nil then
			local cn = computeThreadID(cj, ck)
			local co, cp =
				xpcall(cm.onWorkStarted, s, cl, cn)
			if not co then
				
				w(E, function()
					error(cp)
				end)
			end
		end
	end
end

bs.finishPendingInteractions = function(cj: FiberRoot, ck)
	if not m.enableSchedulerTracing then
		return
	end

	local cl = cj.pendingLanes

	local cm

	
	local cn = true
	local co
	if cm ~= nil and cj.memoizedInteractions.size > 0 then
		
		
		local cp = computeThreadID(cj, ck)
		cm = N.current
		
		cn, co = xpcall(
			cm.onWorkStopped,
			s,
			cj.memoizedInteractions,
			cp
		)
	end

	
	
	
	
	local cp = cj.pendingInteractionMap
	cp:forEach(function(cq, cr)
		
		
		
		if not _(cl, cr) then
			cp:delete(cr)
			cq:forEach(function(cs)
				cs.__count -= 1

				if cm ~= nil and cs.__count == 0 then
					local ct, cu = xpcall(
						cm.onInteractionScheduledWorkCompleted,
						s,
						cs
					)
					if not ct then
						
						w(E, function()
							error(cu)
						end)
					end
				end
			end)
		end
	end)

	
	if not cn then
		
		w(E, function()
			error(co)
		end)
	end
end






local cj = false
local ck = false

local cl = j.unstable_flushAllWithoutAsserting
local cm = typeof(cl) == "function"



local function flushActWork(): boolean
	if cl ~= nil then
		local cn = cj
		cj = true
		local co, cp = xpcall(cl, s)

		
		cj = cn

		if not co then
			error(cp)
		else
			return cp
		end
	else
		
		
		local cn = cj
		cj = true
		
		local co, cp = xpcall(function()
			local co = false
			while f.flushPassiveEffects() do
				co = true
			end
			return co
		end, s)

		
		cj = cn

		if not co then
			error(cp)
		else
			return cp
		end
	end
end

local function flushWorkAndMicroTasks(cn: (any?) -> ())
	
	local co, cp = xpcall(flushActWork, s)
	if co then
		co, cp = xpcall(bl, s, function()
			if flushActWork() then
				flushWorkAndMicroTasks(cn)
			else
				cn()
			end
		end)
	end

	if not co then
		cn(cp)
	end
end

f.act = function(cn: () -> Thenable<any>): Thenable<any>
	
	
	
	
	if not (a or _G.__ROACT_17_MOCK_SCHEDULER__) then
		if cd == false then
			cd = true
			
			c.error(
				"act(...) is not supported in production builds of React, and might not behave as expected."
			)
		end
	end

	local co = cc
	cc += 1

	local cp = bp.current
	local cq = f.IsThisRendererActing.current
	local cr = ck
	bp.current = true
	f.IsThisRendererActing.current = true
	ck = true

	local function onDone()
		cc -= 1
		bp.current = cp
		f.IsThisRendererActing.current = cq
		ck = cr
		if a then
			if cc > co then
				
				c.error(
[[You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ]]				

)
			end
		end
	end

	local cs, ct = xpcall(f.batchedUpdates, s, cn)
	if not cs then
		onDone()
		error(ct)
	end

	if
		ct ~= nil
		and typeof(ct) == "table"
		and typeof(ct.andThen) == "function"
	then
		
		
		local cu = false
		if a then
			if typeof(aT) ~= nil then
				
				aT.resolve():andThen(function() end):andThen(function()
					if cu == false then
						
						
						c.error(
[=[You called act(Promise.new(function() --[[ ... ]] end)) without :await() or :expect(). This could lead to unexpected testing behaviour, interleaving multiple act calls and mixing their scopes. You should - act(function() Promise.new(function() --[[ ... ]] end):await() end);]=]						


)
					end
				end)
			end
		end

		
		
		
		return {
			
			andThen = function<U>(cv, cw, cx)
				cu = true
				return ct:andThen(function()
					if
						cc > 1
						or (
							cm == true
							and cp == true
						)
					then
						onDone()
						cw()
						return
					end
					
					
					flushWorkAndMicroTasks(function(cy: any?)
						onDone()
						if cy then
							cx(cy)
						else
							cw()
						end
					end)
				end, function(cy)
					onDone()
					cx(cy)
				end)
			end,
		}
	else
		if a then
			if ct ~= nil then
				
				c.error(
[[The callback passed to act(...) function must return nil, or a Promise. You returned %s]]
,
					tostring(ct)
				)
			end
		end

		
		local cu, cv = xpcall(function()
			if
				cc == 1
				and (cm == false or cp == false)
			then
				
				
				flushActWork()
			end
			onDone()
		end, s)

		if not cu then
			onDone()
			error(cv)
		end

		
		return {
			
			andThen = function<U>(cw, cx, cy)
				if a then
					c.error(
						"Do not await the result of calling act(...) with sync logic, it is not a Promise."
					)
				end
				cx()
			end,
		}
	end
end

bs.detachFiberAfterEffects = function(cn: Fiber)
	
	
	cn.child = nil
	cn.deletions = nil
	cn.dependencies = nil
	cn.memoizedProps = nil
	cn.memoizedState = nil
	cn.pendingProps = nil
	cn.sibling = nil
	cn.stateNode = nil
	cn.updateQueue = nil

	if a then
		cn._debugOwner = nil
	end
end

return f
