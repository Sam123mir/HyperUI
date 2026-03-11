



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.theme.tokens)
local c = require(script.Parent.Parent.Parent.hooks.useSpring)

local function TabItem(d)
    local e = d.Selected
    local f = c(e and 1.1 or 1, { damping = 0.8, stiffness = 0.2 })
    
    return a.createElement("TextButton", {
        Size = UDim2.new(0, 100, 1, 0),
        BackgroundTransparency = 1,
        Text = d.Title,
        TextColor3 = e and b.Color.Text or b.Color.TextMuted,
        Font = e and b.Font.Bold or b.Font.Main,
        TextSize = b.FontSize.Medium,
        [a.Event.Activated] = d.OnSelected,
    }, {
        Indicator = e and a.createElement("Frame", {
            Size = UDim2.new(0.6, 0, 0, 2),
            Position = UDim2.new(0.2, 0, 1, -2),
            BackgroundColor3 = b.Color.Accent,
            BorderSizePixel = 0,
        }),
        UIScale = a.createElement("UIScale", { Scale = f })
    })
end

local function TabBar(d)
    return a.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = b.Color.Surface,
        BorderSizePixel = 0,
        LayoutOrder = d.LayoutOrder,
    }, {
        Layout = a.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        Tabs = a.createElement(a.Fragment, {}, d.children)
    })
end

TabBar.Item = TabItem
return TabBar
