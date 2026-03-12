









local a = _G.__DEV__ :: boolean

local b = require(script.Parent:WaitForChild('ReactInternalTypes'))
type Fiber = b.Fiber

local c = require(script.Parent.Parent:WaitForChild('shared')).ReactSharedInternals
local d = require(script.Parent:WaitForChild('ReactFiberComponentStack'))
local e = d.getStackByFiberInDevAndProd
local f = require(script.Parent.Parent:WaitForChild('shared')).getComponentName

local g = c.ReactDebugCurrentFrame


type Exports = {
	current: Fiber | nil,
	isRendering: boolean,
	
	[string]: any
}

local h: Exports = {
	current = nil,
	isRendering = false,
}

h.getCurrentFiberOwnerNameInDevOrNull = function(): string?
	if a then
		if h.current == nil then
			return nil
		end
		
		local i = (h.current :: Fiber)._debugOwner
		if i then
			return f(i.type)
		end
	end
	return nil
end

local function getCurrentFiberStackInDev(): string
	if a then
		if h.current == nil then
			return ""
		end
		
		
		
		return e(h.current :: Fiber)
	end
	return ""
end

h.resetCurrentFiber = function(): ()
	if a then
		
		(g :: any).getCurrentStack = nil
		h.current = nil
		h.isRendering = false
	end
end

h.setCurrentFiber = function(i: Fiber): ()
	if a then
		
		(g :: any).getCurrentStack = getCurrentFiberStackInDev
		h.current = i
		h.isRendering = false
	end
end

h.setIsRendering = function(i: boolean): ()
	if a then
		h.isRendering = i
	end
end

h.getIsRendering = function(): boolean
	if a then
		return h.isRendering
	end
	return false
end

return h
