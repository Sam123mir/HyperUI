--[[
    HyperUI v2 - Grid Component
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)

local function Grid(props)
    return React.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        LayoutOrder = props.LayoutOrder,
    }, {
        Layout = React.createElement("UIGridLayout", {
            CellSize = props.CellSize or UDim2.fromOffset(100, 100),
            CellPadding = props.CellPadding or UDim2.fromOffset(8, 8),
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        Children = React.createElement(React.Fragment, {}, props.children)
    })
end

return Grid
