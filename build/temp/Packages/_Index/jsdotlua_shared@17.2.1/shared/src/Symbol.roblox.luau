




















local a = {}







function a.named(b)
	assert(type(b) == "string", "Symbols must be created using a string name!")

	local c = newproxy(true)

	local d = string.format("Symbol(%s)", b)

	getmetatable(c).__tostring = function()
		return d
	end

	return c
end

return a
