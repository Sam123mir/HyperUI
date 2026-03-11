--[[
    HyperUI v2 - HyperComboBox Element
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local Dropdown = require(script.HyperDropdown)
local Input = require(script.HyperInput)

local function HyperComboBox(props)
    -- ComboBox is essentially an Input that triggers a Dropdown list
    -- For simplicity in this v2 phase, we compose them
    return React.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        LayoutOrder = props.LayoutOrder,
    }, {
        Layout = React.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
        Combo = React.createElement(Dropdown, {
            Text = props.Text,
            Value = props.Value,
            Options = props.Options,
            Callback = props.Callback,
        })
    })
end

return HyperComboBox
