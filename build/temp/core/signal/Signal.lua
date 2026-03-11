




local a = {}
a.__index = a

function a.new()
    return setmetatable({
        _listeners = {}
    }, a)
end

function a:Connect(b)
    local c = {
        callback = b,
        connected = true
    }
    
    function c:Disconnect()
        c.connected = false
    end
    
    table.insert(self._listeners, c)
    return c
end

function a:Fire(...)
    local b = self._listeners
    local c = 1
    
    while c <= #b do
        local d = b[c]
        if d.connected then
            task.spawn(d.callback, ...)
            c = c + 1
        else
            table.remove(b, c)
        end
    end
end

function a:Wait()
    local b = coroutine.running()
    local c
    c = self:Connect(function(...)
        c:Disconnect()
        coroutine.resume(b, ...)
    end)
    return coroutine.yield()
end

function a:Destroy()
    for b, c in ipairs(self._listeners) do
        c.connected = false
    end
    self._listeners = {}
end

return a
