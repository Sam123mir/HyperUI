



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.HyperDropdown)
local c = require(script.HyperInput)

local function HyperComboBox(d)
    
    
    return a.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        LayoutOrder = d.LayoutOrder,
    }, {
        Layout = a.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
        Combo = a.createElement(b, {
            Text = d.Text,
            Value = d.Value,
            Options = d.Options,
            Callback = d.Callback,
        })
    })
end

return HyperComboBox
