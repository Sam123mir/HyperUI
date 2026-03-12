











local a = require(script.Parent.Parent:WaitForChild('shared')).console

local b = require(script.Parent:WaitForChild('ReactInternalTypes'))
type Fiber = b.Fiber
local c = require(script.Parent:WaitForChild('ReactCurrentFiber'))
local d = c.resetCurrentFiber
local e = c.setCurrentFiber
local f = require(script.Parent.Parent:WaitForChild('shared')).getComponentName
local g = require(script.Parent:WaitForChild('ReactTypeOfMode')).StrictMode

type Set<T> = { [T]: boolean }
type Array<T> = { [number]: T }
type Map<K, V> = { [K]: V }
type FiberArray = Array<Fiber>
type FiberToFiberComponentsMap = Map<Fiber, FiberArray>

local h = {
	recordUnsafeLifecycleWarnings = function(h: Fiber, i: any) end,
	flushPendingUnsafeLifecycleWarnings = function() end,
	recordLegacyContextWarning = function(h: Fiber, i: any) end,
	flushLegacyContextWarning = function() end,
	discardPendingWarnings = function() end,
}

if _G.__DEV__ then
	local i = function(i: Fiber): Fiber | nil
		local j 
		
		
local k: Fiber? = i
		while k ~= nil do
			if bit32.band(k.mode, g) ~= 0 then
				j = k
			end
			k = k.return_
		end

		return j
	end

	local j = function(j): string
		local k = {}
		for l, m in j do
			table.insert(k, l)
		end
		table.sort(k)
		return table.concat(k, ", ")
	end

	local k: Array<Fiber> = {}
	local l: Array<Fiber> = {}
	local m: Array<Fiber> = {}
	local n: Array<Fiber> = {}
	local o: Array<Fiber> = {}
	local p: Array<Fiber> = {}

	
	local q = {}

	h.recordUnsafeLifecycleWarnings =
		function(r: Fiber, s: any)
			
			if q[r.type] then
				return
			end

			if
				typeof(s.componentWillMount) == "function"
				
				
				
			then
				table.insert(k, r)
			end

			if
				bit32.band(r.mode, g) ~= 0
				and typeof(s.UNSAFE_componentWillMount) == "function"
			then
				table.insert(l, r)
			end

			if
				typeof(s.componentWillReceiveProps) == "function"
				
				
			then
				table.insert(m, r)
			end

			if
				bit32.band(r.mode, g) ~= 0
				and typeof(s.UNSAFE_componentWillReceiveProps) == "function"
			then
				table.insert(n, r)
			end

			if
				typeof(s.componentWillUpdate) == "function"
				
				
			then
				table.insert(o, r)
			end

			if
				bit32.band(r.mode, g) ~= 0
				and typeof(s.UNSAFE_componentWillUpdate) == "function"
			then
				table.insert(p, r)
			end
		end

	h.flushPendingUnsafeLifecycleWarnings = function()
		
		local r = {}
		if #k > 0 then
			for s, t in k do
				r[f(t.type) or "Component"] =
					true
				q[t.type] = true
			end
			table.clear(k)
		end

		local s = {}
		if #l > 0 then
			for t, u in l do
				s[f(u.type) or "Component"] =
					true
				q[u.type] = true
			end
			table.clear(l)
		end

		local t = {}
		if #m > 0 then
			for u, v in m do
				t[f(v.type) or "Component"] =
					true
				q[v.type] = true
			end

			table.clear(m)
		end

		local u = {}
		if #n > 0 then
			for v, w in n do
				u[f(w.type) or "Component"] =
					true
				q[w.type] = true
			end

			table.clear(n)
		end

		local v = {}
		if #o > 0 then
			for w, x in o do
				v[f(x.type) or "Component"] =
					true
				q[x.type] = true
			end

			table.clear(o)
		end

		local w = {}
		if #p > 0 then
			for x, y in p do
				w[f(y.type) or "Component"] =
					true
				q[y.type] = true
			end

			table.clear(p)
		end

		
		
		
		if next(s) ~= nil then
			local x = j(s)
			a.error(
[[Using UNSAFE_componentWillMount in strict mode is not recommended and may indicate bugs in your code. See https://reactjs.org/link/unsafe-component-lifecycles for details.

* Move code with side effects to componentDidMount, and set initial state in the constructor.

Please update the following components: %s]],
				x
			)
		end

		
		if next(u) ~= nil then
			local x =
				j(u)
			a.error(
[[Using UNSAFE_componentWillReceiveProps in strict mode is not recommended and may indicate bugs in your code. See https://reactjs.org/link/unsafe-component-lifecycles for details.

* Move data fetching code or side effects to componentDidUpdate.
* If you're updating state whenever props change, refactor your code to use memoization techniques or move it to static getDerivedStateFromProps. Learn more at: https://reactjs.org/link/derived-state

Please update the following components: %s]]
,
				x
			)
		end

		
		if next(w) ~= nil then
			local x = j(w)
			a.error(
[[Using UNSAFE_componentWillUpdate in strict mode is not recommended and may indicate bugs in your code. See https://reactjs.org/link/unsafe-component-lifecycles for details.

* Move data fetching code or side effects to componentDidUpdate.

Please update the following components: %s]],
				x
			)
		end

		
		if next(r) ~= nil then
			local x = j(r)

			
			
			
			a.warn(
[[componentWillMount has been renamed, and is not recommended for use. See https://reactjs.org/link/unsafe-component-lifecycles for details.

* Move code with side effects to componentDidMount, and set initial state in the constructor.
* Rename componentWillMount to UNSAFE_componentWillMount to suppress this warning in non-strict mode. In React 18.x, only the UNSAFE_ name will work.

Please update the following components: %s]],
				x
			)
		end

		
		if next(t) ~= nil then
			local x = j(t)

			
			
			
			a.warn(
[[componentWillReceiveProps has been renamed, and is not recommended for use. See https://reactjs.org/link/unsafe-component-lifecycles for details.

* Move data fetching code or side effects to componentDidUpdate.
* If you're updating state whenever props change, refactor your code to use memoization techniques or move it to static getDerivedStateFromProps. Learn more at: https://reactjs.org/link/derived-state
* Rename componentWillReceiveProps to UNSAFE_componentWillReceiveProps to suppress this warning in non-strict mode. In React 18.x, only the UNSAFE_ name will work.

Please update the following components: %s]]

,
				x
			)
		end

		
		if next(v) ~= nil then
			local x = j(v)

			
			
			
			a.warn(
[[componentWillUpdate has been renamed, and is not recommended for use. See https://reactjs.org/link/unsafe-component-lifecycles for details.

* Move data fetching code or side effects to componentDidUpdate.
* Rename componentWillUpdate to UNSAFE_componentWillUpdate to suppress this warning in non-strict mode. In React 18.x, only the UNSAFE_ name will work.

Please update the following components: %s]],
				x
			)
		end
	end

	local r: FiberToFiberComponentsMap = {}

	
	local s = {}

	h.recordLegacyContextWarning =
		function(t: Fiber, u: any)
			local v = i(t)
			if v == nil then
				a.error(
[[Expected to find a StrictMode component in a strict mode tree. This error is likely caused by a bug in React. Please file an issue.]]				

)
				return
			end

			
			if s[t.type] then
				return
			end

			
			local w = r[v :: Fiber]

			
			if
				typeof(t.type) ~= "function"
				and (
					t.type.contextTypes ~= nil
					or t.type.childContextTypes ~= nil
					or (
						u ~= nil
						and typeof(u.getChildContext) == "function"
					)
				)
			then
				if w == nil then
					w = {}
					
					r[v :: Fiber] = w
				end
				table.insert(w, t)
			end
		end

	h.flushLegacyContextWarning = function()
		for t, u in r do
			if #u == 0 then
				return
			end
			local v = u[1]

			local w = {}
			for x, y in u do
				w[f(y.type) or "Component"] = true
				s[y.type] = true
			end

			local x = j(w)

			local y, z = pcall(function()
				e(v)
				a.error(
[[Legacy context API has been detected within a strict-mode tree.

The old API will be supported in all 16.x releases, but applications using it should migrate to the new version.

Please update the following components: %s

Learn more about this warning here: https://reactjs.org/link/legacy-context]],
					x
				)
			end)

			
			d()

			if not y then
				error(z)
			end
		end
	end

	h.discardPendingWarnings = function()
		
		table.clear(k)
		table.clear(l)
		table.clear(m)
		table.clear(n)
		table.clear(o)
		table.clear(p)
		table.clear(r)
	end
end

return h
