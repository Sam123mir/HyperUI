




local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.hooks.useTheme)
local c = require(script.Parent.Parent.Elements.HyperButton)
local d = require(script.Parent.Parent.Parent.hooks.useTree)

local e = require(script.Parent.Parent.Containers.Section)

local function TabContainer(f)
    local g = b(f.store)
    local h = f.tabs and f.tabs[1] or nil
    local i, j = a.useState(h)
    
    local k = {}
    if f.tabs then
        for l, m in ipairs(f.tabs) do
            local n = d(f.store, m)
            if n then
                local o = i == m
                
                k[m] = a.createElement(c, {
                    Text = n.props.title or "Tab",
                    Selected = o,
                    BackgroundColor3 = o and g.Color.Accent or g.Color.Surface,
                    Font = o and g.Font.Bold or g.Font.Main,
                    Callback = function()
                        j(m)
                    end
                })
            end
        end
    end
    
    
    local l = d(f.store, i)
    local m = {}
    if l then
        for n, o in ipairs(l.children) do
            table.insert(m, a.createElement(e, {
                id = o,
                store = f.store,
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
            BackgroundColor3 = g.Color.Surface,
            BackgroundTransparency = 0.5,
            BorderSizePixel = 0,
        }, {
            Layout = a.createElement("UIListLayout", {
                Padding = UDim.new(0, g.Spacing[1]),
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
            Items = a.createElement(a.Fragment, {}, k),
        }),
        MainContent = a.createElement("ScrollingFrame", {
            Size = UDim2.new(1, -150, 1, 0),
            Position = UDim2.fromOffset(150, 0),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            ScrollBarThickness = 2,
            ScrollBarImageColor3 = g.Color.Accent,
        }, {
            Padding = a.createElement("UIPadding", {
                PaddingTop = UDim.new(0, g.Spacing[4]),
                PaddingLeft = UDim.new(0, g.Spacing[4]),
                PaddingRight = UDim.new(0, g.Spacing[4]),
                PaddingBottom = UDim.new(0, g.Spacing[4]),
            }),
            Layout = a.createElement("UIListLayout", {
                Padding = UDim.new(0, g.Spacing[4]),
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
            Sections = a.createElement(a.Fragment, {}, m),
        })
    })
end

return TabContainer
