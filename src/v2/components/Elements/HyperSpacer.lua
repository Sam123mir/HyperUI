--[[
    HyperUI v2 - HyperSpacer Element
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)

local function HyperSpacer(props)
    local height = props.Height or 10
    
    return React.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, height),
        BackgroundTransparency = 1,
        LayoutOrder = props.LayoutOrder,
    })
end

return HyperSpacer
