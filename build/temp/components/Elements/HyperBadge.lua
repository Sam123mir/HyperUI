



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.theme.tokens)

local function HyperBadge(c)
    local d = c.Color or b.Color.Accent
    
    return a.createElement("Frame", {
        Size = UDim2.fromScale(0, 0),
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundColor3 = d,
        BackgroundTransparency = 0.2,
        BorderSizePixel = 0,
        LayoutOrder = c.LayoutOrder,
    }, {
        UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
        Padding = a.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 2),
            PaddingBottom = UDim.new(0, 2),
            PaddingLeft = UDim.new(0, 6),
            PaddingRight = UDim.new(0, 6),
        }),
        Label = a.createElement("TextLabel", {
            Size = UDim2.fromScale(0, 0),
            AutomaticSize = Enum.AutomaticSize.XY,
            BackgroundTransparency = 1,
            Text = c.Text or "BADGE",
            TextColor3 = b.Color.Text,
            Font = b.Font.Bold,
            TextSize = 10,
        })
    })
end

return HyperBadge
