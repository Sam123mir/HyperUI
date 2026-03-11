




local a = require(script.Parent.Parent.core.signal.Signal)

local b = {}
b.__index = b

function b.new(c)
    local d = setmetatable({
        Store = c,
        FocusedElement = nil,
        FocusChanged = a.new(),
    }, b)
    
    return d
end

function b:RequestFocus(c)
    if self.FocusedElement == c then return end
    
    local d = self.FocusedElement
    self.FocusedElement = c
    
    
    if d then
        self.Store:Dispatch({
            type = "UPDATE_ELEMENT",
            id = d,
            props = { focused = false }
        })
    end
    
    if c then
        self.Store:Dispatch({
            type = "UPDATE_ELEMENT",
            id = c,
            props = { focused = true }
        })
    end
    
    self.FocusChanged:Fire(c, d)
end

function b:ClearFocus()
    self:RequestFocus(nil)
end

function b:GetFocus()
    return self.FocusedElement
end

function b:Destroy()
    self.FocusChanged:Destroy()
end

return b
