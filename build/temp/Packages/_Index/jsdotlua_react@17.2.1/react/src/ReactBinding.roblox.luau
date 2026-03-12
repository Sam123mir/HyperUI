















local a = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
local b = require(script.Parent.Parent:WaitForChild('shared')).ReactSymbols

local c = require(script.Parent.Parent:WaitForChild('shared'))
type Binding<T> = c.ReactBinding<T>
type BindingUpdater<T> = c.ReactBindingUpdater<T>

local d = a.Symbol
local e = require(script.Parent:WaitForChild('createSignal.roblox'))

local f = d("BindingImpl")

type BindingInternal<T> = {
	["$$typeof"]: typeof(b.REACT_BINDING_TYPE),
	value: T,

	getValue: (BindingInternal<T>) -> T,
	
	map: <U>(BindingInternal<T>, (T) -> U) -> any,

	update: (T) -> (),
	subscribe: ((T) -> ()) -> (() -> ())
}

local g = {}

local h = {}

function h.getValue<T>(i: BindingInternal<T>): T
	return g.getValue(i)
end

function h.map<T, U>(
	i: BindingInternal<T>,
	j: (T) -> U
): Binding<U>
	return g.map(i, j)
end

local i = {
	__index = h,
	__tostring = function(i)
		return string.format("RoactBinding(%s)", tostring(i:getValue()))
	end,
}

function g.update<T>(j: any, k: T)
	return (j[f] :: BindingInternal<T>).update(k)
end

function g.subscribe<T>(j: any, k: (T) -> ())
	return (j[f] :: BindingInternal<T>).subscribe(k)
end

function g.getValue<T>(j: any): T
	return (j[f] :: BindingInternal<T>):getValue()
end

function g.create<T>(j: T): (Binding<T>, BindingUpdater<T>)
	local k, l = e()
	local m = {
		value = j,
		subscribe = k,
	}

	function m.update(n: T)
		m.value = n
		l(n)
	end

	function m.getValue()
		return m.value
	end

	local n
	if _G.__DEV__ then
		
		n = debug.traceback("Binding created at:", 3)
	end

	return (setmetatable({
		["$$typeof"] = b.REACT_BINDING_TYPE,
		[f] = m,
		_source = n,
	}, i) :: any) :: Binding<T>,
		m.update
end

function g.map<T, U>(
	j: BindingInternal<T>,
	k: (T) -> U
): Binding<U>
	if _G.__DEV__ then
		
		assert(
			typeof(j) == "table"
				and j["$$typeof"] == b.REACT_BINDING_TYPE,
			"Expected `self` to be a binding"
		)
		assert(typeof(k) == "function", "Expected arg #1 to be a function")
	end

	local l = {}

	function l.subscribe(m)
		return g.subscribe(j, function(n)
			m(k(n))
		end)
	end

	function l.update(m)
		error("Bindings created by Binding:map(fn) cannot be updated directly", 2)
	end

	function l.getValue()
		return k(j:getValue())
	end

	local m
	if _G.__DEV__ then
		
		m = debug.traceback("Mapped binding created at:", 3)
	end

	return (
		setmetatable({
			["$$typeof"] = b.REACT_BINDING_TYPE,
			[f] = l,
			_source = m,
		}, i) :: any
	) :: Binding<U>
end



function g.join<T>(
	j: { [(string | number)]: Binding<any> }
): Binding<T>
	if _G.__DEV__ then
		assert(typeof(j) == "table", "Expected arg #1 to be of type table")

		for k, l in j do
			if
				typeof(l) ~= "table"
				or (l :: any)["$$typeof"] ~= b.REACT_BINDING_TYPE
			then
				local m = ("Expected arg #1 to contain only bindings, but key %q had a non-binding value"):format(
					tostring(k)
				)
				error(m, 2)
			end
		end
	end

	local k = {}

	local function getValue()
		local l = {}

		
		for m, n in pairs(j) do
			l[m] = n:getValue()
		end

		return l
	end

	function k.subscribe(l)
		
		local m: any = {}

		for n, o in j do
			m[n] = g.subscribe(o, function(p)
				l(getValue())
			end)
		end

		return function()
			if m == nil then
				return
			end

			for n, o in m do
				o()
			end

			m = nil
		end
	end

	function k.update(l)
		error("Bindings created by joinBindings(...) cannot be updated directly", 2)
	end

	function k.getValue()
		return getValue()
	end

	local l
	if _G.__DEV__ then
		
		l = debug.traceback("Joined binding created at:", 2)
	end

	return (
		setmetatable({
			["$$typeof"] = b.REACT_BINDING_TYPE,
			[f] = k,
			_source = l,
		}, i) :: any
	) :: Binding<T>
end

return g
