








local a = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
type Array<T> = a.Array<T>
type Object = a.Object
type void = nil
type NonMaybeType<T> = T

local b = require(script.Parent:WaitForChild('flowtypes.roblox'))
type React_Element<T> = b.React_Element<T>
type React_Node = b.React_Node
type SimpleMap<K, V> = { [K]: V }
type Iterable<T> = SimpleMap<string | number, T> | Array<T>

export type ReactNode<T = any> =
	React_Element<T>
	| ReactPortal
	
	| ReactFragment
	| ReactProvider<T>
	| ReactConsumer<T>

export type ReactEmpty = nil | void | boolean

export type ReactFragment = ReactEmpty | Iterable<React_Node>

export type ReactNodeList = ReactEmpty | React_Node




export type ReactProvider<T> = {
	["$$typeof"]: number,
	type: ReactProviderType<T>,
	key: nil | string,
	ref: nil,
	props: {
		value: T,
		children: ReactNodeList?		
		
		
	
}	
	
	

}

export type ReactProviderType<T> = {
	["$$typeof"]: number,
	_context: ReactContext<T>	
	
	

}

export type ReactConsumer<T> = {
	["$$typeof"]: number,
	type: ReactContext<T>, 
	key: nil | string,
	ref: nil,
	props: {
		children: (value: T) -> ReactNodeList,
		unstable_observedBits: number?		
		
		
	
}	
	
	

}

export type ReactContext<T> = {
	["$$typeof"]: number,
	Consumer: ReactContext<T>,
	Provider: ReactProviderType<T>,
	_calculateChangedBits: ((T, T) -> number)?,
	_currentValue: T,
	_currentValue2: T,
	_threadCount: number,
	
	_currentRenderer: Object | nil,
	_currentRenderer2: Object | nil,
	
	
	displayName: string?	
	
	

}

export type ReactPortal = {
	["$$typeof"]: number,
	key: nil | string,
	containerInfo: any,
	children: ReactNodeList,
	
	implementation: any	
	
	

}

export type RefObject = { current: any }



export type EventPriority = number


local c = {}
c.DiscreteEvent = 0
c.UserBlockingEvent = 1
c.ContinuousEvent = 2

export type ReactFundamentalComponentInstance<C, H> = {
	currentFiber: Object,
	instance: any,
	prevProps: Object?,
	props: Object,
	impl: ReactFundamentalImpl<C, H>,
	state: Object
}

export type ReactFundamentalImpl<C, H> = {
	displayName: string,
	reconcileChildren: boolean,
	getInitialState: nil | ((Object) -> (Object)),
	getInstance: (C, Object, Object) -> (H),
	getServerSideString: nil | ((C, Object) -> (string)),
	getServerSideStringClose: nil | ((C, Object) -> (string)),
	onMount: (C, any, Object, Object) -> (),
	shouldUpdate: nil | ((C, Object?, Object, Object) -> (boolean)),
	onUpdate: nil | ((C, any, Object?, Object, Object) -> ()),
	onUnmount: nil | ((C, any, Object, Object) -> ()),
	onHydrate: nil | ((C, Object, Object) -> boolean),
	onFocus: nil | ((C, Object, Object) -> boolean
)}
export type ReactFundamentalComponent<C, H> = {
	["$$typeof"]: number,
	impl: ReactFundamentalImpl<C, H>
}

export type ReactScope = {
	["$$typeof"]: number
}

export type ReactScopeQuery = (
	type: string,
	
	props: { [string]: any? },
	
	instance: any
) -> boolean

export type ReactScopeInstance = {
	DO_NOT_USE_queryAllNodes: (ReactScopeQuery) -> nil | Array<Object>,
	DO_NOT_USE_queryFirstNode: (ReactScopeQuery) -> nil | Object,
	containsNode: (Object) -> boolean,
	getChildContextValues: <T>(context: ReactContext<T>) -> Array<T>
}





type CoreReactBinding<T> = {
	getValue: (self: CoreReactBinding<T>) -> T,
	_source: string?
}
type ReactBindingMap = {
	map: <T, U>(
		self: CoreReactBinding<T> & ReactBindingMap,
		(T) -> U
	) -> ReactBindingMap & CoreReactBinding<U>
}

export type ReactBinding<T> = CoreReactBinding<T> & ReactBindingMap
export type ReactBindingUpdater<T> = (T) -> ()




export type MutableSourceVersion = NonMaybeType<any>

export type MutableSourceGetSnapshotFn<Source, Snapshot> = (source: Source) -> Snapshot

export type MutableSourceSubscribeFn<Source, Snapshot> = (
	source: Source,
	callback: (snapshot: Snapshot) -> ()
) -> (() -> ())

export type MutableSourceGetVersionFn = (
	_source: NonMaybeType<any>
) -> MutableSourceVersion

export type MutableSource<Source> = {
	_source: Source,

	_getVersion: MutableSourceGetVersionFn,

	
	
	
	
	
	
	
	
	
	
	
	
	_workInProgressVersionPrimary: nil | MutableSourceVersion,
	_workInProgressVersionSecondary: nil | MutableSourceVersion,

	
	
	_currentPrimaryRenderer: Object | nil,
	_currentSecondaryRenderer: Object | nil
}



export type Wakeable = {
	andThen: (
		self: Wakeable,
		onFulfill: () -> ...any,
		onReject: () -> ...any
		
	) -> nil | Wakeable,
	
	__reactDoNotTraceInteractions: boolean?
}





export type _Thenable<R> = {
	andThen: <U>(
		self: _Thenable<R>,
		onFulfill: (R) -> ...U,
		onReject: (error: any) -> ...U
	) -> ()
}

export type Thenable<R> = {
	andThen: <U>(
		self: Thenable<R>,
		onFulfill: (R) -> ...(_Thenable<U> | U),
		onReject: (error: any) -> ...(_Thenable<U> | U)
		
	) -> nil | _Thenable<U>
}

return c
