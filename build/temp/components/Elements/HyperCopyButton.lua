



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.theme.tokens)
local c = require(script.Parent.BaseElement)

local function CopyButton(d)
    local e, f = a.useState(false)
    
    local function copy()
        if setclipboard then
            setclipboard(d.Value or "")
            f(true)
            task.delay(2, function() f(false) end)
        end
    end
    
    return a.createElement(c, {
        OnActivated = copy,
        LayoutOrder = d.LayoutOrder,
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
                Text = d.Text or "Copy Content",
                TextColor3 = b.Color.Text,
                Font = b.Font.Main,
                TextSize = b.FontSize.Medium,
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
            Status = a.createElement("TextLabel", {
                Size = UDim2.fromScale(0.4, 1),
                Position = UDim2.fromScale(0.6, 0),
                BackgroundTransparency = 1,
                Text = e and "COPIED" or "COPY",
                TextColor3 = e and b.Color.Success or b.Color.TextMuted,
                Font = b.Font.Bold,
                TextSize = 10,
                TextXAlignment = Enum.TextXAlignment.Right,
            })
        })
    })
end

return CopyButton
