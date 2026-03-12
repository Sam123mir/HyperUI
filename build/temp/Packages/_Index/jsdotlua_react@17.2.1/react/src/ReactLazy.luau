











local a = require(script.Parent.Parent:WaitForChild('shared'))
local b = a.console
local c = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
local d = c.util.inspect

local e = require(script.Parent.Parent:WaitForChild('shared'))
type Wakeable = e.Wakeable
type Thenable<R> = e.Thenable<R>
local f = require(script.Parent.Parent:WaitForChild('shared')).ReactSymbols

local g = f.REACT_LAZY_TYPE

local h = -1
local i = 0
local j = 1
local k = 2

type UninitializedPayload<T> = {
	
	
	_status: number,
	_result: () -> Thenable<{ default: T, [string]: any }>
}

type PendingPayload = {
	
	
	_status: number,
	_result: Wakeable
}

type ResolvedPayload<T> = {
	
	
	_status: number,
	_result: { default: T, [string]: any }
}

type RejectedPayload = {
	
	
	_status: number,
	_result: any
}

type Payload<T> =
	UninitializedPayload<T>
	| PendingPayload
	| ResolvedPayload<T>
	| RejectedPayload

export type LazyComponent<T, P> = {
	["$$typeof"]: number,
	_payload: P,
	_init: (payload: P) -> T	

}

function lazyInitializer<T>(l: Payload<T>): T
	if l._status == h then
		local m = l._result
		local n = m()
		
		local o: PendingPayload = l :: any
		o._status = i
		o._result = n
		n:andThen(function(p)
			if l._status == i then
				local q = p.default
				if _G.__DEV__ then
					if q == nil then
						b.error(
[[lazy: Expected the result of a dynamic import() call. Instead received: `%s`

Your code should look like: 
  local MyComponent = lazy(function() return reqquire(script.Parent.MyComponent) end)]]

,
							d(p)
						)
					end
				end
				
				local r: ResolvedPayload<T> = l :: any
				r._status = j
				r._result = q
			end
		end, function(p)
			if l._status == i then
				
				local q: RejectedPayload = l :: any
				q._status = k
				q._result = p
			end
		end)
	end
	if l._status == j then
		return l._result
	else
		error(l._result)
	end
end

local l = {}

l.lazy = function<T>(
	m: () -> Thenable<{ default: T, [string]: any }>
): LazyComponent<T, Payload<T>>
	local n: Payload<T> = {
		
		_status = -1,
		_result = m,
	}

	local o: LazyComponent<T, Payload<T>> = {
		["$$typeof"] = g,
		_payload = n,
		
		_init = lazyInitializer :: any,
	}

	if _G.__DEV__ then
		
		local p
		local q
		
		setmetatable(o, {
			__index = function(r, s)
				if s == "defaultProps" then
					return p
				end
				if s == "propTypes" then
					return q
				end
				return
			end,
			__newindex = function(r, s, t)
				if s == "defaultProps" then
					b.error(
[[React.lazy(...): It is not supported to assign `defaultProps` to a lazy component import. Either specify them where the component is defined, or create a wrapping component around it.]]					


)
					p = t
					
					
					setmetatable(r, {
						__index = function() end,
						__newindex = function() end,
					})
				end
				if s == "propTypes" then
					b.error(
[[React.lazy(...): It is not supported to assign `propTypes` to a lazy component import. Either specify them where the component is defined, or create a wrapping component around it.]]					


)
					q = t
					
					
					setmetatable(r, {
						__index = function() end,
						__newindex = function() end,
					})
				end
			end,
		})
	end

	return o
end

return l
