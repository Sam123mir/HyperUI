



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.hooks.useSpring)
local c = require(script.Parent.Parent.Parent.hooks.useTheme)

local function HyperModal(d)
    local e = c(d.store)
    local f = d.Open or false
    
    
    local g = b(f and 1 or 0, { stiffness = 200, damping = 25 })
    
    return a.createElement("Frame", {
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.new(0, 0, 0),
        BackgroundTransparency = g:map(function(h) return 1 - (h * 0.5) end),
        Visible = g:map(function(h) return h > 0.01 end),
        ZIndex = 2000,
    }, {
        Content = a.createElement("Frame", {
            Size = UDim2.fromOffset(400, 250),
            Position = g:map(function(h) 
                return UDim2.new(0.5, 0, 0.5, math.floor(30 * (1 - h))) 
            end),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = e.Color.Background,
            BorderSizePixel = 0,
            GroupTransparency = g:map(function(h) return 1 - h end),
        }, {
            UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, e.Radius.Medium) }),
            UIStroke = a.createElement("UIStroke", { Color = e.Color.Border, Thickness = 2 }),
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
                    TextColor3 = e.Color.Text,
                    Font = e.Font, 
                    TextSize = e.FontSize.Large,
                }),
                Divider = a.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1),
                    Position = UDim2.fromScale(0, 1),
                    BackgroundColor3 = e.Color.Border,
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
                    TextColor3 = e.Color.Text,
                    Font = e.Font,
                    TextSize = e.FontSize.Medium,
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
