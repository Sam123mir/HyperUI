--[[
    HyperUI v2 - Sidebar Component
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.theme.tokens)

local function Sidebar(props)
    return React.createElement("Frame", {
        Size = UDim2.new(0, 200, 1, 0),
        BackgroundColor3 = Tokens.Color.Surface,
        BorderSizePixel = 0,
    }, {
        Layout = React.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 4),
        }),
        Padding = React.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 12),
            PaddingBottom = UDim.new(0, 12),
            PaddingLeft = UDim.new(0, 8),
            PaddingRight = UDim.new(0, 8),
        }),
        Items = React.createElement(React.Fragment, {}, props.children)
    })
end

return Sidebar
