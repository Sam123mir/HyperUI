--[[
    HyperUI v2 - Dropdown Option
]]

local React = require(script.Parent.Parent.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.Parent.Parent.theme.tokens)
local BaseElement = require(script.Parent.Parent.BaseElement)

local function DropdownOption(props)
    return React.createElement(BaseElement, {
        BackgroundTransparency = 1,
        OnActivated = props.OnSelect,
    }, {
        Container = React.createElement("Frame", {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
        }, {
            Padding = React.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, Tokens.Spacing[3]),
            }),
            Label = React.createElement("TextLabel", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
                Text = props.Text,
                TextColor3 = props.Selected and Tokens.Color.Accent or Tokens.Color.Text,
                Font = props.Selected and Tokens.Font.Bold or Tokens.Font.Main,
                TextSize = Tokens.FontSize.Small,
                TextXAlignment = Enum.TextXAlignment.Left,
            })
        })
    })
end

return DropdownOption
