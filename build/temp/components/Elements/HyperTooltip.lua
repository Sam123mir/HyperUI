



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.theme.tokens)
local c = require(script.Parent.Parent.Parent.hooks.useSpring)

local function HyperTooltip(d)
    local e = d.Visible or false
    local f = c(e and 1 or 0, { damping = 0.8, stiffness = 0.2 })
    
    return a.createElement("Frame", {
        Size = UDim2.fromScale(0, 0),
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundColor3 = b.Color.Background,
        BackgroundTransparency = f:map(function(g) return 1 - (g * 0.9) end),
        Position = d.Position or UDim2.fromScale(0.5, 0),
        AnchorPoint = Vector2.new(0.5, 1.2),
        ZIndex = 1000,
    }, {
        UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
        UIStroke = a.createElement("UIStroke", {
            Color = b.Color.Border,
            Transparency = f:map(function(g) return 1 - g end),
        }),
        Padding = a.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 4),
            PaddingBottom = UDim.new(0, 4),
            PaddingLeft = UDim.new(0, 8),
            PaddingRight = UDim.new(0, 8),
        }),
        Label = a.createElement("TextLabel", {
            Size = UDim2.fromScale(0, 0),
            AutomaticSize = Enum.AutomaticSize.XY,
            BackgroundTransparency = 1,
            Text = d.Text or "Tooltip",
            TextColor3 = b.Color.Text,
            TextTransparency = f:map(function(g) return 1 - g end),
            Font = b.Font.Main,
            TextSize = b.FontSize.Small,
        })
    })
end

return HyperTooltip
