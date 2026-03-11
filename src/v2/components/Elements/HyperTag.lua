--[[
    HyperUI v2 - HyperTag Element
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.theme.tokens)

local function HyperTag(props)
    return React.createElement("Frame", {
        Size = UDim2.fromScale(0, 0),
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundColor3 = Tokens.Color.Surface,
        BorderSizePixel = 0,
        LayoutOrder = props.LayoutOrder,
    }, {
        UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
        UIStroke = React.createElement("UIStroke", { Color = Tokens.Color.Border, Thickness = 1 }),
        Padding = React.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 4),
            PaddingBottom = UDim.new(0, 4),
            PaddingLeft = UDim.new(0, 8),
            PaddingRight = UDim.new(0, 8),
        }),
        Layout = React.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            Padding = UDim.new(0, 8),
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        Label = React.createElement("TextLabel", {
            Size = UDim2.fromScale(0, 0),
            AutomaticSize = Enum.AutomaticSize.XY,
            BackgroundTransparency = 1,
            Text = props.Text or "Tag",
            TextColor3 = Tokens.Color.Text,
            Font = Tokens.Font.Main,
            TextSize = Tokens.FontSize.Small,
        }),
        Close = props.OnDismiss and React.createElement("TextButton", {
            Size = UDim2.fromOffset(12, 12),
            BackgroundTransparency = 1,
            Text = "×",
            TextColor3 = Tokens.Color.TextMuted,
            Font = Tokens.Font.Bold,
            TextSize = 14,
            [React.Event.Activated] = props.OnDismiss,
        })
    })
end

return HyperTag
