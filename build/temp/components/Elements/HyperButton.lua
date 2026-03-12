



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.theme.tokens)
local c = require(script.Parent.BaseElement)

local function HyperButton(d)
    return a.createElement(c, {
        Disabled = d.Disabled,
        OnActivated = d.Callback,
        LayoutOrder = d.LayoutOrder,
        Size = d.Size,
        BackgroundColor3 = d.BackgroundColor3,
    }, {
        Label = a.createElement("TextLabel", {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
            Text = d.Text or "Button",
            TextColor3 = d.TextColor3 or b.Color.Text,
            Font = d.Font or b.Font.Main,
            TextSize = d.TextSize or b.FontSize.Medium,
            ZIndex = 5,
        })
    })
end

return HyperButton
