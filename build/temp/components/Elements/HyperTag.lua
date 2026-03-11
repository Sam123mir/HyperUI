



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.theme.tokens)

local function HyperTag(c)
    return a.createElement("Frame", {
        Size = UDim2.fromScale(0, 0),
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundColor3 = b.Color.Surface,
        BorderSizePixel = 0,
        LayoutOrder = c.LayoutOrder,
    }, {
        UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
        UIStroke = a.createElement("UIStroke", { Color = b.Color.Border, Thickness = 1 }),
        Padding = a.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 4),
            PaddingBottom = UDim.new(0, 4),
            PaddingLeft = UDim.new(0, 8),
            PaddingRight = UDim.new(0, 8),
        }),
        Layout = a.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            Padding = UDim.new(0, 8),
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        Label = a.createElement("TextLabel", {
            Size = UDim2.fromScale(0, 0),
            AutomaticSize = Enum.AutomaticSize.XY,
            BackgroundTransparency = 1,
            Text = c.Text or "Tag",
            TextColor3 = b.Color.Text,
            Font = b.Font.Main,
            TextSize = b.FontSize.Small,
        }),
        Close = c.OnDismiss and a.createElement("TextButton", {
            Size = UDim2.fromOffset(12, 12),
            BackgroundTransparency = 1,
            Text = "×",
            TextColor3 = b.Color.TextMuted,
            Font = b.Font.Bold,
            TextSize = 14,
            [a.Event.Activated] = c.OnDismiss,
        })
    })
end

return HyperTag
