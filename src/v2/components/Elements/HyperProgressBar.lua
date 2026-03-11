--[[
    HyperUI v2 - HyperProgressBar Element
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.theme.tokens)
local useSpring = require(script.Parent.Parent.Parent.hooks.useSpring)

local function HyperProgressBar(props)
    local value = math.clamp(props.Value or 0, 0, 100)
    local fillScale = useSpring(value / 100, { damping = 0.8, stiffness = 0.2 })
    
    return React.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 24),
        BackgroundTransparency = 1,
        LayoutOrder = props.LayoutOrder,
    }, {
        Layout = React.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4) }),
        Label = props.Text and React.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 14),
            BackgroundTransparency = 1,
            Text = props.Text,
            TextColor3 = Tokens.Color.TextMuted,
            Font = Tokens.Font.Main,
            TextSize = Tokens.FontSize.Small,
            TextXAlignment = Enum.TextXAlignment.Left,
        }),
        Track = React.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 8),
            BackgroundColor3 = Tokens.Color.Surface,
            BorderSizePixel = 0,
        }, {
            UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
            Fill = React.createElement("Frame", {
                Size = fillScale:map(function(v) return UDim2.fromScale(v, 1) end),
                BackgroundColor3 = Tokens.Color.Accent,
                BorderSizePixel = 0,
            }, {
                UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
            })
        })
    })
end

return HyperProgressBar
