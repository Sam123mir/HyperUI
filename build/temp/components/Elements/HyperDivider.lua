



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.theme.tokens)

local function HyperDivider(c)
    return a.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 1),
        BackgroundColor3 = b.Color.Border,
        BorderSizePixel = 0,
        BackgroundTransparency = 0.5,
        LayoutOrder = c.LayoutOrder,
    }, {
        Padding = a.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, b.Spacing[2]),
            PaddingRight = UDim.new(0, b.Spacing[2]),
        })
    })
end

return HyperDivider
