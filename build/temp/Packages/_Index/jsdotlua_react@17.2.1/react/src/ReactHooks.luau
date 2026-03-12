










local a = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
local b = a.Array
type Array<T> = a.Array<T>

local c = require(script.Parent.Parent:WaitForChild('shared')).console

local d = require(script.Parent.Parent:WaitForChild('shared'))

type Dispatcher = d.Dispatcher
type MutableSource<T> = d.MutableSource<T>
type MutableSourceGetSnapshotFn<Source, Snapshot> = d.MutableSourceGetSnapshotFn<
	Source,
	Snapshot
>
type MutableSourceSubscribeFn<Source, Snapshot> = d.MutableSourceSubscribeFn<
	Source,
	Snapshot
>
type ReactProviderType<T> = d.ReactProviderType<T>
type ReactContext<T> = d.ReactContext<T>
local e = require(script.Parent.Parent:WaitForChild('shared'))
type OpaqueIDType = e.OpaqueIDType



local f =
	require(script.Parent.Parent:WaitForChild('shared')).ReactSharedInternals.ReactCurrentDispatcher

type BasicStateAction<S> = ((S) -> S) | S
type Dispatch<A> = (A) -> ()


local function resolveDispatcher(): Dispatcher
	local g = f.current
	
	if _G.__DEV__ then
		if g == nil then
			c.error(
[[Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:
1. You might have mismatching versions of React and the renderer (such as React DOM)
2. You might be breaking the Rules of Hooks
3. You might have more than one copy of React in the same app
See https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.]]			

)
		end
	end
	
	
	
	return g :: Dispatcher
end

local g = {}

local function useContext<T>(
	h: ReactContext<T>,
	i: number | boolean | nil,
	... 
): T
	local j = resolveDispatcher()
	if _G.__DEV__ then
		if i ~= nil then
			c.error(
[[useContext() second argument is reserved for future use in React. Passing it is not supported. You passed: %s.%s]]

,
				i,
				(typeof(i) == "number" and b.isArray({ ... }))
						and [[


Did you call Array.map(useContext)? Calling Hooks inside a loop is not supported. Learn more at https://reactjs.org/link/rules-of-hooks]]					or ""
			)
		end

		
		if (h :: any)._context ~= nil then
			local k = (h :: any)._context
			
			
			if k.Consumer == h then
				c.error(
[[Calling useContext(Context.Consumer) is not supported, may cause bugs, and will be removed in a future major release. Did you mean to call useContext(Context) instead?]]				)
			elseif k.Provider == h then
				c.error(
[[Calling useContext(Context.Provider) is not supported. Did you mean to call useContext(Context) instead?]]				

)
			end
		end
	end
	return j.useContext(h, i)
end
g.useContext = useContext

local function useState<S>(
	h: (() -> S) | S,
	...
): (S, Dispatch<BasicStateAction<S>>)
	local i = resolveDispatcher()
	return i.useState(h, ...)
end
g.useState = useState

local function useReducer<S, I, A>(
	h: (S, A) -> S,
	i: I,
	j: ((I) -> S)?
): (S, Dispatch<A>)
	local k = resolveDispatcher()
	return k.useReducer(h, i, j)
end
g.useReducer = useReducer


local function useRef<T>(h: T): { current: T }
	local i = resolveDispatcher()
	return i.useRef(h)
end
g.useRef = useRef


local function useBinding<T>(
	h: T
): (
	d.ReactBinding<T>,
	d.ReactBindingUpdater<T>
)
	local i = resolveDispatcher()
	return i.useBinding(h)
end
g.useBinding = useBinding


local function useEffect(
	
	h: (() -> ()) | (() -> (() -> ())),
	i: Array<any> | nil
): ()
	local j = resolveDispatcher()
	return j.useEffect(h, i)
end
g.useEffect = useEffect

local function useLayoutEffect(
	
	h: (() -> ()) | (() -> (() -> ())),
	i: Array<any> | nil
): ()
	local j = resolveDispatcher()
	return j.useLayoutEffect(h, i)
end
g.useLayoutEffect = useLayoutEffect

local function useCallback<T>(h: T, i: Array<any> | nil): T
	local j = resolveDispatcher()
	return j.useCallback(h, i)
end
g.useCallback = useCallback

local function useMemo<T...>(h: () -> T..., i: Array<any> | nil): T...
local j = resolveDispatcher()
	return j.useMemo(h, i)
end
g.useMemo = useMemo

local function useImperativeHandle<T>(
	h: { current: T | nil } | ((inst: T | nil) -> any) | nil,
	i: () -> T,
	j: Array<any> | nil
): ()
	local k = resolveDispatcher()
	return k.useImperativeHandle(h, i, j)
end
g.useImperativeHandle = useImperativeHandle

local function useDebugValue<T>(h: T, i: ((value: T) -> any)?): ()
	if _G.__DEV__ then
		local j = resolveDispatcher()
		return j.useDebugValue(h, i)
	end

	
	return nil
end
g.useDebugValue = useDebugValue

g.emptyObject = {}













g.useOpaqueIdentifier = function(): OpaqueIDType | nil
	local h = resolveDispatcher()
	return h.useOpaqueIdentifier()
end

g.useMutableSource =
	function<Source, Snapshot>(
		h: MutableSource<Source>,
		i: MutableSourceGetSnapshotFn<Source, Snapshot>,
		j: MutableSourceSubscribeFn<Source, Snapshot>
	): Snapshot
		local k = resolveDispatcher()
		return k.useMutableSource(h, i, j)
	end

return g
