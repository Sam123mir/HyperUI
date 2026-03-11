--[[
    HyperUI v2 - ColorPicker Preview
]]

local React = require(script.Parent.Parent.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.Parent.Parent.theme.tokens)

local function ColorPreview(props)
    return React.createElement("Frame", {
        Size = UDim2.fromOffset(24, 24),
        Position = UDim2.new(1, -24, 0.5, -12),
        BackgroundColor3 = props.Color or Color3.new(1, 1, 1),
        BorderSizePixel = 0,
        ZIndex = 5,
    }, {
        UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
        UIStroke = React.createElement("UIStroke", { Color = Tokens.Color.Border, Thickness = 2 })
    })
end

return ColorPreview
