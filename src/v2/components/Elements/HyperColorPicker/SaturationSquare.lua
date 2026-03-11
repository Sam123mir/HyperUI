--[[
    HyperUI v2 - ColorPicker Saturation Square
]]

local React = require(script.Parent.Parent.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.Parent.Parent.theme.tokens)

local function SaturationSquare(props)
    return React.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, -20),
        BackgroundColor3 = Color3.fromHSV(props.Hue, 1, 1),
        BorderSizePixel = 0,
        LayoutOrder = 1,
    }, {
        UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(0, Tokens.Radius.Small) }),
        SatGradient = React.createElement("Frame", {
            Size = UDim2.fromScale(1, 1),
            BorderSizePixel = 0,
            BackgroundTransparency = 0,
        }, {
            Gradient = React.createElement("UIGradient", {
                Transparency = NumberSequence.new(0, 1),
                Color = ColorSequence.new(Color3.new(1, 1, 1)),
                Rotation = 0,
            })
        }),
        ValGradient = React.createElement("Frame", {
            Size = UDim2.fromScale(1, 1),
            BorderSizePixel = 0,
            BackgroundTransparency = 0,
        }, {
            Gradient = React.createElement("UIGradient", {
                Transparency = NumberSequence.new(0, 1),
                Color = ColorSequence.new(Color3.new(0, 0, 0)),
                Rotation = 90,
            })
        }),
        Handle = React.createElement("Frame", {
            Size = UDim2.fromOffset(12, 12),
            Position = UDim2.fromScale(props.Sat, 1 - props.Val),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Tokens.Color.Text,
            BorderSizePixel = 0,
        }, {
            UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
            UIStroke = React.createElement("UIStroke", { Thickness = 2, Color = Tokens.Color.Background })
        }),
        Trigger = React.createElement("TextButton", {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
            Text = "",
            [React.Event.MouseButton1Down] = function(rbx)
                local function update()
                    local mouse = game:GetService("UserInputService"):GetMouseLocation()
                    local relX = (mouse.X - rbx.AbsolutePosition.X) / rbx.AbsoluteSize.X
                    local relY = (mouse.Y - rbx.AbsolutePosition.Y) / rbx.AbsoluteSize.Y
                    props.OnChanged(math.clamp(relX, 0, 1), 1 - math.clamp(relY, 0, 1))
                end
                update()
            end
        })
    })
end

return SaturationSquare
