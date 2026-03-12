









local a = require(script.Parent:WaitForChild('invariant'))
local b = require(script.Parent:WaitForChild('invokeGuardedCallbackImpl'))


local c


local d = false
local e 


local f = false
local g 
local h = {
	onError = function(h)
		d = true
		e = h
	end,
}
local i = {}














i.invokeGuardedCallback = function(...)
	d = false
	e = nil
	
	b(h, ...)
end











i.invokeGuardedCallbackAndCatchFirstError = function(...)
	
	i.invokeGuardedCallback(...)

	if d then
		local j = c()

		if not f then
			f = true
			g = j
		end
	end
end





i.rethrowCaughtError = function()
	if f then
		local j = g
		f = false
		g = nil
		error(j)
	end
end

i.hasCaughtError = function()
	return d
end

c = function()
	if d then
		local j = e
		d = false
		e = nil
		return j
	else
		a(
			false,
[[clearCaughtError was called but no error was captured. This error is likely caused by a bug in React. Please file an issue.]]		

)
		
		return nil
	end
end
i.clearCaughtError = c

return i
