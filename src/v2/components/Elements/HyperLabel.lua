--[[
    HyperUI v2 - HyperLabel Element
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.theme.tokens)

local function HyperLabel(props)
    return React.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        LayoutOrder = props.LayoutOrder,
    }, {
        Layout = React.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 2),
        }),
        Padding = React.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, Tokens.Spacing[2]),
        }),
        Title = React.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            Text = props.Text or "Label",
            TextColor3 = Tokens.Color.Text,
            Font = Tokens.Font.Main,
            TextSize = Tokens.FontSize.Medium,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextWrapped = true,
        }),
        Description = props.Description and React.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            Text = props.Description,
            TextColor3 = Tokens.Color.TextMuted,
            Font = Tokens.Font.Main,
            TextSize = Tokens.FontSize.Small,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextWrapped = true,
        })
    })
end

return HyperLabel
