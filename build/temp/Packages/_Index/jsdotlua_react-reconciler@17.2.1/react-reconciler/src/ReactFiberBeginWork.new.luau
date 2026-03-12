












local function unimplemented(a: string)
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring(a))
	error("FIXME (roblox): " .. a .. " is unimplemented", 2)
end

local a = _G.__DEV__ :: boolean
local b =
	_G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ :: boolean
local c = _G.__COMPAT_WARNINGS__ :: boolean


local d = require(script.Parent.Parent:WaitForChild('shared'))
local e = d.console
local f = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
local g = f.Array
local h = f.Object
local i = f.util.inspect

local j = require(script.Parent.Parent:WaitForChild('shared'))
type ReactProviderType<T> = j.ReactProviderType<T>
type ReactContext<T> = j.ReactContext<T>
type React_Component<Props, State> = j.React_Component<Props, State>

local k = require(script.Parent.Parent:WaitForChild('react'))
type LazyComponentType<T, P> = k.LazyComponent<T, P>

local l = require(script.Parent:WaitForChild('ReactInternalTypes'))
type Fiber = l.Fiber
type FiberRoot = l.FiberRoot
local m = require(script.Parent:WaitForChild('ReactFiberLane'))
type Lanes = m.Lanes



local n = require(script.Parent:WaitForChild('ReactFiberSuspenseComponent.new'))
type SuspenseState = n.SuspenseState
type SuspenseListRenderState = n.SuspenseListRenderState
type SuspenseListTailMode = n.SuspenseListTailMode
local o = require(script.Parent:WaitForChild('ReactFiberSuspenseContext.new'))
type SuspenseContext = o.SuspenseContext

local p = require(script.Parent:WaitForChild('ReactFiberOffscreenComponent'))
type OffscreenProps = p.OffscreenProps
type OffscreenState = p.OffscreenState

local q = require(script.Parent.Parent:WaitForChild('shared')).checkPropTypes

local r = require(script.Parent:WaitForChild('ReactWorkTags'))

local s = r.FunctionComponent
local t = r.ClassComponent
local u = r.HostRoot
local v = r.HostComponent
local w = r.HostText
local x = r.HostPortal
local y = r.ForwardRef
local z = r.Fragment
local A = r.Mode
local B = r.ContextProvider
local C = r.ContextConsumer
local D = r.Profiler
local E = r.SuspenseComponent
local F = r.SuspenseListComponent
local G = r.MemoComponent
local H = r.SimpleMemoComponent
local I = r.LazyComponent
local J = r.IncompleteClassComponent


local K = r.OffscreenComponent
local L = r.LegacyHiddenComponent
local M = require(script.Parent:WaitForChild('ReactFiberFlags'))
local N = M.NoFlags
local O = M.StaticMask
local P = M.PerformedWork
local Q = M.Placement
local R = M.Hydrating
local S = M.ContentReset
local T = M.DidCapture

local U = M.Ref
local V = M.Deletion
local W = M.ForceUpdateForLegacySuspense
local X = require(script.Parent.Parent:WaitForChild('shared')).ReactSharedInternals
local Y = require(script.Parent.Parent:WaitForChild('shared')).ReactFeatureFlags
local Z =
	Y.debugRenderPhaseSideEffectsForStrictMode
local _ = Y.disableLegacyContext
local aa = Y.disableModulePatternComponents
local ab = Y.enableProfilerTimer
local ac = Y.enableSchedulerTracing
local ad = Y.enableSuspenseServerRenderer

local ae =
	Y.warnAboutDefaultPropsOnFunctionComponents

local af = require(script.Parent.Parent:WaitForChild('shared')).invariant
local ag = require(script.Parent.Parent:WaitForChild('shared')).describeError
local ah = require(script.Parent.Parent:WaitForChild('shared')).shallowEqual
local ai = require(script.Parent.Parent:WaitForChild('shared')).getComponentName
local aj = require(script.Parent.Parent:WaitForChild('shared')).ReactSymbols
local ak = aj.REACT_LAZY_TYPE
local al = aj.getIteratorFn
local am = require(script.Parent:WaitForChild('ReactStrictModeWarnings.new'))
local an = require(script.Parent:WaitForChild('ReactCurrentFiber'))
local ao =
	an.getCurrentFiberOwnerNameInDevOrNull
local ap = an.setIsRendering
local aq = require(script.Parent:WaitForChild('ReactFiberHotReloading.new'))
local ar =
	aq.resolveFunctionForHotReloading
local as =
	aq.resolveForwardRefForHotReloading
local at =
	aq.resolveClassForHotReloading

local au = require(script.Parent:WaitForChild('ReactChildFiber.new')):: any
local av = au.mountChildFibers
local aw = au.reconcileChildFibers
local ax = au.cloneChildFibers
local ay = require(script.Parent:WaitForChild('ReactUpdateQueue.new'))
local az = ay.processUpdateQueue
local aA = ay.cloneUpdateQueue
local aB = ay.initializeUpdateQueue
local aC = require(script.Parent:WaitForChild('ReactTypeOfMode'))
local aD = aC.ConcurrentMode
local aE = aC.NoMode
local aF = aC.ProfileMode
local aG = aC.StrictMode
local aH = aC.BlockingMode
local aI = require(script.Parent:WaitForChild('ReactFiberHostConfig'))
local aJ = aI.shouldSetTextContent
local aK = aI.isSuspenseInstancePending
local aL = aI.isSuspenseInstanceFallback
local aM = aI.registerSuspenseInstanceRetry
local aN = aI.supportsHydration
type SuspenseInstance = aI.SuspenseInstance

local aO = require(script.Parent:WaitForChild('ReactFiberHostContext.new'))
local aP = aO.pushHostContext
local aQ = aO.pushHostContainer
local aR = o.suspenseStackCursor
local aS = o.hasSuspenseContext
local aT = o.ForceSuspenseFallback
local aU = o.addSubtreeSuspenseContext
local aV =
	o.InvisibleParentSuspenseContext
local aW = o.pushSuspenseContext

local aX =
	o.setDefaultShallowSuspenseContext



local aY = require(script.Parent:WaitForChild('ReactFiberNewContext.new'))
local aZ = aY.propagateContextChange
local a_ = aY.readContext
local a0 = aY.calculateChangedBits

local a1 = aY.prepareToReadContext
local a2 = aY.pushProvider


local a3 = {
	renderWithHooksRef = nil :: any,
	bailoutHooksRef = nil :: any,
	shouldSuspendRef = nil :: any,
}

local function shouldSuspend(a4: Fiber): boolean
	if not a3.shouldSuspendRef then
		a3.shouldSuspendRef = require(script.Parent:WaitForChild('ReactFiberReconciler')).shouldSuspend
	end
	return a3.shouldSuspendRef(a4)
end


local function initReactFiberHooks()
	local a4 = require(script.Parent:WaitForChild('ReactFiberHooks.new'))	
a3.renderWithHooksRef = a4.renderWithHooks
	a3.bailoutHooksRef = a4.bailoutHooks
end


local function renderWithHooks(...)
	if not a3.renderWithHooksRef then
		initReactFiberHooks()
	end
	return a3.renderWithHooksRef(...)
end


local function bailoutHooks(...)
	if not a3.bailoutHooksRef then
		initReactFiberHooks()
	end
	return a3.bailoutHooksRef(...)
end

local a4 =
	require(script.Parent:WaitForChild('ReactProfilerTimer.new')).stopProfilerTimerIfRunning
local a5 = require(script.Parent:WaitForChild('ReactFiberContext.new'))
local a6 = a5.getMaskedContext
local a7 = a5.getUnmaskedContext
local a8 = a5.hasContextChanged
local a9 = a5.pushContextProvider
local ba = a5.isContextProvider
local bb = a5.pushTopLevelContextObject
local bc = a5.invalidateContextProvider

local bd = require(script.Parent:WaitForChild('ReactFiberHydrationContext.new'))
local be = bd.resetHydrationState
local bf = bd.enterHydrationState
local bg =
	bd.reenterHydrationStateFromDehydratedSuspenseInstance
local bh =
	bd.tryToClaimNextHydratableInstance
local bi = bd.warnIfHydrating
local bj = require(script.Parent:WaitForChild('ReactFiberClassComponent.new')):: any
local bk = bj.adoptClassInstance
local bl = bj.applyDerivedStateFromProps
local bm = bj.constructClassInstance
local bn = bj.mountClassInstance
local bo = bj.resumeMountClassInstance
local bp = bj.updateClassInstance

local bq =
	require(script.Parent:WaitForChild('ReactFiberLazyComponent.new')).resolveDefaultProps
local br = require(script.Parent:WaitForChild('ReactFiber.new'))
local bs = br.resolveLazyComponentTag
local bt = br.createFiberFromFragment
local bu = br.createFiberFromOffscreen

local bv = br.createFiberFromTypeAndProps
local bw = br.isSimpleFunctionComponent
local bx = br.createWorkInProgress
local by = require(script.Parent:WaitForChild('ReactFiberWorkLoop.new')):: any
local bz = by.pushRenderLanes
local bA = by.markSpawnedWork
local bB = by.retryDehydratedSuspenseBoundary
local bC = by.scheduleUpdateOnFiber
local bD = by.renderDidSuspendDelayIfPossible
local bE = by.getWorkInProgressRoot
local bF = by.getExecutionContext
local bG = by.RetryAfterError
local bH = by.NoContext

local bI
local bJ =
	require(script.Parent:WaitForChild('ReactMutableSource.new')).setWorkInProgressVersion
local bK =
	require(script.Parent:WaitForChild('ReactFiberWorkInProgress')).markSkippedUpdateLanes
local bL = require(script.Parent.Parent:WaitForChild('shared')).ConsolePatchingDev
local bM = bL.disableLogs
local bN = bL.reenableLogs

local bO = X.ReactCurrentOwner

local bP: { [string]: any } = {}


local bQ, bR

local bS: boolean = false


local bT = {
	didWarnAboutBadClass = {} :: { [string]: boolean },
	didWarnAboutModulePatternComponent = {} :: { [string]: boolean },
	didWarnAboutContextTypeOnFunctionComponent = {} :: { [string]: boolean },
	didWarnAboutGetDerivedStateOnFunctionComponent = {} :: { [string]: boolean },
	didWarnAboutFunctionRefs = {} :: { [string]: boolean },
	didWarnAboutDefaultPropsOnFunctionComponent = {} :: { [string]: boolean },
}



local bU

if a then
	bT.didWarnAboutBadClass = {}
	bT.didWarnAboutModulePatternComponent = {}
	bT.didWarnAboutContextTypeOnFunctionComponent = {}
	bT.didWarnAboutGetDerivedStateOnFunctionComponent = {}
	bT.didWarnAboutFunctionRefs = {}
	bP.didWarnAboutReassigningProps = false
	
	
	bT.didWarnAboutDefaultPropsOnFunctionComponent = {}
end

local function reconcileChildren(
	bV: Fiber | nil,
	bW: Fiber,
	bX: any,
	bY: Lanes
)
	if bV == nil then
		
		
		
		
		bW.child =
			av(bW, nil, bX, bY)
	else
		
		
		

		
		
		bW.child = aw(
			bW,
			(bV :: Fiber).child,
			bX,
			bY
		)
	end
end

local function forceUnmountCurrentAndReconcile(
	bV: Fiber,
	bW: Fiber,
	bX: any,
	bY: Lanes
)
	
	
	
	
	
	
	
	
	bW.child =
		aw(bW, bV.child, nil, bY)
	
	
	
	
	bW.child =
		aw(bW, nil, bX, bY)
end

local function updateForwardRef(
	bV: Fiber | nil,
	bW: Fiber,
	bX: any,
	bY: any,
	bZ: Lanes
)
	
	
	

	if a or b then
		if bW.type ~= bW.elementType then
			
			
			
			local b_ = bX.propTypes
			local b0 = bX.validateProps
			if b_ or b0 then
				q(
					b_,
					b0,
					bY, 
					"prop",
					ai(bX)
				)
			end
		end
	end

	local b_ = bX.render
	local b0 = bW.ref

	
	local b1
	a1(
		bW,
		bZ,
		bP.markWorkInProgressReceivedUpdate
	)
	if a then
		bO.current = bW
		ap(true)
		b1 =
			renderWithHooks(bV, bW, b_, bY, b0, bZ)
		if
			Z
			and bit32.band(bW.mode, aG) ~= 0
		then
			bM()
			local b2, b3 = xpcall(
				renderWithHooks,
				ag,
				bV,
				bW,
				b_,
				bY,
				b0,
				bZ
			)
			if b2 then
				b1 = b3
			end
			
			bN()

			if not b2 then
				error(b3)
			end
		end
		ap(false)
	else
		b1 =
			renderWithHooks(bV, bW, b_, bY, b0, bZ)
	end

	if bV ~= nil and not bS then
		bailoutHooks(bV, bW, bZ)
		return bQ(bV, bW, bZ)
	end

	
	bW.flags = bit32.bor(bW.flags, P)
	reconcileChildren(bV, bW, b1, bZ)
	return bW.child
end

local function updateMemoComponent(
	bV: Fiber | nil,
	bW: Fiber,
	bX: any,
	bY: any,
	bZ: Lanes,
	b_: Lanes
): nil | Fiber
	if bV == nil then
		local b0 = bX.type
		if
			bw(b0)
			and bX.compare == nil
			
			and bX.defaultProps == nil
		then
			local b1 = b0
			if a then
				b1 = ar(b0)
			end
			
			
			
			bW.tag = H
			bW.type = b1
			if a then
				validateFunctionComponentInDev(bW, b0)
			end
			return bU(
				bV,
				bW,
				b1,
				bY,
				bZ,
				b_
			)
		end
		if a or b then
			
			local b1
			local b2
			
			if type(b0) == "table" then
				b1 = b0.propTypes
				b2 = b0.validateProps
			end

			if b1 or b2 then
				
				
				q(
					b1,
					b2,
					bY, 
					"prop",
					ai(b0)
				)
			end
		end
		local b1 = bv(
			bX.type,
			nil,
			bY,
			bW,
			bW.mode,
			b_
		)
		b1.ref = bW.ref
		b1.return_ = bW
		bW.child = b1
		return b1
	end
	
	
	local b0 = bV :: Fiber
	if a or b then
		local b1 = bX.type
		
		local b2
		local b3
		
		if type(b1) == "table" then
			b2 = b1.propTypes
			b3 = b1.validateProps
		end

		if b2 or b3 then
			
			
			q(
				b2,
				b3,
				bY, 
				"prop",
				ai(b1)
			)
		end
	end
	local b1 = (b0.child :: any) :: Fiber 
	if not m.includesSomeLane(bZ, b_) then
		
		
		local b2 = b1.memoizedProps
		
		local b3 = bX.compare
		if b3 == nil then
			b3 = ah
		end
		if b3(b2, bY) and b0.ref == bW.ref then
			return bQ(b0, bW, b_)
		end
	end
	
	bW.flags = bit32.bor(bW.flags, P)
	local b2 = bx(b1, bY)
	b2.ref = bW.ref
	b2.return_ = bW
	bW.child = b2
	return b2
end

function bU(
	bV: Fiber | nil,
	bW: Fiber,
	bX: any,
	bY: any,
	bZ: Lanes,
	b_: Lanes
): nil | Fiber
	
	
	

	if a or b then
		if bW.type ~= bW.elementType then
			
			
			local b0 = bW.elementType
			if b0["$$typeof"] == ak then
				
				
				
				local b1: LazyComponentType<any, any> = b0
				local b2 = b1._payload
				local b3 = b1._init
				local b4, b5 = xpcall(b3, ag, b2)
				if b4 then
					b0 = b5
				else
					b0 = nil
				end
				
				
				local b6
				local b7
				
				if b0 ~= nil and type(b0) == "table" then
					b6 = (b0 :: any).propTypes
					
					b7 = (b0 :: any).validateProps
				end

				if b6 or b7 then
					q(
						b6,
						b7,
						bY, 
						"prop",
						ai(b0)
					)
				end
			end
		end
	end
	if bV ~= nil then
		
		
		local b0 = bV :: Fiber
		local b1 = b0.memoizedProps
		
		local b2 = true
		if a then
			b2 = bW.type == b0.type
		end
		if
			ah(b1, bY)
			and b0.ref == bW.ref
			
			and b2
		then
			bS = false
			if not m.includesSomeLane(b_, bZ) then
				
				
				
				
				
				
				
				
				
				
				
				
				
				bW.lanes = b0.lanes
				return bQ(b0, bW, b_)
			elseif bit32.band(b0.flags, W) ~= N then
				
				
				bS = true
			end
		end
	end
	return bR(
		bV,
		bW,
		bX,
		bY,
		b_
	)
end

local function updateOffscreenComponent(
	bV: Fiber?,
	bW: Fiber,
	bX: Lanes
): Fiber | nil
	local bY: OffscreenProps = bW.pendingProps
	local bZ = bY.children

	local b_: OffscreenState?
	if bV ~= nil then
		
		b_ = (bV :: Fiber).memoizedState
	end

	if
		bY.mode == "hidden"
		or bY.mode == "unstable-defer-without-hiding"
	then
		if bit32.band(bW.mode, aD) == aE then
			
			
			local b0: OffscreenState = {
				baseLanes = m.NoLanes,
			}
			bW.memoizedState = b0
			bz(bW, bX)
		
		elseif
			not m.includesSomeLane(bX, m.OffscreenLane)
		then
			local b0
			if b_ ~= nil then
				
				local b1 = (b_ :: OffscreenState).baseLanes
				b0 = m.mergeLanes(b1, bX)
			else
				b0 = bX
			end

			
			if ac then
				bA(m.OffscreenLane)
			end

			
			bW.childLanes =
				m.laneToLanes(m.OffscreenLane)
			bW.lanes = bW.childLanes

			local b1: OffscreenState = {
				baseLanes = b0,
			}
			bW.memoizedState = b1
			
			
			bz(bW, b0)
			return nil
		else
			
			local b0: OffscreenState = {
				baseLanes = m.NoLanes,
			}
			bW.memoizedState = b0
			
			local b1 = bX

			
			if b_ ~= nil then
				
				b1 = (b_ :: OffscreenState).baseLanes
			end

			bz(bW, b1)
		end
	else
		local b0
		if b_ ~= nil then
			
			b0 = m.mergeLanes(
				(b_ :: OffscreenState).baseLanes,
				bX
			)
			
			bW.memoizedState = nil
		else
			
			
			
			b0 = bX
		end
		bz(bW, b0)
	end

	reconcileChildren(bV, bW, bZ, bX)
	return bW.child
end




local bV = updateOffscreenComponent

function updateFragment(bW: Fiber | nil, bX: Fiber, bY: Lanes)
	local bZ = bX.pendingProps
	reconcileChildren(bW, bX, bZ, bY)
	return bX.child
end

function updateMode(bW: Fiber | nil, bX: Fiber, bY: Lanes)
	local bZ = bX.pendingProps.children
	reconcileChildren(bW, bX, bZ, bY)
	return bX.child
end

function updateProfiler(bW: Fiber | nil, bX: Fiber, bY: Lanes)
	if ab then
		
		
		local bZ = bX.stateNode
		bZ.effectDuration = 0
		bZ.passiveEffectDuration = 0
	end
	local bZ = bX.pendingProps
	local b_ = bZ.children
	reconcileChildren(bW, bX, b_, bY)
	return bX.child
end

local function markRef(bW: Fiber | nil, bX: Fiber)
	local bY = bX.ref
	if
		(bW == nil and bY ~= nil)
		or (bW ~= nil and (bW :: Fiber).ref ~= bY)
	then
		
		bX.flags = bit32.bor(bX.flags, U)
	end
end

function bR(
	bW,
	bX,
	bY,
	bZ: any,
	b_
)
	if a or b then
		
		if
			type(bY) ~= "function"
			and (bX.type ~= bX.elementType)
		then
			
			
			
			local b0
			local b1
			
			if type(bY) == "table" then
				b0 = (bY :: any).propTypes
				b1 = (bY :: any).validateProps
			end

			if b0 or b1 then
				q(
					b0,
					b1,
					bZ, 
					"prop",
					ai(bY)
				)
			end
		end
	end

	local b0
	if not _ then
		local b1 = a7(bX, bY, true)
		b0 = a6(bX, b1)
	end

	local b1
	a1(
		bX,
		b_,
		bP.markWorkInProgressReceivedUpdate
	)
	if a then
		bO.current = bX
		ap(true)
		b1 = renderWithHooks(
			bW,
			bX,
			bY,
			bZ,
			b0,
			b_
		)
		if
			Z
			and bit32.band(bX.mode, aG) ~= 0
		then
			bM()
			local b2, b3 = xpcall(
				renderWithHooks,
				ag,
				bW,
				bX,
				bY,
				bZ,
				b0,
				b_
			)
			
			bN()
			if b2 then
				b1 = b3
			else
				error(b3)
			end
		end
		ap(false)
	else
		b1 = renderWithHooks(
			bW,
			bX,
			bY,
			bZ,
			b0,
			b_
		)
	end

	if bW ~= nil and not bS then
		bailoutHooks(bW, bX, b_)
		return bQ(bW, bX, b_)
	end

	
	bX.flags = bit32.bor(bX.flags, P)
	reconcileChildren(bW, bX, b1, b_)
	return bX.child
end











































































local function updateClassComponent(
	bW: any,
	bX: Fiber,
	bY: any,
	bZ: any,
	b_: Lanes
)
	if a or b then
		if bX.type ~= bX.elementType then
			
			
			
			local b0 = bY.propTypes
			local b1 = bY.validateProps
			if b0 or b1 then
				q(
					b0,
					b1,
					bZ, 
					"prop",
					ai(bY)
				)
			end
		end
	end

	
	
	
	local b0
	if ba(bY) then
		b0 = true
		a9(bX)
	else
		b0 = false
	end
	
	a1(
		bX,
		b_,
		bP.markWorkInProgressReceivedUpdate
	)

	local b1 = bX.stateNode
	local b2
	if b1 == nil then
		if bW ~= nil then
			
			
			
			
			bW.alternate = nil
			bX.alternate = nil
			
			bX.flags = bit32.bor(bX.flags, Q)
		end
		
		bm(bX, bY, bZ)
		bn(bX, bY, bZ, b_)
		b2 = true
	elseif bW == nil then
		
		b2 =
			bo(bX, bY, bZ, b_)
	else
		b2 = bp(
			bW,
			bX,
			bY,
			bZ,
			b_
		)
	end
	local b3 = finishClassComponent(
		bW,
		bX,
		bY,
		b2,
		b0,
		b_
	)
	if a then
		local b4 = bX.stateNode
		if b2 and b4.props ~= bZ then
			if not bP.didWarnAboutReassigningProps then
				e.error(
[[It looks like %s is reassigning its own `this.props` while rendering. This is not supported and can lead to confusing bugs.]]
,
					ai(bX.type) or "a component"
				)
			end
			bP.didWarnAboutReassigningProps = true
		end
	end
	return b3
end

function finishClassComponent(
	bW: Fiber | nil,
	bX: Fiber,
	bY: any,
	bZ: boolean,
	b_: boolean,
	b0: Lanes
)
	
	markRef(bW, bX)

	local b1 = bit32.band(bX.flags, T) ~= N

	if not bZ and not b1 then
		
		if b_ then
			bc(bX, bY, false)
		end

		return bQ(bW, bX, b0)
	end

	local b2 = bX.stateNode

	
	bO.current = bX
	local b3
	if
		b1
		and (
			bY.getDerivedStateFromError == nil
			or type(bY.getDerivedStateFromError) ~= "function"
		)
	then
		
		
		
		
		
		b3 = nil

		if ab then
			a4(bX)
		end
	else
		if a then
			ap(true)
			
			b3 = b2:render()
			if
				Z
				and bit32.band(bX.mode, aG) ~= 0
			then
				bM()
				
				local b4, b5 = xpcall(b2.render, ag, b2)
				
				bN()
				if not b4 then
					error(b5)
				end
			end
			ap(false)
		else
			
			b3 = b2:render()
		end
	end

	
	bX.flags = bit32.bor(bX.flags, P)
	if bW ~= nil and b1 then
		
		
		
		
		forceUnmountCurrentAndReconcile(
			bW :: Fiber,
			bX,
			b3,
			b0
		)
	else
		reconcileChildren(bW, bX, b3, b0)
	end

	
	
	bX.memoizedState = b2.state

	
	if b_ then
		bc(bX, bY, true)
	end

	return bX.child
end

local function pushHostRootContext(bW)
	
	local bX = bW.stateNode
	if bX.pendingContext then
		bb(
			bW,
			bX.pendingContext,
			bX.pendingContext ~= bX.context
		)
	elseif bX.context then
		
		bb(bW, bX.context, false)
	end
	aQ(bW, bX.containerInfo)
end

local function updateHostRoot(bW, bX, bY)
	pushHostRootContext(bX)
	local bZ = bX.updateQueue
	af(
		bW ~= nil and bZ ~= nil,
[[If the root does not have an updateQueue, we should have already bailed out. This error is likely caused by a bug in React. Please file an issue.]]	


)
	local b_ = bX.pendingProps
	local b0 = bX.memoizedState
	local b1
	if b0 ~= nil then
		b1 = b0.element
	end
	aA(bW, bX)
	az(bX, b_, nil, bY)
	local b2 = bX.memoizedState
	
	
	local b3 = b2.element
	if b3 == b1 then
		be()
		return bQ(bW, bX, bY)
	end
	local b4: FiberRoot = bX.stateNode
	if b4.hydrate and bf(bX) then
		
		
		
		

		if aN then
			local b5 = b4.mutableSourceEagerHydrationData
			if b5 ~= nil then
				for b6 = 1, #b5, 2 do
					
					
					
					
					local b7 = b5[b6]
					local b8 = b5[b6 + 1]
					bJ(b7, b8)
				end
			end
		end

		local b5 = av(bX, nil, b3, bY)
		bX.child = b5

		local b6 = b5
		while b6 do
			
			
			
			
			
			
			b6.flags =
				bit32.bor(bit32.band(b6.flags, bit32.bnot(Q)), R)
			b6 = b6.sibling
		end
	else
		
		
		reconcileChildren(bW, bX, b3, bY)
		be()
	end
	return bX.child
end







local function updateHostComponent(
	bW: any,
	bX: Fiber,
	bY: Lanes
)
	aP(bX)

	if bW == nil then
		bh(bX)
	end

	local bZ = bX.type
	local b_ = bX.pendingProps
	local b0
	if bW ~= nil then
		b0 = bW.memoizedProps
	end

	local b1 = b_.children
	local b2 = aJ(bZ, b_)

	if b2 then
		
		
		
		
		b1 = nil
	elseif b0 ~= nil and aJ(bZ, b0) then
		
		
		bX.flags = bit32.bor(bX.flags, S)
	end

	
	bX.flags = bit32.bor(bX.flags, P)

	markRef(bW, bX)
	reconcileChildren(bW, bX, b1, bY)
	return bX.child
end

local function updateHostText(bW, bX)
	if bW == nil then
		bh(bX)
	end
	
	
	return nil
end

local function mountLazyComponent(
	bW,
	bX,
	bY,
	bZ,
	b_
)
	if bW ~= nil then
		
		
		
		
		bW.alternate = nil
		bX.alternate = nil
		
		bX.flags = bit32.bor(bX.flags, Q)
	end

	local b0 = bX.pendingProps
	local b1: LazyComponentType<any, any> = bY
	local b2 = b1._payload
	local b3 = b1._init
	local b4 = b3(b2)
	
	bX.type = b4
	bX.tag = bs(b4)
	local b5 = bX.tag
	local b6 = bq(b4, b0)
	local b7
	if b5 == s then
		if a then
			validateFunctionComponentInDev(bX, b4)
			b4 = ar(b4)
			bX.type = b4
		end
		b7 = bR(
			nil,
			bX,
			b4,
			b6,
			b_
		)
		return b7
	elseif b5 == t then
		if a then
			b4 = at(b4)
			bX.type = b4
		end
		b7 = updateClassComponent(
			nil,
			bX,
			b4,
			b6,
			b_
		)
		return b7
	elseif b5 == y then
		if a then
			b4 = as(b4)
			bX.type = b4
		end
		b7 =
			updateForwardRef(nil, bX, b4, b6, b_)
		return b7
	elseif b5 == G then
		if a or b then
			if bX.type ~= bX.elementType then
				
				local b8 = b4.propTypes
				local b9 = b4.validateProps
				if b8 or b9 then
					q(
						b8,
						b9,
						b6, 
						"prop",
						ai(b4)
					)
				end
			end
		end
		b7 = updateMemoComponent(
			nil,
			bX,
			b4,
			bq(b4.type, b6), 
			bZ,
			b_
		)
		return b7
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	end
	local b8 = ""
	if a then
		if
			b4 ~= nil
			and type(b4) == "table"
			and b4["$$typeof"] == ak
		then
			b8 = " Did you wrap a component in React.lazy() more than once?"
		elseif type(b4) == "table" and b4["$$typeof"] == nil then
			b8 = "\n" .. i(b4)
		end
	end
	
	
	
	af(
		false,
[[Element type is invalid. Received a promise that resolves to: %s. Lazy element type must resolve to a class or function.%s]]
,
		tostring(b4),
		b8
	)
	
	return nil
end

function mountIncompleteClassComponent(
	bW,
	bX,
	bY,
	bZ,
	b_
)
	if bW ~= nil then
		
		
		
		
		bW.alternate = nil
		bX.alternate = nil
		
		bX.flags = bit32.bor(bX.flags, Q)
	end

	
	bX.tag = t

	

	
	
	
	local b0
	if ba(bY) then
		b0 = true
		a9(bX)
	else
		b0 = false
	end
	a1(
		bX,
		b_,
		bP.markWorkInProgressReceivedUpdate
	)

	bm(bX, bY, bZ)
	bn(bX, bY, bZ, b_)

	return finishClassComponent(
		nil,
		bX,
		bY,
		true,
		b0,
		b_
	)
end

local function mountIndeterminateComponent(
	bW,
	bX,
	bY,
	bZ
)
	if bW ~= nil then
		
		
		
		
		bW.alternate = nil
		bX.alternate = nil
		
		bX.flags = bit32.bor(bX.flags, Q)
	end

	local b_ = bX.pendingProps
	local b0
	if not _ then
		local b1 = a7(bX, bY, false)
		b0 = a6(bX, b1)
	end

	a1(
		bX,
		bZ,
		bP.markWorkInProgressReceivedUpdate
	)
	local b1

	if a then
		if
			
			
			type(bY) == "table" and type(bY.render) == "function"
		then
			local b2 = ai(bY) or "Unknown"

			if not bT.didWarnAboutBadClass[b2] then
				e.error(
[[The <%s /> component appears to have a render method, but doesn't extend React.Component. This is likely to cause errors. Change %s to extend React.Component instead.]]
,
					b2,
					b2
				)
				bT.didWarnAboutBadClass[b2] = true
			end
		end

		if bit32.band(bX.mode, aG) ~= 0 then
			am.recordLegacyContextWarning(bX)
		end

		ap(true)
		bO.current = bX
		b1 =
			renderWithHooks(nil, bX, bY, b_, b0, bZ)
		ap(false)
	else
		b1 =
			renderWithHooks(nil, bX, bY, b_, b0, bZ)
	end
	
	bX.flags = bit32.bor(bX.flags, P)
	
	local b2 = type(b1)
	

	if a then
		
		
		if
			b1 ~= nil
			and b2 == "table"
			and type(b1.render) == "function"
			and b1["$$typeof"] == nil
		then
			local b3 = ai(bY) or "Unknown"
			if not bT.didWarnAboutModulePatternComponent[b3] then
				e.error(
[[The <%s /> component appears to be a function component that returns a class instance. Change %s to a class that extends React.Component instead. ]]
,
					
					
					
					
					b3,
					b3
					
				)
				bT.didWarnAboutModulePatternComponent[b3] = true
			end
		end
	end

	if
		
		
		not aa
		and b1 ~= nil
		and b2 == "table"
		and type(b1.render) == "function"
		and b1["$$typeof"] == nil
	then
		if a then
			local b3 = ai(bY) or "Unknown"
			if not bT.didWarnAboutModulePatternComponent[b3] then
				e.error(
					"The <%s /> component appears to be a function component that returns a class instance. "
						.. "Change %s to a class that extends React.Component instead. "
						
						
						
						
						.. b3,
					b3
					
				)
				bT.didWarnAboutModulePatternComponent[b3] = true
			end
		end

		
		bX.tag = t

		
		bX.memoizedState = nil
		bX.updateQueue = nil

		
		
		
		local b3 = false
		if ba(bY) then
			b3 = true
			a9(bX)
		else
			b3 = false
		end

		
		bX.memoizedState = b1.state

		aB(bX)

		
		local b4
		if type(bY) ~= "function" then
			b4 = (bY :: React_Component<any, any>).getDerivedStateFromProps
		end
		if
			b4 ~= nil
			and type(b4) == "function"
		then
			bl(
				bX,
				bY,
				b4,
				b_
			)
		end

		bk(bX, b1)
		bn(bX, bY, b_, bZ)
		return finishClassComponent(
			nil,
			bX,
			bY,
			true,
			b3,
			bZ
		)
	else
		
		bX.tag = s
		if a then
			if _ and bY.contextTypes then
				e.error(
[[%s uses the legacy contextTypes API which is no longer supported. Use React.createContext() with React.useContext() instead.]]
,
					ai(bY) or "Unknown"
				)
			end

			if
				Z
				and bit32.band(bX.mode, aG) ~= 0
			then
				bM()
				local b3, b4 = xpcall(
					renderWithHooks,
					ag,
					nil,
					bX,
					bY,
					b_,
					b0,
					bZ
				)
				
				bN()
				if b3 then
					b1 = b4
				else
					error(b4)
				end
			end
		end
		reconcileChildren(nil, bX, b1, bZ)
		if a then
			validateFunctionComponentInDev(bX, bY)
		end
		return bX.child
	end
end

function validateFunctionComponentInDev(bW: Fiber, bX: any)
	if a then
		
		
		
		
		
		
		
		
		
		if bW.ref ~= nil then
			local bY = ""
			local bZ = ao()
			if bZ then
				bY ..= "\n\nCheck the render method of `" .. bZ .. "`."
			end

			local b_ = bZ or bW._debugID or ""
			local b0 = bW._debugSource
			if b0 then
				b_ = b0.fileName .. ":" .. b0.lineNumber
			end
			if not bT.didWarnAboutFunctionRefs[b_] then
				bT.didWarnAboutFunctionRefs[b_] = true
				e.error(
[[Function components cannot be given refs. Attempts to access this ref will fail. Did you mean to use React.forwardRef()?%s]]

,
					bY
				)
			end
		end

		if
			ae
			
			and type(bX) ~= "function"
			and bX.defaultProps ~= nil
		then
			local bY = ai(bX) or "Unknown"

			if not bT.didWarnAboutDefaultPropsOnFunctionComponent[bY] then
				e.error(
[[%s: Support for defaultProps will be removed from function components in a future major release.]]

, 
					bY
				)
				bT.didWarnAboutDefaultPropsOnFunctionComponent[bY] = true
			end
		end

		
		if
			type(bX) ~= "function"
			and bX.getDerivedStateFromProps ~= nil
			and type(bX.getDerivedStateFromProps) == "function"
		then
			local bY = ai(bX) or "Unknown"

			if
				not bT.didWarnAboutGetDerivedStateOnFunctionComponent[bY]
			then
				e.error(
					"%s: Function components do not support getDerivedStateFromProps.",
					bY
				)
				bT.didWarnAboutGetDerivedStateOnFunctionComponent[bY] =
					true
			end
		end

		
		if
			type(bX) ~= "function"
			and bX.contextType ~= nil
			and type(bX.contextType) == "table"
		then
			local bY = ai(bX) or "Unknown"

			if not bT.didWarnAboutContextTypeOnFunctionComponent[bY] then
				e.error(
					"%s: Function components do not support contextType.",
					bY
				)
				bT.didWarnAboutContextTypeOnFunctionComponent[bY] = true
			end
		end
	end
end

local bW: SuspenseState = {
	dehydrated = nil,
	retryLane = m.NoLane,
}

local function mountSuspenseOffscreenState(bX: Lanes): OffscreenState
	return {
		baseLanes = bX,
	}
end

local function updateSuspenseOffscreenState(
	bX: OffscreenState,
	bY: Lanes
): OffscreenState
	return {
		baseLanes = m.mergeLanes(bX.baseLanes, bY),
	}
end


local function shouldRemainOnFallback(
	bX: SuspenseContext,
	bY: nil | Fiber,
	bZ: Fiber,
	b_: Lanes
)
	
	
	
	if bY ~= nil then
		local b0: SuspenseState = (bY :: Fiber).memoizedState
		if b0 == nil then
			
			
			
			
			return false
		end
	end

	
	return aS(bX, aT)
end

local function getRemainingWorkInPrimaryTree(bX: Fiber, bY)
	
	return m.removeLanes(bX.childLanes, bY)
end


local bX
local bY
local bZ
local b_
local b0

local function updateSuspenseComponent(b1, b2, b3)
	local b4 = b2.pendingProps

	
	if a then
		if shouldSuspend(b2) then
			b2.flags = bit32.bor(b2.flags, T)
		end
	end

	local b5: SuspenseContext = aR.current

	local b6 = false
	local b7 = bit32.band(b2.flags, T) ~= N

	if
		b7
		or shouldRemainOnFallback(b5, b1, b2, b3)
	then
		
		
		b6 = true
		b2.flags = bit32.band(b2.flags, bit32.bnot(T))
	else
		
		if b1 == nil or b1.memoizedState ~= nil then
			
			
			
			
			
			if
				b4.fallback ~= nil
				and b4.unstable_avoidThisFallback ~= true
			then
				b5 = aU(
					b5,
					aV
				)
			end
		end
	end

	b5 = aX(b5)

	aW(b2, b5)

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	if b1 == nil then
		
		
		
		if b4.fallback ~= nil then
			bh(b2)
			
			if ad then
				local b8: nil | SuspenseState = b2.memoizedState
				if b8 ~= nil then
					local b9 = (b8 :: SuspenseState).dehydrated
					if b9 ~= nil then
						return bY(
							b2,
							b9,
							b3
						)
					end
				end
			end
		end

		local b8 = b4.children
		local b9 = b4.fallback
		if b6 then
			local ca = mountSuspenseFallbackChildren(
				b2,
				b8,
				b9,
				b3
			)
			local cb: Fiber = b2.child :: any
			cb.memoizedState = mountSuspenseOffscreenState(b3)
			b2.memoizedState = bW
			return ca
		elseif
			b4.unstable_expectedLoadTime ~= nil
			and type(b4.unstable_expectedLoadTime) == "number"
		then
			
			
			
			local ca = mountSuspenseFallbackChildren(
				b2,
				b8,
				b9,
				b3
			)
			local cb: Fiber = b2.child :: any
			cb.memoizedState = mountSuspenseOffscreenState(b3)
			b2.memoizedState = bW

			
			
			
			
			
			
			
			
			b2.lanes = m.SomeRetryLane
			if ac then
				bA(m.SomeRetryLane)
			end
			return ca
		else
			return bZ(
				b2,
				b8,
				b3
			)
		end
	else
		

		
		
		local b8: nil | SuspenseState = b1.memoizedState
		if b8 ~= nil then
			

			
			if ad then
				
				local b9 = (b8 :: SuspenseState).dehydrated

				if b9 ~= nil then
					if not b7 then
						return b0(
							b1,
							b2,
							b9,
							b8,
							b3
						)
					elseif b2.memoizedState ~= nil then
						
						
						b2.child = b1.child
						
						
						b2.flags = bit32.bor(b2.flags, T)
						return nil
					else
						
						
						local ca = b4.children
						local cb = b4.fallback
						local cc =
							mountSuspenseFallbackAfterRetryWithoutHydrating(
								b1,
								b2,
								ca,
								cb,
								b3
							)
						local cd: Fiber = b2.child :: any
						cd.memoizedState =
							mountSuspenseOffscreenState(b3)
						b2.memoizedState = bW
						return cc
					end
				end
			end

			if b6 then
				local b9 = b4.fallback
				local ca = b4.children
				local cb = b_(
					b1,
					b2,
					ca,
					b9,
					b3
				)
				local cc: Fiber = b2.child :: any
				local cd: OffscreenState | nil = (b1.child :: any).memoizedState

				
				if cd == nil then
					cc.memoizedState =
						mountSuspenseOffscreenState(b3)
				else
					
					cc.memoizedState = updateSuspenseOffscreenState(
						cd :: OffscreenState,
						b3
					)
				end

				cc.childLanes =
					getRemainingWorkInPrimaryTree(b1, b3)
				b2.memoizedState = bW
				return cb
			else
				local b9 = b4.children
				local ca = bX(
					b1,
					b2,
					b9,
					b3
				)
				b2.memoizedState = nil
				return ca
			end
		else
			
			if b6 then
				
				local b9 = b4.fallback
				local ca = b4.children
				local cb = b_(
					b1,
					b2,
					ca,
					b9,
					b3
				)
				local cc: Fiber = b2.child :: any
				local cd: OffscreenState | nil = (b1.child :: any).memoizedState

				
				if cd == nil then
					cc.memoizedState =
						mountSuspenseOffscreenState(b3)
				else
					
					cc.memoizedState = updateSuspenseOffscreenState(
						cd :: OffscreenState,
						b3
					)
				end

				cc.childLanes =
					getRemainingWorkInPrimaryTree(b1, b3)
				
				
				b2.memoizedState = bW
				return cb
			else
				
				
				local b9 = b4.children
				local ca = bX(
					b1,
					b2,
					b9,
					b3
				)
				b2.memoizedState = nil
				return ca
			end
		end
	end
end

function bZ(b1, b2, b3)
	local b4 = b1.mode
	local b5: OffscreenProps = {
		mode = "visible",
		children = b2,
	}
	local b6 =
		bu(b5, b4, b3, nil)
	b6.return_ = b1
	b1.child = b6
	return b6
end

function mountSuspenseFallbackChildren(
	b1,
	b2,
	b3,
	b4
)
	local b5 = b1.mode
	local b6: Fiber | nil = b1.child

	local b7: OffscreenProps = {
		mode = "hidden",
		children = b2,
	}

	local b8
	local b9
	if bit32.band(b5, aH) == aE and b6 ~= nil then
		
		
		b8 = b6
		b8.childLanes = m.NoLanes
		b8.pendingProps = b7

		if ab and bit32.band(b1.mode, aF) ~= 0 then
			
			
			
			
			b8.actualDuration = 0
			b8.actualStartTime = -1
b8.selfBaseDuration = 0
			b8.treeBaseDuration = 0
		end

		b9 =
			bt(b3, b5, b4, nil)
	else
		b8 =
			bu(b7, b5, m.NoLanes, nil)
		b9 =
			bt(b3, b5, b4, nil)
	end

	b8.return_ = b1
	b9.return_ = b1
	b8.sibling = b9
	b1.child = b8
	return b9
end

local function createWorkInProgressOffscreenFiber(
	b1: Fiber,
	b2: OffscreenProps
)
	
	
	return bx(b1, b2)
end

function bX(
	b1,
	b2,
	b3,
	b4
)
	local b5: Fiber = b1.child :: any
	local b6: Fiber | nil = b5.sibling

	local b7 =
		createWorkInProgressOffscreenFiber(b5, {
			mode = "visible",
			children = b3,
		})
	if bit32.band(b2.mode, aH) == aE then
		b7.lanes = b4
	end
	b7.return_ = b2
	b7.sibling = nil
	if b6 ~= nil then
		
		local b8 = b2.deletions
		if b8 == nil then
			b2.deletions = { b6 }
			
			b2.flags = bit32.bor(b2.flags, V)
		else
			table.insert(b8, b6)
		end
	end

	b2.child = b7
	return b7
end

function b_(
	b1,
	b2,
	b3,
	b4,
	b5
)
	local b6 = b2.mode
	local b7: Fiber = b1.child :: any
	local b8: Fiber | nil = b7.sibling

	local b9: OffscreenProps = {
		mode = "hidden",
		children = b3,
	}

	local ca
	if
		
		
		bit32.band(b6, aH) == aE
		
		
		
		
		
		
		and b2.child ~= b7
	then
		local cb: Fiber = b2.child
		ca = cb
		ca.childLanes = m.NoLanes
		ca.pendingProps = b9

		if ab and bit32.band(b2.mode, aF) ~= 0 then
			
			
			
			
			ca.actualDuration = 0
			ca.actualStartTime = -1
ca.selfBaseDuration =
				b7.selfBaseDuration
			ca.treeBaseDuration =
				b7.treeBaseDuration
		end

		
		
		
		b2.deletions = nil
	else
		ca = createWorkInProgressOffscreenFiber(
			b7,
			b9
		)

		
		
		
		ca.subtreeFlags =
			bit32.band(b7.subtreeFlags, O)
	end
	local cb
	if b8 ~= nil then
		cb =
			bx(b8, b4)
	else
		cb =
			bt(b4, b6, b5, nil)
		
		
		cb.flags = bit32.bor(cb.flags, Q)
	end

	cb.return_ = b2
	ca.return_ = b2
	ca.sibling = cb
	b2.child = ca

	return cb
end

local function retrySuspenseComponentWithoutHydrating(
	b1: Fiber,
	b2: Fiber,
	b3: Lanes
)
	
	aw(b2, b1.child, nil, b3)

	
	local b4 = b2.pendingProps
	local b5 = b4.children
	local b6 =
		bZ(b2, b5, b3)
	
	
	b6.flags = bit32.bor(b6.flags, Q)
	b2.memoizedState = nil

	return b6
end

function mountSuspenseFallbackAfterRetryWithoutHydrating(
	b1,
	b2,
	b3,
	b4,
	b5
)
	local b6 = b2.mode
	local b7 =
		bu(b3, b6, m.NoLanes, nil)
	local b8 =
		bt(b4, b6, b5, nil)
	
	
	b8.flags = bit32.bor(b8.flags, Q)

	b7.return_ = b2
	b8.return_ = b2
	b7.sibling = b8
	b2.child = b7

	if bit32.band(b2.mode, aH) ~= aE then
		
		
		aw(b2, b1.child, nil, b5)
	end

	return b8
end

function bY(
	b1: Fiber,
	b2: SuspenseInstance,
	b3: Lanes
): nil | Fiber
	
	
	if bit32.band(b1.mode, aH) == aE then
		if a then
			e.error(
[[Cannot hydrate Suspense in legacy mode. Switch fromReactDOM.hydrate(element, container) to ReactDOM.createBlockingRoot(container, { hydrate: true }).render(element) or remove the Suspense componentsthe server rendered components.]]			




)
		end
		b1.lanes = m.laneToLanes(m.SyncLane)
	elseif aL(b2) then
		
		
		
		
		

		
		
		
		
		
		
		if ac then
			bA(m.DefaultHydrationLane)
		end
		b1.lanes =
			m.laneToLanes(m.DefaultHydrationLane)
	else
		
		
		b1.lanes = m.laneToLanes(m.OffscreenLane)
		if ac then
			bA(m.OffscreenLane)
		end
	end
	return nil
end

function b0(
	b1: Fiber,
	b2: Fiber,
	b3: SuspenseInstance,
	b4: SuspenseState,
	b5: Lanes
): nil | Fiber
	
	
	bi()

	if bit32.band(bF(), bG) ~= bH then
		return retrySuspenseComponentWithoutHydrating(
			b1,
			b2,
			b5
		)
	end

	if bit32.band(b2.mode, aH) == aE then
		return retrySuspenseComponentWithoutHydrating(
			b1,
			b2,
			b5
		)
	end

	if aL(b3) then
		
		
		
		return retrySuspenseComponentWithoutHydrating(
			b1,
			b2,
			b5
		)
	end
	
	
	local b6 =
		m.includesSomeLane(b5, b1.childLanes)
	if bS or b6 then
		
		
		local b7 = bE()
		if b7 ~= nil then
			local b8 =
				m.getBumpedLaneForHydration(b7, b5)
			if
				b8 ~= m.NoLane
				and b8 ~= b4.retryLane
			then
				
				
				
				b4.retryLane = b8
				
				local b9 = m.NoTimestamp
				bC(b1, b8, b9)
				
				
				
				
				
				
			
end
		end

		
		
		
		
		
		bD()
		return retrySuspenseComponentWithoutHydrating(
			b1,
			b2,
			b5
		)
	elseif aK(b3) then
		
		
		
		
		
		
		
		
		
		b2.flags = bit32.bor(b2.flags, T)
		
		b2.child = b1.child

		
		
		local b7 = function()
			return bB(b1)
		end

		if ac then
			if bI == nil then
				bI =
					require(script.Parent.Parent:WaitForChild('scheduler')).tracing.unstable_wrap
			end
			b7 = bI(b7)
		end

		aM(b3, b7)
		return nil
	else
		
		bg(
			b2,
			b3
		)
		local b7 = b2.pendingProps
		local b8 = b7.children
		local b9 =
			bZ(b2, b8, b5)
		
		
		
		
		
		
		b9.flags = bit32.bor(b9.flags, R)
		return b9
	end
end




























































































































































































































































































































































































function updatePortalComponent(
	b1: Fiber | nil,
	b2: Fiber,
	b3: Lanes
)
	aQ(b2, b2.stateNode.containerInfo)
	local b4 = b2.pendingProps
	if b1 == nil then
		
		
		
		
		
		b2.child =
			aw(b2, nil, b4, b3)
	else
		reconcileChildren(b1, b2, b4, b3)
	end
	return b2.child
end

local b1 = false

local function updateContextProvider(
	b2: Fiber | nil,
	b3: Fiber,
	b4: Lanes
)
	local b5: ReactProviderType<any> = b3.type
	local b6: ReactContext<any> = b5._context

	local b7 = b3.pendingProps
	local b8 = b3.memoizedProps

	local b9 = b7.value

	if a or b then
		if g.indexOf(h.keys(b7), "value") < 1 then
			if not b1 then
				b1 = true
				e.error(
					"The `value` prop is required for the `<Context.Provider>`. Did you misspell it or forget to pass it?"
				)
			end
		end
		
		local ca = b3.type.propTypes
		local cb = b3.type.validateProps

		if ca or cb then
			q(
				ca,
				cb,
				b7,
				"prop",
				"Context.Provider"
			)
		end
	end

	a2(b3, b9)

	if b8 ~= nil then
		local ca = b8.value
		local cb = a0(b6, b9, ca)
		if cb == 0 then
			
			if
				b8.children == b7.children
				and not a8()
			then
				return bQ(b2, b3, b4)
			end
		else
			
			
			aZ(b3, b6, cb, b4)
		end
	end

	local ca = b7.children
	reconcileChildren(b2, b3, ca, b4)
	return b3.child
end


local b2 = {
	usingContextAsConsumer = false,
	usingLegacyConsumer = false,
}

function updateContextConsumer(
	b3: Fiber | nil,
	b4: Fiber,
	b5: Lanes
)
	local b6: ReactContext<any> = b4.type
	
	
	
	
	
	
	
	if a then
		if (b6 :: any)._context == nil then
			
			
			
			if b6 ~= b6.Consumer then
				if not b2.usingContextAsConsumer then
					b2.usingContextAsConsumer = true
					e.error(
[[Rendering <Context> directly is not supported and will be removed in a future major release. Did you mean to render <Context.Consumer> instead?]]					

)
				end
			end
		else
			b6 = (b6 :: any)._context
		end
	end
	local b7 = b4.pendingProps

	
	local b8
	if b7.render then
		if a and c then
			if not b2.usingLegacyConsumer then
				b2.usingLegacyConsumer = true
				e.warn(
[[Your Context.Consumer component is using legacy Roact syntax, which won't be supported in future versions of Roact. 
Please provide no props and supply the 'render' function as a child (the 3rd argument of createElement). For example: 
       createElement(ContextConsumer, {render = function(...) end})
becomes:
       createElement(ContextConsumer, nil, function(...) end)
For more info, reference the React documentation here: 
https://reactjs.org/docs/context.html#contextconsumer]]				
)
			end
		end
		b8 = b7.render
	else
		b8 = b7.children
	end

	if a then
		if type(b8) ~= "function" then
			e.error(
[[A context consumer was rendered with multiple children, or a child that isn't a function. A context consumer expects a single child that is a function. If you did pass a function, make sure there is no trailing or leading whitespace around it.]]			



)
		end
	end

	a1(
		b4,
		b5,
		bP.markWorkInProgressReceivedUpdate
	)
	local b9 = a_(b6, b7.unstable_observedBits)
	local ca
	if a then
		bO.current = b4
		ap(true)
		ca = b8(b9)
		ap(false)
	else
		ca = b8(b9)
	end

	
	b4.flags = bit32.bor(b4.flags, P)
	reconcileChildren(b3, b4, ca, b5)
	return b4.child
end























bP.markWorkInProgressReceivedUpdate = function()
	bS = true
end

function bQ(
	b3: Fiber | nil,
	b4: Fiber,
	b5: Lanes
): Fiber | nil
	if b3 then
		
		b4.dependencies = b3.dependencies
	end

	if ab then
		
		a4(b4)
	end

	bK(b4.lanes)

	
	if not m.includesSomeLane(b5, b4.childLanes) then
		
		
		
		return nil
	else
		
		
		ax(b3, b4)
		return b4.child
	end
end

function remountFiber(
	b3: Fiber,
	b4: Fiber,
	b5: Fiber
): Fiber | nil
	if a then
		local b6 = b4.return_
		if b6 == nil then
			error("Cannot swap the root fiber.")
		end
		
		assert(b6 ~= nil, "returnFiber was nil in remountFiber")

		
		
		b3.alternate = nil
		b4.alternate = nil

		
		b5.index = b4.index
		b5.sibling = b4.sibling
		b5.return_ = b4.return_
		b5.ref = b4.ref

		
		if b4 == b6.child then
			b6.child = b5
		else
			local b7 = b6.child
			if b7 == nil then
				error("Expected parent to have a child.")
			end
			
			assert(b7 ~= nil, "prevSibling was nil in remountFiber")

			while b7.sibling ~= b4 do
				b7 = b7.sibling
				if b7 == nil then
					error("Expected to find the previous sibling.")
				end
			end
			b7.sibling = b5
		end

		
		
		local b7 = b6.deletions
		if b7 == nil then
			b6.deletions = { b3 }
			
			b6.flags = bit32.bor(b6.flags, V)
		else
			table.insert(b7, b3)
		end

		b5.flags = bit32.bor(b5.flags, Q)

		
		return b5
	else
		error(
[[Did not expect this call in production. This is a bug in React. Please file an issue.]]		

)
	end
end



local function beginWork(b3: any, b4: Fiber, b5: Lanes): Fiber?
	local b6 = b4.lanes

	if a then
		if b4._debugNeedsRemount and b3 ~= nil then
			
			return remountFiber(
				b3,
				b4,
				bv(
					b4.type,
					
					b4.key :: string?,
					b4.pendingProps,
					b4._debugOwner or nil,
					b4.mode,
					b4.lanes
				)
			)
		end
	end

	if b3 ~= nil then
		local b7 = b3.memoizedProps
		local b8 = b4.pendingProps

		if
			b7 ~= b8
			or a8()
			
			or if a then b4.type ~= b3.type else false
		then
			
			
			bS = true
		elseif not m.includesSomeLane(b5, b6) then
			bS = false
			
			
			
			if b4.tag == u then
				pushHostRootContext(b4)
				be()
			elseif b4.tag == v then
				aP(b4)
			elseif b4.tag == t then
				local b9 = b4.type
				if ba(b9) then
					a9(b4)
				end
			elseif b4.tag == x then
				aQ(b4, b4.stateNode.containerInfo)
			elseif b4.tag == B then
				local b9 = b4.memoizedProps.value
				a2(b4, b9)
			elseif b4.tag == D then
				if ab then
					
					
					local b9 = b4.stateNode
					b9.effectDuration = 0
					b9.passiveEffectDuration = 0
				end
			elseif b4.tag == E then
				local b9: SuspenseState | nil = b4.memoizedState
				if b9 ~= nil then
					if ad then
						if (b9 :: SuspenseState).dehydrated ~= nil then
							aW(
								b4,
								aX(
									aR.current
								)
							)
							
							
							
							b4.flags =
								bit32.bor(b4.flags, T)
							
							
							return nil
						end
					end

					
					
					
					
					local ca: Fiber = b4.child :: any
					local cb = ca.childLanes
					if
						m.includesSomeLane(b5, cb)
					then
						
						
						return updateSuspenseComponent(
							b3,
							b4,
							b5
						)
					else
						
						
						aW(
							b4,
							aX(aR.current)
						)
						
						
						local cc = bQ(
							b3,
							b4,
							b5
						)
						if cc ~= nil then
							
							
							return cc.sibling
						else
							return nil
						end
					end
				else
					aW(
						b4,
						aX(aR.current)
					)
				end
			elseif b4.tag == F then
				unimplemented("beginWork: SuspenseListComponent")
			

			
			
			
			

			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			

			
			
			
			
			
			
			
			
			
			
			

			
			
			
			
			
			
			elseif
				b4.tag == K
				or b4.tag == L
			then
				
				
				
				
				
				
				
				
				b4.lanes = m.NoLanes
				return updateOffscreenComponent(b3, b4, b5)
			end
			return bQ(b3, b4, b5)
		else
			if bit32.band(b3.flags, W) ~= N then
				
				
				bS = true
			else
				
				
				
				
				bS = false
			end
		end
	else
		bS = false
	end

	
	
	
	
	
	b4.lanes = m.NoLanes

	if b4.tag == r.IndeterminateComponent then
		return mountIndeterminateComponent(
			b3,
			b4,
			b4.type,
			b5
		)
	elseif b4.tag == I then
		local b7 = b4.elementType
		return mountLazyComponent(
			b3,
			b4,
			b7,
			b6,
			b5
		)
	elseif b4.tag == s then
		local b7 = b4.type
		local b8 = b4.pendingProps
		local b9
		if b4.elementType == b7 then
			b9 = b8
		else
			b9 = bq(b7, b8)
		end
		return bR(
			b3,
			b4,
			b7,
			b9,
			b5
		)
	elseif b4.tag == t then
		local b7 = b4.type
		local b8 = b4.pendingProps
		local b9 = b4.elementType == b7 and b8
			or bq(b7, b8)
		return updateClassComponent(
			b3,
			b4,
			b7,
			b9,
			b5
		)
	elseif b4.tag == u then
		return updateHostRoot(b3, b4, b5)
	elseif b4.tag == v then
		return updateHostComponent(b3, b4, b5)
	elseif b4.tag == w then
		return updateHostText(b3, b4)
	elseif b4.tag == E then
		return updateSuspenseComponent(b3, b4, b5)
	elseif b4.tag == x then
		return updatePortalComponent(b3, b4, b5)
	elseif b4.tag == y then
		local b7 = b4.type
		local b8 = b4.pendingProps
		local b9 = b8
		if b4.elementType ~= b7 then
			b9 = bq(b7, b8)
		end
		return updateForwardRef(b3, b4, b7, b9, b5)
	elseif b4.tag == z then
		return updateFragment(b3, b4, b5)
	elseif b4.tag == A then
		return updateMode(b3, b4, b5)
	elseif b4.tag == D then
		return updateProfiler(b3, b4, b5)
	elseif b4.tag == B then
		return updateContextProvider(b3, b4, b5)
	elseif b4.tag == C then
		return updateContextConsumer(b3, b4, b5)
	elseif b4.tag == G then
		local b7 = b4.type
		local b8 = b4.pendingProps
		
		local b9 = bq(b7, b8)
		if a or b then
			if b4.type ~= b4.elementType then
				
				local ca
				local cb
				
				if type(b7) == "table" then
					ca = b7.propTypes
					cb = b7.validateProps
				end
				if ca or cb then
					q(
						ca,
						cb,
						b9, 
						"prop",
						ai(b7)
					)
				end
			end
		end
		b9 = bq(b7.type, b9)
		return updateMemoComponent(
			b3,
			b4,
			b7,
			b9,
			b6,
			b5
		)
	elseif b4.tag == H then
		return bU(
			b3,
			b4,
			b4.type,
			b4.pendingProps,
			b6,
			b5
		)
	elseif b4.tag == J then
		local b7 = b4.type
		local b8 = b4.pendingProps
		local b9 = b4.elementType == b7 and b8
			or bq(b7, b8)
		return mountIncompleteClassComponent(
			b3,
			b4,
			b7,
			b9,
			b5
		)
	
	
	
	
	
	
	
	
	
	
	
	elseif b4.tag == K then
		return updateOffscreenComponent(b3, b4, b5)
	elseif b4.tag == L then
		return bV(b3, b4, b5)
	end
	af(
		false,
[[Unknown unit of work tag (%s). This error is likely caused by a bug in React. Please file an issue.]]
,
		tostring(b4.tag)
	)
	return nil
end
bP.beginWork = beginWork

return bP
