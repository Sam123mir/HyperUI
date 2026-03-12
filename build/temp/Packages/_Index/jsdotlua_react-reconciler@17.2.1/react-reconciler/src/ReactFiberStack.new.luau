










local a = require(script.Parent.Parent:WaitForChild('shared')).console

local b = require(script.Parent:WaitForChild('ReactInternalTypes'))
type Fiber = b.Fiber

type Array<T> = { [number]: T }

type null = {}
local c: null = {}

export type StackCursor<T> = { current: T }

local d: Array<any> = {}

local e: Array<Fiber | null>

if _G.__DEV__ then
	e = {}
end

local f = 0

local function createCursor<T>(g: T): StackCursor<T>
	return {
		current = g,
	}
end

local function isEmpty(): boolean
	return f == 0
end

local function pop<T>(g: StackCursor<T>, h: Fiber): ()
	if f < 1 then
		if _G.__DEV__ then
			a.error("Unexpected pop.")
		end
		return
	end

	if _G.__DEV__ then
		
		if h ~= e[f] :: Fiber then
			a.error("Unexpected Fiber popped.")
		end
	end

	local i = d[f]
	if i == c then
		
		g.current = nil :: any
	else
		g.current = i
	end

	d[f] = nil

	if _G.__DEV__ then
		e[f] = nil
	end

	f -= 1
end

local function push<T>(g: StackCursor<T>, h: T, i: Fiber): ()
	f += 1

	local j = g.current
	if j == nil then
		d[f] = c
	else
		d[f] = j
	end

	if _G.__DEV__ then
		e[f] = i
	end

	g.current = h
end

local function checkThatStackIsEmpty()
	if _G.__DEV__ then
		if f ~= 0 then
			a.error("Expected an empty stack. Something was not reset properly.")
		end
	end
end

local function resetStackAfterFatalErrorInDev()
	if _G.__DEV__ then
		f = 0
		
		table.clear(d)
		table.clear(e)
	end
end

return {
	createCursor = createCursor,
	isEmpty = isEmpty,
	pop = pop,
	push = push,
	
	checkThatStackIsEmpty = checkThatStackIsEmpty,
	resetStackAfterFatalErrorInDev = resetStackAfterFatalErrorInDev,
}
