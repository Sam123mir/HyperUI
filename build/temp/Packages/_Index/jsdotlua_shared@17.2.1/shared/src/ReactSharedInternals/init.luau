























local a = require(script.Parent.Parent:WaitForChild('luau-polyfill')).console
local function onlyInTestError(b: string)
	return function()
		a.error(b .. " is only available in tests, not in production")
	end
end


local b = require(script:WaitForChild('ReactCurrentDispatcher'))
export type Dispatcher = b.Dispatcher
local c = require(script:WaitForChild('ReactCurrentBatchConfig'))
local d = require(script:WaitForChild('ReactCurrentOwner'))
local e = require(script:WaitForChild('ReactDebugCurrentFrame'))
local f = require(script:WaitForChild('IsSomeRendererActing'))

local g = {
	ReactCurrentDispatcher = b,
	ReactCurrentBatchConfig = c,
	ReactCurrentOwner = d,
	IsSomeRendererActing = f,
	
	
	ReactDebugCurrentFrame = if _G.__DEV__
		then e
		else {
			setExtraStackFrame = function(g: string?): ()
				onlyInTestError("setExtraStackFrame")
			end,
		},
	
	
	
}

return g
