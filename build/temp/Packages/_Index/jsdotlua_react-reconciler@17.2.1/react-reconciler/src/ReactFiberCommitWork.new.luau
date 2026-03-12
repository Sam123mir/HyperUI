









local function unimplemented(a: string)
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring(a))
	error("FIXME (roblox): " .. a .. " is unimplemented", 2)
end

local a = _G.__DEV__ :: boolean
local b = _G.__YOLO__ :: boolean


local c = 0
local d = 20

local function isCallable(e)
	if typeof(e) == "function" then
		return true
	end
	if typeof(e) == "table" then
		local f = getmetatable(e)
		if f and rawget(f, "__call") then
			return true
		end
		if e._isMockFunction then
			return true
		end
	end
	return false
end


local e = require(script.Parent.Parent:WaitForChild('shared')).console
local f = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
local g = f.Error
local h = f.Set
type Array<T> = { [number]: T }

local i = require(script.Parent:WaitForChild('ReactFiberHostConfig'))
type Instance = i.Instance
type Container = i.Container
type TextInstance = i.TextInstance





type UpdatePayload = Array<any>


local j = require(script.Parent:WaitForChild('ReactInternalTypes'))
type Fiber = j.Fiber
type FiberRoot = j.FiberRoot
local k = require(script.Parent:WaitForChild('ReactFiberSuspenseComponent.new'))
type SuspenseState = k.SuspenseState

local l = require(script.Parent:WaitForChild('ReactUpdateQueue.new'))
type UpdateQueue<T> = j.UpdateQueue<T>




type Effect = {
	tag: HookFlags,
	create: () -> (() -> ())?,
	destroy: (() -> ())?,
	deps: Array<any>?,
	next: Effect
}
type FunctionComponentUpdateQueue = {
	lastEffect: Effect?
}

local m = require(script.Parent.Parent:WaitForChild('shared'))
type Wakeable = m.Wakeable

type ReactPriorityLevel = j.ReactPriorityLevel
local n = require(script.Parent:WaitForChild('ReactFiberOffscreenComponent'))
type OffscreenState = n.OffscreenState
local o = require(script.Parent:WaitForChild('ReactHookEffectTags'))
type HookFlags = o.HookFlags


local p = require(script.Parent.Parent:WaitForChild('scheduler')).tracing.unstable_wrap
local q = require(script.Parent.Parent:WaitForChild('shared')).ReactFeatureFlags
local r = q.enableSchedulerTracing
local s = q.enableProfilerTimer
local t = q.enableProfilerCommitHooks


local u = q.enableSuspenseCallback

local v = q.enableDoubleInvokingEffects
local w = require(script.Parent:WaitForChild('ReactWorkTags'))
local x = w.FunctionComponent
local y = w.ForwardRef
local z = w.ClassComponent
local A = w.HostRoot
local B = w.HostComponent
local C = w.HostText
local D = w.HostPortal
local E = w.Profiler
local F = w.SuspenseComponent
local G = w.DehydratedFragment
local H = w.IncompleteClassComponent
local I = w.MemoComponent
local J = w.SimpleMemoComponent
local K = w.SuspenseListComponent
local L = w.FundamentalComponent
local M = w.ScopeComponent
local N = w.Block
local O = w.OffscreenComponent
local P = w.LegacyHiddenComponent
local Q = require(script.Parent.Parent:WaitForChild('shared')).ReactErrorUtils
local R = Q.invokeGuardedCallback
local S = Q.hasCaughtError
local T = Q.clearCaughtError
local U = require(script.Parent:WaitForChild('ReactFiberFlags'))
local V = U.NoFlags
local W = U.ContentReset
local X = U.Placement
local Y = U.Snapshot
local Z = U.Update
local _ = U.Callback
local aa = U.LayoutMask
local ab = U.PassiveMask
local ac = U.Ref
local ad = require(script.Parent.Parent:WaitForChild('shared')).getComponentName
local ae = require(script.Parent.Parent:WaitForChild('shared')).invariant
local af = require(script.Parent.Parent:WaitForChild('shared')).describeError
local ag = require(script.Parent:WaitForChild('ReactCurrentFiber'))

local ah = ag.current
local ai = ag.resetCurrentFiber
local aj = ag.setCurrentFiber
local ak = require(script.Parent:WaitForChild('ReactFiberDevToolsHook.new')).onCommitUnmount
local al =
	require(script.Parent:WaitForChild('ReactFiberLazyComponent.new')).resolveDefaultProps
local am = require(script.Parent:WaitForChild('ReactProfilerTimer.new'))
local an = am.startLayoutEffectTimer
local ao = am.recordPassiveEffectDuration
local ap = am.recordLayoutEffectDuration
local aq = am.startPassiveEffectTimer
local ar = am.getCommitTime
local as = require(script.Parent:WaitForChild('ReactTypeOfMode')).ProfileMode
local at = l.commitUpdateQueue
local au = i.getPublicInstance
local av = i.supportsMutation
local aw = i.supportsPersistence
local ax = i.supportsHydration
local ay = i.commitMount
local az = i.commitUpdate
local aA = i.resetTextContent
local aB = i.commitTextUpdate
local aC = i.appendChild
local aD = i.appendChildToContainer
local aE = i.insertBefore
local aF = i.insertInContainerBefore
local aG = i.removeChild
local aH = i.removeChildFromContainer




local aI = i.hideInstance
local aJ = i.hideTextInstance
local aK = i.unhideInstance
local aL = i.unhideTextInstance



local aM = i.commitHydratedSuspenseInstance
local aN = i.clearContainer



local aO

local function resolveRetryWakeable(aP: Fiber, aQ: Wakeable): ()
	if not aO then
		aO = require(script.Parent:WaitForChild('ReactFiberWorkLoop.new')):: any
	end
	aO.resolveRetryWakeable(aP, aQ)
end

local function markCommitTimeOfFallback(): ()
	if not aO then
		aO = require(script.Parent:WaitForChild('ReactFiberWorkLoop.new')):: any
	end
	aO.markCommitTimeOfFallback()
end


local function schedulePassiveEffectCallback(): ()
	e.warn(
		"ReactFiberCommitWork: schedulePassiveEffectCallback causes a dependency cycle\n"
			.. debug.traceback()
	)
end


local function captureCommitPhaseError(
	aP: Fiber,
	aQ: Fiber | nil,
	aR: any?
): ()
	e.warn(
		"ReactFiberCommitWork: captureCommitPhaseError causes a dependency cycle"
	)
	error(aR)
end

local aP = o.NoFlags
local aQ = o.HasEffect
local aR = o.Layout
local aS = o.Passive


local aT
local aU = function()
	if not aT then
		aT =
			require(script.Parent:WaitForChild('ReactFiberBeginWork.new')).didWarnAboutReassigningProps
	end
	return aT
end


type Set<T> = { [T]: boolean }


local aV, aW, aX, aY, aZ, a_, a0, a1, a2, a3


local a4: Fiber | nil 









local function callComponentWillUnmountWithTimer(a5, a6)
	a6.props = a5.memoizedProps
	a6.state = a5.memoizedState
	if
		s
		and t
		and bit32.band(a5.mode, as) ~= 0
	then
		
		local a7, a8 = xpcall(function()
			an()
			
			a6:componentWillUnmount()
		end, af)

		ap(a5)

		if not a7 then
			error(a8)
		end
	else
		
		a6:componentWillUnmount()
	end
end


function safelyCallComponentWillUnmount(
	a5: Fiber,
	a6: any,
	a7
): ()
	
	local a8, a9 =
		xpcall(callComponentWillUnmountWithTimer, af, a5, a6)

	if not a8 then
		captureCommitPhaseError(a5, a7, a9)
	end
end

local function safelyDetachRef(a5: Fiber, a6: Fiber): ()
	local a7 = a5.ref
	if a7 ~= nil then
		if typeof(a7) == "function" then
			
			local a8, a9 = xpcall(a7, af)
			if not a8 then
				captureCommitPhaseError(a5, a6, a9)
			end
		else
			
			a7.current = nil
		end
	end
end

local function safelyCallDestroy(
	a5: Fiber,
	a6: Fiber | nil,
	a7: () -> ()
): ()
	
	local a8, a9 = xpcall(a7, af)
	if not a8 then
		captureCommitPhaseError(a5, a6, a9)
	end
end

local function commitBeforeMutationLifeCycles(
	a5: Fiber | nil,
	a6: Fiber
): ()
	if
		a6.tag == x
		or a6.tag == y
		or a6.tag == J
		or a6.tag == N
	then
		return
	elseif a6.tag == z then
		if bit32.band(a6.flags, Y) ~= 0 then
			if a5 ~= nil then
				local a7 = (a5 :: Fiber).memoizedProps
				local a8 = (a5 :: Fiber).memoizedState
				local a9 = a6.stateNode
				
				
				
				if a then
					if
						a6.type == a6.elementType
						and not aU
					then
						if a9.props ~= a6.memoizedProps then
							e.error(
[[Expected %s props to match memoized props before getSnapshotBeforeUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.]]



,
								ad(a6.type) or "instance"
							)
						end
						if a9.state ~= a6.memoizedState then
							e.error(
[[Expected %s state to match memoized state before getSnapshotBeforeUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.]]



,
								ad(a6.type) or "instance"
							)
						end
					end
				end
				
				local ba = a9:getSnapshotBeforeUpdate(
					a6.elementType == a6.type and a7
						or al(a6.type, a7),
					a8
				)
				if a then
					
					
					
					
					
					
					
					
					
					
				end
				a9.__reactInternalSnapshotBeforeUpdate = ba
			end
		end
		return
	elseif a6.tag == A then
		if av then
			if bit32.band(a6.flags, Y) ~= 0 then
				local a7 = a6.stateNode
				aN(a7.containerInfo)
			end
		end
		return
	elseif
		a6.tag == B
		or a6.tag == C
		or a6.tag == D
		or a6.tag == H
	then
		
		return
	end
	ae(
		false,
[[This unit of work tag should not have side-effects. This error is likely caused by a bug in React. Please file an issue.]]	

)
end

local function commitHookEffectListUnmount(
	a5: HookFlags,
	a6: Fiber,
	a7: Fiber?
)
	local a8: FunctionComponentUpdateQueue | nil = a6.updateQueue
	local a9
	if a8 ~= nil then
		a9 = (a8 :: FunctionComponentUpdateQueue).lastEffect
	end

	if a9 ~= nil then
		local ba = a9.next
		local bb = ba
		repeat
			if bit32.band(bb.tag, a5) == a5 then
				
				local bc = bb.destroy
				bb.destroy = nil
				if bc ~= nil then
					safelyCallDestroy(a6, a7, bc)
				end
			end
			bb = bb.next
		until bb == ba
	end
end

local function commitHookEffectListMount(a5: HookFlags, a6: Fiber)
	local a7: FunctionComponentUpdateQueue | nil =
		a6.updateQueue :: any
	local a8 = if a7 ~= nil then a7.lastEffect else nil
	if a8 ~= nil then
		local a9 = a8.next
		local ba = a9
		repeat
			if bit32.band(ba.tag, a5) == a5 then
				
				local bb = ba.create
				ba.destroy = bb()

				if a then
					local bc = ba.destroy
					if bc ~= nil and typeof(bc) ~= "function" then
						local bd
						if bc == nil then
							bd = [[ You returned nil. If your effect does not require clean up, return nil (or nothing).]]						

elseif typeof(bc.andThen) == "function" then
							bd =
[=[


It looks like you wrote useEffect(Promise.new(function() --[[...]] end) or returned a Promise. Instead, write the async function inside your effect and call it immediately:

useEffect(function()
  function fetchData()
    -- You can await here
    local response = MyAPI.getData(someId):await()
    -- ...
  end
  fetchData()
end, {someId}) -- Or {} if effect doesn't need props or state

Learn more about data fetching with Hooks: https://reactjs.org/link/hooks-data-fetching]=]						else
							bd = " You returned: " .. bc
						end
						e.error(
[[An effect function must not return anything besides a function, which is used for clean-up.%s]],
							bd
						)
					end
				end
			end
			ba = ba.next
		until ba == a9
	end
end

function commitProfilerPassiveEffect(a5: FiberRoot, a6: Fiber): ()
	if s and t then
		if a6.tag == E then
			local a7 = a6.stateNode.passiveEffectDuration
			local a8, a9 =
				a6.memoizedProps.id, a6.memoizedProps.onPostCommit

			
			
			local ba = ar()

			if typeof(a9) == "function" then
				if r then
					a9(
						a8,
						if a6.alternate == nil then "mount" else "update",
						a7,
						ba,
						a5.memoizedInteractions
					)
				else
					a9(
						a8,
						if a6.alternate == nil then "mount" else "update",
						a7,
						ba
					)
				end
			end
		end
	end
end

local function recursivelyCommitLayoutEffects(
	a5: Fiber,
	a6: FiberRoot,
	
	a7: (
		sourceFiber: Fiber,
		nearestMountedAncestor: Fiber?,
		error: any
	) -> (),
	a8: () -> ()
)
	if a7 ~= nil then
		captureCommitPhaseError = a7
	end
	if a8 ~= nil then
		schedulePassiveEffectCallback = a8
	end
	local a9 = a5.flags
	local ba = a5.tag
	if ba == E then
		local bb 		if s and t then
			bb = a4
			a4 = a5
		end

		local bc = a5.child
		while bc ~= nil do
			local bd = bit32.band(a5.subtreeFlags, aa)
			if bd ~= V then
				if a then
					local be = ah
					aj(bc)
					R(
						nil,
						recursivelyCommitLayoutEffects,
						nil,
						bc,
						a6,
						
						captureCommitPhaseError,
						schedulePassiveEffectCallback
					)
					if S() then
						local bf = T()
						captureCommitPhaseError(bc, a5, bf)
					end
					if be ~= nil then
						aj(be)
					else
						ai()
					end
				else
					local be, bf = xpcall(
						
						recursivelyCommitLayoutEffects,
						af,
						bc,
						a6,
						captureCommitPhaseError,
						schedulePassiveEffectCallback
					)
					if not be then
						captureCommitPhaseError(bc, a5, bf)
					end
				end
			end
			bc = bc.sibling
		end

		local bd = bit32.band(a9, bit32.bor(Z, _))
		if bd ~= V then
			if s then
				if a then
					local be = ah
					aj(a5)
					R(
						nil,
						commitLayoutEffectsForProfiler,
						nil,
						a5,
						a6
					)
					if S() then
						local bf = T()
						captureCommitPhaseError(
							a5,
							a5.return_,
							bf
						)
					end
					if be ~= nil then
						aj(be)
					else
						ai()
					end
				else
					
					local be, bf = xpcall(
						commitLayoutEffectsForProfiler,
						af,
						a5,
						a6
					)
					if not be then
						captureCommitPhaseError(
							a5,
							a5.return_,
							bf
						)
					end
				end
			end
		end

		if s and t then
			
			
			if bb ~= nil then
				bb.stateNode.effectDuration += a5.stateNode.effectDuration
			end

			a4 = bb
		end
	
	
	else
		local bb = a5.child
		while bb ~= nil do
			local bc = bit32.band(a5.subtreeFlags, aa)
			if bc ~= V then
				if a then
					local bd = ag.current
					aj(bb)
					
					


if c < d then
						c += 1
						R(
							nil,
							recursivelyCommitLayoutEffects,
							nil,
							bb,
							a6,
							
							captureCommitPhaseError,
							schedulePassiveEffectCallback
						)
						c -= 1

						if S() then
							local be = T()
							captureCommitPhaseError(bb, a5, be)
						end
					else
						recursivelyCommitLayoutEffects(
							bb,
							a6,
							captureCommitPhaseError,
							schedulePassiveEffectCallback
						)
					end
					if bd ~= nil then
						aj(bd)
					else
						ai()
					end
				else
					
					local bd, be
					if not b and c < d then
						
						


c += 1

						bd, be = xpcall(
							
							recursivelyCommitLayoutEffects,
							af,
							bb,
							a6,
							captureCommitPhaseError,
							schedulePassiveEffectCallback
						)

						c -= 1
					else
						bd = true
						recursivelyCommitLayoutEffects(
							bb,
							a6,
							captureCommitPhaseError,
							schedulePassiveEffectCallback
						)
					end

					if not bd then
						captureCommitPhaseError(bb, a5, be)
					end
				end
			end
			bb = bb.sibling
		end

		local bc = bit32.band(a9, bit32.bor(Z, _))
		if bc ~= V then
			if
				ba == x
				or ba == y
				or ba == J
				or ba == N
			then
				if
					s
					and t
					and bit32.band(a5.mode, as) ~= 0
				then
					
					local bd, be = xpcall(function()
						an()
						commitHookEffectListMount(
							bit32.bor(aR, aQ),
							a5
						)
					end, af)
					
					ap(a5)
					if not bd then
						error(be)
					end
				else
					commitHookEffectListMount(
						bit32.bor(aR, aQ),
						a5
					)
				end

				if bit32.band(a5.subtreeFlags, ab) ~= V then
					schedulePassiveEffectCallback()
				end
			elseif ba == z then
				
				a0(a5)
			elseif ba == A then
				aZ(a5)
			elseif ba == B then
				a_(a5)
			elseif ba == F then
				commitSuspenseHydrationCallbacks(a6, a5)
			elseif
				ba == L
				or ba == D
				or ba == C
				or ba == H
				or ba == P
				or ba == O
				or ba == M
				or ba == K
			then
			
			else
				ae(
					false,
[[This unit of work tag should not have side-effects. This error is likely caused by a bug in React. Please file an issue.]]				)
			end
		end

		
		
		
		
		
		
		
		if bit32.band(a9, ac) ~= 0 then
			commitAttachRef(a5)
		end
		
	end
end

function commitLayoutEffectsForProfiler(a5: Fiber, a6: FiberRoot)
	if s then
		local a7 = a5.flags
		local a8 = a5.alternate

		local a9, ba =
			a5.memoizedProps.onCommit, a5.memoizedProps.onRender
		local bb = a5.stateNode.effectDuration

		local bc = ar()

		local bd = Z
		local be = _

		if
			bit32.band(a7, bd) ~= V
			
			and isCallable(ba)
		then
			if r then
				ba(
					a5.memoizedProps.id,
					if a8 == nil then "mount" else "update",
					a5.actualDuration,
					a5.treeBaseDuration,
					a5.actualStartTime,
					bc,
					a6.memoizedInteractions
				)
			else
				ba(
					a5.memoizedProps.id,
					if a8 == nil then "mount" else "update",
					a5.actualDuration,
					a5.treeBaseDuration,
					a5.actualStartTime,
					bc
				)
			end
		end

		if t then
			if
				bit32.band(a7, be) ~= V
				
				and isCallable(a9)
			then
				if r then
					a9(
						a5.memoizedProps.id,
						if a8 == nil then "mount" else "update",
						bb,
						bc,
						a6.memoizedInteractions
					)
				else
					a9(
						a5.memoizedProps.id,
						if a8 == nil then "mount" else "update",
						bb,
						bc
					)
				end
			end
		end
	end
end

function a0(a5: Fiber)
	local a6 = a5.stateNode
	local a7 = a5.alternate
	if bit32.band(a5.flags, Z) ~= 0 then
		if a7 == nil then
			
			
			
			if a then
				if
					a5.type == a5.elementType
					and not aU
				then
					if a6.props ~= a5.memoizedProps then
						e.error(
[[Expected %s props to match memoized props before componentDidMount. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.]],
							ad(a5.type) or "instance"
						)
					end
					if a6.state ~= a5.memoizedState then
						e.error(
[[Expected %s state to match memoized state before componentDidMount. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.]],
							ad(a5.type) or "instance"
						)
					end
				end
			end
			if
				s
				and t
				and bit32.band(a5.mode, as) ~= 0
			then
				local a8, a9 = xpcall(function()
					an()
					
					a6:componentDidMount()
				end, af)
				
				ap(a5)
				if not a8 then
					error(a9)
				end
			else
				
				a6:componentDidMount()
			end
		else
			local a8 = a5.elementType == a5.type
					and a7.memoizedProps
				or al(a5.type, a7.memoizedProps)
			local a9 = a7.memoizedState
			
			
			
			if a then
				if
					a5.type == a5.elementType
					and not aU
				then
					if a6.props ~= a5.memoizedProps then
						e.error(
[[Expected %s props to match memoized props before componentDidUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.]]



,
							ad(a5.type) or "instance"
						)
					end
					if a6.state ~= a5.memoizedState then
						e.error(
[[Expected %s state to match memoized state before componentDidUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.]]



,
							ad(a5.type) or "instance"
						)
					end
				end
			end
			if
				s
				and t
				and bit32.band(a5.mode, as) ~= 0
			then
				local ba, bb = xpcall(function()
					an()
					
					a6:componentDidUpdate(
						a8,
						a9,
						a6.__reactInternalSnapshotBeforeUpdate
					)
				end, af)
				
				ap(a5)
				if not ba then
					error(bb)
				end
			else
				
				a6:componentDidUpdate(
					a8,
					a9,
					a6.__reactInternalSnapshotBeforeUpdate
				)
			end
		end
	end

	
	
	local a8: UpdateQueue<any> | nil = a5.updateQueue
	if a8 ~= nil then
		if a then
			if
				a5.type == a5.elementType
				and not aU
			then
				if a6.props ~= a5.memoizedProps then
					e.error(
[[Expected %s props to match memoized props before processing the update queue. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.]]



,
						ad(a5.type) or "instance"
					)
				end
				if a6.state ~= a5.memoizedState then
					e.error(
[[Expected %s state to match memoized state before processing the update queue. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.]]



,
						ad(a5.type) or "instance"
					)
				end
			end
		end
		
		
		
		at(a5, a8, a6)
	end
end

function aZ(a5: Fiber)
	
	
	local a6: UpdateQueue<any> | nil = a5.updateQueue
	if a6 ~= nil then
		local a7 		
if a5.child ~= nil then
			
			local a8 = a5.child
			if a8.tag == B then
				a7 = au(a8.stateNode)
			elseif a8.tag == z then
				a7 = a8.stateNode
			end
		end
		at(a5, a6, a7)
	end
end

function a_(a5: Fiber)
	local a6: Instance = a5.stateNode
	local a7 = a5.alternate

	
	
	
	
	if a7 == nil and bit32.band(a5.flags, Z) ~= 0 then
		local a8 = a5.type
		local a9 = a5.memoizedProps
		ay(a6, a8, a9, a5)
	end
end

local function hideOrUnhideAllChildren(a5, a6)
	if av then
		
		
		local a7: Fiber = a5
		while true do
			if a7.tag == B then
				local a8 = a7.stateNode
				if a6 then
					aI(a8)
				else
					aK(a7.stateNode, a7.memoizedProps)
				end
			elseif a7.tag == C then
				local a8 = a7.stateNode
				if a6 then
					aJ(a8)
				else
					aL(a8, a7.memoizedProps)
				end
			elseif
				(a7.tag == O or a7.tag == P)
				and (a7.memoizedState :: OffscreenState) ~= nil
				and a7 ~= a5
			then
			
			
			elseif a7.child ~= nil then
				
				(a7.child :: Fiber).return_ = a7
				a7 = a7.child :: Fiber
				continue
			end
			if a7 == a5 then
				return
			end
			while a7.sibling == nil do
				if a7.return_ == nil or a7.return_ == a5 then
					return
				end
				a7 = a7.return_ :: Fiber 
			end
			
			(a7.sibling :: Fiber).return_ = a7.return_
			
			a7 = a7.sibling :: Fiber
		end
	end
end

function commitAttachRef(a5: Fiber)
	local a6 = a5.ref
	if a6 ~= nil then
		local a7 = a5.stateNode
		local a8
		if a5.tag == B then
			a8 = au(a7)
		else
			a8 = a7
		end
		
		
		
		
		
		if typeof(a6) == "function" then
			a6(a8)
		else
			if a then
				
				
				
				
				
				if typeof(a6) ~= "table" then
					e.error(
[[Unexpected ref object provided for %s. Use either a ref-setter function or React.createRef().]]
,
						ad(a5.type) or "instance"
					)
					return
				end
			end

			a6.current = a8
		end
	end
end

function commitDetachRef(a5: Fiber)
	local a6 = a5.ref
	if a6 ~= nil then
		if typeof(a6) == "function" then
			a6(nil)
		else
			a6.current = nil
		end
	end
end




function a3(
	a5: FiberRoot,
	a6: Fiber,
	a7: Fiber,
	a8: ReactPriorityLevel
): ()
	ak(a6)

	if
		a6.tag == x
		or a6.tag == y
		or a6.tag == I
		or a6.tag == J
		or a6.tag == N
	then
		local a9: FunctionComponentUpdateQueue | nil = a6.updateQueue
		if a9 ~= nil then
			local ba = (a9 :: FunctionComponentUpdateQueue).lastEffect
			if ba ~= nil then
				local bb = ba.next

				local bc = bb
				repeat
					if bc.destroy ~= nil then
						if bit32.band(bc.tag, aR) ~= aP then
							if
								s
								and t
								and bit32.band(a6.mode, as) ~= 0
							then
								an()
								safelyCallDestroy(
									a6,
									a7,
									bc.destroy
								)
								ap(a6)
							else
								safelyCallDestroy(
									a6,
									a7,
									bc.destroy
								)
							end
						end
					end
					bc = bc.next
				until bc == bb
			end
		end
		return
	elseif a6.tag == z then
		safelyDetachRef(a6, a7)
		local a9 = a6.stateNode
		if typeof(a9.componentWillUnmount) == "function" then
			safelyCallComponentWillUnmount(a6, a9, a7)
		end
		return
	elseif a6.tag == B then
		safelyDetachRef(a6, a7)
		return
	elseif a6.tag == D then
		
		
		
		if av then
			a1(
				a5,
				a6,
				a7,
				a8
			)
		elseif aw then
			unimplemented("emptyPortalContainer")
			
		end
		return
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	end
end

function a2(
	a5: FiberRoot,
	a6: Fiber,
	a7: Fiber,
	a8: ReactPriorityLevel
)
	
	
	
	
	
	local a9: Fiber = a6
	while true do
		a3(a5, a9, a7, a8)
		
		
		if
			a9.child ~= nil
			
			
			and (not av or a9.tag ~= D)
		then
			(a9.child :: Fiber).return_ = a9
			a9 = a9.child :: Fiber
			continue
		end
		if a9 == a6 then
			return
		end
		while a9.sibling == nil do
			if a9.return_ == nil or a9.return_ == a6 then
				return
			end
			a9 = a9.return_ :: Fiber 
		end
		(a9.sibling :: Fiber).return_ = a9.return_
		a9 = a9.sibling :: Fiber
	end
end

local function detachFiberMutation(a5: Fiber)
	
	
	
	
	
	
	
	
	
	
	
	
	local a6 = a5.alternate
	if a6 ~= nil then
		a6.return_ = nil
		a5.alternate = nil
	end
	a5.return_ = nil
end















































local function getHostParentFiber(a5: Fiber): Fiber
	local a6 = a5.return_
	while a6 ~= nil do
		if aV(a6) then
			return a6
		end
		a6 = a6.return_
	end
	
	error(
		g.new(
[[Expected to find a host parent. This error is likely caused by a bug in React. Please file an issue.]]		

)
	)
	
end

function aV(a5: Fiber): boolean
	return a5.tag == B or a5.tag == A or a5.tag == D
end

function aW(a5: Fiber): Instance?
	
	
	
	
	local a6: Fiber = a5
	while true do
		
		
		local a7 = false
		
		while a6.sibling == nil do
			if a6.return_ == nil or aV(a6.return_) then
				
				
				return nil
			end
			a6 = a6.return_ :: Fiber 
		end
		(a6.sibling :: Fiber).return_ = a6.return_ :: Fiber
		a6 = a6.sibling :: Fiber
		while
			a6.tag ~= B
			and a6.tag ~= C
			and a6.tag ~= G
		do
			
			
			if bit32.band(a6.flags, X) ~= 0 then
				
				a7 = true
				break
			end
			
			
			if a6.child == nil or a6.tag == D then
				a7 = true
				break
			else
				(a6.child :: Fiber).return_ = a6
				a6 = a6.child :: Fiber
			end
		end
		if a7 then
			continue
		end
		
		if bit32.band(a6.flags, X) == 0 then
			
			return a6.stateNode
		end
	end
end

local function commitPlacement(a5: Fiber)
	if not av then
		return
	end

	
	local a6 = getHostParentFiber(a5)

	
	local a7
	local a8
	local a9 = a6.stateNode
	if a6.tag == B then
		a7 = a9
		a8 = false
	elseif a6.tag == A then
		a7 = a9.containerInfo
		a8 = true
	elseif a6.tag == D then
		a7 = a9.containerInfo
		a8 = true
	
	
	
	
	
	else
		
		ae(
			false,
[[Invalid host parent fiber. This error is likely caused by a bug in React. Please file an issue.]]		

)
	end
	if bit32.band(a6.flags, W) ~= 0 then
		
		aA(a7)
		
		a6.flags = bit32.band(a6.flags, bit32.bnot(W))
	end

	local ba = aW(a5)
	
	
	if a8 then
		aY(a5, ba, a7)
	else
		aX(a5, ba, a7)
	end
end

function aY(
	a5: Fiber,
	a6: Instance?,
	a7: Container
)
	local a8 = a5.tag
	local a9 = a8 == B or a8 == C
	
	if a9 then 
		local ba = a5.stateNode
		if a6 then
			aF(a7, ba, a6)
		else
			aD(a7, ba)
		end
	elseif a8 == D then
	
	
	
	else
		local ba = a5.child
		if ba ~= nil then
			aY(ba, a6, a7)
			local bb = ba.sibling
			while bb ~= nil do
				aY(bb, a6, a7)
				bb = bb.sibling
			end
		end
	end
end

function aX(a5: Fiber, a6: Instance?, a7: Instance): ()
	local a8 = a5.tag
	local a9 = a8 == B or a8 == C
	
	if a9 then 
		local ba = a5.stateNode
		if a6 then
			aE(a7, ba, a6)
		else
			aC(a7, ba)
		end
	elseif a8 == D then
	
	
	
	else
		local ba = a5.child
		if ba ~= nil then
			aX(ba, a6, a7)
			local bb = ba.sibling
			while bb ~= nil do
				aX(bb, a6, a7)
				bb = bb.sibling
			end
		end
	end
end

function a1(
	a5: FiberRoot,
	a6: Fiber,
	a7: Fiber,
	a8: ReactPriorityLevel
): ()
	
	
	local a9: Fiber = a6

	
	
	local ba = false

	
	local bb
	local bc

	while true do
		if not ba then
			
			local bd = a9.return_ :: Fiber
			while true do
				
				if bd == nil then
					error(
						g.new(
[[Expected to find a host parent. This error is likely caused by a bug in React. Please file an issue.]]						

)
					)
				end
				
				local be = bd.stateNode
				if bd.tag == B then
					bb = be
					bc = false
					break
				elseif bd.tag == A then
					bb = be.containerInfo
					bc = true
					break
				elseif bd.tag == D then
					bb = be.containerInfo
					bc = true
					break
					
					
					
					
					
					
				end
				
				bd = bd.return_ :: Fiber
			end
			ba = true
		end

		if a9.tag == B or a9.tag == C then
			a2(
				a5,
				a9,
				a7,
				a8
			)
			
			
			if bc then
				
				
				
				
				
				aH(bb, a9.stateNode)
			else
				
				
				
				
				
				aG(bb, a9.stateNode)
			end
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

		
		
		
		
		
		
		
		
		
		
		
		
		elseif a9.tag == D then
			if a9.child ~= nil then
				
				
				bb = a9.stateNode.containerInfo
				bc = true
				
				a9.child.return_ = a9
				a9 = a9.child
				continue
			end
		else
			a3(a5, a9, a7, a8)
			
			if a9.child ~= nil then
				a9.child.return_ = a9
				a9 = a9.child
				continue
			end
		end
		if a9 == a6 then
			return
		end
		while a9.sibling == nil do
			if a9.return_ == nil or a9.return_ == a6 then
				return
			end
			
			a9 = a9.return_ :: Fiber
			if a9.tag == D then
				
				
				ba = false
			end
		end
		
		(a9.sibling :: Fiber).return_ = a9.return_
		a9 = a9.sibling :: Fiber
	end
end

local function commitDeletion(
	a5: FiberRoot,
	a6: Fiber,
	a7: Fiber,
	a8: ReactPriorityLevel
): ()
	
	
	
	
	a1(
		a5,
		a6,
		a7,
		a8
	)
	
	
	
	
	
	
	
	
	
	local a9 = a6.alternate
	detachFiberMutation(a6)
	if a9 ~= nil then
		detachFiberMutation(a9)
	end
end

local function commitWork(a5: Fiber | nil, a6: Fiber)
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	

	if
		a6.tag == x
		or a6.tag == y
		or a6.tag == I
		or a6.tag == J
		or a6.tag == N
	then
		
		
		
		
		
		if
			s
			and t
			and bit32.band(a6.mode, as) ~= 0
		then
			
			local a7, a8 = xpcall(function()
				an()
				commitHookEffectListUnmount(
					bit32.bor(aR, aQ),
					a6,
					a6.return_
				)
			end, af)
			
			ap(a6)
			if not a7 then
				error(a8)
			end
		else
			commitHookEffectListUnmount(
				bit32.bor(aR, aQ),
				a6,
				a6.return_
			)
		end
		return
	elseif a6.tag == z then
		return
	elseif a6.tag == B then
		local a7: Instance = a6.stateNode
		if a7 ~= nil then
			
			local a8 = a6.memoizedProps
			
			
			
			local a9
			if a5 then
				a9 = a5.memoizedProps
			else
				a9 = a8
			end
			local ba = a6.type
			
			local bb: nil | UpdatePayload = a6.updateQueue :: any
			a6.updateQueue = nil
			if bb ~= nil then
				az(
					a7,
					bb,
					ba,
					a9,
					a8,
					a6
				)
			end
		end
		return
	elseif a6.tag == C then
		ae(
			a6.stateNode ~= nil,
[[This should have a text node initialized. This error is likely caused by a bug in React. Please file an issue.]]		

)
		local a7: TextInstance = a6.stateNode
		local a8: string = a6.memoizedProps
		
		
		
		local a9: string
		if a5 ~= nil then
			a9 = (a5 :: Fiber).memoizedProps
			a9 = a8
		end
		aB(a7, a9, a8)
		return
	elseif a6.tag == A then
		if ax then
			local a7: FiberRoot = a6.stateNode
			if a7.hydrate then
				
				a7.hydrate = false
				unimplemented("commitWork: HostRoot: commitHydratedContainer")
				
			end
		end
		return
	elseif a6.tag == E then
		return
	elseif a6.tag == F then
		commitSuspenseComponent(a6)
		attachSuspenseRetryListeners(a6)
		return
	elseif a6.tag == K then
		unimplemented("commitWork: SuspenseListComponent")
	
	
	elseif a6.tag == H then
		return
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	elseif
		a6.tag == O
		or a6.tag == P
	then
		local a7: OffscreenState | nil = a6.memoizedState
		local a8 = a7 ~= nil
		hideOrUnhideAllChildren(a6, a8)
		return
	end
	ae(
		false,
[[This unit of work tag should not have side-effects. This error is likely caused by a bug in React. Please file an issue.]]	

)
end

function commitSuspenseComponent(a5: Fiber)
	local a6: SuspenseState | nil = a5.memoizedState

	if a6 ~= nil then
		markCommitTimeOfFallback()

		if av then
			
			
			
			
			
			
			
			
			
			local a7: Fiber = a5.child :: any
			hideOrUnhideAllChildren(a7, true)
		end
	end

	if u and a6 ~= nil then
		local a7 = a5.memoizedProps.suspenseCallback
		if typeof(a7) == "function" then
			local a8: Set<Wakeable> | nil = a5.updateQueue :: any
			if a8 ~= nil then
				a7(table.clone(a8))
			end
		elseif a then
			if a7 ~= nil then
				e.error(
					"Unexpected type for suspenseCallback: %s",
					tostring(a7)
				)
			end
		end
	end
end

function commitSuspenseHydrationCallbacks(a5: FiberRoot, a6: Fiber)
	if not ax then
		return
	end
	local a7: SuspenseState | nil = a6.memoizedState
	if a7 == nil then
		local a8 = a6.alternate
		if a8 ~= nil then
			local a9: SuspenseState | nil = a8.memoizedState
			if a9 ~= nil then
				local ba = a9.dehydrated
				if ba ~= nil then
					aM(ba)
					if u then
						local bb = a5.hydrationCallbacks
						if bb ~= nil then
							local bc = bb.onHydrated
							if bc then
								bc(ba)
							end
						end
					end
				end
			end
		end
	end
end

function attachSuspenseRetryListeners(a5: Fiber)
	
	
	
	local a6: Set<Wakeable> | nil = a5.updateQueue :: any
	if a6 ~= nil then
		a5.updateQueue = nil
		local a7 = a5.stateNode
		if a7 == nil then
			a5.stateNode = h.new()
			a7 = a5.stateNode
		end
		for a8, a9 in a6 :: Set<Wakeable> do
			
			local ba = function()
				return resolveRetryWakeable(a5, a8)
			end

			if not a7:has(a8) then
				if r then
					if a8.__reactDoNotTraceInteractions ~= true then
						ba = p(ba)
					end
				end
				a7:add(a8)
				a8:andThen(function()
					return ba()
				end, function()
					return ba()
				end)
			end
		end
	end
end




function isSuspenseBoundaryBeingHidden(a5: Fiber | nil, a6: Fiber): boolean
	if a5 ~= nil then
		
		local a7: SuspenseState | nil = (a5 :: Fiber).memoizedState
		if a7 == nil or (a7 :: SuspenseState).dehydrated ~= nil then
			local a8: SuspenseState | nil = a6.memoizedState
			return a8 ~= nil and (a8 :: SuspenseState).dehydrated == nil
		end
	end
	return false
end

function commitResetTextContent(a5: Fiber): ()
	if not av then
		return
	end
	aA(a5.stateNode)
end

local function commitPassiveUnmount(a5: Fiber): ()
	if
		a5.tag == x
		or a5.tag == y
		or a5.tag == J
		or a5.tag == N
	then
		if
			s
			and t
			and bit32.band(a5.mode, as) ~= 0
		then
			aq()
			commitHookEffectListUnmount(
				bit32.bor(aS, aQ),
				a5,
				a5.return_
			)
			ao(a5)
		else
			commitHookEffectListUnmount(
				bit32.bor(aS, aQ),
				a5,
				a5.return_
			)
		end
	end
end

local function commitPassiveUnmountInsideDeletedTree(
	a5: Fiber,
	a6: Fiber | nil
): ()
	if
		a5.tag == x
		or a5.tag == y
		or a5.tag == J
		or a5.tag == N
	then
		if
			s
			and t
			and bit32.band(a5.mode, as) ~= 0
		then
			aq()
			commitHookEffectListUnmount(aS, a5, a6)
			ao(a5)
		else
			commitHookEffectListUnmount(aS, a5, a6)
		end
	end
end

local function commitPassiveMount(a5: FiberRoot, a6: Fiber): ()
	if
		a6.tag == x
		or a6.tag == y
		or a6.tag == J
		or a6.tag == N
	then
		if
			s
			and t
			and bit32.band(a6.mode, as) ~= 0
		then
			aq()
			
			local a7, a8 = xpcall(
				commitHookEffectListMount,
				af,
				bit32.bor(aS, aQ),
				a6
			)
			
			ao(a6)
			if not a7 then
				error(a8)
			end
		else
			commitHookEffectListMount(bit32.bor(aS, aQ), a6)
		end
	elseif a6.tag == E then
		commitProfilerPassiveEffect(a5, a6)
	end
end

function invokeLayoutEffectMountInDEV(a5: Fiber): ()
	if a and v then
		if
			a5.tag == x
			or a5.tag == y
			or a5.tag == J
			or a5.tag == N
		then
			R(
				nil,
				commitHookEffectListMount,
				nil,
				bit32.bor(aR, aQ),
				a5
			)
			if S() then
				local a6 = T()
				captureCommitPhaseError(a5, a5.return_, a6)
			end
			return
		end
	elseif a5.tag == z then
		local a6 = a5.stateNode
		R(nil, a6.componentDidMount, a6)
		if S() then
			local a7 = T()
			captureCommitPhaseError(a5, a5.return_, a7)
		end
		return
	end
end

function invokePassiveEffectMountInDEV(a5: Fiber): ()
	if a and v then
		if
			a5.tag == x
			or a5.tag == y
			or a5.tag == J
			or a5.tag == N
		then
			R(
				nil,
				commitHookEffectListMount,
				nil,
				bit32.bor(aS, aQ),
				a5
			)
			if S() then
				local a6 = T()
				captureCommitPhaseError(a5, a5.return_, a6)
			end
			return
		end
	end
end

function invokeLayoutEffectUnmountInDEV(a5: Fiber): ()
	if a and v then
		if
			a5.tag == x
			or a5.tag == y
			or a5.tag == J
			or a5.tag == N
		then
			R(
				nil,
				commitHookEffectListUnmount,
				nil,
				bit32.bor(aR, aQ),
				a5,
				a5.return_
			)
			if S() then
				local a6 = T()
				captureCommitPhaseError(a5, a5.return_, a6)
			end
			return
		end
	elseif a5.tag == z then
		local a6 = a5.stateNode
		if typeof(a6.componentWillUnmount) == "function" then
			safelyCallComponentWillUnmount(a5, a6, a5.return_)
		end
		return
	end
end

function invokePassiveEffectUnmountInDEV(a5: Fiber): ()
	if a and v then
		if
			a5.tag == x
			or a5.tag == y
			or a5.tag == J
			or a5.tag == N
		then
			R(
				nil,
				commitHookEffectListUnmount,
				nil,
				bit32.bor(aS, aQ),
				a5,
				a5.return_
			)
			if S() then
				local a6 = T()
				captureCommitPhaseError(a5, a5.return_, a6)
			end
			return
		end
	end
end

return {
	safelyCallDestroy = safelyCallDestroy,

	commitBeforeMutationLifeCycles = commitBeforeMutationLifeCycles,
	commitResetTextContent = commitResetTextContent,
	commitPlacement = commitPlacement,
	commitDeletion = commitDeletion,
	commitWork = commitWork,
	commitAttachRef = commitAttachRef,
	commitDetachRef = commitDetachRef,
	commitPassiveUnmount = commitPassiveUnmount,
	commitPassiveUnmountInsideDeletedTree = commitPassiveUnmountInsideDeletedTree,
	commitPassiveMount = commitPassiveMount,
	invokeLayoutEffectMountInDEV = invokeLayoutEffectMountInDEV,
	invokeLayoutEffectUnmountInDEV = invokeLayoutEffectUnmountInDEV,
	invokePassiveEffectMountInDEV = invokePassiveEffectMountInDEV,
	invokePassiveEffectUnmountInDEV = invokePassiveEffectUnmountInDEV,
	isSuspenseBoundaryBeingHidden = isSuspenseBoundaryBeingHidden,
	recursivelyCommitLayoutEffects = recursivelyCommitLayoutEffects,
}
