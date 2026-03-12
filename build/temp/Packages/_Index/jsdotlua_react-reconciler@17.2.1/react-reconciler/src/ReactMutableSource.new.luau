










local a = require(script.Parent.Parent:WaitForChild('shared')).console

type Array<T> = { [number]: T }
local b = {}

local c = require(script.Parent.Parent:WaitForChild('shared'))
type MutableSource<T> = c.MutableSource<T>
type MutableSourceVersion = c.MutableSourceVersion

local d = require(script.Parent:WaitForChild('ReactInternalTypes'))
type FiberRoot = d.FiberRoot

local e = require(script.Parent:WaitForChild('ReactFiberHostConfig')).isPrimaryRenderer




local f: Array<MutableSource<any>> = {}

local g
if _G.__DEV__ then
	
	g = {}
end

b.markSourceAsDirty = function(h: MutableSource<any>)
	table.insert(f, h)
end

b.resetWorkInProgressVersions = function()
	for h, i in f do
		if e then
			i._workInProgressVersionPrimary = nil
		else
			i._workInProgressVersionSecondary = nil
		end
	end
	table.clear(f)
end

b.getWorkInProgressVersion =
	function(h: MutableSource<any>): nil | MutableSourceVersion
		if e then
			return h._workInProgressVersionPrimary
		else
			return h._workInProgressVersionSecondary
		end
	end

b.setWorkInProgressVersion =
	function(h: MutableSource<any>, i: MutableSourceVersion)
		if e then
			h._workInProgressVersionPrimary = i
		else
			h._workInProgressVersionSecondary = i
		end
		table.insert(f, h)
	end

b.warnAboutMultipleRenderersDEV = function(h: MutableSource<any>)
	if _G.__DEV__ then
		if e then
			if h._currentPrimaryRenderer == nil then
				h._currentPrimaryRenderer = g
			elseif h._currentPrimaryRenderer ~= g then
				a.error(
[[Detected multiple renderers concurrently rendering the same mutable source. This is currently unsupported.]]				

)
			end
		else
			if h._currentSecondaryRenderer == nil then
				h._currentSecondaryRenderer = g
			elseif h._currentSecondaryRenderer ~= g then
				a.error(
[[Detected multiple renderers concurrently rendering the same mutable source. This is currently unsupported.]]				

)
			end
		end
	end
end





b.registerMutableSourceForHydration =
	function(h: FiberRoot, i: MutableSource<any>)
		local j = i._getVersion
		local k = j(i._source)

		
		
		if h.mutableSourceEagerHydrationData == nil then
			h.mutableSourceEagerHydrationData = { i, k }
			
			
			
		
end
	end

return b
