











local function unimplemented(a: string)
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring(a))
	error("FIXME (roblox): " .. a .. " is unimplemented", 2)
end

local a = game:GetService("CollectionService")
local b = require(script.Parent.Parent.Parent:WaitForChild('luau-polyfill'))
local c = b.util.inspect
local d = require(script.Parent.Parent.Parent:WaitForChild('shared')).console
local e = b.Object
local f = b.setTimeout
local g = b.clearTimeout








local h = require(script.Parent:WaitForChild('ReactRobloxHostTypes.roblox'))
type RootType = h.RootType
type Container = h.Container
type HostInstance = h.HostInstance
type SuspenseInstance = h.SuspenseInstance
type TextInstance = h.TextInstance
type Props = h.Props
type Type = h.Type
type HostContext = h.HostContext




local i = require(script.Parent:WaitForChild('ReactRobloxComponentTree'))
local j = i.precacheFiberNode
local k = i.uncacheFiberNode
local l = i.updateFiberProps






local m = require(script.Parent:WaitForChild('ReactRobloxComponent'))


local n = m.setInitialProperties
local o = m.diffProperties
local p = m.updateProperties
local q = m.cleanupHostComponent




























local r = require(script.Parent.Parent.Parent:WaitForChild('shared')).ReactFeatureFlags


local s = r.enableCreateEventHandleAPI









type Array<T> = { [number]: T }
type Object = { [any]: any }
































































































local function recursivelyUncacheFiberNode(t: HostInstance)
	
	
	
	if typeof(t :: any) ~= "Instance" then
		return
	end

	k(t)

	for u, v in t:GetDescendants() do
		k(v)
	end
end

local t: { [any]: any } = {}
e.assign(
	t,
	require(script.Parent.Parent.Parent:WaitForChild('shared')).ReactFiberHostConfig.WithNoPersistence
)

t.getRootHostContext = function(u: Container): HostContext
	
	
	

	
	return u.ClassName

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
end

t.getChildHostContext = function(
	u: HostContext,
	v: string,
	w: Container
): HostContext
	
	
	return u
	
	
	
	
	
	
	
	
	
	
	
end

t.getPublicInstance = function(u: Instance): any
	return u
end

t.prepareForCommit = function(u: Container): Object?
	
	
	local v 	
if s then
		unimplemented("enableCreateEventHandleAPI")
		
		
		
		
	end
	
	return v
end

t.beforeActiveInstanceBlur = function()
	if s then
		unimplemented("enableCreateEventHandleAPI")
		
		
		
	end
end

t.afterActiveInstanceBlur = function()
	if s then
		unimplemented("enableCreateEventHandleAPI")
		
		
		
	end
end

t.resetAfterCommit = function(u: Container)
	
	
	
	
	
end

t.createInstance = function(
	u: string,
	v: Props,
	w: Container,
	x: HostContext,
	y: Object
): HostInstance
	

	local z = Instance.new(u)
	
	
	if y.key then
		z.Name = y.key
	else
		local A = y.return_
		while A do
			if A.key then
				z.Name = A.key
				break
			end
			A = A.return_
		end
	end

	j(y, z)
	l(z, v)

	
	

	
	
	
	

	return z

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
end

t.appendInitialChild = function(u: Instance, v: Instance)
	
	v.Parent = u
end

t.finalizeInitialChildren = function(
	u: HostInstance,
	v: string,
	w: Props,
	x: Container,
	y: HostContext
): boolean
	n(u, v, w, x)
	return false
	
end

local function prepareUpdate(
	u: Instance,
	v: string,
	w: Props,
	x: Props,
	y: Container,
	z: HostContext
): nil | Array<any>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	return o(u, v, w, x, y)
end
t.prepareUpdate = prepareUpdate

t.shouldSetTextContent = function(u: string, v: Props): boolean
	
	return false
	
	
	
	
	
	
	
	
	
	
end


t.createTextInstance = function(
	u: string,
	v: Container,
	w: HostContext,
	x: Object
): any
	unimplemented("createTextInstance")
	return nil
end

t.isPrimaryRenderer = true
t.warnsIfNotActing = true




t.scheduleTimeout = f
t.cancelTimeout = g
t.noTimeout = -1





t.supportsMutation = true

t.commitMount = function(
	u: Instance,
	v: string,
	w: Props,
	x: Object
)
	unimplemented("commitMount")
	
	
	
	
	
	
	
	
	
	
	
	
	
end

t.commitUpdate = function(
	u: Instance,
	v: Array<any>,
	w: string,
	x: Props,
	y: Props,
	z: Object
)
	
	
	l(u, y)
	
	p(u, v, x)
end















local function checkTags(u: Instance)
	if typeof(u :: any) ~= "Instance" then
		d.warn("Could not check tags on non-instance %s.", c(u))
		return
	end
	if not u:IsDescendantOf(game) then
		if #a:GetTags(u) > 0 then
			d.warn(
[[Tags applied to orphaned %s "%s" cannot be accessed via CollectionService:GetTagged. If you're relying on tag behavior in a unit test, consider mounting your test root into the DataModel.]]


,
				u.ClassName,
				u.Name
			)
		end
	end
end

t.appendChild = function(u: Instance, v: Instance)
	
	v.Parent = u
	
	if _G.__DEV__ then
		checkTags(v)
	end
end

t.appendChildToContainer = function(u: Container, v: Instance)
	
	local w = u
	t.appendChild(w, v)

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
end

t.insertBefore =
	function(u: Instance, v: Instance, w: Instance)
		
		v.Parent = u
		
		if _G.__DEV__ then
			checkTags(v)
		end
	end

t.insertInContainerBefore =
	function(u: Container, v: Instance, w: Instance)
		
		local x = u
		t.insertBefore(x, v, w)
		
		
		
		
		
	end




























t.removeChild = function(u: Instance, v: Instance)
	recursivelyUncacheFiberNode(v)
	
	
	q(v)
	
	v.Parent = nil
	
	
	v:Destroy()
end

t.removeChildFromContainer = function(u: Container, v: Instance)
	
	
	t.removeChild(u, v)
	
	
	
	
	
end

t.clearSuspenseBoundary =
	function(u: Instance, v: SuspenseInstance)
		
		unimplemented("clearSuspenseBoundary")
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	end

t.clearSuspenseBoundaryFromContainer =
	function(u: Container, v: SuspenseInstance)
		
		unimplemented("clearSuspenseBoundaryFromContainer")
		
		
		
		
		
		
		
		
		
	end

t.hideInstance = function(u: Instance)
	unimplemented("hideInstance")
	
	
	
	
	
	
	
	
	
end


t.hideTextInstance = function(u: TextInstance): ()
	unimplemented("hideTextInstance")
	
end

t.unhideInstance = function(u: Instance, v: Props)
	unimplemented("unhideInstance")
	
	
	
	
	
	
	
	
	
end


t.unhideTextInstance = function(u: TextInstance, v: string): ()
	unimplemented("unhideTextInstance")
	
end

t.clearContainer = function(u: Container)
	
	local v = u
	for w, x in v:GetChildren() do
		t.removeChild(v, x)
	end
	
	
	
	
	
	
	
	
end












































































































































































































































































































































































































































t.preparePortalMount = function(u: Instance): ()
	
	
	
	
	
	
end






























































































































































return t
