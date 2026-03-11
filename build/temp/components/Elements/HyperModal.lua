



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.theme.tokens)
local c = require(script.Parent.Parent.Parent.hooks.useSpring)

local function HyperModal(d)
    local e = d.Open or false
    local f = c(e and 1 or 0, { damping = 0.7, stiffness = 0.2 })
    
    return a.createElement("Frame", {
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.new(0, 0, 0),
        BackgroundTransparency = f:map(function(g) return 1 - (g * 0.5) end),
        Visible = f:map(function(g) return g > 0.01 end),
        ZIndex = 2000,
    }, {
        Content = a.createElement("Frame", {
            Size = UDim2.fromOffset(400, 250),
            Position = f:map(function(g) return UDim2.fromScale(0.5, 0.5 + (0.1 * (1-g))) end),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = b.Color.Background,
            BorderSizePixel = 0,
            GroupTransparency = f:map(function(g) return 1 - g end),
        }, {
            UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, b.Radius.Medium) }),
            UIStroke = a.createElement("UIStroke", { Color = b.Color.Border, Thickness = 2 }),
            Shadow = a.createElement("ImageLabel", {
                Size = UDim2.new(1, 40, 1, 40),
                Position = UDim2.fromOffset(-20, -20),
                BackgroundTransparency = 1,
                Image = "rbxassetid://1316045217", 
                ImageColor3 = Color3.new(0, 0, 0),
                ImageTransparency = 0.5,
                ZIndex = 0,
            }),
            Header = a.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 48),
                BackgroundTransparency = 1,
            }, {
                Title = a.createElement("TextLabel", {
                    Size = UDim2.fromScale(1, 1),
                    BackgroundTransparency = 1,
                    Text = d.Title or "Modal",
                    TextColor3 = b.Color.Text,
                    Font = b.Font.Bold,
                    TextSize = b.FontSize.Large,
                }),
                Divider = a.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1),
                    Position = UDim2.fromScale(0, 1),
                    BackgroundColor3 = b.Color.Border,
                    BorderSizePixel = 0,
                })
            }),
            Body = a.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, -100),
                Position = UDim2.fromOffset(0, 48),
                BackgroundTransparency = 1,
            }, {
                Padding = a.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 16),
                    PaddingBottom = UDim.new(0, 16),
                    PaddingLeft = UDim.new(0, 24),
                    PaddingRight = UDim.new(0, 24),
                }),
                Text = a.createElement("TextLabel", {
                    Size = UDim2.fromScale(1, 1),
                    BackgroundTransparency = 1,
                    Text = d.Content or "",
                    TextColor3 = b.Color.Text,
                    Font = b.Font.Main,
                    TextSize = b.FontSize.Medium,
                    TextWrapped = true,
                    TextYAlignment = Enum.TextYAlignment.Top,
                })
            }),
            Footer = a.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 52),
                Position = UDim2.new(0, 0, 1, -52),
                BackgroundTransparency = 1,
            }, {
                Layout = a.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Right,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    Padding = UDim.new(0, 12),
                }),
                Padding = a.createElement("UIPadding", { PaddingRight = UDim.new(0, 24) }),
                Children = a.createElement(a.Fragment, {}, d.children)
            })
        })
    })
end

return HyperModal
