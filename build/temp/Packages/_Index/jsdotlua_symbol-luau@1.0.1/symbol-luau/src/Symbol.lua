










export type Symbol = typeof(newproxy(true)) & { [string]: any }

return {
	new = function(a: string?): Symbol
		local b = newproxy(true) :: any

		local c = "Symbol()"
		if a then
			c = ("Symbol(%s)"):format(a)
		end

		getmetatable(b).__tostring = function()
			return c
		end

		return (b :: any) :: Symbol
	end,
}
