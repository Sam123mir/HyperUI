--[[
    HyperUI v2 - HyperAvatar Element
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.theme.tokens)

local function HyperAvatar(props)
    local userId = props.UserId or 1
    local size = props.Size or 48
    
    return React.createElement("ImageLabel", {
        Size = UDim2.fromOffset(size, size),
        BackgroundColor3 = Tokens.Color.Surface,
        BorderSizePixel = 0,
        Image = "rbxthumb://type=AvatarHeadShot&id=" .. userId .. "&w=150&h=150",
        LayoutOrder = props.LayoutOrder,
    }, {
        UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
        UIStroke = React.createElement("UIStroke", { Color = Tokens.Color.Border, Thickness = 2 })
    })
end

return HyperAvatar
