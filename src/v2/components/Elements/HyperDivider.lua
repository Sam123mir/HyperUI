--[[
    HyperUI v2 - HyperDivider Element
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.theme.tokens)

local function HyperDivider(props)
    return React.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 1),
        BackgroundColor3 = Tokens.Color.Border,
        BorderSizePixel = 0,
        BackgroundTransparency = 0.5,
        LayoutOrder = props.LayoutOrder,
    }, {
        Padding = React.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, Tokens.Spacing[2]),
            PaddingRight = UDim.new(0, Tokens.Spacing[2]),
        })
    })
end

return HyperDivider
