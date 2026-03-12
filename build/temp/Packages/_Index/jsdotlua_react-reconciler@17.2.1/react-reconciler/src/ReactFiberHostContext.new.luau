










local a = require(script.Parent:WaitForChild('ReactInternalTypes'))
type Fiber = a.Fiber
local b = require(script.Parent:WaitForChild('ReactFiberStack.new'))
type StackCursor<T> = b.StackCursor<T>
local c = require(script.Parent:WaitForChild('ReactFiberHostConfig'))
type Container = c.Container
type HostContext = c.HostContext



local d = c.getChildHostContext
local e = c.getRootHostContext
local f = b.createCursor
local g = b.push
local h = b.pop





type NoContextT = {}
local i: NoContextT = {}

local j: StackCursor<HostContext | NoContextT> = f(i)
local k: StackCursor<Fiber | NoContextT> = f(i)
local l: StackCursor<Container | NoContextT> =
	f(i)

function requiredContext<Value>(m: Value | NoContextT): Value
	
	
	
	
	
	
	return m :: any
end

function getRootHostContainer(): Container
	
	
	
	return l.current
end

function pushHostContainer(m: Fiber, n: Container)
	
	
	g(l, n, m)
	
	
	g(k, m, m)

	
	
	
	
	
	g(j, i, m)
	local o = e(n)
	
	h(j, m)
	g(j, o, m)
end

function popHostContainer(m: Fiber)
	h(j, m)
	h(k, m)
	h(l, m)
end

function getHostContext(): HostContext
	
	
	
	return j.current
end

function pushHostContext(m: Fiber)
	local n: Container = requiredContext(l.current)
	local o: HostContext = requiredContext(j.current)
	local p = d(o, m.type, n)

	
	if o == p then
		return
	end

	
	
	g(k, m, m)
	g(j, p, m)
end

function popHostContext(m: Fiber)
	
	
	if k.current ~= m then
		return
	end

	h(j, m)
	h(k, m)
end

return {
	getHostContext = getHostContext,
	getRootHostContainer = getRootHostContainer,
	popHostContainer = popHostContainer,
	popHostContext = popHostContext,
	pushHostContainer = pushHostContainer,
	pushHostContext = pushHostContext,
}
