



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.theme.tokens)
local c = require(script.Parent.BaseElement)

local function HyperButton(d)
    return a.createElement(c, {
        Disabled = d.Disabled,
        OnActivated = d.Callback,
        LayoutOrder = d.LayoutOrder,
    }, {
        Label = a.createElement("TextLabel", {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
            Text = d.Text or "Button",
            TextColor3 = b.Color.Text,
            Font = b.Font.Main,
            TextSize = b.FontSize.Medium,
            ZIndex = 5,
        })
    })
end

return HyperButton
