




local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.theme.tokens)

local function ElementList(c)
    return a.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        LayoutOrder = c.LayoutOrder,
    }, {
        Layout = a.createElement("UIListLayout", {
            Padding = UDim.new(0, b.Spacing[2]),
            SortOrder = Enum.SortOrder.LayoutOrder,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
        }),
        Padding = a.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, b.Spacing[2]),
            PaddingRight = UDim.new(0, b.Spacing[2]),
        }),
        Elements = a.createElement(a.Fragment, {}, c.children)
    })
end

return ElementList
