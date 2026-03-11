--[[
    HyperUI v2 - HyperTooltip Element
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.theme.tokens)
local useSpring = require(script.Parent.Parent.Parent.hooks.useSpring)

local function HyperTooltip(props)
    local visible = props.Visible or false
    local opacity = useSpring(visible and 1 or 0, { damping = 0.8, stiffness = 0.2 })
    
    return React.createElement("Frame", {
        Size = UDim2.fromScale(0, 0),
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundColor3 = Tokens.Color.Background,
        BackgroundTransparency = opacity:map(function(v) return 1 - (v * 0.9) end),
        Position = props.Position or UDim2.fromScale(0.5, 0),
        AnchorPoint = Vector2.new(0.5, 1.2),
        ZIndex = 1000,
    }, {
        UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
        UIStroke = React.createElement("UIStroke", {
            Color = Tokens.Color.Border,
            Transparency = opacity:map(function(v) return 1 - v end),
        }),
        Padding = React.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 4),
            PaddingBottom = UDim.new(0, 4),
            PaddingLeft = UDim.new(0, 8),
            PaddingRight = UDim.new(0, 8),
        }),
        Label = React.createElement("TextLabel", {
            Size = UDim2.fromScale(0, 0),
            AutomaticSize = Enum.AutomaticSize.XY,
            BackgroundTransparency = 1,
            Text = props.Text or "Tooltip",
            TextColor3 = Tokens.Color.Text,
            TextTransparency = opacity:map(function(v) return 1 - v end),
            Font = Tokens.Font.Main,
            TextSize = Tokens.FontSize.Small,
        })
    })
end

return HyperTooltip
