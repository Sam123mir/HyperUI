--[[
    HyperUI v2 - Window Component
    The main container for all scripts.
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local useTree = require(script.Parent.Parent.Parent.hooks.useTree)
local useSpring = require(script.Parent.Parent.Parent.hooks.useSpring)
local Tokens = require(script.Parent.Parent.Parent.theme.tokens)

local TabContainer = require(script.Parent.TabContainer) -- Will implement next

local useTheme = require(script.Parent.Parent.Parent.hooks.useTheme)

local function Window(props)
    local theme = useTheme(props.store)
    local node = useTree(props.store, props.id)
    if not node or not node.props.active then return nil end
    
    -- Animation for opening/closing
    local targetScale = node.props.active and 1 or 0
    local scale = useSpring(targetScale, { stiffness = 300, damping = 30 })
    
    local position = node.props.Position or UDim2.new(0.5, -300, 0.5, -200)
    
    return React.createElement("Frame", {
        Size = UDim2.fromOffset(600, 400),
        Position = position,
        BackgroundColor3 = theme.Color.Background,
        BorderSizePixel = 0,
        ZIndex = node.props.zIndex or 1,
        Visible = scale:map(function(v) return v > 0.01 end),
    }, {
        UICorner = React.createElement("UICorner", {
            CornerRadius = UDim.new(0, theme.Radius.Large)
        }),
        UIStroke = React.createElement("UIStroke", {
            Color = theme.Color.Border,
            Thickness = 1,
        }),
        TitleBar = React.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 40),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            [React.Event.InputBegan] = function(rbx, input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    -- Trigger global dragging in InputManager
                    local registry = (getgenv and getgenv() or _G).__HyperUI_Instance
                    if registry and registry.Runtime.Input then
                        registry.Runtime.Input.DraggingInstance = props.id
                        registry.Runtime.Input.DragOffset = input.Position - rbx.Parent.AbsolutePosition
                    end
                end
            end,
        }, {
            TitleLabel = React.createElement("TextLabel", {
                Size = UDim2.new(1, -80, 1, 0),
                Position = UDim2.fromOffset(theme.Spacing[4], 0),
                BackgroundTransparency = 1,
                Text = node.props.title or "HyperUI",
                TextColor3 = theme.Color.Text,
                Font = theme.Font,
                TextSize = theme.FontSize.Large,
                TextXAlignment = Enum.TextXAlignment.Left,
            })
        }),
        -- Content Area
        Content = React.createElement(TabContainer, {
            windowId = props.id,
            store = props.store,
            tabs = node.children,
        })
    })
end

return Window
