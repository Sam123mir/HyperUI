



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.theme.tokens)
local c = require(script.Parent.BaseElement)
local d = require(script.Parent.Parent.Parent.hooks.useSpring)

local function HyperCheckbox(e)
    local f = e.Value or false
    local g = d(f and 1 or 0, { damping = 0.5, stiffness = 0.3 })
    
    return a.createElement(c, {
        Disabled = e.Disabled,
        OnActivated = function()
            if e.Callback then e.Callback(not f) end
        end,
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
                Size = UDim2.new(1, -30, 1, 0),
                BackgroundTransparency = 1,
                Text = e.Text or "Checkbox",
                TextColor3 = b.Color.Text,
                Font = b.Font.Main,
                TextSize = b.FontSize.Medium,
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
            Box = a.createElement("Frame", {
                Size = UDim2.fromOffset(20, 20),
                Position = UDim2.new(1, -20, 0.5, -10),
                BackgroundColor3 = b.Color.Surface,
                BorderSizePixel = 0,
            }, {
                UICorner = a.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 4)
                }),
                UIStroke = a.createElement("UIStroke", {
                    Color = f and b.Color.Accent or b.Color.Border,
                    Thickness = 1,
                }),
                CheckMark = a.createElement("Frame", {
                    Size = UDim2.fromScale(0.6, 0.6),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundColor3 = b.Color.Accent,
                    BackgroundTransparency = g:map(function(h) return 1 - h end),
                }, {
                    UICorner = a.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 2)
                    }),
                    UIScale = a.createElement("UIScale", {
                        Scale = g
                    })
                })
            })
        })
    })
end

return HyperCheckbox
