



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.theme.tokens)
local c = require(script.Parent.BaseElement)

local function HyperTextArea(d)
    return a.createElement(c, {
        Size = UDim2.new(1, 0, 0, 100), 
        Disabled = d.Disabled,
        LayoutOrder = d.LayoutOrder,
    }, {
        Container = a.createElement("Frame", {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
        }, {
            Padding = a.createElement("UIPadding", {
                PaddingTop = UDim.new(0, b.Spacing[2]),
                PaddingBottom = UDim.new(0, b.Spacing[2]),
                PaddingLeft = UDim.new(0, b.Spacing[3]),
                PaddingRight = UDim.new(0, b.Spacing[3]),
            }),
            Box = a.createElement("TextBox", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
                Text = d.Value or "",
                PlaceholderText = d.Placeholder or "Enter long text...",
                PlaceholderColor3 = b.Color.TextMuted,
                TextColor3 = b.Color.Text,
                Font = b.Font.Main,
                TextSize = b.FontSize.Small,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top,
                TextWrapped = true,
                MultiLine = true,
                ClearTextOnFocus = false,
                [a.Change.Text] = function(e)
                    if d.Callback then d.Callback(e.Text) end
                end,
            })
        })
    })
end

return HyperTextArea
