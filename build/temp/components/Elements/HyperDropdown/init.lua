



local a = require(script.Parent.Parent.Parent.Parent.dependencies.React)
local b = require(script.DropdownTrigger)
local c = require(script.DropdownList)
local d = require(script.Parent.Parent.Parent.Parent.hooks.useTheme)

local function HyperDropdown(e)
    local f = d(e.store)
    local g, h = a.useState(false)
    
    return a.createElement("Frame", {
        Size = e.Size or UDim2.new(1, 0, 0, 40),
        BackgroundTransparency = 1,
        LayoutOrder = e.LayoutOrder,
        ZIndex = g and 1000 or 1, 
    }, {
        Trigger = a.createElement(b, {
            Text = e.Text,
            Value = e.Value,
            Open = g,
            OnToggle = function() h(not g) end,
            store = e.store, 
        }),
        List = g and a.createElement("Frame", {
            Size = UDim2.fromScale(1, 0),
            Position = UDim2.new(0, 0, 0, 44),
            BackgroundTransparency = 1,
            ZIndex = 1100,
        }, {
            Content = a.createElement(c, {
                Options = e.Options,
                Selected = e.Value,
                Multi = e.Multi,
                store = e.store,
                OnSelect = function(i)
                    if not e.Multi then h(false) end
                    if e.Callback then e.Callback(i) end
                end,
            })
        })
    })
end

return HyperDropdown
