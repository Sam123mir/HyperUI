



local a = {}
a.__index = a

function a.new(b)
    local c = setmetatable({
        Store = b,
    }, a)
    
    return c
end

function a:SetTheme(b)
    self.Store:Dispatch({
        type = "SET_THEME",
        theme = b,
    })
end

return a
