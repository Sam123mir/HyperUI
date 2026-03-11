



local a = {}
a.__index = a

function a.new(b, c)
    return setmetatable({
        Id = b,
        Store = c,
    }, a)
end

function a:SetTitle(b)
    self.Store:Dispatch({
        type = "UPDATE_ELEMENT",
        id = self.Id,
        props = { text = b }
    })
end

function a:SetValue(b)
    self.Store:Dispatch({
        type = "UPDATE_ELEMENT",
        id = self.Id,
        props = { value = b }
    })
end

function a:SetVisible(b)
    self.Store:Dispatch({
        type = "UPDATE_ELEMENT",
        id = self.Id,
        props = { visible = b }
    })
end

return a
