










local a = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
local b = a.Number
local c = a.Error


local d = require(script.Parent.Parent:WaitForChild('shared')).console

local e = require(script.Parent.Parent:WaitForChild('shared'))
type ReactContext<T> = e.ReactContext<T>
local f = require(script.Parent:WaitForChild('ReactInternalTypes'))
type Fiber = f.Fiber
type ContextDependency<T> = f.ContextDependency<T>

local g = require(script.Parent:WaitForChild('ReactFiberStack.new'))
type StackCursor<T> = g.StackCursor<T>
local h = require(script.Parent:WaitForChild('ReactFiberLane'))
type Lanes = h.Lanes
local i = require(script.Parent:WaitForChild('ReactUpdateQueue.new'))
type SharedQueue<T> = i.SharedQueue<T>

local j = require(script.Parent:WaitForChild('ReactFiberHostConfig'))
local k = j.isPrimaryRenderer
local l = g.createCursor
local m = g.push
local n = g.pop
local o = require(script.Parent:WaitForChild('MaxInts')).MAX_SIGNED_31_BIT_INT
local p = require(script.Parent:WaitForChild('ReactWorkTags'))
local q = p.ContextProvider
local r = p.ClassComponent

local s = h.NoLanes
local t = h.NoTimestamp
local u = h.isSubsetOfLanes
local v = h.includesSomeLane
local w = h.mergeLanes
local x = h.pickArbitraryLane

local y = require(script.Parent.Parent:WaitForChild('shared')).objectIs
local z = i.createUpdate
local A = i.ForceUpdate




local B = {}

local C: StackCursor<any> = l(nil)

local D
if _G.__DEV__ then
	
	D = {}
end

local E: Fiber | nil 
local F: ContextDependency<any> | nil 
local G: ReactContext<any> | nil 

local H: boolean = false

B.resetContextDependencies = function(): ()
	
	
	E = nil
	F = nil
	G = nil
	if _G.__DEV__ then
		H = false
	end
end

B.enterDisallowedContextReadInDEV = function(): ()
	if _G.__DEV__ then
		H = true
	end
end

B.exitDisallowedContextReadInDEV = function(): ()
	if _G.__DEV__ then
		H = false
	end
end

B.pushProvider = function<T>(I: Fiber, J: T): ()
	local K: ReactContext<T> = I.type._context

	if k then
		m(C, K._currentValue, I)

		K._currentValue = J
		if _G.__DEV__ then
			if
				K._currentRenderer ~= nil
				and K._currentRenderer ~= D
			then
				d.error(
[[Detected multiple renderers concurrently rendering the same context provider. This is currently unsupported.]]				

)
			end
			K._currentRenderer = D
		end
	else
		m(C, K._currentValue2, I)

		K._currentValue2 = J
		if _G.__DEV__ then
			if
				K._currentRenderer2 ~= nil
				and K._currentRenderer2 ~= D
			then
				d.error(
[[Detected multiple renderers concurrently rendering the same context provider. This is currently unsupported.]]				

)
			end
			K._currentRenderer2 = D
		end
	end
end

B.popProvider = function(I: Fiber)
	local J = C.current

	n(C, I)

	local K: ReactContext<any> = I.type._context
	if k then
		K._currentValue = J
	else
		K._currentValue2 = J
	end
end

B.calculateChangedBits =
	function<T>(I: ReactContext<T>, J: T, K: T)
		if y(K, J) then
			
			return 0
		else
			
			local L = o
			if typeof(I._calculateChangedBits) == "function" then
				L = I._calculateChangedBits(K, J)
			end

			
			
			
			
			
			
			
			
			
			
			
			
			return math.floor(L)
		end
	end

B.scheduleWorkOnParentPath = function(I: Fiber | nil, J: Lanes)
	
	local K = I
	while K ~= nil do
		local L = K.alternate
		if not u(K.childLanes, J) then
			K.childLanes = w(K.childLanes, J)
			if L ~= nil then
				L.childLanes = w(L.childLanes, J)
			end
		elseif
			L ~= nil and not u(L.childLanes, J)
		then
			L.childLanes = w(L.childLanes, J)
		else
			
			
			break
		end
		K = K.return_
	end
end

B.propagateContextChange = function<T>(
	I: Fiber,
	J: ReactContext<T>,
	K: number,
	L: Lanes
): ()
	local M = I.child
	if M ~= nil then
		
		M.return_ = I
	end
	while M ~= nil do
		local N

		
		local O = M.dependencies
		if O ~= nil then
			N = M.child

			local P = O.firstContext
			while P ~= nil do
				
				if
					P.context == J
					
					and bit32.band(P.observedBits, K) ~= 0
				then
					

					if M.tag == r then
						
						local Q =
							z(t, x(L))
						Q.tag = A
						
						
						
						

						
						local R = M.updateQueue
						if R == nil then
						
						else
							local S: SharedQueue<any> = (R :: any).shared
							local T = S.pending
							if T == nil then
								
								Q.next = Q
							else
								Q.next = T.next
								T.next = Q
							end
							S.pending = Q
						end
					end

					
					M.lanes = bit32.bor(M.lanes, L)
					local Q = M.alternate
					if Q ~= nil then
						
						Q.lanes = bit32.bor(Q.lanes, L)
					end
					B.scheduleWorkOnParentPath(M.return_, L)

					
					
					O.lanes = bit32.bor(O.lanes, L)

					
					
					break
				end
				P = P.next
			end
		elseif M.tag == q then
			
			if M.type == I.type then
				N = nil
			else
				N = M.child
			end
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		else
			
			N = M.child
		end

		if N ~= nil then
			
			N.return_ = M
		else
			
			N = M
			while N ~= nil do
				if N == I then
					
					N = nil
					break
				end
				local P = N.sibling
				if P ~= nil then
					
					P.return_ = N.return_
					N = P
					break
				end
				
				N = N.return_
			end
		end
		M = N
	end
end


B.prepareToReadContext = function(
	I: Fiber,
	J: Lanes,
	K: () -> ()
): ()
	E = I
	F = nil
	G = nil

	local L = I.dependencies
	if L ~= nil then
		local M = L.firstContext
		if M ~= nil then
			if v(L.lanes, J) then
				
				K()
			end
			
			L.firstContext = nil
		end
	end
end

B.readContext =
	function<T>(I: ReactContext<T>, J: nil | number | boolean): T
		if _G.__DEV__ then
			
			
			if H then
				d.error(
[[Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().]]				



)
			end
		end

		if G == I then
		
		elseif J == false or J == 0 then
		
		else
			local K 
			if
				typeof(J) ~= "number"
				or J == b.MAX_SAFE_INTEGER
			then
				
				
				G = I
				K = b.MAX_SAFE_INTEGER
			else
				K = J
			end

			local L = {
				
				context = I,
				observedBits = K,
				next = nil,
			}

			if F == nil then
				if E == nil then
					error(
						c.new(
[[Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().]]						



)
					)
				end

				
				F = L;
				(E :: Fiber).dependencies = {
					lanes = s,
					firstContext = L,
					responders = nil,
				}
			else
				
				(F :: any).next = L
				F = L
			end
		end
		return if k then I._currentValue else I._currentValue2
	end

return B
