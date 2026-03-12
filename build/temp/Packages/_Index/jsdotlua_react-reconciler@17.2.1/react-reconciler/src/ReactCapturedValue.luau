










local a = require(script.Parent:WaitForChild('ReactInternalTypes'))
type Fiber = a.Fiber

local b =
	require(script.Parent:WaitForChild('ReactFiberComponentStack')).getStackByFiberInDevAndProd

export type CapturedValue<T> = {
	value: T,
	source: Fiber | nil,
	stack: string | nil
}

local c = {}

c.createCapturedValue = function<T>(d: T, e: Fiber | nil): CapturedValue<T>
	
	
	return {
		value = d,
		source = e,
		stack = b(e),
	}
end

return c
