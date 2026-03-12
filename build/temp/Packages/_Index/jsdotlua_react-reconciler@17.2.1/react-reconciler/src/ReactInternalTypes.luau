










local a = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
type Array<T> = a.Array<T>
type Map<K, V> = a.Map<K, V>
type Object = { [string]: any }
type SimpleSet<T> = { [T]: boolean }
type SimpleMap<K, V> = { [K]: V }
type Set<T> = a.Set<T>

local b = require(script.Parent.Parent:WaitForChild('shared'))


type Source = b.Source
type RefObject = b.RefObject
type ReactContext<T> = b.ReactContext<T>
type MutableSourceVersion = b.MutableSourceVersion
type MutableSource<Source> = b.MutableSource<Source>
type MutableSourceSubscribeFn<Source, Snapshot> = b.MutableSourceSubscribeFn<
	Source,
	Snapshot
>
type MutableSourceGetSnapshotFn<Source, Snapshot> = b.MutableSourceGetSnapshotFn<
	Source,
	Snapshot
>




type SuspenseInstance = any

local c = require(script.Parent:WaitForChild('ReactWorkTags'))
type WorkTag = c.WorkTag
local d = require(script.Parent:WaitForChild('ReactTypeOfMode'))
type TypeOfMode = d.TypeOfMode
local e = require(script.Parent:WaitForChild('ReactFiberFlags'))
type Flags = e.Flags


export type LanePriority = number
export type Lanes = number
export type Lane = number
export type LaneMap<T> = { [number]: T }


export type Update<State> = {
	
	
	eventTime: number,
	lane: Lane,

	
	
	tag: number,
	payload: any,
	callback: (() -> ...any)?,

	next: Update<State>?
}

export type SharedQueue<State> = {
	pending: Update<State>?
}

export type UpdateQueue<State> = {
	baseState: State,
	firstBaseUpdate: Update<State>?,
	lastBaseUpdate: Update<State>?,
	shared: SharedQueue<State>,
	effects: Array<Update<State>>?
}

export type HookType =
	"useState"
	| "useReducer"
	| "useContext"
	| "useRef"
	
	| "useBinding"
	| "useEffect"
	| "useLayoutEffect"
	| "useCallback"
	| "useMemo"
	| "useImperativeHandle"
	| "useDebugValue"
	| "useDeferredValue"
	| "useTransition"
	| "useMutableSource"
	| "useOpaqueIdentifier"
local f = require(script.Parent:WaitForChild('ReactRootTags'))
type RootTag = f.RootTag



type TimeoutHandle = any
type NoTimeout = any

local g = require(script.Parent.Parent:WaitForChild('shared'))
type Wakeable = g.Wakeable

local h = require(script.Parent.Parent:WaitForChild('scheduler'))
type Interaction = h.Interaction


export type ReactPriorityLevel = number

export type ContextDependency<T> = {
	context: ReactContext<T>,
	observedBits: number,
	
	next: ContextDependency<T> | nil	
	
	

}

export type Dependencies = {
	lanes: Lanes,
	firstContext: ContextDependency<any> | nil	
	
	

}




export type RoactStableKey = string | number



export type Fiber = {
	
	
	
	

	
	
	
	

	
	tag: WorkTag,

	
	
	
	key: RoactStableKey?,

	
	
	elementType: any,

	
	type: any,

	
	stateNode: any,

	
	
	

	

	
	
	
	
	return_: Fiber | nil,

	
	child: Fiber?,
	sibling: Fiber?,
	index: number,

	
	
	
	
	ref: nil | ((handle: any) -> ()) | { _stringRef: string?, [string]: any } | RefObject,

	
	pendingProps: any, 
	memoizedProps: any, 

	
	updateQueue: any,

	
	memoizedState: any,

	
	dependencies: Dependencies?,

	
	
	
	
	
	
	mode: TypeOfMode,

	
	flags: Flags,
	subtreeFlags: Flags,
	deletions: Array<Fiber>?,

	
	nextEffect: Fiber?,

	
	
	
	firstEffect: Fiber?,
	lastEffect: Fiber?,

	lanes: Lanes,
	childLanes: Lanes,

	
	
	
	alternate: Fiber?,

	
	
	
	
	actualDuration: number?,

	
	
	
	actualStartTime: number?,

	
	
	
	selfBaseDuration: number?,

	
	
	
	treeBaseDuration: number?,

	
	
	
	
	_debugID: number?,
	_debugSource: Source?,
	_debugOwner: Fiber?,
	_debugIsCurrentlyTiming: boolean?,
	_debugNeedsRemount: boolean?,

	
	_debugHookTypes: Array<HookType>?
}

export type SuspenseHydrationCallbacks = {
	onHydrated: ((SuspenseInstance) -> ())?,
	onDeleted: ((SuspenseInstance) -> ())?	
	
	

}









export type FiberRoot = {
	
	
	tag: RootTag,

	
	containerInfo: any,
	
	pendingChildren: any,
	
	current: Fiber,

	
	pingCache: SimpleMap<
		Wakeable,
		(SimpleSet<any> | SimpleMap<Wakeable, SimpleSet<any>>)
	> | nil,
	

	
	finishedWork: Fiber?,
	
	
	timeoutHandle: TimeoutHandle | NoTimeout,
	
	context: Object?,
	pendingContext: Object?,
	
	hydrate: boolean,

	
	mutableSourceEagerHydrationData: Array<MutableSource<any> | MutableSourceVersion>?,

	
	
	callbackNode: any,
	callbackPriority: LanePriority,
	eventTimes: LaneMap<number>,
	expirationTimes: LaneMap<number>,

	pendingLanes: Lanes,
	suspendedLanes: Lanes,
	pingedLanes: Lanes,
	expiredLanes: Lanes,
	mutableReadLanes: Lanes,

	finishedLanes: Lanes,

	entangledLanes: Lanes,
	entanglements: LaneMap<Lanes>,

	
	
	
	
	
	interactionThreadID: number,
	memoizedInteractions: Set<Interaction>,
	pendingInteractionMap: Map<Lane | Lanes, Set<Interaction>>,

	
	
	hydrationCallbacks: SuspenseHydrationCallbacks?
	
	
	

}

type BasicStateAction<S> = ((S) -> S) | S
type Dispatch<A> = (A) -> ()


export type Dispatcher = g.Dispatcher


return {}
