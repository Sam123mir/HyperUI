










type Function = (any) -> any
local a = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
type Set<T> = a.Set<T>
local b = a.Set
local c = {}

local d = require(script.Parent.Parent:WaitForChild('shared')).ReactFeatureFlags
local e = d.enableSchedulerTracing

export type Interaction = {
	__count: number,
	id: number,
	name: string,
	timestamp: number
}

export type Subscriber = {
	
	onInteractionTraced: (Interaction) -> (),

	
	onInteractionScheduledWorkCompleted: (Interaction) -> (),

	
	
	
	
	
	onWorkScheduled: (Set<Interaction>, number) -> (),

	
	
	onWorkCanceled: (Set<Interaction>, number) -> (),

	
	
	
	
	
	
	onWorkStarted: (Set<Interaction>, number) -> (),

	
	
	onWorkStopped: (Set<Interaction>, number) -> ()	

}

export type InteractionsRef = { current: Set<Interaction> }

export type SubscriberRef = { current: Subscriber | nil }

local f = 0


local g: number = 0
local h: number = 0





local i: InteractionsRef


local j: SubscriberRef

if e then
	i = {
		current = b.new(),
	}
	j = {
		current = nil,
	}
end

c.__interactionsRef = i
c.__subscriberRef = j

c.unstable_clear = function(k: Function)
	if not e then
		return k()
	end

	local l = i.current
	i.current = b.new()

	
	local m, n = pcall(k)
	
	i.current = l

	if not m then
		error(n)
	end

	return n
end

c.unstable_getCurrent = function(): Set<Interaction> | nil
	if not e then
		return nil
	else
		return i.current
	end
end

c.unstable_getThreadID = function(): number
	h += 1
	return h
end

c.unstable_trace =
	function(k: string, l: number, m: Function, n: number?): any
		
		local o = if n ~= nil then n else f

		if not e then
			return m()
		end

		local p: Interaction = {
			__count = 1,
			id = g,
			name = k,
			timestamp = l,
		}
		g += 1

		local q = i.current

		
		
		
		local r = b.new(q)
		r:add(p)
		i.current = r

		local s = j.current
		local t

		
		local u, v = pcall(function()
			if s ~= nil then
				s.onInteractionTraced(p)
			end
		end)
		
		
		local w, x = pcall(function()
			if s ~= nil then
				s.onWorkStarted(r, o)
			end
		end)

		
		
		local y, z = pcall(function()
			t = m()
		end)
		
		i.current = q
		
		local A, B = pcall(function()
			if s ~= nil then
				s.onWorkStopped(r, o)
			end
		end)
		
		p.__count -= 1

		
		
		if s ~= nil and p.__count == 0 then
			s.onInteractionScheduledWorkCompleted(p)
		end

		if not A then
			error(B)
		end

		if not y then
			error(z)
		end

		if not w then
			error(x)
		end

		if not u then
			error(v)
		end

		return t
	end

c.unstable_wrap = function(
	k: Function,
	l: number
): any 
	
	if l == nil then
		l = f
	end

	if not e then
		return k
	end

	local m = i.current

	local n = j.current
	if n ~= nil then
		n.onWorkScheduled(m, l)
	end

	
	
	for o, p in m do
		p.__count += 1
	end

	local o = false

	local function _wrapped(p, ...)
		local q = i.current
		i.current = m

		n = j.current

		
		local r, s = pcall(function(...)
			local r

			
			local s, t = pcall(function()
				if n ~= nil then
					n.onWorkStarted(m, l)
				end
			end)
			
			
			local u, v = pcall(function(...)
				r = k(...)
			end, ...)
			
			i.current = q

			if n ~= nil then
				n.onWorkStopped(m, l)
			end

			if not u then
				error(v)
			end

			if not s then
				error(t)
			end

			return r
		end, ...)

		
		if not o then
			
			
			
			o = true

			
			
			
			for t, u in m do
				u.__count -= 1

				if n ~= nil and u.__count == 0 then
					n.onInteractionScheduledWorkCompleted(u)
				end
			end
		end

		if not r then
			error(s)
		end

		return s
	end

	local p = function()
		n = j.current

		local p, q = pcall(function()
			if n ~= nil then
				n.onWorkCanceled(m, l)
			end
		end)
		
		
		
		
		for r, s in m do
			s.__count -= 1

			if n ~= nil and s.__count == 0 then
				n.onInteractionScheduledWorkCompleted(s)
			end
		end

		if not p then
			error(q)
		end
	end

	local q = {}
	setmetatable(q, {
		__call = _wrapped,
	})
	q.cancel = p

	return q
end

return c
