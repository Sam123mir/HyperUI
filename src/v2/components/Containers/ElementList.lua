--[[
    HyperUI v2 - ElementList Component
    Standardized layout container for component groups.
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.theme.tokens)

local function ElementList(props)
    return React.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        LayoutOrder = props.LayoutOrder,
    }, {
        Layout = React.createElement("UIListLayout", {
            Padding = UDim.new(0, Tokens.Spacing[2]),
            SortOrder = Enum.SortOrder.LayoutOrder,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
        }),
        Padding = React.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, Tokens.Spacing[2]),
            PaddingRight = UDim.new(0, Tokens.Spacing[2]),
        }),
        Elements = React.createElement(React.Fragment, {}, props.children)
    })
end

return ElementList
