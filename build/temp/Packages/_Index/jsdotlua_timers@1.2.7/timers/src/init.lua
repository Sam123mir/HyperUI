local a = require(script.Parent:WaitForChild('collections')).Object

local b = require(script:WaitForChild('makeTimerImpl'))
local c = require(script:WaitForChild('makeIntervalImpl'))

export type Timeout = b.Timeout
export type Interval = c.Interval

return a.assign({}, b(task.delay), c(task.delay))
