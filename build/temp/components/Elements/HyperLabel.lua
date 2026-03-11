



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.theme.tokens)

local function HyperLabel(c)
    return a.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        LayoutOrder = c.LayoutOrder,
    }, {
        Layout = a.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 2),
        }),
        Padding = a.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, b.Spacing[2]),
        }),
        Title = a.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            Text = c.Text or "Label",
            TextColor3 = b.Color.Text,
            Font = b.Font.Main,
            TextSize = b.FontSize.Medium,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextWrapped = true,
        }),
        Description = c.Description and a.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            Text = c.Description,
            TextColor3 = b.Color.TextMuted,
            Font = b.Font.Main,
            TextSize = b.FontSize.Small,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextWrapped = true,
        })
    })
end

return HyperLabel
