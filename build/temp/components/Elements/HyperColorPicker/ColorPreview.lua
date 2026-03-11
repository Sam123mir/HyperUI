



local a = require(script.Parent.Parent.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.Parent.Parent.theme.tokens)

local function ColorPreview(c)
    return a.createElement("Frame", {
        Size = UDim2.fromOffset(24, 24),
        Position = UDim2.new(1, -24, 0.5, -12),
        BackgroundColor3 = c.Color or Color3.new(1, 1, 1),
        BorderSizePixel = 0,
        ZIndex = 5,
    }, {
        UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
        UIStroke = a.createElement("UIStroke", { Color = b.Color.Border, Thickness = 2 })
    })
end

return ColorPreview
