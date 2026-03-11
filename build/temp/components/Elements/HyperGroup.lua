



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.theme.tokens)
local c = require(script.Parent.Parent.Containers.ElementList)

local function HyperGroup(d)
    return a.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = b.Color.Background,
        BackgroundTransparency = 0.5,
        BorderSizePixel = 0,
        LayoutOrder = d.LayoutOrder,
    }, {
        UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, b.Radius.Small) }),
        Padding = a.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 8),
            PaddingBottom = UDim.new(0, 8),
        }),
        Content = a.createElement(c, {}, d.children)
    })
end

return HyperGroup
