--[[
    HyperUI v2 - HyperCheckbox Element
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local BaseElement = require(script.Parent.BaseElement)
local useSpring = require(script.Parent.Parent.Parent.hooks.useSpring)
local useTheme = require(script.Parent.Parent.Parent.hooks.useTheme)

local function HyperCheckbox(props)
    local theme = useTheme(props.store)
    local state = props.Value or false
    
    -- Spring with appropriate config for checkboxes
    local checkScale = useSpring(state and 1 or 0, { stiffness = 300, damping = 30 })
    
    return React.createElement(BaseElement, {
        Disabled = props.Disabled,
        OnActivated = function()
            if props.Callback then props.Callback(not state) end
        end,
        LayoutOrder = props.LayoutOrder,
    }, {
        Container = React.createElement("Frame", {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
        }, {
            Padding = React.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, theme.Spacing[3]),
                PaddingRight = UDim.new(0, theme.Spacing[3]),
            }),
            Label = React.createElement("TextLabel", {
                Size = UDim2.new(1, -30, 1, 0),
                BackgroundTransparency = 1,
                Text = props.Text or "Checkbox",
                TextColor3 = theme.Color.Text,
                Font = theme.Font,
                TextSize = theme.FontSize.Medium,
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
            Box = React.createElement("Frame", {
                Size = UDim2.fromOffset(20, 20),
                Position = UDim2.new(1, -20, 0.5, -10),
                BackgroundColor3 = theme.Color.Surface,
                BorderSizePixel = 0,
            }, {
                UICorner = React.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 4)
                }),
                UIStroke = React.createElement("UIStroke", {
                    Color = state and theme.Color.Accent or theme.Color.Border,
                    Thickness = 1,
                }),
                CheckMark = React.createElement("Frame", {
                    Size = UDim2.fromScale(0.6, 0.6),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundColor3 = theme.Color.Accent,
                    BackgroundTransparency = checkScale:map(function(v) return 1 - v end),
                }, {
                    UICorner = React.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 2)
                    }),
                    UIScale = React.createElement("UIScale", {
                        Scale = checkScale
                    })
                })
            })
        })
    })
end

return HyperCheckbox
