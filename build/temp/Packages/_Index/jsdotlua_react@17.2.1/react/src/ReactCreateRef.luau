









local a = require(script.Parent.Parent:WaitForChild('shared'))
type RefObject = a.RefObject






local b = require(script.Parent:WaitForChild('ReactBinding.roblox'))

local c = {}


c.createRef = function(): RefObject
	local d, e = b.create(nil)

	local f = {}

	
	
	
	
	if _G.__DEV__ then
		
		d._source = debug.traceback("Ref created at:", 1)
	end

	
	

setmetatable(f, {
		__index = function(g, h)
			if h == "current" then
				return d:getValue()
			else
				return (d :: any)[h]
			end
		end,
		__newindex = function(g, h, i)
			if h == "current" then
				
				
				
				
				b.update(d, i)
			end

			(d :: any)[h] = i
		end,
		__tostring = function(g)
			return string.format("Ref(%s)", tostring(d:getValue()))
		end,
	})

	return (f :: any) :: RefObject
end

return c
