














return function(a, b, c)
	local d = {}
	d.__index = d
	d.__tostring = function(e)
		return getmetatable(a).__tostring(e)
	end

	local e = {}

	d.new = function(...)
		local f = {}
		c(f, ...)
		return setmetatable(f, d)
	end

	if typeof(getmetatable(a)) == "table" and getmetatable(a).__call then
		e.__call = function(f, ...)
			return d.new(...)
		end
	end

	e.__index = a
	e.__tostring = function(f)
		
		if f == d then
			return tostring(b)
		end
		return getmetatable(a).__tostring(f)
	end

	setmetatable(d, e)

	return d
end
