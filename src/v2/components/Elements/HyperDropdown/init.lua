--[[
    HyperUI v2 - HyperDropdown Root
]]

local React = require(script.Parent.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.Parent.theme.tokens)

local DropdownTrigger = require(script.DropdownTrigger)
local DropdownList = require(script.DropdownList)

local function HyperDropdown(props)
    local isOpen, setOpen = React.useState(false)
    
    return React.createElement("Frame", {
        Size = props.Size or UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        LayoutOrder = props.LayoutOrder,
        ZIndex = isOpen and 100 or 1,
    }, {
        Layout = React.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 4),
        }),
        Trigger = React.createElement(DropdownTrigger, {
            Text = props.Text,
            Value = props.Value,
            Open = isOpen,
            OnToggle = function() setOpen(not isOpen) end,
        }),
        List = isOpen and React.createElement(DropdownList, {
            Options = props.Options,
            Selected = props.Value,
            Multi = props.Multi,
            OnSelect = function(val)
                if not props.Multi then setOpen(false) end
                if props.Callback then props.Callback(val) end
            end,
        })
    })
end

return HyperDropdown
