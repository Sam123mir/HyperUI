













local a = require(script.Parent.Parent.Parent:WaitForChild('luau-polyfill'))
type Array<T> = a.Array<T>


local b = require(script.Parent.Parent:WaitForChild('ReactElementType'))
type Source = b.Source
local c = require(script.Parent.Parent:WaitForChild('ReactTypes'))
type RefObject = c.RefObject
type ReactContext<T> = c.ReactContext<T>

type ReactBinding<T> = c.ReactBinding<T>
type ReactBindingUpdater<T> = c.ReactBindingUpdater<T>

type MutableSourceVersion = c.MutableSourceVersion
type MutableSource<Source> = c.MutableSource<Source>
type MutableSourceSubscribeFn<Source, Snapshot> = c.MutableSourceSubscribeFn<
	Source,
	Snapshot
>
type MutableSourceGetSnapshotFn<Source, Snapshot> = c.MutableSourceGetSnapshotFn<
	Source,
	Snapshot
>

type BasicStateAction<S> = ((S) -> S) | S
type Dispatch<A> = (A) -> ()

export type Dispatcher = {
	readContext: <T>(
		context: ReactContext<T>,
		observedBits: nil | number | boolean
	) -> T,
	useState: <S>(initialState: (() -> S) | S) -> (S, Dispatch<BasicStateAction<S>>),
	useReducer: <S, I, A>(
		reducer: (S, A) -> S,
		initialArg: I,
		init: ((I) -> S)?
	) -> (S, Dispatch<A>),
	useContext: <T>(
		context: ReactContext<T>,
		observedBits: nil | number | boolean
	) -> T,
	useRef: <T>(initialValue: T) -> { current: T },
	
	useBinding: <T>(initialValue: T) -> (ReactBinding<T>, ReactBindingUpdater<T>),
	
	useEffect: (
		
		create: (() -> ()) | (() -> (() -> ())),
		deps: Array<any> | nil
	) -> (),
	useLayoutEffect: (
		
		create: (() -> ()) | (() -> (() -> ())),
		deps: Array<any> | nil
	) -> (),
	useCallback: <T>(callback: T, deps: Array<any> | nil) -> T,
	useMemo: <T...>(nextCreate: () -> T..., deps: Array<any> | nil) -> T...,
	useImperativeHandle: <T>(
		ref: { current: T | nil } | ((inst: T | nil) -> any) | nil,
		create: () -> T,
		deps: Array<any> | nil
	) -> (),
	useDebugValue: <T>(value: T, formatterFn: ((value: T) -> any)?) -> (),
	
	useDeferredValue: (<T>(value: T) -> T)?,
	useTransition: (() -> ((() -> ()) -> (), boolean))?, 
	useMutableSource: <Source, Snapshot>(
		source: MutableSource<Source>,
		getSnapshot: MutableSourceGetSnapshotFn<Source, Snapshot>,
		subscribe: MutableSourceSubscribeFn<Source, Snapshot>
	) -> Snapshot,
	useOpaqueIdentifier: () -> any,

	unstable_isNewReconciler: boolean?	

}

local d: { current: nil | Dispatcher } = {
	
	



current = nil,
}

return d
