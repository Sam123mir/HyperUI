--[[
    HyperUI v2 - Dropdown Trigger
]]

local React = require(script.Parent.Parent.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.Parent.Parent.theme.tokens)
local BaseElement = require(script.Parent.Parent.BaseElement)
local useSpring = require(script.Parent.Parent.Parent.Parent.Parent.hooks.useSpring)

local function DropdownTrigger(props)
    local arrowRotation = useSpring(props.Open and 180 or 0, { damping = 0.8, stiffness = 0.2 })
    
    local valueText = "Select Option..."
    if props.Value then
        if type(props.Value) == "table" then
            valueText = #props.Value .. " selected"
        else
            valueText = tostring(props.Value)
        end
    end
    
    return React.createElement(BaseElement, {
        OnActivated = props.OnToggle,
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
                Size = UDim2.new(1, -60, 1, 0),
                BackgroundTransparency = 1,
                Text = props.Text or "Dropdown",
                TextColor3 = Tokens.Color.Text,
                Font = Tokens.Font.Main,
                TextSize = Tokens.FontSize.Medium,
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
            Value = React.createElement("TextLabel", {
                Size = UDim2.new(1, -60, 1, 0),
                BackgroundTransparency = 1,
                Text = valueText,
                TextColor3 = Tokens.Color.TextMuted,
                Font = Tokens.Font.Main,
                TextSize = Tokens.FontSize.Small,
                TextXAlignment = Enum.TextXAlignment.Right,
                ZIndex = 4,
            }),
            Arrow = React.createElement("ImageLabel", {
                Size = UDim2.fromOffset(16, 16),
                Position = UDim2.new(1, -16, 0.5, -8),
                BackgroundTransparency = 1,
                Image = "rbxassetid://10723346959", -- Arrow icon
                ImageColor3 = Tokens.Color.TextMuted,
                Rotation = arrowRotation,
            })
        })
    })
end

return DropdownTrigger
