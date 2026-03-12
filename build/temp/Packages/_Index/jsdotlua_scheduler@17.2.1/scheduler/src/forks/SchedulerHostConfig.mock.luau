









local a = {}

local b: number = 0
local c: ((boolean, number) -> ()) | nil 
local d: ((number) -> ()) | nil 
local e: number = -1
local f: { [number]: any } | nil 
local g: number = -1
local h: boolean = false
local i: boolean = false
local j: boolean = false
local k: boolean = false
local l = require(script.Parent.Parent.Parent:WaitForChild('shared')).console
local m = require(script.Parent.Parent.Parent:WaitForChild('shared')).ConsolePatchingDev
local n = m.disabledLog

a.requestHostCallback = function(o: (boolean) -> ())
	c = o
end

a.cancelHostCallback = function()
	c = nil
end

a.requestHostTimeout = function(o: (number) -> (), p: number)
	d = o
	e = b + p
end

a.cancelHostTimeout = function()
	d = nil
	e = -1
end

a.shouldYieldToHost = function(): boolean
	
	
	local o: any = f
	if
		(
			g ~= -1
and o ~= nil
			and #o >= g
		) or (k and j)
	then
		
		h = true
		return true
	end

	return false
end

a.getCurrentTime = function(): number
	return b
end

a.forceFrameRate = function()
	
end

a.reset = function()
	if i then
		error("Cannot reset while already flushing work.")
	end

	b = 0
	c = nil
	d = nil
	e = -1
f = nil
	g = -1
h = false
	i = false
	j = false
end


a.unstable_flushNumberOfYields = function(o: number)
	if i then
		error("Already flushing work.")
	end

	if c ~= nil then
		local p = c
		g = o
		i = true

		local q, r = pcall(function()
			local q = true
			repeat
				q = p(true, b)
			until not q or h

			if not q then
				c = nil
			end
		end)

		g = -1
h = false
		i = false

		if not q then
			error(r)
		end
	end
end

a.unstable_flushUntilNextPaint = function()
	if i then
		error("Already flushing work.")
	end

	if c ~= nil then
		local o = c
		k = true
		j = false
		i = true
		
		local p, q = pcall(function()
			local p = true
			repeat
				p = o(true, b)
			until not p or h

			if not p then
				c = nil
			end
		end)

		
		k = false
		h = false
		i = false

		if not p then
			error(q)
		end
	end
end

a.unstable_flushExpired = function()
	if i then
		error("Already flushing work.")
	end
	if c ~= nil then
		i = true
		local o, p = pcall(function()
			
			
			local o: any = c
			local p = o(false, b)
			if not p then
				c = nil
			end
		end)

		i = false

		if not o then
			error(p)
		end
	end
end

a.unstable_flushAllWithoutAsserting = function(): boolean
	
	if i then
		error("Already flushing work.")
	end
	if c ~= nil then
		local o = c
		i = true
		local p, q = pcall(function()
			local p = true
			repeat
				p = o(true, b)
			until not p

			if not p then
				c = nil
			end
		end)

		i = false

		if not p then
			error(q)
		end

		return true
	else
		return false
	end
end

a.unstable_clearYields = function(): { [number]: any }
	if f == nil then
		return {}
	end
	local o = f
	f = nil
	return o
end

a.unstable_flushAll = function()
	if f ~= nil then
		error(
[[Log is not empty. Assert on the log of yielded values before flushing additional work.]]		

)
	end
	a.unstable_flushAllWithoutAsserting()
	if f ~= nil then
		error(
[[While flushing work, something yielded a value. Use an assertion helper to assert on the log of yielded values, e.g. expect(Scheduler).toFlushAndYield([...])]]		


)
	end
end

a.unstable_yieldValue = function(o: any)
	
	if l.log == n then
		
		
		return
	end
	if f == nil then
		f = { o }
	else
		
		
		local p: any = f
		table.insert(p, o)
	end
end

a.unstable_advanceTime = function(o: number)
	
	if l.log == n then
		
		
		return
	end
	b += o

	if d ~= nil and e <= b then
		
		
		local p: any = d
		p(b)
		e = -1
d = nil
	end
end

a.requestPaint = function()
	j = true
end

return a
