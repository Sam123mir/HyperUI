


local a = newproxy(true)
local b = getmetatable(a)
b.__tostring = function()
	return "Object.None"
end

return a
