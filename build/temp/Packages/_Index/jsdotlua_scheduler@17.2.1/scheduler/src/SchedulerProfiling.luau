










local a = require(script.Parent.Parent:WaitForChild('shared')).console
local b = {}

local c = require(script.Parent:WaitForChild('SchedulerPriorities'))
type PriorityLevel = c.PriorityLevel

local d = require(script.Parent:WaitForChild('SchedulerFeatureFlags'))
local e = d.enableProfiling

local f: number = 0
local g: number = 0


local h = 131072
local i = 524288 


type EventLog = { EventLog | { number } }

local j = 0
local k 
local l: EventLog? 
local m = 1

local n = 1
local o = 2
local p = 3
local q = 4
local r = 5
local s = 6
local t = 7
local u = 8

local function logEvent(v)
	if l ~= nil then
		
		m += #v
		if m + 1 > j then
			j *= 2
			if j > i then
				
				a["error"](
[[Scheduler Profiling: Event log exceeded maximum size. Don't forget to call `stopLoggingProfilingEvents()`.]]				

)
				b.stopLoggingProfilingEvents()
				return
			end
			local w = {}
			table.insert(w, l)
			k = w
			l = w
		end
		table.insert(l, v)
	end
end

b.startLoggingProfilingEvents = function()
	j = h
	k = {}
	l = k
	m = 1
end

b.stopLoggingProfilingEvents = function()
	local v = k
	j = 0
	
	k = nil :: any
	l = nil :: any
	m = 1
	return v
end

b.markTaskStart = function(v, w: number)
	if e then
		if l ~= nil then
			
			
			
			logEvent({ n, w * 1000, v.id, v.priorityLevel })
		end
	end
end

b.markTaskCompleted = function(v, w: number)
	if e then
		if l ~= nil then
			
			
			
			logEvent({ o, w * 1000, v.id })
		end
	end
end

b.markTaskCanceled = function(v, w: number)
	if e then
		if l ~= nil then
			logEvent({ q, w * 1000, v.id })
		end
	end
end

b.markTaskErrored = function(v, w: number)
	if e then
		if l ~= nil then
			logEvent({ p, w * 1000, v.id })
		end
	end
end

b.markTaskRun = function(v, w: number)
	if e then
		f += 1

		if l ~= nil then
			logEvent({ r, w * 1000, v.id, f })
		end
	end
end

b.markTaskYield = function(v, w: number)
	if e then
		if l ~= nil then
			logEvent({ s, w * 1000, v.id, f })
		end
	end
end

b.markSchedulerSuspended = function(v: number)
	if e then
		g += 1

		if l ~= nil then
			logEvent({ t, v * 1000, g })
		end
	end
end

b.markSchedulerUnsuspended = function(v: number)
	if e then
		if l ~= nil then
			logEvent({ u, v * 1000, g })
		end
	end
end

return b
