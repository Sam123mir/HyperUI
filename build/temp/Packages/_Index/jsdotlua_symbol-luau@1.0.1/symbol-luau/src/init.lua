




local a = require(script:WaitForChild('Symbol'))
export type Symbol = a.Symbol
local b = require(script:WaitForChild('Registry.global'))

local c = setmetatable({}, {
	
	


__call = function(c, d: string?): a.Symbol
		return a.new(d)
	end,
})

c.for_ = b.getOrInit

return c
