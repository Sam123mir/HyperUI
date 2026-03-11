



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.theme.tokens)

local function Sidebar(c)
    return a.createElement("Frame", {
        Size = UDim2.new(0, 200, 1, 0),
        BackgroundColor3 = b.Color.Surface,
        BorderSizePixel = 0,
    }, {
        Layout = a.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 4),
        }),
        Padding = a.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 12),
            PaddingBottom = UDim.new(0, 12),
            PaddingLeft = UDim.new(0, 8),
            PaddingRight = UDim.new(0, 8),
        }),
        Items = a.createElement(a.Fragment, {}, c.children)
    })
end

return Sidebar
