










local a = require(script.Parent.Parent.Parent:WaitForChild('luau-polyfill'))
local b = a.Object

local c = require(script.Parent:WaitForChild('roblox'):WaitForChild('RobloxComponentProps'))

local d = require(script.Parent:WaitForChild('ReactRobloxHostTypes.roblox'))
type HostInstance = d.HostInstance




type Array<T> = { [number]: T }
type Object = { [any]: any }

local e: { [string]: any } = {}

e.setInitialProperties = c.setInitialProperties


local function diffProperties(
	f: HostInstance,
	g: string,
	h: Object,
	i: Object,
	j: HostInstance
): (nil | Array<any>)
	
	
	

	
	
	local k 
	
local l = h
	local m = i
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	

	
	
	
	for n, o in l do
		if m[n] ~= nil then
			continue
		end
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		k = k or table.create(2)
		table.insert(k, n)
		table.insert(k, b.None)
		
	end
	for n, o in m do
		local p = if l ~= nil then l[n] else nil
		if o == p then
			continue
		end
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		k = k or table.create(2)
		table.insert(k, n)
		table.insert(k, o)
		
	end
	
	
	
	
	
	
	return k
end
e.diffProperties = diffProperties
e.updateProperties = c.updateProperties
e.cleanupHostComponent = c.cleanupHostComponent

return e
