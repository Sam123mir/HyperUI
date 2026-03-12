










local a = require(script.Parent.Parent:WaitForChild('shared'))
type ReactNodeList = a.ReactNodeList
type Wakeable = a.Wakeable

local b = require(script.Parent:WaitForChild('ReactInternalTypes'))
type Fiber = b.Fiber
local c = require(script.Parent:WaitForChild('ReactFiberHostConfig'))
type SuspenseInstance = c.SuspenseInstance
local d = require(script.Parent:WaitForChild('ReactFiberLane'))
type Lane = d.Lane
local e = require(script.Parent:WaitForChild('ReactWorkTags'))
local f = e.SuspenseComponent
local g = e.SuspenseListComponent
local h = require(script.Parent:WaitForChild('ReactFiberFlags'))
local i = h.NoFlags
local j = h.DidCapture
local k = c.isSuspenseInstancePending
local l = c.isSuspenseInstanceFallback


type Set<T> = { [T]: boolean }

export type SuspenseProps = {
	children: ReactNodeList?,
	fallback: ReactNodeList?,

	
	suspenseCallback: (Set<Wakeable>?) -> any,

	unstable_expectedLoadTime: number?
}








export type SuspenseState = {
	
	
	
	dehydrated: SuspenseInstance?,
	
	
	
	retryLane: Lane
}



export type SuspenseListTailMode = string?

export type SuspenseListRenderState = {
	isBackwards: boolean,
	
	rendering: Fiber?,
	
	renderingStartTime: number,
	
	last: Fiber?,
	
	tail: Fiber?,
	
	tailMode: SuspenseListTailMode
}

local m = {}

m.shouldCaptureSuspense =
	function(n: Fiber, o: boolean): boolean
		
		
		local p: SuspenseState? = n.memoizedState
		if p then
			if p.dehydrated ~= nil then
				
				return true
			end
			return false
		end
		local q = n.memoizedProps
		
		if q.fallback == nil then
			return false
		end
		
		if q.unstable_avoidThisFallback ~= true then
			return true
		end
		
		
		if o then
			return false
		end
		
		return true
	end

m.findFirstSuspended = function(n: Fiber): Fiber?
	local o = n
	while o ~= nil do
		if o.tag == f then
			local p: SuspenseState? = o.memoizedState
			if p then
				local q: SuspenseInstance? = p.dehydrated
				if
					q == nil
					or k(q)
					or l(q)
				then
					return o
				end
			end
		elseif
			o.tag == g
			
			
			and o.memoizedProps.revealOrder ~= nil
		then
			local p = bit32.band(o.flags, j) ~= i
			if p then
				return o
			end
		elseif o.child ~= nil then
			o.child.return_ = o
			o = o.child
			continue
		end
		if o == n then
			return nil
		end
		while o.sibling == nil do
			if o.return_ == nil or o.return_ == n then
				return nil
			end
			
			o = o.return_ :: Fiber
		end
		
		(o.sibling :: Fiber).return_ = o.return_
		o = o.sibling :: Fiber
	end
	return nil
end

return m
