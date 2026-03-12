




local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.hooks.useTree)
local c = require(script.Parent.Parent.Parent.hooks.useSpring)
local d = require(script.Parent.Parent.Parent.theme.tokens)

local e = require(script.Parent.TabContainer) 

local f = require(script.Parent.Parent.Parent.hooks.useTheme)

local function Window(g)
    local h = f(g.store)
    local i = b(g.store, g.id)
    if not i or not i.props.active then return nil end
    
    
    local j = i.props.active and 1 or 0
    local k = c(j, { stiffness = 300, damping = 30 })
    
    local l = i.props.Position or UDim2.new(0.5, -300, 0.5, -200)
    
    return a.createElement("Frame", {
        Size = UDim2.fromOffset(600, 400),
        Position = l,
        BackgroundColor3 = h.Color.Background,
        BorderSizePixel = 0,
        ZIndex = i.props.zIndex or 1,
        Visible = k:map(function(m) return m > 0.01 end),
    }, {
        UICorner = a.createElement("UICorner", {
            CornerRadius = UDim.new(0, h.Radius.Large)
        }),
        UIStroke = a.createElement("UIStroke", {
            Color = h.Color.Border,
            Thickness = 1,
        }),
        TitleBar = a.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 40),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            [a.Event.InputBegan] = function(m, n)
                if n.UserInputType == Enum.UserInputType.MouseButton1 then
                    
                    local o = (getgenv and getgenv() or _G).__HyperUI_Instance
                    if o and o.Runtime.Input then
                        o.Runtime.Input.DraggingInstance = g.id
                        o.Runtime.Input.DragOffset = n.Position - m.Parent.AbsolutePosition
                    end
                end
            end,
        }, {
            TitleLabel = a.createElement("TextLabel", {
                Size = UDim2.new(1, -80, 1, 0),
                Position = UDim2.fromOffset(h.Spacing[4], 0),
                BackgroundTransparency = 1,
                Text = i.props.title or "HyperUI",
                TextColor3 = h.Color.Text,
                Font = h.Font,
                TextSize = h.FontSize.Large,
                TextXAlignment = Enum.TextXAlignment.Left,
            })
        }),
        
        Content = a.createElement(e, {
            windowId = g.id,
            store = g.store,
            tabs = i.children,
        })
    })
end

return Window
