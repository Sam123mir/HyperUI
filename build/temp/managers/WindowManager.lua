




local a = {}
a.__index = a

function a.new(b)
    local c = setmetatable({
        Store = b,
        Windows = {}, 
    }, a)
    
    return c
end

function a:FocusWindow(b)
    local c = table.find(self.Windows, b)
    if c then
        table.remove(self.Windows, c)
    end
    table.insert(self.Windows, b)
    
    
    for d, e in ipairs(self.Windows) do
        self.Store:Dispatch({
            type = "UPDATE_ELEMENT",
            id = e,
            props = { 
                zIndex = d,
                focused = (e == b)
            }
        })
    end
end

function a:RegisterWindow(b)
    table.insert(self.Windows, b)
    self:FocusWindow(b)
end

function a:UnregisterWindow(b)
    local c = table.find(self.Windows, b)
    if c then
        table.remove(self.Windows, c)
    end
end

return a
