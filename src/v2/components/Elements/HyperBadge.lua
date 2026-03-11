--[[
    HyperUI v2 - HyperBadge Element
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.theme.tokens)

local function HyperBadge(props)
    local color = props.Color or Tokens.Color.Accent
    
    return React.createElement("Frame", {
        Size = UDim2.fromScale(0, 0),
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundColor3 = color,
        BackgroundTransparency = 0.2,
        BorderSizePixel = 0,
        LayoutOrder = props.LayoutOrder,
    }, {
        UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
        Padding = React.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 2),
            PaddingBottom = UDim.new(0, 2),
            PaddingLeft = UDim.new(0, 6),
            PaddingRight = UDim.new(0, 6),
        }),
        Label = React.createElement("TextLabel", {
            Size = UDim2.fromScale(0, 0),
            AutomaticSize = Enum.AutomaticSize.XY,
            BackgroundTransparency = 1,
            Text = props.Text or "BADGE",
            TextColor3 = Tokens.Color.Text,
            Font = Tokens.Font.Bold,
            TextSize = 10,
        })
    })
end

return HyperBadge
