



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.theme.tokens)
local c = require(script.Parent.BaseElement)
local d = require(script.Parent.Parent.Parent.hooks.useSpring)

local function HyperToggle(e)
    local f = e.Value or false
    local g = d(f and 1 or 0, { damping = 0.8, stiffness = 0.2 })
    
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
                Size = UDim2.new(1, -50, 1, 0),
                BackgroundTransparency = 1,
                Text = e.Text or "Toggle",
                TextColor3 = b.Color.Text,
                Font = b.Font.Main,
                TextSize = b.FontSize.Medium,
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
            SwitchTrack = a.createElement("Frame", {
                Size = UDim2.fromOffset(40, 20),
                Position = UDim2.new(1, -40, 0.5, -10),
                BackgroundColor3 = g:map(function(h)
                    return b.Color.Surface:Lerp(b.Color.Accent, h)
                end),
                BorderSizePixel = 0,
            }, {
                UICorner = a.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                }),
                Handle = a.createElement("Frame", {
                    Size = UDim2.fromOffset(16, 16),
                    Position = g:map(function(h)
                        return UDim2.new(0, 2 + (20 * h), 0.5, -8)
                    end),
                    BackgroundColor3 = b.Color.Text,
                    BorderSizePixel = 0,
                }, {
                    UICorner = a.createElement("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    })
                })
            })
        })
    })
end

return HyperToggle
