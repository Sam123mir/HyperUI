










local a = require(script.Parent.Parent:WaitForChild('shared')).console
local b = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
type Object = b.Object
local c = {}


type DevToolsHook = {
	
	inject: (Object) -> number | nil,
	supportsFiber: boolean,
	isDisabled: boolean	

}


local function isCallable(d)
	if typeof(d) == "function" then
		return true
	end
	if typeof(d) == "table" then
		local e = getmetatable(d)
		if e and rawget(e, "__call") then
			return true
		end
		if d._isMockFunction then
			return true
		end
	end
	return false
end

local d =
	require(script.Parent.Parent:WaitForChild('shared')).ReactFeatureFlags.enableProfilerTimer

local e = require(script.Parent:WaitForChild('ReactInternalTypes'))
type Fiber = e.Fiber
type FiberRoot = e.FiberRoot
type ReactPriorityLevel = e.ReactPriorityLevel
local f = require(script.Parent.Parent:WaitForChild('shared'))
type ReactNodeList = f.ReactNodeList

local g = require(script.Parent:WaitForChild('ReactFiberFlags')).DidCapture




local h 
local i 
local j = false


c.isDevToolsPresent = function()
	return _G.__REACT_DEVTOOLS_GLOBAL_HOOK__ ~= nil
end

c.injectInternals = function(k: Object): boolean
	if _G.__REACT_DEVTOOLS_GLOBAL_HOOK__ == nil then
		
		return false
	end
	local l: DevToolsHook = _G.__REACT_DEVTOOLS_GLOBAL_HOOK__
	if l.isDisabled then
		
		
		
		return true
	end
	if not l.supportsFiber then
		if _G.__DEV__ then
			a.error(
[[The installed version of React DevTools is too old and will not work with the current version of React. Please update React DevTools. https://reactjs.org/link/react-devtools]]			


)
		end
		
		return true
	end
	local m, n = pcall(function()
		h = l.inject(k)
		
		i = l
	end)

	if not m then
		
		if _G.__DEV__ then
			a.error("React instrumentation encountered an error: %s.", n)
		end
	end
	
	return true
end

c.onScheduleRoot = function(k: FiberRoot, l: ReactNodeList)
	if _G.__DEV__ then
		if
			i
			
			and isCallable(i.onScheduleFiberRoot)
		then
			local m, n =
				pcall(i.onScheduleFiberRoot, h, k, l)

			if not m then
				if _G.__DEV__ and not j then
					j = true
					a.error("React instrumentation encountered an error: %s", n)
				end
			end
		end
	end
end

c.onCommitRoot = function(k: FiberRoot, l: ReactPriorityLevel)
	if
		i
		
		and isCallable(i.onCommitFiberRoot)
	then
		local m, n = pcall(function()
			local m = bit32.band(k.current.flags, g) == g
			if d then
				i.onCommitFiberRoot(h, k, l, m)
			else
				i.onCommitFiberRoot(h, k, nil, m)
			end
		end)
		if not m then
			if _G.__DEV__ then
				if not j then
					j = true
					a.error("React instrumentation encountered an error: %s", n)
				end
			end
		end
	end
end

c.onCommitUnmount = function(k: Fiber)
	if
		i
		
		and isCallable(i.onCommitFiberUnmount)
	then
		local l, m = pcall(i.onCommitFiberUnmount, h, k)
		if not l then
			if _G.__DEV__ then
				if not j then
					j = true
					a.error("React instrumentation encountered an error: %s", m)
				end
			end
		end
	end
end

return c
