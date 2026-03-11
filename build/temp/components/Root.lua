




local a = require(script.Parent.Parent.dependencies.React)
local b = require(script.Parent.Window)

local function Root(c)
    local d, e = a.useState(c.store:GetState())
    
    a.useEffect(function()
        local f = c.store:OnUpdate(function(f)
            e(f)
        end)
        return f
    end, {c.store})
    
    local f = {}
    for g, h in pairs(d.windows) do
        f[g] = a.createElement(b, {
            id = g,
            store = c.store,
            config = h,
        })
    end
    
    
    
    return a.createElement("Frame", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
    }, f)
end

return Root
