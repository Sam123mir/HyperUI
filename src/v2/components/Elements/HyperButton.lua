--[[
    HyperUI v2 - HyperButton Element
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.theme.tokens)
local BaseElement = require(script.Parent.BaseElement)

local function HyperButton(props)
    return React.createElement(BaseElement, {
        Disabled = props.Disabled,
        OnActivated = props.Callback,
        LayoutOrder = props.LayoutOrder,
    }, {
        Label = React.createElement("TextLabel", {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
            Text = props.Text or "Button",
            TextColor3 = Tokens.Color.Text,
            Font = Tokens.Font.Main,
            TextSize = Tokens.FontSize.Medium,
            ZIndex = 5,
        })
    })
end

return HyperButton
