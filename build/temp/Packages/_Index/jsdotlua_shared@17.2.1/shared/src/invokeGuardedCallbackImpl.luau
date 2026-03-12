










local a = require(script.Parent:WaitForChild('ErrorHandling.roblox')).describeError


local function invokeGuardedCallbackProd(b, c, d, e, ...)
	

	
	local f, g
	if not _G.__YOLO__ then
		
		
		
		
		if e == nil then
			f, g = xpcall(d, a, ...)
		else
			f, g = xpcall(d, a, e, ...)
		end
	else
		f = true
		if e == nil then
			d(...)
		else
			d(e, ...)
		end
	end

	if not f then
		
		
		
		b.onError(g)
	end
end

local b = invokeGuardedCallbackProd

if _G.__DEV__ then
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	







































































































































end

return b
