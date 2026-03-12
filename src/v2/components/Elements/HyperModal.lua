--[[
    HyperUI v2 - HyperModal Element
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local useSpring = require(script.Parent.Parent.Parent.hooks.useSpring)
local useTheme = require(script.Parent.Parent.Parent.hooks.useTheme)

local function HyperModal(props)
    local theme = useTheme(props.store)
    local isOpen = props.Open or false
    
    -- Spring for modal transitions
    local anim = useSpring(isOpen and 1 or 0, { stiffness = 200, damping = 25 })
    
    return React.createElement("Frame", {
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.new(0, 0, 0),
        BackgroundTransparency = anim:map(function(v) return 1 - (v * 0.5) end),
        Visible = anim:map(function(v) return v > 0.01 end),
        ZIndex = 2000,
    }, {
        Content = React.createElement("Frame", {
            Size = UDim2.fromOffset(400, 250),
            Position = anim:map(function(v) 
                return UDim2.new(0.5, 0, 0.5, math.floor(30 * (1 - v))) 
            end),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = theme.Color.Background,
            BorderSizePixel = 0,
            GroupTransparency = anim:map(function(v) return 1 - v end),
        }, {
            UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(0, theme.Radius.Medium) }),
            UIStroke = React.createElement("UIStroke", { Color = theme.Color.Border, Thickness = 2 }),
            Shadow = React.createElement("ImageLabel", {
                Size = UDim2.new(1, 40, 1, 40),
                Position = UDim2.fromOffset(-20, -20),
                BackgroundTransparency = 1,
                Image = "rbxassetid://1316045217",
                ImageColor3 = Color3.new(0, 0, 0),
                ImageTransparency = 0.5,
                ZIndex = 0,
            }),
            Header = React.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 48),
                BackgroundTransparency = 1,
            }, {
                Title = React.createElement("TextLabel", {
                    Size = UDim2.fromScale(1, 1),
                    BackgroundTransparency = 1,
                    Text = props.Title or "Modal",
                    TextColor3 = theme.Color.Text,
                    Font = theme.Font, -- Assuming Theme.Font is the main font
                    TextSize = theme.FontSize.Large,
                }),
                Divider = React.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1),
                    Position = UDim2.fromScale(0, 1),
                    BackgroundColor3 = theme.Color.Border,
                    BorderSizePixel = 0,
                })
            }),
            Body = React.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, -100),
                Position = UDim2.fromOffset(0, 48),
                BackgroundTransparency = 1,
            }, {
                Padding = React.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 16),
                    PaddingBottom = UDim.new(0, 16),
                    PaddingLeft = UDim.new(0, 24),
                    PaddingRight = UDim.new(0, 24),
                }),
                Text = React.createElement("TextLabel", {
                    Size = UDim2.fromScale(1, 1),
                    BackgroundTransparency = 1,
                    Text = props.Content or "",
                    TextColor3 = theme.Color.Text,
                    Font = theme.Font,
                    TextSize = theme.FontSize.Medium,
                    TextWrapped = true,
                    TextYAlignment = Enum.TextYAlignment.Top,
                })
            }),
            Footer = React.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 52),
                Position = UDim2.new(0, 0, 1, -52),
                BackgroundTransparency = 1,
            }, {
                Layout = React.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Right,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    Padding = UDim.new(0, 12),
                }),
                Padding = React.createElement("UIPadding", { PaddingRight = UDim.new(0, 24) }),
                Children = React.createElement(React.Fragment, {}, props.children)
            })
        })
    })
end

return HyperModal
