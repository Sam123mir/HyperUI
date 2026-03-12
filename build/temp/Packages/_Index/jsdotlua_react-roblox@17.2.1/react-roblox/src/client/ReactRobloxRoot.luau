










local a = require(script.Parent:WaitForChild('ReactRobloxHostTypes.roblox'))
type Container = a.Container
type RootType = a.RootType
type RootOptions = a.RootOptions

local b = require(script.Parent.Parent.Parent:WaitForChild('react-reconciler'))
type RootTag = b.RootTag
local c = require(script.Parent.Parent.Parent:WaitForChild('shared'))
type MutableSource<T> = c.MutableSource<T>
type ReactNodeList = c.ReactNodeList
local d = require(script.Parent.Parent.Parent:WaitForChild('react-reconciler'))
type FiberRoot = d.FiberRoot

type Array<T> = { [number]: T }

local e = require(script.Parent:WaitForChild('ReactRobloxComponentTree'))

local f = e.markContainerAsRoot
local g = e.unmarkContainerAsRoot










local h = require(script.Parent.Parent:WaitForChild('ReactReconciler.roblox'))
local i = h.createContainer
local j = h.updateContainer


local k = require(script.Parent.Parent.Parent:WaitForChild('shared')).invariant
local l =
	require(script.Parent.Parent.Parent:WaitForChild('shared')).ReactFeatureFlags.enableEagerRootListeners


local m = h.flushSync
local n = h.flushPassiveEffects

local o = h.ReactRootTags.BlockingRoot
local p = h.ReactRootTags.ConcurrentRoot
local q = h.ReactRootTags.LegacyRoot

local r

local s = {}
s.__index = s

function s.new(t: Container, u: RootOptions?): RootType
	local v: RootType = (setmetatable({}, s) :: any) :: RootType
	v._internalRoot = r(t, p, u)

	return v
end

local function createBlockingRoot(
	t: Container,
	u: RootTag,
	v: RootOptions?
): RootType
	
	local w: RootType = (setmetatable({}, s) :: any) :: RootType
	w._internalRoot = r(t, u, v)

	return w
end

function s:render(t: ReactNodeList)
	local u = self._internalRoot
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	j(t, u, nil)
end

function s:unmount()
	
	
	
	
	
	
	
	
	local t = self._internalRoot
	local u = t.containerInfo

	
	m(function()
		j(nil, t, nil, function()
			g(u)
		end)
	end)

	n()
end







r = function(t: Container, u: RootTag, v: any)
	
	local w = v ~= nil and v.hydrate == true
	local x = if v ~= nil then v.hydrationOptions else nil
	local y = (
		v ~= nil
		and v.hydrationOptions ~= nil
		and v.hydrationOptions.mutableSources
	) or nil
	local z = i(t, u, w, x)
	f(z.current, t)
	

	if l then
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	end

	if y then
		
		
		
		
	end

	return z
end

local t = {}

local function isValidContainer(u: any): boolean
	
	
	return typeof(u) == "Instance"
	
	
	
	
	
	
	
	
end

t.isValidContainer = isValidContainer


t.createRoot = function(u: Container, v: RootOptions?): RootType
	k(
		isValidContainer(u),
		
		"createRoot(...): Target container is not a Roblox Instance."
	)
	warnIfReactDOMContainerInDEV(u)
	return s.new(u, v)
end

t.createBlockingRoot =
	function(u: Container, v: RootOptions?): RootType
		k(
			isValidContainer(u),
			
			"createRoot(...): Target container is not a Roblox Instance."
		)
		warnIfReactDOMContainerInDEV(u)
		return createBlockingRoot(u, o, v)
	end

t.createLegacyRoot = function(u: Container, v: RootOptions?): RootType
	return createBlockingRoot(u, q, v)
end

function warnIfReactDOMContainerInDEV(u)
	if _G.__DEV__ then
		
		

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	end
end

return t
