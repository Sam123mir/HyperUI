



local a = require(script.Parent.Parent.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.Parent.Parent.theme.tokens)

local function SaturationSquare(c)
    return a.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, -20),
        BackgroundColor3 = Color3.fromHSV(c.Hue, 1, 1),
        BorderSizePixel = 0,
        LayoutOrder = 1,
    }, {
        UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, b.Radius.Small) }),
        SatGradient = a.createElement("Frame", {
            Size = UDim2.fromScale(1, 1),
            BorderSizePixel = 0,
            BackgroundTransparency = 0,
        }, {
            Gradient = a.createElement("UIGradient", {
                Transparency = NumberSequence.new(0, 1),
                Color = ColorSequence.new(Color3.new(1, 1, 1)),
                Rotation = 0,
            })
        }),
        ValGradient = a.createElement("Frame", {
            Size = UDim2.fromScale(1, 1),
            BorderSizePixel = 0,
            BackgroundTransparency = 0,
        }, {
            Gradient = a.createElement("UIGradient", {
                Transparency = NumberSequence.new(0, 1),
                Color = ColorSequence.new(Color3.new(0, 0, 0)),
                Rotation = 90,
            })
        }),
        Handle = a.createElement("Frame", {
            Size = UDim2.fromOffset(12, 12),
            Position = UDim2.fromScale(c.Sat, 1 - c.Val),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = b.Color.Text,
            BorderSizePixel = 0,
        }, {
            UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
            UIStroke = a.createElement("UIStroke", { Thickness = 2, Color = b.Color.Background })
        }),
        Trigger = a.createElement("TextButton", {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
            Text = "",
            [a.Event.MouseButton1Down] = function(d)
                local function update()
                    local e = game:GetService("UserInputService"):GetMouseLocation()
                    local f = (e.X - d.AbsolutePosition.X) / d.AbsoluteSize.X
                    local g = (e.Y - d.AbsolutePosition.Y) / d.AbsoluteSize.Y
                    c.OnChanged(math.clamp(f, 0, 1), 1 - math.clamp(g, 0, 1))
                end
                update()
            end
        })
    })
end

return SaturationSquare
