




local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.hooks.useTree)
local c = require(script.Parent.Parent.Parent.hooks.useSpring)
local d = require(script.Parent.Parent.Parent.theme.tokens)

local e = require(script.Parent.TabContainer) 

local function Window(f)
    local g = b(f.store, f.id)
    if not g or not g.props.active then return nil end
    
    
    local h = g.props.active and 1 or 0
    local i = c(h)
    
    return a.createElement("Frame", {
        Size = UDim2.fromOffset(600, 400),
        Position = UDim2.new(0.5, -300, 0.5, -200),
        BackgroundColor3 = d.Color.Background,
        BorderSizePixel = 0,
        ZIndex = g.props.zIndex or 1,
        Visible = i > 0.01,
    }, {
        UICorner = a.createElement("UICorner", {
            CornerRadius = UDim.new(0, d.Radius.Large)
        }),
        UIStroke = a.createElement("UIStroke", {
            Color = d.Color.Border,
            Thickness = 1,
        }),
        TitleBar = a.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 40),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
        }, {
            TitleLabel = a.createElement("TextLabel", {
                Size = UDim2.new(1, -80, 1, 0),
                Position = UDim2.fromOffset(d.Spacing[4], 0),
                BackgroundTransparency = 1,
                Text = g.props.title or "HyperUI",
                TextColor3 = d.Color.Text,
                Font = d.Font.Bold,
                TextSize = d.FontSize.Large,
                TextXAlignment = Enum.TextXAlignment.Left,
            })
        }),
        
        Content = a.createElement(e, {
            windowId = f.id,
            store = f.store,
            tabs = g.children,
        })
    })
end

return Window
