--[[
    HyperUI v2 - Dropdown Search
]]

local React = require(script.Parent.Parent.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.Parent.Parent.theme.tokens)

local function DropdownSearch(props)
    return React.createElement("TextBox", {
        Size = UDim2.new(1, 0, 0, 32),
        BackgroundColor3 = Tokens.Color.Background,
        BackgroundTransparency = 0.5,
        BorderSizePixel = 0,
        PlaceholderText = "Search...",
        PlaceholderColor3 = Tokens.Color.TextMuted,
        Text = "",
        TextColor3 = Tokens.Color.Text,
        Font = Tokens.Font.Main,
        TextSize = Tokens.FontSize.Small,
        ClearTextOnFocus = false,
        [React.Change.Text] = function(rbx)
            props.OnChanged(rbx.Text)
        end,
    }, {
        UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(0, Tokens.Radius.Small) }),
        Padding = React.createElement("UIPadding", { PaddingLeft = UDim.new(0, 8) }),
    })
end

return DropdownSearch
