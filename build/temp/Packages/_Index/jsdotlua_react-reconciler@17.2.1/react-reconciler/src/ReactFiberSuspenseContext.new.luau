











local a = require(script.Parent:WaitForChild('ReactInternalTypes'))
type Fiber = a.Fiber

local b = require(script.Parent:WaitForChild('ReactFiberStack.new'))
type StackCursor<T> = b.StackCursor<T>

local c = b.createCursor
local d = b.push
local e = b.pop

export type SuspenseContext = number
export type SubtreeSuspenseContext = SuspenseContext
export type ShallowSuspenseContext = SuspenseContext

local f = {}

local g: SuspenseContext = 0b00





local h: SuspenseContext = 0b01









local i: SubtreeSuspenseContext = 0b01
f.InvisibleParentSuspenseContext = i





local j: ShallowSuspenseContext = 0b10
f.ForceSuspenseFallback = j

local k: StackCursor<SuspenseContext> =
	c(g)
f.suspenseStackCursor = k

function f.hasSuspenseContext(
	l: SuspenseContext,
	m: SuspenseContext
): boolean
	return bit32.band(l, m) ~= 0
end

function f.setDefaultShallowSuspenseContext(
	l: SuspenseContext
): SuspenseContext
	return bit32.band(l, h)
end

function f.setShallowSuspenseContext(
	l: SuspenseContext,
	m: ShallowSuspenseContext
): SuspenseContext
	return bit32.bor(
		bit32.band(l, h),
		m
	)
end

function f.addSubtreeSuspenseContext(
	l: SuspenseContext,
	m: SubtreeSuspenseContext
): SuspenseContext
	return bit32.bor(l, m)
end

function f.pushSuspenseContext(l: Fiber, m: SuspenseContext)
	d(k, m, l)
end

function f.popSuspenseContext(l: Fiber)
	e(k, l)
end

return f
