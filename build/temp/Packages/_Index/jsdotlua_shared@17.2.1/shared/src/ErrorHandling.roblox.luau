















local a = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
type Error = a.Error
type Object = a.Object
type Array<T> = a.Array<T>
local b = a.Error
local c = a.util.inspect

local d = "\n------ Error caught by React ------\n"








local function describeError(e: string | Error): Error
	if typeof(e) == "string" then
		local f, g = string.find(e, ":[%d]+: ")
		local h = if g then string.sub(e, g + 1) else e

		local i = a.Error.new(h)
		i.stack = debug.traceback(nil, 2)
		return i
	end
	return e :: Error
end









local function errorToString(e: Error | Object | string | Array<any>): string
	local f
	if typeof(e) == "table" then
		if (e :: Error).message and (e :: Error).stack then
			
			
			
			f = d
				.. (e :: Error).message
				.. d
				.. tostring((e :: Error).stack)
		else
			f = c(e)
		end
	else
		f = c(e)
	end

	return f
end






local function parseReactError(e: string): (Error, string)
	local f = string.split(e, d)

	if #f == 3 then
		local g, h, i = table.unpack(f)

		local j = b.new(h)
		j.stack = i

		return j, g
	else
		
		
		
		local g = b.new(e)
		g.stack = nil

		return g, ""
	end
end

return {
	describeError = describeError,
	errorToString = errorToString,
	parseReactError = parseReactError,
	
	__ERROR_DIVIDER = d,
}
