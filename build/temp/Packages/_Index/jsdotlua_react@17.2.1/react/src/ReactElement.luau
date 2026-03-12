







local a = _G.__DEV__ :: boolean
local b = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
local c = b.Error
type Object = b.Object


local d = require(script.Parent.Parent:WaitForChild('shared')).console
local e = require(script.Parent.Parent:WaitForChild('shared'))
type React_StatelessFunctionalComponent<P> = e.React_StatelessFunctionalComponent<
	P
>
type React_ComponentType<P> = e.React_ComponentType<P>
type React_AbstractComponent<P, T> = e.React_AbstractComponent<P, T>
type ReactProviderType<T> = e.ReactProviderType<T>
type React_ElementProps<ElementType> = e.React_ElementProps<ElementType>
type React_Node = e.React_Node
type ReactElement<P = Object, T = any> = e.ReactElement<P, T>
type ReactContext<T> = e.ReactContext<T>
type Source = e.Source

local f = require(script.Parent:WaitForChild('ReactLazy'))
type LazyComponent<T, P> = f.LazyComponent<T, P>

local g = require(script.Parent.Parent:WaitForChild('shared')).getComponentName



local h =
	require(script.Parent.Parent:WaitForChild('shared')).ReactSymbols.REACT_ELEMENT_TYPE
local i =
	require(script.Parent.Parent:WaitForChild('shared')).ReactSharedInternals.ReactCurrentOwner



local j = {
	key = true,
	ref = true,
	__self = true,
	__source = true,
}


local k, l, m

if a then
	m = {}
end

local n = {}

local function hasValidRef(o)
	if a then
		
		
		if o.ref ~= nil and type(o.ref) == "table" then
			if (o.ref :: any).isReactWarning then
				return false
			end
		end
	end

	return o.ref ~= nil
end

local function hasValidKey(o)
	if a then
		
		
		if o.key ~= nil and type(o.key) == "table" then
			if (o.key :: any).isReactWarning then
				return false
			end
		end
	end

	return o.key ~= nil
end

local o = { isReactWarning = true }




local function defineKeyPropWarningGetter(p, q: string)
	local r = function()
		if a then
			if not k then
				k = true
				d.error(
[[%s: `key` is not a prop. Trying to access it will result in `nil` being returned. If you need to access the same value within the child component, you should pass it as a different prop. (https://reactjs.org/link/special-props)]]


,
					q
				)
			end
		end
	end

	
	
	p.key = nil
	setmetatable(p, {
		__index = function(s, t)
			if t == "key" then
				r()
				
				return o
			end
			
			return nil :: any
		end,
	})
end

local function defineRefPropWarningGetter(p, q: string)
	
	
	local r = function()
		if a then
			if not l then
				l = true
				d.error(
[[%s: `ref` is not a prop. Trying to access it will result in `nil` being returned. If you need to access the same value within the child component, you should pass it as a different prop. (https://reactjs.org/link/special-props)]]


,
					q
				)
			end
		end
	end

	
	
	p.ref = nil
	setmetatable(p :: any, {
		__index = function(s, t)
			if t == "ref" then
				r()
				
				return o
			end
			
			return nil :: any
		end,
	})
end

local function warnIfStringRefCannotBeAutoConverted(p)
	if a then
		if
			
			type(p.ref) == "string" and i.current
			
			
		then
			local q = g(i.current.type)

			
			if not m[q] then
				error(
					string.format(
[[Component "%s" contains the string ref "%s". Support for string refs has been removed. We recommend using useRef() or createRef() instead. Learn more about using refs safely here: https://reactjs.org/link/strict-mode-string-ref]]



,
						q or "Unknown",
						p.ref
					)
				)
				
			end
		end
	end
end























local function ReactElement<P, T>(
	p: T,
	q,
	r,
	s,
	t: Source?,
	u,
	v: P
): ReactElement<P, T>
	
	local w = {
		
		type = p,
		key = q,
		ref = r,
		props = v,
		
		_owner = u,
	}

	
	w["$$typeof"] = h

	if a then
		
		
		
		
		local x = {
			validated = false,
		}
		w._store = setmetatable({}, {
			
			
			
			
			__index = x,
			__newindex = function(y, z, A)
				if z == "validated" then
					x.validated = A
				else
					rawset(y, z, A)
				end
			end,
		})
		
		setmetatable(w, {
			__index = {
				_self = s,
				
				
				_source = t,
			},
		})
	end

	
	return w :: any
end









n.jsx = function(p, q, r)
	
	error("JSX is currently unsupported")
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
end








n.jsxDEV = function(p, q, r, s, t)
	
	error("JSX is currently unsupported")
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	return nil
	
end










local function createElement<P, T>(
	p: React_StatelessFunctionalComponent<P> | React_ComponentType<P> | React_AbstractComponent<P, T> | ReactContext<any> | LazyComponent<T, P> | ReactProviderType<any> | string,
	q: P?,
	...: React_Node | ((...any) -> React_Node
)): ReactElement<P, T>
	
	local r = if q ~= nil then table.clone(q :: any) :: any else {}
	
	local s: (string | number)? 	
local t 	
local u 	
local v: Source? 
	
if q ~= nil then
		
		
		if hasValidRef(q :: any) then
			t = ((q :: any) :: React_ElementProps<T>).ref

			if a then
				warnIfStringRefCannotBeAutoConverted(
					(q :: any) :: React_ElementProps<T>
				)
			end
		end

		
		if hasValidKey(q :: any) then
			local w = (q :: any).key
			
			
			
			if type(w) == "number" then
				s = w
			else
				
				s = tostring(w :: any)
			end
		end
		

		
		
		

		v = if ((q :: any) :: React_ElementProps<T>).__source == nil
			then nil
			else ((q :: any) :: React_ElementProps<T>).__source

		
		
		if r.key ~= nil then
			r.key = nil
		end
		if r.ref ~= nil then
			r.ref = nil
		end
		if r.__self ~= nil then
			r.__self = nil
		end
		if r.__source ~= nil then
			r.__source = nil
		end
		
	end

	
	
	
	local w = select("#", ...)

	if w == 1 then
		r.children = select(1, ...)
	elseif w > 1 then
		
		
		local x = table.create(w)
		for y = 1, w do
			local z = select(y, ...)
			table.insert(x, z)
		end

		

		if a then
			table.freeze(x)
		end

		r.children = x
	end

	
	
	
	if
		type(p :: any) == "table"
		and (p :: T & React_ComponentType<P>).defaultProps
	then
		
		
		local x = (p :: T & React_ComponentType<P>).defaultProps :: P

		
		for y, z in (x :: any) :: Object do
			if r[y] == nil then
				r[y] = ((x :: any) :: Object)[y]
			end
		end
	end

	if a then
		if s or t then
			
			local x

			if type(p) == "function" then
				
				x = debug.info(p, "n") or "<function>"
			elseif type(p) == "table" then
				x = (
					(p :: T & React_ComponentType<P>).displayName
					or (p :: T & React_ComponentType<P>).name
				) or "Unknown"
			else
				
				x = p :: string
			end
			

			if s then
				defineKeyPropWarningGetter(r, x)
			end

			if t then
				defineRefPropWarningGetter(r, x)
			end
		end

		
		
		if v == nil then
			
			v = {
				fileName = debug.info(3, "s"),
				lineNumber = debug.info(3, "l"),
			}
		end
		
	end

	
	return ReactElement(
		p,
		s,
		t,
		u,
		v,
		i.current,
		r
	) :: any
end
n.createElement = createElement
















n.cloneAndReplaceKey =
	function<P, T>(p: ReactElement<P, T>, q: any): ReactElement<P, T>
		local r = ReactElement(
			p.type,
			q,
			p.ref,
			p._self,
			p._source,
			p._owner,
			p.props
		)
		return r
	end






n.cloneElement = function<P, T>(
	p: ReactElement<P, T>,
	q: (P & React_ElementProps<T>)?,
	...: React_Node
): ReactElement<P, T>
	
	if p == nil then
		error(
			c.new(
				"React.cloneElement(...): The argument must be a React element, but you passed "
					.. tostring(p)
			)
		)
	end

	
	local r = p.props
	local s: P & React_ElementProps<T> = if r ~= nil
		then table.clone(r :: P & React_ElementProps<T>) :: any
		else {} :: P & React_ElementProps<T>

	
	local t = p.key
	local u = p.ref

	
	
	

	
	
	
	local v = p._source

	
	local w = p._owner

	if q ~= nil then
		
		local x = q.ref
		if x ~= nil then
			
			u = x
			w = i.current
		else
			hasValidRef(q)
		end

		local y = q.key
		
		if y ~= nil then
			if type(y) == "number" then
				t = y
			else
				
				t = y :: any or "nil"
			end
		else
			hasValidKey((q :: any) :: React_ElementProps<T>)
		end
		
	end

	
	local x = p.type
	local y: P? = if type(x) == "table"
		then x.defaultProps
		else nil

	
	
	if q ~= nil then
		for z, A in q :: any do
			if (q :: any)[z] ~= nil and not j[z] then
				if (q :: any)[z] == nil and y ~= nil then
					
					
					(s :: any)[z] = (y :: any)[z]
				else
					(s :: any)[z] = (q :: any)[z]
				end
			end
		end
	end

	
	
	
	local z = select("#", ...)

	if z == 1 then
		s.children = select(1, ...)
	elseif z > 1 then
		(s :: any).children = { ... }
	end
	

	
	return ReactElement(
		p.type,
		t,
		u,
		nil,
		v,
		w,
		(s :: any) :: P & React_ElementProps<T>
	) :: any
end








n.isValidElement = function(p)
	return type(p) == "table" and p["$$typeof"] == h
end

return n
