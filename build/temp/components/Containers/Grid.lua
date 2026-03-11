



local a = require(script.Parent.Parent.Parent.dependencies.React)

local function Grid(b)
    return a.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        LayoutOrder = b.LayoutOrder,
    }, {
        Layout = a.createElement("UIGridLayout", {
            CellSize = b.CellSize or UDim2.fromOffset(100, 100),
            CellPadding = b.CellPadding or UDim2.fromOffset(8, 8),
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        Children = a.createElement(a.Fragment, {}, b.children)
    })
end

return Grid
