










local a = _G.__DEV__ :: boolean
local b = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
local c = b.Object


local d = require(script.Parent.Parent:WaitForChild('shared')).console
local e = require(script.Parent:WaitForChild('ReactInternalTypes'))
type Fiber = e.Fiber
local f = require(script.Parent:WaitForChild('ReactFiberLane'))
type Lanes = f.Lanes
local g = require(script.Parent:WaitForChild('ReactUpdateQueue.new'))
type UpdateQueue<State> = e.UpdateQueue<State>

local h = require(script.Parent.Parent:WaitForChild('shared'))
type React_Component<Props, State> = h.React_Component<Props, State>

local i = require(script.Parent.Parent:WaitForChild('react'))

local j = require(script.Parent:WaitForChild('ReactFiberFlags'))
local k = j.Update
local l = j.Snapshot
local m = j.MountLayoutDev

local n = require(script.Parent.Parent:WaitForChild('shared')).ReactFeatureFlags
local o =
	n.debugRenderPhaseSideEffectsForStrictMode
local p = n.disableLegacyContext
local q = n.enableDebugTracing
local r = n.enableSchedulingProfiler
local s = n.warnAboutDeprecatedLifecycles
local t = n.enableDoubleInvokingEffects

local u = require(script.Parent:WaitForChild('ReactStrictModeWarnings.new'))
local v = require(script.Parent:WaitForChild('ReactFiberTreeReflection')).isMounted
local w = require(script.Parent.Parent:WaitForChild('shared')).ReactInstanceMap
local x = w.get
local y = w.set
local z = require(script.Parent.Parent:WaitForChild('shared')).shallowEqual
local A = require(script.Parent.Parent:WaitForChild('shared')).getComponentName
local B = require(script.Parent.Parent:WaitForChild('shared')).UninitializedState
local C = require(script.Parent.Parent:WaitForChild('shared')).describeError

local D = require(script.Parent.Parent:WaitForChild('shared')).ReactSymbols
local E = D.REACT_CONTEXT_TYPE
local F = D.REACT_PROVIDER_TYPE

local G =
	require(script.Parent:WaitForChild('ReactFiberLazyComponent.new')).resolveDefaultProps
local H = require(script.Parent:WaitForChild('ReactTypeOfMode'))
local I = H.DebugTracingMode
local J = H.StrictMode

local K = g.enqueueUpdate
local L = g.processUpdateQueue
local M =
	g.checkHasForceUpdateAfterProcessing
local N =
	g.resetHasForceUpdateBeforeProcessing
local O = g.createUpdate
local P = g.ReplaceState
local Q = g.ForceUpdate
local R = g.initializeUpdateQueue
local S = g.cloneUpdateQueue
local T = f.NoLanes

local U = require(script.Parent:WaitForChild('ReactFiberContext.new'))
local V = U.cacheContext
local W = U.getMaskedContext
local X = U.getUnmaskedContext
local Y = U.hasContextChanged
local Z = U.emptyContextObject

local _ = require(script.Parent:WaitForChild('ReactFiberNewContext.new'))
local aa = _.readContext





local ab = require(script.Parent:WaitForChild('DebugTracing'))
local ac = ab.logForceUpdateScheduled
local ad = ab.logStateUpdateScheduled

local ae = require(script.Parent.Parent:WaitForChild('shared')).ConsolePatchingDev
local af = ae.disableLogs
local ag = ae.reenableLogs

local ah = require(script.Parent:WaitForChild('SchedulingProfiler'))
local ai = ah.markForceUpdateScheduled
local aj = ah.markStateUpdateScheduled

local ak = {}








local al = i.Component:extend("").__refs

local am
local an
local ao
local ap
local aq
local ar
local as
local at
local au
local av

if a then
	am = {}
	an = {}
	ao = {}
	ap = {}
	at = {}
	aq = {}
	au = {}
	av = {}

	local aw = {}

	function as(ax: any, ay: string)
		if ax == nil or type(ax) == "function" then
			return
		end
		local az = ay .. "_" .. tostring(ax)
		if not aw[az] then
			aw[az] = true
			d.error(
[[%s(...): Expected the last optional `callback` argument to be a function. Instead received: %s.]]
,
				ay,
				tostring(ax)
			)
		end
	end

	function ar(ax, ay)
		
		
		
		
		

		
		
		
		
		
		
		
		
		
		
		
	end

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
end

local function applyDerivedStateFromProps<Props, State>(
	aw: Fiber,
	ax: React_Component<Props, State>,
	ay: (Props, State) -> State?,
	az: Props
)
	local aA = aw.memoizedState

	if a then
		if
			o
			and bit32.band(aw.mode, J) ~= 0
		then
			af()
			
			local aB, aC =
				xpcall(ay, C, az, aA)

			ag()

			if not aB then
				error(aC)
			end
		end
	end

	local aB = ay(az, aA)

	if a then
		ar(ax, aB)
	end
	
	local aC = if aB == nil
		then aA
		else c.assign({}, aA, aB)
	aw.memoizedState = aC

	
	
	if aw.lanes == T then
		
		local aD: UpdateQueue<any> = aw.updateQueue
		aD.baseState = aC
	end
end


local aw 
local function initializeClassComponentUpdater()
	local ax = require(script.Parent:WaitForChild('ReactFiberWorkLoop.new'))	
local ay = ax.requestEventTime
	local az = ax.requestUpdateLane
	local aA = ax.scheduleUpdateOnFiber

	aw = {
		isMounted = v,
		enqueueSetState = function(aB, aC, aD: (() -> (...any))?)
			local aE = x(aB)
			local aF = ay()
			local aG = az(aE)

			local aH = O(aF, aG, aC, aD)
			
			if aD ~= nil then
				if a then
					as(aD, "setState")
				end
				
			end

			K(aE, aH)
			aA(aE, aG, aF)

			if a then
				if q then
					if bit32.band(aE.mode, I) ~= 0 then
						local aI = A(aE.type) or "Unknown"
						ad(aI, aG, aC)
					end
				end
			end

			if r then
				aj(aE, aG)
			end
		end,
		enqueueReplaceState = function(aB, aC, aD)
			local aE = x(aB)
			local aF = ay()
			local aG = az(aE)

			local aH = O(aF, aG, aC, aD)
			aH.tag = P
			

			if aD ~= nil then
				if a then
					as(aD, "replaceState")
				end
				
			end

			K(aE, aH)
			aA(aE, aG, aF)

			if a then
				if q then
					if bit32.band(aE.mode, I) ~= 0 then
						local aI = A(aE.type) or "Unknown"
						ad(aI, aG, aC)
					end
				end
			end

			if r then
				aj(aE, aG)
			end
		end,
		enqueueForceUpdate = function(aB, aC)
			local aD = x(aB)
			local aE = ay()
			local aF = az(aD)

			local aG = O(aE, aF, nil, aC)
			aG.tag = Q

			if aC ~= nil then
				if a then
					as(aC, "forceUpdate")
				end
				
			end

			K(aD, aG)
			aA(aD, aF, aE)

			if a then
				if q then
					if bit32.band(aD.mode, I) ~= 0 then
						local aH = A(aD.type) or "Unknown"
						ac(aH, aF)
					end
				end
			end

			if r then
				ai(aD, aF)
			end
		end,
	}
end

local function getClassComponentUpdater()
	if aw == nil then
		initializeClassComponentUpdater()
	end
	return aw
end

function checkShouldComponentUpdate(
	ax,
	ay,
	az,
	aA,
	aB,
	aC,
	aD
)
	local aE = ax.stateNode
	if
		aE.shouldComponentUpdate ~= nil
		and type(aE.shouldComponentUpdate) == "function"
	then
		if a then
			if
				o
				and bit32.band(ax.mode, J) ~= 0
			then
				af()
				
				
				local aF, aG = xpcall(
					aE.shouldComponentUpdate,
					C,
					aE,
					aA,
					aC,
					aD
				)
				
				ag()
				if not aF then
					error(aG)
				end
			end
		end
		
		local aF =
			aE:shouldComponentUpdate(aA, aC, aD)

		if a then
			if aF == nil then
				d.error(
[[%s.shouldComponentUpdate(): Returned nil instead of a boolean value. Make sure to return true or false.]]
,
					A(ay) or "Component"
				)
			end
		end

		return aF
	end

	
	
	if type(ay) == "table" and ay.isPureReactComponent then
		return (
			not z(az, aA) or not z(aB, aC)
		)
	end

	return true
end

local function checkClassInstance(ax: Fiber, ay: any, az: any)
	local aA = ax.stateNode
	if a then
		local aB = A(ay) or "Component"
		local aC = aA.render

		if not aC then
			
			
			if type(ay.render) == "function" then
				d.error(
[[%s(...): No `render` method found on the returned component instance: did you accidentally return an object from the constructor?]]
,
					aB
				)
			else
				d.error(
[[%s(...): No `render` method found on the returned component instance: you may have forgotten to define `render`.]]
,
					aB
				)
			end
		end

		if
			aA.getInitialState
			and not aA.getInitialState.isReactClassApproved
			and not aA.state
		then
			d.error(
[[getInitialState was defined on %s, a plain JavaScript class. This is only supported for classes created using React.createClass. Did you mean to define a state property instead?]]

,
				aB
			)
		end
		if
			aA.getDefaultProps
			and not aA.getDefaultProps.isReactClassApproved
		then
			d.error(
[[getDefaultProps was defined on %s, a plain JavaScript class. This is only supported for classes created using React.createClass. Use a static property to define defaultProps instead.]]

,
				aB
			)
		end
		
		if aA.propTypes and not ay.propTypes then
			d.error(
[[propTypes was defined as an instance property on %s. Use a static property to define propTypes instead.]]
,
				aB
			)
		end
		
		if aA.contextType and not ay.contextType then
			d.error(
[[contextType was defined as an instance property on %s. Use a static property to define contextType instead.]]
,
				aB
			)
		end

		if p then
			if ay.childContextTypes then
				d.error(
[[%s uses the legacy childContextTypes API which is no longer supported. Use React.createContext() instead.]]
,
					aB
				)
			end
			if ay.contextTypes then
				d.error(
[[%s uses the legacy contextTypes API which is no longer supported. Use React.createContext() with static contextType instead.]]
,
					aB
				)
			end
		else
			
			if aA.contextTypes and not ay.contextTypes then
				d.error(
[[contextTypes was defined as an instance property on %s. Use a static property to define contextTypes instead.]]
,
					aB
				)
			end

			
			if
				type(ay) == "table"
				and ay.contextType
				and ay.contextTypes
				and not au[ay]
			then
				au[ay] = true
				d.error(
[[%s declares both contextTypes and contextType static properties. The legacy contextTypes property will be ignored.]]
,
					aB
				)
			end
		end

		if type(aA.componentShouldUpdate) == "function" then
			d.error(
[[%s has a method called componentShouldUpdate(). Did you mean shouldComponentUpdate()? The name is phrased as a question because the function is expected to return a value.]]


,
				aB
			)
		end
		
		if
			type(ay) == "table"
			and ay.isPureReactComponent
			and aA.shouldComponentUpdate ~= nil
		then
			d.error(
[[%s has a method called shouldComponentUpdate(). shouldComponentUpdate should not be used when extending React.PureComponent. Please extend React.Component if shouldComponentUpdate is used.]]

,
				A(ay) or "A pure component"
			)
		end
		if type(aA.componentDidUnmount) == "function" then
			d.error(
[[%s has a method called componentDidUnmount(). But there is no such lifecycle method. Did you mean componentWillUnmount()?]]

,
				aB
			)
		end
		if type(aA.componentDidReceiveProps) == "function" then
			d.error(
[[%s has a method called componentDidReceiveProps(). But there is no such lifecycle method. If you meant to update the state in response to changing props, use componentWillReceiveProps(). If you meant to fetch data or run side-effects or mutations after React has updated the UI, use componentDidUpdate().]]



,
				aB
			)
		end
		if type(aA.componentWillRecieveProps) == "function" then
			d.error(
[[%s has a method called componentWillRecieveProps(). Did you mean componentWillReceiveProps()?]]
,
				aB
			)
		end
		if type(aA.UNSAFE_componentWillRecieveProps) == "function" then
			d.error(
[[%s has a method called UNSAFE_componentWillRecieveProps(). Did you mean UNSAFE_componentWillReceiveProps()?]]
,
				aB
			)
		end
		local aD = aA.props ~= az
		if aA.props ~= nil and aD then
			d.error(
[[%s(...): When calling super() in `%s`, make sure to pass up the same props that your component's constructor was passed.]]
,
				aB,
				aB
			)
		end
		if rawget(aA, "defaultProps") then
			d.error(
[[Setting defaultProps as an instance property on %s is not supported and will be ignored. Instead, define defaultProps as a static property on %s.]]
,
				aB,
				aB
			)
		end

		if
			type(aA.getSnapshotBeforeUpdate) == "function"
			and type(aA.componentDidUpdate) ~= "function"
			and not ao[ay]
		then
			ao[ay] = true
			d.error(
[[%s: getSnapshotBeforeUpdate() should be used with componentDidUpdate(). This component defines getSnapshotBeforeUpdate() only.]]
,
				A(ay)
			)
		end

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		local aE = aA.state
		
		
		
		if aE ~= nil and type(aE) ~= "table" then
			d.error("%s.state: must be set to an object or nil", aB)
		end
		
		if
			type(ay) == "table"
			and type(aA.getChildContext) == "function"
			and type(ay.childContextTypes) ~= "table"
		then
			d.error(
[[%s.getChildContext(): childContextTypes must be defined in order to use getChildContext().]]
,
				aB
			)
		end
	end
end

local function adoptClassInstance(ax: Fiber, ay: any)
	
	ay.__updater = getClassComponentUpdater()
	ax.stateNode = ay
	
	y(ay, ax)
	if a then
		ay._reactInternalInstance = ak
	end
end

local function constructClassInstance(ax: Fiber, ay: any, az: any): any
	local aA = false
	local aB = Z
	local aC = Z
	local aD = ay.contextType

	if a then
		
		if ay["contextType"] ~= nil then
			
			local aE =
				
				aD == nil or (aD["$$typeof"] == E and aD._context == nil) 

			if not aE and not av[ay] then
				av[ay] = true

				local aF = ""
				if aD == nil then
					aF =
[[ However, it is set to nil. This can be caused by a typo or by mixing up named and default imports. This can also happen due to a circular dependency, so try moving the createContext() call to a separate file.]]				

elseif type(aD) ~= "table" then
					aF = " However, it is set to a " .. type(aD) .. "."
				elseif aD["$$typeof"] == F then
					aF = " Did you accidentally pass the Context.Provider instead?"
				elseif aD._context ~= nil then
					
					aF = " Did you accidentally pass the Context.Consumer instead?"
				else
					aF ..= " However, it is set to an object with keys {"
					for aG, aH in aD do
						aF ..= aG .. ", "
					end
					aF ..= "}."
				end
				d.error(
[[%s defines an invalid contextType. contextType should point to the Context object returned by React.createContext().%s]]
,
					A(ay) or "Component",
					aF
				)
			end
		end
	end

	
	if aD ~= nil and type(aD) == "table" then
		aC = aa(aD)
	elseif not p then
		aB = X(ax, ay, true)
		local aE = ay.contextTypes
		aA = aE ~= nil
		aC = aA
				and W(ax, aB)
			or Z
	end

	
	if a then
		if
			o
			and bit32.band(ax.mode, J) ~= 0
		then
			af()
			
			
			local aE, aF = xpcall(ay.__ctor, C, az, aC) 
			
			ag()

			if not aE then
				error(aF)
			end
		end
	end

	
	
	local aE = ay.__ctor(az, aC)
	
	
	
	
	
	ax.memoizedState = aE.state
	local aF = ax.memoizedState
	adoptClassInstance(ax, aE)

	if a then
		
		
		if
			type(ay.getDerivedStateFromProps) == "function"
			and aF == B
		then
			local aG = A(ay) or "Component"
			if not an[aG] then
				an[aG] = true
				
				d.error(
[[`%s` uses `getDerivedStateFromProps` but its initial state has not been initialized. This is not recommended. Instead, define the initial state by passing an object to `self:setState` in the `init` method of `%s`. This ensures that `getDerivedStateFromProps` arguments have a consistent shape.]]


,
					aG,
					
					
					aG
				)
			end
		end

		
		
		
		if
			type(ay.getDerivedStateFromProps) == "function"
			or type(aE.getSnapshotBeforeUpdate) == "function"
		then
			local aG 			
local aH 			
local aI 			
if
				
				type(aE.componentWillMount) == "function" 
				
			then
				aG = "componentWillMount"
			elseif type(aE.UNSAFE_componentWillMount) == "function" then
				aG = "UNSAFE_componentWillMount"
			end
			if
				
				type(aE.componentWillReceiveProps) == "function" 
				
			then
				aH = "componentWillReceiveProps"
			elseif type(aE.UNSAFE_componentWillReceiveProps) == "function" then
				aH = "UNSAFE_componentWillReceiveProps"
			end
			if
				
				type(aE.componentWillUpdate) == "function" 
				
			then
				aI = "componentWillUpdate"
			elseif type(aE.UNSAFE_componentWillUpdate) == "function" then
				aI = "UNSAFE_componentWillUpdate"
			end
			if
				aG ~= nil
				or aH ~= nil
				or aI ~= nil
			then
				local aJ = A(ay) or "Component"
				local aK
				if type(ay.getDerivedStateFromProps) == "function" then
					aK = "getDerivedStateFromProps()"
				else
					aK = "getSnapshotBeforeUpdate()"
				end

				local aL
				if aG ~= nil then
					aL = ("\n  " .. tostring(aG))
				else
					aL = ""
				end

				local aM
				if aH ~= nil then
					aM = (
						"\n  " .. tostring(aH)
					)
				else
					aM = ""
				end

				local aN
				if aI ~= nil then
					aN = "\n  " .. tostring(aI)
				else
					aN = ""
				end

				if not ap[aJ] then
					ap[aJ] = true
					d.error(
[[Unsafe legacy lifecycles will not be called for components using new component APIs.

%s uses %s but also contains the following legacy lifecycles:%s%s%s

The above lifecycles should be removed. Learn more about this warning here:
https://reactjs.org/link/unsafe-component-lifecycles]],
						aJ,
						aK,
						aL,
						aM,
						aN
					)
				end
			end
		end
	end

	
	
	if aA then
		V(ax, aB, aC)
	end

	return aE
end

local function callComponentWillMount(ax, ay)
	local az = ay.state

	if
		ay.componentWillMount ~= nil
		and type(ay.componentWillMount) == "function"
	then
		
		ay:componentWillMount()
	end
	
	if
		ay.UNSAFE_componentWillMount ~= nil
		and type(ay.UNSAFE_componentWillMount) == "function"
	then
		
		ay:UNSAFE_componentWillMount()
	end

	if az ~= ay.state then
		if a then
			d.error(
[[%s.componentWillMount(): Assigning directly to this.state is deprecated (except inside a component's constructor). Use setState instead.]],
				A(ax.type) or "Component"
			)
		end
		getClassComponentUpdater().enqueueReplaceState(ay, ay.state)
	end
end

function callComponentWillReceiveProps(ax, ay, az, aA)
	local aB = ay.state
	if
		ay.componentWillReceiveProps ~= nil
		and type(ay.componentWillReceiveProps) == "function"
	then
		
		ay:componentWillReceiveProps(az, aA)
	end
	if
		ay.UNSAFE_componentWillReceiveProps ~= nil
		and type(ay.UNSAFE_componentWillReceiveProps) == "function"
	then
		
		ay:UNSAFE_componentWillReceiveProps(az, aA)
	end

	if ay.state ~= aB then
		if a then
			local aC = A(ax.type) or "Component"
			if not am[aC] then
				am[aC] = true
				d.error(
[[%s.componentWillReceiveProps(): Assigning directly to this.state is deprecated (except inside a component's constructor). Use setState instead.]]

,
					aC
				)
			end
		end
		getClassComponentUpdater().enqueueReplaceState(ay, ay.state)
	end
end


local function mountClassInstance(
	ax: Fiber,
	ay: any,
	az: any,
	aA: Lanes
)
	if a then
		checkClassInstance(ax, ay, az)
	end

	local aB = ax.stateNode
	aB.props = az
	aB.state = ax.memoizedState
	
	
	aB.__refs = al

	R(ax)

	
	local aC
	if type(ay) == "table" then
		aC = ay.contextType
	end
	
	if aC ~= nil and type(aC) == "table" then
		aB.context = aa(aC)
	elseif p then
		aB.context = Z
	else
		local aD = X(ax, ay, true)
		aB.context = W(ax, aD)
	end

	if a then
		if aB.state == az then
			local aD = A(ay) or "Component"
			if not at[aD] then
				at[aD] = true
				d.error(
[[%s: It is not recommended to assign props directly to state because updates to props won't be reflected in state. In most cases, it is better to use props directly.]]

,
					aD
				)
			end
		end

		if bit32.band(ax.mode, J) ~= 0 then
			u.recordLegacyContextWarning(ax, aB)
		end

		if s then
			u.recordUnsafeLifecycleWarnings(
				ax,
				aB
			)
		end
	end

	L(ax, az, aB, aA)
	aB.state = ax.memoizedState

	
	local aD = type(ay)
	local aE
	if type(ay) == "table" then
		aE = ay.getDerivedStateFromProps
	end
	if
		aE ~= nil
		and type(aE) == "function"
	then
		applyDerivedStateFromProps(
			ax,
			ay,
			aE,
			az
		)
		aB.state = ax.memoizedState
	end

	
	
	
	if
		aD == "table"
		and type(ay.getDerivedStateFromProps) ~= "function"
		and type(aB.getSnapshotBeforeUpdate) ~= "function"
		and (
			type(aB.UNSAFE_componentWillMount) == "function"
			or type(aB.componentWillMount) == "function"
		)
	then
		callComponentWillMount(ax, aB)
		
		
		L(ax, az, aB, aA)
		aB.state = ax.memoizedState
	end

	if type(aB.componentDidMount) == "function" then
		if a and t then
			ax.flags =
				bit32.bor(ax.flags, bit32.bor(m, k))
		else
			ax.flags = bit32.bor(ax.flags, k)
		end
	end
end

function resumeMountClassInstance(
	ax: Fiber,
	ay: any,
	az: any,
	aA: Lanes
): boolean
	local aB = ax.stateNode

	local aC = ax.memoizedProps
	aB.props = aC

	local aD = aB.context
	local aE = ay.contextType
	local aF = Z

	
	if aE ~= nil and type(aE) == "table" then
		aF = aa(aE)
	elseif not p then
		local aG = X(ax, ay, true)
		aF = W(ax, aG)
	end

	local aG = ay.getDerivedStateFromProps
	local aH = type(aG) == "function"
		or type(aB.getSnapshotBeforeUpdate) == "function"

	
	
	

	
	
	if
		not aH
		and (
			type(aB.UNSAFE_componentWillReceiveProps) == "function"
			or type(aB.componentWillReceiveProps) == "function"
		)
	then
		if aC ~= az or aD ~= aF then
			callComponentWillReceiveProps(ax, aB, az, aF)
		end
	end

	N()

	local aI = ax.memoizedState
	aB.state = aI
	local aJ = aI
	L(ax, az, aB, aA)
	aJ = ax.memoizedState
	if
		aC == az
		and aI == aJ
		and not Y()
		and not M()
	then
		
		
		if type(aB.componentDidMount) == "function" then
			if a and t then
				ax.flags =
					bit32.bor(ax.flags, m, k)
			else
				ax.flags = bit32.bor(ax.flags, k)
			end
		end
		return false
	end

	if
		aG ~= nil
		and type(aG) == "function"
	then
		applyDerivedStateFromProps(
			ax,
			ay,
			aG,
			az
		)
		aJ = ax.memoizedState
	end

	local aK = M()
		or checkShouldComponentUpdate(
			ax,
			ay,
			aC,
			az,
			aI,
			aJ,
			aF
		)

	if aK then
		
		
		if
			not aH
			and (
				type(aB.UNSAFE_componentWillMount) == "function"
				or type(aB.componentWillMount) == "function"
			)
		then
			if type(aB.componentWillMount) == "function" then
				aB:componentWillMount()
			end
			if type(aB.UNSAFE_componentWillMount) == "function" then
				aB:UNSAFE_componentWillMount()
			end
		end
		if type(aB.componentDidMount) == "function" then
			if a and t then
				ax.flags =
					bit32.bor(ax.flags, m, k)
			else
				ax.flags = bit32.bor(ax.flags, k)
			end
		end
	else
		
		
		if type(aB.componentDidMount) == "function" then
			if a and t then
				ax.flags =
					bit32.bor(ax.flags, m, k)
			else
				ax.flags = bit32.bor(ax.flags, k)
			end
		end

		
		
		ax.memoizedProps = az
		ax.memoizedState = aJ
	end

	
	
	aB.props = az
	aB.state = aJ
	aB.context = aF

	return aK
end


local function updateClassInstance(
	ax: Fiber,
	ay: Fiber,
	az: any,
	aA: any,
	aB: Lanes
): boolean
	local aC = ay.stateNode

	S(ax, ay)

	local aD = ay.memoizedProps
	local aE = if ay.type == ay.elementType
		then aD
		else G(ay.type, aD)
	aC.props = aE
	local aF = ay.pendingProps

	local aG = aC.context
	local aH
	local aI
	
	if type(az) == "table" then
		aH = az.contextType
		aI = az.getDerivedStateFromProps
	end
	local aJ = Z
	if type(aH) == "table" then
		aJ = aa(aH)
	elseif not p then
		local aK = X(ay, az, true)
		aJ = W(ay, aK)
	end

	local aK = (
		aI ~= nil
		and type(aI) == "function"
	)
		or (
			aC.getSnapshotBeforeUpdate ~= nil
			and type(aC.getSnapshotBeforeUpdate) == "function"
		)

	
	
	

	
	
	if
		not aK
		and (
			(
				aC.UNSAFE_componentWillReceiveProps ~= nil
				and type(aC.UNSAFE_componentWillReceiveProps) == "function"
			)
			or (
				aC.componentWillReceiveProps ~= nil
				and type(aC.componentWillReceiveProps) == "function"
			)
		)
	then
		if aD ~= aF or aG ~= aJ then
			callComponentWillReceiveProps(ay, aC, aA, aJ)
		end
	end

	N()

	local aL = ay.memoizedState
	aC.state = aL
	local aM = aC.state
	L(ay, aA, aC, aB)
	aM = ay.memoizedState

	if
		aD == aF
		and aL == aM
		and not Y()
		and not M()
	then
		
		
		if
			aC.componentDidUpdate ~= nil
			and type(aC.componentDidUpdate) == "function"
		then
			if
				aD ~= ax.memoizedProps
				or aL ~= ax.memoizedState
			then
				ay.flags = bit32.bor(ay.flags, k)
			end
		end
		if
			aC.getSnapshotBeforeUpdate ~= nil
			and type(aC.getSnapshotBeforeUpdate) == "function"
		then
			if
				aD ~= ax.memoizedProps
				or aL ~= ax.memoizedState
			then
				ay.flags = bit32.bor(ay.flags, l)
			end
		end
		return false
	end

	if
		aI ~= nil
		and type(aI) == "function"
	then
		applyDerivedStateFromProps(
			ay,
			az,
			aI,
			aA
		)
		aM = ay.memoizedState
	end

	local aN = M()
		or checkShouldComponentUpdate(
			ay,
			az,
			aE,
			aA,
			aL,
			aM,
			aJ
		)

	if aN then
		
		
		if
			not aK
			and (
				(
					aC.UNSAFE_componentWillUpdate ~= nil
					and type(aC.UNSAFE_componentWillUpdate) == "function"
				)
				or (
					aC.componentWillUpdate ~= nil
					and type(aC.componentWillUpdate) == "function"
				)
			)
		then
			if
				aC.componentWillUpdate ~= nil
				and type(aC.componentWillUpdate) == "function"
			then
				
				aC:componentWillUpdate(aA, aM, aJ)
			end
			if
				aC.UNSAFE_componentWillUpdate ~= nil
				and type(aC.UNSAFE_componentWillUpdate) == "function"
			then
				
				aC:UNSAFE_componentWillUpdate(aA, aM, aJ)
			end
		end
		if
			aC.componentDidUpdate ~= nil
			and type(aC.componentDidUpdate) == "function"
		then
			ay.flags = bit32.bor(ay.flags, k)
		end
		if
			aC.getSnapshotBeforeUpdate ~= nil
			and type(aC.getSnapshotBeforeUpdate) == "function"
		then
			ay.flags = bit32.bor(ay.flags, l)
		end
	else
		
		
		if
			aC.componentDidUpdate ~= nil
			and type(aC.componentDidUpdate) == "function"
		then
			if
				aD ~= ax.memoizedProps
				or aL ~= ax.memoizedState
			then
				ay.flags = bit32.bor(ay.flags, k)
			end
		end
		if
			aC.getSnapshotBeforeUpdate ~= nil
			and type(aC.getSnapshotBeforeUpdate) == "function"
		then
			if
				aD ~= ax.memoizedProps
				or aL ~= ax.memoizedState
			then
				ay.flags = bit32.bor(ay.flags, l)
			end
		end

		
		
		ay.memoizedProps = aA
		ay.memoizedState = aM
	end

	
	
	aC.props = aA
	aC.state = aM
	aC.context = aJ

	return aN
end

return {
	adoptClassInstance = adoptClassInstance,
	constructClassInstance = constructClassInstance,
	mountClassInstance = mountClassInstance,
	resumeMountClassInstance = resumeMountClassInstance,
	updateClassInstance = updateClassInstance,

	applyDerivedStateFromProps = applyDerivedStateFromProps,
	
	emptyRefsObject = al,
}
