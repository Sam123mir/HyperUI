



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.theme.tokens)

local function HyperIcon(c)
    local d = c.Size or 16
    
    return a.createElement("ImageLabel", {
        Size = UDim2.fromOffset(d, d),
        BackgroundTransparency = 1,
        Image = c.Icon or "",
        ImageColor3 = c.Color or b.Color.Text,
        LayoutOrder = c.LayoutOrder,
    })
end

return HyperIcon
