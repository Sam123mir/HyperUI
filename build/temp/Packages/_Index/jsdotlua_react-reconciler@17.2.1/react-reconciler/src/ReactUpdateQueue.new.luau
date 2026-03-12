























































































local a = _G.__DEV__
local b = _G.__YOLO__

local c = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
local d = c.Object


local e = require(script.Parent.Parent:WaitForChild('shared')).console

local f = require(script.Parent:WaitForChild('ReactInternalTypes'))
type Fiber = f.Fiber
type Lane = f.Lane
type Lanes = f.Lanes

local g = require(script.Parent:WaitForChild('ReactFiberLane'))
local h = g.NoLane
local i = g.NoLanes
local j = g.isSubsetOfLanes
local k = g.mergeLanes


local l 


local function enterDisallowedContextReadInDEV()
	if not l then
		l = require(script.Parent:WaitForChild('ReactFiberNewContext.new')):: any
	end
	l.enterDisallowedContextReadInDEV()
end
local function exitDisallowedContextReadInDEV()
	if not l then
		l = require(script.Parent:WaitForChild('ReactFiberNewContext.new')):: any
	end
	l.exitDisallowedContextReadInDEV()
end
local m = require(script.Parent:WaitForChild('ReactFiberFlags'))
local n = m.Callback
local o = m.ShouldCapture
local p = m.DidCapture

local q = require(script.Parent.Parent:WaitForChild('shared')).ReactFeatureFlags
local r =
	q.debugRenderPhaseSideEffectsForStrictMode

local s = require(script.Parent:WaitForChild('ReactTypeOfMode'))
local t = s.StrictMode

local u =
	require(script.Parent:WaitForChild('ReactFiberWorkInProgress')).markSkippedUpdateLanes




local v = require(script.Parent.Parent:WaitForChild('shared')).describeError

local w = require(script.Parent.Parent:WaitForChild('shared')).ConsolePatchingDev
local x = w.disableLogs
local y = w.reenableLogs


type Array<T> = { [number]: T }


type Update<T> = f.Update<T>
type UpdateQueue<T> = f.UpdateQueue<T>
export type SharedQueue<T> = f.SharedQueue<T>

local z = {}

local A = 0
z.UpdateState = A
local B = 1
z.ReplaceState = B
local C = 2
z.ForceUpdate = C
local D = 3
z.CaptureUpdate = D




local E = false

local F
local G: SharedQueue<any>?

if a then
	F = false
	G = nil
	z.resetCurrentlyProcessingQueue = function()
		G = nil
	end
end


local H = 210 

local I = table.create(H)
local J = H
for K = 1, H do
	I[K] = {
		eventTime = -1,
		lane = -1,
		tag = -1,
		payload = nil,
		callback = nil,
		next = nil,
	}
end

local function initializeUpdateQueue<State>(K: Fiber): ()
	local L: UpdateQueue<State> = {
		baseState = K.memoizedState,
		firstBaseUpdate = nil,
		lastBaseUpdate = nil,
		shared = {
			pending = nil,
		},
		effects = nil,
	}
	K.updateQueue = L
end
z.initializeUpdateQueue = initializeUpdateQueue

local function cloneUpdateQueue<State>(K: Fiber, L: Fiber): ()
	
	local M: UpdateQueue<State> = L.updateQueue :: any
	local N: UpdateQueue<State> = K.updateQueue :: any
	if M == N then
		
		local O: UpdateQueue<State> = table.clone(N)
		
		L.updateQueue = O
	end
end
z.cloneUpdateQueue = cloneUpdateQueue


local function createUpdate(
	K: number,
	L: Lane,
	M: any?,
	N: (() -> ...any)?
): Update<any>
	
	if J > 0 then
		local O = I[J]
		I[J] = nil
		J -= 1

		O.eventTime = K
		O.lane = L
		O.tag = A
		O.payload = M
		O.callback = N :: any

		return O :: Update<any>
	end
	

	
	
	
	

	
	
	
	
	
	
	
	

	local O = {
		eventTime = K,
		lane = L,

		tag = A,
		payload = M,
		callback = N :: any,

		next = nil,
	}
	return O :: Update<any>
end
z.createUpdate = createUpdate

local function enqueueUpdate<State>(K: Fiber, L: Update<State>)
	local M = K.updateQueue
	if M == nil then
		
		return
	end

	local N: SharedQueue<State> = (M :: any).shared
	local O = N.pending
	if O == nil then
		
		L.next = L
	else
		L.next = O.next
		O.next = L
	end
	N.pending = L

	if a then
		if G == N and not F then
			e.error(
[[An update (setState, replaceState, or forceUpdate) was scheduled from inside an update function. Update functions should be pure, with zero side-effects. Consider using componentDidUpdate or a callback.]]			



)
			F = true
		end
	end
end
z.enqueueUpdate = enqueueUpdate

local function enqueueCapturedUpdate<State>(K: Fiber, L: Update<State>)
	
	
	
	local M: UpdateQueue<State> = K.updateQueue :: any

	
	local N = K.alternate
	if N ~= nil then
		local O: UpdateQueue<State> = N.updateQueue :: any
		if M == O then
			
			
			
			
			
			
			local P 			
local Q 			
local R = M.firstBaseUpdate
			if R ~= nil then
				
				local S = R
				repeat
					local T: Update<State> = {
						eventTime = S.eventTime,
						lane = S.lane,

						tag = S.tag,
						payload = S.payload,
						callback = S.callback,

						next = nil,
					}
					if Q == nil then
						Q = T
						P = T
					else
						Q.next = T
						Q = T
					end
					
					S = S.next :: Update<State>
				until S == nil

				
				if Q == nil then
					Q = L
					P = L
				else
					Q.next = L
					Q = L
				end
			else
				
				Q = L
				P = L
			end
			M = {
				baseState = O.baseState,
				firstBaseUpdate = P,
				lastBaseUpdate = Q,
				shared = O.shared,
				effects = O.effects,
			}
			K.updateQueue = M
			return
		end
	end

	
	local O = M.lastBaseUpdate
	if O == nil then
		M.firstBaseUpdate = L
	else
		O.next = L
	end
	M.lastBaseUpdate = L
end
z.enqueueCapturedUpdate = enqueueCapturedUpdate

local function getStateFromUpdate<State>(
	K: Fiber,
	L: UpdateQueue<State>,
	M: Update<State>,
	N: State,
	O: any,
	P: any
): any
	local Q = M.tag
	if Q == B then
		local R = M.payload
		if type(R) == "function" then
			
			if a then
				enterDisallowedContextReadInDEV()
			end
			
			
			
			local S = R(N, O)
			if a then
				if
					r
					and bit32.band(K.mode, t) ~= 0
				then
					x()
					
					local T, U
					if not b then
						T, U = xpcall(R, v, N, O)
					else
						T = true
						R(N, O)
					end
					
					y()

					if not T then
						error(U)
					end
				end
				exitDisallowedContextReadInDEV()
			end
			return S
		end
		
		return R
	elseif Q == D or Q == A then
		if Q == D then
			K.flags = bit32.bor(
				bit32.band(K.flags, bit32.bnot(o)),
				p
			)
		end
		
		local R = M.payload
		local S
		if type(R) == "function" then
			
			if a then
				enterDisallowedContextReadInDEV()
			end
			
			
			
			S = R(N, O)
			if a then
				if
					r
					and bit32.band(K.mode, t) ~= 0
				then
					x()
					
					local T, U
					if not b then
						T, U = xpcall(R, v, N, O)
					else
						T = true
						R(N, O)
					end
					
					y()

					if not T then
						error(U)
					end
				end
				exitDisallowedContextReadInDEV()
			end
		else
			
			S = R
		end
		if S == nil then
			
			return N
		end
		
		
		
		return d.assign({}, N, S)
	elseif Q == C then
		E = true
		return N
	end
	return N
end
z.getStateFromUpdate = getStateFromUpdate

local function processUpdateQueue<State>(
	K: Fiber,
	L: any,
	M: any,
	N: Lanes
): ()
	
	local O: UpdateQueue<State> = K.updateQueue :: any

	E = false

	if a then
		G = O.shared
	end

	local P = O.firstBaseUpdate
	local Q = O.lastBaseUpdate

	
	local R = O.shared.pending
	if R ~= nil then
		O.shared.pending = nil

		
		
		local S = R
		local T = S.next
		S.next = nil
		
		if Q == nil then
			P = T
		else
			Q.next = T
		end
		Q = S

		
		
		
		
		
		local U = K.alternate
		if U ~= nil then
			
			local V: UpdateQueue<State> = U.updateQueue :: any
			local W = V.lastBaseUpdate
			if W ~= Q then
				if W == nil then
					V.firstBaseUpdate = T
				else
					W.next = T
				end
				V.lastBaseUpdate = S
			end
		end
	end

	
	if P ~= nil then
		
		local S = O.baseState
		
		
		local T = i

		local U 		
local V 		
local W 
		
local X = P
		while true do
			local Y = X.lane
			local Z = X.eventTime
			if not j(N, Y) then
				
				
				
				local _: Update<State> = {
					eventTime = Z,
					lane = Y,

					tag = X.tag,
					payload = X.payload,
					callback = X.callback,

					next = nil,
				}
				if W == nil then
					V = _
					W = _
					U = S
				else
					W.next = _
					W = _
				end
				
				T = k(T, Y)
			else
				

				if W ~= nil then
					local _: Update<State> = {
						eventTime = Z,
						
						
						
						lane = h,

						tag = X.tag,
						payload = X.payload,
						callback = X.callback,

						next = nil,
					}
					W.next = _
					W = _
				end

				
				S = getStateFromUpdate(
					K,
					O,
					X,
					S,
					L,
					M
				)
				local _ = X.callback
				if
					_ ~= nil
					
					
					and X.lane ~= h
				then
					K.flags = bit32.bor(K.flags, n)
					local aa = O.effects
					if aa == nil then
						O.effects = { X }
					else
						table.insert(aa, X)
					end
				end
			end
			
			X = X.next :: Update<State>
			if X == nil then
				R = O.shared.pending
				if R == nil then
					break
				else
					
					
					local aa = R
					
					
					local _ = (
						aa.next :: any
					) :: Update<State>
					aa.next = nil
					X = _
					O.lastBaseUpdate = aa
					O.shared.pending = nil
				end
			end
		end

		if W == nil then
			U = S
		end

		O.baseState = (U :: any) :: State
		O.firstBaseUpdate = V
		O.lastBaseUpdate = W

		
		
		
		
		
		
		
		u(T)
		K.lanes = T
		K.memoizedState = S
	end

	if a then
		G = nil
	end
end
z.processUpdateQueue = processUpdateQueue

local function callCallback(aa, K)
	
	if type(aa) ~= "function" then
		error(
			string.format(
[[Invalid argument passed as callback. Expected a function. Instead received: %s]]
,
				tostring(aa)
			)
		)
		
	end
	aa(K)
end

z.resetHasForceUpdateBeforeProcessing = function()
	E = false
end

z.checkHasForceUpdateAfterProcessing = function(): boolean
	return E
end

local function commitUpdateQueue<State>(
	aa: Fiber,
	K: UpdateQueue<State>,
	L: any
): ()
	
	local M = K.effects
	K.effects = nil
	if M ~= nil then
		for N, O in M do
			local P = O.callback
			if P ~= nil then
				callCallback(P, L)
			end

			
			table.clear(O)
			table.insert(I, O :: any)
			J += 1
		end
	end
end
z.commitUpdateQueue = commitUpdateQueue

return z
