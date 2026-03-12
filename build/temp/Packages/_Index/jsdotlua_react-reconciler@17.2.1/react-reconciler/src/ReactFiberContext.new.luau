









local a = _G.__DEV__ :: boolean
local b =
	_G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ :: boolean

local c = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
local d = c.Object
local e = c.Error


local f = require(script.Parent.Parent:WaitForChild('shared')).console

local g = require(script.Parent:WaitForChild('ReactInternalTypes'))
type Fiber = g.Fiber
local h = require(script.Parent:WaitForChild('ReactFiberStack.new'))
type StackCursor<T> = h.StackCursor<T>

local i = require(script.Parent:WaitForChild('ReactFiberTreeReflection')).isFiberMounted
local j =
	require(script.Parent.Parent:WaitForChild('shared')).ReactFeatureFlags.disableLegacyContext
local k = require(script.Parent:WaitForChild('ReactWorkTags'))
local l = k.ClassComponent
local m = k.HostRoot
local n = require(script.Parent.Parent:WaitForChild('shared')).getComponentName
local o = require(script.Parent.Parent:WaitForChild('shared')).checkPropTypes

local p = h.createCursor
local q = h.push
local r = h.pop

local s

if a then
	s = {}
end

local t = {}
if a then
	d.freeze(t)
end


type Object = { [any]: any }


local u: StackCursor<Object> = p(t)

local v: StackCursor<boolean> = p(false)



local w: Object = t


local x


local function getUnmaskedContext(
	y: Fiber,
	z: any,
	A: boolean
): Object
	
	
	
	
	if A and x(z) then
		
		
		
		
		return w
	end
	return u.current
	
end

local function cacheContext(
	y: Fiber,
	z: Object,
	A: Object
): ()
	
	
	
	
	local B = y.stateNode
	B.__reactInternalMemoizedUnmaskedChildContext = z
	B.__reactInternalMemoizedMaskedChildContext = A
	
end

local function getMaskedContext(y: Fiber, z: Object): Object
	
	
	
	
	local A = y.type
	
	
	if type(A) == "function" then
		return z
	end

	local B = A.contextTypes
	if not B then
		return t
	end

	
	
	
	local C = y.stateNode
	if
		C
		and C.__reactInternalMemoizedUnmaskedChildContext == z
	then
		return C.__reactInternalMemoizedMaskedChildContext
	end

	local D = {}
	for E, F in B do
		D[E] = z[E]
	end

	if a or b then
		local E = n(A) or "Unknown"
		
		o(B, nil, D, "context", E)
	end

	
	
	if C then
		cacheContext(y, z, D)
	end

	return D
	
end

local function hasContextChanged(): boolean
	if j then
		return false
	else
		return v.current
	end
end


function x(y): boolean
	
	
	
	
	
	
	if type(y) == "function" then
		return false
	end
	local z = y.childContextTypes
	return z ~= nil
	
end

local function popContext(y: Fiber): ()
	
	
	
	
	r(v, y)
	r(u, y)
	
end

local function popTopLevelContextObject(y: Fiber): ()
	
	
	
	
	r(v, y)
	r(u, y)
	
end

local function pushTopLevelContextObject(
	y: Fiber,
	z: Object,
	A: boolean
): ()
	
	
	
	
	if u.current ~= t then
		error(
			e.new(
[[Unexpected context found on stack. This error is likely caused by a bug in React. Please file an issue.]]			

)
		)
	end

	q(u, z, y)
	q(v, A, y)
	
end

local function processChildContext(
	y: Fiber,
	z: any,
	A: Object
): Object
	
	
	
	
	local B = y.stateNode
	local C = z.childContextTypes

	
	
	if
		B.getChildContext == nil
		or type(B.getChildContext) ~= "function"
	then
		if a then
			local D = n(z) or "Unknown"

			if not s[D] then
				s[D] = true
				f.error(
[[%s.childContextTypes is specified but there is no getChildContext() method on the instance. You can either define getChildContext() on %s or remove childContextTypes from it.]]

,
					D,
					D
				)
			end
		end
		return A
	end

	local D = B:getChildContext()
	for E, F in D do
		if C[E] == nil then
			local G = n(z) or "Unknown"
			error(
				e.new(
					string.format(
						'%s.getChildContext(): key "%s" is not defined in childContextTypes.',
						G,
						E
					)
				)
			)
		end
	end
	if a or b then
		local E = n(z) or "Unknown"
		
		o(C, nil, D, "child context", E)
	end

	return d.assign({}, A, D)
	
end

local function pushContextProvider(y: Fiber): boolean
	
	
	
	
	local z = y.stateNode
	
	
	
	local A = (
		z and z.__reactInternalMemoizedMergedChildContext
	) or t

	
	
	w = u.current
	q(u, A, y)
	q(v, v.current, y)

	return true
	
end

local function invalidateContextProvider(
	y: Fiber,
	z: any,
	A: boolean
): ()
	
	
	
	
	local B = y.stateNode

	if not B then
		error(
			e.new(
[[Expected to have an instance by this point. This error is likely caused by a bug in React. Please file an issue.]]			

)
		)
	end

	if A then
		
		
		
		local C = processChildContext(y, z, w)
		B.__reactInternalMemoizedMergedChildContext = C

		
		
		r(v, y)
		r(u, y)
		
		q(u, C, y)
		q(v, A, y)
	else
		r(v, y)
		q(v, A, y)
	end
	
end

local function findCurrentUnmaskedContext(y: Fiber): Object
	
	
	
	
	
	
	if y.tag ~= l or not i(y) then
		error(
			e.new(
[[Expected subtree parent to be a mounted class component. This error is likely caused by a bug in React. Please file an issue.]]			

)
		)
	end

	
	local z: any = y
	repeat
		if z.tag == m then
			return z.stateNode.context
		elseif z.tag == l then
			local A = z.type
			
			if A.childContextTypes ~= nil then
				return z.stateNode.__reactInternalMemoizedMergedChildContext
			end
		end

		z = z.return_
	until z == nil

	error(
		e.new(
[[Found unexpected detached subtree parent. This error is likely caused by a bug in React. Please file an issue.]]		

)
	)
	
end

return {
	emptyContextObject = t,
	getUnmaskedContext = getUnmaskedContext,
	cacheContext = cacheContext,
	getMaskedContext = getMaskedContext,
	hasContextChanged = hasContextChanged,
	popContext = popContext,
	popTopLevelContextObject = popTopLevelContextObject,
	pushTopLevelContextObject = pushTopLevelContextObject,
	processChildContext = processChildContext,
	isContextProvider = x,
	pushContextProvider = pushContextProvider,
	invalidateContextProvider = invalidateContextProvider,
	findCurrentUnmaskedContext = findCurrentUnmaskedContext,
}
