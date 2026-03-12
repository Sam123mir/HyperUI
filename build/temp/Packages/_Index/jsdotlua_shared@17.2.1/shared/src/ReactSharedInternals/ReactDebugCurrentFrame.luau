










local a = {}

local b = nil :: nil | string

function a.setExtraStackFrame(c: string?): ()
	if _G.__DEV__ then
		b = c
	end
end

if _G.__DEV__ then
	
	
	
	
	
	

	
	a.getCurrentStack = nil :: nil | (() -> string)

	function a.getStackAddendum(): string
		local c = ""

		
		if b then
			c = c .. b
		end

		
		local d = a.getCurrentStack
		if d then
			c = c .. (d() or "")
		end

		return c
	end
end

return a
