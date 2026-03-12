










local a = {}
local b = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
local c = b.WeakMap
type WeakMap<K, V> = b.WeakMap<K, V>

local d = require(script.Parent:WaitForChild('ReactFiberLane'))
type Lane = d.Lane
type Lanes = d.Lanes

local e = require(script.Parent:WaitForChild('ReactInternalTypes'))
type Fiber = e.Fiber

local f = require(script.Parent.Parent:WaitForChild('shared'))
type Wakeable = f.Wakeable

local g = require(script.Parent.Parent:WaitForChild('shared')).ReactFeatureFlags
local h = g.enableSchedulingProfiler
local i = require(script.Parent.Parent:WaitForChild('shared')).ReactVersion
local j = require(script.Parent.Parent:WaitForChild('shared')).getComponentName





local k = _G.performance ~= nil
local l = _G.performance
	or {
		mark = function(l)
			debug.profilebegin(l)
			debug.profileend()
		end,
	}

function formatLanes(m: Lane | Lanes): string
	return tostring(m)
end


if h then
	if k then
		l.mark("--react-init-" .. tostring(i))
	end
end

a.markCommitStarted = function(m: Lanes): ()
	if h then
		if k then
			l.mark("--commit-start-" .. formatLanes(m))
		end
	end
end

a.markCommitStopped = function(): ()
	if h then
		if k then
			l.mark("--commit-stop")
		end
	end
end





local m: WeakMap<Wakeable, number> = c.new()
local n: number = 0
function getWakeableID(o: Wakeable): number
	if not m:has(o) then
		m:set(o, n)
		n += 1
	end
	return m:get(o)
end

a.markComponentSuspended = function(o: Fiber, p: Wakeable): ()
	if h then
		if k then
			local q = getWakeableID(p)
			local r = j(o.type) or "Unknown"
			
			l.mark(
				"--suspense-suspend-" .. tostring(q) .. "-" .. r
			)
			p:andThen(function()
				l.mark(
					"--suspense-resolved-" .. tostring(q) .. "-" .. r
				)
			end, function()
				l.mark(
					"--suspense-rejected-" .. tostring(q) .. "-" .. r
				)
			end)
		end
	end
end

a.markLayoutEffectsStarted = function(o: Lanes): ()
	if h then
		if k then
			l.mark("--layout-effects-start-" .. formatLanes(o))
		end
	end
end

a.markLayoutEffectsStopped = function(): ()
	if h then
		if k then
			l.mark("--layout-effects-stop")
		end
	end
end

a.markPassiveEffectsStarted = function(o: Lanes): ()
	if h then
		if k then
			l.mark("--passive-effects-start-" .. formatLanes(o))
		end
	end
end

a.markPassiveEffectsStopped = function(): ()
	if h then
		if k then
			l.mark("--passive-effects-stop")
		end
	end
end

a.markRenderStarted = function(o: Lanes): ()
	if h then
		if k then
			l.mark("--render-start-" .. formatLanes(o))
		end
	end
end

a.markRenderYielded = function(): ()
	if h then
		if k then
			l.mark("--render-yield")
		end
	end
end

a.markRenderStopped = function(): ()
	if h then
		if k then
			l.mark("--render-stop")
		end
	end
end

a.markRenderScheduled = function(o: Lane): ()
	if h then
		if k then
			l.mark("--schedule-render-" .. formatLanes(o))
		end
	end
end

a.markForceUpdateScheduled = function(o: Fiber, p: Lane): ()
	if h then
		if k then
			local q = j(o.type) or "Unknown"
			
			l.mark(
				"--schedule-forced-update-" .. formatLanes(p) .. "-" .. q
			)
		end
	end
end

a.markStateUpdateScheduled = function(o: Fiber, p: Lane): ()
	if h then
		if k then
			local q = j(o.type) or "Unknown"
			
			l.mark(
				"--schedule-state-update-" .. formatLanes(p) .. "-" .. q
			)
		end
	end
end

return a
