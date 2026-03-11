



local a = require(script.Parent.Tab)
local b = {}
b.__index = b

function b.new(c, d)
    return setmetatable({
        Id = c,
        Store = d,
    }, b)
end

function b:CreateTab(c)
    local d = game:GetService("HttpService"):GenerateGUID(false)
    
    self.Store:Dispatch({
        type = "ADD_TAB",
        windowId = self.Id,
        tab = {
            id = d,
            title = c.Title or "New Tab",
            icon = c.Icon,
        }
    })
    
    return a.new(d, self.Id, self.Store)
end

function b:SetTitle(c)
    self.Store:Dispatch({
        type = "UPDATE_ELEMENT",
        id = self.Id,
        props = { title = c }
    })
end

function b:Close()
    self.Store:Dispatch({
        type = "UPDATE_ELEMENT",
        id = self.Id,
        props = { visible = false }
    })
end

return b
