--[[
    HyperUI v2 - HyperIconButton Element
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.theme.tokens)
local BaseElement = require(script.Parent.BaseElement)

local function HyperIconButton(props)
    return React.createElement(BaseElement, {
        Size = props.Size or UDim2.fromOffset(32, 32),
        Disabled = props.Disabled,
        OnActivated = props.Callback,
        LayoutOrder = props.LayoutOrder,
    }, {
        Icon = React.createElement("ImageLabel", {
            Size = UDim2.fromOffset(20, 20),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundTransparency = 1,
            Image = props.Icon or "",
            ImageColor3 = Tokens.Color.Text,
        })
    })
end

return HyperIconButton
