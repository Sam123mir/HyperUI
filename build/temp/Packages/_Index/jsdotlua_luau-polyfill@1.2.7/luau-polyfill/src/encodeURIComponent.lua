
local a = game:GetService("HttpService")

local b = require(script.Parent.Parent:WaitForChild('string'))
local c = b.charCodeAt
local d = require(script.Parent:WaitForChild('Error'))

local function encodeURIComponent(e: string): string
	local f = utf8.len(e)
	if f == 0 or f == nil then
		return ""
	end
	
	local g = c(e, 1)
	if f == 1 then
		if g == 0xD800 then
			error(d.new("URI malformed"))
		end
		if g == 0xDFFF then
			error(d.new("URI malformed"))
		end
	end
	if g >= 0xDC00 and g < 0xDFFF then
		error(d.new("URI malformed"))
	end
	local h = a:UrlEncode(e)
	
	local i = h
		:gsub("%%2D", "-")
		:gsub("%%5F", "_")
		:gsub("%%2E", ".")
		:gsub("%%21", "!")
		:gsub("%%7E", "~")
		:gsub("%%2A", "*")
		:gsub("%%27", "'")
		:gsub("%%28", "(")
		:gsub("%%29", ")")
	return i
end

return encodeURIComponent
