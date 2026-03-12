







local a = _G.__DEV__ :: boolean
local b = _G.__COMPAT_WARNINGS__ :: boolean
local c = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
local d = c.Object
type Object = c.Object

local e = require(script.Parent.Parent:WaitForChild('shared')).console

local f = require(script.Parent.Parent:WaitForChild('shared'))



type React_Component<Props, State = nil> = f.React_Component<Props, State>
local g = require(script.Parent:WaitForChild('ReactNoopUpdateQueue'))
local h = {}

if a then
	d.freeze(h)
end



local i = require(script.Parent.Parent:WaitForChild('shared')).UninitializedState







local j = {
	isReactComponent = true,
}






local function trimPath(k: string): string
	
	
	
	

	local l = string.match(k, "%.%u[%.%w]-$")
	if l then
		return string.gsub(l, "^%.", "")
	end

	return k
end

local function warnAboutExistingLifecycle(k, l, m)
	e.warn(
		"%s already defined '%s', but it also defining the deprecated Roact method '%s'. %s should only implement one of these methods, preferably using the non-deprecated name.",
		k,
		m,
		l,
		k
	)
end

local function warnAboutDeprecatedLifecycleName(k, l, m)
	if a and b then
		local n, o = debug.info(3, "sln")
		e.warn(
			"%s is using method '%s', which is no longer supported and should be updated to '%s'\nFile: %s:%s",
			k,
			l,
			m,
			trimPath(n),
			tostring(o)
		)
	end
end

local k = {
	didMount = "componentDidMount",
	shouldUpdate = "shouldComponentUpdate",
	willUpdate = "UNSAFE_componentWillUpdate",
	didUpdate = "componentDidUpdate",
	willUnmount = "componentWillUnmount",
}

local function handleNewLifecycle(l, m, n)
	
	if k[m] ~= nil then
		
		if l[k[m] ] ~= nil then
			warnAboutExistingLifecycle(l.__componentName, m, k[m])
		
		elseif m == "willUpdate" and l["componentWillUpdate"] then
			warnAboutExistingLifecycle(
				l.__componentName,
				m,
				"UNSAFE_componentWillUpdate"
			)
		
		else
			warnAboutDeprecatedLifecycleName(
				l.__componentName,
				m,
				k[m]
			)
		end
		
		m = k[m]
	end
	rawset(l, m, n)
end

local l = {
	__newindex = handleNewLifecycle,
	__index = j,
	__tostring = function(l)
		return l.__componentName
	end,
}


type React_BaseComponent = React_Component<any, any> & {
	extend: (self: React_BaseComponent, name: string) -> React_Component<any, any>
}

local m = (
	setmetatable({ __componentName = "Component" }, l) :: any
) :: React_BaseComponent









local n = if not _G.__TESTEZ_RUNNING_TEST__ then 900 else 0
local o = 1
local p = table.create(n)
for q = 1, n do
	table.insert(p, {
		
		props = nil,
		context = nil,
		state = i,
		__refs = h,
		__updater = g,
	})
end

local function setStateInInit(
	q: React_Component<any, any>,
	r: any,
	s: nil
): ()
	if a and (s :: any) ~= nil then
		e.warn(
[[Received a `callback` argument to `setState` during initialization of "%s". The callback behavior is not supported when using `setState` in `init`.

Consider defining similar behavior in a `compontentDidMount` method instead.]]
,
			q.__componentName
		)
	end

	
	local t = r and type(r)
	if
		r == nil
		or (t ~= "table" and t ~= "function")
	then
		error(
[[setState(...): takes an object of state variables to update or a function which returns an object of state variables.]]		

)
	end
	local u = q.state
	local v
	if t == "function" then
		
		v = r(u, q.props)
	else
		
		v = r
	end
	
	
	q.state = d.assign({}, u, v)
end

function m:extend(q): React_Component<any, any>
	
	
	if q == nil then
		if b then
			e.warn(
[[Component:extend() accepting no arguments is deprecated, and will not be supported in a future version of Roact. Please provide an explicit name.]]			

)
		end
		q = ""
	elseif type(q) ~= "string" then
		error("Component class name must be a string")
	end

	
	local r = {
		__componentName = q,
		setState = self.setState,
		forceUpdate = self.forceUpdate,
		init = nil, 
	}
	
	
	
	
	
	
	
	

	r.__index = r
	

	function r.__ctor<P>(s: P, t, u): React_Component<P, any>
		local v
		
		if o <= n then
			v = p[o]
			
			
			v.props = s :: any
			v.context = t
			
			p[o] = nil
			o += 1
		else
			
			
			v = {
				
				props = s :: any,
				context = t,
				state = i,
				__refs = h,
				__updater = u or g,
			}

			
			
			
			
			
			
			
			
			
			
			
			
			
		end

		
		
		
		
		
		v = setmetatable(v, r)

		
		if r.init and type(r.init) == "function" then
			
			
			
			v.setState = setStateInInit

			r.init(v, s, t)

			
			v.setState = nil :: any
		end

		return (v :: any) :: React_Component<P, any>
	end

	setmetatable(r, getmetatable(self :: any))

	return (r :: any) :: React_Component<any, any>
end


























function m:setState(q, r)
	if
		q ~= nil
		and type(q) ~= "table"
		and type(q) ~= "function"
	then
		error(
[[setState(...): takes an object of state variables to update or a function which returns an object of state variables.]]		

)
	end
	self.__updater.enqueueSetState(self, q, r, "setState")
end
















function m:forceUpdate(q)
	self.__updater.enqueueForceUpdate(self, q, "forceUpdate")
end






if a then
	
	local q = {
		isMounted = {
			"isMounted",
[[Instead, make sure to clean up subscriptions and pending requests in componentWillUnmount to prevent memory leaks.]]
,
		},
		replaceState = {
			"replaceState",
[[Refactor your code to use setState instead (see https://github.com/facebook/react/issues/3236).]]
,
		},
	} :: any

	local r = function(r, s)
		(m :: any)[r] = function()
			e.warn(
				"%s(...) is deprecated in plain JavaScript React classes. %s",
				s[1],
				s[2]
			)
			return nil
		end
	end

	for s, t in q do
		if q[s] ~= nil then
			r(s, q[s])
		end
	end
end








local q = m:extend("PureComponent") :: React_BaseComponent;





(q :: any).extend = m.extend






local r = {
	isReactComponent = true,
	isPureReactComponent = true,
}



setmetatable(q, {
	__newindex = handleNewLifecycle,
	__index = r,
	__tostring = function(s)
		return s.__componentName
	end,
})


return {
	Component = m,
	PureComponent = q :: typeof(m),
}
