
















local a = require(script.Parent.Parent:WaitForChild('shared')).getComponentName
local b = require(script.Parent:WaitForChild('ReactWorkTags'))

local c = require(script.Parent:WaitForChild('ReactInternalTypes'))
type Fiber = c.Fiber
type FiberRoot = c.FiberRoot


local d = 1 
local e = 10 

local f = _G.__REACT_MICROPROFILER_LEVEL or 0

export type Marker = {
	id: string,
	startTime: number,
	endTime: number
}

export type SamplerCallback = (Marker) -> ()

local g = false
local h: SamplerCallback | nil 

function startTimerSampling(i: SamplerCallback)
	if g then
		warn("RobloxReactProfiling Timer Sampling already running.")
	end
	g = true
	h = i
end

function endTimerSampling()
	g = false
	h = nil
end

function getFirstStringKey(i: { any: any })
	for j, k in i do
		if type(j) == "string" then
			return j
		end
	end
	return nil
end

function startTimer(i: Marker)
	if g then
		i.startTime = os.clock()
	end
end
function endTimer(i: Marker)
	if g then
		i.endTime = os.clock()
		if h then
			h(i)
		end
	end
end

function profileRootBeforeUnitOfWork(i: FiberRoot): Marker?
	local j = i.current
	local k 
	
if j then
		if j.memoizedProps then
			
			k = getFirstStringKey(j.memoizedProps)
		end

		if
			k == nil
			and j.stateNode
			and j.stateNode.containerInfo
		then
			k = j.stateNode.containerInfo.Name
		end
	end

	
	if k == "Folder" and j.child then
		local l = j.child
		local m 		
if l.memoizedProps then
			
			m = getFirstStringKey(l.memoizedProps)
		end

		if
			m == nil
			and l.stateNode
			and l.stateNode.containerInfo
		then
			m = l.stateNode.containerInfo.Name
		end
		if m ~= nil then
			k = m
		end
	end

	if k ~= nil then
		local l = {
			id = k,
			startTime = 0,
			endTime = 0,
		}
		startTimer(l)
		debug.profilebegin(k)
		return l
	end

	return nil
end

function profileRootAfterYielding(i: Marker?)
	if i then
		endTimer(i)
		debug.profileend()
	end
end

function profileUnitOfWorkBefore(i: Fiber)
	local j = a(i.type)

	if i.key then
		j = tostring(i.key) .. "=" .. (j or "?")
	end

	local k 	
if i.stateNode then
		if
			i.tag == b.HostComponent
			or i.tag == b.HostText
		then
			local l =
				i.stateNode:FindFirstAncestorWhichIsA("LayerCollector")
			if l then
				k = "[" .. l:GetFullName() .. "] "
			end
		end
	end

	if k then
		j = k .. " : " .. (j or "?")
	end

	if j ~= nil then
		debug.profilebegin(j)
		return true
	end

	return false
end

function profileUnitOfWorkAfter(i: boolean)
	if i then
		debug.profileend()
	end
end

function profileCommitBefore()
	debug.profilebegin("Commit")
end
function profileCommitAfter()
	debug.profileend()
end

function noop(...: unknown) end

return {
	startTimerSampling = startTimerSampling,
	endTimerSampling = endTimerSampling,
	profileRootBeforeUnitOfWork = if f >= d
		then profileRootBeforeUnitOfWork
		else noop,
	profileRootAfterYielding = if f >= d
		then profileRootAfterYielding
		else noop,
	profileUnitOfWorkBefore = if f >= e
		then profileUnitOfWorkBefore
		else noop,
	profileUnitOfWorkAfter = if f >= e
		then profileUnitOfWorkAfter
		else noop,
	profileCommitBefore = if f >= d
		then profileCommitBefore
		else noop,
	profileCommitAfter = if f >= d
		then profileCommitAfter
		else noop,
}
