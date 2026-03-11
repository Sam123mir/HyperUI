



local a = require(script.Parent.Parent.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.Parent.Parent.theme.tokens)
local c = require(script.Parent.Parent.Parent.Containers.VirtualList)
local d = require(script.DropdownOption)
local e = require(script.DropdownSearch)

local function DropdownList(f)
    local g, h = a.useState("")
    
    local i = {}
    for j, k in ipairs(f.Options or {}) do
        if string.find(string.lower(tostring(k)), string.lower(g)) then
            table.insert(i, k)
        end
    end
    
    return a.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 200),
        BackgroundColor3 = b.Color.Surface,
        BorderSizePixel = 0,
    }, {
        UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, b.Radius.Small) }),
        Layout = a.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
        Search = a.createElement(e, {
            OnChanged = h
        }),
        List = a.createElement(c, {
            Size = UDim2.new(1, 0, 1, -32),
            Items = i,
            ItemHeight = 32,
            RenderItem = function(j)
                local k = false
                if type(f.Selected) == "table" then
                    k = table.find(f.Selected, j) ~= nil
                else
                    k = f.Selected == j
                end
                
                return a.createElement(d, {
                    Text = tostring(j),
                    Selected = k,
                    OnSelect = function() f.OnSelect(j) end
                })
            end
        })
    })
end

return DropdownList
