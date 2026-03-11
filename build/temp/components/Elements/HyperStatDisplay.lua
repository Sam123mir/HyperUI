



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.theme.tokens)
local c = require(script.Parent.BaseElement)

local function HyperStatDisplay(d)
    return a.createElement(c, {
        Size = UDim2.new(1, 0, 0, 60),
        Disabled = true, 
        LayoutOrder = d.LayoutOrder,
    }, {
        Container = a.createElement("Frame", {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
        }, {
            Padding = a.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, b.Spacing[3]),
                PaddingRight = UDim.new(0, b.Spacing[3]),
            }),
            Title = a.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 20),
                Position = UDim2.fromOffset(0, 8),
                BackgroundTransparency = 1,
                Text = d.Title or "Metric",
                TextColor3 = b.Color.TextMuted,
                Font = b.Font.Main,
                TextSize = b.FontSize.Small,
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
            Value = a.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 30),
                Position = UDim2.fromOffset(0, 24),
                BackgroundTransparency = 1,
                Text = d.Value or "0",
                TextColor3 = b.Color.Text,
                Font = b.Font.Bold,
                TextSize = b.FontSize.Title,
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
            SubValue = d.SubValue and a.createElement("TextLabel", {
                Size = UDim2.new(0, 100, 0, 20),
                Position = UDim2.new(1, -100, 1, -24),
                BackgroundTransparency = 1,
                Text = d.SubValue,
                TextColor3 = b.Color.Success,
                Font = b.Font.Main,
                TextSize = b.FontSize.Small,
                TextXAlignment = Enum.TextXAlignment.Right,
            })
        })
    })
end

return HyperStatDisplay
