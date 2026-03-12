local a = require(script.Parent.Parent:WaitForChild('collections')).inspect

local b = "  "

return function()
	local c = {}
	local d = 0

	local function indent()
		return string.rep(b, d)
	end

	function c.log(e, ...)
		local f
		if typeof(e) == "string" then
			f = string.format(e, ...)
		else
			f = a(e)
		end
		print(indent() .. f)
	end

	function c.debug(e, ...)
		local f
		if typeof(e) == "string" then
			f = string.format(e, ...)
		else
			f = a(e)
		end
		print(indent() .. f)
	end

	function c.info(e, ...)
		local f
		if typeof(e) == "string" then
			f = string.format(e, ...)
		else
			f = a(e)
		end
		print(indent() .. f)
	end

	function c.warn(e, ...)
		local f
		if typeof(e) == "string" then
			f = string.format(e, ...)
		else
			f = a(e)
		end
		warn(indent() .. f)
	end

	function c.error(e, ...)
		
		
		local f
		if typeof(e) == "string" then
			f = string.format(e, ...)
		else
			f = a(e)
		end
		warn(indent() .. f)
	end

	function c.group(e, ...)
		local f
		if typeof(e) == "string" then
			f = string.format(e, ...)
		else
			f = a(e)
		end
		print(indent() .. f)
		d = d + 1
	end

	function c.groupCollapsed(e, ...)
		
		local f
		if typeof(e) == "string" then
			f = string.format(e, ...)
		else
			f = a(e)
		end
		print(indent() .. f)
		d = d + 1
	end

	function c.groupEnd()
		if d > 0 then
			d = d - 1
		end
	end

	return c
end
