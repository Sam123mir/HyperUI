










local function unimplemented(a: string)
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. a)
	error("FIXME (roblox): " .. a .. " is unimplemented")
end
local a = _G.__DEV__ :: boolean
local b = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
local c = b.Array
local d = b.Error
local e = b.Object


local f = require(script.Parent.Parent:WaitForChild('react')).createRef
local g = require(script.Parent.Parent:WaitForChild('react')).createBinding


local h = require(script.Parent.Parent:WaitForChild('shared')).console

local i = require(script.Parent.Parent:WaitForChild('shared'))
type ReactContext<T> = i.ReactContext<T>
type ReactBinding<T> = i.ReactBinding<T>
type ReactBindingUpdater<T> = i.ReactBindingUpdater<T>
type MutableSource<T> = i.MutableSource<T>
type MutableSourceGetSnapshotFn<Source, Snapshot> = i.MutableSourceGetSnapshotFn<
	Source,
	Snapshot
>
type MutableSourceSubscribeFn<Source, Snapshot> = i.MutableSourceSubscribeFn<
	Source,
	Snapshot
>

local j = require(script.Parent:WaitForChild('ReactInternalTypes'))
type Fiber = j.Fiber
type Dispatcher = j.Dispatcher
type HookType = j.HookType
type ReactPriorityLevel = j.ReactPriorityLevel
local k = require(script.Parent:WaitForChild('ReactFiberLane'))
type Lanes = k.Lanes
type Lane = k.Lane
local l = require(script.Parent:WaitForChild('ReactHookEffectTags'))
type HookFlags = l.HookFlags
type FiberRoot = j.FiberRoot


type OpaqueIDType = any

local m = require(script.Parent.Parent:WaitForChild('shared')).ReactSharedInternals
local n = require(script.Parent.Parent:WaitForChild('shared')).ReactFeatureFlags
local o: boolean? = n.enableDebugTracing
local p: boolean? = n.enableSchedulingProfiler
local q: boolean? = n.enableNewReconciler

local r = n.enableDoubleInvokingEffects


local s = require(script.Parent:WaitForChild('ReactTypeOfMode')).DebugTracingMode
local t = k.NoLane
local u = k.NoLanes

local v = k.isSubsetOfLanes
local w = k.mergeLanes
local x = k.removeLanes
local y = k.markRootEntangled
local z = k.markRootMutableRead




local A = require(script.Parent:WaitForChild('ReactFiberNewContext.new'))
local B = A.readContext
local C = require(script.Parent:WaitForChild('ReactFiberFlags'))
local D = C.Update
local E = C.Passive
local F = C.PassiveStatic
local G = C.MountLayoutDev
local H = C.MountPassiveDev
local I = l.HasEffect
local J = l.Layout
local K = l.Passive
local L = require(script.Parent:WaitForChild('ReactFiberWorkLoop.new')):: any
local M =
	L.warnIfNotCurrentlyActingUpdatesInDEV
local N = L.scheduleUpdateOnFiber
local O = L.warnIfNotScopedWithMatchingAct
local P = L.requestEventTime
local Q = L.requestUpdateLane
local R = L.markSkippedUpdateLanes
local S = L.getWorkInProgressRoot
local T =
	L.warnIfNotCurrentlyActingEffectsInDEV







local U = require(script.Parent.Parent:WaitForChild('shared')).invariant
local V = require(script.Parent.Parent:WaitForChild('shared')).getComponentName

local function is(W: any, X: any)
	return W == X and (W ~= 0 or 1 / W == 1 / X) or W ~= W and X ~= X 
end
local W =
	require(script.Parent:WaitForChild('ReactFiberBeginWork.new')).markWorkInProgressReceivedUpdate :: any






local X = require(script.Parent:WaitForChild('ReactFiberHydrationContext.new')).getIsHydrating




local Y = require(script.Parent:WaitForChild('ReactFiberHostConfig'))
local Z = Y.makeClientId



local _ = require(script.Parent:WaitForChild('ReactMutableSource.new'))
local aa = _.warnAboutMultipleRenderersDEV
local ab = _.getWorkInProgressVersion
local ac = _.setWorkInProgressVersion
local ad = _.markSourceAsDirty


local ae = require(script.Parent:WaitForChild('DebugTracing')).logStateUpdateScheduled
local af = require(script.Parent:WaitForChild('SchedulingProfiler')).markStateUpdateScheduled

local ag = m.ReactCurrentDispatcher



type Array<T> = { [number]: T }

type Update<S, A> = {
	lane: Lane,
	action: A,
	eagerReducer: ((S, A) -> S) | nil,
	eagerState: S | nil,
	next: Update<S, A>,
	priority: ReactPriorityLevel?
}

type UpdateQueue<S, A> = {
	pending: Update<S, A> | nil,
	dispatch: ((A) -> ...any) | nil,
	lastRenderedReducer: ((S, A) -> S) | nil,
	lastRenderedState: S | nil
}

local ah
local ai
if a then
	ai = {}
	ah = {}
end

export type Hook = {
	memoizedState: any,
	baseState: any,
	baseQueue: Update<any, any> | nil,
	queue: UpdateQueue<any, any> | nil,
	next: Hook?
}

export type Effect = {
	tag: HookFlags,
	
	create: (() -> (() -> ())) | (() -> ()),
	destroy: (() -> ())?,
	deps: Array<any> | nil,
	next: Effect
}

export type FunctionComponentUpdateQueue = {
	lastEffect: Effect?
}

type BasicStateAction<S> = ((S) -> S) | S

type Dispatch<A> = (A) -> ()

local aj: any = {}


local ak: Lanes = u


local al: Fiber = nil :: any







local am: any 


local an: any 





local ao: boolean = false




local ap: boolean = false

local aq = 25


local ar: HookType? 




local as: Array<HookType> | nil 
local at: number = 0





local au: boolean = false


local av: Dispatcher | nil 
local aw: Dispatcher | nil 
local ax: Dispatcher | nil 
local ay: Dispatcher | nil 
local az: Dispatcher | nil 
local aA: Dispatcher | nil 
local aB: Dispatcher | nil 


local function getHighestIndex(aC: Array<any>)
	local aD = 0
	for aE, aF in aC do
		aD = if aE > aD then aE else aD
	end
	return aD
end



local function isArrayOrSparseArray(aC: any)
	if type(aC) ~= "table" then
		return false
	end
	for aD, aE in aC do
		if type(aD) ~= "number" then
			return false
		end
	end
	return true
end

local function mountHookTypesDev()
	if a then
		local aC = (ar :: any) :: HookType

		if as == nil then
			
			as = ({ aC } :: any) :: Array<HookType>
		else
			table.insert(as, aC)
		end
	end
end

function updateHookTypesDev()
	if a then
		
		local aC: HookType = (ar :: any) :: HookType

		if as ~= nil then
			at += 1
			if as[at] ~= aC then
				warnOnHookMismatchInDev(aC)
			end
		end
	end
end

local function checkDepsAreArrayDev(aC: any)
	if a then
		if aC ~= nil and not isArrayOrSparseArray(aC) then
			
			
			h.error(
[[%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.]]
,
				ar,
				type(aC)
			)
		end
	end
end

function warnOnHookMismatchInDev(aC: HookType)
	if a then
		
		local aD = V(al.type)
			or "Component"
		if not ah[aD] then
			ah[aD] = true

			if as ~= nil then
				local aE = ""

				local aF = 30

				for aG = 1, at do
					local aH = (as :: any)[aG]
					local aI
					if aG == at then
						aI = aC
					else
						aI = aH
					end

					
					local aJ = tostring(aG) .. ". " .. (aH or "undefined")

					
					
					while string.len(aJ) < aF do
						aJ ..= " "
					end

					aJ ..= aI .. "\n"

					aE ..= aJ
				end

				h.error(
[[React has detected a change in the order of Hooks called by %s. This will lead to bugs and errors if not fixed. For more information, read the Rules of Hooks: https://reactjs.org/link/rules-of-hooks

   Previous render            Next render
   ------------------------------------------------------
%s   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
]]
,
					aD,
					aE
				)
			end
		end
	end
end

local function throwInvalidHookError(): ()
	error(
		d.new(
[[Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:
1. You might have mismatching versions of React and the renderer (such as React DOM)
2. You might be breaking the Rules of Hooks
3. You might have more than one copy of React in the same app
See https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.]]		

)
	)
end



local function areHookInputsEqual(aC: Array<any>, aD: Array<any>)
	if a then
		if au then
			
			return false
		end
	end

	if aD == nil then
		if a then
			
			h.error(
[[%s received a final argument during this render, but not during the previous render. Even though the final argument is optional, its type cannot change between renders.]]

,
				ar
			)
		end
		return false
	end

	
	
	local aE = getHighestIndex(aC)
	local aF = getHighestIndex(aD)

	
	
	
	
	
	if aE ~= aF then
		
		

		
		
		
		
		
		
		
		
		
		
		
		

		
		
		return false
	end
	

	local aG = math.min(aF, aE)
	for aH = 1, aG do
		if is(aC[aH], aD[aH]) then
			continue
		end
		return false
	end
	return true
end

aj.bailoutHooks = function(aC: Fiber, aD: Fiber, aE: Lanes)
	
	aD.updateQueue = aC.updateQueue
	if a and r then
		aD.flags = bit32.band(
			aD.flags,
			bit32.bnot(
				bit32.bor(
					H,
					E,
					G,
					D
				)
			)
		)
	else
		aD.flags = bit32.band(
			aD.flags,
			bit32.bnot(bit32.bor(E, D))
		)
	end
	aC.lanes = x(aC.lanes, aE)
end

local aC = false
aj.resetHooksAfterThrow = function(): ()
	
	
	ag.current = aj.ContextOnlyDispatcher

	if ao then
		
		
		
		
		
		
		
		
		
		
		local aD: any = al.memoizedState
		while aD ~= nil do
			local aE = aD.queue
			if aE ~= nil then
				aE.pending = nil
			end
			aD = aD.next
		end
		ao = false
	end

	ak = u
	al = nil :: any

	am = nil
	an = nil

	if a then
		as = nil
		at = 0

		ar = nil

		aC = false
	end

	ap = false
end

local function mountWorkInProgressHook(): Hook
	local aD: Hook = {
		memoizedState = nil,

		baseState = nil,
		baseQueue = nil,
		queue = nil,

		next = nil,
	}

	if an == nil then
		
		al.memoizedState = aD
		an = aD
	else
		
		an.next = aD
		an = aD
	end
	return an
end

local function updateWorkInProgressHook(): Hook
	
	
	
	
	
	
	
	local aD
	if am == nil then
		local aE = al.alternate
		if aE ~= nil then
			aD = aE.memoizedState
		else
			aD = nil
		end
	else
		aD = am.next
	end

	
	
	local aE: Hook
	if an == nil then
		aE = al.memoizedState
	else
		aE = an.next
	end

	if aE ~= nil then
		
		an = aE
		aE = an.next

		am = aD
	else
		

		
		if aD == nil then
			error(d.new("Rendered more hooks than during the previous render."))
		end

		am = aD

		local aF: Hook = {
			memoizedState = am.memoizedState,

			baseState = am.baseState,
			baseQueue = am.baseQueue,
			queue = am.queue,

			next = nil,
		}

		if an == nil then
			
			an = aF
			al.memoizedState = aF
		else
			
			an.next = aF
			an = aF
		end
	end
	return an
end








function basicStateReducer<S>(aD: S, aE: BasicStateAction<S>): S
	
	if type(aE) == "function" then
		return aE(aD)
	else
		return aE
	end
end

function mountReducer<S, I, A>(
	aD: (S, A) -> S,
	aE: I,
	aF: ((I) -> S)?
): (S, Dispatch<A>)
	local aG = mountWorkInProgressHook()
	local aH
	if aF ~= nil then
		aH = aF(aE)
	else
		aH = (aE :: any) :: S
	end
	aG.baseState = aH
	aG.memoizedState = aG.baseState

	local aI: UpdateQueue<S, A> = {
		pending = nil,
		dispatch = nil,
		lastRenderedReducer = aD,
		lastRenderedState = aH :: any,
	}
	aG.queue = aI

	
	
	local aJ = al
	
	local aK: Dispatch<A> = function(aK, ...)
		
		dispatchAction(aJ, aI :: UpdateQueue<any, any>, aK, ...)
	end :: any
	aI.dispatch = aK :: any
	
	return aG.memoizedState, aK
	
end

function updateReducer<S, I, A>(
	aD: (S, A) -> S,
	aE: I,
	aF: ((I) -> S)?
): (S, Dispatch<A>)
	local aG = updateWorkInProgressHook()
	local aH = aG.queue
	
	assert(
		aH ~= nil,
		"Should have a queue. This is likely a bug in React. Please file an issue."
	)

	aH.lastRenderedReducer = aD

	local aI: Hook = am

	
	local aJ = aI.baseQueue

	
	local aK = aH.pending
	if aK ~= nil then
		
		
		if aJ ~= nil then
			
			local aL = aJ.next
			local aM = aK.next
			aJ.next = aM
			aK.next = aL
		end
		
		
		
		
		
		
		
		
		
		
		
		aJ = aK
		aI.baseQueue = aJ
		aH.pending = nil
	end

	if aJ ~= nil then
		
		local aL = aJ.next
		local aM = aI.baseState

		local aN 		
local aO 		
local aP 		
local aQ = aL
		repeat
			local aR = aQ.lane
			
			
			if bit32.band(ak, aR) ~= aR then
				
				
				
				local aS: Update<S, A> = {
					lane = aR,
					action = aQ.action,
					eagerReducer = aQ.eagerReducer,
					eagerState = aQ.eagerState,
					next = nil :: any,
				}
				if aP == nil then
					aP = aS
					aO = aP
					aN = aM
				else
					aP.next = aS
					aP = aP.next
				end
				
				
				
				al.lanes =
					w(al.lanes, aR)
				R(aR)
			else
				

				if aP ~= nil then
					local aS: Update<S, A> = {
						
						
						
						lane = t,
						action = aQ.action,
						eagerReducer = aQ.eagerReducer,
						eagerState = aQ.eagerState,
						next = nil :: any,
					}
					aP.next = aS
					aP = aP.next
				end

				
				if aQ.eagerReducer == aD then
					
					
					aM = aQ.eagerState
				else
					local aS = aQ.action
					aM = aD(aM, aS)
				end
			end
			aQ = aQ.next
		until aQ == nil or aQ == aL

		if aP == nil then
			aN = aM
		else
			aP.next = aO
		end

		
		
		if not is(aM, aG.memoizedState) then
			W()
		end

		aG.memoizedState = aM
		aG.baseState = aN
		aG.baseQueue = aP

		aH.lastRenderedState = aM
	end

	local aL: Dispatch<A> = aH.dispatch :: any
	
	return aG.memoizedState, aL
end

function rerenderReducer<S, I, A>(
	aD: (S, A) -> S,
	aE: I,
	aF: ((I) -> S)?
): (S, Dispatch<A>)
	local aG = updateWorkInProgressHook()
	local aH = aG.queue
	
	assert(
		aH ~= nil,
		"Should have a queue. This is likely a bug in React. Please file an issue."
	)

	aH.lastRenderedReducer = aD

	
	
	local aI: Dispatch<A> = aH.dispatch :: Dispatch<A>
	local aJ = aH.pending
	local aK = aG.memoizedState
	if aJ ~= nil then
		
		aH.pending = nil

		local aL = aJ.next
		local aM = aL
		repeat
			
			
			
			local aN = aM.action
			aK = aD(aK, aN)
			aM = aM.next
		until aM == aL

		
		
		if not is(aK, aG.memoizedState) then
			W()
		end

		aG.memoizedState = aK
		
		
		
		
		if aG.baseQueue == nil then
			aG.baseState = aK
		end

		aH.lastRenderedState = aK
	end
	
	return aK, aI
end

type MutableSourceMemoizedState<Source, Snapshot> = {
	refs: {
		getSnapshot: MutableSourceGetSnapshotFn<Source, Snapshot>,
		setSnapshot: (Snapshot) -> ()	
},
	source: MutableSource<any>,
	subscribe: MutableSourceSubscribeFn<Source, Snapshot>
}

function readFromUnsubcribedMutableSource<Source, Snapshot>(
	aD: FiberRoot,
	aE: MutableSource<Source>,
	aF: MutableSourceGetSnapshotFn<
		Source,
		Snapshot
	>
): Snapshot
	if a then
		aa(aE)
	end

	local aG = aE._getVersion
	local aH = aG(aE._source)

	
	local aI = false

	
	
	
	local aJ = ab(aE)
	if aJ ~= nil then
		
		
		aI = aJ == aH
	else
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		aI = v(ak, aD.mutableReadLanes)

		if aI then
			
			
			
			ac(aE, aH)
		end
	end

	if aI then
		local aK = aF(aE._source)
		if a then
			
			if type(aK :: any) == "function" then
				h.error(
[[Mutable source should not return a function as the snapshot value. Functions may close over mutable values and cause tearing.]]				

)
			end
		end
		return aK
	else
		
		
		
		
		
		
		
		
		
		ad(aE)

		error(
			d.new(
				"Cannot read from mutable source during the current render without tearing. This is a bug in React. Please file an issue."
			)
		)
	end
end

function useMutableSource<Source, Snapshot>(
	aD: Hook,
	aE: MutableSource<Source>,
	aF: MutableSourceGetSnapshotFn<
		Source,
		Snapshot
	>,
	aG: MutableSourceSubscribeFn<
		Source,
		Snapshot
	>
): Snapshot
	local aH: FiberRoot = S()
	U(
		aH ~= nil,
		"Expected a work-in-progress root. This is a bug in React. Please file an issue."
	)

	local aI = aE._getVersion
	local aJ = aI(aE._source)

	local aK = ag.current
	
	assert(aK ~= nil, "dispatcher was nil, this is a bug in React")
	
	local aL, aM = aK.useState(function()
		return readFromUnsubcribedMutableSource(aH, aE, aF)
	end)
	local aN = aL

	
	

	
	local aO = an

	local aP: MutableSourceMemoizedState<any, any> = aD.memoizedState
	if aP.refs == nil then
		error(tostring(debug.traceback()))
	end
	local aQ = aP.refs
	local aR = aQ.getSnapshot
	local aS = aP.source
	local aT = aP.subscribe

	local aU = al

	aD.memoizedState = {
		refs = aQ,
		source = aE,
		subscribe = aG,
	}

	
	aK.useEffect(function()
		aQ.getSnapshot = aF

		
		
		
		
		aQ.setSnapshot = aM

		
		local aV = aI(aE._source)
		if not is(aJ, aV) then
			local aW = aF(aE._source)
			if a then
				
				if type(aW :: any) == "function" then
					h.error(
[[Mutable source should not return a function as the snapshot value. Functions may close over mutable values and cause tearing.]]					

)
				end
			end

			if not is(aN, aW) then
				aM(aW)

				local aX = Q(aU)
				z(aH, aX)
			end
			
			
			
			y(aH, aH.mutableReadLanes)
		end
		
	end, { aF, aE, aG } :: Array<any>)

	
	aK.useEffect(function()
		local aV = function()
			local aV = aQ.getSnapshot
			local aW = aQ.setSnapshot

			
			local aX, aY = pcall(function()
				aW(aV(aE._source))

				
				local aX = Q(aU)

				z(aH, aX)
			end)

			if not aX then
				
				
				
				
				aW(function()
					error(aY)
				end)
			end
		end

		local aW = aG(aE._source, aV)
		if a then
			if type(aW) ~= "function" then
				h.error(
					"Mutable source subscribe function must return an unsubscribe function."
				)
			end
		end

		return aW
		
	end, { aE, aG } :: Array<any>)

	
	
	
	
	
	
	
	
	
	
	
	if
		not is(aR, aF)
		or not is(aS, aE)
		or not is(aT, aG)
	then
		
		
		
		
		local aV = {
			pending = nil,
			dispatch = nil,
			lastRenderedReducer = basicStateReducer,
			lastRenderedState = aN,
		}

		
		local aW = al

		aM = function(...)
			dispatchAction(aW, aV, ...)
		end :: any
		aV.dispatch = aM :: any
		aO.queue = aV
		aO.baseQueue = nil
		aN = readFromUnsubcribedMutableSource(aH, aE, aF)
		aO.baseState = aN
		aO.memoizedState = aO.baseState
	end

	return aN
end

function mountMutableSource<Source, Snapshot>(
	aD: MutableSource<Source>,
	aE: MutableSourceGetSnapshotFn<
		Source,
		Snapshot
	>,
	aF: MutableSourceSubscribeFn<
		Source,
		Snapshot
	>
): Snapshot
	local aG = mountWorkInProgressHook()
	aG.memoizedState = {
		refs = {
			getSnapshot = aE,
			setSnapshot = nil,
		},
		source = aD,
		subscribe = aF,
	}
	return useMutableSource(aG, aD, aE, aF)
end

function updateMutableSource<Source, Snapshot>(
	aD: MutableSource<Source>,
	aE: MutableSourceGetSnapshotFn<
		Source,
		Snapshot
	>,
	aF: MutableSourceSubscribeFn<
		Source,
		Snapshot
	>
): Snapshot
	local aG = updateWorkInProgressHook()
	return useMutableSource(aG, aD, aE, aF)
end

function mountState<S>(aD: (() -> S) | S): (S, Dispatch<BasicStateAction<S>>)
	local aE = mountWorkInProgressHook()
	if type(aD) == "function" then
		
		
		local aF: () -> S = aD
		aD = aF()
	end
	aE.baseState = aD
	aE.memoizedState = aE.baseState
	local aF: UpdateQueue<S, BasicStateAction<S>> = {
		pending = nil,
		dispatch = nil,
		lastRenderedReducer = nil, 
		lastRenderedState = aD :: any,
	}
	
	aF.lastRenderedReducer = basicStateReducer
	aE.queue = aF

	
	local aG = al
	local aH: Dispatch<BasicStateAction<S>> = function(aH, ...)
		
		dispatchAction(aG, aF :: UpdateQueue<any, any>, aH, ...)
	end :: any
	aF.dispatch = aH
	
	return aE.memoizedState, aH
end

function updateState<S>(aD: (() -> S) | S): (S, Dispatch<BasicStateAction<S>>)
	return updateReducer(basicStateReducer, aD)
end

function rerenderState<S>(aD: (() -> S) | S): (S, Dispatch<BasicStateAction<S>>)
	return rerenderReducer(basicStateReducer, aD)
end

local function pushEffect(aD, aE, aF, aG)
	local aH: Effect = {
		tag = aD,
		create = aE,
		destroy = aF,
		deps = aG,
		
		next = nil :: any,
	}
	local aI: FunctionComponentUpdateQueue =
		al.updateQueue :: any
	if aI == nil then
		
		
		aI = {
			lastEffect = nil,
		}
		al.updateQueue = aI
		aH.next = aH
		aI.lastEffect = aH
	else
		local aJ = aI.lastEffect
		if aJ == nil then
			aI.lastEffect = aH
			aH.next = aH
		else
			local aK = aJ.next
			aJ.next = aH
			aH.next = aK
			aI.lastEffect = aH
		end
	end
	return aH
end


function mountBinding<T>(aD: T): (ReactBinding<T>, ReactBindingUpdater<T>)
	local aE = mountWorkInProgressHook()
	local aF, aG = g(aD)

	
	aE.memoizedState = { aF :: any, aG :: any }
	return aF, aG
end

function updateBinding<T>(aD: T): (ReactBinding<T>, ReactBindingUpdater<T>)
	local aE = updateWorkInProgressHook()
	return unpack(aE.memoizedState)
end

function mountRef<T>(aD: T): { current: T }
	local aE = mountWorkInProgressHook()
	
	local aF: any = f()
	aF.current = aD
	
	
	
	aE.memoizedState = aF
	return aF
end

function updateRef<T>(aD: T): { current: T }
	local aE = updateWorkInProgressHook()
	return aE.memoizedState
end

local function mountEffectImpl(aD, aE, aF, aG): ()
	local aH = mountWorkInProgressHook()
	
	
	local aI = aG
	al.flags = bit32.bor(al.flags, aD)

	aH.memoizedState =
		pushEffect(bit32.bor(I, aE), aF, nil, aI)
end


function updateEffectImpl(aD, aE, aF, aG: Array<any>?): ()
	
	local aH = updateWorkInProgressHook()
	
	
	local aI = aG
	local aJ

	if am ~= nil then
		local aK = am.memoizedState
		aJ = aK.destroy
		if aI ~= nil then
			local aL = aK.deps
			if areHookInputsEqual(aI, aL) then
				aH.memoizedState = pushEffect(aE, aF, aJ, aI)
				return
			end
		end
	end

	al.flags = bit32.bor(al.flags, aD)

	aH.memoizedState =
		pushEffect(bit32.bor(I, aE), aF, aJ, aI)
end

local function mountEffect(
	
	aD: (() -> ()) | (() -> (() -> ())),
	aE: Array<any>?
): ()
	if a then
		
		
		if type(_G.jest) ~= "nil" or _G.__TESTEZ_RUNNING_TEST__ then
			T(al)
		end
	end

	if a and r then
		mountEffectImpl(
			bit32.bor(H, E, F),
			K,
			aD,
			aE
		)
	else
		mountEffectImpl(
			bit32.bor(E, F),
			K,
			aD,
			aE
		)
	end
end

local function updateEffect(
	
	aD: (() -> ()) | (() -> (() -> ())),
	aE: Array<any>?
): ()
	if a then
		
		
		if type(_G.jest) ~= "nil" or _G.__TESTEZ_RUNNING_TEST__ then
			T(al)
		end
	end
	updateEffectImpl(E, K, aD, aE)
end

local function mountLayoutEffect(
	
	aD: (() -> ()) | (() -> (() -> ())),
	aE: Array<any>?
): ()
	if a and r then
		mountEffectImpl(
			bit32.bor(G, D),
			J,
			aD,
			aE
		)
	else
		mountEffectImpl(D, J, aD, aE)
	end
end

local function updateLayoutEffect(
	
	aD: (() -> ()) | (() -> (() -> ())),
	aE: Array<any>?
): ()
	updateEffectImpl(D, J, aD, aE)
end

function imperativeHandleEffect<T>(
	aD: () -> T,
	aE: { current: T | nil } | ((inst: T | nil) -> ...any) | nil
	
): nil | (() -> ...any
)	if aE ~= nil and type(aE) == "function" then
		local aF = aE
		local aG = aD()
		aF(aG)
		return function()
			return aF(nil)
		end
	elseif aE ~= nil then
		local aF = aE :: any
		
		if a then
			
			
			
			
			local aG = getmetatable(aF) ~= nil
				and #e.keys(aF) == 0
			if not aG then
				h.error(
[[Expected useImperativeHandle() first argument to either be a ref callback or React.createRef() object. Instead received: %s.]]
,
					"an object with keys {"
						.. c.join(e.keys(aF), ", ")
						.. "}"
				)
			end
		end
		local aG = aD()
		aF.current = aG
		return function()
			aF.current = nil
		end
	
	else
		return nil
	end
end

function mountImperativeHandle<T>(
	aD: { current: T | nil } | ((inst: T | nil) -> ...any) | nil,
	aE: () -> T,
	aF: Array<any> | nil
): ()
	if a then
		if type(aE) ~= "function" then
			h.error(
[[Expected useImperativeHandle() second argument to be a function that creates a handle. Instead received: %s.]]
,
				
				if aE ~= nil then type(aE) else "nil"
				
			)
		end
	end
	
	local aG = if aF ~= nil then c.concat(aF, { aD }) else nil

	if a and r then
		return mountEffectImpl(
			bit32.bor(G, D),
			J,
			function()
				return imperativeHandleEffect(aE, aD)
			end,
			aG
		)
	else
		return mountEffectImpl(D, J, function()
			return imperativeHandleEffect(aE, aD)
		end, aG)
	end
end

function updateImperativeHandle<T>(
	aD: { current: T | nil } | ((inst: T | nil) -> ...any) | nil,
	aE: () -> T,
	aF: Array<any> | nil
): ()
	if a then
		if type(aE) ~= "function" then
			local aG = "nil"
			if aE then
				aG = type(aE)
			end
			h.error(
[[Expected useImperativeHandle() second argument to be a function that creates a handle. Instead received: %s.]]
,
				aG
			)
		end
	end

	
	
	local aG
	if aF ~= nil then
		aG = table.clone(aF)
		table.insert(aG, aD)
	end

	return updateEffectImpl(D, J, function()
		return imperativeHandleEffect(aE, aD)
	end, aG)
end

function mountDebugValue<T>(aD: T, aE: nil | ((T) -> any)): ()
	
	
	
end

local aD = mountDebugValue

function mountCallback<T>(aE: T, aF: Array<any> | nil): T
	local aG = mountWorkInProgressHook()
	local aH = aF
	
	aG.memoizedState = { aE :: any, aH :: any }
	return aE
end

function updateCallback<T>(aE: T, aF: Array<any> | nil): T
	local aG = updateWorkInProgressHook()
	local aH = aF
	local aI = aG.memoizedState
	if aI ~= nil then
		if aH ~= nil then
			
			local aJ: Array<any> = aI[2]
			if areHookInputsEqual(aH, aJ) then
				return aI[1]
			end
		end
	end
	
	aG.memoizedState = { aE :: any, aH :: any }
	return aE
end


function mountMemo<T...>(aE: () -> T..., aF: Array<any> | nil): ...any
	local aG = mountWorkInProgressHook()

	
	local aH = aF
	
	local aI = { aE() }
	aG.memoizedState = { aI :: any, aH }
	return unpack(aI)
end


function updateMemo<T...>(aE: () -> T..., aF: Array<any> | nil): ...any
	local aG = updateWorkInProgressHook()
	
	local aH = aF
	local aI = aG.memoizedState
	if aI ~= nil then
		
		if aH ~= nil then
			local aJ: Array<any> = aI[2]
			if areHookInputsEqual(aH, aJ) then
				return unpack(aI[1])
			end
		end
	end
	
	local aJ = { aE() }
	aG.memoizedState = { aJ :: any, aH }
	return unpack(aJ)
end


































































































































local aE = false
aj.getIsUpdatingOpaqueValueInRenderPhaseInDEV = function(): boolean?
	if a then
		return aE
	end
	return nil
end
















function mountOpaqueIdentifier()
	local aF
	if a then
		h.warn("!!! unimplemented: warnOnOpaqueIdentifierAccessInDEV")
	
	
	
	
	else
		aF = Z
	end

	if X() then
		unimplemented("ReactFiberHooks: getIsHydrating() true")
		return nil
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	else
		local aG = aF()
		mountState(aG)
		return aG
	end
end

function updateOpaqueIdentifier(): OpaqueIDType
	local aF, aG = updateState(nil)
	return aF
end

function rerenderOpaqueIdentifier(): OpaqueIDType
	local aF, aG = rerenderState(nil)
	return aF
end

function dispatchAction<S, A>(aF: Fiber, aG: UpdateQueue<S, A>, aH: A, ...): ()
	if a then
		local aI = select("#", ...)
		local aJ
		if aI == 1 then
			aJ = select(1, ...)
		end
		if type(aJ) == "function" then
			h.error(
[[State updates from the useState() and useReducer() Hooks don't support the second callback argument. To execute a side effect after rendering, declare it in the component body with useEffect().]]			


)
		end
	end

	local aI = P()
	local aJ = Q(aF)

	local aK: Update<S, A> = {
		lane = aJ,
		action = aH,
		eagerReducer = nil,
		eagerState = nil,
		next = nil :: any,
	}

	
	local aL = aG.pending
	if aL == nil then
		
		aK.next = aK
	else
		aK.next = aL.next
		aL.next = aK
	end
	aG.pending = aK

	local aM = aF.alternate
	if
		aF == al
		or (aM ~= nil and aM == al)
	then
		
		
		
		ao = true
		ap = true
	else
		if
			aF.lanes == u and (aM == nil or aM.lanes == u)
		then
			
			
			
			local aN = aG.lastRenderedReducer
			if aN ~= nil then
				local aO
				if a then
					aO = ag.current
					ag.current =
						aA
				end
				
				local aP: S = aG.lastRenderedState :: any
				
				local aQ, aR = pcall(aN, aP, aH)
				
				
				
				
				if aQ then
					aK.eagerReducer = aN
					aK.eagerState = aR
				end

				
				if a then
					ag.current = aO
				end

				if is(aR, aP) then
					
					
					
					
					return
				end
				
				if not aQ then
					
				end
			end
		end
		if a then
			
			
			if type(_G.jest) ~= "nil" or _G.__TESTEZ_RUNNING_TEST__ then
				O(aF)
				M(aF)
			end
		end
		N(aF, aJ, aI)
	end

	if a then
		if o then
			if bit32.band(aF.mode, s) ~= 0 then
				local aN = V(aF.type) or "Unknown"
				ae(aN, aJ, aH)
			end
		end
	end

	if p then
		af(aF, aJ)
	end

	return
end


local aF: Dispatcher = {
	readContext = B,

	useCallback = throwInvalidHookError :: any,
	useContext = throwInvalidHookError :: any,
	useEffect = throwInvalidHookError :: any,
	useImperativeHandle = throwInvalidHookError :: any,
	useLayoutEffect = throwInvalidHookError :: any,
	useMemo = throwInvalidHookError :: any,
	useReducer = throwInvalidHookError :: any,
	useRef = throwInvalidHookError :: any,
	useBinding = throwInvalidHookError :: any,
	useState = throwInvalidHookError :: any,
	useDebugValue = throwInvalidHookError :: any,
	
	
	useMutableSource = throwInvalidHookError :: any,
	useOpaqueIdentifier = throwInvalidHookError :: any,

	unstable_isNewReconciler = q,
}
aj.ContextOnlyDispatcher = aF

local aG: Dispatcher = {
	readContext = B,

	useCallback = mountCallback,
	useContext = B,
	useEffect = mountEffect,
	useImperativeHandle = mountImperativeHandle,
	useLayoutEffect = mountLayoutEffect,
	
	useMemo = mountMemo :: any,
	useReducer = mountReducer,
	useRef = mountRef,
	useBinding = mountBinding,
	useState = mountState,
	useDebugValue = mountDebugValue,
	
	
	useMutableSource = mountMutableSource,
	useOpaqueIdentifier = mountOpaqueIdentifier,

	unstable_isNewReconciler = q,
}

local aH: Dispatcher = {
	readContext = B,

	useCallback = updateCallback,
	useContext = B,
	useEffect = updateEffect,
	useImperativeHandle = updateImperativeHandle,
	useLayoutEffect = updateLayoutEffect,
	
	useMemo = updateMemo :: any,
	useReducer = updateReducer,
	useRef = updateRef,
	useBinding = updateBinding,
	useState = updateState,
	useDebugValue = aD,
	
	
	useMutableSource = updateMutableSource,
	useOpaqueIdentifier = updateOpaqueIdentifier,

	unstable_isNewReconciler = q,
}

local aI: Dispatcher = {
	readContext = B,

	useCallback = updateCallback,
	useContext = B,
	useEffect = updateEffect,
	useImperativeHandle = updateImperativeHandle,
	useLayoutEffect = updateLayoutEffect,
	
	useMemo = updateMemo :: any,
	useReducer = rerenderReducer,
	useRef = updateRef,
	useBinding = updateBinding,
	useState = rerenderState,
	useDebugValue = aD,
	
	
	useMutableSource = updateMutableSource,
	useOpaqueIdentifier = rerenderOpaqueIdentifier,

	unstable_isNewReconciler = q,
}

if a then
	local aJ = function()
		h.error(
[[Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().]]		



)
	end

	local aK = function()
		h.error(
[[Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks]]		



)
	end

	av = {
		readContext = function<T>(aL: ReactContext<T>, aM: number | boolean | nil): T
			return B(aL, aM)
		end,
		useCallback = function<T>(aL: T, aM: Array<any> | nil): T
			ar = "useCallback"
			mountHookTypesDev()
			checkDepsAreArrayDev(aM)
			return mountCallback(aL, aM)
		end,
		useContext = function<T>(aL: ReactContext<T>, aM: nil | number | boolean): T
			ar = "useContext"
			mountHookTypesDev()
			return B(aL, aM)
		end,
		useEffect = function(
			
			aL: (() -> ()) | (() -> (() -> ())),
			aM: Array<any>?
		): ()
			ar = "useEffect"
			mountHookTypesDev()
			checkDepsAreArrayDev(aM)
			return mountEffect(aL, aM)
		end,
		useImperativeHandle = function<T>(
			aL: { current: T | nil } | ((inst: T | nil) -> ...any) | nil,
			aM: () -> T,
			aN: Array<any> | nil
		): ()
			ar = "useImperativeHandle"
			mountHookTypesDev()
			checkDepsAreArrayDev(aN)
			return mountImperativeHandle(aL, aM, aN)
		end,
		useLayoutEffect = function(
			
			aL: (() -> ()) | (() -> (() -> ())),
			aM: Array<any>?
		): ()
			ar = "useLayoutEffect"
			mountHookTypesDev()
			checkDepsAreArrayDev(aM)
			return mountLayoutEffect(aL, aM)
		end,
		
		useMemo = function<T...>(aL: () -> T..., aM: Array<any> | nil): ...any
			ar = "useMemo"
			mountHookTypesDev()
			checkDepsAreArrayDev(aM)
			local aN = ag.current
			ag.current = az
			
			


local aO = { pcall(mountMemo, aL, aM) }
			ag.current = aN
			if not aO[1] then
				error(aO[2])
			end
			
			return unpack(aO, 2)
		end :: any,
		useReducer = function<S, I, A>(
			aL: (S, A) -> S,
			aM: I,
			aN: ((I) -> S)?
		): (S, Dispatch<A>)
			ar = "useReducer"
			mountHookTypesDev()
			local aO = ag.current
			ag.current = az
			local aP, aQ, aR = pcall(mountReducer, aL, aM, aN)
			
			ag.current = aO
			if not aP then
				error(aQ)
			end
			
			return aQ, aR
		end,
		useRef = function<T>(aL: T): { current: T }
			ar = "useRef"
			mountHookTypesDev()
			return mountRef(aL)
		end,
		
		useBinding = function<T>(aL: T): (ReactBinding<T>, ReactBindingUpdater<T>)
			ar = "useBinding"
			mountHookTypesDev()
			return mountBinding(aL)
		end,
		useState = function<S>(aL: (() -> S) | S): (S, Dispatch<BasicStateAction<S>>)
			ar = "useState"
			mountHookTypesDev()
			local aM = ag.current
			ag.current = az
			
			local aN, aO, aP = pcall(mountState, aL)
			ag.current = aM
			if not aN then
				error(aO)
			end
			
			return aO, aP
		end,
		useDebugValue = function<T>(aL: T, aM: ((value: T) -> any)?): ()
			ar = "useDebugValue"
			mountHookTypesDev()
			return mountDebugValue(aL, aM)
		end,
		
		
		
		
		
		
		
		
		
		
		useMutableSource = function<Source, Snapshot>(
			aL: MutableSource<Source>,
			aM: MutableSourceGetSnapshotFn<
				Source,
				Snapshot
			>,
			aN: MutableSourceSubscribeFn<
				Source,
				Snapshot
			>
		): Snapshot
			ar = "useMutableSource"
			mountHookTypesDev()
			return mountMutableSource(aL, aM, aN)
		end,
		useOpaqueIdentifier = function()
			ar = "useOpaqueIdentifier"
			mountHookTypesDev()
			return mountOpaqueIdentifier()
		end,

		unstable_isNewReconciler = q,
	}

	aw = {
		readContext = function<T>(aL: ReactContext<T>, aM: number | boolean | nil): T
			return B(aL, aM)
		end,
		useCallback = function<T>(aL: T, aM: Array<any> | nil): T
			ar = "useCallback"
			updateHookTypesDev()
			checkDepsAreArrayDev(aM)
			return mountCallback(aL, aM)
		end,
		useContext = function<T>(aL: ReactContext<T>, aM: nil | number | boolean): T
			ar = "useContext"
			updateHookTypesDev()
			return B(aL, aM)
		end,
		useEffect = function(
			
			aL: (() -> ()) | (() -> (() -> ())),
			aM: Array<any>?
		): ()
			ar = "useEffect"
			updateHookTypesDev()
			return mountEffect(aL, aM)
		end,
		useImperativeHandle = function<T>(
			aL: { current: T | nil } | ((inst: T | nil) -> ...any) | nil,
			aM: () -> T,
			aN: Array<any> | nil
		): ()
			ar = "useImperativeHandle"
			updateHookTypesDev()
			return mountImperativeHandle(aL, aM, aN)
		end,
		useLayoutEffect = function(
			
			aL: (() -> ()) | (() -> (() -> ())),
			aM: Array<any>?
		): ()
			ar = "useLayoutEffect"
			updateHookTypesDev()
			return mountLayoutEffect(aL, aM)
		end,
		
		useMemo = function<T...>(aL: () -> T..., aM: Array<any> | nil): ...any
			ar = "useMemo"
			updateHookTypesDev()
			local aN = ag.current
			ag.current = az
			
			


local aO = { pcall(mountMemo, aL, aM) }
			ag.current = aN
			if not aO[1] then
				error(aO[2])
			end
			return unpack(aO, 2)
		end :: any,
		useReducer = function<S, I, A>(
			aL: (S, A) -> S,
			aM: I,
			aN: ((I) -> S)?
		): (S, Dispatch<A>)
			ar = "useReducer"
			updateHookTypesDev()
			local aO = ag.current
			ag.current = az
			local aP, aQ, aR = pcall(mountReducer, aL, aM, aN)
			
			ag.current = aO
			if not aP then
				error(aQ)
			end
			
			return aQ, aR
		end,
		useRef = function<T>(aL: T): { current: T }
			ar = "useRef"
			updateHookTypesDev()
			return mountRef(aL)
		end,
		
		useBinding = function<T>(aL: T): (ReactBinding<T>, ReactBindingUpdater<T>)
			ar = "useBinding"
			updateHookTypesDev()
			return mountBinding(aL)
		end,
		useState = function<S>(aL: (() -> S) | S): (S, Dispatch<BasicStateAction<S>>)
			ar = "useState"
			updateHookTypesDev()
			local aM = ag.current
			ag.current = az
			
			local aN, aO, aP = pcall(mountState, aL)
			ag.current = aM
			if not aN then
				error(aO)
			end
			
			return aO, aP
		end,
		useDebugValue = function<T>(aL: T, aM: ((value: T) -> any)?): ()
			ar = "useDebugValue"
			updateHookTypesDev()
			return mountDebugValue(aL, aM)
		end,
		
		
		
		
		
		
		
		
		
		
		useMutableSource = function<Source, Snapshot>(
			aL: MutableSource<Source>,
			aM: MutableSourceGetSnapshotFn<
				Source,
				Snapshot
			>,
			aN: MutableSourceSubscribeFn<
				Source,
				Snapshot
			>
		): Snapshot
			ar = "useMutableSource"
			updateHookTypesDev()
			return mountMutableSource(aL, aM, aN)
		end,
		useOpaqueIdentifier = function()
			ar = "useOpaqueIdentifier"
			updateHookTypesDev()
			return mountOpaqueIdentifier()
		end,

		unstable_isNewReconciler = q,
	}

	ax = {
		readContext = function<T>(aL: ReactContext<T>, aM: number | boolean | nil): T
			return B(aL, aM)
		end,
		useCallback = function<T>(aL: T, aM: Array<any> | nil): T
			ar = "useCallback"
			updateHookTypesDev()
			return updateCallback(aL, aM)
		end,
		useContext = function<T>(aL: ReactContext<T>, aM: nil | number | boolean): T
			ar = "useContext"
			updateHookTypesDev()
			return B(aL, aM)
		end,
		useEffect = function(
			
			aL: (() -> ()) | (() -> (() -> ())),
			aM: Array<any>?
		): ()
			ar = "useEffect"
			updateHookTypesDev()
			return updateEffect(aL, aM)
		end,
		useImperativeHandle = function<T>(
			aL: { current: T | nil } | ((inst: T | nil) -> ...any) | nil,
			aM: () -> T,
			aN: Array<any> | nil
		): ()
			ar = "useImperativeHandle"
			updateHookTypesDev()
			return updateImperativeHandle(aL, aM, aN)
		end,
		useLayoutEffect = function(
			
			aL: (() -> ()) | (() -> (() -> ())),
			aM: Array<any>?
		): ()
			ar = "useLayoutEffect"
			updateHookTypesDev()
			return updateLayoutEffect(aL, aM)
		end,
		
		useMemo = function<T...>(aL: () -> T..., aM: Array<any> | nil): ...any
			ar = "useMemo"
			updateHookTypesDev()
			local aN = ag.current
			ag.current = aA
			
			


local aO = { pcall(updateMemo, aL, aM) }
			ag.current = aN
			if not aO[1] then
				error(aO[2])
			end
			return unpack(aO, 2)
		end :: any,
		useReducer = function<S, I, A>(
			aL: (S, A) -> S,
			aM: I,
			aN: ((I) -> S)?
		): (S, Dispatch<A>)
			ar = "useReducer"
			updateHookTypesDev()
			local aO = ag.current
			ag.current = aA
			local aP, aQ, aR = pcall(updateReducer, aL, aM, aN)
			
			ag.current = aO
			if not aP then
				error(aQ)
			end
			
			return aQ, aR
		end,
		useRef = function<T>(aL: T): { current: T }
			ar = "useRef"
			updateHookTypesDev()
			return updateRef(aL)
		end,
		
		useBinding = function<T>(aL: T): (ReactBinding<T>, ReactBindingUpdater<T>)
			ar = "useBinding"
			updateHookTypesDev()
			return updateBinding(aL)
		end,
		useState = function<S>(aL: (() -> S) | S): (S, Dispatch<BasicStateAction<S>>)
			ar = "useState"
			updateHookTypesDev()
			local aM = ag.current
			ag.current = aA
			
			local aN, aO, aP = pcall(updateState, aL)
			ag.current = aM
			if not aN then
				error(aO)
			end
			
			return aO, aP
		end,
		useDebugValue = function<T>(aL: T, aM: ((value: T) -> any)?): ()
			ar = "useDebugValue"
			updateHookTypesDev()
			return aD(aL, aM)
		end,
		
		
		
		
		
		
		
		
		
		
		useMutableSource = function<Source, Snapshot>(
			aL: MutableSource<Source>,
			aM: MutableSourceGetSnapshotFn<
				Source,
				Snapshot
			>,
			aN: MutableSourceSubscribeFn<
				Source,
				Snapshot
			>
		): Snapshot
			ar = "useMutableSource"
			updateHookTypesDev()
			return updateMutableSource(aL, aM, aN)
		end,
		useOpaqueIdentifier = function(): OpaqueIDType
			ar = "useOpaqueIdentifier"
			updateHookTypesDev()
			return updateOpaqueIdentifier()
		end,

		unstable_isNewReconciler = q,
	}

	ay = {
		readContext = function<T>(aL: ReactContext<T>, aM: number | boolean | nil): T
			return B(aL, aM)
		end,
		useCallback = function<T>(aL: T, aM: Array<any> | nil): T
			ar = "useCallback"
			updateHookTypesDev()
			return mountCallback(aL, aM)
		end,
		useContext = function<T>(aL: ReactContext<T>, aM: nil | number | boolean): T
			ar = "useContext"
			updateHookTypesDev()
			return B(aL, aM)
		end,
		useEffect = function(
			
			aL: (() -> ()) | (() -> (() -> ())),
			aM: Array<any> | nil
		): ()
			ar = "useEffect"
			updateHookTypesDev()
			return updateEffect(aL, aM)
		end,
		useImperativeHandle = function<T>(
			aL: { current: T | nil } | ((inst: T | nil) -> ...any) | nil,
			aM: () -> T,
			aN: Array<any> | nil
		): ()
			ar = "useImperativeHandle"
			updateHookTypesDev()
			return updateImperativeHandle(aL, aM, aN)
		end,
		useLayoutEffect = function(
			
			aL: (() -> ()) | (() -> (() -> ())),
			aM: Array<any>?
		): ()
			ar = "useLayoutEffect"
			updateHookTypesDev()
			return updateLayoutEffect(aL, aM)
		end,
		
		useMemo = function<T...>(aL: () -> T..., aM: Array<any> | nil): ...any
			ar = "useMemo"
			updateHookTypesDev()
			local aN = ag.current
			ag.current = aB
			
			


local aO = { pcall(updateMemo, aL, aM) }
			ag.current = aN
			if not aO[1] then
				error(aO[2])
			end
			return unpack(aO, 2)
		end :: any,
		useReducer = function<S, I, A>(
			aL: (S, A) -> S,
			aM: I,
			aN: ((I) -> S)?
		): (S, Dispatch<A>)
			ar = "useReducer"
			updateHookTypesDev()
			local aO = ag.current
			ag.current = aB
			local aP, aQ, aR =
				pcall(rerenderReducer, aL, aM, aN)
			
			ag.current = aO
			if not aP then
				error(aQ)
			end
			
			return aQ, aR
		end,
		useRef = function<T>(aL: T): { current: T }
			ar = "useRef"
			updateHookTypesDev()
			return updateRef(aL)
		end,
		
		useBinding = function<T>(aL: T): (ReactBinding<T>, ReactBindingUpdater<T>)
			ar = "useBinding"
			updateHookTypesDev()
			return updateBinding(aL)
		end,
		useState = function<S>(aL: (() -> S) | S): (S, Dispatch<BasicStateAction<S>>)
			ar = "useState"
			updateHookTypesDev()
			local aM = ag.current
			ag.current = aB
			
			local aN, aO, aP = pcall(rerenderState, aL)
			ag.current = aM
			if not aN then
				error(aO)
			end
			
			return aO, aP
		end,
		useDebugValue = function<T>(aL: T, aM: ((value: T) -> any)?): ()
			ar = "useDebugValue"
			updateHookTypesDev()
			return aD(aL, aM)
		end,
		
		
		
		
		
		
		
		
		
		
		useMutableSource = function<Source, Snapshot>(
			aL: MutableSource<Source>,
			aM: MutableSourceGetSnapshotFn<
				Source,
				Snapshot
			>,
			aN: MutableSourceSubscribeFn<
				Source,
				Snapshot
			>
		): Snapshot
			ar = "useMutableSource"
			updateHookTypesDev()
			return updateMutableSource(aL, aM, aN)
		end,
		useOpaqueIdentifier = function(): OpaqueIDType
			ar = "useOpaqueIdentifier"
			updateHookTypesDev()
			return rerenderOpaqueIdentifier()
		end,

		unstable_isNewReconciler = q,
	}

	az = {
		readContext = function<T>(aL: ReactContext<T>, aM: number | boolean | nil): T
			aJ()
			return B(aL, aM)
		end,
		useCallback = function<T>(aL: T, aM: Array<any> | nil): T
			ar = "useCallback"
			aK()
			mountHookTypesDev()
			return mountCallback(aL, aM)
		end,
		useContext = function<T>(aL: ReactContext<T>, aM: nil | number | boolean): T
			ar = "useContext"
			aK()
			mountHookTypesDev()
			return B(aL, aM)
		end,
		useEffect = function(
			
			aL: (() -> ()) | (() -> (() -> ())),
			aM: Array<any> | nil
		): ()
			ar = "useEffect"
			aK()
			mountHookTypesDev()
			return mountEffect(aL, aM)
		end,
		useImperativeHandle = function<T>(
			aL: { current: T | nil } | ((inst: T | nil) -> ...any) | nil,
			aM: () -> T,
			aN: Array<any> | nil
		): ()
			ar = "useImperativeHandle"
			aK()
			mountHookTypesDev()
			return mountImperativeHandle(aL, aM, aN)
		end,
		useLayoutEffect = function(
			
			aL: (() -> ()) | (() -> (() -> ())),
			aM: Array<any> | nil
		): ()
			ar = "useLayoutEffect"
			aK()
			mountHookTypesDev()
			return mountLayoutEffect(aL, aM)
		end,
		
		useMemo = function<T...>(aL: () -> T..., aM: Array<any> | nil): ...any
			ar = "useMemo"
			aK()
			mountHookTypesDev()
			local aN = ag.current
			ag.current = az
			
			


local aO = { pcall(mountMemo, aL, aM) }
			ag.current = aN
			if not aO[1] then
				error(aO[2])
			end
			return unpack(aO, 2)
		end :: any,
		useReducer = function<S, I, A>(
			aL: (S, A) -> S,
			aM: I,
			aN: ((I) -> S)?
		): (S, Dispatch<A>)
			ar = "useReducer"
			aK()
			mountHookTypesDev()
			local aO = ag.current
			ag.current = az
			local aP, aQ, aR = pcall(mountReducer, aL, aM, aN)
			
			ag.current = aO
			if not aP then
				error(aQ)
			end
			
			return aQ, aR
		end,
		useRef = function<T>(aL: T): { current: T }
			ar = "useRef"
			aK()
			mountHookTypesDev()
			return mountRef(aL)
		end,
		
		useBinding = function<T>(aL: T): (ReactBinding<T>, ReactBindingUpdater<T>)
			ar = "useBinding"
			aK()
			mountHookTypesDev()
			return mountBinding(aL)
		end,
		useState = function<S>(aL: (() -> S) | S): (S, Dispatch<BasicStateAction<S>>)
			ar = "useState"
			aK()
			mountHookTypesDev()
			local aM = ag.current
			ag.current = az
			
			local aN, aO, aP = pcall(mountState, aL)
			ag.current = aM
			if not aN then
				error(aO)
			end
			
			return aO, aP
		end,
		useDebugValue = function<T>(aL: T, aM: ((value: T) -> any)?): ()
			ar = "useDebugValue"
			aK()
			mountHookTypesDev()
			return mountDebugValue(aL, aM)
		end,
		
		
		
		
		
		
		
		
		
		
		
		
		useMutableSource = function<Source, Snapshot>(
			aL: MutableSource<Source>,
			aM: MutableSourceGetSnapshotFn<
				Source,
				Snapshot
			>,
			aN: MutableSourceSubscribeFn<
				Source,
				Snapshot
			>
		): Snapshot
			ar = "useMutableSource"
			aK()
			mountHookTypesDev()
			return mountMutableSource(aL, aM, aN)
		end,
		useOpaqueIdentifier = function(): OpaqueIDType
			ar = "useOpaqueIdentifier"
			aK()
			mountHookTypesDev()
			return mountOpaqueIdentifier()
		end,

		unstable_isNewReconciler = q,
	}

	aA = {
		readContext = function<T>(aL: ReactContext<T>, aM: number | boolean | nil): T
			aJ()
			return B(aL, aM)
		end,
		useCallback = function<T>(aL: T, aM: Array<any> | nil): T
			ar = "useCallback"
			aK()
			updateHookTypesDev()
			return mountCallback(aL, aM)
		end,
		useContext = function<T>(aL: ReactContext<T>, aM: nil | number | boolean): T
			ar = "useContext"
			aK()
			updateHookTypesDev()
			return B(aL, aM)
		end,
		useEffect = function(
			
			aL: (() -> ()) | (() -> (() -> ())),
			aM: Array<any> | nil
		): ()
			ar = "useEffect"
			aK()
			updateHookTypesDev()
			return updateEffect(aL, aM)
		end,
		useImperativeHandle = function<T>(
			aL: { current: T | nil } | ((inst: T | nil) -> ...any) | nil,
			aM: () -> T,
			aN: Array<any> | nil
		): ()
			ar = "useImperativeHandle"
			aK()
			updateHookTypesDev()
			return updateImperativeHandle(aL, aM, aN)
		end,
		useLayoutEffect = function(
			
			aL: (() -> ()) | (() -> (() -> ())),
			aM: Array<any>?
		): ()
			ar = "useLayoutEffect"
			aK()
			updateHookTypesDev()
			return updateLayoutEffect(aL, aM)
		end,
		
		useMemo = function<T...>(aL: () -> T..., aM: Array<any> | nil): ...any
			ar = "useMemo"
			aK()
			updateHookTypesDev()
			local aN = ag.current
			ag.current = aA
			
			


local aO = { pcall(updateMemo, aL, aM) }
			ag.current = aN
			if not aO[1] then
				error(aO[2])
			end
			return unpack(aO, 2)
		end :: any,
		useReducer = function<S, I, A>(
			aL: (S, A) -> S,
			aM: I,
			aN: ((I) -> S)?
		): (S, Dispatch<A>)
			ar = "useReducer"
			aK()
			updateHookTypesDev()
			local aO = ag.current
			ag.current = aA
			local aP, aQ, aR = pcall(updateReducer, aL, aM, aN)
			
			ag.current = aO

			if not aP then
				error(aQ)
			end
			
			return aQ, aR
		end,
		useRef = function<T>(aL: T): { current: T }
			ar = "useRef"
			aK()
			updateHookTypesDev()
			return updateRef(aL)
		end,
		
		useBinding = function<T>(aL: T): (ReactBinding<T>, ReactBindingUpdater<T>)
			ar = "useBinding"
			aK()
			updateHookTypesDev()
			return updateBinding(aL)
		end,
		useState = function<S>(aL: (() -> S) | S): (S, Dispatch<BasicStateAction<S>>)
			ar = "useState"
			aK()
			updateHookTypesDev()
			local aM = ag.current
			ag.current = aA
			
			local aN, aO, aP = pcall(updateState, aL)
			ag.current = aM
			if not aN then
				error(aO)
			end
			
			return aO, aP
		end,
		useDebugValue = function<T>(aL: T, aM: ((value: T) -> any)?): ()
			ar = "useDebugValue"
			aK()
			updateHookTypesDev()
			return aD(aL, aM)
		end,
		
		
		
		
		
		
		
		
		
		
		
		
		useMutableSource = function<Source, Snapshot>(
			aL: MutableSource<Source>,
			aM: MutableSourceGetSnapshotFn<
				Source,
				Snapshot
			>,
			aN: MutableSourceSubscribeFn<
				Source,
				Snapshot
			>
		): Snapshot
			ar = "useMutableSource"
			aK()
			updateHookTypesDev()
			return updateMutableSource(aL, aM, aN)
		end,
		useOpaqueIdentifier = function(): OpaqueIDType
			ar = "useOpaqueIdentifier"
			aK()
			updateHookTypesDev()
			return updateOpaqueIdentifier()
		end,

		unstable_isNewReconciler = q,
	}

	aB = {
		readContext = function<T>(aL: ReactContext<T>, aM: number | boolean | nil): T
			aJ()
			return B(aL, aM)
		end,
		useCallback = function<T>(aL: T, aM: Array<any> | nil): T
			ar = "useCallback"
			aK()
			updateHookTypesDev()
			return updateCallback(aL, aM)
		end,
		useContext = function<T>(aL: ReactContext<T>, aM: nil | number | boolean): T
			ar = "useContext"
			aK()
			updateHookTypesDev()
			return B(aL, aM)
		end,
		useEffect = function(
			
			aL: (() -> ()) | (() -> (() -> ())),
			aM: Array<any> | nil
		): ()
			ar = "useEffect"
			aK()
			updateHookTypesDev()
			return updateEffect(aL, aM)
		end,
		useImperativeHandle = function<T>(
			aL: { current: T | nil } | ((inst: T | nil) -> ...any) | nil,
			aM: () -> T,
			aN: Array<any> | nil
		): ()
			ar = "useImperativeHandle"
			aK()
			updateHookTypesDev()
			return updateImperativeHandle(aL, aM, aN)
		end,
		useLayoutEffect = function(
			
			aL: (() -> ()) | (() -> (() -> ())),
			aM: Array<any>?
		): ()
			ar = "useLayoutEffect"
			aK()
			updateHookTypesDev()
			return updateLayoutEffect(aL, aM)
		end,
		
		useMemo = function<T...>(aL: () -> T..., aM: Array<any> | nil): ...any
			ar = "useMemo"
			aK()
			updateHookTypesDev()
			local aN = ag.current
			ag.current = aA
			
			


local aO = { pcall(updateMemo, aL, aM) }
			ag.current = aN
			if not aO[1] then
				error(aO[2])
			end
			return unpack(aO, 2)
		end :: any,
		useReducer = function<S, I, A>(
			aL: (S, A) -> S,
			aM: I,
			aN: ((I) -> S)?
		): (S, Dispatch<A>)
			ar = "useReducer"
			aK()
			updateHookTypesDev()
			local aO = ag.current
			ag.current = aA
			local aP, aQ, aR =
				pcall(rerenderReducer, aL, aM, aN)
			
			ag.current = aO
			if not aP then
				error(aQ)
			end
			
			return aQ, aR
		end,
		useRef = function<T>(aL: T): { current: T }
			ar = "useRef"
			aK()
			updateHookTypesDev()
			return updateRef(aL)
		end,
		
		useBinding = function<T>(aL: T): (ReactBinding<T>, ReactBindingUpdater<T>)
			ar = "useBinding"
			aK()
			updateHookTypesDev()
			return updateBinding(aL)
		end,
		useState = function<S>(aL: (() -> S) | S): (S, Dispatch<BasicStateAction<S>>)
			ar = "useState"
			aK()
			updateHookTypesDev()
			local aM = ag.current
			ag.current = aA
			
			local aN, aO, aP = pcall(rerenderState, aL)
			ag.current = aM
			if not aN then
				error(aO)
			end
			
			return aO, aP
		end,
		useDebugValue = function<T>(aL: T, aM: ((value: T) -> any)?): ()
			ar = "useDebugValue"
			aK()
			updateHookTypesDev()
			return aD(aL, aM)
		end,
		
		
		
		
		
		
		
		
		
		
		
		
		useMutableSource = function<Source, Snapshot>(
			aL: MutableSource<Source>,
			aM: MutableSourceGetSnapshotFn<
				Source,
				Snapshot
			>,
			aN: MutableSourceSubscribeFn<
				Source,
				Snapshot
			>
		): Snapshot
			ar = "useMutableSource"
			aK()
			updateHookTypesDev()
			return updateMutableSource(aL, aM, aN)
		end,
		useOpaqueIdentifier = function(): OpaqueIDType
			ar = "useOpaqueIdentifier"
			aK()
			updateHookTypesDev()
			return rerenderOpaqueIdentifier()
		end,

		unstable_isNewReconciler = q,
	}
end

local function renderWithHooks<Props, SecondArg>(
	aJ: Fiber | nil,
	aK: Fiber,
	aL: (p: Props, arg: SecondArg) -> any,
	aM: Props,
	aN: SecondArg,
	aO: Lanes
): any
	ak = aO
	al = aK

	if a then
		as = if aJ ~= nil
			then (aJ._debugHookTypes :: any) :: Array<HookType>
			else nil
		
		at = 0
		
		
		
		
		
	end

	aK.memoizedState = nil
	
	aK.updateQueue = nil
	aK.lanes = u

	
	
	

	

	
	
	

	
	
	
	if a then
		if aJ ~= nil and aJ.memoizedState ~= nil then
			ag.current = ax
		elseif as ~= nil then
			
			
			
			
			
			ag.current = aw
		else
			ag.current = av
		end
	else
		ag.current = (aJ == nil or aJ.memoizedState == nil)
				and aG
			or aH
	end

	local aP = aL(aM, aN)

	
	if ap then
		
		
		local aQ: number = 0
		repeat
			ap = false
			
			if aQ >= aq then
				error(
					d.new(
[[Too many re-renders. React limits the number of renders to prevent an infinite loop.]]					

)
				)
			end

			aQ += 1
			
			
			
			
			
			

			
			am = nil
			an = nil

			
			aK.updateQueue = nil

			if a then
				
				at = 0
			end

			ag.current = a and ay
				or aI

			aP = aL(aM, aN)
		until not ap
	end

	
	
	ag.current = aF

	if a then
		aK._debugHookTypes = as
	end

	
	
	local aQ = am ~= nil and am.next ~= nil

	ak = u
	al = nil :: any

	am = nil
	an = nil

	if a then
		ar = nil
		as = nil
		at = 0
	end

	ao = false

	
	if aQ then
		error(
			d.new(
[[Rendered fewer hooks than expected. This may be caused by an accidental early return statement.]]			

)
		)
	end

	return aP
end
aj.renderWithHooks = renderWithHooks

return aj
