



local a = require(script.Parent.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.Parent.theme.tokens)

local c = require(script.DropdownTrigger)
local d = require(script.DropdownList)

local function HyperDropdown(e)
    local f, g = a.useState(false)
    
    return a.createElement("Frame", {
        Size = e.Size or UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        LayoutOrder = e.LayoutOrder,
        ZIndex = f and 100 or 1,
    }, {
        Layout = a.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 4),
        }),
        Trigger = a.createElement(c, {
            Text = e.Text,
            Value = e.Value,
            Open = f,
            OnToggle = function() g(not f) end,
        }),
        List = f and a.createElement(d, {
            Options = e.Options,
            Selected = e.Value,
            Multi = e.Multi,
            OnSelect = function(h)
                if not e.Multi then g(false) end
                if e.Callback then e.Callback(h) end
            end,
        })
    })
end

return HyperDropdown
