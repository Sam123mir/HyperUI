














local a = require(script.Parent:WaitForChild('console'))



local b = {}

setmetatable(b, {
	__index = function(c, d)
		if _G.__DEV__ then
			a.warn(
				"Attempted to access uninitialized state. Use setState to initialize state"
			)
		end
		return nil
	end,
	__newindex = function(c, d)
		if _G.__DEV__ then
			a.error(
				"Attempted to directly mutate state. Use setState to assign new values to state."
			)
		end
		return nil
	end,
	__tostring = function(c)
		return "<uninitialized component state>"
	end,
	__metatable = "UninitializedState",
})

return b
