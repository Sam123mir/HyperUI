










local a = _G.__DEV__
local b = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
local c = b.Object
local d = b.Array
local e = b.util.inspect


local f = require(script.Parent.Parent:WaitForChild('shared')).console

local g = require(script.Parent.Parent:WaitForChild('shared'))


type ReactElement = g.ReactElement<any, any>
type ReactFragment = g.ReactFragment
type ReactPortal = g.ReactPortal
type ReactFundamentalComponent<T, U> = g.ReactFundamentalComponent<T, U>
type ReactScope = g.ReactScope
local h = require(script.Parent:WaitForChild('ReactInternalTypes'))
export type Fiber = h.Fiber


type RoactStableKey = h.RoactStableKey
local i = require(script.Parent:WaitForChild('ReactRootTags'))
type RootTag = i.RootTag
local j = require(script.Parent:WaitForChild('ReactWorkTags'))
type WorkTag = j.WorkTag
local k = require(script.Parent:WaitForChild('ReactTypeOfMode'))
type TypeOfMode = k.TypeOfMode
local l = require(script.Parent:WaitForChild('ReactFiberLane'))
type Lanes = l.Lanes
local m = require(script.Parent:WaitForChild('ReactFiberHostConfig'))
type SuspenseInstance = m.SuspenseInstance
local n = require(script.Parent:WaitForChild('ReactFiberOffscreenComponent'))
type OffscreenProps = n.OffscreenProps

local o = require(script.Parent.Parent:WaitForChild('shared')).invariant
local p = require(script.Parent.Parent:WaitForChild('shared')).ReactFeatureFlags
local q = p.enableProfilerTimer


local r = require(script.Parent:WaitForChild('ReactFiberFlags'))
local s = r.NoFlags
local t = r.Placement
local u = r.StaticMask
local v = i.ConcurrentRoot
local w = i.BlockingRoot
local x = j.IndeterminateComponent
local y = j.ClassComponent
local z = j.HostRoot
local A = j.HostComponent
local B = j.HostText
local C = j.HostPortal
local D = j.ForwardRef
local E = j.Fragment
local F = j.Mode
local G = j.ContextProvider
local H = j.ContextConsumer
local I = j.Profiler
local J = j.SuspenseComponent
local K = j.SuspenseListComponent
local L = j.DehydratedFragment
local M = j.FunctionComponent
local N = j.MemoComponent
local O = j.SimpleMemoComponent
local P = j.LazyComponent
local Q = j.FundamentalComponent
local R = j.ScopeComponent
local S = j.OffscreenComponent
local T = j.LegacyHiddenComponent
local U = require(script.Parent.Parent:WaitForChild('shared')).getComponentName

local V = require(script.Parent:WaitForChild('ReactFiberDevToolsHook.new'))
local W = V.isDevToolsPresent
local X = require(script.Parent:WaitForChild('ReactFiberHotReloading.new'))
local Y = X.resolveClassForHotReloading
local Z =
	X.resolveFunctionForHotReloading
local _ =
	X.resolveForwardRefForHotReloading
local aa = l.NoLanes
local ab = k.NoMode
local ac = k.ConcurrentMode
local ad = k.DebugTracingMode
local ae = k.ProfileMode
local af = k.StrictMode
local ag = k.BlockingMode
local ah = require(script.Parent.Parent:WaitForChild('shared')).ReactSymbols
local ai = ah.REACT_FORWARD_REF_TYPE
local aj = ah.REACT_FRAGMENT_TYPE
local ak = ah.REACT_ELEMENT_TYPE
local al = ah.REACT_DEBUG_TRACING_MODE_TYPE
local am = ah.REACT_STRICT_MODE_TYPE
local an = ah.REACT_PROFILER_TYPE
local ao = ah.REACT_PROVIDER_TYPE
local ap = ah.REACT_CONTEXT_TYPE
local aq = ah.REACT_SUSPENSE_TYPE
local ar = ah.REACT_SUSPENSE_LIST_TYPE
local as = ah.REACT_MEMO_TYPE
local at = ah.REACT_LAZY_TYPE


local au = ah.REACT_OFFSCREEN_TYPE
local av = ah.REACT_LEGACY_HIDDEN_TYPE




















local aw, ax, ay, az, aA, aB, aC, aD

local aE = 1


























local function createFiber(
	aF: WorkTag,
	aG: any,
	aH: RoactStableKey?,
	aI: TypeOfMode,
	aJ: any?,
	aK: any?,
	aL: any?,
	aM: Lanes?
): Fiber
	
	
	local aN: Fiber = {
		
		tag = aF,
		key = aH,
		elementType = aJ,
		type = aK,
		stateNode = aL,

		
		
		
		
		index = 1,

		

		pendingProps = aG,
		
		
		
		

		mode = aI,

		
		flags = s,
		subtreeFlags = s,
		

		lanes = if aM then aM else aa,
		childLanes = aa,

		
	} :: any

	if q then
		
		
		




















aN.actualDuration = 0
		aN.actualStartTime = -1
aN.selfBaseDuration = 0
		aN.treeBaseDuration = 0
	end

	if a then
		
		aN._debugID = aE
		aE += 1
		aN._debugSource = nil
		aN._debugOwner = nil
		aN._debugNeedsRemount = false
		aN._debugHookTypes = nil
		
		

		
		
		
		

		
	end
	return aN
	
end


function _shouldConstruct(aF)
	
	
	return type(aF) ~= "function" and not not aF.isReactComponent
end


local function isSimpleFunctionComponent(aF: any)
	
	return type(aF) == "function"
	
	
	
end

local function resolveLazyComponentTag(aF: any): WorkTag
	local aG = typeof(aF)
	if aG == "function" then
		return M
	end

	if aG == "table" then
		if aF.isReactComponent then
			return y
		end
		local aH = aF["$$typeof"]
		if aH == ai then
			return D
		end
		if aH == as then
			return N
		end
	end

	return x
end


local function createWorkInProgress(aF: Fiber, aG: any): Fiber
	
	local aH = aF.alternate :: Fiber
	if aH == nil then
		
		
		
		
		
		aH = createFiber(
			aF.tag,
			aG,
			aF.key,
			aF.mode,
			aF.elementType,
			aF.type,
			aF.stateNode
		)

		if a then
			
			aH._debugID = aF._debugID
			aH._debugSource = aF._debugSource
			aH._debugOwner = aF._debugOwner
			aH._debugHookTypes = aF._debugHookTypes
		end

		aH.alternate = aF
		aF.alternate = aH
	else
		aH.pendingProps = aG
		
		aH.type = aF.type

		
		
		aH.flags = s

		
		aH.subtreeFlags = s
		aH.deletions = nil

		if q then
			
			
			
			
			aH.actualDuration = 0
			aH.actualStartTime = -1
end
	end

	
	
	aH.flags = bit32.band(aF.flags, u)
	aH.childLanes = aF.childLanes
	aH.lanes = aF.lanes

	aH.child = aF.child
	aH.memoizedProps = aF.memoizedProps
	aH.memoizedState = aF.memoizedState
	aH.updateQueue = aF.updateQueue

	
	
	local aI = aF.dependencies
	if aI == nil then
		aH.dependencies = nil
	else
		aH.dependencies = {
			lanes = aI.lanes,
			firstContext = aI.firstContext,
		}
	end

	
	aH.sibling = aF.sibling
	aH.index = aF.index
	aH.ref = aF.ref

	if q then
		aH.selfBaseDuration = aF.selfBaseDuration
		aH.treeBaseDuration = aF.treeBaseDuration
	end

	if a then
		aH._debugNeedsRemount = aF._debugNeedsRemount
		if
			aH.tag == x
			or aH.tag == M
			or aH.tag == O
		then
			aH.type = Z(aF.type)
		elseif aH.tag == y then
			aH.type = Y(aF.type)
		elseif aH.tag == D then
			aH.type = _(aF.type)
		end
	end

	return aH
end


local function resetWorkInProgress(aF: Fiber, aG: Lanes)
	
	
	
	

	
	

	
	
	aF.flags =
		bit32.band(aF.flags, bit32.bor(u, t))

	

	local aH = aF.alternate
	if aH == nil then
		
		aF.childLanes = aa
		aF.lanes = aG

		aF.child = nil
		aF.subtreeFlags = s
		aF.memoizedProps = nil
		aF.memoizedState = nil
		aF.updateQueue = nil

		aF.dependencies = nil

		aF.stateNode = nil

		if q then
			
			
			aF.selfBaseDuration = 0
			aF.treeBaseDuration = 0
		end
	else
		
		aF.childLanes = aH.childLanes
		aF.lanes = aH.lanes

		aF.child = aH.child
		aF.subtreeFlags = aH.subtreeFlags
		aF.deletions = nil
		aF.memoizedProps = aH.memoizedProps
		aF.memoizedState = aH.memoizedState
		aF.updateQueue = aH.updateQueue
		
		aF.type = aH.type

		
		
		local aI = aH.dependencies
		if aI == nil then
			aF.dependencies = nil
		else
			aF.dependencies = {
				lanes = aI.lanes,
				firstContext = aI.firstContext,
			}
		end

		if q then
			
			
			aF.selfBaseDuration = aH.selfBaseDuration
			aF.treeBaseDuration = aH.treeBaseDuration
		end
	end

	return aF
end

local function createHostRootFiber(aF: RootTag): Fiber
	local aG
	if aF == v then
		aG = bit32.bor(ac, ag, af)
	elseif aF == w then
		aG = bit32.bor(ag, af)
	else
		aG = ab
	end

	
	if q and W() then
		
		
		
		aG = bit32.bor(aG, ae)
	end

	return createFiber(z, nil, nil, aG)
end

local function createFiberFromTypeAndProps(
	aF: any, 
	aG: string?,
	aH: any,
	aI: nil | Fiber,
	aJ: TypeOfMode,
	aK: Lanes
): Fiber
	local aL = x
	
	
	local aM = aF
	local aN = type(aF)
	
	
	if aN == "function" then
		if a then
			aM = Z(aM)
		end
	elseif aN == "table" and not not aF.isReactComponent then
		aL = y
		if a then
			aM = Y(aM)
		end
	elseif aN == "string" then
		aL = A
	else
		if aF == aj then
			return ay(aH.children, aJ, aK, aG)
		elseif aF == al then
			aL = F
			aJ = bit32.bor(aJ, ad)
		elseif aF == am then
			aL = F
			aJ = bit32.bor(aJ, af)
		elseif aF == an then
			return ax(aH, aJ, aK, aG)
		elseif aF == aq then
			return aA(aH, aJ, aK, aG)
			
			
		elseif aF == au then
			return aB(aH, aJ, aK, aG)
		elseif aF == av then
			return aC(aH, aJ, aK, aG)
			
			
			
			
		else
			local aO = false
			local aP
			if aN == "table" then
				aP = aF["$$typeof"]
				if aP == ao then
					aL = G
					aO = true
				elseif aP == ap then
					
					aL = H
					aO = true
				elseif aP == ai then
					aL = D
					if a then
						aM = _(aM)
					end
					aO = true
				elseif aP == as then
					aL = N
					aO = true
				elseif aP == at then
					aL = P
					aM = nil
					aO = true
					
					
					
					
					
					
					
					
					
					
				end
			end
			if not aO then
				local aQ = ""
				if a then
					if
						aF == nil
						or (aN == "table" and #c.keys(aF) == 0)
					then
						aQ ..= [[ You likely forgot to export your component from the file it's defined in, or you might have mixed up default and named imports.]]					
elseif aF ~= nil and aN == "table" then
						
						aQ ..= "\n" .. e(aF)
					end
					local aR
					if aI then
						aR = U(aI.type)
					end
					if aR ~= nil and aR ~= "" then
						aQ ..= "\n\nCheck the render method of `" .. aR .. "`."
					elseif aI then
						
						
						aQ ..= "\n" .. e(aI)
					end
				end

				
				local aR
				if aF == nil then
					aR = "nil"
				elseif d.isArray(aF) then
					aR = "array"
				elseif aN == "table" and aP == ak then
					aR =
						string.format("<%s />", U(aF.type) or "Unknown")
					aQ =
						" Did you accidentally export a JSX literal or Element instead of a component?"
				else
					aR = aN
				end

				o(
					false,
[[Element type is invalid: expected a string (for built-in components) or a class/function (for composite components) but got: %s.%s]]

,
					aR,
					aQ
				)
			end
		end
	end

	
	local aO =
		createFiber(aL, aH, aG, aJ, aF, aM, nil, aK)

	
	
	
	

	if a then
		aO._debugOwner = aI
	end

	return aO
end

local function createFiberFromElement(
	aF: ReactElement,
	aG: TypeOfMode,
	aH: Lanes
): Fiber
	local aI 	
if a then
		aI = aF._owner
	end
	local aJ = aF.type
	local aK = aF.key
	local aL = aF.props
	local aM = createFiberFromTypeAndProps(
		aJ,
		
		aK :: string,
		aL,
		aI,
		aG,
		aH
	)
	if a then
		aM._debugSource = aF._source
		aM._debugOwner = aF._owner
	end
	return aM
end

function ay(
	aF: ReactFragment,
	aG: TypeOfMode,
	aH: Lanes,
	aI: string?
): Fiber
	
	local aJ = createFiber(E, aF, aI, aG, nil, nil, nil, aH)
	
	
	return aJ
end

function az(
	aF: ReactFundamentalComponent<any, any>,
	aG: any,
	aH: TypeOfMode,
	aI: Lanes,
	aJ: string?
): Fiber
	
	local aK = createFiber(
		Q,
		aG,
		aJ,
		aH,
		aF,
		aF,
		nil,
		aI
	)
	
	
	
	
	return aK
end

function aw(
	aF: ReactScope,
	aG: any,
	aH: TypeOfMode,
	aI: Lanes,
	aJ: string?
): Fiber
	
	local aK =
		createFiber(R, aG, aJ, aH, aF, aF, nil, aI)
	
	
	
	
	return aK
end

function ax(
	aF: any,
	aG: TypeOfMode,
	aH: Lanes,
	aI: string?
): Fiber
	if a then
		if typeof(aF.id) ~= "string" then
			f.error('Profiler must specify an "id" as a prop')
		end
	end

	
	local aJ = createFiber(
		I,
		aF,
		aI,
		bit32.bor(aG, ae),
		an,
		an,
		if q
			then {
				effectDuration = 0,
				passiveEffectDuration = 0,
			}
			else nil,
		aH
	)
	
	
	
	
	

	
	
	
	
	
	

	return aJ
end

function aA(
	aF: any,
	aG: TypeOfMode,
	aH: Lanes,
	aI: string?
): Fiber
	
	local aJ = createFiber(
		J,
		aF,
		aI,
		aG,
		aq,
		aq,
		nil,
		aH
	)

	
	
	
	
	

	
	
	return aJ
end

function aD(
	aF: any,
	aG: TypeOfMode,
	aH: Lanes,
	aI: string?
): Fiber
	
	local aJ = createFiber(
		K,
		aF,
		aI,
		aG,
		ar,
		if a then ar else nil,
		nil,
		aH
	)
	
	
	
	
	
	
	
	
	
	return aJ
end

function aB(
	aF: OffscreenProps,
	aG: TypeOfMode,
	aH: Lanes,
	aI: string?
): Fiber
	
	local aJ = createFiber(
		S,
		aF,
		aI,
		aG,
		au,
		if a then au else nil,
		nil,
		aH
	)
	
	
	
	
	
	
	
	
	
	return aJ
end

function aC(
	aF: OffscreenProps,
	aG: TypeOfMode,
	aH: Lanes,
	aI: string?
): Fiber
	
	local aJ = createFiber(
		T,
		aF,
		aI,
		aG,
		av,
		if a then av else nil,
		nil,
		aH
	)
	
	
	
	
	
	
	
	
	
	return aJ
end

local function createFiberFromText(aF: string, aG: TypeOfMode, aH: Lanes): Fiber
	
	local aI = createFiber(B, aF, nil, aG, nil, nil, nil, aH)
	
	
	return aI
end

local function createFiberFromHostInstanceForDeletion(): Fiber
	
	local aF = createFiber(A, nil, nil, ab, "DELETED", "DELETED")
	
	
	
	
	return aF
end

local function createFiberFromDehydratedFragment(aF: SuspenseInstance): Fiber
	
	local aG =
		createFiber(L, nil, nil, ab, nil, nil, aF)
	
	
	return aG
end

local function createFiberFromPortal(
	aF: ReactPortal,
	aG: TypeOfMode,
	aH: Lanes
): Fiber
	local aI = if aF.children ~= nil then aF.children else {}
	
	local aJ = createFiber(C, aI, aF.key, aG, nil, nil, {
		containerInfo = aF.containerInfo,
		pendingChildren = nil, 
		implementation = aF.implementation,
	}, aH)
	
	
	
	
	
	
	
	return aJ
end



local function assignFiberPropertiesInDEV(aF: Fiber, aG: Fiber): Fiber
	if aF == nil then
		
		
		aF = createFiber(x, nil, nil, ab)
	end

	
	
	
	
	

	aF.tag = aG.tag
	aF.key = aG.key
	aF.elementType = aG.elementType
	aF.type = aG.type
	aF.stateNode = aG.stateNode
	aF.return_ = aG.return_
	aF.child = aG.child
	aF.sibling = aG.sibling
	aF.index = aG.index
	aF.ref = aG.ref
	aF.pendingProps = aG.pendingProps
	aF.memoizedProps = aG.memoizedProps
	aF.updateQueue = aG.updateQueue
	aF.memoizedState = aG.memoizedState
	aF.dependencies = aG.dependencies
	aF.mode = aG.mode
	aF.flags = aG.flags
	aF.subtreeFlags = aG.subtreeFlags
	aF.deletions = aG.deletions
	aF.lanes = aG.lanes
	aF.childLanes = aG.childLanes
	aF.alternate = aG.alternate
	if q then
		aF.actualDuration = aG.actualDuration
		aF.actualStartTime = aG.actualStartTime
		aF.selfBaseDuration = aG.selfBaseDuration
		aF.treeBaseDuration = aG.treeBaseDuration
	end
	aF._debugID = aG._debugID
	aF._debugSource = aG._debugSource
	aF._debugOwner = aG._debugOwner
	aF._debugNeedsRemount = aG._debugNeedsRemount
	aF._debugHookTypes = aG._debugHookTypes
	return aF
end


return {
	isSimpleFunctionComponent = isSimpleFunctionComponent,
	resolveLazyComponentTag = resolveLazyComponentTag,
	createWorkInProgress = createWorkInProgress,
	resetWorkInProgress = resetWorkInProgress,
	createHostRootFiber = createHostRootFiber,
	createFiberFromTypeAndProps = createFiberFromTypeAndProps,
	createFiberFromElement = createFiberFromElement,
	createFiberFromFragment = ay,
	createFiberFromFundamental = az,
	createFiberFromSuspense = aA,
	createFiberFromSuspenseList = aD,
	createFiberFromOffscreen = aB,
	createFiberFromLegacyHidden = aC,
	createFiberFromText = createFiberFromText,
	createFiberFromHostInstanceForDeletion = createFiberFromHostInstanceForDeletion,
	createFiberFromDehydratedFragment = createFiberFromDehydratedFragment,
	createFiberFromPortal = createFiberFromPortal,
	assignFiberPropertiesInDEV = assignFiberPropertiesInDEV,
}
