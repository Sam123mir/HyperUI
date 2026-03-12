



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.BaseElement)
local c = require(script.Parent.Parent.Parent.hooks.useSpring)
local d = require(script.Parent.Parent.Parent.hooks.useTheme)

local function HyperSlider(e)
    local f = d(e.store)
    local g = e.Min or 0
    local h = e.Max or 100
    
    local i, j = a.useState(e.Value or g)
    local k = a.useRef(false)
    
    local l = (i - g) / (h - g)
    local m = c(l, { stiffness = 300, damping = 30 })
    
    local function updateValue(n, o, p)
        local q = math.clamp((n - o) / p, 0, 1)
        local r = g + (q * (h - g))
        
        j(r) 
        if e.Callback then
            e.Callback(r)
        end
    end
    
    
    a.useEffect(function()
        if e.Value ~= nil and math.abs(e.Value - i) > 0.001 then
            j(e.Value)
        end
    end, {e.Value})

    return a.createElement(b, {
        Disabled = e.Disabled,
        LayoutOrder = e.LayoutOrder,
    }, {
        Container = a.createElement("Frame", {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
        }, {
            Padding = a.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, f.Spacing[3]),
                PaddingRight = UDim.new(0, f.Spacing[3]),
            }),
            Label = a.createElement("TextLabel", {
                Size = UDim2.new(1, -120, 0.5, 0),
                BackgroundTransparency = 1,
                Text = e.Text or "Slider",
                TextColor3 = f.Color.Text,
                Font = f.Font,
                TextSize = f.FontSize.Medium,
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
            ValueLabel = a.createElement("TextLabel", {
                Size = UDim2.new(0, 50, 0.5, 0),
                Position = UDim2.new(1, -50, 0, 0),
                BackgroundTransparency = 1,
                Text = tostring(math.floor(i)),
                TextColor3 = f.Color.Accent,
                Font = f.Font,
                TextSize = f.FontSize.Medium,
                TextXAlignment = Enum.TextXAlignment.Right,
            }),
            Track = a.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 4),
                Position = UDim2.new(0, 0, 0.8, -2),
                BackgroundColor3 = f.Color.Surface,
                BorderSizePixel = 0,
            }, {
                UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
                Fill = a.createElement("Frame", {
                    Size = m:map(function(n) return UDim2.fromScale(n, 1) end),
                    BackgroundColor3 = f.Color.Accent,
                    BorderSizePixel = 0,
                }, {
                    UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
                }),
                
                Trigger = a.createElement("TextButton", {
                    Size = UDim2.new(1, 0, 0, 20),
                    Position = UDim2.fromScale(0, 0.5),
                    AnchorPoint = Vector2.new(0, 0.5),
                    BackgroundTransparency = 1,
                    Text = "",
                    [a.Event.InputBegan] = function(n, o)
                        if o.UserInputType == Enum.UserInputType.MouseButton1 then
                            k.current = true
                            updateValue(o.Position.X, n.AbsolutePosition.X, n.AbsoluteSize.X)
                        end
                    end,
                    [a.Event.InputEnded] = function(n, o)
                        if o.UserInputType == Enum.UserInputType.MouseButton1 then
                            k.current = false
                        end
                    end,
                    [a.Event.InputChanged] = function(n, o)
                        if k.current and (o.UserInputType == Enum.UserInputType.MouseMovement or o.UserInputType == Enum.UserInputType.Touch) then
                            updateValue(o.Position.X, n.AbsolutePosition.X, n.AbsoluteSize.X)
                        end
                    end,
                })
            })
        })
    })
end

return HyperSlider
