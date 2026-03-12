










local a = require(script.Parent:WaitForChild('ReactInternalTypes'))
type Fiber = a.Fiber
local b = require(script.Parent:WaitForChild('ReactFiberLane'))
type Lanes = b.Lanes
local c = require(script.Parent:WaitForChild('ReactFiberSuspenseComponent.new'))
type SuspenseState = c.SuspenseState

local d =
	require(script.Parent:WaitForChild('ReactMutableSource.new')).resetWorkInProgressVersions
local e = require(script.Parent:WaitForChild('ReactWorkTags'))

local f = require(script.Parent:WaitForChild('ReactFiberFlags'))
local g = require(script.Parent:WaitForChild('ReactTypeOfMode'))

local h = require(script.Parent.Parent:WaitForChild('shared')).ReactFeatureFlags
local i = h.enableSuspenseServerRenderer
local j = h.enableProfilerTimer

local k = require(script.Parent:WaitForChild('ReactFiberHostContext.new'))
local l = k.popHostContainer
local m = k.popHostContext
local n =
	require(script.Parent:WaitForChild('ReactFiberSuspenseContext.new')).popSuspenseContext
local o =
	require(script.Parent:WaitForChild('ReactFiberHydrationContext.new')).resetHydrationState
local p = require(script.Parent:WaitForChild('ReactFiberContext.new'))
local q = p.isContextProvider
local r = p.popContext
local s = p.popTopLevelContextObject
local t = require(script.Parent:WaitForChild('ReactFiberNewContext.new')).popProvider

local u
local v = function(...)
	if not u then
		u = require(script.Parent:WaitForChild('ReactFiberWorkLoop.new')).popRenderLanes
	end
	return u(...)
end
local w =
	require(script.Parent:WaitForChild('ReactProfilerTimer.new')).transferActualDuration

local x = require(script.Parent.Parent:WaitForChild('shared')).invariant

local function unwindWork(y: Fiber, z: Lanes): Fiber?
	if y.tag == e.ClassComponent then
		local A = y.type
		if q(A) then
			r(y)
		end
		local B = y.flags
		if bit32.band(B, f.ShouldCapture) ~= 0 then
			y.flags = bit32.bor(
				bit32.band(B, bit32.bnot(f.ShouldCapture)),
				f.DidCapture
			)
			if
				j
				and bit32.band(y.mode, g.ProfileMode)
					~= g.NoMode
			then
				w(y)
			end
			return y
		end
		return nil
	elseif y.tag == e.HostRoot then
		l(y)
		s(y)
		d()
		local A = y.flags
		x(
			bit32.band(A, f.DidCapture) == f.NoFlags,
[[The root failed to unmount after an error. This is likely a bug in React. Please file an issue.]]		

)
		y.flags = bit32.bor(
			bit32.band(A, bit32.bnot(f.ShouldCapture)),
			f.DidCapture
		)
		return y
	elseif y.tag == e.HostComponent then
		
		m(y)
		return nil
	elseif y.tag == e.SuspenseComponent then
		n(y)
		if i then
			local A = y.memoizedState
			if A ~= nil and A.dehydrated ~= nil then
				x(
					y.alternate ~= nil,
[[Threw in newly mounted dehydrated component. This is likely a bug in React. Please file an issue.]]				

)
				o()
			end
		end
		local A = y.flags
		if bit32.band(A, f.ShouldCapture) ~= 0 then
			y.flags = bit32.bor(
				bit32.band(A, bit32.bnot(f.ShouldCapture)),
				f.DidCapture
			)
			
			if
				j
				and (
					bit32.band(y.mode, g.ProfileMode)
					~= g.NoMode
				)
			then
				w(y)
			end
			return y
		end
		return nil
	elseif y.tag == e.SuspenseListComponent then
		n(y)
		
		
		return nil
	elseif y.tag == e.HostPortal then
		l(y)
		return nil
	elseif y.tag == e.ContextProvider then
		t(y)
		return nil
	elseif
		y.tag == e.OffscreenComponent
		or y.tag == e.LegacyHiddenComponent
	then
		v(y)
		return nil
	else
		return nil
	end
end

function unwindInterruptedWork(y: Fiber)
	if y.tag == e.ClassComponent then
		
		local z
		if typeof(y.type) == "table" then
			z = y.type.childContextTypes
		end
		if z ~= nil then
			r(y)
		end
	elseif y.tag == e.HostRoot then
		l(y)
		s(y)
		d()
	elseif y.tag == e.HostComponent then
		m(y)
	elseif y.tag == e.HostPortal then
		l(y)
	elseif y.tag == e.SuspenseComponent then
		n(y)
	elseif y.tag == e.SuspenseListComponent then
		n(y)
	elseif y.tag == e.ContextProvider then
		t(y)
	elseif
		y.tag == e.OffscreenComponent
		or y.tag == e.LegacyHiddenComponent
	then
		v(y)
		return
	else 
		return
	end
end

return {
	unwindWork = unwindWork,
	unwindInterruptedWork = unwindInterruptedWork,
}
