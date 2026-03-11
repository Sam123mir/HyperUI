--[[
    HyperUI v2 - ColorPicker Hue Slider
]]

local React = require(script.Parent.Parent.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.Parent.Parent.theme.tokens)

local function HueSlider(props)
    return React.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 12),
        BorderSizePixel = 0,
        LayoutOrder = 2,
    }, {
        UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
        Gradient = React.createElement("UIGradient", {
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
        Handle = React.createElement("Frame", {
            Size = UDim2.fromOffset(16, 16),
            Position = UDim2.new(props.Hue, 0, 0.5, 0),
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
                    local pos = (game:GetService("UserInputService"):GetMouseLocation().X - rbx.AbsolutePosition.X) / rbx.AbsoluteSize.X
                    props.OnChanged(math.clamp(pos, 0, 1))
                end
                update()
            end
        })
    })
end

return HueSlider
