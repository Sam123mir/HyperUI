--[[
    HyperUI v2 - HyperToggle Element
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local BaseElement = require(script.Parent.BaseElement)
local useSpring = require(script.Parent.Parent.Parent.hooks.useSpring)
local useTheme = require(script.Parent.Parent.Parent.hooks.useTheme)

local function HyperToggle(props)
    local theme = useTheme(props.store)
    local state = props.Value or false
    
    -- Spring with appropriate config for toggles
    local switchPos = useSpring(state and 1 or 0, { stiffness = 300, damping = 30 })
    
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
                Size = UDim2.new(1, -50, 1, 0),
                BackgroundTransparency = 1,
                Text = props.Text or "Toggle",
                TextColor3 = theme.Color.Text,
                Font = theme.Font,
                TextSize = theme.FontSize.Medium,
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
            SwitchTrack = React.createElement("Frame", {
                Size = UDim2.fromOffset(40, 20),
                Position = UDim2.new(1, -40, 0.5, -10),
                BackgroundColor3 = switchPos:map(function(v)
                    return theme.Color.Surface:Lerp(theme.Color.Accent, v)
                end),
                BorderSizePixel = 0,
            }, {
                UICorner = React.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                }),
                Handle = React.createElement("Frame", {
                    Size = UDim2.fromOffset(16, 16),
                    Position = switchPos:map(function(v)
                        return UDim2.new(0, 2 + (20 * v), 0.5, -8)
                    end),
                    BackgroundColor3 = theme.Color.Text,
                    BorderSizePixel = 0,
                }, {
                    UICorner = React.createElement("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    })
                })
            })
        })
    })
end

return HyperToggle
