




local a = {}
a.__index = a

function a.new(b)
    local c = setmetatable({
        Store = b,
        Queue = {},
    }, a)
    
    return c
end

function a:Notify(b)
    local c = game:GetService("HttpService"):GenerateGUID(false)
    local d = {
        id = c,
        title = b.Title or "Notification",
        content = b.Content or "",
        icon = b.Icon,
        duration = b.Duration or 5,
        priority = b.Priority or "Info", 
        createdAt = os.clock(),
    }
    
    table.insert(self.Queue, d)
    
    self.Store:Dispatch({
        type = "ADD_NOTIFICATION",
        notification = d
    })
    
    
    task.delay(d.duration, function()
        self:Dismiss(c)
    end)
    
    return c
end

function a:Dismiss(b)
    local c     
for d, e in ipairs(self.Queue) do
        if e.id == b then
            c = d
            break
        end
    end
    
    if c then
        table.remove(self.Queue, c)
        self.Store:Dispatch({
            type = "REMOVE_NOTIFICATION",
            id = b
        })
    end
end

return a
