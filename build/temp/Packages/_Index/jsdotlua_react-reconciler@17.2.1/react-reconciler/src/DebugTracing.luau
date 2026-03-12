









type Array<T> = { [number]: T }
type Map<K, V> = { [K]: V }
type Object = { [string]: any }
type Function = (any) -> any?
local a = require(script.Parent.Parent:WaitForChild('shared'))
local b = a.console
local c = {}


local d


local e = require(script.Parent:WaitForChild('ReactFiberLane'))
type Lane = e.Lane
type Lanes = e.Lanes
type Wakeable = a.Wakeable

local f =
	require(script.Parent.Parent:WaitForChild('shared')).ReactFeatureFlags.enableDebugTracing

local g: Object = b
local h: nil | Function 

local i: Array<any> = {}

local j: number = 0


function decimalToBinaryString(k: number): string
	local l = ""
	repeat
		local m = k / 2
		local n, o = math.modf(m)
		k = n
		l = math.ceil(o) .. l
	until k == 0

	local m = 31 - string.len(l)
	return string.rep("0", m) .. l
end

local function formatLanes(k: Lane | Lanes): string
	return "0b"
		
		.. decimalToBinaryString(k)
end

local function group(...): ()
	for k, l in { ... } do
		table.insert(i, l)
	end
	if h == nil then
		h = g.log
		g.log = d
	end
end

local function groupEnd(): ()
	table.remove(i, 1)
	while j > #i do
		g.groupEnd()
		j -= 1
	end
	if #i == 0 then
		g.log = h
		h = nil
	end
end

function d(...): ()
	if j < #i then
		for k = j + 1, #i do
			local l = i[k]
			g.group(l)
		end
		j = #i
	end
	if typeof(h) == "function" then
		(h :: any)(...)
	else
		g.log(...)
	end
end


local k = ""

local function logCommitStarted(l: Lanes): ()
	if _G.__DEV__ then
		if f then
			group(
				string.format("* commit (%s)", formatLanes(l)),
				k,
				"",
				
				""
			)
		end
	end
end
c.logCommitStarted = logCommitStarted

local function logCommitStopped(): ()
	if _G.__DEV__ then
		if f then
			groupEnd()
		end
	end
end
c.logCommitStopped = logCommitStopped




















local function logComponentSuspended(l: string, m: Wakeable): ()
	if _G.__DEV__ then
		if f then
			
			
			
			d(
				string.format("* %s suspended", l)
				
				
				
				
				
			)
			m:andThen(function()
				d(
					string.format("* %s resolved", l)
					
					
					
					
					
				)
			end, function()
				d(
					string.format("* %s rejected", l)
					
					
					
					
					
				)
			end)
		end
	end
end
c.logComponentSuspended = logComponentSuspended

local function logLayoutEffectsStarted(l: Lanes): ()
	if _G.__DEV__ then
		if f then
			group(
				string.format("* layout effects (%s)", formatLanes(l))
				
				
				
				
			)
		end
	end
end
c.logLayoutEffectsStarted = logLayoutEffectsStarted

local function logLayoutEffectsStopped(): ()
	if _G.__DEV__ then
		if f then
			groupEnd()
		end
	end
end
c.logLayoutEffectsStopped = logLayoutEffectsStopped

local function logPassiveEffectsStarted(l: Lanes): ()
	if _G.__DEV__ then
		if f then
			group(
				string.format("* passive effects (%s)", formatLanes(l))
				
				
				
				
			)
		end
	end
end
c.logPassiveEffectsStarted = logPassiveEffectsStarted

local function logPassiveEffectsStopped(): ()
	if _G.__DEV__ then
		if f then
			groupEnd()
		end
	end
end
c.logPassiveEffectsStopped = logPassiveEffectsStopped

local function logRenderStarted(l: Lanes): ()
	if _G.__DEV__ then
		if f then
			group(
				string.format("* render (%s)", formatLanes(l))
				
				
				
				
			)
		end
	end
end
c.logRenderStarted = logRenderStarted

local function logRenderStopped(): ()
	if _G.__DEV__ then
		if f then
			groupEnd()
		end
	end
end
c.logRenderStopped = logRenderStopped

local function logForceUpdateScheduled(l: string, m: Lane): ()
	if _G.__DEV__ then
		if f then
			d(
				string.format("* %s forced update (%s)", l, formatLanes(m))
				
				
				
				
			)
		end
	end
end
c.logForceUpdateScheduled = logForceUpdateScheduled

local function logStateUpdateScheduled(
	l: string,
	m: Lane,
	n: any
): ()
	if _G.__DEV__ then
		if f then
			d(
				string.format("* %s updated state (%s)", l, formatLanes(m))
				
				
				
				
				
			)
		end
	end
end
c.logStateUpdateScheduled = logStateUpdateScheduled
return c
