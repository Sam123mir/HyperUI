



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.theme.tokens)
local c = require(script.Parent.BaseElement)

local function HyperSearchInput(d)
    return a.createElement(c, {
        Disabled = d.Disabled,
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
            Icon = a.createElement("ImageLabel", {
                Size = UDim2.fromOffset(16, 16),
                Position = UDim2.new(0, 0, 0.5, -8),
                BackgroundTransparency = 1,
                Image = "rbxassetid://10723346959", 
                ImageColor3 = b.Color.TextMuted,
            }),
            Box = a.createElement("TextBox", {
                Size = UDim2.new(1, -24, 0, 24),
                Position = UDim2.new(0, 24, 0.5, -12),
                BackgroundTransparency = 1,
                Text = d.Value or "",
                PlaceholderText = d.Placeholder or "Search...",
                PlaceholderColor3 = b.Color.TextMuted,
                TextColor3 = b.Color.Text,
                Font = b.Font.Main,
                TextSize = b.FontSize.Small,
                TextXAlignment = Enum.TextXAlignment.Left,
                ClearTextOnFocus = false,
                [a.Change.Text] = function(e)
                    if d.Callback then d.Callback(e.Text) end
                end,
            })
        })
    })
end

return HyperSearchInput
