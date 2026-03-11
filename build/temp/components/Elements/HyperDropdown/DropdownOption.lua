



local a = require(script.Parent.Parent.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.Parent.Parent.theme.tokens)
local c = require(script.Parent.Parent.BaseElement)

local function DropdownOption(d)
    return a.createElement(c, {
        BackgroundTransparency = 1,
        OnActivated = d.OnSelect,
    }, {
        Container = a.createElement("Frame", {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
        }, {
            Padding = a.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, b.Spacing[3]),
            }),
            Label = a.createElement("TextLabel", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
                Text = d.Text,
                TextColor3 = d.Selected and b.Color.Accent or b.Color.Text,
                Font = d.Selected and b.Font.Bold or b.Font.Main,
                TextSize = b.FontSize.Small,
                TextXAlignment = Enum.TextXAlignment.Left,
            })
        })
    })
end

return DropdownOption
