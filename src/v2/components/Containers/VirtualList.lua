--[[
    HyperUI v2 - VirtualList Component
    Optimized rendering for large datasets.
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)

local function VirtualList(props)
    local items = props.Items or {}
    local itemHeight = props.ItemHeight or 32
    local buffer = props.Buffer or 5
    
    local containerRef = React.useRef(nil)
    local scrollTop, setScrollTop = React.useState(0)
    
    -- Calculate visible range
    local visibleCount = math.ceil(400 / itemHeight) -- Assuming 400px height for now
    local startIndex = math.max(1, math.floor(scrollTop / itemHeight) - buffer)
    local endIndex = math.min(#items, startIndex + visibleCount + buffer * 2)
    
    local visibleItems = {}
    for i = startIndex, endIndex do
        local item = items[i]
        table.insert(visibleItems, React.createElement("Frame", {
            Key = i,
            Size = UDim2.new(1, 0, 0, itemHeight),
            Position = UDim2.fromOffset(0, (i - 1) * itemHeight),
            BackgroundTransparency = 1,
        }, {
            Content = props.RenderItem(item, i)
        }))
    end
    
    return React.createElement("ScrollingFrame", {
        Size = props.Size or UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        CanvasSize = UDim2.new(0, 0, 0, #items * itemHeight),
        ScrollBarThickness = 2,
        [React.Event.Scroll] = function(rbx)
            setScrollTop(rbx.CanvasPosition.Y)
        end,
    }, visibleItems)
end

return VirtualList
