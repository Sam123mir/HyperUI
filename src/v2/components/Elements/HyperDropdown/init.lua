--[[
    HyperUI v2 - HyperDropdown Root
]]

local React = require(script.Parent.Parent.Parent.Parent.dependencies.React)
local DropdownTrigger = require(script.DropdownTrigger)
local DropdownList = require(script.DropdownList)
local useTheme = require(script.Parent.Parent.Parent.Parent.hooks.useTheme)

local function HyperDropdown(props)
    local theme = useTheme(props.store)
    local isOpen, setOpen = React.useState(false)
    
    return React.createElement("Frame", {
        Size = props.Size or UDim2.new(1, 0, 0, 40),
        BackgroundTransparency = 1,
        LayoutOrder = props.LayoutOrder,
        ZIndex = isOpen and 1000 or 1, -- High ZIndex for open state
    }, {
        Trigger = React.createElement(DropdownTrigger, {
            Text = props.Text,
            Value = props.Value,
            Open = isOpen,
            OnToggle = function() setOpen(not isOpen) end,
            store = props.store, -- Pass store for theme reactivity in triggers
        }),
        List = isOpen and React.createElement("Frame", {
            Size = UDim2.fromScale(1, 0),
            Position = UDim2.new(0, 0, 0, 44),
            BackgroundTransparency = 1,
            ZIndex = 1100,
        }, {
            Content = React.createElement(DropdownList, {
                Options = props.Options,
                Selected = props.Value,
                Multi = props.Multi,
                store = props.store,
                OnSelect = function(val)
                    if not props.Multi then setOpen(false) end
                    if props.Callback then props.Callback(val) end
                end,
            })
        })
    })
end

return HyperDropdown
