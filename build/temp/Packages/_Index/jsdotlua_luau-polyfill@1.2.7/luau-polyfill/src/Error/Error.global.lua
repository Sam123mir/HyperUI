local a = require(script.Parent.Parent.Parent:WaitForChild('es7-types'))

type Function = a.Function

export type Error = { name: string, message: string, stack: string? }
type Error_private = Error & { __stack: string? }

local b = {}

local c = "Error"
b.__index = b
b.__tostring = function(d)
	
	return getmetatable(b :: any).__tostring(d)
end


local function __createError(d: string?): Error
	local e = (setmetatable({
		name = c,
		message = d or "",
	}, b) :: any) :: Error
	b.__captureStackTrace(e, 4)
	return e
end

function b.new(d: string?): Error
	return __createError(d)
end

function b.captureStackTrace(d: Error, e: Function?)
	b.__captureStackTrace(d, 3, e)
end

function b.__captureStackTrace(d: Error, e: number, f: Function?)
	local g = d :: Error_private
	if typeof(f) == "function" then
		local h = debug.traceback(nil, e)
		local i: string = debug.info(f, "n")
		local j: string = debug.info(f, "s")

		local k = string.gsub(j, "([%(%)%.%%%+%-%*%?%[%^%$])", "%%%1")
		local l = k .. ":%d* function " .. i
		local m = string.find(h, l)
		local n 		
if m ~= nil then
			m, n = string.find(h, "\n", m + 1)
		end
		if n ~= nil then
			h = string.sub(h, n + 1)
		end
		g.__stack = h
	else
		g.__stack = debug.traceback(nil, e)
	end
	b.__recalculateStacktrace(g)
end

function b.__recalculateStacktrace(d: Error)
	local e = d :: Error_private
	local f = e.message
	local g = e.name or c

	local h = g .. (if f ~= nil and f ~= "" then (": " .. f) else "")
	local i = if e.__stack then e.__stack else ""

	e.stack = h .. "\n" .. i
end

return setmetatable(b, {
	__call = function(d, ...)
		return __createError(...)
	end,
	__tostring = function(d)
		if d.name ~= nil then
			if d.message and d.message ~= "" then
				return string.format("%s: %s", tostring(d.name), tostring(d.message))
			end
			return tostring(d.name)
		end
		return tostring(c)
	end,
})
