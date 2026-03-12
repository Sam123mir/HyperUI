









local a = require(script.Parent:WaitForChild('ReactInternalTypes'))
type Fiber = a.Fiber

local b = require(script.Parent.Parent:WaitForChild('shared')).ReactFeatureFlags
local c = b.enableProfilerTimer
local d = b.enableProfilerCommitHooks

local e = require(script.Parent:WaitForChild('ReactWorkTags'))
local f = e.Profiler



local g = require(script.Parent.Parent:WaitForChild('scheduler'))

local h = g.unstable_now

export type ProfilerTimer = {
	getCommitTime: () -> number,
	recordCommitTime: () -> (),
	startProfilerTimer: (Fiber) -> (),
	stopProfilerTimerIfRunning: (Fiber) -> (),
	stopProfilerTimerIfRunningAndRecordDelta: (Fiber) -> ()	

}

local i: number = 0
local j: number = -1
local k: number = -1
local l: number = -1

function getCommitTime(): number
	return i
end

function recordCommitTime(): ()
	if not c then
		return
	end
	i = h()
end

function startProfilerTimer(m: Fiber): ()
	if not c then
		return
	end

	k = h()

	
	if m.actualStartTime ~= nil and (m.actualStartTime :: number) < 0 then
		m.actualStartTime = h()
	end
end

function stopProfilerTimerIfRunning(m: Fiber): ()
	if not c then
		return
	end
	k = -1
end

function stopProfilerTimerIfRunningAndRecordDelta(
	m: Fiber,
	n: boolean
): ()
	if not c then
		return
	end

	if k >= 0 then
		local o = h() - k
		m.actualDuration += o
		if n then
			m.selfBaseDuration = o
		end
		k = -1
end
end

function recordLayoutEffectDuration(m: Fiber): ()
	if not c or not d then
		return
	end

	if j >= 0 then
		local n = h() - j

		j = -1		
		

local o = m.return_
		while o ~= nil do
			if o.tag == f then
				local p = o.stateNode
				p.effectDuration += n
				break
			end
			o = o.return_
		end
	end
end

function recordPassiveEffectDuration(m: Fiber): ()
	if not c or not d then
		return
	end

	if l >= 0 then
		local n = h() - l

		l = -1		
		

local o = m.return_
		while o ~= nil do
			if o.tag == f then
				local p = o.stateNode
				if p ~= nil then
					
					
					
					p.passiveEffectDuration += n
				end
				break
			end
			o = o.return_
		end
	end
end

function startLayoutEffectTimer(): ()
	if not c or not d then
		return
	end
	j = h()
end

function startPassiveEffectTimer(): ()
	if not c or not d then
		return
	end
	l = h()
end

function transferActualDuration(m: Fiber): ()
	
	
	
	local n = m.child
	while n do
		m.actualDuration += n.actualDuration
		n = n.sibling
	end
end

return {
	getCommitTime = getCommitTime,
	recordCommitTime = recordCommitTime,
	recordLayoutEffectDuration = recordLayoutEffectDuration,
	recordPassiveEffectDuration = recordPassiveEffectDuration,
	startLayoutEffectTimer = startLayoutEffectTimer,
	startPassiveEffectTimer = startPassiveEffectTimer,
	startProfilerTimer = startProfilerTimer,
	stopProfilerTimerIfRunning = stopProfilerTimerIfRunning,
	stopProfilerTimerIfRunningAndRecordDelta = stopProfilerTimerIfRunningAndRecordDelta,
	transferActualDuration = transferActualDuration,
}
