








local a = require(script.Parent.Parent.Parent:WaitForChild('luau-polyfill'))
type Error = a.Error
local b = a.Object
local c = require(script.Parent.Parent.Parent:WaitForChild('shared'))
local d = c.console
local e = c.errorToString
local f = c.describeError


local g = function()
	
	return os.clock() * 1000
end







local h = a.setTimeout
local i = a.clearTimeout

local j = false
local k: ((boolean, number) -> boolean) | nil 
local l = b.None





local m = 15
local n = 0



local function shouldYieldToHost()
	return g() >= n
end


local function requestPaint() end

local function forceFrameRate(o)
	if o < 0 or o > 125 then
		d.warn(
[[forceFrameRate takes a positive int between 0 and 125, forcing frame rates higher than 125 fps is not supported]]		

)
		return
	end
	if o > 0 then
		m = math.floor(1000 / o)
	else
		
		m = 5
	end
end

local function performWorkUntilDeadline()
	if k ~= nil then
		local o = g()
		
		
		
		n = o + m
		local p = true

		local q, r
		local function doWork()
			local s = (k :: any)(
				p,
				o
			)
			if not s then
				j = false
				k = nil
			else
				
				

				
				
				
				

				
				
				task.delay(0, performWorkUntilDeadline)
			end
			return nil
		end
		if not _G.__YOLO__ then
			q, r = xpcall(doWork, f)
		else
			r = doWork()
			q = true
		end

		if not q then
			
			
			task.delay(0, performWorkUntilDeadline)

			
			
			error(e(r :: any))
		end
	else
		j = false
	end
end


local function wrapPerformWorkWithCoroutine(o)
	local p = coroutine.create(function()
		while true do
			
			
			local p = coroutine.wrap(o)
			local q, r = pcall(p)
			coroutine.yield(q, r)
		end
	end)

	return function()
		local q, r, s = coroutine.resume(p)
		
		if not r then
			error(s)
		end
	end
end
performWorkUntilDeadline = wrapPerformWorkWithCoroutine(performWorkUntilDeadline)

local function requestHostCallback(o)
	k = o
	if not j then
		j = true

		task.delay(0, performWorkUntilDeadline)
	end
end

local function cancelHostCallback()
	k = nil
end

local function requestHostTimeout(o, p)
	l = h(function()
		o(g())
	end, p)
end

local function cancelHostTimeout()
	i(l)
	l = b.None
end

return {
	requestHostCallback = requestHostCallback,
	cancelHostCallback = cancelHostCallback,
	requestHostTimeout = requestHostTimeout,
	cancelHostTimeout = cancelHostTimeout,
	shouldYieldToHost = shouldYieldToHost,
	requestPaint = requestPaint,
	getCurrentTime = g,
	forceFrameRate = forceFrameRate,
}
