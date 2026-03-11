



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.theme.tokens)
local c = require(script.Parent.BaseElement)
local d = require(script.Parent.Parent.Parent.hooks.useSpring)

local function HyperSlider(e)
    local f = e.Min or 0
    local g = e.Max or 100
    local h = e.Value or f
    
    local i = (h - f) / (g - f)
    local j = d(i, { damping = 0.9, stiffness = 0.1 })
    
    return a.createElement(c, {
        Disabled = e.Disabled,
        LayoutOrder = e.LayoutOrder,
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
                Size = UDim2.new(1, -120, 0.5, 0),
                BackgroundTransparency = 1,
                Text = e.Text or "Slider",
                TextColor3 = b.Color.Text,
                Font = b.Font.Main,
                TextSize = b.FontSize.Medium,
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
            ValueLabel = a.createElement("TextLabel", {
                Size = UDim2.new(0, 50, 0.5, 0),
                Position = UDim2.new(1, -50, 0, 0),
                BackgroundTransparency = 1,
                Text = tostring(math.floor(h)),
                TextColor3 = b.Color.Accent,
                Font = b.Font.Bold,
                TextSize = b.FontSize.Medium,
                TextXAlignment = Enum.TextXAlignment.Right,
            }),
            Track = a.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 4),
                Position = UDim2.new(0, 0, 0.8, -2),
                BackgroundColor3 = b.Color.Surface,
                BorderSizePixel = 0,
            }, {
                UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
                Fill = a.createElement("Frame", {
                    Size = j:map(function(k) return UDim2.fromScale(k, 1) end),
                    BackgroundColor3 = b.Color.Accent,
                    BorderSizePixel = 0,
                }, {
                    UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
                })
            })
        })
    })
end

return HyperSlider
