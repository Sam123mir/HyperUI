









local a = _G.__DEV__ :: boolean
local b = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
local c = b.Array
local d = b.Error
type Array<T> = { [number]: T }
type Set<T> = { [T]: boolean }
type Object = { [any]: any }
type Map<K, V> = { [K]: V }

local e = require(script.Parent.Parent:WaitForChild('shared')).console
local f = require(script.Parent.Parent:WaitForChild('shared')).describeError

local g = require(script.Parent.Parent:WaitForChild('shared'))


type ReactElement = g.ReactElement<any, any>
type ReactPortal = g.ReactPortal

local h = require(script.Parent.Parent:WaitForChild('react'))
type LazyComponent<T, P> = h.LazyComponent<T, P>

local i = require(script.Parent:WaitForChild('ReactInternalTypes'))
type Fiber = i.Fiber
type RoactStableKey = i.RoactStableKey
local j = require(script.Parent:WaitForChild('ReactFiberLane'))
type Lanes = j.Lanes

local k = require(script.Parent.Parent:WaitForChild('shared')).getComponentName
local l = require(script.Parent:WaitForChild('ReactFiberFlags'))
local m = l.Placement
local n = l.Deletion
local o = require(script.Parent.Parent:WaitForChild('shared')).ReactSymbols
local p = o.getIteratorFn
local q = o.REACT_ELEMENT_TYPE
local r = o.REACT_FRAGMENT_TYPE
local s = o.REACT_PORTAL_TYPE
local t = o.REACT_LAZY_TYPE
local u = o.REACT_BLOCK_TYPE
local v = require(script.Parent:WaitForChild('ReactWorkTags'))
local w = v.FunctionComponent
local x = v.ClassComponent
local y = v.HostText
local z = v.HostPortal
local A = v.ForwardRef
local B = v.Fragment
local C = v.SimpleMemoComponent
local D = v.Block
local E = require(script.Parent.Parent:WaitForChild('shared')).invariant
local F = require(script.Parent.Parent:WaitForChild('shared')).ReactFeatureFlags


local G = F.enableLazyElements
local H = F.enableBlocksAPI

local I = require(script.Parent:WaitForChild('ReactFiber.new'))
local J = I.createWorkInProgress
local K = I.resetWorkInProgress
local L = I.createFiberFromElement
local M = I.createFiberFromFragment
local N = I.createFiberFromText
local O = I.createFiberFromPortal









local P = {}

local Q




local R
local S
local T = function(T: any, U: Fiber) end

if a then
	Q = false
	
	

	
	

	
	



R = {}
	S = {}

	
	
	
	
	T = function(U: any, V: Fiber)
		if U == nil or type(U) ~= "table" then
			return
		end
		if not U._store or U._store.validated or U.key ~= nil then
			return
		end
		E(
			U._store ~= nil and type(U._store) == "table",
[[React Component in warnForMissingKey should have a _store. This error is likely caused by a bug in React. Please file an issue.]]		

)
		U._store.validated = true

		local W = k(V.type) or "Component"

		if R[W] then
			return
		end
		R[W] = true

		e.error(
[[Each child in a list should have a unique "key" prop. See https://reactjs.org/link/warning-keys for more information.]]		


)
	end
end

local U = c.isArray

function coerceRef(V: Fiber, W: Fiber | nil, X: ReactElement)
	local Y = X.ref
	if Y ~= nil and type(Y) == "string" then
		
		if
			not X._owner
			or not X._self
			or X._owner.stateNode == X._self
		then
			
			local Z
			if a then
				Z = k(V.type) or "Component"
			else
				Z = "<enable __DEV__ mode for component names>"
			end
			error(
				d.new(
					string.format(
[[Component "%s" contains the string ref "%s". Support for string refs has been removed. We recommend using useRef() or createRef() instead. Learn more about using refs safely here: https://reactjs.org/link/strict-mode-string-ref]]




,
						Z,
						tostring(Y)
					)
				)
			)
		end

		if not X._owner then
			error(
				"Expected ref to be a function or an object returned by React.createRef(), or nil."
			)
		end

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	end
	return Y
end






















local function warnOnFunctionType(V: Fiber)
	if a then
		local W = k(V.type) or "Component"

		if S[W] then
			return
		end
		S[W] = true

		e.error(
[[Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.]]		


)
	end
end



function resolveLazyType<T, P>(V: LazyComponent<T, P>): LazyComponent<T, P> | T
	
	
	local W = V._payload
	local X = V._init
	local Y, Z = xpcall(X, f, W)
	if not Y then
		
		return V
	end

	return Z
end





local function ChildReconciler(V)
	local function deleteChild(W: Fiber, X: Fiber)
		if not V then
			
			return
		end
		local Y = W.deletions
		if Y == nil then
			W.deletions = { X }
			W.flags = bit32.bor(W.flags, n)
		else
			table.insert(Y, X)
		end
	end

	local function deleteRemainingChildren(
		W: Fiber,
		X: Fiber | nil
	)
		if not V then
			
			return nil
		end

		
		
		local Y = X
		while Y ~= nil do
			deleteChild(W, Y)
			Y = Y.sibling
		end
		return nil
	end

	local function mapRemainingChildren(
		W: Fiber,
		X: Fiber
	): { [(string | number)]: Fiber }
		
		
		
		local Y: { [(string | number)]: Fiber } = {}

		
		local Z: Fiber? = X
		while Z ~= nil do
			if Z.key ~= nil then
				Y[Z.key] = Z
			else
				Y[Z.index] = Z
			end
			Z = Z.sibling
		end
		return Y
	end

	local function useFiber(W: Fiber, X: any): Fiber
		
		
		local Y = J(W, X)
		
		Y.index = 1
		Y.sibling = nil
		return Y
	end

	local function placeChild(
		W: Fiber,
		X: number,
		Y: number
	): number
		W.index = Y
		if not V then
			
			return X
		end
		local Z = W.alternate
		if Z ~= nil then
			local _ = Z.index
			if _ < X then
				
				W.flags = bit32.bor(W.flags, m)
				return X
			else
				
				return _
			end
		else
			
			W.flags = bit32.bor(W.flags, m)
			return X
		end
	end

	local function placeSingleChild(W: Fiber): Fiber
		
		
		if V and W.alternate == nil then
			W.flags = bit32.bor(W.flags, m)
		end
		return W
	end

	local function updateTextNode(
		W: Fiber,
		X: Fiber | nil,
		Y: string,
		Z: Lanes
	)
		
		if X == nil or (X :: Fiber).tag ~= y then
			
			local _ = N(Y, W.mode, Z)
			_.return_ = W
			return _
		else
			
			local _ = useFiber(X :: Fiber, Y)
			_.return_ = W
			return _
		end
	end

	local function updateElement(
		W: Fiber,
		X: Fiber | nil,
		Y: ReactElement,
		Z: Lanes
	): Fiber
		if X ~= nil then
			if
				(X :: Fiber).elementType == Y.type
				
				
				
			then
				
				local _ = useFiber(X :: Fiber, Y.props)
				_.ref = coerceRef(W, X, Y)
				_.return_ = W
				if a then
					_._debugSource = Y._source
					_._debugOwner = Y._owner
				end
				return _
			elseif H and (X :: Fiber).tag == D then
				
				
				
				local _: any = Y.type
				if type(_) == "table" and _["$$typeof"] == t then
					_ = resolveLazyType(_) :: LazyComponent<any, any>
				end
				if
					_["$$typeof"] == u
					and _._render == (X :: Fiber).type._render
				then
					
					local aa = useFiber(X :: Fiber, Y.props)
					aa.return_ = W
					aa.type = _
					if a then
						aa._debugSource = Y._source
						aa._debugOwner = Y._owner
					end
					return aa
				end
			end
		end
		
		local aa = L(Y, W.mode, Z)
		aa.ref = coerceRef(W, X, Y)
		aa.return_ = W
		return aa
	end

	local function updatePortal(
		aa: Fiber,
		W: Fiber | nil,
		X: ReactPortal,
		Y: Lanes
	): Fiber
		
		if
			W == nil
			or (W :: Fiber).tag ~= z
			or (W :: Fiber).stateNode.containerInfo ~= X.containerInfo
			or (W :: Fiber).stateNode.implementation ~= X.implementation
		then
			
			local Z = O(X, aa.mode, Y)
			Z.return_ = aa
			return Z
		else
			
			local Z = useFiber(W :: Fiber, X.children or {})
			Z.return_ = aa
			return Z
		end
	end

	local function updateFragment(
		aa: Fiber,
		W: Fiber | nil,
		
		
		X: any,
		Y: Lanes,
		Z: nil | string
	): Fiber
		if W == nil or (W :: Fiber).tag ~= B then
			
			local _ =
				M(X, aa.mode, Y, Z)
			_.return_ = aa
			return _
		else
			
			local _ = useFiber(W :: Fiber, X)
			_.return_ = aa
			return _
		end
	end

	
	
	
	
	local function assignStableKey(aa: any?, W: Object): ()
		
		
		

		
		
		
		if W.key == nil then
			
			local X = type(aa)
			if X == "string" or X == "number" then
				W.key = aa
			elseif X == "table" then
				W.key = tostring(aa)
			end
		end
	end

	local function createChild(
		aa: Fiber,
		W: any,
		X: Lanes,
		
		Y: any?
	): Fiber | nil
		
		if W == nil then
			return nil
		end

		
		local Z = type(W)

		
		if Z == "table" then
			
			
			assignStableKey(Y, W)
			
			local _ = W["$$typeof"]
			if _ == q then
				local ab = L(W, aa.mode, X)
				ab.ref = coerceRef(aa, nil, W)
				ab.return_ = aa
				return ab
			elseif _ == s then
				local ab = O(W, aa.mode, X)
				ab.return_ = aa
				return ab
			elseif _ == t then
				if G then
					local ab = W._payload
					local ac = W._init
					
					
					return createChild(aa, ac(ab), X)
				end
			end

			
			
			local ab =
				M(W, aa.mode, X, nil)
			ab.return_ = aa
			return ab

			
			
		end

		if Z == "string" or Z == "number" then
			
			
			
			local ab =
				N(tostring(W), aa.mode, X)
			ab.return_ = aa
			return ab
		end

		if a then
			if Z == "function" then
				warnOnFunctionType(aa)
			end
		end

		return nil
	end

	local function updateSlot(
		aa: Fiber,
		ab: Fiber | nil,
		ac: any,
		W: Lanes,
		
		X: any?
	): Fiber | nil
		
		if ac == nil then
			return nil
		end

		

		local Y = if ab ~= nil then ab.key else nil
		
		local Z = type(ac)

		if Z == "table" then
			
			
			assignStableKey(X, ac)
			
			local _ = ac["$$typeof"]
			if _ == q then
				if ac.key == Y then
					if ac.type == r then
						return updateFragment(
							aa,
							ab,
							ac.props.children,
							W,
							Y :: string?
						)
					end
					return updateElement(aa, ab, ac, W)
				else
					return nil
				end
			elseif _ == s then
				if ac.key == Y then
					return updatePortal(aa, ab, ac, W)
				else
					return nil
				end
			elseif _ == t then
				if G then
					local ad = ac._payload
					local ae = ac._init
					
					
					return updateSlot(aa, ab, ae(ad), W)
				end
			end

			
			
			if Y ~= nil then
				return nil
			end

			return updateFragment(aa, ab, ac, W)

			
			
		end

		
		if Z == "string" or Z == "number" then
			
			
			
			if Y ~= nil then
				return nil
			end
			return updateTextNode(aa, ab, tostring(ac), W)
		end

		if a then
			if Z == "function" then
				warnOnFunctionType(aa)
			end
		end

		return nil
	end

	local function updateFromMap(
		aa: Map<string | number, Fiber>,
		ab: Fiber,
		ac: number,
		ad: any,
		ae: Lanes,
		
		W: any?
	): Fiber | nil
		
		if ad == nil then
			return nil
		end

		
		local X = type(ad)

		if X == "table" then
			
			
			assignStableKey(W, ad)
			local Y
			
			local Z = ad["$$typeof"]
			if Z == q then
				if ad.key == nil then
					Y = ac
				else
					Y = ad.key
				end
				local _ = aa[Y]
				if ad.type == r then
					return updateFragment(
						ab,
						_,
						ad.props.children,
						ae,
						ad.key
					)
				end
				return updateElement(ab, _, ad, ae)
			elseif Z == s then
				if ad.key == nil then
					Y = ac
				else
					Y = ad.key
				end
				local _ = aa[Y]
				return updatePortal(ab, _, ad, ae)
			elseif Z == t then
				if G then
					local _ = ad._payload
					local af = ad._init
					
					
					return updateFromMap(
						aa,
						ab,
						ac,
						af(_),
						ae
					)
				end
			end

			
			
			local af = aa[ac]
			return updateFragment(ab, af, ad, ae)

			
			
		end

		
		if X == "string" or X == "number" then
			
			
			local af = aa[ac] or nil
			return updateTextNode(ab, af, tostring(ad), ae)
		end

		if a then
			if X == "function" then
				warnOnFunctionType(ab)
			end
		end

		return nil
	end

	
	

local function warnOnInvalidKey(
		aa: any,
		ab: Set<string> | nil,
		ac: Fiber
	): Set<string> | nil
		if a then
			if aa == nil or type(aa) ~= "table" then
				return ab
			end
			
			local ad = aa["$$typeof"]
			if ad == q or ad == s then
				T(aa, ac)
				local ae = aa.key
				if type(ae) ~= "string" then
					
				elseif ab == nil then
					ab = {};
					(ab :: Set<string>)[ae] = true
				elseif not (ab :: Set<string>)[ae] then
					(ab :: Set<string>)[ae] = true
				else
					e.error(
'Encountered two children with the same key, `%s`. Keys should be unique so that components maintain their identity across updates. Non-unique keys may cause children to be duplicated and/or omitted \u{2014} the behavior is unsupported and could change in a future version.'



,
						ae
					)
				end
			elseif ad == t then
				if G then
					local ae = aa._payload
					local af = aa._init
					warnOnInvalidKey(af(ae), ab, ac)
				end
			end
		end
		return ab
	end

	local function reconcileChildrenArray(
		aa: Fiber,
		ab: Fiber | nil,
		ac: Array<any>,
		ad: Lanes
	): Fiber | nil
		
		
		
		

		
		
		
		
		
		
		

		
		

		
		

		if a then
			
			local ae 			
for af, W in ac do
				ae = warnOnInvalidKey(W, ae, aa)
			end
		end

		local ae: Fiber | nil 		
local af: Fiber | nil 
		
local W: Fiber | nil = ab
		local X = 1
		local Y = 1
		local Z: Fiber | nil 		
		
local _ = #ac
		
		while W ~= nil and Y <= _ do
			if W.index > Y then
				Z = W
				W = nil
			else
				Z = W.sibling
			end
			
			




local ag
			
			local ah = ac[Y]
			if
				ah ~= nil
				and type(ah) == "table"
				and ah["$$typeof"] ~= nil
			then
				ag =
					updateSlot(aa, W, ah, ad, Y)
			else
				ag = updateSlot(aa, W, ah, ad)
			end
			if ag == nil then
				
				
				
				
				if W == nil then
					W = Z
				end
				break
			end
			if V then
				
				if W and (ag :: Fiber).alternate == nil then
					
					
					
					deleteChild(aa, W :: Fiber)
				end
			end
			X = placeChild(ag :: Fiber, X, Y)
			if af == nil then
				
				ae = ag
			else
				
				
				
				
				(af :: Fiber).sibling = ag
			end
			af = ag
			W = Z
			
			Y += 1
		end

		if Y > _ then
			
			deleteRemainingChildren(aa, W)
			return ae
		end

		if W == nil then
			
			
			
			while Y <= _ do
				
				




local ag
				
				local ah = ac[Y]
				if
					ah ~= nil
					and type(ah) == "table"
					and ah["$$typeof"] ~= nil
				then
					ag = createChild(aa, ah, ad, Y)
				else
					ag = createChild(aa, ah, ad)
				end
				if ag == nil then
					
					Y += 1
					continue
				end
				
				X = placeChild(ag :: Fiber, X, Y)
				if af == nil then
					
					ae = ag
				else
					(af :: Fiber).sibling = ag
				end
				af = ag
				
				Y += 1
			end
			return ae
		end

		
		
		local ag = mapRemainingChildren(aa, W :: Fiber)

		
		
		while Y <= _ do
			local ah = updateFromMap(
				ag,
				aa,
				Y,
				ac[Y],
				ad,
				
				Y
			)
			if ah ~= nil then
				if V then
					if ah.alternate ~= nil then
						
						
						
						
						ag[if ah.key == nil
							then Y
							else ah.key] =
							nil
					end
				end
				X = placeChild(ah, X, Y)
				if af == nil then
					ae = ah
				else
					(af :: Fiber).sibling = ah
				end
				af = ah
			end
			
			Y += 1
		end

		if V then
			
			
			for ah, ai in ag do
				deleteChild(aa, ai)
			end
		end

		return ae
	end

	
	local function reconcileChildrenIterator(
		aa: Fiber,
		ab: Fiber | nil,
		
		
		ac: any,
		ad: Lanes,
		
		ae: (...any) -> any
	): Fiber | nil
		
		

		
		
		
		
		
		
		

		if a then
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			

			
			if ac.entries == ae then
				if not Q then
					e.error(
[[Using Maps as children is not supported. Use an array of keyed ReactElements instead.]]					

)
				end
				Q = true
			end

			
			
			local af = ae(ac)
			if af then
				local ag 				
local ah = af.next()
				while not ah.done do
					ah = af.next()
					local ai = ah.value
					ag = warnOnInvalidKey(ai, ag, aa)
				end
			end
		end

		local af = ae(ac)
		
		

		local ag: Fiber | nil 		
local ah: Fiber 
		
local ai = ab
		local W = 1
		local X = 1
		local Y: Fiber | nil 
		
local Z = af.next()
		while ai ~= nil and not Z.done do
			if ai.index > X then
				Y = ai
				ai = nil
			else
				Y = ai.sibling
			end
			local _ =
				updateSlot(aa, ai, Z.value, ad, Z.key)
			if _ == nil then
				
				
				
				
				if ai == nil then
					ai = Y
				end
				break
			end
			if V then
				
				if ai and (_ :: Fiber).alternate == nil then
					
					
					deleteChild(aa, ai)
				end
			end
			W = placeChild(_ :: Fiber, W, X)
			if ah == nil then
				
				ag = _
			else
				
				
				
				
				ah.sibling = _ :: Fiber
			end
			ah = _ :: Fiber
			ai = Y

			X += 1
			Z = af.next()
		end

		if Z.done then
			
			deleteRemainingChildren(aa, ai)
			return ag
		end

		if ai == nil then
			
			
			while not Z.done do
				local _ = createChild(aa, Z.value, ad, Z.key)
				if _ == nil then
					X += 1
					Z = af.next()
					continue
				end
				
				W = placeChild(_ :: Fiber, W, X)
				if ah == nil then
					
					ag = _
				else
					ah.sibling = _
				end
				ah = _ :: Fiber

				X += 1
				Z = af.next()
			end
			return ag
		end

		
		
		local _

		
		while not Z.done do
			if not _ then
				
				_ = mapRemainingChildren(aa, ai :: Fiber)
			end
			local aj = updateFromMap(
				_,
				aa,
				X,
				Z.value,
				ad,
				Z.key
			)
			if aj ~= nil then
				if V then
					if aj.alternate ~= nil then
						
						
						
						
						if aj.key == nil then
							_[X] = nil
						else
							_[aj.key] = nil
						end
					end
				end
				W = placeChild(aj, W, X)
				if ah == nil then
					ag = aj
				else
					ah.sibling = aj
				end
				ah = aj
			end

			X += 1
			Z = af.next()
		end

		if V then
			
			
			for aj, ak in _ do
				deleteChild(aa, ak)
			end
		end

		return ag
	end

	local function reconcileSingleTextNode(
		aa: Fiber,
		ab: Fiber | nil,
		ac: string,
		ad: Lanes
	): Fiber
		
		
		
		if ab ~= nil and (ab :: Fiber).tag == y then
			
			
			deleteRemainingChildren(aa, (ab :: Fiber).sibling)
			local ae = useFiber(ab :: Fiber, ac)
			ae.return_ = aa
			return ae
		end
		
		
		deleteRemainingChildren(aa, ab)
		local ae = N(ac, aa.mode, ad)
		ae.return_ = aa
		return ae
	end

	local function reconcileSingleElement(
		aa: Fiber,
		ab: Fiber | nil,
		ac: ReactElement,
		ad: Lanes
	): Fiber
		local ae = ac.key
		local af = ab
		while af ~= nil do
			
			
			if af.key == ae then
				if af.tag == B then
					if ac.type == r then
						deleteRemainingChildren(aa, af.sibling)
						local ag = useFiber(af, ac.props.children)
						ag.return_ = aa
						if a then
							ag._debugSource = ac._source
							ag._debugOwner = ac._owner
						end
						return ag
					end
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
				else
					if
						af.elementType == ac.type
						
						
						
						
						
						
					then
						deleteRemainingChildren(aa, af.sibling)
						local ag = useFiber(af, ac.props)
						ag.ref = coerceRef(aa, af, ac)
						ag.return_ = aa
						if a then
							ag._debugSource = ac._source
							ag._debugOwner = ac._owner
						end
						return ag
					end
				end
				
				deleteRemainingChildren(aa, af)
				break
			else
				deleteChild(aa, af)
			end
			af = af.sibling
		end

		if ac.type == r then
			local ag = M(
				ac.props.children,
				aa.mode,
				ad,
				
				ac.key :: string
			)
			ag.return_ = aa
			return ag
		else
			local ag = L(ac, aa.mode, ad)
			ag.ref = coerceRef(aa, ab, ac)
			ag.return_ = aa
			return ag
		end
	end

	local function reconcileSinglePortal(
		aa: Fiber,
		ab: Fiber | nil,
		ac: ReactPortal,
		ad: Lanes
	): Fiber
		local ae = ac.key
		local af = ab
		while af ~= nil do
			
			
			if af.key == ae then
				if
					af.tag == z
					and af.stateNode.containerInfo == ac.containerInfo
					and af.stateNode.implementation == ac.implementation
				then
					deleteRemainingChildren(aa, af.sibling)
					local ag = useFiber(af, ac.children or {})
					ag.return_ = aa
					return ag
				else
					deleteRemainingChildren(aa, af)
					break
				end
			else
				deleteChild(aa, af)
			end
			af = af.sibling
		end

		local ag = O(ac, aa.mode, ad)
		ag.return_ = aa
		return ag
	end

	
	
	
	local function reconcileChildFibers(
		aa: Fiber,
		ab: Fiber | nil,
		ac: any,
		ad: Lanes
	): Fiber | nil
		
		
		
		

		
		local ae = type(ac)

		
		
		
		local af = ac ~= nil
			and ae == "table"
			and ac.type == r
			and ac.key == nil
		if af then
			ac = ac.props.children
			ae = type(ac)
		end
		local ag = U(ac)

		
		
		local ah = ac ~= nil
			and ae == "table"
			and not ag

		if ah then
			
			local ai = ac["$$typeof"]
			if ai == q then
				return placeSingleChild(
					reconcileSingleElement(
						aa,
						ab,
						ac,
						ad
					)
				)
			elseif ai == s then
				return placeSingleChild(
					reconcileSinglePortal(aa, ab, ac, ad)
				)
			elseif ai == t then
				if G then
					local aj = ac._payload
					local ak = ac._init
					
					return reconcileChildFibers(
						aa,
						ab,
						ak(aj),
						ad
					)
				end
			end
		
		elseif ag then
			return reconcileChildrenArray(aa, ab, ac, ad)
		elseif ae == "string" or ae == "number" then
			return placeSingleChild(
				reconcileSingleTextNode(
					aa,
					ab,
					tostring(ac),
					ad
				)
			)
		end

		
		local ai = p(ac)
		if ai then
			return reconcileChildrenIterator(
				aa,
				ab,
				ac,
				ad,
				ai
			)
		end

		
		
		
		
		

		if a then
			if ae == "function" then
				warnOnFunctionType(aa)
			end
		end
		if ac == nil and not af then
			
			local aj = false
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			if
				aj
				and (
					aa.tag == x
					or aa.tag == w
					or aa.tag == A
					or aa.tag == C
				)
			then
				E(
					false,
[[%s(...): Nothing was returned from render. This usually means a return statement is missing. Or, to render nothing, return nil.]]

,
					k(aa.type) or "Component"
				)
			end
		end

		
		return deleteRemainingChildren(aa, ab)
	end

	return reconcileChildFibers
end

P.reconcileChildFibers = ChildReconciler(true)
P.mountChildFibers = ChildReconciler(false)

P.cloneChildFibers = function(aa: Fiber | nil, ab: Fiber)
	
	
	
	
	

	if ab.child == nil then
		return
	end

	local ac = ab.child :: Fiber
	local ad = J(ac, ac.pendingProps)
	ab.child = ad

	ad.return_ = ab
	while ac.sibling ~= nil do
		ac = ac.sibling
		ad.sibling = J(ac, ac.pendingProps)
		
		ad = ad.sibling :: Fiber
		ad.return_ = ab
	end
	ad.sibling = nil
end


P.resetChildFibers = function(aa: Fiber, ab: Lanes): ()
	local ac = aa.child
	while ac ~= nil do
		K(ac, ab)
		ac = ac.sibling
	end
end

return P
