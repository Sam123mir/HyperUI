--[[
    HyperUI v2 - TabBar Component
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.theme.tokens)
local useSpring = require(script.Parent.Parent.Parent.hooks.useSpring)

local function TabItem(props)
    local isSelected = props.Selected
    local scale = useSpring(isSelected and 1.1 or 1, { damping = 0.8, stiffness = 0.2 })
    
    return React.createElement("TextButton", {
        Size = UDim2.new(0, 100, 1, 0),
        BackgroundTransparency = 1,
        Text = props.Title,
        TextColor3 = isSelected and Tokens.Color.Text or Tokens.Color.TextMuted,
        Font = isSelected and Tokens.Font.Bold or Tokens.Font.Main,
        TextSize = Tokens.FontSize.Medium,
        [React.Event.Activated] = props.OnSelected,
    }, {
        Indicator = isSelected and React.createElement("Frame", {
            Size = UDim2.new(0.6, 0, 0, 2),
            Position = UDim2.new(0.2, 0, 1, -2),
            BackgroundColor3 = Tokens.Color.Accent,
            BorderSizePixel = 0,
        }),
        UIScale = React.createElement("UIScale", { Scale = scale })
    })
end

local function TabBar(props)
    return React.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = Tokens.Color.Surface,
        BorderSizePixel = 0,
        LayoutOrder = props.LayoutOrder,
    }, {
        Layout = React.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        Tabs = React.createElement(React.Fragment, {}, props.children)
    })
end

TabBar.Item = TabItem
return TabBar
