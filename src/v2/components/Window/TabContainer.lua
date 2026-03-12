--[[
    HyperUI v2 - TabContainer Component
    Manages tab navigation and content visibility.
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local useTheme = require(script.Parent.Parent.Parent.hooks.useTheme)
local Button = require(script.Parent.Parent.Elements.HyperButton)
local useTree = require(script.Parent.Parent.Parent.hooks.useTree)

local Section = require(script.Parent.Parent.Containers.Section)

local function TabContainer(props)
    local theme = useTheme(props.store)
    local initialTab = props.tabs and props.tabs[1] or nil
    local activeTab, setActiveTab = React.useState(initialTab)
    
    local sidebarItems = {}
    if props.tabs then
        for i, tabId in ipairs(props.tabs) do
            local tabNode = useTree(props.store, tabId)
            if tabNode then
                local isSelected = activeTab == tabId
                
                sidebarItems[tabId] = React.createElement(Button, {
                    Text = tabNode.props.title or "Tab",
                    Selected = isSelected,
                    BackgroundColor3 = isSelected and theme.Color.Accent or theme.Color.Surface,
                    Font = isSelected and theme.Font.Bold or theme.Font.Main,
                    Callback = function()
                        setActiveTab(tabId)
                    end
                })
            end
        end
    end
    
    -- Active Content
    local activeTabNode = useTree(props.store, activeTab)
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
            BackgroundColor3 = theme.Color.Surface,
            BackgroundTransparency = 0.5,
            BorderSizePixel = 0,
        }, {
            Layout = React.createElement("UIListLayout", {
                Padding = UDim.new(0, theme.Spacing[1]),
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
            ScrollBarImageColor3 = theme.Color.Accent,
        }, {
            Padding = React.createElement("UIPadding", {
                PaddingTop = UDim.new(0, theme.Spacing[4]),
                PaddingLeft = UDim.new(0, theme.Spacing[4]),
                PaddingRight = UDim.new(0, theme.Spacing[4]),
                PaddingBottom = UDim.new(0, theme.Spacing[4]),
            }),
            Layout = React.createElement("UIListLayout", {
                Padding = UDim.new(0, theme.Spacing[4]),
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
            Sections = React.createElement(React.Fragment, {}, sections),
        })
    })
end

return TabContainer
