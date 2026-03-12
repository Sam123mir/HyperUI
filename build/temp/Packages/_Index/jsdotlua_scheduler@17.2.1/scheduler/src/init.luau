










local a = require(script:WaitForChild('Scheduler'))

local function onlyInTestError(b: string)
	return function()
		error(b .. " is only available in tests, not in production")
	end
end

local b = a(nil )
local c = require(script:WaitForChild('Tracing'))
local d = require(script:WaitForChild('TracingSubscriptions'))

export type Interaction = c.Interaction





if _G.__ROACT_17_MOCK_SCHEDULER__ then
	return require(script:WaitForChild('unstable_mock'))
end

local e = {
	unstable_ImmediatePriority = b.unstable_ImmediatePriority,
	unstable_UserBlockingPriority = b.unstable_UserBlockingPriority,
	unstable_NormalPriority = b.unstable_NormalPriority,
	unstable_IdlePriority = b.unstable_IdlePriority,
	unstable_LowPriority = b.unstable_LowPriority,
	unstable_runWithPriority = b.unstable_runWithPriority,
	unstable_next = b.unstable_next,
	unstable_scheduleCallback = b.unstable_scheduleCallback,
	unstable_cancelCallback = b.unstable_cancelCallback,
	unstable_wrapCallback = b.unstable_wrapCallback,
	unstable_getCurrentPriorityLevel = b.unstable_getCurrentPriorityLevel,
	unstable_shouldYield = b.unstable_shouldYield,
	unstable_requestPaint = b.unstable_requestPaint,
	unstable_continueExecution = b.unstable_continueExecution,
	unstable_pauseExecution = b.unstable_pauseExecution,
	unstable_getFirstCallbackNode = b.unstable_getFirstCallbackNode,
	unstable_now = b.unstable_now,
	unstable_forceFrameRate = b.unstable_forceFrameRate,
	unstable_flushAllWithoutAsserting = onlyInTestError(
		"unstable_flushAllWithoutAsserting"
	) :: any,
	unstable_flushAll = onlyInTestError("unstable_flushAll"),
	unstable_flushNumberOfYields = onlyInTestError("unstable_flushNumberOfYields"),
	unstable_clearYields = onlyInTestError("unstable_clearYields") :: any,
	unstable_flushUntilNextPaint = onlyInTestError("unstable_clearYields"),
	unstable_advanceTime = onlyInTestError("unstable_advanceTime"),
	unstable_flushExpired = onlyInTestError("unstable_flushExpired"),
	unstable_yieldValue = onlyInTestError("unstable_yieldValue"),

	tracing = {
		unstable_wrap = onlyInTestError("unstable_wrap"),
		__interactionsRef = {},
		__subscriberRef = {},
	},
}


for f, g in c :: any do
	e.tracing[f] = g
end
for f, g in d :: any do
	e.tracing[f] = g
end

return e
