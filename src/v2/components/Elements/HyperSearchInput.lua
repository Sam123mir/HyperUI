--[[
    HyperUI v2 - HyperSearchInput Element
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.theme.tokens)
local BaseElement = require(script.Parent.BaseElement)

local function HyperSearchInput(props)
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
            Icon = React.createElement("ImageLabel", {
                Size = UDim2.fromOffset(16, 16),
                Position = UDim2.new(0, 0, 0.5, -8),
                BackgroundTransparency = 1,
                Image = "rbxassetid://10723346959", -- Search icon placeholder
                ImageColor3 = Tokens.Color.TextMuted,
            }),
            Box = React.createElement("TextBox", {
                Size = UDim2.new(1, -24, 0, 24),
                Position = UDim2.new(0, 24, 0.5, -12),
                BackgroundTransparency = 1,
                Text = props.Value or "",
                PlaceholderText = props.Placeholder or "Search...",
                PlaceholderColor3 = Tokens.Color.TextMuted,
                TextColor3 = Tokens.Color.Text,
                Font = Tokens.Font.Main,
                TextSize = Tokens.FontSize.Small,
                TextXAlignment = Enum.TextXAlignment.Left,
                ClearTextOnFocus = false,
                [React.Change.Text] = function(rbx)
                    if props.Callback then props.Callback(rbx.Text) end
                end,
            })
        })
    })
end

return HyperSearchInput
