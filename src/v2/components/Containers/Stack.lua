--[[
    HyperUI v2 - Stack Component
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)

local function Stack(props)
    return React.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        LayoutOrder = props.LayoutOrder,
    }, {
        Layout = React.createElement("UIListLayout", {
            FillDirection = props.FillDirection or Enum.FillDirection.Vertical,
            Padding = props.Padding or UDim.new(0, 8),
            HorizontalAlignment = props.HorizontalAlignment or Enum.HorizontalAlignment.Left,
            VerticalAlignment = props.VerticalAlignment or Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        Children = React.createElement(React.Fragment, {}, props.children)
    })
end

return Stack
