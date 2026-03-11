




local a = require(script.Parent.Parent.Parent.dependencies.React)

local function VirtualList(b)
    local c = b.Items or {}
    local d = b.ItemHeight or 32
    local e = b.Buffer or 5
    
    local f = a.useRef(nil)
    local g, h = a.useState(0)
    
    
    local i = math.ceil(400 / d) 
    local j = math.max(1, math.floor(g / d) - e)
    local k = math.min(#c, j + i + e * 2)
    
    local l = {}
    for m = j, k do
        local n = c[m]
        table.insert(l, a.createElement("Frame", {
            Key = m,
            Size = UDim2.new(1, 0, 0, d),
            Position = UDim2.fromOffset(0, (m - 1) * d),
            BackgroundTransparency = 1,
        }, {
            Content = b.RenderItem(n, m)
        }))
    end
    
    return a.createElement("ScrollingFrame", {
        Size = b.Size or UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        CanvasSize = UDim2.new(0, 0, 0, #c * d),
        ScrollBarThickness = 2,
        [a.Event.Scroll] = function(m)
            h(m.CanvasPosition.Y)
        end,
    }, l)
end

return VirtualList
