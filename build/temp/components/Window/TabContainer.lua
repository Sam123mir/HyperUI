




local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.theme.tokens)
local c = require(script.Parent.Parent.Parent.hooks.useTree)

local d = require(script.Parent.Parent.Containers.Section) 

local function TabContainer(e)
    local f, g = a.useState(e.tabs[1])
    
    local h = {}
    for i, j in ipairs(e.tabs) do
        local k = c(e.store, j)
        if k then
            table.insert(h, a.createElement("TextButton", {
                Size = UDim2.new(1, -b.Spacing[2]*2, 0, 32),
                Position = UDim2.fromOffset(b.Spacing[2], 0),
                BackgroundColor3 = f == j and b.Color.Accent or b.Color.Surface,
                BackgroundTransparency = f == j and 0 or 1,
                Text = k.props.title or "Tab",
                TextColor3 = b.Color.Text,
                Font = f == j and b.Font.Bold or b.Font.Main,
                TextSize = b.FontSize.Medium,
                BorderSizePixel = 0,
                [a.Event.Activated] = function() g(j) end,
            }, {
                UICorner = a.createElement("UICorner", {
                    CornerRadius = UDim.new(0, b.Radius.Small)
                })
            }))
        end
    end
    
    
    local i = c(e.store, f)
    local j = {}
    if i then
        for k, l in ipairs(i.children) do
            table.insert(j, a.createElement(d, {
                id = l,
                store = e.store,
            }))
        end
    end
    
    return a.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, -40),
        Position = UDim2.fromOffset(0, 40),
        BackgroundTransparency = 1,
    }, {
        Sidebar = a.createElement("Frame", {
            Size = UDim2.new(0, 150, 1, 0),
            BackgroundColor3 = b.Color.Surface,
            BackgroundTransparency = 0.5,
            BorderSizePixel = 0,
        }, {
            Layout = a.createElement("UIListLayout", {
                Padding = UDim.new(0, b.Spacing[1]),
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
            Items = a.createElement(a.Fragment, {}, h),
        }),
        MainContent = a.createElement("ScrollingFrame", {
            Size = UDim2.new(1, -150, 1, 0),
            Position = UDim2.fromOffset(150, 0),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            ScrollBarThickness = 2,
            ScrollBarImageColor3 = b.Color.Accent,
        }, {
            Padding = a.createElement("UIPadding", {
                PaddingTop = UDim.new(0, b.Spacing[4]),
                PaddingLeft = UDim.new(0, b.Spacing[4]),
                PaddingRight = UDim.new(0, b.Spacing[4]),
                PaddingBottom = UDim.new(0, b.Spacing[4]),
            }),
            Layout = a.createElement("UIListLayout", {
                Padding = UDim.new(0, b.Spacing[4]),
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
            Sections = a.createElement(a.Fragment, {}, j),
        })
    })
end

return TabContainer
