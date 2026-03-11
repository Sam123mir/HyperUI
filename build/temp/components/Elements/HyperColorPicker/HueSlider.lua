



local a = require(script.Parent.Parent.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.Parent.Parent.theme.tokens)

local function HueSlider(c)
    return a.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 12),
        BorderSizePixel = 0,
        LayoutOrder = 2,
    }, {
        UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
        Gradient = a.createElement("UIGradient", {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromHSV(0, 1, 1)),
                ColorSequenceKeypoint.new(0.16, Color3.fromHSV(0.16, 1, 1)),
                ColorSequenceKeypoint.new(0.33, Color3.fromHSV(0.33, 1, 1)),
                ColorSequenceKeypoint.new(0.5, Color3.fromHSV(0.5, 1, 1)),
                ColorSequenceKeypoint.new(0.66, Color3.fromHSV(0.66, 1, 1)),
                ColorSequenceKeypoint.new(0.83, Color3.fromHSV(0.83, 1, 1)),
                ColorSequenceKeypoint.new(1, Color3.fromHSV(1, 1, 1)),
            })
        }),
        Handle = a.createElement("Frame", {
            Size = UDim2.fromOffset(16, 16),
            Position = UDim2.new(c.Hue, 0, 0.5, 0),
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
                    local e = (game:GetService("UserInputService"):GetMouseLocation().X - d.AbsolutePosition.X) / d.AbsoluteSize.X
                    c.OnChanged(math.clamp(e, 0, 1))
                end
                update()
            end
        })
    })
end

return HueSlider
