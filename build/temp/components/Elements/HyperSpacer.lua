



local a = require(script.Parent.Parent.Parent.dependencies.React)

local function HyperSpacer(b)
    local c = b.Height or 10
    
    return a.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, c),
        BackgroundTransparency = 1,
        LayoutOrder = b.LayoutOrder,
    })
end

return HyperSpacer
