









local a = require(script.Parent.Parent.Parent:WaitForChild('shared'))
type ReactNodeList = a.ReactNodeList
local b = require(script.Parent:WaitForChild('ReactRobloxHostTypes.roblox'))
type Container = b.Container









local c
c = require(script.Parent:WaitForChild('ReactRobloxRoot'))
local d = c.createRoot
local e = c.createBlockingRoot
local f = c.createLegacyRoot
local g = c.isValidContainer



local h = require(script.Parent.Parent:WaitForChild('ReactReconciler.roblox'))

local i = h.batchedUpdates


local j = h.flushSync

local k = h.injectIntoDevTools
local l = h.flushPassiveEffects
local m = h.IsThisRendererActing







local n = h.createPortal

local o = require(script.Parent.Parent.Parent:WaitForChild('shared')).ReactVersion
local p = require(script.Parent.Parent.Parent:WaitForChild('shared')).invariant
local q = require(script.Parent.Parent.Parent:WaitForChild('shared')).ReactFeatureFlags

local r = q.enableNewReconciler

local s = require(script.Parent:WaitForChild('ReactRobloxComponentTree'))
local t = s.getInstanceFromNode
local u = s.getNodeFromInstance
local v = s.getFiberCurrentPropsFromNode
local w = s.getClosestInstanceFromNode

















local x = require(script.Parent.Parent.Parent:WaitForChild('shared')).Event
local y = require(script.Parent.Parent.Parent:WaitForChild('shared')).Change
local z = require(script.Parent.Parent.Parent:WaitForChild('shared')).Tag







































local function createPortal(
	A: ReactNodeList,
	B: Container,
	C: string?
): any
	
	p(
		g(B),
		
		"Target container is not a Roblox Instance."
	)
	
	
	
	
	
	return n(A, B, nil, C)
end



























































local A = {
	
	
	Events = {
		getInstanceFromNode = t,
		getNodeFromInstance = u,
		getFiberCurrentPropsFromNode = v,
		
		
		flushPassiveEffects = l,
		
		IsThisRendererActing = m,
	},
}

local B = {
	createPortal = createPortal,
	unstable_batchedUpdates = i,
	flushSync = j,
	__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED = A,
	version = o,
	
	
	
	
	
	
	createRoot = d,
	createBlockingRoot = e,
	createLegacyRoot = f,
	
	
	
	
	
	
	
	
	
	
	
	
	

	

	
	
	
	Event = x,
	Change = y,
	Tag = z,
	unstable_isNewReconciler = r,

	
	
	act = function(B: () -> ()): ()
		error(
[[ReactRoblox.act is only available in testing environments, not production. Enable the `__ROACT_17_MOCK_SCHEDULER__` global in your test configuration in order to use `act`.]]		


)
	end,
}

if _G.__ROACT_17_MOCK_SCHEDULER__ then
	
	
	
	B.act = h.act
end



local C = k({
	findFiberByHostInstance = w,
	bundleType = if _G.__DEV__ then 1 else 0,
	version = o,
	rendererPackageName = "ReactRoblox",
})

if _G.__DEV__ then
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
end

B.robloxReactProfiling = h.robloxReactProfiling

return B
