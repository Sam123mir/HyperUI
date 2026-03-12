










local a = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
type Object = a.Object

local b = require(script.Parent:WaitForChild('ReactMutableSource'))
local c = require(script.Parent.Parent:WaitForChild('shared')).ReactSharedInternals
local d = require(script.Parent:WaitForChild('ReactBaseClasses'))
local e = require(script.Parent:WaitForChild('ReactChildren'))
local f = require(script.Parent:WaitForChild('ReactElementValidator'))
local g = require(script.Parent:WaitForChild('ReactElement'))
local h = require(script.Parent:WaitForChild('ReactCreateRef'))
local i = require(script.Parent:WaitForChild('ReactForwardRef'))
local j = require(script.Parent:WaitForChild('ReactHooks'))
local k = require(script.Parent:WaitForChild('ReactMemo'))
local l = require(script.Parent:WaitForChild('ReactContext'))
local m = require(script.Parent:WaitForChild('ReactLazy'))
type LazyComponent<T, P> = m.LazyComponent<T, P>


local n = require(script.Parent:WaitForChild('ReactBinding.roblox'))

local o = require(script.Parent:WaitForChild('None.roblox'))

local p = require(script.Parent.Parent:WaitForChild('shared'))
local q = p.ReactSymbols

local r = _G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__
local s = require(script.Parent.Parent:WaitForChild('shared'))
export type React_StatelessFunctionalComponent<P> =
	s.React_StatelessFunctionalComponent<P>
export type React_ComponentType<P> = s.React_ComponentType<P>
type React_AbstractComponent<P, T> = s.React_AbstractComponent<P, T>
export type React_ElementProps<ElementType> = s.React_ElementProps<ElementType>
export type ReactElement<P = Object, T = any> = s.ReactElement<P, T>
export type ReactContext<T> = s.ReactContext<T>
export type ReactProviderType<T> = s.ReactProviderType<T>
export type React_Node = s.React_Node
export type PureComponent<Props, State = nil> = s.React_PureComponent<
	Props,
	State
>

export type ReactBinding<T> = s.ReactBinding<T>
export type ReactBindingUpdater<T> = s.ReactBindingUpdater<T>


type createElementFn = <P, T>(
	type_: React_StatelessFunctionalComponent<P>
		| React_ComponentType<P>
		| React_AbstractComponent<P, T>
		| string
		| ReactContext<any>
		| ReactProviderType<any>
		| LazyComponent<T, P>,
	props: P?,...
(React_Node | ((...any) -> React_Node))
) -> ReactElement<P, T>

type cloneElementFn = <P, T>(
	element: ReactElement<P, T>,
	config: P?,...
React_Node
) -> ReactElement<P, T>


local t = if r
	then f.createElementWithValidation :: createElementFn
	else g.createElement :: createElementFn
local u: cloneElementFn = if r
	then f.cloneElementWithValidation :: cloneElementFn
	else g.cloneElement :: cloneElementFn

return {
	Children = e,
	createMutableSource = b,
	createRef = h.createRef,
	Component = d.Component,
	PureComponent = d.PureComponent,
	createContext = l.createContext,
	forwardRef = i.forwardRef,
	lazy = m.lazy,
	memo = k.memo,
	useCallback = j.useCallback,
	useContext = j.useContext,
	useEffect = j.useEffect,
	useImperativeHandle = j.useImperativeHandle,
	useDebugValue = j.useDebugValue,
	useLayoutEffect = j.useLayoutEffect,
	useMemo = j.useMemo,
	useMutableSource = j.useMutableSource,
	useReducer = j.useReducer,
	useRef = j.useRef,
	
	useBinding = j.useBinding,
	useState = j.useState,
	Fragment = q.REACT_FRAGMENT_TYPE,
	Profiler = q.REACT_PROFILER_TYPE,
	StrictMode = q.REACT_STRICT_MODE_TYPE,
	unstable_DebugTracingMode = q.REACT_DEBUG_TRACING_MODE_TYPE,
	Suspense = q.REACT_SUSPENSE_TYPE,
	createElement = t,
	cloneElement = u,
	isValidElement = g.isValidElement,
	
	__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED = c,
	
	
	
	
	
	
	
	unstable_LegacyHidden = q.REACT_LEGACY_HIDDEN_TYPE,
	
	
	
	
	
	
	

	
	createBinding = n.create,
	joinBindings = n.join,
	

	
	None = o,

	
	
	__subscribeToBinding = n.subscribe,

	
	Event = require(script.Parent.Parent:WaitForChild('shared')).Event,
	Change = require(script.Parent.Parent:WaitForChild('shared')).Change,
	Tag = require(script.Parent.Parent:WaitForChild('shared')).Tag,

	
	
	
	unstable_parseReactError = require(script.Parent.Parent:WaitForChild('shared')).parseReactError,
}
