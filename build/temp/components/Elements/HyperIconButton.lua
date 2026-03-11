



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.theme.tokens)
local c = require(script.Parent.BaseElement)

local function HyperIconButton(d)
    return a.createElement(c, {
        Size = d.Size or UDim2.fromOffset(32, 32),
        Disabled = d.Disabled,
        OnActivated = d.Callback,
        LayoutOrder = d.LayoutOrder,
    }, {
        Icon = a.createElement("ImageLabel", {
            Size = UDim2.fromOffset(20, 20),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundTransparency = 1,
            Image = d.Icon or "",
            ImageColor3 = b.Color.Text,
        })
    })
end

return HyperIconButton
