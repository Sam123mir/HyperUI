






local a = require(script.Parent:WaitForChild('Tracing'))
local b = require(script.Parent:WaitForChild('TracingSubscriptions'))

export type Interaction = a.Interaction

local c = require(script.Parent:WaitForChild('Scheduler'))
local d = require(script.Parent:WaitForChild('forks'):WaitForChild('SchedulerHostConfig.mock'))

local e = c(d)

local f = {}
f.tracing = {}

for g, h in e :: any do
	f[g] = h
end
for g, h in a :: any do
	f.tracing[g] = h
end
for g, h in b :: any do
	f.tracing[g] = h
end

f.unstable_flushAllWithoutAsserting = d.unstable_flushAllWithoutAsserting
f.unstable_flushNumberOfYields = d.unstable_flushNumberOfYields
f.unstable_flushExpired = d.unstable_flushExpired
f.unstable_clearYields = d.unstable_clearYields
f.unstable_flushUntilNextPaint = d.unstable_flushUntilNextPaint
f.unstable_flushAll = d.unstable_flushAll
f.unstable_yieldValue = d.unstable_yieldValue
f.unstable_advanceTime = d.unstable_advanceTime
f.unstable_Profiling = e.unstable_Profiling

return f
