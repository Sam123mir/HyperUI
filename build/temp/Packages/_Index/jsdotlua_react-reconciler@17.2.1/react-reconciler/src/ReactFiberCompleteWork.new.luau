









local function unimplemented(a: string)
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring(a))
	error("FIXME (roblox): " .. a .. " is unimplemented", 2)
end

local a = require(script.Parent:WaitForChild('ReactInternalTypes'))
type Fiber = a.Fiber
local b = require(script.Parent:WaitForChild('ReactFiberLane'))
type Lanes = b.Lanes
type Lane = b.Lane
local c = b.OffscreenLane





local d = require(script.Parent:WaitForChild('ReactFiberHostConfig'))
type Instance = d.Instance
type Type = d.Type
type Props = d.Props
type Container = d.Container
type ChildSet = d.ChildSet




local e = require(script.Parent:WaitForChild('ReactFiberOffscreenComponent'))
type OffscreenState = e.OffscreenState

local f = require(script.Parent:WaitForChild('ReactMutableSource.new'))
local g =
	f.resetWorkInProgressVersions



local h = require(script.Parent:WaitForChild('ReactWorkTags'))
local i = h.IndeterminateComponent
local j = h.FunctionComponent
local k = h.ClassComponent
local l = h.HostRoot
local m = h.HostComponent
local n = h.HostText
local o = h.HostPortal
local p = h.ContextProvider
local q = h.ContextConsumer
local r = h.ForwardRef
local s = h.Fragment
local t = h.Mode
local u = h.Profiler
local v = h.SuspenseComponent
local w = h.SuspenseListComponent
local x = h.MemoComponent
local y = h.SimpleMemoComponent
local z = h.LazyComponent
local A = h.IncompleteClassComponent
local B = h.FundamentalComponent
local C = h.ScopeComponent
local D = h.Block
local E = h.OffscreenComponent
local F = h.LegacyHiddenComponent
local G = require(script.Parent:WaitForChild('ReactFiberSuspenseComponent.new'))
type SuspenseState = G.SuspenseState
type SuspenseListRenderState = G.SuspenseState

local H = require(script.Parent:WaitForChild('ReactTypeOfMode'))
local I = H.NoMode
local J = H.ConcurrentMode
local K = H.BlockingMode
local L = H.ProfileMode

local M = require(script.Parent:WaitForChild('ReactFiberFlags'))
local N = M.Ref
local O = M.Update
local P = M.Callback
local Q = M.Passive
local R = M.Deletion
local S = M.NoFlags
local T = M.DidCapture
local U = M.Snapshot
local V = M.MutationMask
local W = M.LayoutMask
local X = M.PassiveMask
local Y = M.StaticMask
local Z = M.PerformedWork

local _ = require(script.Parent.Parent:WaitForChild('shared')).invariant

local aa = d.createInstance
local ab = d.createTextInstance
local ac = d.appendInitialChild
local ad = d.finalizeInitialChildren
local ae = d.prepareUpdate
local af = d.supportsMutation
local ag = d.supportsPersistence



local ah = d.createContainerChildSet

local ai = d.finalizeContainerChildren




local aj = d.preparePortalMount

local ak = require(script.Parent:WaitForChild('ReactFiberHostContext.new'))
local al = ak.getRootHostContainer
local am = ak.popHostContext
local an = ak.getHostContext
local ao = ak.popHostContainer

local ap = require(script.Parent:WaitForChild('ReactFiberSuspenseContext.new'))
local aq = ap.popSuspenseContext
local ar = ap.suspenseStackCursor
local as =
	ap.InvisibleParentSuspenseContext
local at = ap.hasSuspenseContext
type SuspenseContext = ap.SuspenseContext






local au = require(script.Parent:WaitForChild('ReactFiberContext.new'))
local av = au.isContextProvider
local aw = au.popContext
local ax = au.popTopLevelContextObject
local ay = require(script.Parent:WaitForChild('ReactFiberNewContext.new')).popProvider

local az = require(script.Parent:WaitForChild('ReactFiberHydrationContext.new'))
local aA =
	az.prepareToHydrateHostSuspenseInstance
local aB = az.popHydrationState
local aC = az.resetHydrationState

local aD =
	az.prepareToHydrateHostInstance
local aE =
	az.prepareToHydrateHostTextInstance
local aF = require(script.Parent.Parent:WaitForChild('shared')).ReactFeatureFlags
local aG = aF.enableSchedulerTracing
local aH = aF.enableSuspenseCallback
local aI = aF.enableSuspenseServerRenderer
local aJ = aF.enableFundamentalAPI

local aK = aF.enableProfilerTimer

local aL = require(script.Parent:WaitForChild('ReactFiberWorkLoop.new')):: any

local aM = aL.popRenderLanes


local aN = aL.markSpawnedWork
local aO = aL.renderDidSuspend
local aP = aL.renderDidSuspendDelayIfPossible







local aQ = b.NoLanes
local aR = b.includesSomeLane
local aS = b.mergeLanes


local aT = require(script.Parent:WaitForChild('ReactProfilerTimer.new'))
local aU = aT.transferActualDuration

local function markUpdate(aV: Fiber)
	
	
	aV.flags = bit32.bor(aV.flags, O)
end

local function markRef(aV: Fiber)
	aV.flags = bit32.bor(aV.flags, N)
end



local function hadNoMutationsEffects(aV, aW: Fiber)
	local aX = aV ~= nil and aV.child == aW.child
	if aX then
		return true
	end

	local aY = aW.child
	while aY ~= nil do
		if bit32.band(aY.flags, V) ~= S then
			return false
		end
		if bit32.band(aY.subtreeFlags, V) ~= S then
			return false
		end
		aY = aY.sibling
	end
	return true
end

local aV
local aW
local aX
local aY
if af then
	

	aV = function(
		aZ: Instance,
		a_: Fiber,
		a0: boolean,
		a1: boolean
	)
		
		
		local a2 = a_.child
		while a2 ~= nil do
			if a2.tag == m or a2.tag == n then
				ac(aZ, a2.stateNode)
			elseif aJ and a2.tag == B then
				ac(aZ, a2.stateNode.instance)
			elseif a2.tag == o then
			
			
			
			elseif a2.child ~= nil then
				a2.child.return_ = a2
				a2 = a2.child
				continue
			end
			if a2 == a_ then
				return
			end
			while a2.sibling == nil do
				if a2.return_ == nil or a2.return_ == a_ then
					return
				end
				a2 = a2.return_
			end
			
			(a2.sibling :: Fiber).return_ = a2.return_
			a2 = a2.sibling
		end
	end

	aW = function(aZ: nil | Fiber, a_: Fiber)
		
	end
	function aX(
		aZ: Fiber,
		a_: Fiber,
		a0: Type,
		a1: Props,
		a2: Container
	)
		
		
		local a3 = aZ.memoizedProps
		if a3 == a1 then
			
			
			return
		end

		
		
		
		
		local a4: Instance = a_.stateNode
		local a5 = an()
		
		
		
		local a6 = ae(
			a4,
			a0,
			a3,
			a1,
			a2,
			a5
		)
		
		a_.updateQueue = a6
		
		
		if a6 then
			markUpdate(a_)
		end
	end
	function aY(
		aZ: Fiber,
		a_: Fiber,
		a0: string,
		a1: string
	)
		
		if a0 ~= a1 then
			markUpdate(a_)
		end
	end
elseif ag then
	
	aV = function(
		aZ: Instance,
		a_: Fiber,
		a0: boolean,
		a1: boolean
	)
		unimplemented("appendAllChildren")
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	end

	
	local function appendAllChildrenToContainer(
		aZ: ChildSet,
		a_: Fiber,
		a0: boolean,
		a1: boolean
	)
		unimplemented("appendAllChildrenToContainer")
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	end

	function aW(aZ: nil | Fiber, a_: Fiber)
		local a0: {
			containerInfo: Container,
			pendingChildren: ChildSet,
			
			[any]: any		
} =
			a_.stateNode
		local a1 = hadNoMutationsEffects(aZ, a_)
		if a1 then
		
		else
			local a2 = a0.containerInfo
			local a3 = ah(a2)
			
			appendAllChildrenToContainer(a3, a_, false, false)
			a0.pendingChildren = a3
			
			markUpdate(a_)
			ai(a2, a3)
		end
	end




























































































else
	
	aW = function(aZ: nil | Fiber, a_: Fiber)
		
	end
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
end

local function bubbleProperties(aZ: Fiber)
	local a_ = aZ.alternate ~= nil
		and (aZ.alternate :: Fiber).child == aZ.child

	local a0 = aQ
	local a1 = S

	if not a_ then
		
		if
			aK
			and bit32.band(aZ.mode, L) ~= I
		then
			
			
			local a2 = aZ.actualDuration
			local a3 = aZ.selfBaseDuration

			local a4 = aZ.child
			while a4 ~= nil do
				a0 =
					aS(a0, aS(a4.lanes, a4.childLanes))

				a1 = bit32.bor(a1, a4.subtreeFlags)
				a1 = bit32.bor(a1, a4.flags)

				
				
				
				
				
				
				
				a2 += a4.actualDuration

				a3 += a4.treeBaseDuration
				a4 = a4.sibling
			end

			aZ.actualDuration = a2
			aZ.treeBaseDuration = a3
		else
			local a2 = aZ.child
			while a2 ~= nil do
				
				
				
				
				
				a0 =
					bit32.bor(a0, bit32.bor(a2.lanes, a2.childLanes))

				a1 = bit32.bor(a1, a2.subtreeFlags)
				a1 = bit32.bor(a1, a2.flags)

				
				
				
				
				a2.return_ = aZ

				a2 = a2.sibling
			end
		end

		aZ.subtreeFlags = bit32.bor(aZ.subtreeFlags, a1)
	else
		
		if
			aK
			and bit32.band(aZ.mode, L) ~= I
		then
			
			
			local a2 = aZ.selfBaseDuration

			local a3 = aZ.child
			while a3 ~= nil do
				a0 =
					aS(a0, aS(a3.lanes, a3.childLanes))

				
				
				
				
				a1 =
					bit32.bor(a1, bit32.band(a3.subtreeFlags, Y))
				a1 =
					bit32.bor(a1, bit32.band(a3.flags, Y))

				a2 += a3.treeBaseDuration
				a3 = a3.sibling
			end

			aZ.treeBaseDuration = a2
		else
			local a2 = aZ.child
			while a2 ~= nil do
				
				
				
				
				
				a0 =
					bit32.bor(a0, bit32.bor(a2.lanes, a2.childLanes))

				
				
				
				
				a1 =
					bit32.bor(a1, bit32.band(a2.subtreeFlags, Y))
				a1 =
					bit32.bor(a1, bit32.band(a2.flags, Y))

				
				
				
				
				a2.return_ = aZ

				a2 = a2.sibling
			end
		end

		aZ.subtreeFlags = bit32.bor(aZ.subtreeFlags, a1)
	end

	aZ.childLanes = a0

	return a_
end







local function completeWork(
	aZ,
	a_: Fiber,
	a0: Lanes
): Fiber | nil
	local a1 = a_.pendingProps

	if
		a_.tag == i
		or a_.tag == z
		or a_.tag == y
		or a_.tag == j
		or a_.tag == r
		or a_.tag == s
		or a_.tag == t
		or a_.tag == q
		or a_.tag == x
	then
		bubbleProperties(a_)
		return nil
	elseif a_.tag == k then
		local a2 = a_.type
		if av(a2) then
			aw(a_)
		end
		bubbleProperties(a_)
		return nil
	elseif a_.tag == l then
		ao(a_)
		ax(a_)
		g()
		
		
		local a2 = a_.stateNode
		if a2.pendingContext then
			a2.context = a2.pendingContext
			a2.pendingContext = nil
		end
		if aZ == nil or aZ.child == nil then
			
			
			local a3 = aB(a_)
			if a3 then
				
				
				markUpdate(a_)
			elseif not a2.hydrate then
				
				
				
				
				a_.flags = bit32.bor(a_.flags, U)
			end
		end
		aW(aZ, a_)
		bubbleProperties(a_)
		return nil
	elseif a_.tag == m then
		am(a_)
		local a2 = al()
		local a3 = a_.type
		if aZ ~= nil and a_.stateNode ~= nil then
			aX(
				aZ,
				a_,
				a3,
				a1,
				a2
			)

			if aZ.ref ~= a_.ref then
				markRef(a_)
			end
		else
			if not a1 then
				_(
					a_.stateNode ~= nil,
[[We must have new props for new mounts. This error is likely caused by a bug in React. Please file an issue.]]				

)
				
				bubbleProperties(a_)
				return nil
			end

			local a4 = an()
			
			
			
			
			local a5 = aB(a_)
			if a5 then
				
				
				if
					aD(
						a_,
						a2,
						a4
					)
				then
					
					
					markUpdate(a_)
				end
			else
				local a6 = aa(
					a3,
					a1,
					a2,
					a4,
					a_
				)

				aV(a6, a_, false, false)

				a_.stateNode = a6

				
				
				
				if
					ad(
						a6,
						a3,
						a1,
						a2,
						a4
					)
				then
					markUpdate(a_)
				end
			end

			if a_.ref ~= nil then
				
				markRef(a_)
			end
		end
		bubbleProperties(a_)
		return nil
	elseif a_.tag == n then
		local a2 = a1
		if aZ and a_.stateNode ~= nil then
			local a3 = aZ.memoizedProps
			
			
			aY(aZ, a_, a3, a2)
		else
			if typeof(a2) ~= "string" then
				_(
					a_.stateNode ~= nil,
[[We must have new props for new mounts. This error is likely caused by a bug in React. Please file an issue.]]				

)
				
			end
			local a3 = al()
			local a4 = an()
			local a5 = aB(a_)
			if a5 then
				if aE(a_) then
					markUpdate(a_)
				end
			else
				a_.stateNode = ab(
					a2,
					a3,
					a4,
					a_
				)
			end
		end
		bubbleProperties(a_)
		return nil
	elseif a_.tag == u then
		local a2 = bubbleProperties(a_)
		if not a2 then
			
			
			
			
			
			local a3 = O
			local a4 = P
			local a5 = Q
			local a6 = a_.subtreeFlags
			local a7 = a_.flags
			local a8 = a7

			
			if
				bit32.band(a7, Z) ~= S
				or bit32.band(a6, Z) ~= S
			then
				a8 = bit32.bor(a8, a3)
			end

			
			
			
			
			
			if
				bit32.band(a7, bit32.bor(W, R)) ~= S
				or bit32.band(a6, bit32.bor(W, R))
					~= S
			then
				a8 = bit32.bor(a8, a4)
			end

			
			
			
			if
				bit32.band(a7, X) ~= S
				or bit32.band(a6, X) ~= S
			then
				a8 = bit32.bor(a8, a5)
			end
			a_.flags = a8
			
		
end

		return nil
	elseif a_.tag == v then
		aq(a_)
		local a2: nil | SuspenseState = a_.memoizedState

		if aI then
			
			if a2 ~= nil and (a2 :: SuspenseState).dehydrated ~= nil then
				if aZ == nil then
					local a3 = aB(a_)
					_(
						a3,
[[A dehydrated suspense component was completed without a hydrated node. This is probably a bug in React.]]					

)
					aA(a_)
					if aG then
						aN(c)
					end
					bubbleProperties(a_)
					if aK then
						if bit32.band(a_.mode, L) ~= I then
							local a4 = a2 ~= nil
							if a4 then
								
								local a5 = a_.child
								if a5 ~= nil then
									
									a_.treeBaseDuration = (
										a5.treeBaseDuration :: any
									) :: number
								end
							end
						end
					end
					return nil
				else
					
					
					
					aC()
					if bit32.band(a_.flags, T) == S then
						
						a_.memoizedState = nil
					end
					
					
					
					
					
					a_.flags = bit32.bor(a_.flags, O)
					bubbleProperties(a_)
					if aK then
						if bit32.band(a_.mode, L) ~= I then
							local a3 = a2 ~= nil
							if a3 then
								
								local a4 = a_.child
								if a4 ~= nil then
									
									
									a_.treeBaseDuration -= a4.treeBaseDuration
								end
							end
						end
					end
					return nil
				end
			end
		end

		if bit32.band(a_.flags, T) ~= S then
			
			a_.lanes = a0
			
			if
				aK
				and bit32.band(a_.mode, L) ~= I
			then
				aU(a_)
			end
			
			return a_
		end

		local a3 = a2 ~= nil
		local a4 = false
		if aZ == nil then
			if a_.memoizedProps.fallback ~= nil then
				aB(a_)
			end
		else
			local a5: nil | SuspenseState = aZ.memoizedState
			a4 = a5 ~= nil
		end

		if a3 and not a4 then
			
			
			
			
			
			if bit32.band(a_.mode, K) ~= I then
				
				
				
				
				
				
				
				local a5 = aZ == nil
					and a_.memoizedProps.unstable_avoidThisFallback
						~= true
				if
					a5
					or at(
						ar.current,
						as :: SuspenseContext
					)
				then
					
					
					aO()
				else
					
					
					aP()
				end
			end
		end

		if ag then
			
			if a3 then
				
				
				
				a_.flags = bit32.bor(a_.flags, O)
			end
		end
		if af then
			
			if a3 or a4 then
				
				
				
				
				
				a_.flags = bit32.bor(a_.flags, O)
			end
		end
		if
			aH
			and a_.updateQueue ~= nil
			and a_.memoizedProps.suspenseCallback ~= nil
		then
			
			a_.flags = bit32.bor(a_.flags, O)
		end
		bubbleProperties(a_)
		if aK then
			if bit32.band(a_.mode, L) ~= I then
				if a3 then
					
					local a5 = a_.child
					if a5 ~= nil then
						
						
						a_.treeBaseDuration -= a5.treeBaseDuration
					end
				end
			end
		end
		return nil
	elseif a_.tag == o then
		ao(a_)
		aW(aZ, a_)
		if aZ == nil then
			aj(a_.stateNode.containerInfo)
		end
		bubbleProperties(a_)
		return nil
	elseif a_.tag == p then
		
		ay(a_)
		bubbleProperties(a_)
		return nil
	elseif a_.tag == A then
		
		
		local a2 = a_.type
		if av(a2) then
			aw(a_)
		end
		bubbleProperties(a_)
		return nil
	elseif a_.tag == w then
		unimplemented("SuspenseListComponent")
	

	
	

	
	
	
	
	
	

	

	
	
	
	
	
	

	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	

	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	elseif a_.tag == B then
		unimplemented("FundamentalComponent")
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	elseif a_.tag == C then
		unimplemented("ScopeComponent")
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	elseif a_.tag == D then
		unimplemented("Block")
	
	
	
	
	elseif
		a_.tag == E
		or a_.tag == F
	then
		aM(a_)
		local a2: OffscreenState | nil = a_.memoizedState
		local a3 = a2 ~= nil

		if aZ ~= nil then
			local a4: OffscreenState | nil = aZ.memoizedState

			local a5 = a4 ~= nil
			if
				a5 ~= a3
				and a1.mode ~= "unstable-defer-without-hiding"
			then
				a_.flags = bit32.bor(a_.flags, O)
			end
		end

		
		if
			not a3
			or aR(
				aL.subtreeRenderLanes,
				c :: Lane
			)
			or bit32.band(a_.mode, J) == I
		then
			bubbleProperties(a_)
		end

		return nil
	end
	_(
		false,
[[Unknown unit of work tag (%s). This error is likely caused by a bug in React. Please file an issue.]]
,
		tostring(a_.tag)
	)
	return nil
end

return {
	completeWork = completeWork,
}
