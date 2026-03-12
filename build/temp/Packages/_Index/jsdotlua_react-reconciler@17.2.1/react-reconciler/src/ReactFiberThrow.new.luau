










local a = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
local b = a.Object

local c = require(script.Parent.Parent:WaitForChild('shared')).console
type Error = a.Error
type Map<K, V> = { [K]: V }
type Object = { [string]: any }
type Set<T> = { [T]: boolean }

local d = require(script.Parent:WaitForChild('ReactInternalTypes'))
type Fiber = d.Fiber
type FiberRoot = d.FiberRoot
type ReactPriorityLevel = d.ReactPriorityLevel
local e = require(script.Parent:WaitForChild('ReactFiberLane'))
type Lanes = e.Lanes
type Lane = e.Lane
local f = require(script.Parent:WaitForChild('ReactCapturedValue'))
type CapturedValue<T> = f.CapturedValue<T>
local g = require(script.Parent:WaitForChild('ReactUpdateQueue.new'))
type Update<T> = d.Update<T>

local h = require(script.Parent.Parent:WaitForChild('shared'))
type React_Component<Props, State> = h.React_Component<Props, State>
type Thenable<T> = h.Thenable<T>
type Wakeable = h.Wakeable

local i = require(script.Parent:WaitForChild('ReactFiberSuspenseContext.new'))
type SuspenseContext = i.SuspenseContext

local j = require(script.Parent.Parent:WaitForChild('shared')).getComponentName

local k = require(script.Parent:WaitForChild('ReactWorkTags'))
local l = k.ClassComponent
local m = k.HostRoot
local n = k.SuspenseComponent
local o = k.IncompleteClassComponent

local p = require(script.Parent:WaitForChild('ReactFiberFlags'))
local q = p.DidCapture
local r = p.Incomplete
local s = p.NoFlags
local t = p.ShouldCapture
local u = p.LifecycleEffectMask
local v = p.ForceUpdateForLegacySuspense
local w =
	require(script.Parent:WaitForChild('ReactFiberSuspenseComponent.new')).shouldCaptureSuspense
local x = require(script.Parent:WaitForChild('ReactTypeOfMode'))
local y = x.NoMode
local z = x.BlockingMode
local A = x.DebugTracingMode
local B = require(script.Parent.Parent:WaitForChild('shared')).ReactFeatureFlags
local C = B.enableDebugTracing
local D = B.enableSchedulingProfiler
local E = require(script.Parent:WaitForChild('ReactCapturedValue')).createCapturedValue

local F = g.enqueueCapturedUpdate
local G = g.createUpdate
local H = g.CaptureUpdate
local I = g.ForceUpdate
local J = g.enqueueUpdate
local K = require(
	script.Parent["ReactFiberHotReloading.new"]
).markFailedErrorBoundaryForHotReloading

local L = i.hasSuspenseContext
local M =
	i.InvisibleParentSuspenseContext
local N = i.suspenseStackCursor



local O
local P, Q, R


local S = function(...)
	if not P then
		O = require(script.Parent:WaitForChild('ReactFiberWorkLoop.new'))		
P =
			O.markLegacyErrorBoundaryAsFailed
	end
	return P(...)
end







local T = function(...)
	if O == nil then
		O = require(script.Parent:WaitForChild('ReactFiberWorkLoop.new'))	
end
	R = O.pingSuspendedRoot
	return R(...)
end
local U = function(...)
	if O == nil then
		O = require(script.Parent:WaitForChild('ReactFiberWorkLoop.new'))	
end
	Q =
		O.isAlreadyFailedLegacyErrorBoundary
	return Q(...)
end

local V = require(script.Parent:WaitForChild('ReactFiberErrorLogger')).logCapturedError
local W = require(script.Parent:WaitForChild('DebugTracing')).logComponentSuspended
local X = require(script.Parent:WaitForChild('SchedulingProfiler')).markComponentSuspended

local Y = e.SyncLane
local Z = e.NoTimestamp
local _ = e.includesSomeLane
local aa = e.mergeLanes
local ab = e.pickArbitraryLane



function createRootErrorUpdate(
	ac: Fiber,
	ad: CapturedValue<Error>,
	ae: Lane,
	
	af
): Update<any>
	local ag = G(Z, ae)
	
	ag.tag = H
	
	
	ag.payload = { element = b.None }
	local ah = ad.value
	ag.callback = function()
		if af ~= nil then
			af(ah)
		end
		V(ac, ad)
	end
	return ag
end

function createClassErrorUpdate(
	ac: Fiber,
	ad: CapturedValue<Error>,
	ae: Lane
): Update<any>
	local af = G(Z, ae)
	af.tag = H
	local ag = (ac.type :: React_Component<any, any>).getDerivedStateFromError
	if typeof(ag) == "function" then
		local ah = ad.value
		af.payload = function()
			V(ac, ad)
			return ag(ah)
		end
	end

	local ah = ac.stateNode
	if ah ~= nil and typeof(ah.componentDidCatch) == "function" then
		af.callback = function()
			if _G.__DEV__ then
				K(ac)
			end
			if typeof(ag) ~= "function" then
				
				
				
				
				
				
				S(ah)

				
				V(ac, ad)
			end
			local ai = ad.value
			local aj = ad.stack
			
			ah:componentDidCatch(ai, {
				componentStack = aj or "",
			})
			if _G.__DEV__ then
				if typeof(ag) ~= "function" then
					
					
					
					if not _(ac.lanes, Y) then
						c.error(
[[%s: Error boundaries should implement getDerivedStateFromError(). In that method, return a state update to display an error message or fallback UI.]]
,
							j(ac.type) or "Unknown"
						)
					end
				end
			end
		end
	elseif _G.__DEV__ then
		af.callback = function()
			K(ac)
		end
	end
	return af
end

local function attachPingListener(ac: FiberRoot, ad: Wakeable, ae: Lanes)
	
	
	
	local af: Map<Wakeable, (Set<any> | Map<Wakeable, Set<any>>)> | nil =
		ac.pingCache
	local ag
	if af == nil then
		
		
		ag = {} :: Set<any>
		ac.pingCache = {
			[ad] = ag,
		} :: Map<Wakeable, (Set<any> | Map<Wakeable, Set<any>>)>
		af = ac.pingCache :: Map<Wakeable, (Set<any> | Map<Wakeable, Set<any>>)>
	else
		ag = (
			af :: Map<Wakeable, (Set<any> | Map<Wakeable, Set<any>>)>
		)[ad] :: Set<any>
		if ag == nil then
			ag = {} :: Set<any>;
			(af :: Map<Wakeable, (Set<any> | Map<Wakeable, Set<any>>)>)[ad] =
				ag
		end
	end
	if not ag[ae] then
		
		ag[ae] = true
		local ah = function()
			return T(ac, ad, ae)
		end
		ad:andThen(ah, ah)
	end
end

function throwException(
	ac: FiberRoot,
	ad: Fiber,
	ae: Fiber,
	af: any,
	ag: Lanes,
	ah,
	ai
)
	
	ae.flags = bit32.bor(ae.flags, r)

	if
		af ~= nil
		and typeof(af) == "table"
		and typeof(af.andThen) == "function"
	then
		
		local aj: Wakeable = af

		if _G.__DEV__ then
			if C then
				if bit32.band(ae.mode, A) ~= 0 then
					local ak = j(ae.type) or "Unknown"
					W(ak, aj)
				end
			end
		end

		if D then
			X(ae, aj)
		end

		if bit32.band(ae.mode, z) == y then
			
			
			local ak = ae.alternate
			if ak then
				
				ae.updateQueue = ak.updateQueue
				ae.memoizedState = ak.memoizedState
				ae.lanes = ak.lanes
			else
				
				ae.updateQueue = nil
				ae.memoizedState = nil
			end
		end

		local ak = L(
			N.current,
			M :: SuspenseContext
		)

		
		local al = ad
		repeat
			if
				al.tag == n
				and w(al, ak)
			then
				

				
				
				local am: Set<Wakeable> = al.updateQueue
				if am == nil then
					local an = {
						[aj] = true,
					}
					
					al.updateQueue = an
				else
					am[aj] = true
				end

				
				
				
				
				
				
				
				
				if bit32.band(al.mode, z) == y then
					al.flags = bit32.bor(al.flags, q)
					ae.flags =
						bit32.bor(ae.flags, v)

					
					
					
					ae.flags = bit32.band(
						ae.flags,
						bit32.bnot(bit32.bor(u, r))
					)

					if ae.tag == l then
						local an = ae.alternate
						if an == nil then
							
							
							
							ae.tag = o
						else
							
							
							
							local ao = G(Z, Y)
							ao.tag = I
							J(ae, ao)
						end
					end

					
					
					ae.lanes = aa(ae.lanes, Y)

					
					return
				end

				
				
				
				
				
				
				
				
				
				
				
				
				
				
				

				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				

				attachPingListener(ac, aj, ag)

				al.flags = bit32.bor(al.flags, t)
				al.lanes = ag

				return
			end
			
			
			al = al.return_ :: Fiber 
		until al == nil

		
		
		af = (j(ae.type) or "A React component")
			.. [[ suspended while rendering, but no fallback UI was specified.

Add a <Suspense fallback=...> component higher in the tree to provide a loading indicator or placeholder to display.]]	

end

	
	
	
	ai()

	af = E(af, ae)
	local aj = ad
	repeat
		if aj.tag == m then
			local ak = af
			aj.flags = bit32.bor(aj.flags, t)
			local al = ab(ag)
			aj.lanes = aa(aj.lanes, al)
			
			local am =
				createRootErrorUpdate(aj, ak, al, ah)
			F(aj, am)
			return
		elseif aj.tag == l then
			
			local ak = af
			local al = aj.type
			local am = aj.stateNode
			if
				bit32.band(aj.flags, q) == s
				and (
					typeof(al.getDerivedStateFromError) == "function"
					or (
						am ~= nil
						and typeof(am.componentDidCatch) == "function"
						and not U(am)
					)
				)
			then
				aj.flags = bit32.bor(aj.flags, t)
				local an = ab(ag)
				aj.lanes = aa(aj.lanes, an)
				
				local ao = createClassErrorUpdate(aj, ak, an)
				F(aj, ao)
				return
			end
		end
		aj = aj.return_ :: Fiber 
	until aj == nil
end

return {
	throwException = throwException,
	createRootErrorUpdate = createRootErrorUpdate,
	createClassErrorUpdate = createClassErrorUpdate,
}
