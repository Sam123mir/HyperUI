



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.theme.tokens)
local c = require(script.Parent.Parent.Parent.hooks.useSpring)

local function HyperProgressBar(d)
    local e = math.clamp(d.Value or 0, 0, 100)
    local f = c(e / 100, { damping = 0.8, stiffness = 0.2 })
    
    return a.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 24),
        BackgroundTransparency = 1,
        LayoutOrder = d.LayoutOrder,
    }, {
        Layout = a.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4) }),
        Label = d.Text and a.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 14),
            BackgroundTransparency = 1,
            Text = d.Text,
            TextColor3 = b.Color.TextMuted,
            Font = b.Font.Main,
            TextSize = b.FontSize.Small,
            TextXAlignment = Enum.TextXAlignment.Left,
        }),
        Track = a.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 8),
            BackgroundColor3 = b.Color.Surface,
            BorderSizePixel = 0,
        }, {
            UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
            Fill = a.createElement("Frame", {
                Size = f:map(function(g) return UDim2.fromScale(g, 1) end),
                BackgroundColor3 = b.Color.Accent,
                BorderSizePixel = 0,
            }, {
                UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
            })
        })
    })
end

return HyperProgressBar
