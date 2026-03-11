--[[
    HyperUI v2 - Window Component
    The main container for all scripts.
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local useTree = require(script.Parent.Parent.Parent.hooks.useTree)
local useSpring = require(script.Parent.Parent.Parent.hooks.useSpring)
local Tokens = require(script.Parent.Parent.Parent.theme.tokens)

local TabContainer = require(script.Parent.TabContainer) -- Will implement next

local function Window(props)
    local node = useTree(props.store, props.id)
    if not node or not node.props.active then return nil end
    
    -- Animation for opening/closing
    local targetScale = node.props.active and 1 or 0
    local scale = useSpring(targetScale)
    
    return React.createElement("Frame", {
        Size = UDim2.fromOffset(600, 400),
        Position = UDim2.new(0.5, -300, 0.5, -200),
        BackgroundColor3 = Tokens.Color.Background,
        BorderSizePixel = 0,
        ZIndex = node.props.zIndex or 1,
        Visible = scale > 0.01,
    }, {
        UICorner = React.createElement("UICorner", {
            CornerRadius = UDim.new(0, Tokens.Radius.Large)
        }),
        UIStroke = React.createElement("UIStroke", {
            Color = Tokens.Color.Border,
            Thickness = 1,
        }),
        TitleBar = React.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 40),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
        }, {
            TitleLabel = React.createElement("TextLabel", {
                Size = UDim2.new(1, -80, 1, 0),
                Position = UDim2.fromOffset(Tokens.Spacing[4], 0),
                BackgroundTransparency = 1,
                Text = node.props.title or "HyperUI",
                TextColor3 = Tokens.Color.Text,
                Font = Tokens.Font.Bold,
                TextSize = Tokens.FontSize.Large,
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
