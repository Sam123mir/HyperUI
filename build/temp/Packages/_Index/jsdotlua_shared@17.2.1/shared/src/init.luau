

















local a = require(script.Parent:WaitForChild('luau-polyfill'))
type Object = a.Object

local b = require(script:WaitForChild('ReactTypes'))
local c = require(script:WaitForChild('flowtypes.roblox'))
local d = require(script:WaitForChild('ReactElementType'))
local e = require(script:WaitForChild('ReactFiberHostConfig'))
local f = require(script:WaitForChild('ReactSharedInternals'))
local g = require(script:WaitForChild('ErrorHandling.roblox'))


export type ReactEmpty = b.ReactEmpty
export type ReactFragment = b.ReactFragment
export type ReactNodeList = b.ReactNodeList
export type ReactProviderType<T> = b.ReactProviderType<T>
export type ReactConsumer<T> = b.ReactConsumer<T>
export type ReactProvider<T> = b.ReactProvider<T>
export type ReactContext<T> = b.ReactContext<T>
export type ReactPortal = b.ReactPortal
export type RefObject = b.RefObject
export type EventPriority = b.EventPriority
export type ReactFundamentalComponentInstance<C, H> =
	b.ReactFundamentalComponentInstance<C, H>
export type ReactFundamentalImpl<C, H> = b.ReactFundamentalImpl<C, H>
export type ReactFundamentalComponent<C, H> = b.ReactFundamentalComponent<C, H>
export type ReactScope = b.ReactScope
export type ReactScopeQuery = b.ReactScopeQuery
export type ReactScopeInstance = b.ReactScopeInstance

export type ReactBinding<T> = b.ReactBinding<T>
export type ReactBindingUpdater<T> = b.ReactBindingUpdater<T>

export type MutableSourceVersion = b.MutableSourceVersion
export type MutableSourceGetSnapshotFn<Source, Snapshot> =
	b.MutableSourceGetSnapshotFn<Source, Snapshot>
export type MutableSourceSubscribeFn<Source, Snapshot> = b.MutableSourceSubscribeFn<
	Source,
	Snapshot
>
export type MutableSourceGetVersionFn = b.MutableSourceGetVersionFn
export type MutableSource<Source> = b.MutableSource<Source>
export type Wakeable = b.Wakeable
export type Thenable<R> = b.Thenable<R>
export type Source = d.Source
export type ReactElement<P = Object, T = any> = d.ReactElement<P, T>
export type OpaqueIDType = e.OpaqueIDType
export type Dispatcher = f.Dispatcher


export type React_Ref<ElementType> = c.React_Ref<ElementType>
export type React_Context<T> = c.React_Context<T>
export type React_AbstractComponent<Config, Instance> = c.React_AbstractComponent<
	Config,
	Instance
>
export type React_ForwardRefComponent<Config, Instance> =
	c.React_ForwardRefComponent<Config, Instance>
export type React_MemoComponent<Config, T> = c.React_MemoComponent<Config, T>
export type React_ComponentType<Config> = c.React_ComponentType<Config>
export type React_PureComponent<Props, State = nil> = c.React_PureComponent<
	Props,
	State
>
export type React_Component<Props, State> = c.React_Component<Props, State>
export type React_ElementProps<ElementType> = c.React_ElementProps<ElementType>
export type React_StatelessFunctionalComponent<Props> =
	c.React_StatelessFunctionalComponent<Props>
export type React_Node = c.React_Node
export type React_Element<ElementType> = c.React_Element<ElementType>
export type React_ElementType = c.React_ElementType
export type React_ElementConfig<C> = c.React_ElementConfig<C>
export type React_ElementRef<C> = c.React_ElementRef<C>
export type React_Portal = c.React_Portal
export type React_Key = c.React_Key

return {
	checkPropTypes = require(script:WaitForChild('checkPropTypes')),
	console = require(script:WaitForChild('console')),
	ConsolePatchingDev = require(script:WaitForChild('ConsolePatchingDev.roblox')),
	consoleWithStackDev = require(script:WaitForChild('consoleWithStackDev')),
	enqueueTask = require(script:WaitForChild('enqueueTask.roblox')),
	ExecutionEnvironment = require(script:WaitForChild('ExecutionEnvironment')),
	formatProdErrorMessage = require(script:WaitForChild('formatProdErrorMessage')),
	getComponentName = require(script:WaitForChild('getComponentName')),
	invariant = require(script:WaitForChild('invariant')),
	invokeGuardedCallbackImpl = require(script:WaitForChild('invokeGuardedCallbackImpl')),
	isValidElementType = require(script:WaitForChild('isValidElementType')),
	objectIs = require(script:WaitForChild('objectIs')),
	ReactComponentStackFrame = require(script:WaitForChild('ReactComponentStackFrame')),
	ReactElementType = require(script:WaitForChild('ReactElementType')),
	ReactErrorUtils = require(script:WaitForChild('ReactErrorUtils')),
	ReactFeatureFlags = require(script:WaitForChild('ReactFeatureFlags')),
	ReactInstanceMap = require(script:WaitForChild('ReactInstanceMap')),
	
	
	ReactSharedInternals = f,
	
	
	
	ReactFiberHostConfig = e,

	ReactSymbols = require(script:WaitForChild('ReactSymbols')),
	ReactVersion = require(script:WaitForChild('ReactVersion')),
	shallowEqual = require(script:WaitForChild('shallowEqual')),
	UninitializedState = require(script:WaitForChild('UninitializedState.roblox')),
	ReactTypes = b,

	
	
	describeError = g.describeError,
	errorToString = g.errorToString,
	parseReactError = g.parseReactError,

	
	Symbol = require(script:WaitForChild('Symbol.roblox')),
	Type = require(script:WaitForChild('Type.roblox')),

	
	Change = require(script:WaitForChild('PropMarkers'):WaitForChild('Change')),
	Event = require(script:WaitForChild('PropMarkers'):WaitForChild('Event')),
	Tag = require(script:WaitForChild('PropMarkers'):WaitForChild('Tag')),
}
