



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.theme.tokens)

local function HyperAvatar(c)
    local d = c.UserId or 1
    local e = c.Size or 48
    
    return a.createElement("ImageLabel", {
        Size = UDim2.fromOffset(e, e),
        BackgroundColor3 = b.Color.Surface,
        BorderSizePixel = 0,
        Image = "rbxthumb://type=AvatarHeadShot&id=" .. d .. "&w=150&h=150",
        LayoutOrder = c.LayoutOrder,
    }, {
        UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
        UIStroke = a.createElement("UIStroke", { Color = b.Color.Border, Thickness = 2 })
    })
end

return HyperAvatar
