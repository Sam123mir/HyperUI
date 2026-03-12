



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.BaseElement)
local c = require(script.Parent.Parent.Parent.hooks.useSpring)
local d = require(script.Parent.Parent.Parent.hooks.useTheme)

local function HyperToggle(e)
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
                Size = UDim2.new(1, -50, 1, 0),
                BackgroundTransparency = 1,
                Text = e.Text or "Toggle",
                TextColor3 = f.Color.Text,
                Font = f.Font,
                TextSize = f.FontSize.Medium,
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
            SwitchTrack = a.createElement("Frame", {
                Size = UDim2.fromOffset(40, 20),
                Position = UDim2.new(1, -40, 0.5, -10),
                BackgroundColor3 = h:map(function(i)
                    return f.Color.Surface:Lerp(f.Color.Accent, i)
                end),
                BorderSizePixel = 0,
            }, {
                UICorner = a.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                }),
                Handle = a.createElement("Frame", {
                    Size = UDim2.fromOffset(16, 16),
                    Position = h:map(function(i)
                        return UDim2.new(0, 2 + (20 * i), 0.5, -8)
                    end),
                    BackgroundColor3 = f.Color.Text,
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
