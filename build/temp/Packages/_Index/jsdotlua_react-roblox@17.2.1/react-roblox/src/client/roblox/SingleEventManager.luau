



















local a = require(script.Parent.Parent.Parent.Parent:WaitForChild('shared')).console
type Function = (...any) -> ...any

local b = "Change."

local c = {
	
	Disabled = "Disabled",

	
	Suspended = "Suspended",

	
	Enabled = "Enabled",
}

export type EventManager = {
	connectPropertyChange: (self: any, eventName: string, newValue: any) -> (),
	connectEvent: (self: any, eventName: string, newValue: any) -> (),
	resume: (self: any) -> (),
	suspend: (self: any) -> ()
}

local d = {}
d.__index = d

function d.new(e: Instance): EventManager
	local f = setmetatable({
		
		_suspendedEventQueue = {},

		
		
		_connections = {},

		
		
		
		_listeners = {},

		
		
		_status = c.Disabled,

		
		_isResuming = false,

		
		_instance = e,
	}, d)

	return (f :: any) :: EventManager
end

function d:connectEvent(e, f)
	self:_connect(e, self._instance[e], f)
end

function d:connectPropertyChange(e, f)
	local g, h =
		pcall(self._instance.GetPropertyChangedSignal, self._instance, e)

	if not g then
		error(
			string.format(
				"Cannot get changed signal on property %q: %s",
				tostring(e),
				h
			),
			0
		)
	end

	self:_connect(b .. e, h, f)
end

function d:_connect(e, f, g)
	
	if g == nil then
		if self._connections[e] ~= nil then
			self._connections[e]:Disconnect()
			self._connections[e] = nil
		end

		self._listeners[e] = nil
	else
		if self._connections[e] == nil then
			self._connections[e] = f:Connect(function(...)
				if self._status == c.Enabled then
					self._listeners[e](self._instance, ...)
				elseif self._status == c.Suspended then
					
					

					local h = select("#", ...)
					table.insert(
						self._suspendedEventQueue,
						{ e, h, ... }
					)
				end
			end)
		end

		self._listeners[e] = g
	end
end

function d:suspend()
	self._status = c.Suspended
end

function d:resume()
	
	
	if self._isResuming then
		return
	end

	self._isResuming = true

	
	
	for e, f in self._suspendedEventQueue do
		local g = self._listeners[f[1] ]
		local h = f[2]

		
		
		if g ~= nil then
			
			
			local i = coroutine.create(g)
			local j, k = coroutine.resume(
				i,
				self._instance,
				unpack(f, 3, 2 + h)
			)

			
			
			
			if not j then
				a.warn("%s", k)
			end
		end
	end

	self._isResuming = false
	self._status = c.Enabled
	table.clear(self._suspendedEventQueue)
end

return d
