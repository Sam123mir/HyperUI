



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.theme.tokens)
local c = require(script.Parent.BaseElement)

local function HyperNumberInput(d)
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
                Text = d.Text or "Number",
                TextColor3 = b.Color.Text,
                Font = b.Font.Main,
                TextSize = b.FontSize.Medium,
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
            Box = a.createElement("TextBox", {
                Size = UDim2.new(0, 100, 0, 24),
                Position = UDim2.new(1, -100, 0.5, -12),
                BackgroundColor3 = b.Color.Background,
                BackgroundTransparency = 0.5,
                BorderSizePixel = 0,
                Text = tostring(d.Value or d.Min or 0),
                PlaceholderText = "0",
                PlaceholderColor3 = b.Color.TextMuted,
                TextColor3 = b.Color.Accent,
                Font = b.Font.Bold,
                TextSize = b.FontSize.Small,
                [a.Change.Text] = function(e)
                    local f = string.gsub(e.Text, "[^%d.-]", "")
                    local g = tonumber(f)
                    if g then
                        if d.Min then g = math.max(d.Min, g) end
                        if d.Max then g = math.min(d.Max, g) end
                        if d.Callback then d.Callback(g) end
                    end
                end,
            }, {
                UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
                UIStroke = a.createElement("UIStroke", { Color = b.Color.Border, Thickness = 1 }),
            })
        })
    })
end

return HyperNumberInput
