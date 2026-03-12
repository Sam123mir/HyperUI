









local a = require(script.Parent:WaitForChild('ReactInternalTypes'))
type FiberRoot = a.FiberRoot
type ReactPriorityLevel = a.ReactPriorityLevel
local b = require(script.Parent.Parent:WaitForChild('shared')).console

local c =
	require(script.Parent:WaitForChild('ReactFiberSchedulerPriorities.roblox'))




export type LanePriority = a.LanePriority
export type Lane = a.Lane
export type Lanes = a.Lanes
export type LaneMap<T> = a.LaneMap<T>

local d = require(script.Parent.Parent:WaitForChild('shared')).invariant

local e = c.ImmediatePriority
local f = c.UserBlockingPriority
local g = c.NormalPriority
local h = c.LowPriority
local i = c.IdlePriority
local j = c.NoPriority

local k = {}

local l: LanePriority = 15
k.SyncLanePriority = l
local m: LanePriority = 14
k.SyncBatchedLanePriority = m

local n: LanePriority = 13
local o: LanePriority = 12
k.InputDiscreteLanePriority = o

local p: LanePriority = 11
local q: LanePriority = 10
k.InputContinuousLanePriority = q

local r: LanePriority = 9
local s: LanePriority = 8
k.DefaultLanePriority = s

local t: LanePriority = 7
local u: LanePriority = 6
k.TransitionPriority = u

local v: LanePriority = 5

local w: LanePriority = 4

local x: LanePriority = 3
local y: LanePriority = 2

local z: LanePriority = 1

local A: LanePriority = 0
k.NoLanePriority = A




local B: Lanes = 
	0b0000000000000000000000000000000
k.NoLanes = B
local C: Lane = 
	0b0000000000000000000000000000000
k.NoLane = C

local D: Lane = 
	0b0000000000000000000000000000001
k.SyncLane = D
local E: Lanes = 
	0b0000000000000000000000000000010
k.SyncBatchedLane = E

local F: Lane = 
	0b0000000000000000000000000000100
k.InputDiscreteHydrationLane = F
local G: Lanes = 
	0b0000000000000000000000000011000

local H: Lane = 
	0b0000000000000000000000000100000
local I: Lanes = 
	0b0000000000000000000000011000000

local J: Lane = 
	0b0000000000000000000000100000000
k.DefaultHydrationLane = J
local K: Lanes = 
	0b0000000000000000000111000000000
k.DefaultLanes = K

local L: Lane = 
	0b0000000000000000001000000000000
local M: Lanes = 
	0b0000000001111111110000000000000

local N: Lanes = 
	0b0000011110000000000000000000000

k.RetryLanes = N
local O: Lanes = 
	0b0000010000000000000000000000000
k.SomeRetryLane = O

local P: Lane = 
	0b0000100000000000000000000000000
k.SelectiveHydrationLane = P

local Q = 
	0b0000111111111111111111111111111

local R: Lane = 
	0b0001000000000000000000000000000
k.IdleHydrationLane = R
local S: Lanes = 
	0b0110000000000000000000000000000

local T: Lane = 
	0b1000000000000000000000000000000
k.OffscreenLane = T

local U = -1
k.NoTimestamp = U

local V: LanePriority = k.NoLanePriority

k.getCurrentUpdateLanePriority = function(): LanePriority
	return V
end

k.setCurrentUpdateLanePriority = function(W: LanePriority)
	V = W
end



local W: LanePriority = k.DefaultLanePriority

local function getHighestPriorityLanes(X: Lanes | Lane): Lanes
	if bit32.band(D, X) ~= B then
		W = l
		return D
	end
	if bit32.band(E, X) ~= B then
		W = m
		return E
	end
	if bit32.band(F, X) ~= B then
		W = n
		return F
	end
	local Y = bit32.band(G, X)
	if Y ~= B then
		W = o
		return Y
	end
	if bit32.band(X, H) ~= B then
		W = p
		return H
	end
	local Z = bit32.band(I, X)
	if Z ~= B then
		W = q
		return Z
	end
	if bit32.band(X, J) ~= B then
		W = r
		return J
	end
	local _ = bit32.band(K, X)
	if _ ~= B then
		W = s
		return _
	end
	if bit32.band(X, L) ~= B then
		W = t
		return L
	end
	local aa = bit32.band(M, X)
	if aa ~= B then
		W = u
		return aa
	end
	local ab = bit32.band(N, X)
	if ab ~= B then
		W = v
		return ab
	end
	if bit32.band(X, P) ~= 0 then
		W = w
		return P
	end
	if bit32.band(X, R) ~= B then
		W = x
		return R
	end
	local ac = bit32.band(S, X)
	if ac ~= B then
		W = y
		return ac
	end
	if bit32.band(T, X) ~= B then
		W = z
		return T
	end
	if _G.__DEV__ then
		b.error("Should have found matching lanes. This is a bug in React.")
	end
	
	W = s
	return X
end

local function schedulerPriorityToLanePriority(
	aa: ReactPriorityLevel
): LanePriority
	if aa == e then
		return l
	elseif aa == f then
		return q
	elseif
		aa == g
		or aa == h
	then
		
		return s
	elseif aa == i then
		return y
	else
		return A
	end
end
k.schedulerPriorityToLanePriority = schedulerPriorityToLanePriority

local function lanePriorityToSchedulerPriority(
	aa: LanePriority
): ReactPriorityLevel
	if aa == l or aa == m then
		return e
	elseif
		aa == n
		or aa == o
		or aa == p
		or aa == q
	then
		return f
	elseif
		aa == r
		or aa == s
		or aa == t
		or aa == u
		or aa == w
		or aa == v
	then
		return g
	elseif
		aa == x
		or aa == y
		or aa == z
	then
		return i
	elseif aa == A then
		return j
	else
		d(
			false,
			"Invalid update priority: %s. This is a bug in React.",
			aa
		)
		
		error("unreachable")
	end
end
k.lanePriorityToSchedulerPriority = lanePriorityToSchedulerPriority


local aa, ab, ac

local function getNextLanes(X: FiberRoot, Y: Lanes): Lanes
	
	local Z = X.pendingLanes
	if Z == B then
		W = A
		return B
	end

	local _ = B
	local ad = A

	local ae = X.expiredLanes
	local af = X.suspendedLanes
	local ag = X.pingedLanes

	
	if ae ~= B then
		_ = ae
		W = l
		ad = l
	else
		
		
		local ah = bit32.band(Z, Q)
		if ah ~= B then
			local ai =
				bit32.band(ah, bit32.bnot(af))
			if ai ~= B then
				_ = getHighestPriorityLanes(ai)
				ad = W
			else
				local aj = bit32.band(ah, ag)
				if aj ~= B then
					_ = getHighestPriorityLanes(aj)
					ad = W
				end
			end
		else
			
			local ai = bit32.band(Z, bit32.bnot(af))
			if ai ~= B then
				_ = getHighestPriorityLanes(ai)
				ad = W
			else
				if ag ~= B then
					_ = getHighestPriorityLanes(ag)
					ad = W
				end
			end
		end
	end

	if _ == B then
		
		
		return B
	end

	
	
	
	
	_ =
		bit32.band(Z, bit32.lshift(ab(_), 1) - 1)

	
	
	
	if
		Y ~= B
		and Y ~= _
		
		
		and bit32.band(Y, af) == B
	then
		getHighestPriorityLanes(Y)
		local ah = W
		if ad <= ah then
			return Y
		else
			W = ad
		end
	end

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	local ah = X.entangledLanes
	if ah ~= B then
		local ai = X.entanglements
		local aj = bit32.band(_, ah)
		while aj > 0 do
			local ak = aa(aj)
			local al = bit32.lshift(1, ak)

			_ = bit32.bor(_, ai[ak])

			aj = bit32.band(aj, bit32.bnot(al))
		end
	end

	return _
end
k.getNextLanes = getNextLanes

local function getMostRecentEventTime(ad: FiberRoot, ae: Lanes): number
	local af = ad.eventTimes

	local ag = U
	while ae > 0 do
		local ah = aa(ae)
		local ai = bit32.lshift(1, ah)

		local aj = af[ah]
		if aj > ag then
			ag = aj
		end

		ae = bit32.band(ae, bit32.bnot(ai))
	end

	return ag
end
k.getMostRecentEventTime = getMostRecentEventTime

local function computeExpirationTime(ad: Lane, ae: number)
	
	getHighestPriorityLanes(ad)
	local af = W
	if af >= q then
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		return ae + 250
	elseif af >= u then
		return ae + 5000
	else
		
		return U
	end
end
k.computeExpirationTime = computeExpirationTime

local function markStarvedLanesAsExpired(ad: FiberRoot, ae: number)
	
	
	

	local af = ad.pendingLanes
	local ag = ad.suspendedLanes
	local ah = ad.pingedLanes
	local ai = ad.expirationTimes

	
	
	
	local aj = af
	while aj > 0 do
		local ak = aa(aj)
		local al = bit32.lshift(1, ak)

		local X = ai[ak]
		if X == U then
			
			
			
			if
				bit32.band(al, ag) == B
				or bit32.band(al, ah) ~= B
			then
				
				ai[ak] = computeExpirationTime(al, ae)
			end
		elseif X <= ae then
			
			ad.expiredLanes = bit32.bor(ad.expiredLanes, al)
		end

		aj = bit32.band(aj, bit32.bnot(al))
	end
end
k.markStarvedLanesAsExpired = markStarvedLanesAsExpired



local function getHighestPriorityPendingLanes(ad: FiberRoot)
	return getHighestPriorityLanes(ad.pendingLanes)
end
k.getHighestPriorityPendingLanes = getHighestPriorityPendingLanes

local function getLanesToRetrySynchronouslyOnError(ad: FiberRoot): Lanes
	local ae =
		bit32.band(ad.pendingLanes, bit32.bnot(T))
	if ae ~= B then
		return ae
	end
	if bit32.band(ae, T) ~= 0 then
		return T
	end
	return B
end
k.getLanesToRetrySynchronouslyOnError = getLanesToRetrySynchronouslyOnError

local function returnNextLanesPriority()
	return W
end
k.returnNextLanesPriority = returnNextLanesPriority

local function includesNonIdleWork(ad: Lanes)
	return bit32.band(ad, Q) ~= B
end
k.includesNonIdleWork = includesNonIdleWork

local function includesOnlyRetries(ad: Lanes)
	return bit32.band(ad, N) == ad
end
k.includesOnlyRetries = includesOnlyRetries

local function includesOnlyTransitions(ad: Lanes)
	return bit32.band(ad, M) == ad
end
k.includesOnlyTransitions = includesOnlyTransitions


local ad



local function findUpdateLane(ae: LanePriority, af: Lanes): Lane
	if ae == A then
		
	elseif ae == l then
		return D
	elseif ae == m then
		return E
	elseif ae == o then
		local ag =
			ad(bit32.band(G, bit32.bnot(af)))
		if ag == C then
			
			return findUpdateLane(q, af)
		end
		return ag
	elseif ae == q then
		local ag =
			ad(bit32.band(I, bit32.bnot(af)))
		if ag == C then
			
			return findUpdateLane(s, af)
		end
		return ag
	elseif ae == s then
		local ag = ad(bit32.band(K, bit32.bnot(af)))
		if ag == C then
			
			
			ag = ad(bit32.band(M, bit32.bnot(af)))
			if ag == C then
				
				
				
				ag = ad(K)
			end
		end
		return ag
	elseif
		ae == u 
		or ae == v 
	then
		
	elseif ae == y then
		local ag = ad(bit32.band(S, bit32.bnot(af)))
		if ag == C then
			ag = ad(S)
		end
		return ag
		
	
end
	d(false, "Invalid update priority: %s. This is a bug in React.", ae)
	
	error("unreachable")
end
k.findUpdateLane = findUpdateLane



local function findTransitionLane(ae: Lanes, af: Lanes): Lane
	
	
	local ag = ad(bit32.band(M, bit32.bnot(af)))
	if ag == C then
		
		
		ag = ad(bit32.band(M, bit32.bnot(ae)))
		if ag == C then
			
			
			ag = ad(M)
		end
	end
	return ag
end
k.findTransitionLane = findTransitionLane



local function findRetryLane(ae: Lanes): Lane
	
	
	
	local af = ad(bit32.band(N, bit32.bnot(ae)))
	if af == C then
		af = ad(N)
	end
	return af
end
k.findRetryLane = findRetryLane

local function getHighestPriorityLane(ae: Lanes)
	return bit32.band(ae, -ae)
end

function ab(ae: Lanes): Lane
	
	local af = 31 - bit32.countlz(ae)
	if af < 0 then
		return B
	else
		return bit32.lshift(1, af)
	end
end

function ac(ae: Lanes | Lane): Lanes
	return bit32.lshift(ab(ae), 1) - 1
end

function ad(ae: Lanes): Lane
	
	
	
	
	return getHighestPriorityLane(ae)
end
k.pickArbitraryLane = ad

function aa(ae: Lanes)
	return 31 - bit32.countlz(ae)
end






local function includesSomeLane(ae: Lanes | Lane, af: Lanes | Lane)
	return bit32.band(ae, af) ~= B
end
k.includesSomeLane = includesSomeLane

local function isSubsetOfLanes(ae: Lanes, af: Lanes | Lane)
	return bit32.band(ae, af) == af
end
k.isSubsetOfLanes = isSubsetOfLanes

local function mergeLanes(ae: Lanes | Lane, af: Lanes | Lane): Lanes
	return bit32.bor(ae, af)
end
k.mergeLanes = mergeLanes

local function removeLanes(ae: Lanes, af: Lanes | Lane): Lanes
	return bit32.band(ae, bit32.bnot(af))
end
k.removeLanes = removeLanes



local function laneToLanes(ae: Lane): Lanes
	return ae
end
k.laneToLanes = laneToLanes

local function higherPriorityLane(ae: Lane, af: Lane)
	
	if ae ~= C and af ~= C then
		if ae < af then
			return ae
		end
		return af
	else
		if ae ~= C then
			return ae
		end
		return af
	end
end
k.higherPriorityLane = higherPriorityLane

local function higherLanePriority(ae: LanePriority, af: LanePriority): LanePriority
	if ae ~= A and ae > af then
		return ae
	else
		return af
	end
end
k.higherLanePriority = higherLanePriority



local function createLaneMap(ae): LaneMap<any>
	
	
	
	
	local af = {
		[0] = ae,
		[1] = ae,
		[2] = ae,
		[3] = ae,
		[4] = ae,
		[5] = ae,
		[6] = ae,
		[7] = ae,
		[8] = ae,
		[9] = ae,
		[10] = ae,
		[11] = ae,
		[12] = ae,
		[13] = ae,
		[14] = ae,
		[15] = ae,
		[16] = ae,
		[17] = ae,
		[18] = ae,
		[19] = ae,
		[20] = ae,
		[21] = ae,
		[22] = ae,
		[23] = ae,
		[24] = ae,
		[25] = ae,
		[26] = ae,
		[27] = ae,
		[28] = ae,
		[29] = ae,
		[30] = ae,
		[31] = ae,
		
	}
	return af
end
k.createLaneMap = createLaneMap

local function markRootUpdated(ae: FiberRoot, af: Lane, ag: number)
	ae.pendingLanes = bit32.bor(ae.pendingLanes, af)

	
	
	
	
	
	
	
	
	

	
	local ah = af - 1 

	ae.suspendedLanes = bit32.band(ae.suspendedLanes, ah)
	ae.pingedLanes = bit32.band(ae.pingedLanes, ah)

	local ai = ae.eventTimes
	
	
	local aj = 31 - bit32.countlz(af)
	
	
	ai[aj] = ag
end
k.markRootUpdated = markRootUpdated

local function markRootSuspended(ae: FiberRoot, af: Lanes)
	ae.suspendedLanes = bit32.bor(ae.suspendedLanes, af)
	ae.pingedLanes = bit32.band(ae.pingedLanes, bit32.bnot(af))

	
	local ag = ae.expirationTimes
	local ah = af
	while ah > 0 do
		local ai = aa(ah)
		local aj = bit32.lshift(1, ai)

		ag[ai] = U

		ah = bit32.band(ah, bit32.bnot(aj))
	end
end
k.markRootSuspended = markRootSuspended

local function markRootPinged(ae: FiberRoot, af: Lanes, ag: number)
	ae.pingedLanes =
		bit32.bor(ae.pingedLanes, bit32.band(ae.suspendedLanes, af))
end
k.markRootPinged = markRootPinged

local function markRootExpired(ae: FiberRoot, af: Lanes)
	ae.expiredLanes =
		bit32.bor(ae.expiredLanes, bit32.band(af, ae.pendingLanes))
end
k.markRootExpired = markRootExpired

local function markDiscreteUpdatesExpired(ae: FiberRoot)
	ae.expiredLanes =
		bit32.bor(ae.expiredLanes, bit32.band(G, ae.pendingLanes))
end
k.markDiscreteUpdatesExpired = markDiscreteUpdatesExpired

local function hasDiscreteLanes(ae: Lanes)
	return bit32.band(ae, G) ~= B
end
k.hasDiscreteLanes = hasDiscreteLanes

local function markRootMutableRead(ae: FiberRoot, af: Lane)
	ae.mutableReadLanes =
		bit32.bor(ae.mutableReadLanes, bit32.band(af, ae.pendingLanes))
end
k.markRootMutableRead = markRootMutableRead

local function markRootFinished(ae: FiberRoot, af: Lanes)
	local ag = bit32.band(ae.pendingLanes, bit32.bnot(af))

	ae.pendingLanes = af

	
	ae.suspendedLanes = 0
	ae.pingedLanes = 0

	ae.expiredLanes = bit32.band(ae.expiredLanes, af)
	ae.mutableReadLanes = bit32.band(ae.mutableReadLanes, af)

	ae.entangledLanes = bit32.band(ae.entangledLanes, af)

	local ah = ae.entanglements
	local ai = ae.eventTimes
	local aj = ae.expirationTimes

	
	local ak = ag
	while ak > 0 do
		local al = aa(ak)
		local X = bit32.lshift(1, al)

		ah[al] = B
		ai[al] = U
		aj[al] = U

		ak = bit32.band(ak, bit32.bnot(X))
	end
end
k.markRootFinished = markRootFinished

local function markRootEntangled(ae: FiberRoot, af: Lanes)
	ae.entangledLanes = bit32.bor(ae.entangledLanes, af)

	local ag = ae.entanglements
	local ah = af
	while ah > 0 do
		local ai = aa(ah)
		local aj = bit32.lshift(1, ai)

		ag[ai] = bit32.bor(ag[ai], af)

		ah = bit32.band(ah, bit32.bnot(aj))
	end
end
k.markRootEntangled = markRootEntangled

local function getBumpedLaneForHydration(ae: FiberRoot, af: Lanes): Lane
	getHighestPriorityLanes(af)
	local ag = W

	local ah

	if
		ag == l
		or ag == m
	then
		ah = C
	elseif
		ag == n
		or ag == o
	then
		ah = F
	elseif
		ag == p
		or ag == q
	then
		ah = H
	elseif
		ag == r
		or ag == s
	then
		ah = J
	elseif
		ag == t
		or ag == u
	then
		ah = L
	elseif ag == v then
		
		
		ah = L
	elseif ag == w then
		ah = P
	elseif
		ag == x
		or ag == y
	then
		ah = R
	elseif
		ag == z
		or ag == A
	then
		ah = C
	else
		d(false, "Invalid lane: %s. This is a bug in React.", tostring(ah))
	end

	
	
	
	if bit32.band(ah, bit32.bor(ae.suspendedLanes, af)) ~= C then
		
		return C
	end

	return ah
end
k.getBumpedLaneForHydration = getBumpedLaneForHydration

return k
