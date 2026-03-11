--[[
    HyperUI v2 - HyperStatusIndicator Element
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.theme.tokens)

local function HyperStatusIndicator(props)
    local statusColors = {
        Online = Tokens.Color.Success,
        Warning = Tokens.Color.Warning,
        Offline = Tokens.Color.Error,
        Busy = Color3.fromRGB(255, 85, 255),
    }
    
    local color = statusColors[props.Status] or Tokens.Color.TextMuted
    
    return React.createElement("Frame", {
        Size = UDim2.fromOffset(10, 10),
        BackgroundColor3 = color,
        BorderSizePixel = 0,
        LayoutOrder = props.LayoutOrder,
    }, {
        UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
        Glow = React.createElement("ImageLabel", {
            Size = UDim2.fromScale(3, 3),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundTransparency = 1,
            Image = "rbxassetid://1316045217", -- Glow texture
            ImageColor3 = color,
            ImageTransparency = 0.5,
        })
    })
end

return HyperStatusIndicator
