--[[
    HyperUI v2 - HyperSlider Element
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.theme.tokens)
local BaseElement = require(script.Parent.BaseElement)
local useSpring = require(script.Parent.Parent.Parent.hooks.useSpring)

local function HyperSlider(props)
    local min = props.Min or 0
    local max = props.Max or 100
    local value = props.Value or min
    
    local fillPercent = (value - min) / (max - min)
    local fillScale = useSpring(fillPercent, { damping = 0.9, stiffness = 0.1 })
    
    return React.createElement(BaseElement, {
        Disabled = props.Disabled,
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
            Label = React.createElement("TextLabel", {
                Size = UDim2.new(1, -120, 0.5, 0),
                BackgroundTransparency = 1,
                Text = props.Text or "Slider",
                TextColor3 = Tokens.Color.Text,
                Font = Tokens.Font.Main,
                TextSize = Tokens.FontSize.Medium,
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
            ValueLabel = React.createElement("TextLabel", {
                Size = UDim2.new(0, 50, 0.5, 0),
                Position = UDim2.new(1, -50, 0, 0),
                BackgroundTransparency = 1,
                Text = tostring(math.floor(value)),
                TextColor3 = Tokens.Color.Accent,
                Font = Tokens.Font.Bold,
                TextSize = Tokens.FontSize.Medium,
                TextXAlignment = Enum.TextXAlignment.Right,
            }),
            Track = React.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 4),
                Position = UDim2.new(0, 0, 0.8, -2),
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
    })
end

return HyperSlider
