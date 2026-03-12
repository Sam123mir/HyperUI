










return function(a)
	local b = require(script.Parent.Parent:WaitForChild('shared')).describeError

	local c = require(script.Parent:WaitForChild('SchedulerFeatureFlags'))	
local d = c.enableSchedulerDebugging
	local e = c.enableProfiling

	local f = a or require(script.Parent:WaitForChild('SchedulerHostConfig'))	
local g = f.requestHostCallback
	local h = f.requestHostTimeout
	local i = f.cancelHostTimeout
	local j = f.shouldYieldToHost
	local k = f.getCurrentTime
	local l = f.forceFrameRate
	local m = f.requestPaint

	
	
	
	
	
	type Heap = { [number]: Node? }
	type Node = {
		id: number,
		sortIndex: number	
}

	
	local n, o, p

	local q = function(q: Heap, r: Node): ()
		local s = #q + 1
		q[s] = r

		o(q, r, s)
	end

	local r = function(r: Heap): Node?
		return r[1]
	end

	local s = function(s: Heap): Node?
		local t = s[1]
		if t ~= nil then
			local u = s[#s]
			s[#s] = nil

			if u :: Node ~= t :: Node then
				s[1] = u
				p(s, u :: Node, 1)
			end
			return t
		else
			return nil
		end
	end

	o = function(t: Heap, u: Node, v: number): ()
		while true do
			local w = math.floor(v / 2)
			local x = t[w]
			if x ~= nil and n(x :: Node, u :: Node) > 0 then
				
				t[w] = u
				t[v] = x
				v = w
			else
				
				return
			end
		end
	end

	p = function(t: Heap, u: Node, v: number): ()
		local w = #t
		while v < w do
			local x = v * 2
			local y = t[x]
			local z = x + 1
			local A = t[z]

			
			if y ~= nil and n(y :: Node, u) < 0 then
				if A ~= nil and n(A :: Node, y :: Node) < 0 then
					t[v] = A
					t[z] = u
					v = z
				else
					t[v] = y
					t[x] = u
					v = x
				end
			elseif A ~= nil and n(A :: Node, u :: Node) < 0 then
				t[v] = A
				t[z] = u
				v = z
			else
				
				return
			end
		end
	end

	n = function(t: Node, u: Node): number
		
		local v = t.sortIndex - u.sortIndex

		if v == 0 then
			return t.id - u.id
		end

		return v
	end

	
	local t = require(script.Parent:WaitForChild('SchedulerPriorities'))	
local u = t.ImmediatePriority
	local v = t.UserBlockingPriority
	local w = t.NormalPriority
	local x = t.LowPriority
	local y = t.IdlePriority

	local z = require(script.Parent:WaitForChild('SchedulerProfiling'))	
local A = z.markTaskRun
	local B = z.markTaskYield
	local C = z.markTaskCompleted
	local D = z.markTaskCanceled
	local E = z.markTaskErrored
	local F = z.markSchedulerSuspended
	local G = z.markSchedulerUnsuspended
	local H = z.markTaskStart
	local I = z.stopLoggingProfilingEvents
	local J = z.startLoggingProfilingEvents

	
	
	
	local K = 1073741823

	
	local L = -1	

local M = 250
	local N = 5000
	local O = 10000
	
	local P = K

	
	local Q = {}
	local R = {}

	
	local S = 1

	
	local T = false

	local U 	
local V = w

	
	local W = false

	local X = false
	local Y = false

	
	local Z, _, aa

	local function advanceTimers(ab)
		
		local ac = r(R)

		while ac ~= nil do
			if ac.callback == nil then
				
				s(R)
			elseif ac.startTime <= ab then
				
				s(R)
				ac.sortIndex = ac.expirationTime
				q(Q, ac)
				if e then
					H(ac, ab)
					ac.isQueued = true
				end
			else
				
				return
			end

			ac = r(R)
		end
	end

	Z = function(ab)
		Y = false
		advanceTimers(ab)

		if not X then
			if r(Q) ~= nil then
				X = true
				g(_)
			else
				local ac = r(R)
				if ac ~= nil then
					h(Z, ac.startTime - ab)
				end
			end
		end
	end

	_ = function(ab, ac)
		if e then
			G(ac)
		end

		
		X = false
		if Y then
			
			Y = false
			i()
		end

		W = true
		local ad = V

		
		local ae, af
		if not _G.__YOLO__ then
			
			if e then
				ae, af =
					xpcall(aa, b, ab, ac)

				if not ae then
					if U ~= nil then
						local ag = k()
						E(U, ag)
						U.isQueued = false
					end
				end
			else
				
				ae = true
				af = aa(ab, ac)
			end
		else
			ae = true
			af = aa(ab, ac)
		end

		
		U = nil
		V = ad
		W = false
		if e then
			local ag = k()
			F(ag)
		end

		if not ae then
			error(af)
		end

		return af
	end

	aa = function(ab, ac)
		local ad = ac
		advanceTimers(ad)
		U = r(Q)
		while
			U ~= nil and not (d and T)
		do
			if
				U.expirationTime > ad
				and (not ab or j())
			then
				
				break
			end

			local ae = U.callback
			if typeof(ae) == "function" then
				U.callback = nil
				V = U.priorityLevel
				local af = U.expirationTime <= ad
				A(U, ad)
				local ag = ae(af)
				ad = k()
				if typeof(ag) == "function" then
					U.callback = ag
					B(U, ad)
				else
					if e then
						C(U, ad)
						U.isQueued = false
					end

					if U == r(Q) then
						s(Q)
					end
				end
				advanceTimers(ad)
			else
				s(Q)
			end

			U = r(Q)
		end

		
		if U ~= nil then
			return true
		else
			local ae = r(R)
			if ae ~= nil then
				h(Z, ae.startTime - ad)
			end

			return false
		end
	end

	local function unstable_runWithPriority(ab, ac)
		if
			ab == u
			or ab == v
			or ab == w
			or ab == x
			or ab == y
		then
			
		else
			ab = w
		end

		local ad = V
		V = ab

		
		local ae, af
		if not _G.__YOLO__ then
			ae, af = xpcall(ac, b)
		else
			ae = true
			af = ac()
		end

		
		V = ad

		if not ae then
			error(af)
		end

		return af
	end

	local function unstable_next(ab)
		local ac
		if
			V == u
			or V == v
			or V == w
		then
			
			ac = w
		else
			
			ac = V
		end

		local ad = V
		V = ac

		
		local ae, af
		if not _G.__YOLO__ then
			ae, af = xpcall(ab, b)
		else
			ae = true
			af = ab()
		end

		
		V = ad

		if not ae then
			error(af)
		end

		return af
	end

	local function unstable_wrapCallback(ab)
		local ac = V

		return function(...)
			
			local ad = V
			V = ac

			
			local ae, af
			if not _G.__YOLO__ then
				ae, af = xpcall(ab, b, ...)
			else
				ae = true
				af = ab(...)
			end

			
			V = ad

			if not ae then
				error(af)
			end

			return af
		end
	end

	local function unstable_scheduleCallback(ab, ac, ad)
		local ae = k()

		local af

		if typeof(ad) == "table" then
			local ag = ad.delay
			if typeof(ag) == "number" and ag > 0 then
				af = ae + ag
			else
				af = ae
			end
		else
			af = ae
		end

		local ag
		if ab == u then
			ag = L
		elseif ab == v then
			ag = M
		elseif ab == y then
			ag = P
		elseif ab == x then
			ag = O
		else
			ag = N
		end

		local ah = af + ag

		local ai = {
			id = S,
			callback = ac,
			priorityLevel = ab,
			startTime = af,
			expirationTime = ah,
			sortIndex = -1,
		}
		S += 1

		if e then
			ai.isQueued = false
		end

		if af > ae then
			
			ai.sortIndex = af
			q(R, ai)
			
			if #Q == 0 and ai == r(R) then
				
				if Y then
					
					i()
				else
					Y = true
				end
				
				h(Z, af - ae)
			end
		else
			ai.sortIndex = ah
			q(Q, ai)
			if e then
				H(ai, ae)
				ai.isQueued = true
			end

			
			
			if not X and not W then
				X = true
				g(_)
			end
		end

		return ai
	end

	local function unstable_pauseExecution()
		T = true
	end

	local function unstable_continueExecution()
		T = false
		if not X and not W then
			X = true
			g(_)
		end
	end

	local function unstable_getFirstCallbackNode()
		return r(Q)
	end

	local function unstable_cancelCallback(ab)
		if e then
			if ab.isQueued then
				local ac = k()
				D(ab, ac)
				ab.isQueued = false
			end
		end

		
		
		
		ab.callback = nil
	end

	local function unstable_getCurrentPriorityLevel()
		return V
	end

	local ab = m

	return {
		unstable_ImmediatePriority = u,
		unstable_UserBlockingPriority = v,
		unstable_NormalPriority = w,
		unstable_IdlePriority = y,
		unstable_LowPriority = x,
		unstable_runWithPriority = unstable_runWithPriority,
		unstable_next = unstable_next,
		unstable_scheduleCallback = unstable_scheduleCallback,
		unstable_cancelCallback = unstable_cancelCallback,
		unstable_wrapCallback = unstable_wrapCallback,
		unstable_getCurrentPriorityLevel = unstable_getCurrentPriorityLevel,
		unstable_shouldYield = j,
		unstable_requestPaint = ab,
		unstable_continueExecution = unstable_continueExecution,
		unstable_pauseExecution = unstable_pauseExecution,
		unstable_getFirstCallbackNode = unstable_getFirstCallbackNode,
		unstable_now = k,
		unstable_forceFrameRate = l,
		
		unstable_Profiling = (function()
			if e then
				return {
					startLoggingProfilingEvents = J,
					stopLoggingProfilingEvents = I,
				}
			end
			return nil
		end)(),
	}
end
