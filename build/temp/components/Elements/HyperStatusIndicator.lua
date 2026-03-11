



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.theme.tokens)

local function HyperStatusIndicator(c)
    local d = {
        Online = b.Color.Success,
        Warning = b.Color.Warning,
        Offline = b.Color.Error,
        Busy = Color3.fromRGB(255, 85, 255),
    }
    
    local e = d[c.Status] or b.Color.TextMuted
    
    return a.createElement("Frame", {
        Size = UDim2.fromOffset(10, 10),
        BackgroundColor3 = e,
        BorderSizePixel = 0,
        LayoutOrder = c.LayoutOrder,
    }, {
        UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
        Glow = a.createElement("ImageLabel", {
            Size = UDim2.fromScale(3, 3),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundTransparency = 1,
            Image = "rbxassetid://1316045217", 
            ImageColor3 = e,
            ImageTransparency = 0.5,
        })
    })
end

return HyperStatusIndicator
