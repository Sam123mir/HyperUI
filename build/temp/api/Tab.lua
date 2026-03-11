



local a = require(script.Parent.Section)
local b = {}
b.__index = b

function b.new(c, d, e)
    return setmetatable({
        Id = c,
        WindowId = d,
        Store = e,
    }, b)
end

function b:CreateSection(c)
    local d = game:GetService("HttpService"):GenerateGUID(false)
    
    self.Store:Dispatch({
        type = "ADD_SECTION",
        tabId = self.Id,
        section = {
            id = d,
            title = c.Title or "New Section",
        }
    })
    
    return a.new(d, self.Id, self.WindowId, self.Store)
end

return b
