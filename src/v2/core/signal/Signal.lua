--[[
    HyperUI v2 - Signal System
    A lightweight, fast signal implementation for internal events.
]]

local Signal = {}
Signal.__index = Signal

function Signal.new()
    return setmetatable({
        _listeners = {}
    }, Signal)
end

function Signal:Connect(callback)
    local listener = {
        callback = callback,
        connected = true
    }
    
    function listener:Disconnect()
        listener.connected = false
    end
    
    table.insert(self._listeners, listener)
    return listener
end

function Signal:Fire(...)
    local listeners = self._listeners
    local i = 1
    
    while i <= #listeners do
        local listener = listeners[i]
        if listener.connected then
            task.spawn(listener.callback, ...)
            i = i + 1
        else
            table.remove(listeners, i)
        end
    end
end

function Signal:Wait()
    local thread = coroutine.running()
    local connection
    connection = self:Connect(function(...)
        connection:Disconnect()
        task.spawn(thread, ...)
    end)
    return coroutine.yield()
end

function Signal:Destroy()
    for _, listener in ipairs(self._listeners) do
        listener.connected = false
    end
    self._listeners = {}
end

return Signal
