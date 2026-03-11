



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.theme.tokens)
local c = require(script.Parent.BaseElement)
local d = game:GetService("UserInputService")

local function HyperKeybind(e)
    local f, g = a.useState(false)
    local h = e.Value or Enum.KeyCode.Unknown
    
    a.useEffect(function()
        if not f then return end
        
        local i = d.InputBegan:Connect(function(i)
            if i.UserInputType == Enum.UserInputType.Keyboard then
                g(false)
                if e.Callback then e.Callback(i.KeyCode) end
            end
        end)
        
        return function() i:Disconnect() end
    end, {f})
    
    return a.createElement(c, {
        OnActivated = function() g(true) end,
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
                Size = UDim2.new(1, -100, 1, 0),
                BackgroundTransparency = 1,
                Text = e.Text or "Keybind",
                TextColor3 = b.Color.Text,
                Font = b.Font.Main,
                TextSize = b.FontSize.Medium,
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
            BindDisplay = a.createElement("Frame", {
                Size = UDim2.fromOffset(80, 24),
                Position = UDim2.new(1, -80, 0.5, -12),
                BackgroundColor3 = f and b.Color.Accent or b.Color.Surface,
                BackgroundTransparency = 0.5,
                BorderSizePixel = 0,
            }, {
                UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
                Text = a.createElement("TextLabel", {
                    Size = UDim2.fromScale(1, 1),
                    BackgroundTransparency = 1,
                    Text = f and "..." or h.Name,
                    TextColor3 = b.Color.Text,
                    Font = b.Font.Bold,
                    TextSize = b.FontSize.Small,
                })
            })
        })
    })
end

return HyperKeybind
