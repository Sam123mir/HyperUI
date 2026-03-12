



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.BaseElement)
local c = require(script.Parent.Parent.Parent.hooks.useSpring)
local d = require(script.Parent.Parent.Parent.hooks.useTheme)

local function HyperCheckbox(e)
    local f = d(e.store)
    local g = e.Value or false
    
    
    local h = c(g and 1 or 0, { stiffness = 300, damping = 30 })
    
    return a.createElement(b, {
        Disabled = e.Disabled,
        OnActivated = function()
            if e.Callback then e.Callback(not g) end
        end,
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
                Size = UDim2.new(1, -30, 1, 0),
                BackgroundTransparency = 1,
                Text = e.Text or "Checkbox",
                TextColor3 = f.Color.Text,
                Font = f.Font,
                TextSize = f.FontSize.Medium,
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
            Box = a.createElement("Frame", {
                Size = UDim2.fromOffset(20, 20),
                Position = UDim2.new(1, -20, 0.5, -10),
                BackgroundColor3 = f.Color.Surface,
                BorderSizePixel = 0,
            }, {
                UICorner = a.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 4)
                }),
                UIStroke = a.createElement("UIStroke", {
                    Color = g and f.Color.Accent or f.Color.Border,
                    Thickness = 1,
                }),
                CheckMark = a.createElement("Frame", {
                    Size = UDim2.fromScale(0.6, 0.6),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundColor3 = f.Color.Accent,
                    BackgroundTransparency = h:map(function(i) return 1 - i end),
                }, {
                    UICorner = a.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 2)
                    }),
                    UIScale = a.createElement("UIScale", {
                        Scale = h
                    })
                })
            })
        })
    })
end

return HyperCheckbox
