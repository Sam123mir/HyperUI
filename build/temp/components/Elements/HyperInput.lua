



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.theme.tokens)
local c = require(script.Parent.BaseElement)

local function HyperInput(d)
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
            Label = a.createElement("TextLabel", {
                Size = UDim2.new(0.4, 0, 1, 0),
                BackgroundTransparency = 1,
                Text = d.Text or "Input",
                TextColor3 = b.Color.Text,
                Font = b.Font.Main,
                TextSize = b.FontSize.Medium,
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
            Box = a.createElement("TextBox", {
                Size = UDim2.new(0.6, -8, 0, 24),
                Position = UDim2.new(0.4, 8, 0.5, -12),
                BackgroundColor3 = b.Color.Background,
                BackgroundTransparency = 0.5,
                BorderSizePixel = 0,
                Text = d.Value or "",
                PlaceholderText = d.Placeholder or "Enter text...",
                PlaceholderColor3 = b.Color.TextMuted,
                TextColor3 = b.Color.Accent,
                Font = b.Font.Main,
                TextSize = b.FontSize.Small,
                ClearTextOnFocus = false,
                [a.Change.Text] = function(e)
                    if d.Callback then d.Callback(e.Text) end
                end,
            }, {
                UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
                UIStroke = a.createElement("UIStroke", { Color = b.Color.Border, Thickness = 1 }),
                Padding = a.createElement("UIPadding", { PaddingLeft = UDim.new(0, 8) }),
            })
        })
    })
end

return HyperInput
