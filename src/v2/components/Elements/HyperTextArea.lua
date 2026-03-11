--[[
    HyperUI v2 - HyperTextArea Element
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.theme.tokens)
local BaseElement = require(script.Parent.BaseElement)

local function HyperTextArea(props)
    return React.createElement(BaseElement, {
        Size = UDim2.new(1, 0, 0, 100), -- Taller size for text area
        Disabled = props.Disabled,
        LayoutOrder = props.LayoutOrder,
    }, {
        Container = React.createElement("Frame", {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
        }, {
            Padding = React.createElement("UIPadding", {
                PaddingTop = UDim.new(0, Tokens.Spacing[2]),
                PaddingBottom = UDim.new(0, Tokens.Spacing[2]),
                PaddingLeft = UDim.new(0, Tokens.Spacing[3]),
                PaddingRight = UDim.new(0, Tokens.Spacing[3]),
            }),
            Box = React.createElement("TextBox", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
                Text = props.Value or "",
                PlaceholderText = props.Placeholder or "Enter long text...",
                PlaceholderColor3 = Tokens.Color.TextMuted,
                TextColor3 = Tokens.Color.Text,
                Font = Tokens.Font.Main,
                TextSize = Tokens.FontSize.Small,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top,
                TextWrapped = true,
                MultiLine = true,
                ClearTextOnFocus = false,
                [React.Change.Text] = function(rbx)
                    if props.Callback then props.Callback(rbx.Text) end
                end,
            })
        })
    })
end

return HyperTextArea
