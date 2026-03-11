--[[
    HyperUI v2 - HyperStatDisplay Element
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.theme.tokens)
local BaseElement = require(script.Parent.BaseElement)

local function HyperStatDisplay(props)
    return React.createElement(BaseElement, {
        Size = UDim2.new(1, 0, 0, 60),
        Disabled = true, -- Stats are generally not interactive
        LayoutOrder = props.LayoutOrder,
    }, {
        Container = React.createElement("Frame", {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
        }, {
            Padding = React.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, Tokens.Spacing[3]),
                PaddingRight = UDim.new(0, Tokens.Spacing[3]),
            }),
            Title = React.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 20),
                Position = UDim2.fromOffset(0, 8),
                BackgroundTransparency = 1,
                Text = props.Title or "Metric",
                TextColor3 = Tokens.Color.TextMuted,
                Font = Tokens.Font.Main,
                TextSize = Tokens.FontSize.Small,
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
            Value = React.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 30),
                Position = UDim2.fromOffset(0, 24),
                BackgroundTransparency = 1,
                Text = props.Value or "0",
                TextColor3 = Tokens.Color.Text,
                Font = Tokens.Font.Bold,
                TextSize = Tokens.FontSize.Title,
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
            SubValue = props.SubValue and React.createElement("TextLabel", {
                Size = UDim2.new(0, 100, 0, 20),
                Position = UDim2.new(1, -100, 1, -24),
                BackgroundTransparency = 1,
                Text = props.SubValue,
                TextColor3 = Tokens.Color.Success,
                Font = Tokens.Font.Main,
                TextSize = Tokens.FontSize.Small,
                TextXAlignment = Enum.TextXAlignment.Right,
            })
        })
    })
end

return HyperStatDisplay
