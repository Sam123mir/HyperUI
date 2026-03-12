



local a = require(script.Parent.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.BaseElement)
local c = require(script.HueSlider)
local d = require(script.SaturationSquare)
local e = require(script.ColorPreview)
local f = require(script.Parent.Parent.Parent.Parent.hooks.useTheme)

local function HyperColorPicker(g)
    local h = f(g.store)
    local i, j = a.useState(false)
    
    
    local k, l, m = Color3.toHSV(g.Value or Color3.new(1, 1, 1))
    local n, o = a.useState(k)
    local p, q = a.useState(l)
    local r, s = a.useState(m)
    
    
    a.useEffect(function()
        local t, u, v = Color3.toHSV(g.Value or Color3.new(1, 1, 1))
        o(t)
        q(u)
        s(v)
    end, {g.Value})

    local function updateColor(t, u, v)
        local w = t or n
        local x = u or p
        local y = v or r
        
        o(w)
        q(x)
        s(y)
        
        if g.Callback then
            g.Callback(Color3.fromHSV(w, x, y))
        end
    end
    
    return a.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        LayoutOrder = g.LayoutOrder,
        ZIndex = i and 100 or 1,
    }, {
        Layout = a.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4) }),
        Trigger = a.createElement(b, {
            OnActivated = function() j(not i) end,
        }, {
            Container = a.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = a.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, h.Spacing[3]),
                    PaddingRight = UDim.new(0, h.Spacing[3]),
                }),
                Label = a.createElement("TextLabel", {
                    Size = UDim2.new(1, -60, 1, 0),
                    BackgroundTransparency = 1,
                    Text = g.Text or "Color Picker",
                    TextColor3 = h.Color.Text,
                    Font = h.Font,
                    TextSize = h.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                Preview = a.createElement(e, {
                    Color = g.Value or Color3.new(1, 1, 1)
                })
            })
        }),
        Dropdown = i and a.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 200),
            BackgroundColor3 = h.Color.Surface,
            BorderSizePixel = 0,
        }, {
            UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, h.Radius.Small) }),
            Padding = a.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 8),
                PaddingBottom = UDim.new(0, 8),
                PaddingLeft = UDim.new(0, 8),
                PaddingRight = UDim.new(0, 8),
            }),
            Layout = a.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 8) }),
            SatVal = a.createElement(d, {
                Hue = n,
                Sat = p,
                Val = r,
                OnChanged = function(t, u) updateColor(nil, t, u) end
            }),
            Hue = a.createElement(c, {
                Hue = n,
                OnChanged = function(t) updateColor(t, nil, nil) end
            })
        })
    })
end

return HyperColorPicker
