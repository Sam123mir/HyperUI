local a = require(script.Parent:WaitForChild('Symbol'))

local b: { [string]: a.Symbol } = {}

return {
	getOrInit = function(c: string): a.Symbol
		if b[c] == nil then
			b[c] = a.new(c)
		end

		return b[c]
	end,
	
	__clear = function()
		b = {}
	end,
}
