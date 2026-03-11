



local a = require(script.Parent.Parent.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.Parent.Parent.theme.tokens)

local function DropdownSearch(c)
    return a.createElement("TextBox", {
        Size = UDim2.new(1, 0, 0, 32),
        BackgroundColor3 = b.Color.Background,
        BackgroundTransparency = 0.5,
        BorderSizePixel = 0,
        PlaceholderText = "Search...",
        PlaceholderColor3 = b.Color.TextMuted,
        Text = "",
        TextColor3 = b.Color.Text,
        Font = b.Font.Main,
        TextSize = b.FontSize.Small,
        ClearTextOnFocus = false,
        [a.Change.Text] = function(d)
            c.OnChanged(d.Text)
        end,
    }, {
        UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, b.Radius.Small) }),
        Padding = a.createElement("UIPadding", { PaddingLeft = UDim.new(0, 8) }),
    })
end

return DropdownSearch
