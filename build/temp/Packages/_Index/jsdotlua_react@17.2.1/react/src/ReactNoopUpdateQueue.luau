








local a = require(script.Parent.Parent:WaitForChild('shared')).console

local b = {}

local function warnNoop(c: any, d: string)
	if _G.__DEV__ then
		
		
		
		
		local e = c.__componentName or "ReactClass"
		local f = e .. "." .. d
		if b[f] then
			return
		end
		
		a.error(
[[Can't call %s on a component that is not yet mounted. This is a no-op, but it might indicate a bug in your application. Instead, assign to `self.state` directly with the desired state in the %s component's `init` method.]]


,
			d,
			e
		)
		b[f] = true
	end
end




local c = {
	
	





isMounted = function(c)
		return false
	end,
	
	













enqueueForceUpdate = function(c, d, e)
		warnNoop(c, "forceUpdate")
	end,
	
	











enqueueReplaceState = function(c, d, e, f)
		warnNoop(c, "replaceState")
	end,
	
	










enqueueSetState = function(c, d, e, f)
		warnNoop(c, "setState")
	end,
}

return c
