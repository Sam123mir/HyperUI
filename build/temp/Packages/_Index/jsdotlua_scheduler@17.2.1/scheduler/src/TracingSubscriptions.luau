








type Set<T> = { [T]: boolean? }
type Array<T> = { [number]: T }
local a = {}
local b = require(script.Parent.Parent:WaitForChild('luau-polyfill')).Object

local c = require(script.Parent:WaitForChild('Tracing'))
type Interaction = c.Interaction
type Subscriber = c.Subscriber

local d = require(script.Parent.Parent:WaitForChild('shared')).ReactFeatureFlags

local e = d.enableSchedulerTracing
local f = c.__subscriberRef

local g: Set<Subscriber> = {}
if e then
	g = {}
end

a.unstable_subscribe = function(h: Subscriber): ()
	if e then
		g[h] = true

		if #b.keys(g) == 1 then
			f.current = {
				onInteractionScheduledWorkCompleted = onInteractionScheduledWorkCompleted,
				onInteractionTraced = onInteractionTraced,
				onWorkCanceled = onWorkCanceled,
				onWorkScheduled = onWorkScheduled,
				onWorkStarted = onWorkStarted,
				onWorkStopped = onWorkStopped,
			}
		end
	end
end

a.unstable_unsubscribe = function(h: Subscriber): ()
	if e then
		g[h] = nil

		if #b.keys(g) == 0 then
			f.current = nil
		end
	end
end

function onInteractionTraced(h: Interaction): ()
	local i = false
	local j 
	
for k, l in g do
		
		local m, n = pcall(k.onInteractionTraced, h)
		
		if not m then
			local o = n
			if not i then
				i = true
				j = o
			end
		end
	end

	if i then
		error(j)
	end
end

function onInteractionScheduledWorkCompleted(h: Interaction): ()
	local i = false
	local j 
	
for k, l in g do
		
		local m, n =
			pcall(k.onInteractionScheduledWorkCompleted, h)
		
		if not m then
			local o = n
			if not i then
				i = true
				j = o
			end
		end
	end

	if i then
		error(j)
	end
end

function onWorkScheduled(h: Set<Interaction>, i: number): ()
	local j = false
	local k 
	
for l, m in g do
		
		local n, o = pcall(l.onWorkScheduled, h, i)
		
		if not n then
			local p = o
			if not j then
				j = true
				k = p
			end
		end
	end

	if j then
		error(k)
	end
end

function onWorkStarted(h: Set<Interaction>, i: number): ()
	local j = false
	local k 
	
for l, m in g do
		
		local n, o = pcall(l.onWorkStarted, h, i)
		
		if not n then
			local p = o
			if not j then
				j = true
				k = p
			end
		end
	end

	if j then
		error(k)
	end
end

function onWorkStopped(h: Set<Interaction>, i: number): ()
	local j = false
	local k 
	
for l, m in g do
		
		local n, o = pcall(l.onWorkStopped, h, i)
		
		if not n then
			local p = o
			if not j then
				j = true
				k = p
			end
		end
	end

	if j then
		error(k)
	end
end

function onWorkCanceled(h: Set<Interaction>, i: number): ()
	local j = false
	local k 
	
for l, m in g do
		
		local n, o = pcall(l.onWorkCanceled, h, i)
		
		if not n then
			local p = o
			if not j then
				j = true
				k = p
			end
		end
	end

	if j then
		error(k)
	end
end

return a
