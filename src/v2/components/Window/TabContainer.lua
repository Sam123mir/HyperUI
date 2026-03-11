--[[
    HyperUI v2 - TabContainer Component
    Manages tab navigation and content visibility.
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.theme.tokens)
local useTree = require(script.Parent.Parent.Parent.hooks.useTree)

local Section = require(script.Parent.Parent.Containers.Section) -- Will implement next

local function TabContainer(props)
    local activeTabId, setActiveTabId = React.useState(props.tabs[1])
    
    local sidebarItems = {}
    for i, tabId in ipairs(props.tabs) do
        local tabNode = useTree(props.store, tabId)
        if tabNode then
            table.insert(sidebarItems, React.createElement("TextButton", {
                Size = UDim2.new(1, -Tokens.Spacing[2]*2, 0, 32),
                Position = UDim2.fromOffset(Tokens.Spacing[2], 0),
                BackgroundColor3 = activeTabId == tabId and Tokens.Color.Accent or Tokens.Color.Surface,
                BackgroundTransparency = activeTabId == tabId and 0 or 1,
                Text = tabNode.props.title or "Tab",
                TextColor3 = Tokens.Color.Text,
                Font = activeTabId == tabId and Tokens.Font.Bold or Tokens.Font.Main,
                TextSize = Tokens.FontSize.Medium,
                BorderSizePixel = 0,
                [React.Event.Activated] = function() setActiveTabId(tabId) end,
            }, {
                UICorner = React.createElement("UICorner", {
                    CornerRadius = UDim.new(0, Tokens.Radius.Small)
                })
            }))
        end
    end
    
    -- Active Content
    local activeTabNode = useTree(props.store, activeTabId)
    local sections = {}
    if activeTabNode then
        for _, sectionId in ipairs(activeTabNode.children) do
            table.insert(sections, React.createElement(Section, {
                id = sectionId,
                store = props.store,
            }))
        end
    end
    
    return React.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, -40),
        Position = UDim2.fromOffset(0, 40),
        BackgroundTransparency = 1,
    }, {
        Sidebar = React.createElement("Frame", {
            Size = UDim2.new(0, 150, 1, 0),
            BackgroundColor3 = Tokens.Color.Surface,
            BackgroundTransparency = 0.5,
            BorderSizePixel = 0,
        }, {
            Layout = React.createElement("UIListLayout", {
                Padding = UDim.new(0, Tokens.Spacing[1]),
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
            Items = React.createElement(React.Fragment, {}, sidebarItems),
        }),
        MainContent = React.createElement("ScrollingFrame", {
            Size = UDim2.new(1, -150, 1, 0),
            Position = UDim2.fromOffset(150, 0),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            ScrollBarThickness = 2,
            ScrollBarImageColor3 = Tokens.Color.Accent,
        }, {
            Padding = React.createElement("UIPadding", {
                PaddingTop = UDim.new(0, Tokens.Spacing[4]),
                PaddingLeft = UDim.new(0, Tokens.Spacing[4]),
                PaddingRight = UDim.new(0, Tokens.Spacing[4]),
                PaddingBottom = UDim.new(0, Tokens.Spacing[4]),
            }),
            Layout = React.createElement("UIListLayout", {
                Padding = UDim.new(0, Tokens.Spacing[4]),
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
            Sections = React.createElement(React.Fragment, {}, sections),
        })
    })
end

return TabContainer
