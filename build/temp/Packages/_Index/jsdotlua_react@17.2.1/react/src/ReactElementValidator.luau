









local a = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
local b = a.Array
type Array<T> = a.Array<T>
local c = a.Boolean
local d = a.Object
type Object = a.Object
local e = require(script.Parent.Parent:WaitForChild('shared')).console
local f = a.util.inspect
type Function = (...any) -> ...any


local g = require(script.Parent.Parent:WaitForChild('shared'))
type React_StatelessFunctionalComponent<P> = g.React_StatelessFunctionalComponent<
	P
>
type React_ComponentType<P> = g.React_ComponentType<P>
type React_Element<ElementType> = g.React_Element<ElementType>
type React_ElementProps<ElementType> = g.React_ElementProps<ElementType>
type ReactElement<P, T> = g.ReactElement<P, T>
type React_Node = g.React_Node
type Source = g.Source


local h = require(script.Parent.Parent:WaitForChild('shared')).isValidElementType
local i = require(script.Parent.Parent:WaitForChild('shared')).getComponentName
local j = require(script.Parent.Parent:WaitForChild('shared')).ReactSymbols
local k = j.getIteratorFn
local l = j.REACT_FORWARD_REF_TYPE
local m = j.REACT_MEMO_TYPE
local n = j.REACT_FRAGMENT_TYPE
local o = j.REACT_ELEMENT_TYPE

local p =
	require(script.Parent.Parent:WaitForChild('shared')).ReactFeatureFlags.warnAboutSpreadingKeyToJSX
local q = require(script.Parent.Parent:WaitForChild('shared')).checkPropTypes
local r =
	require(script.Parent.Parent:WaitForChild('shared')).ReactSharedInternals.ReactCurrentOwner

local s = require(script.Parent:WaitForChild('ReactElement'))
local t = s.isValidElement
local u = s.createElement
local v = s.cloneElement
local w = s.jsxDEV

local x =
	require(script.Parent.Parent:WaitForChild('shared')).ReactSharedInternals.ReactDebugCurrentFrame.setExtraStackFrame
local y =
	require(script.Parent.Parent:WaitForChild('shared')).ReactComponentStackFrame.describeUnknownElementTypeFrameInDEV

local z = {}


local function setCurrentlyValidatingElement(A: ReactElement<any, any> | nil)
	if _G.__DEV__ then
		if A then
			local B = A._owner
			local C 			
if B then
				C = B.type
			end
			local D = y(
				A.type,
				A._source,
				C
			);
			
			(x :: (...any) -> ())(D)
		else
			
			(x :: (...any) -> ())(nil)
		end
	end
end

local A

if _G.__DEV__ then
	A = false
end

local function hasOwnProperty(B, C)
	return B[C] ~= nil
end

local function getDeclarationErrorAddendum(): string
	if r.current then
		local B = i(r.current.type)
		if B then
			return "\n\nCheck the render method of `" .. B .. "`."
		end
	end
	return ""
end


local function getSourceInfoErrorAddendum(B: Source | nil): string
	if B ~= nil then
		local C = string.gsub(B.fileName, "^.*[\\/]", "")
		local D = B.lineNumber
		return "\n\nCheck your code at " .. C .. ":" .. D .. "."
	end
	return ""
end


local function getSourceInfoErrorAddendumForProps(
	B: React_ElementProps<any>?
): string
	if B ~= nil then
		return getSourceInfoErrorAddendum(B.__source)
	end
	return ""
end






local B = {}


local function getCurrentComponentErrorInfo(
	C: React_ComponentType<any> | string | Function
): string
	local D = getDeclarationErrorAddendum()

	if not c.toJSBoolean(D) then
		local E = if typeof(C) == "string"
			then C
			else if typeof(C) == "table"
				then C.displayName or C.name
				else nil

		
		if not E and typeof(C) == "function" then
			local F = debug.info(C, "n")
			
			E = if F ~= "" then F else nil
		end

		if E then
			D = string.format(
				"\n\nCheck the top-level render call using <%s>.",
				E
			)
		end
	end
	return D
end














local function validateExplicitKey<P>(
	C: ReactElement<P, any>,
	D,
	E: any?
)
	if C._store == nil or C._store.validated then
		return
	end
	
	(C._store :: any).validated = true
	
	
	if (C.key ~= nil) ~= (E ~= nil) then
		return
	end
	
	local F = getCurrentComponentErrorInfo(D)
	if B[F] then
		return
	end
	B[F] = true

	
	
	
	local G = ""
	if C and C._owner and C._owner ~= r.current then
		
		G = string.format(
			" It was passed a child from %s.",
			tostring(i(C._owner.type))
		)
	end

	if _G.__DEV__ then
		setCurrentlyValidatingElement(C)
		
		
		if C.key ~= nil and E ~= nil then
			
			
			e.error(
[[Child element received a "key" prop ("%s") in addition to a key in the "children" table of its parent ("%s"). Please provide only one key definition. When both are present, the "key" prop will take precedence.%s%s See https://reactjs.org/link/warning-keys for more information.]]



,
				tostring(C.key),
				tostring(E),
				F,
				G
			)
		
		else
			e.error(
[[Each child in a list should have a unique "key" prop.%s%s See https://reactjs.org/link/warning-keys for more information.]]
,
				F,
				G
			)
		end
		
		setCurrentlyValidatingElement(nil)
	end
end










local function validateChildKeys(C, D)
	if typeof(C) ~= "table" then
		return
	end

	if b.isArray(C) then
		for E = 1, #C do
			local F = C[E]
			if t(F) then
				validateExplicitKey(F :: ReactElement<any, any>, D)
			end
		end
	elseif t(C) then
		
		if C._store then
			C._store.validated = true
		end
	elseif C then
		local E = k(C)
		if typeof(E) == "function" then
			
			
			if E ~= C.entries then
				local F = E(C)
				local G = F.next()
				while not G.done do
					if t(G.value) then
						validateExplicitKey(G.value, D, G.key)
					end

					G = F.next()
				end
			end
		end
	end
end







local function validatePropTypes<P>(C: ReactElement<P, any>)
	if _G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
		local D = C.type
		if D == nil or typeof(D) == "string" then
			return
		end

		local E
		local F
		if typeof(D) == "function" then
			
			
			return
		elseif typeof(D) == "table" then
			E = D.propTypes
			F = D.validateProps
		else
			return
		end

		if E or F then
			
			local G = i(D)
			
			q(E, F, C.props, "prop", G, C)
			
		elseif (D :: any).PropTypes ~= nil and not A then
			A = true
			
			local G = i(D)
			e.error(
				"Component %s declared `PropTypes` instead of `propTypes`. Did you misspell the property assignment?",
				G or "Unknown"
			)
		end
		
		
		if (D :: any).getDefaultProps ~= nil then
			e.error(
[[getDefaultProps is only used on classic React.createClass definitions. Use a static property named `defaultProps` instead.]]			

)
		end
	end
end





local function validateFragmentProps<P>(C: ReactElement<P & Object, any>)
	if _G.__DEV__ then
		local D = d.keys(C.props)
		for E = 1, #D do
			local F = D[E]
			if F ~= "children" and F ~= "key" then
				setCurrentlyValidatingElement(C)
				e.error(
[[Invalid prop `%s` supplied to `React.Fragment`. React.Fragment can only have `key` and `children` props.]]
,
					F
				)
				setCurrentlyValidatingElement(nil)
				break
			end
		end

		if C.ref ~= nil then
			setCurrentlyValidatingElement(C)
			e.error("Invalid attribute `ref` supplied to `React.Fragment`.")
			setCurrentlyValidatingElement(nil)
		end
	end
end


local function jsxWithValidation<P, T>(
	C: T,
	D: P & React_ElementProps<T>,
	E: string | number,
	F,
	G: Source?,
	H: any?
)
	
	local I = h(C)

	
	
	if not I then
		local J = ""
		if C == nil or (typeof(C) == "table" and #d.keys(C) == 0) then
			J ..= ([[ You likely forgot to export your component from the file it's defined in, or you might have mixed up default and named imports.]])
		end

		local K = getSourceInfoErrorAddendum(G)
		if K then
			J ..= K
		else
			J ..= getDeclarationErrorAddendum()
		end

		local L
		if C == nil then
			L = "nil"
		elseif b.isArray(C) then
			L = "array"
		elseif typeof(C) == "table" and C["$$typeof"] == o then
			L = string.format("<%s />", i(C.type) or "Unknown")
			J ..= " Did you accidentally export a JSX literal or Element instead of a component?"
		else
			L = typeof(C)
			J ..= "\n" .. f(C)
		end

		if _G.__DEV__ then
			e.error(
[[React.jsx: type is invalid -- expected a string (for built-in components) or a class/function (for composite components) but got: %s.%s]]

,
				L,
				J
			)
		end
	end

	local J = w(C, D, E, G, H)

	
	
	if J == nil then
		return J
	end

	
	
	
	
	

	if I then
		local K = D.children
		if K ~= nil then
			if F then
				if b.isArray(K) then
					for L = 1, #K do
						
						validateChildKeys(K[L], C :: any)
					end

					
					
					d.freeze(K)
					
				else
					if _G.__DEV__ then
						e.error(
[[React.jsx: Static children should always be an array. You are likely explicitly calling React.jsxs or React.jsxDEV. Use the Babel transform instead.]]						


)
					end
				end
			else
				
				validateChildKeys(K, C :: any)
			end
		end
	end

	if _G.__DEV__ then
		if p then
			if hasOwnProperty(D, "key") then
				e.error(
[[React.jsx: Spreading a key to JSX is a deprecated pattern. Explicitly pass a key after spreading props in your JSX call. E.g. <%s {...props} key={key} />]]

,
					i(C) or "ComponentName"
				)
			end
		end
	end

	if C == n then
		
		validateFragmentProps((J :: any) :: ReactElement<any, any>)
	else
		validatePropTypes((J :: any) :: ReactElement<any, any>)
	end

	return J
end
z.jsxWithValidation = jsxWithValidation





z.jsxWithValidationStatic = function(C, D, E)
	return jsxWithValidation(C, D, E, true)
end

z.jsxWithValidationDynamic = function(C, D, E)
	return jsxWithValidation(C, D, E, false)
end


local function createElementWithValidation<P, T>(
	C: React_StatelessFunctionalComponent<
		P
	> | React_ComponentType<P> | string,
	D: (P & React_ElementProps<T>)?,
	...: React_Node
): ReactElement<P, T>
	
	local E = h(C)

	
	
	if not E then
		local F = ""
		if C == nil or (typeof(C) == "table" and #d.keys(C) == 0) then
			F ..= ([[ You likely forgot to export your component from the file it's defined in, or you might have mixed up default and named imports.]])
		end

		local G = getSourceInfoErrorAddendumForProps(D)
		if G then
			F ..= G
		else
			F ..= getDeclarationErrorAddendum()
		end

		local H
		if C == nil then
			H = "nil"
		elseif b.isArray(C) then
			H = "array"
		elseif
			C ~= nil
			and typeof(C) == "table"
			and C["$$typeof"] == o
		then
			H = string.format(
				"<%s />",
				i((C :: any).type) or "Unknown"
			)
			F ..= " Did you accidentally export a JSX literal or Element instead of a component?"
		else
			H = typeof(C)
			if C ~= nil then
				
				F ..= "\n" .. f(C)
			end
		end

		if _G.__DEV__ then
			e.error(
[[React.createElement: type is invalid -- expected a string (for built-in components) or a class/function (for composite components) but got: %s.%s]]

,
				H,
				F
			)
		end
	end

	
	local F = u(C :: any, D, ...)

	
	
	if F == nil then
		return F
	end

	
	
	
	
	
	if E then
		
		for G = 1, select("#", ...) do
			
			
			validateChildKeys(select(G, ...), C :: any)
		end
	end

	if C == n then
		validateFragmentProps(F)
	else
		validatePropTypes(F)
	end

	return F
end
z.createElementWithValidation = createElementWithValidation










































z.cloneElementWithValidation = function<P, T>(
	C: ReactElement<P, T>,
	D: (P & React_ElementProps<T>)?,
	...: React_Node
): ReactElement<P, T>
	
	local E = { C, D, ... } :: Array<any>
	local F = v(C, D, ...)
	for G = 3, #E do
		validateChildKeys(E[G], F.type)
	end
	validatePropTypes(F)
	return F
end

return z
