



local a = require(script.Parent.Parent.Parent.dependencies.React)

local function Stack(b)
    return a.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        LayoutOrder = b.LayoutOrder,
    }, {
        Layout = a.createElement("UIListLayout", {
            FillDirection = b.FillDirection or Enum.FillDirection.Vertical,
            Padding = b.Padding or UDim.new(0, 8),
            HorizontalAlignment = b.HorizontalAlignment or Enum.HorizontalAlignment.Left,
            VerticalAlignment = b.VerticalAlignment or Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        Children = a.createElement(a.Fragment, {}, b.children)
    })
end

return Stack
