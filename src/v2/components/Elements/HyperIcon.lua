--[[
    HyperUI v2 - HyperIcon Element
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.theme.tokens)

local function HyperIcon(props)
    local size = props.Size or 16
    
    return React.createElement("ImageLabel", {
        Size = UDim2.fromOffset(size, size),
        BackgroundTransparency = 1,
        Image = props.Icon or "",
        ImageColor3 = props.Color or Tokens.Color.Text,
        LayoutOrder = props.LayoutOrder,
    })
end

return HyperIcon
