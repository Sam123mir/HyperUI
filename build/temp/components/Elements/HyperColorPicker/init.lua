



local a = require(script.Parent.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.Parent.theme.tokens)
local c = require(script.Parent.BaseElement)

local d = require(script.HueSlider)
local e = require(script.SaturationSquare)
local f = require(script.ColorPreview)

local function HyperColorPicker(g)
    local h, i = a.useState(false)
    local j, k, l = Color3.toHSV(g.Value or Color3.new(1, 1, 1))
    
    local function updateColor(m, n, o)
        if g.Callback then
            g.Callback(Color3.fromHSV(m or j, n or k, o or l))
        end
    end
    
    return a.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        LayoutOrder = g.LayoutOrder,
        ZIndex = h and 100 or 1,
    }, {
        Layout = a.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4) }),
        Trigger = a.createElement(c, {
            OnActivated = function() i(not h) end,
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
                    Size = UDim2.new(1, -60, 1, 0),
                    BackgroundTransparency = 1,
                    Text = g.Text or "Color Picker",
                    TextColor3 = b.Color.Text,
                    Font = b.Font.Main,
                    TextSize = b.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                Preview = a.createElement(f, {
                    Color = g.Value or Color3.new(1, 1, 1)
                })
            })
        }),
        Dropdown = h and a.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 200),
            BackgroundColor3 = b.Color.Surface,
            BorderSizePixel = 0,
        }, {
            UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, b.Radius.Small) }),
            Padding = a.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 8),
                PaddingBottom = UDim.new(0, 8),
                PaddingLeft = UDim.new(0, 8),
                PaddingRight = UDim.new(0, 8),
            }),
            Layout = a.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 8) }),
            SatVal = a.createElement(e, {
                Hue = j,
                Sat = k,
                Val = l,
                OnChanged = function(m, n) updateColor(nil, m, n) end
            }),
            Hue = a.createElement(d, {
                Hue = j,
                OnChanged = function(m) updateColor(m, nil, nil) end
            })
        })
    })
end

return HyperColorPicker
