




local a = require(script.Parent.Parent.Parent.dependencies.React)

local function VirtualList(b)
    local c = b.Items or {}
    local d = b.ItemHeight or 32
    local e = b.Buffer or 5
    
    local f = a.useRef(nil)
    local g, h = a.useState(Vector2.new(0, 400))
    local i, j = a.useState(0)
    
    
    local k = math.ceil(g.Y / d)
    local l = math.max(1, math.floor(i / d) - e)
    local m = math.min(#c, l + k + e * 2)
    
    local n = {}
    for o = l, m do
        local p = c[o]
        table.insert(n, a.createElement("Frame", {
            Key = o,
            Size = UDim2.new(1, 0, 0, d),
            Position = UDim2.fromOffset(0, (o - 1) * d),
            BackgroundTransparency = 1,
        }, {
            Content = b.RenderItem(p, o)
        }))
    end
    
    return a.createElement("ScrollingFrame", {
        Size = b.Size or UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        CanvasSize = UDim2.new(0, 0, 0, #c * d),
        ScrollBarThickness = 2,
        [a.Change.CanvasPosition] = function(o)
            j(o.CanvasPosition.Y)
        end,
        [a.Change.AbsoluteSize] = function(o)
            h(o.AbsoluteSize)
        end,
    }, n)
end

return VirtualList
