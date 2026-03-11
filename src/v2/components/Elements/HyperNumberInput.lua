--[[
    HyperUI v2 - HyperNumberInput Element
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.theme.tokens)
local BaseElement = require(script.Parent.BaseElement)

local function HyperNumberInput(props)
    return React.createElement(BaseElement, {
        Disabled = props.Disabled,
        LayoutOrder = props.LayoutOrder,
    }, {
        Container = React.createElement("Frame", {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
        }, {
            Padding = React.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, Tokens.Spacing[3]),
                PaddingRight = UDim.new(0, Tokens.Spacing[3]),
            }),
            Label = React.createElement("TextLabel", {
                Size = UDim2.new(0.4, 0, 1, 0),
                BackgroundTransparency = 1,
                Text = props.Text or "Number",
                TextColor3 = Tokens.Color.Text,
                Font = Tokens.Font.Main,
                TextSize = Tokens.FontSize.Medium,
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
            Box = React.createElement("TextBox", {
                Size = UDim2.new(0, 100, 0, 24),
                Position = UDim2.new(1, -100, 0.5, -12),
                BackgroundColor3 = Tokens.Color.Background,
                BackgroundTransparency = 0.5,
                BorderSizePixel = 0,
                Text = tostring(props.Value or props.Min or 0),
                PlaceholderText = "0",
                PlaceholderColor3 = Tokens.Color.TextMuted,
                TextColor3 = Tokens.Color.Accent,
                Font = Tokens.Font.Bold,
                TextSize = Tokens.FontSize.Small,
                [React.Change.Text] = function(rbx)
                    local clean = string.gsub(rbx.Text, "[^%d.-]", "")
                    local num = tonumber(clean)
                    if num then
                        if props.Min then num = math.max(props.Min, num) end
                        if props.Max then num = math.min(props.Max, num) end
                        if props.Callback then props.Callback(num) end
                    end
                end,
            }, {
                UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
                UIStroke = React.createElement("UIStroke", { Color = Tokens.Color.Border, Thickness = 1 }),
            })
        })
    })
end

return HyperNumberInput
