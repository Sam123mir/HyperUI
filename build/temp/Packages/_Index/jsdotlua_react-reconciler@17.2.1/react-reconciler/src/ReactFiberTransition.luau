










local a = require(script.Parent.Parent:WaitForChild('shared')).ReactSharedInternals

local b = a.ReactCurrentBatchConfig

return {
	NoTransition = 0,
	requestCurrentTransition = function(): number
		return b.transition
	end,
}
