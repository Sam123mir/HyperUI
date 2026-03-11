-- HyperUI Framework
-- Version: 2.0.0
-- Build Date: 2026-03-11 15:14:10
-- Distribution: Single File

local _modules = {}
_modules["main"] = function()
    --[[
        HyperUI v2 - Entry Point
        Professional React-based UI Framework for Roblox Scripts
    ]]
    
    local HyperUI = {}
    HyperUI.__index = HyperUI
    
    -- Global Runtime Guard
    -- Prevents multiple instances from running simultaneously in exploit environments
    local function CheckExistingInstance()
        local registry = getgenv and getgenv() or _G
        if registry.__HyperUI_Instance then
            local oldInstance = registry.__HyperUI_Instance
            pcall(function()
                oldInstance:Destroy()
            end)
            registry.__HyperUI_Instance = nil
        end
    end
    
    function HyperUI.new()
        CheckExistingInstance()
        
        local self = setmetatable({}, HyperUI)
        
        -- Initialize Core Systems
        self.Store = _require("core/store").new()
        -- Managers
        self.WindowManager = _require("managers/WindowManager").new(self.Store)
        self.NotificationManager = _require("managers/NotificationManager").new(self.Store)
        self.ThemeManager = _require("managers/ThemeManager").new(self.Store)
        self.FocusManager = _require("managers/FocusManager").new(self.Store)
        self.Config = _require("core/config").new(self.Store, {
            FileName = "HyperUI_V2_Config.json",
            AutoSave = true
        })
        
        -- Mount the Runtime
        self.Runtime = _require("runtime/mount").new(self.Store)
        
        -- Register global instance
        local registry = getgenv and getgenv() or _G
        registry.__HyperUI_Instance = self
        
        return self
    end
    
    function HyperUI:CreateWindow(config)
        local API = _require("api")
        local windowId = game:GetService("HttpService"):GenerateGUID(false)
        
        self.Store:Dispatch({
            type = "ADD_WINDOW",
            window = {
                id = windowId,
                title = config.Title or "HyperUI",
                icon = config.Icon,
                active = true,
            }
        })
        
        return API.Window.new(windowId, self.Store)
    end
    
    function HyperUI:Notify(config)
        return self.NotificationManager:Notify(config)
    end
    
    function HyperUI:SetTheme(themeName)
        return self.ThemeManager:SetTheme(themeName)
    end
    
    function HyperUI:Destroy()
        if self.Runtime then
            self.Runtime:Unmount()
        end
        
        local registry = getgenv and getgenv() or _G
        if registry.__HyperUI_Instance == self then
            registry.__HyperUI_Instance = nil
        end
        
        -- Clear state
        self.Store:Destroy()
    end
    
    return HyperUI
end

_modules["api/Element"] = function()
    --[[
        HyperUI v2 - Element API
    ]]
    
    local ElementAPI = {}
    ElementAPI.__index = ElementAPI
    
    function ElementAPI.new(id, store)
        return setmetatable({
            Id = id,
            Store = store,
        }, ElementAPI)
    end
    
    function ElementAPI:SetTitle(title)
        self.Store:Dispatch({
            type = "UPDATE_ELEMENT",
            id = self.Id,
            props = { text = title }
        })
    end
    
    function ElementAPI:SetValue(value)
        self.Store:Dispatch({
            type = "UPDATE_ELEMENT",
            id = self.Id,
            props = { value = value }
        })
    end
    
    function ElementAPI:SetVisible(visible)
        self.Store:Dispatch({
            type = "UPDATE_ELEMENT",
            id = self.Id,
            props = { visible = visible }
        })
    end
    
    return ElementAPI
end

_modules["api"] = function()
    --[[
        HyperUI v2 - Public API Export
        Exposes all API wrappers for the framework.
    ]]
    
    return {
        Window = _require("Window"),
        Tab = _require("Tab"),
        Section = _require("Section"),
        Element = _require("Element"),
    }
end

_modules["api/Section"] = function()
    --[[
        HyperUI v2 - Section API
    ]]
    
    local SectionAPI = {}
    SectionAPI.__index = SectionAPI
    
    local Element = _require("Element")
    
    function SectionAPI.new(id, tabId, windowId, store)
        local self = setmetatable({
            Id = id,
            TabId = tabId,
            WindowId = windowId,
            Store = store,
        }, SectionAPI)
        
        return self
    end
    
    local function CreateElement(self, elementType, config)
        local elementId = game:GetService("HttpService"):GenerateGUID(false)
        
        self.Store:Dispatch({
            type = "ADD_ELEMENT",
            parentId = self.Id,
            element = {
                id = elementId,
                type = elementType,
                props = config,
            }
        })
        
        return Element.new(elementId, self.Store)
    end
    
    function SectionAPI:CreateButton(config)
        return CreateElement(self, "Button", config)
    end
    
    function SectionAPI:CreateIconButton(config)
        return CreateElement(self, "IconButton", config)
    end
    
    function SectionAPI:CreateToggle(config)
        return CreateElement(self, "Toggle", config)
    end
    
    function SectionAPI:CreateCheckbox(config)
        return CreateElement(self, "Checkbox", config)
    end
    
    function SectionAPI:CreateSlider(config)
        return CreateElement(self, "Slider", config)
    end
    
    function SectionAPI:CreateDropdown(config)
        return CreateElement(self, "Dropdown", config)
    end
    
    function SectionAPI:CreateMultiDropdown(config)
        config.Multi = true
        return CreateElement(self, "Dropdown", config)
    end
    
    function SectionAPI:CreateKeybind(config)
        return CreateElement(self, "Keybind", config)
    end
    
    function SectionAPI:CreateInput(config)
        return CreateElement(self, "Input", config)
    end
    
    function SectionAPI:CreateNumberInput(config)
        return CreateElement(self, "NumberInput", config)
    end
    
    function SectionAPI:CreateSearchInput(config)
        return CreateElement(self, "SearchInput", config)
    end
    
    function SectionAPI:CreateTextArea(config)
        return CreateElement(self, "TextArea", config)
    end
    
    function SectionAPI:CreateLabel(config)
        return CreateElement(self, "Label", config)
    end
    
    function SectionAPI:CreateBadge(config)
        return CreateElement(self, "Badge", config)
    end
    
    function SectionAPI:CreateIcon(config)
        return CreateElement(self, "Icon", config)
    end
    
    function SectionAPI:CreateProgressBar(config)
        return CreateElement(self, "ProgressBar", config)
    end
    
    function SectionAPI:CreateComboBox(config)
        return CreateElement(self, "ComboBox", config)
    end
    
    function SectionAPI:CreateAvatar(config)
        return CreateElement(self, "Avatar", config)
    end
    
    function SectionAPI:CreateDivider(config)
        return CreateElement(self, "Divider", config or {})
    end
    
    function SectionAPI:CreateSpacer(height)
        return CreateElement(self, "Spacer", { Height = height })
    end
    
    function SectionAPI:CreateAccordion(config)
        return CreateElement(self, "Accordion", config)
    end
    
    function SectionAPI:CreateCollapsible(config)
        return CreateElement(self, "Collapsible", config)
    end
    
    function SectionAPI:CreateCopyButton(config)
        return CreateElement(self, "CopyButton", config)
    end
    
    function SectionAPI:CreateTag(config)
        return CreateElement(self, "Tag", config)
    end
    
    function SectionAPI:CreateStatusIndicator(config)
        return CreateElement(self, "StatusIndicator", config)
    end
    
    function SectionAPI:CreateGrid(config)
        return CreateElement(self, "Grid", config)
    end
    
    function SectionAPI:CreateStack(config)
        return CreateElement(self, "Stack", config)
    end
    
    function SectionAPI:CreateVirtualList(config)
        return CreateElement(self, "VirtualList", config)
    end
    
    return SectionAPI
end

_modules["api/Tab"] = function()
    --[[
        HyperUI v2 - Tab API
    ]]
    
    local SectionAPI = _require("Section")
    local TabAPI = {}
    TabAPI.__index = TabAPI
    
    function TabAPI.new(id, windowId, store)
        return setmetatable({
            Id = id,
            WindowId = windowId,
            Store = store,
        }, TabAPI)
    end
    
    function TabAPI:CreateSection(config)
        local sectionId = game:GetService("HttpService"):GenerateGUID(false)
        
        self.Store:Dispatch({
            type = "ADD_SECTION",
            tabId = self.Id,
            section = {
                id = sectionId,
                title = config.Title or "New Section",
            }
        })
        
        return SectionAPI.new(sectionId, self.Id, self.WindowId, self.Store)
    end
    
    return TabAPI
end

_modules["api/Window"] = function()
    --[[
        HyperUI v2 - Window API
    ]]
    
    local TabAPI = _require("Tab")
    local WindowAPI = {}
    WindowAPI.__index = WindowAPI
    
    function WindowAPI.new(id, store)
        return setmetatable({
            Id = id,
            Store = store,
        }, WindowAPI)
    end
    
    function WindowAPI:CreateTab(config)
        local tabId = game:GetService("HttpService"):GenerateGUID(false)
        
        self.Store:Dispatch({
            type = "ADD_TAB",
            windowId = self.Id,
            tab = {
                id = tabId,
                title = config.Title or "New Tab",
                icon = config.Icon,
            }
        })
        
        return TabAPI.new(tabId, self.Id, self.Store)
    end
    
    function WindowAPI:SetTitle(title)
        self.Store:Dispatch({
            type = "UPDATE_ELEMENT",
            id = self.Id,
            props = { title = title }
        })
    end
    
    function WindowAPI:Close()
        self.Store:Dispatch({
            type = "UPDATE_ELEMENT",
            id = self.Id,
            props = { visible = false }
        })
    end
    
    return WindowAPI
end

_modules["components/Root"] = function()
    --[[
        HyperUI v2 - Root Component
        The top-level React component for the entire framework.
    ]]
    
    local React = _require("dependencies/React")
    local Window = _require("Window")
    
    local function Root(props)
        local state, setState = React.useState(props.store:GetState())
        
        React.useEffect(function()
            local unsubscribe = props.store:OnUpdate(function(newState)
                setState(newState)
            end)
            return unsubscribe
        end, {props.store})
        
        local windows = {}
        for id, config in pairs(state.windows) do
            windows[id] = React.createElement(Window, {
                id = id,
                store = props.store,
                config = config,
            })
        end
        
        -- Notification stack will be rendered here as well
        
        return React.createElement("Frame", {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
        }, windows)
    end
    
    return Root
end

_modules["components/Containers/ElementList"] = function()
    --[[
        HyperUI v2 - ElementList Component
        Standardized layout container for component groups.
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    
    local function ElementList(props)
        return React.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            LayoutOrder = props.LayoutOrder,
        }, {
            Layout = React.createElement("UIListLayout", {
                Padding = UDim.new(0, Tokens.Spacing[2]),
                SortOrder = Enum.SortOrder.LayoutOrder,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
            }),
            Padding = React.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, Tokens.Spacing[2]),
                PaddingRight = UDim.new(0, Tokens.Spacing[2]),
            }),
            Elements = React.createElement(React.Fragment, {}, props.children)
        })
    end
    
    return ElementList
end

_modules["components/Containers/Grid"] = function()
    --[[
        HyperUI v2 - Grid Component
    ]]
    
    local React = _require("dependencies/React")
    
    local function Grid(props)
        return React.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            LayoutOrder = props.LayoutOrder,
        }, {
            Layout = React.createElement("UIGridLayout", {
                CellSize = props.CellSize or UDim2.fromOffset(100, 100),
                CellPadding = props.CellPadding or UDim2.fromOffset(8, 8),
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
            Children = React.createElement(React.Fragment, {}, props.children)
        })
    end
    
    return Grid
end

_modules["components/Containers/Section"] = function()
    --[[
        HyperUI v2 - Section Component
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    local useTree = _require("hooks/useTree")
    local ElementList = _require("components/ElementList")
    
    -- Component Mapping
    local COMPONENTS = {
        Button = _require("Elements/HyperButton"),
        IconButton = _require("Elements/HyperIconButton"),
        Toggle = _require("Elements/HyperToggle"),
        Checkbox = _require("Elements/HyperCheckbox"),
        Slider = _require("Elements/HyperSlider"),
        Dropdown = _require("Elements/HyperDropdown"),
        Keybind = _require("Elements/HyperKeybind"),
        ColorPicker = _require("Elements/HyperColorPicker"),
        Input = _require("Elements/HyperInput"),
        NumberInput = _require("Elements/HyperNumberInput"),
        SearchInput = _require("Elements/HyperSearchInput"),
        TextArea = _require("Elements/HyperTextArea"),
        Label = _require("Elements/HyperLabel"),
        Badge = _require("Elements/HyperBadge"),
        Icon = _require("Elements/HyperIcon"),
        ProgressBar = _require("Elements/HyperProgressBar"),
        StatDisplay = _require("Elements/HyperStatDisplay"),
        ComboBox = _require("Elements/HyperComboBox"),
        Avatar = _require("Elements/HyperAvatar"),
        Divider = _require("Elements/HyperDivider"),
        Spacer = _require("Elements/HyperSpacer"),
        Accordion = _require("Elements/HyperAccordion"),
        Collapsible = _require("Elements/HyperCollapsible"),
        CopyButton = _require("Elements/HyperCopyButton"),
        Tag = _require("Elements/HyperTag"),
        StatusIndicator = _require("Elements/HyperStatusIndicator"),
        Grid = _require("components/Grid"),
        Stack = _require("components/Stack"),
        VirtualList = _require("components/VirtualList"),
    }
    
    local function Section(props)
        local node = useTree(props.store, props.id)
        if not node then return nil end
        
        local elements = {}
        for i, elementId in ipairs(node.children) do
            local elementNode = useTree(props.store, elementId)
            if elementNode then
                local Component = COMPONENTS[elementNode.type]
                if Component then
                    table.insert(elements, React.createElement(Component, {
                        key = elementId,
                        LayoutOrder = i,
                        -- Pass all props to the component
                        Text = elementNode.props.text,
                        Value = elementNode.props.value,
                        Options = elementNode.props.options,
                        Min = elementNode.props.min,
                        Max = elementNode.props.max,
                        Icon = elementNode.props.icon,
                        Disabled = elementNode.props.disabled,
                        Callback = function(newValue)
                            -- Update tree state if it's a value-changing component
                            if elementNode.type ~= "Button" and elementNode.type ~= "IconButton" then
                                props.store:Dispatch({
                                    type = "UPDATE_ELEMENT",
                                    id = elementId,
                                    props = { value = newValue }
                                })
                            end
                            -- Execute user callback
                            if elementNode.props.callback then
                                elementNode.props.callback(newValue)
                            end
                        end
                    }))
                end
            end
        end
        
        return React.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            LayoutOrder = props.LayoutOrder,
        }, {
            Layout = React.createElement("UIListLayout", {
                Padding = UDim.new(0, Tokens.Spacing[2]),
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
            Title = React.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 20),
                BackgroundTransparency = 1,
                Text = node.props.title:upper(),
                TextColor3 = Tokens.Color.TextMuted,
                Font = Tokens.Font.Bold,
                TextSize = Tokens.FontSize.Small,
                TextXAlignment = Enum.TextXAlignment.Left,
            }, {
                Padding = React.createElement("UIPadding", { PaddingLeft = UDim.new(0, Tokens.Spacing[2]) })
            }),
            Container = React.createElement(ElementList, {}, elements)
        })
    end
    
    return Section
end

_modules["components/Containers/Sidebar"] = function()
    --[[
        HyperUI v2 - Sidebar Component
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    
    local function Sidebar(props)
        return React.createElement("Frame", {
            Size = UDim2.new(0, 200, 1, 0),
            BackgroundColor3 = Tokens.Color.Surface,
            BorderSizePixel = 0,
        }, {
            Layout = React.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 4),
            }),
            Padding = React.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 12),
                PaddingBottom = UDim.new(0, 12),
                PaddingLeft = UDim.new(0, 8),
                PaddingRight = UDim.new(0, 8),
            }),
            Items = React.createElement(React.Fragment, {}, props.children)
        })
    end
    
    return Sidebar
end

_modules["components/Containers/Stack"] = function()
    --[[
        HyperUI v2 - Stack Component
    ]]
    
    local React = _require("dependencies/React")
    
    local function Stack(props)
        return React.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            LayoutOrder = props.LayoutOrder,
        }, {
            Layout = React.createElement("UIListLayout", {
                FillDirection = props.FillDirection or Enum.FillDirection.Vertical,
                Padding = props.Padding or UDim.new(0, 8),
                HorizontalAlignment = props.HorizontalAlignment or Enum.HorizontalAlignment.Left,
                VerticalAlignment = props.VerticalAlignment or Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
            Children = React.createElement(React.Fragment, {}, props.children)
        })
    end
    
    return Stack
end

_modules["components/Containers/TabBar"] = function()
    --[[
        HyperUI v2 - TabBar Component
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    local useSpring = _require("hooks/useSpring")
    
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
end

_modules["components/Containers/VirtualList"] = function()
    --[[
        HyperUI v2 - VirtualList Component
        Optimized rendering for large datasets.
    ]]
    
    local React = _require("dependencies/React")
    
    local function VirtualList(props)
        local items = props.Items or {}
        local itemHeight = props.ItemHeight or 32
        local buffer = props.Buffer or 5
        
        local containerRef = React.useRef(nil)
        local scrollTop, setScrollTop = React.useState(0)
        
        -- Calculate visible range
        local visibleCount = math.ceil(400 / itemHeight) -- Assuming 400px height for now
        local startIndex = math.max(1, math.floor(scrollTop / itemHeight) - buffer)
        local endIndex = math.min(#items, startIndex + visibleCount + buffer * 2)
        
        local visibleItems = {}
        for i = startIndex, endIndex do
            local item = items[i]
            table.insert(visibleItems, React.createElement("Frame", {
                Key = i,
                Size = UDim2.new(1, 0, 0, itemHeight),
                Position = UDim2.fromOffset(0, (i - 1) * itemHeight),
                BackgroundTransparency = 1,
            }, {
                Content = props.RenderItem(item, i)
            }))
        end
        
        return React.createElement("ScrollingFrame", {
            Size = props.Size or UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
            CanvasSize = UDim2.new(0, 0, 0, #items * itemHeight),
            ScrollBarThickness = 2,
            [React.Event.Scroll] = function(rbx)
                setScrollTop(rbx.CanvasPosition.Y)
            end,
        }, visibleItems)
    end
    
    return VirtualList
end

_modules["components/Elements/BaseElement"] = function()
    --[[
        HyperUI v2 - BaseElement Component
        The foundational container for all UI elements.
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    local useInteractionState = _require("hooks/useInteractionState")
    
    local useSpring = _require("hooks/useSpring")
    
    local function BaseElement(props)
        local interaction = useInteractionState(not props.Disabled)
        
        -- Animation state
        local targetScale = 1
        if not props.Disabled then
            if interaction.pressed then
                targetScale = 0.95
            elseif interaction.hovered then
                targetScale = 1.02
            end
        end
        
        local scale = useSpring(targetScale, { damping = 0.8, stiffness = 0.2 })
        
        -- Combined styles
        local size = props.Size or UDim2.new(1, 0, 0, 32)
        local backgroundTransparency = props.BackgroundTransparency or 0
        local backgroundColor = props.BackgroundColor or Tokens.Color.Surface
        
        return React.createElement("Frame", {
            Size = size,
            BackgroundColor3 = backgroundColor,
            BackgroundTransparency = backgroundTransparency,
            BorderSizePixel = 0,
            LayoutOrder = props.LayoutOrder,
        }, {
            UIScale = React.createElement("UIScale", {
                Scale = scale
            }),
            UICorner = React.createElement("UICorner", {
                CornerRadius = UDim.new(0, Tokens.Radius.Small)
            }),
            UIStroke = React.createElement("UIStroke", {
                Color = Tokens.Color.Border,
                Transparency = 0.5,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            }),
            Content = React.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
                ZIndex = 3,
            }, props.children),
            
            -- Event triggers
            Trigger = React.createElement("TextButton", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
                Text = "",
                ZIndex = 10,
                [React.Event.Activated] = function()
                    if not props.Disabled and props.OnActivated then
                        props.OnActivated()
                    end
                end,
            }, interaction.bindings)
        })
    end
    
    return BaseElement
end

_modules["components/Elements/HyperAccordion"] = function()
    --[[
        HyperUI v2 - HyperAccordion Element
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    local BaseElement = _require("components/BaseElement")
    local useSpring = _require("hooks/useSpring")
    
    local function HyperAccordion(props)
        local isOpen, setOpen = React.useState(false)
        local arrowRotation = useSpring(isOpen and 180 or 0, { damping = 0.8, stiffness = 0.2 })
        
        return React.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            LayoutOrder = props.LayoutOrder,
        }, {
            Layout = React.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4) }),
            Header = React.createElement(BaseElement, {
                OnActivated = function() setOpen(not isOpen) end,
            }, {
                Container = React.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1),
                    BackgroundTransparency = 1,
                }, {
                    Padding = React.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, Tokens.Spacing[3]),
                        PaddingRight = UDim.new(0, Tokens.Spacing[3]),
                    }),
                    Title = React.createElement("TextLabel", {
                        Size = UDim2.new(1, -24, 1, 0),
                        BackgroundTransparency = 1,
                        Text = props.Title or "Accordion",
                        TextColor3 = Tokens.Color.Text,
                        Font = Tokens.Font.Bold,
                        TextSize = Tokens.FontSize.Medium,
                        TextXAlignment = Enum.TextXAlignment.Left,
                    }),
                    Arrow = React.createElement("ImageLabel", {
                        Size = UDim2.fromOffset(16, 16),
                        Position = UDim2.new(1, -16, 0.5, -8),
                        BackgroundTransparency = 1,
                        Image = "rbxassetid://10723346959",
                        ImageColor3 = Tokens.Color.TextMuted,
                        Rotation = arrowRotation,
                    })
                })
            }),
            Content = isOpen and React.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundTransparency = 1,
            }, {
                Padding = React.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 16),
                    PaddingRight = UDim.new(0, 4),
                }),
                Elements = React.createElement(React.Fragment, {}, props.children)
            })
        })
    end
    
    return HyperAccordion
end

_modules["components/Elements/HyperAvatar"] = function()
    --[[
        HyperUI v2 - HyperAvatar Element
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    
    local function HyperAvatar(props)
        local userId = props.UserId or 1
        local size = props.Size or 48
        
        return React.createElement("ImageLabel", {
            Size = UDim2.fromOffset(size, size),
            BackgroundColor3 = Tokens.Color.Surface,
            BorderSizePixel = 0,
            Image = "rbxthumb://type=AvatarHeadShot&id=" .. userId .. "&w=150&h=150",
            LayoutOrder = props.LayoutOrder,
        }, {
            UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
            UIStroke = React.createElement("UIStroke", { Color = Tokens.Color.Border, Thickness = 2 })
        })
    end
    
    return HyperAvatar
end

_modules["components/Elements/HyperBadge"] = function()
    --[[
        HyperUI v2 - HyperBadge Element
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    
    local function HyperBadge(props)
        local color = props.Color or Tokens.Color.Accent
        
        return React.createElement("Frame", {
            Size = UDim2.fromScale(0, 0),
            AutomaticSize = Enum.AutomaticSize.XY,
            BackgroundColor3 = color,
            BackgroundTransparency = 0.2,
            BorderSizePixel = 0,
            LayoutOrder = props.LayoutOrder,
        }, {
            UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
            Padding = React.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 2),
                PaddingBottom = UDim.new(0, 2),
                PaddingLeft = UDim.new(0, 6),
                PaddingRight = UDim.new(0, 6),
            }),
            Label = React.createElement("TextLabel", {
                Size = UDim2.fromScale(0, 0),
                AutomaticSize = Enum.AutomaticSize.XY,
                BackgroundTransparency = 1,
                Text = props.Text or "BADGE",
                TextColor3 = Tokens.Color.Text,
                Font = Tokens.Font.Bold,
                TextSize = 10,
            })
        })
    end
    
    return HyperBadge
end

_modules["components/Elements/HyperButton"] = function()
    --[[
        HyperUI v2 - HyperButton Element
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    local BaseElement = _require("components/BaseElement")
    
    local function HyperButton(props)
        return React.createElement(BaseElement, {
            Disabled = props.Disabled,
            OnActivated = props.Callback,
            LayoutOrder = props.LayoutOrder,
        }, {
            Label = React.createElement("TextLabel", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
                Text = props.Text or "Button",
                TextColor3 = Tokens.Color.Text,
                Font = Tokens.Font.Main,
                TextSize = Tokens.FontSize.Medium,
                ZIndex = 5,
            })
        })
    end
    
    return HyperButton
end

_modules["components/Elements/HyperCheckbox"] = function()
    --[[
        HyperUI v2 - HyperCheckbox Element
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    local BaseElement = _require("components/BaseElement")
    local useSpring = _require("hooks/useSpring")
    
    local function HyperCheckbox(props)
        local state = props.Value or false
        local checkScale = useSpring(state and 1 or 0, { damping = 0.5, stiffness = 0.3 })
        
        return React.createElement(BaseElement, {
            Disabled = props.Disabled,
            OnActivated = function()
                if props.Callback then props.Callback(not state) end
            end,
            LayoutOrder = props.LayoutOrder,
        }, {
            Container = React.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = React.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, Tokens.Spacing[3]),
                    PaddingRight = UDim.new(0, Tokens.Spacing[3]),
                }),
                Label = React.createElement("TextLabel", {
                    Size = UDim2.new(1, -30, 1, 0),
                    BackgroundTransparency = 1,
                    Text = props.Text or "Checkbox",
                    TextColor3 = Tokens.Color.Text,
                    Font = Tokens.Font.Main,
                    TextSize = Tokens.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                Box = React.createElement("Frame", {
                    Size = UDim2.fromOffset(20, 20),
                    Position = UDim2.new(1, -20, 0.5, -10),
                    BackgroundColor3 = Tokens.Color.Surface,
                    BorderSizePixel = 0,
                }, {
                    UICorner = React.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 4)
                    }),
                    UIStroke = React.createElement("UIStroke", {
                        Color = state and Tokens.Color.Accent or Tokens.Color.Border,
                        Thickness = 1,
                    }),
                    CheckMark = React.createElement("Frame", {
                        Size = UDim2.fromScale(0.6, 0.6),
                        Position = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        BackgroundColor3 = Tokens.Color.Accent,
                        BackgroundTransparency = checkScale:map(function(v) return 1 - v end),
                    }, {
                        UICorner = React.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 2)
                        }),
                        UIScale = React.createElement("UIScale", {
                            Scale = checkScale
                        })
                    })
                })
            })
        })
    end
    
    return HyperCheckbox
end

_modules["components/Elements/HyperCollapsible"] = function()
    --[[
        HyperUI v2 - HyperCollapsible Element
    ]]
    
    local React = _require("dependencies/React")
    local Accordion = _require("components/HyperAccordion")
    
    local function HyperCollapsible(props)
        -- Collapsible is essentially a simplified Accordion
        return React.createElement(Accordion, props)
    end
    
    return HyperCollapsible
end

_modules["components/Elements/HyperComboBox"] = function()
    --[[
        HyperUI v2 - HyperComboBox Element
    ]]
    
    local React = _require("dependencies/React")
    local Dropdown = _require("components/Elements/HyperDropdown")
    local Input = _require("components/Elements/HyperInput")
    
    local function HyperComboBox(props)
        -- ComboBox is essentially an Input that triggers a Dropdown list
        -- For simplicity in this v2 phase, we compose them
        return React.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            LayoutOrder = props.LayoutOrder,
        }, {
            Layout = React.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
            Combo = React.createElement(Dropdown, {
                Text = props.Text,
                Value = props.Value,
                Options = props.Options,
                Callback = props.Callback,
            })
        })
    end
    
    return HyperComboBox
end

_modules["components/Elements/HyperConfirmationDialog"] = function()
    --[[
        HyperUI v2 - HyperConfirmationDialog Element
    ]]
    
    local React = _require("dependencies/React")
    local Modal = _require("components/HyperModal")
    local Button = _require("components/HyperButton")
    
    local function HyperConfirmationDialog(props)
        return React.createElement(Modal, {
            Open = props.Open,
            Title = props.Title,
            Content = props.Content,
        }, {
            Cancel = React.createElement(Button, {
                Text = props.CancelText or "Cancel",
                Size = UDim2.fromOffset(100, 32),
                Callback = props.OnCancel,
            }),
            Confirm = React.createElement(Button, {
                Text = props.ConfirmText or "Confirm",
                Size = UDim2.fromOffset(100, 32),
                BackgroundColor = Color3.fromRGB(200, 50, 50), -- Alert color
                Callback = props.OnConfirm,
            })
        })
    end
    
    return HyperConfirmationDialog
end

_modules["components/Elements/HyperCopyButton"] = function()
    --[[
        HyperUI v2 - CopyButton Element
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    local BaseElement = _require("components/BaseElement")
    
    local function CopyButton(props)
        local isCopied, setCopied = React.useState(false)
        
        local function copy()
            if setclipboard then
                setclipboard(props.Value or "")
                setCopied(true)
                task.delay(2, function() setCopied(false) end)
            end
        end
        
        return React.createElement(BaseElement, {
            OnActivated = copy,
            LayoutOrder = props.LayoutOrder,
        }, {
            Container = React.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = React.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, Tokens.Spacing[3]),
                    PaddingRight = UDim.new(0, Tokens.Spacing[3]),
                }),
                Label = React.createElement("TextLabel", {
                    Size = UDim2.new(1, -60, 1, 0),
                    BackgroundTransparency = 1,
                    Text = props.Text or "Copy Content",
                    TextColor3 = Tokens.Color.Text,
                    Font = Tokens.Font.Main,
                    TextSize = Tokens.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                Status = React.createElement("TextLabel", {
                    Size = UDim2.fromScale(0.4, 1),
                    Position = UDim2.fromScale(0.6, 0),
                    BackgroundTransparency = 1,
                    Text = isCopied and "COPIED" or "COPY",
                    TextColor3 = isCopied and Tokens.Color.Success or Tokens.Color.TextMuted,
                    Font = Tokens.Font.Bold,
                    TextSize = 10,
                    TextXAlignment = Enum.TextXAlignment.Right,
                })
            })
        })
    end
    
    return CopyButton
end

_modules["components/Elements/HyperDivider"] = function()
    --[[
        HyperUI v2 - HyperDivider Element
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    
    local function HyperDivider(props)
        return React.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 1),
            BackgroundColor3 = Tokens.Color.Border,
            BorderSizePixel = 0,
            BackgroundTransparency = 0.5,
            LayoutOrder = props.LayoutOrder,
        }, {
            Padding = React.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, Tokens.Spacing[2]),
                PaddingRight = UDim.new(0, Tokens.Spacing[2]),
            })
        })
    end
    
    return HyperDivider
end

_modules["components/Elements/HyperGroup"] = function()
    --[[
        HyperUI v2 - HyperGroup Element
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    local ElementList = _require("Containers/ElementList")
    
    local function HyperGroup(props)
        return React.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundColor3 = Tokens.Color.Background,
            BackgroundTransparency = 0.5,
            BorderSizePixel = 0,
            LayoutOrder = props.LayoutOrder,
        }, {
            UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(0, Tokens.Radius.Small) }),
            Padding = React.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 8),
                PaddingBottom = UDim.new(0, 8),
            }),
            Content = React.createElement(ElementList, {}, props.children)
        })
    end
    
    return HyperGroup
end

_modules["components/Elements/HyperIcon"] = function()
    --[[
        HyperUI v2 - HyperIcon Element
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    
    local function HyperIcon(props)
        local size = props.Size or 16
        
        return React.createElement("ImageLabel", {
            Size = UDim2.fromOffset(size, size),
            BackgroundTransparency = 1,
            Image = props.Icon or "",
            ImageColor3 = props.Color or Tokens.Color.Text,
            LayoutOrder = props.LayoutOrder,
        })
    end
    
    return HyperIcon
end

_modules["components/Elements/HyperIconButton"] = function()
    --[[
        HyperUI v2 - HyperIconButton Element
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    local BaseElement = _require("components/BaseElement")
    
    local function HyperIconButton(props)
        return React.createElement(BaseElement, {
            Size = props.Size or UDim2.fromOffset(32, 32),
            Disabled = props.Disabled,
            OnActivated = props.Callback,
            LayoutOrder = props.LayoutOrder,
        }, {
            Icon = React.createElement("ImageLabel", {
                Size = UDim2.fromOffset(20, 20),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundTransparency = 1,
                Image = props.Icon or "",
                ImageColor3 = Tokens.Color.Text,
            })
        })
    end
    
    return HyperIconButton
end

_modules["components/Elements/HyperInput"] = function()
    --[[
        HyperUI v2 - HyperInput Element
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    local BaseElement = _require("components/BaseElement")
    
    local function HyperInput(props)
        return React.createElement(BaseElement, {
            Disabled = props.Disabled,
            LayoutOrder = props.LayoutOrder,
        }, {
            Container = React.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = React.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, Tokens.Spacing[3]),
                    PaddingRight = UDim.new(0, Tokens.Spacing[3]),
                }),
                Label = React.createElement("TextLabel", {
                    Size = UDim2.new(0.4, 0, 1, 0),
                    BackgroundTransparency = 1,
                    Text = props.Text or "Input",
                    TextColor3 = Tokens.Color.Text,
                    Font = Tokens.Font.Main,
                    TextSize = Tokens.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                Box = React.createElement("TextBox", {
                    Size = UDim2.new(0.6, -8, 0, 24),
                    Position = UDim2.new(0.4, 8, 0.5, -12),
                    BackgroundColor3 = Tokens.Color.Background,
                    BackgroundTransparency = 0.5,
                    BorderSizePixel = 0,
                    Text = props.Value or "",
                    PlaceholderText = props.Placeholder or "Enter text...",
                    PlaceholderColor3 = Tokens.Color.TextMuted,
                    TextColor3 = Tokens.Color.Accent,
                    Font = Tokens.Font.Main,
                    TextSize = Tokens.FontSize.Small,
                    ClearTextOnFocus = false,
                    [React.Change.Text] = function(rbx)
                        if props.Callback then props.Callback(rbx.Text) end
                    end,
                }, {
                    UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
                    UIStroke = React.createElement("UIStroke", { Color = Tokens.Color.Border, Thickness = 1 }),
                    Padding = React.createElement("UIPadding", { PaddingLeft = UDim.new(0, 8) }),
                })
            })
        })
    end
    
    return HyperInput
end

_modules["components/Elements/HyperKeybind"] = function()
    --[[
        HyperUI v2 - HyperKeybind Element
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    local BaseElement = _require("components/BaseElement")
    local UserInputService = game:GetService("UserInputService")
    
    local function HyperKeybind(props)
        local isListening, setListening = React.useState(false)
        local bind = props.Value or Enum.KeyCode.Unknown
        
        React.useEffect(function()
            if not isListening then return end
            
            local connection = UserInputService.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.Keyboard then
                    setListening(false)
                    if props.Callback then props.Callback(input.KeyCode) end
                end
            end)
            
            return function() connection:Disconnect() end
        end, {isListening})
        
        return React.createElement(BaseElement, {
            OnActivated = function() setListening(true) end,
            LayoutOrder = props.LayoutOrder,
        }, {
            Container = React.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = React.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, Tokens.Spacing[3]),
                    PaddingRight = UDim.new(0, Tokens.Spacing[3]),
                }),
                Label = React.createElement("TextLabel", {
                    Size = UDim2.new(1, -100, 1, 0),
                    BackgroundTransparency = 1,
                    Text = props.Text or "Keybind",
                    TextColor3 = Tokens.Color.Text,
                    Font = Tokens.Font.Main,
                    TextSize = Tokens.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                BindDisplay = React.createElement("Frame", {
                    Size = UDim2.fromOffset(80, 24),
                    Position = UDim2.new(1, -80, 0.5, -12),
                    BackgroundColor3 = isListening and Tokens.Color.Accent or Tokens.Color.Surface,
                    BackgroundTransparency = 0.5,
                    BorderSizePixel = 0,
                }, {
                    UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
                    Text = React.createElement("TextLabel", {
                        Size = UDim2.fromScale(1, 1),
                        BackgroundTransparency = 1,
                        Text = isListening and "..." or bind.Name,
                        TextColor3 = Tokens.Color.Text,
                        Font = Tokens.Font.Bold,
                        TextSize = Tokens.FontSize.Small,
                    })
                })
            })
        })
    end
    
    return HyperKeybind
end

_modules["components/Elements/HyperLabel"] = function()
    --[[
        HyperUI v2 - HyperLabel Element
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    
    local function HyperLabel(props)
        return React.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            LayoutOrder = props.LayoutOrder,
        }, {
            Layout = React.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 2),
            }),
            Padding = React.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, Tokens.Spacing[2]),
            }),
            Title = React.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundTransparency = 1,
                Text = props.Text or "Label",
                TextColor3 = Tokens.Color.Text,
                Font = Tokens.Font.Main,
                TextSize = Tokens.FontSize.Medium,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
            }),
            Description = props.Description and React.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundTransparency = 1,
                Text = props.Description,
                TextColor3 = Tokens.Color.TextMuted,
                Font = Tokens.Font.Main,
                TextSize = Tokens.FontSize.Small,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
            })
        })
    end
    
    return HyperLabel
end

_modules["components/Elements/HyperModal"] = function()
    --[[
        HyperUI v2 - HyperModal Element
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    local useSpring = _require("hooks/useSpring")
    
    local function HyperModal(props)
        local isOpen = props.Open or false
        local anim = useSpring(isOpen and 1 or 0, { damping = 0.7, stiffness = 0.2 })
        
        return React.createElement("Frame", {
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.new(0, 0, 0),
            BackgroundTransparency = anim:map(function(v) return 1 - (v * 0.5) end),
            Visible = anim:map(function(v) return v > 0.01 end),
            ZIndex = 2000,
        }, {
            Content = React.createElement("Frame", {
                Size = UDim2.fromOffset(400, 250),
                Position = anim:map(function(v) return UDim2.fromScale(0.5, 0.5 + (0.1 * (1-v))) end),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Tokens.Color.Background,
                BorderSizePixel = 0,
                GroupTransparency = anim:map(function(v) return 1 - v end),
            }, {
                UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(0, Tokens.Radius.Medium) }),
                UIStroke = React.createElement("UIStroke", { Color = Tokens.Color.Border, Thickness = 2 }),
                Shadow = React.createElement("ImageLabel", {
                    Size = UDim2.new(1, 40, 1, 40),
                    Position = UDim2.fromOffset(-20, -20),
                    BackgroundTransparency = 1,
                    Image = "rbxassetid://1316045217", -- Shadow texture
                    ImageColor3 = Color3.new(0, 0, 0),
                    ImageTransparency = 0.5,
                    ZIndex = 0,
                }),
                Header = React.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 48),
                    BackgroundTransparency = 1,
                }, {
                    Title = React.createElement("TextLabel", {
                        Size = UDim2.fromScale(1, 1),
                        BackgroundTransparency = 1,
                        Text = props.Title or "Modal",
                        TextColor3 = Tokens.Color.Text,
                        Font = Tokens.Font.Bold,
                        TextSize = Tokens.FontSize.Large,
                    }),
                    Divider = React.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, 1),
                        Position = UDim2.fromScale(0, 1),
                        BackgroundColor3 = Tokens.Color.Border,
                        BorderSizePixel = 0,
                    })
                }),
                Body = React.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, -100),
                    Position = UDim2.fromOffset(0, 48),
                    BackgroundTransparency = 1,
                }, {
                    Padding = React.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 16),
                        PaddingBottom = UDim.new(0, 16),
                        PaddingLeft = UDim.new(0, 24),
                        PaddingRight = UDim.new(0, 24),
                    }),
                    Text = React.createElement("TextLabel", {
                        Size = UDim2.fromScale(1, 1),
                        BackgroundTransparency = 1,
                        Text = props.Content or "",
                        TextColor3 = Tokens.Color.Text,
                        Font = Tokens.Font.Main,
                        TextSize = Tokens.FontSize.Medium,
                        TextWrapped = true,
                        TextYAlignment = Enum.TextYAlignment.Top,
                    })
                }),
                Footer = React.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 52),
                    Position = UDim2.new(0, 0, 1, -52),
                    BackgroundTransparency = 1,
                }, {
                    Layout = React.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Right,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        Padding = UDim.new(0, 12),
                    }),
                    Padding = React.createElement("UIPadding", { PaddingRight = UDim.new(0, 24) }),
                    Children = React.createElement(React.Fragment, {}, props.children)
                })
            })
        })
    end
    
    return HyperModal
end

_modules["components/Elements/HyperNumberInput"] = function()
    --[[
        HyperUI v2 - HyperNumberInput Element
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    local BaseElement = _require("components/BaseElement")
    
    local function HyperNumberInput(props)
        return React.createElement(BaseElement, {
            Disabled = props.Disabled,
            LayoutOrder = props.LayoutOrder,
        }, {
            Container = React.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = React.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, Tokens.Spacing[3]),
                    PaddingRight = UDim.new(0, Tokens.Spacing[3]),
                }),
                Label = React.createElement("TextLabel", {
                    Size = UDim2.new(0.4, 0, 1, 0),
                    BackgroundTransparency = 1,
                    Text = props.Text or "Number",
                    TextColor3 = Tokens.Color.Text,
                    Font = Tokens.Font.Main,
                    TextSize = Tokens.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                Box = React.createElement("TextBox", {
                    Size = UDim2.new(0, 100, 0, 24),
                    Position = UDim2.new(1, -100, 0.5, -12),
                    BackgroundColor3 = Tokens.Color.Background,
                    BackgroundTransparency = 0.5,
                    BorderSizePixel = 0,
                    Text = tostring(props.Value or props.Min or 0),
                    PlaceholderText = "0",
                    PlaceholderColor3 = Tokens.Color.TextMuted,
                    TextColor3 = Tokens.Color.Accent,
                    Font = Tokens.Font.Bold,
                    TextSize = Tokens.FontSize.Small,
                    [React.Change.Text] = function(rbx)
                        local clean = string.gsub(rbx.Text, "[^%d.-]", "")
                        local num = tonumber(clean)
                        if num then
                            if props.Min then num = math.max(props.Min, num) end
                            if props.Max then num = math.min(props.Max, num) end
                            if props.Callback then props.Callback(num) end
                        end
                    end,
                }, {
                    UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
                    UIStroke = React.createElement("UIStroke", { Color = Tokens.Color.Border, Thickness = 1 }),
                })
            })
        })
    end
    
    return HyperNumberInput
end

_modules["components/Elements/HyperProgressBar"] = function()
    --[[
        HyperUI v2 - HyperProgressBar Element
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    local useSpring = _require("hooks/useSpring")
    
    local function HyperProgressBar(props)
        local value = math.clamp(props.Value or 0, 0, 100)
        local fillScale = useSpring(value / 100, { damping = 0.8, stiffness = 0.2 })
        
        return React.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 24),
            BackgroundTransparency = 1,
            LayoutOrder = props.LayoutOrder,
        }, {
            Layout = React.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4) }),
            Label = props.Text and React.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 14),
                BackgroundTransparency = 1,
                Text = props.Text,
                TextColor3 = Tokens.Color.TextMuted,
                Font = Tokens.Font.Main,
                TextSize = Tokens.FontSize.Small,
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
            Track = React.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 8),
                BackgroundColor3 = Tokens.Color.Surface,
                BorderSizePixel = 0,
            }, {
                UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
                Fill = React.createElement("Frame", {
                    Size = fillScale:map(function(v) return UDim2.fromScale(v, 1) end),
                    BackgroundColor3 = Tokens.Color.Accent,
                    BorderSizePixel = 0,
                }, {
                    UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
                })
            })
        })
    end
    
    return HyperProgressBar
end

_modules["components/Elements/HyperSearchInput"] = function()
    --[[
        HyperUI v2 - HyperSearchInput Element
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    local BaseElement = _require("components/BaseElement")
    
    local function HyperSearchInput(props)
        return React.createElement(BaseElement, {
            Disabled = props.Disabled,
            LayoutOrder = props.LayoutOrder,
        }, {
            Container = React.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = React.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, Tokens.Spacing[3]),
                    PaddingRight = UDim.new(0, Tokens.Spacing[3]),
                }),
                Icon = React.createElement("ImageLabel", {
                    Size = UDim2.fromOffset(16, 16),
                    Position = UDim2.new(0, 0, 0.5, -8),
                    BackgroundTransparency = 1,
                    Image = "rbxassetid://10723346959", -- Search icon placeholder
                    ImageColor3 = Tokens.Color.TextMuted,
                }),
                Box = React.createElement("TextBox", {
                    Size = UDim2.new(1, -24, 0, 24),
                    Position = UDim2.new(0, 24, 0.5, -12),
                    BackgroundTransparency = 1,
                    Text = props.Value or "",
                    PlaceholderText = props.Placeholder or "Search...",
                    PlaceholderColor3 = Tokens.Color.TextMuted,
                    TextColor3 = Tokens.Color.Text,
                    Font = Tokens.Font.Main,
                    TextSize = Tokens.FontSize.Small,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ClearTextOnFocus = false,
                    [React.Change.Text] = function(rbx)
                        if props.Callback then props.Callback(rbx.Text) end
                    end,
                })
            })
        })
    end
    
    return HyperSearchInput
end

_modules["components/Elements/HyperSlider"] = function()
    --[[
        HyperUI v2 - HyperSlider Element
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    local BaseElement = _require("components/BaseElement")
    local useSpring = _require("hooks/useSpring")
    
    local function HyperSlider(props)
        local min = props.Min or 0
        local max = props.Max or 100
        local value = props.Value or min
        
        local fillPercent = (value - min) / (max - min)
        local fillScale = useSpring(fillPercent, { damping = 0.9, stiffness = 0.1 })
        
        return React.createElement(BaseElement, {
            Disabled = props.Disabled,
            LayoutOrder = props.LayoutOrder,
        }, {
            Container = React.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = React.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, Tokens.Spacing[3]),
                    PaddingRight = UDim.new(0, Tokens.Spacing[3]),
                }),
                Label = React.createElement("TextLabel", {
                    Size = UDim2.new(1, -120, 0.5, 0),
                    BackgroundTransparency = 1,
                    Text = props.Text or "Slider",
                    TextColor3 = Tokens.Color.Text,
                    Font = Tokens.Font.Main,
                    TextSize = Tokens.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                ValueLabel = React.createElement("TextLabel", {
                    Size = UDim2.new(0, 50, 0.5, 0),
                    Position = UDim2.new(1, -50, 0, 0),
                    BackgroundTransparency = 1,
                    Text = tostring(math.floor(value)),
                    TextColor3 = Tokens.Color.Accent,
                    Font = Tokens.Font.Bold,
                    TextSize = Tokens.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Right,
                }),
                Track = React.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 4),
                    Position = UDim2.new(0, 0, 0.8, -2),
                    BackgroundColor3 = Tokens.Color.Surface,
                    BorderSizePixel = 0,
                }, {
                    UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
                    Fill = React.createElement("Frame", {
                        Size = fillScale:map(function(v) return UDim2.fromScale(v, 1) end),
                        BackgroundColor3 = Tokens.Color.Accent,
                        BorderSizePixel = 0,
                    }, {
                        UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
                    })
                })
            })
        })
    end
    
    return HyperSlider
end

_modules["components/Elements/HyperSpacer"] = function()
    --[[
        HyperUI v2 - HyperSpacer Element
    ]]
    
    local React = _require("dependencies/React")
    
    local function HyperSpacer(props)
        local height = props.Height or 10
        
        return React.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, height),
            BackgroundTransparency = 1,
            LayoutOrder = props.LayoutOrder,
        })
    end
    
    return HyperSpacer
end

_modules["components/Elements/HyperStatDisplay"] = function()
    --[[
        HyperUI v2 - HyperStatDisplay Element
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    local BaseElement = _require("components/BaseElement")
    
    local function HyperStatDisplay(props)
        return React.createElement(BaseElement, {
            Size = UDim2.new(1, 0, 0, 60),
            Disabled = true, -- Stats are generally not interactive
            LayoutOrder = props.LayoutOrder,
        }, {
            Container = React.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = React.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, Tokens.Spacing[3]),
                    PaddingRight = UDim.new(0, Tokens.Spacing[3]),
                }),
                Title = React.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, 20),
                    Position = UDim2.fromOffset(0, 8),
                    BackgroundTransparency = 1,
                    Text = props.Title or "Metric",
                    TextColor3 = Tokens.Color.TextMuted,
                    Font = Tokens.Font.Main,
                    TextSize = Tokens.FontSize.Small,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                Value = React.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, 30),
                    Position = UDim2.fromOffset(0, 24),
                    BackgroundTransparency = 1,
                    Text = props.Value or "0",
                    TextColor3 = Tokens.Color.Text,
                    Font = Tokens.Font.Bold,
                    TextSize = Tokens.FontSize.Title,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                SubValue = props.SubValue and React.createElement("TextLabel", {
                    Size = UDim2.new(0, 100, 0, 20),
                    Position = UDim2.new(1, -100, 1, -24),
                    BackgroundTransparency = 1,
                    Text = props.SubValue,
                    TextColor3 = Tokens.Color.Success,
                    Font = Tokens.Font.Main,
                    TextSize = Tokens.FontSize.Small,
                    TextXAlignment = Enum.TextXAlignment.Right,
                })
            })
        })
    end
    
    return HyperStatDisplay
end

_modules["components/Elements/HyperStatusIndicator"] = function()
    --[[
        HyperUI v2 - HyperStatusIndicator Element
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    
    local function HyperStatusIndicator(props)
        local statusColors = {
            Online = Tokens.Color.Success,
            Warning = Tokens.Color.Warning,
            Offline = Tokens.Color.Error,
            Busy = Color3.fromRGB(255, 85, 255),
        }
        
        local color = statusColors[props.Status] or Tokens.Color.TextMuted
        
        return React.createElement("Frame", {
            Size = UDim2.fromOffset(10, 10),
            BackgroundColor3 = color,
            BorderSizePixel = 0,
            LayoutOrder = props.LayoutOrder,
        }, {
            UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
            Glow = React.createElement("ImageLabel", {
                Size = UDim2.fromScale(3, 3),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundTransparency = 1,
                Image = "rbxassetid://1316045217", -- Glow texture
                ImageColor3 = color,
                ImageTransparency = 0.5,
            })
        })
    end
    
    return HyperStatusIndicator
end

_modules["components/Elements/HyperTag"] = function()
    --[[
        HyperUI v2 - HyperTag Element
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    
    local function HyperTag(props)
        return React.createElement("Frame", {
            Size = UDim2.fromScale(0, 0),
            AutomaticSize = Enum.AutomaticSize.XY,
            BackgroundColor3 = Tokens.Color.Surface,
            BorderSizePixel = 0,
            LayoutOrder = props.LayoutOrder,
        }, {
            UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
            UIStroke = React.createElement("UIStroke", { Color = Tokens.Color.Border, Thickness = 1 }),
            Padding = React.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 4),
                PaddingBottom = UDim.new(0, 4),
                PaddingLeft = UDim.new(0, 8),
                PaddingRight = UDim.new(0, 8),
            }),
            Layout = React.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                Padding = UDim.new(0, 8),
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }),
            Label = React.createElement("TextLabel", {
                Size = UDim2.fromScale(0, 0),
                AutomaticSize = Enum.AutomaticSize.XY,
                BackgroundTransparency = 1,
                Text = props.Text or "Tag",
                TextColor3 = Tokens.Color.Text,
                Font = Tokens.Font.Main,
                TextSize = Tokens.FontSize.Small,
            }),
            Close = props.OnDismiss and React.createElement("TextButton", {
                Size = UDim2.fromOffset(12, 12),
                BackgroundTransparency = 1,
                Text = "×",
                TextColor3 = Tokens.Color.TextMuted,
                Font = Tokens.Font.Bold,
                TextSize = 14,
                [React.Event.Activated] = props.OnDismiss,
            })
        })
    end
    
    return HyperTag
end

_modules["components/Elements/HyperTextArea"] = function()
    --[[
        HyperUI v2 - HyperTextArea Element
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    local BaseElement = _require("components/BaseElement")
    
    local function HyperTextArea(props)
        return React.createElement(BaseElement, {
            Size = UDim2.new(1, 0, 0, 100), -- Taller size for text area
            Disabled = props.Disabled,
            LayoutOrder = props.LayoutOrder,
        }, {
            Container = React.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = React.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, Tokens.Spacing[2]),
                    PaddingBottom = UDim.new(0, Tokens.Spacing[2]),
                    PaddingLeft = UDim.new(0, Tokens.Spacing[3]),
                    PaddingRight = UDim.new(0, Tokens.Spacing[3]),
                }),
                Box = React.createElement("TextBox", {
                    Size = UDim2.fromScale(1, 1),
                    BackgroundTransparency = 1,
                    Text = props.Value or "",
                    PlaceholderText = props.Placeholder or "Enter long text...",
                    PlaceholderColor3 = Tokens.Color.TextMuted,
                    TextColor3 = Tokens.Color.Text,
                    Font = Tokens.Font.Main,
                    TextSize = Tokens.FontSize.Small,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Top,
                    TextWrapped = true,
                    MultiLine = true,
                    ClearTextOnFocus = false,
                    [React.Change.Text] = function(rbx)
                        if props.Callback then props.Callback(rbx.Text) end
                    end,
                })
            })
        })
    end
    
    return HyperTextArea
end

_modules["components/Elements/HyperToast"] = function()
    --[[
        HyperUI v2 - HyperToast Element
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    local BaseElement = _require("components/BaseElement")
    local useSpring = _require("hooks/useSpring")
    
    local function HyperToast(props)
        local priorityColors = {
            Info = Tokens.Color.Accent,
            Success = Tokens.Color.Success,
            Warning = Tokens.Color.Warning,
            Error = Tokens.Color.Error,
        }
        
        local color = priorityColors[props.Priority] or Tokens.Color.Accent
        
        return React.createElement(BaseElement, {
            Size = UDim2.new(0, 300, 0, 60),
            BackgroundColor = Tokens.Color.Surface,
            BackgroundTransparency = 0.1,
        }, {
            UIStroke = React.createElement("UIStroke", {
                Color = color,
                Thickness = 1,
                Transparency = 0.5,
            }),
            Container = React.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = React.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, Tokens.Spacing[3]),
                    PaddingRight = UDim.new(0, Tokens.Spacing[3]),
                }),
                Icon = props.Icon and React.createElement("ImageLabel", {
                    Size = UDim2.fromOffset(24, 24),
                    Position = UDim2.new(0, 0, 0.5, -12),
                    BackgroundTransparency = 1,
                    Image = props.Icon,
                    ImageColor3 = color,
                }),
                Content = React.createElement("Frame", {
                    Size = UDim2.new(1, props.Icon and -32 or 0, 1, 0),
                    Position = UDim2.new(0, props.Icon and 32 or 0, 0, 0),
                    BackgroundTransparency = 1,
                }, {
                    Layout = React.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        Padding = UDim.new(0, 2),
                    }),
                    Title = React.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 0, 16),
                        BackgroundTransparency = 1,
                        Text = props.Title or "Notification",
                        TextColor3 = color,
                        Font = Tokens.Font.Bold,
                        TextSize = Tokens.FontSize.Medium,
                        TextXAlignment = Enum.TextXAlignment.Left,
                    }),
                    Text = React.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 0, 14),
                        BackgroundTransparency = 1,
                        Text = props.Content or "",
                        TextColor3 = Tokens.Color.Text,
                        Font = Tokens.Font.Main,
                        TextSize = Tokens.FontSize.Small,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextWrapped = true,
                    })
                })
            })
        })
    end
    
    return HyperToast
end

_modules["components/Elements/HyperToggle"] = function()
    --[[
        HyperUI v2 - HyperToggle Element
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    local BaseElement = _require("components/BaseElement")
    local useSpring = _require("hooks/useSpring")
    
    local function HyperToggle(props)
        local state = props.Value or false
        local switchPos = useSpring(state and 1 or 0, { damping = 0.8, stiffness = 0.2 })
        
        return React.createElement(BaseElement, {
            Disabled = props.Disabled,
            OnActivated = function()
                if props.Callback then props.Callback(not state) end
            end,
            LayoutOrder = props.LayoutOrder,
        }, {
            Container = React.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = React.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, Tokens.Spacing[3]),
                    PaddingRight = UDim.new(0, Tokens.Spacing[3]),
                }),
                Label = React.createElement("TextLabel", {
                    Size = UDim2.new(1, -50, 1, 0),
                    BackgroundTransparency = 1,
                    Text = props.Text or "Toggle",
                    TextColor3 = Tokens.Color.Text,
                    Font = Tokens.Font.Main,
                    TextSize = Tokens.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                SwitchTrack = React.createElement("Frame", {
                    Size = UDim2.fromOffset(40, 20),
                    Position = UDim2.new(1, -40, 0.5, -10),
                    BackgroundColor3 = switchPos:map(function(v)
                        return Tokens.Color.Surface:Lerp(Tokens.Color.Accent, v)
                    end),
                    BorderSizePixel = 0,
                }, {
                    UICorner = React.createElement("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    }),
                    Handle = React.createElement("Frame", {
                        Size = UDim2.fromOffset(16, 16),
                        Position = switchPos:map(function(v)
                            return UDim2.new(0, 2 + (20 * v), 0.5, -8)
                        end),
                        BackgroundColor3 = Tokens.Color.Text,
                        BorderSizePixel = 0,
                    }, {
                        UICorner = React.createElement("UICorner", {
                            CornerRadius = UDim.new(1, 0)
                        })
                    })
                })
            })
        })
    end
    
    return HyperToggle
end

_modules["components/Elements/HyperTooltip"] = function()
    --[[
        HyperUI v2 - HyperTooltip Element
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    local useSpring = _require("hooks/useSpring")
    
    local function HyperTooltip(props)
        local visible = props.Visible or false
        local opacity = useSpring(visible and 1 or 0, { damping = 0.8, stiffness = 0.2 })
        
        return React.createElement("Frame", {
            Size = UDim2.fromScale(0, 0),
            AutomaticSize = Enum.AutomaticSize.XY,
            BackgroundColor3 = Tokens.Color.Background,
            BackgroundTransparency = opacity:map(function(v) return 1 - (v * 0.9) end),
            Position = props.Position or UDim2.fromScale(0.5, 0),
            AnchorPoint = Vector2.new(0.5, 1.2),
            ZIndex = 1000,
        }, {
            UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
            UIStroke = React.createElement("UIStroke", {
                Color = Tokens.Color.Border,
                Transparency = opacity:map(function(v) return 1 - v end),
            }),
            Padding = React.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 4),
                PaddingBottom = UDim.new(0, 4),
                PaddingLeft = UDim.new(0, 8),
                PaddingRight = UDim.new(0, 8),
            }),
            Label = React.createElement("TextLabel", {
                Size = UDim2.fromScale(0, 0),
                AutomaticSize = Enum.AutomaticSize.XY,
                BackgroundTransparency = 1,
                Text = props.Text or "Tooltip",
                TextColor3 = Tokens.Color.Text,
                TextTransparency = opacity:map(function(v) return 1 - v end),
                Font = Tokens.Font.Main,
                TextSize = Tokens.FontSize.Small,
            })
        })
    end
    
    return HyperTooltip
end

_modules["components/Elements/HyperColorPicker/ColorPreview"] = function()
    --[[
        HyperUI v2 - ColorPicker Preview
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    
    local function ColorPreview(props)
        return React.createElement("Frame", {
            Size = UDim2.fromOffset(24, 24),
            Position = UDim2.new(1, -24, 0.5, -12),
            BackgroundColor3 = props.Color or Color3.new(1, 1, 1),
            BorderSizePixel = 0,
            ZIndex = 5,
        }, {
            UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
            UIStroke = React.createElement("UIStroke", { Color = Tokens.Color.Border, Thickness = 2 })
        })
    end
    
    return ColorPreview
end

_modules["components/Elements/HyperColorPicker/HueSlider"] = function()
    --[[
        HyperUI v2 - ColorPicker Hue Slider
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    
    local function HueSlider(props)
        return React.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 12),
            BorderSizePixel = 0,
            LayoutOrder = 2,
        }, {
            UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
            Gradient = React.createElement("UIGradient", {
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromHSV(0, 1, 1)),
                    ColorSequenceKeypoint.new(0.16, Color3.fromHSV(0.16, 1, 1)),
                    ColorSequenceKeypoint.new(0.33, Color3.fromHSV(0.33, 1, 1)),
                    ColorSequenceKeypoint.new(0.5, Color3.fromHSV(0.5, 1, 1)),
                    ColorSequenceKeypoint.new(0.66, Color3.fromHSV(0.66, 1, 1)),
                    ColorSequenceKeypoint.new(0.83, Color3.fromHSV(0.83, 1, 1)),
                    ColorSequenceKeypoint.new(1, Color3.fromHSV(1, 1, 1)),
                })
            }),
            Handle = React.createElement("Frame", {
                Size = UDim2.fromOffset(16, 16),
                Position = UDim2.new(props.Hue, 0, 0.5, 0),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Tokens.Color.Text,
                BorderSizePixel = 0,
            }, {
                UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
                UIStroke = React.createElement("UIStroke", { Thickness = 2, Color = Tokens.Color.Background })
            }),
            Trigger = React.createElement("TextButton", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
                Text = "",
                [React.Event.MouseButton1Down] = function(rbx)
                    local function update()
                        local pos = (game:GetService("UserInputService"):GetMouseLocation().X - rbx.AbsolutePosition.X) / rbx.AbsoluteSize.X
                        props.OnChanged(math.clamp(pos, 0, 1))
                    end
                    update()
                end
            })
        })
    end
    
    return HueSlider
end

_modules["components/Elements/HyperColorPicker"] = function()
    --[[
        HyperUI v2 - HyperColorPicker Root
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    local BaseElement = _require("components/BaseElement")
    
    local HueSlider = _require("components/Elements/HueSlider")
    local SaturationSquare = _require("components/Elements/SaturationSquare")
    local ColorPreview = _require("components/Elements/ColorPreview")
    
    local function HyperColorPicker(props)
        local isOpen, setOpen = React.useState(false)
        local h, s, v = Color3.toHSV(props.Value or Color3.new(1, 1, 1))
        
        local function updateColor(newH, newS, newV)
            if props.Callback then
                props.Callback(Color3.fromHSV(newH or h, newS or s, newV or v))
            end
        end
        
        return React.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            LayoutOrder = props.LayoutOrder,
            ZIndex = isOpen and 100 or 1,
        }, {
            Layout = React.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4) }),
            Trigger = React.createElement(BaseElement, {
                OnActivated = function() setOpen(not isOpen) end,
            }, {
                Container = React.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1),
                    BackgroundTransparency = 1,
                }, {
                    Padding = React.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, Tokens.Spacing[3]),
                        PaddingRight = UDim.new(0, Tokens.Spacing[3]),
                    }),
                    Label = React.createElement("TextLabel", {
                        Size = UDim2.new(1, -60, 1, 0),
                        BackgroundTransparency = 1,
                        Text = props.Text or "Color Picker",
                        TextColor3 = Tokens.Color.Text,
                        Font = Tokens.Font.Main,
                        TextSize = Tokens.FontSize.Medium,
                        TextXAlignment = Enum.TextXAlignment.Left,
                    }),
                    Preview = React.createElement(ColorPreview, {
                        Color = props.Value or Color3.new(1, 1, 1)
                    })
                })
            }),
            Dropdown = isOpen and React.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 200),
                BackgroundColor3 = Tokens.Color.Surface,
                BorderSizePixel = 0,
            }, {
                UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(0, Tokens.Radius.Small) }),
                Padding = React.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 8),
                    PaddingBottom = UDim.new(0, 8),
                    PaddingLeft = UDim.new(0, 8),
                    PaddingRight = UDim.new(0, 8),
                }),
                Layout = React.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 8) }),
                SatVal = React.createElement(SaturationSquare, {
                    Hue = h,
                    Sat = s,
                    Val = v,
                    OnChanged = function(ns, nv) updateColor(nil, ns, nv) end
                }),
                Hue = React.createElement(HueSlider, {
                    Hue = h,
                    OnChanged = function(nh) updateColor(nh, nil, nil) end
                })
            })
        })
    end
    
    return HyperColorPicker
end

_modules["components/Elements/HyperColorPicker/SaturationSquare"] = function()
    --[[
        HyperUI v2 - ColorPicker Saturation Square
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    
    local function SaturationSquare(props)
        return React.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -20),
            BackgroundColor3 = Color3.fromHSV(props.Hue, 1, 1),
            BorderSizePixel = 0,
            LayoutOrder = 1,
        }, {
            UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(0, Tokens.Radius.Small) }),
            SatGradient = React.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BorderSizePixel = 0,
                BackgroundTransparency = 0,
            }, {
                Gradient = React.createElement("UIGradient", {
                    Transparency = NumberSequence.new(0, 1),
                    Color = ColorSequence.new(Color3.new(1, 1, 1)),
                    Rotation = 0,
                })
            }),
            ValGradient = React.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BorderSizePixel = 0,
                BackgroundTransparency = 0,
            }, {
                Gradient = React.createElement("UIGradient", {
                    Transparency = NumberSequence.new(0, 1),
                    Color = ColorSequence.new(Color3.new(0, 0, 0)),
                    Rotation = 90,
                })
            }),
            Handle = React.createElement("Frame", {
                Size = UDim2.fromOffset(12, 12),
                Position = UDim2.fromScale(props.Sat, 1 - props.Val),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Tokens.Color.Text,
                BorderSizePixel = 0,
            }, {
                UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
                UIStroke = React.createElement("UIStroke", { Thickness = 2, Color = Tokens.Color.Background })
            }),
            Trigger = React.createElement("TextButton", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
                Text = "",
                [React.Event.MouseButton1Down] = function(rbx)
                    local function update()
                        local mouse = game:GetService("UserInputService"):GetMouseLocation()
                        local relX = (mouse.X - rbx.AbsolutePosition.X) / rbx.AbsoluteSize.X
                        local relY = (mouse.Y - rbx.AbsolutePosition.Y) / rbx.AbsoluteSize.Y
                        props.OnChanged(math.clamp(relX, 0, 1), 1 - math.clamp(relY, 0, 1))
                    end
                    update()
                end
            })
        })
    end
    
    return SaturationSquare
end

_modules["components/Elements/HyperDropdown/DropdownList"] = function()
    --[[
        HyperUI v2 - Dropdown List
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    local VirtualList = _require("Containers/VirtualList")
    local DropdownOption = _require("components/Elements/HyperDropdown/DropdownOption")
    local DropdownSearch = _require("components/Elements/HyperDropdown/DropdownSearch")
    
    local function DropdownList(props)
        local searchQuery, setSearchQuery = React.useState("")
        
        local filteredOptions = {}
        for _, option in ipairs(props.Options or {}) do
            if string.find(string.lower(tostring(option)), string.lower(searchQuery)) then
                table.insert(filteredOptions, option)
            end
        end
        
        return React.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 200),
            BackgroundColor3 = Tokens.Color.Surface,
            BorderSizePixel = 0,
        }, {
            UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(0, Tokens.Radius.Small) }),
            Layout = React.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
            Search = React.createElement(DropdownSearch, {
                OnChanged = setSearchQuery
            }),
            List = React.createElement(VirtualList, {
                Size = UDim2.new(1, 0, 1, -32),
                Items = filteredOptions,
                ItemHeight = 32,
                RenderItem = function(option)
                    local isSelected = false
                    if type(props.Selected) == "table" then
                        isSelected = table.find(props.Selected, option) ~= nil
                    else
                        isSelected = props.Selected == option
                    end
                    
                    return React.createElement(DropdownOption, {
                        Text = tostring(option),
                        Selected = isSelected,
                        OnSelect = function() props.OnSelect(option) end
                    })
                end
            })
        })
    end
    
    return DropdownList
end

_modules["components/Elements/HyperDropdown/DropdownOption"] = function()
    --[[
        HyperUI v2 - Dropdown Option
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    local BaseElement = _require("components/BaseElement")
    
    local function DropdownOption(props)
        return React.createElement(BaseElement, {
            BackgroundTransparency = 1,
            OnActivated = props.OnSelect,
        }, {
            Container = React.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = React.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, Tokens.Spacing[3]),
                }),
                Label = React.createElement("TextLabel", {
                    Size = UDim2.fromScale(1, 1),
                    BackgroundTransparency = 1,
                    Text = props.Text,
                    TextColor3 = props.Selected and Tokens.Color.Accent or Tokens.Color.Text,
                    Font = props.Selected and Tokens.Font.Bold or Tokens.Font.Main,
                    TextSize = Tokens.FontSize.Small,
                    TextXAlignment = Enum.TextXAlignment.Left,
                })
            })
        })
    end
    
    return DropdownOption
end

_modules["components/Elements/HyperDropdown/DropdownSearch"] = function()
    --[[
        HyperUI v2 - Dropdown Search
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    
    local function DropdownSearch(props)
        return React.createElement("TextBox", {
            Size = UDim2.new(1, 0, 0, 32),
            BackgroundColor3 = Tokens.Color.Background,
            BackgroundTransparency = 0.5,
            BorderSizePixel = 0,
            PlaceholderText = "Search...",
            PlaceholderColor3 = Tokens.Color.TextMuted,
            Text = "",
            TextColor3 = Tokens.Color.Text,
            Font = Tokens.Font.Main,
            TextSize = Tokens.FontSize.Small,
            ClearTextOnFocus = false,
            [React.Change.Text] = function(rbx)
                props.OnChanged(rbx.Text)
            end,
        }, {
            UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(0, Tokens.Radius.Small) }),
            Padding = React.createElement("UIPadding", { PaddingLeft = UDim.new(0, 8) }),
        })
    end
    
    return DropdownSearch
end

_modules["components/Elements/HyperDropdown/DropdownTrigger"] = function()
    --[[
        HyperUI v2 - Dropdown Trigger
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    local BaseElement = _require("components/BaseElement")
    local useSpring = _require("hooks/useSpring")
    
    local function DropdownTrigger(props)
        local arrowRotation = useSpring(props.Open and 180 or 0, { damping = 0.8, stiffness = 0.2 })
        
        local valueText = "Select Option..."
        if props.Value then
            if type(props.Value) == "table" then
                valueText = #props.Value .. " selected"
            else
                valueText = tostring(props.Value)
            end
        end
        
        return React.createElement(BaseElement, {
            OnActivated = props.OnToggle,
        }, {
            Container = React.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = React.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, Tokens.Spacing[3]),
                    PaddingRight = UDim.new(0, Tokens.Spacing[3]),
                }),
                Label = React.createElement("TextLabel", {
                    Size = UDim2.new(1, -60, 1, 0),
                    BackgroundTransparency = 1,
                    Text = props.Text or "Dropdown",
                    TextColor3 = Tokens.Color.Text,
                    Font = Tokens.Font.Main,
                    TextSize = Tokens.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                Value = React.createElement("TextLabel", {
                    Size = UDim2.new(1, -60, 1, 0),
                    BackgroundTransparency = 1,
                    Text = valueText,
                    TextColor3 = Tokens.Color.TextMuted,
                    Font = Tokens.Font.Main,
                    TextSize = Tokens.FontSize.Small,
                    TextXAlignment = Enum.TextXAlignment.Right,
                    ZIndex = 4,
                }),
                Arrow = React.createElement("ImageLabel", {
                    Size = UDim2.fromOffset(16, 16),
                    Position = UDim2.new(1, -16, 0.5, -8),
                    BackgroundTransparency = 1,
                    Image = "rbxassetid://10723346959", -- Arrow icon
                    ImageColor3 = Tokens.Color.TextMuted,
                    Rotation = arrowRotation,
                })
            })
        })
    end
    
    return DropdownTrigger
end

_modules["components/Elements/HyperDropdown"] = function()
    --[[
        HyperUI v2 - HyperDropdown Root
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    
    local DropdownTrigger = _require("components/Elements/DropdownTrigger")
    local DropdownList = _require("components/Elements/DropdownList")
    
    local function HyperDropdown(props)
        local isOpen, setOpen = React.useState(false)
        
        return React.createElement("Frame", {
            Size = props.Size or UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            LayoutOrder = props.LayoutOrder,
            ZIndex = isOpen and 100 or 1,
        }, {
            Layout = React.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 4),
            }),
            Trigger = React.createElement(DropdownTrigger, {
                Text = props.Text,
                Value = props.Value,
                Open = isOpen,
                OnToggle = function() setOpen(not isOpen) end,
            }),
            List = isOpen and React.createElement(DropdownList, {
                Options = props.Options,
                Selected = props.Value,
                Multi = props.Multi,
                OnSelect = function(val)
                    if not props.Multi then setOpen(false) end
                    if props.Callback then props.Callback(val) end
                end,
            })
        })
    end
    
    return HyperDropdown
end

_modules["components/Window"] = function()
    --[[
        HyperUI v2 - Window Component
        The main container for all scripts.
    ]]
    
    local React = _require("dependencies/React")
    local useTree = _require("hooks/useTree")
    local useSpring = _require("hooks/useSpring")
    local Tokens = _require("theme/tokens")
    
    local TabContainer = _require("TabContainer") -- Will implement next
    
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
end

_modules["components/Window/TabContainer"] = function()
    --[[
        HyperUI v2 - TabContainer Component
        Manages tab navigation and content visibility.
    ]]
    
    local React = _require("dependencies/React")
    local Tokens = _require("theme/tokens")
    local useTree = _require("hooks/useTree")
    
    local Section = _require("Containers/Section") -- Will implement next
    
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
end

_modules["core/config"] = function()
    --[[
        HyperUI v2 - Configuration & Persistence
        Handles saving and loading UI state to the filesystem.
    ]]
    
    local HttpService = game:GetService("HttpService")
    
    local ConfigSystem = {}
    ConfigSystem.__index = ConfigSystem
    
    function ConfigSystem.new(store, options)
        local self = setmetatable({
            Store = store,
            FileName = options.FileName or "HyperUI_Config.json",
            AutoSave = options.AutoSave ~= false,
            Data = {},
        }, ConfigSystem)
        
        return self
    end
    
    function ConfigSystem:Save(name)
        local success, err = pcall(function()
            local content = HttpService:JSONEncode(self.Data)
            writefile(self.FileName, content)
        end)
        
        if not success then
            warn("[HyperUI] Failed to save config:", err)
        end
        return success
    end
    
    function ConfigSystem:Load()
        if not isfile(self.FileName) then return false end
        
        local success, result = pcall(function()
            local content = readfile(self.FileName)
            return HttpService:JSONDecode(content)
        end)
        
        if success and type(result) == "table" then
            self.Data = result
            -- Apply loaded data to store
            for id, props in pairs(self.Data) do
                self.Store:Dispatch({
                    type = "UPDATE_ELEMENT",
                    id = id,
                    props = props
                })
            end
            return true
        end
        
        return false
    end
    
    function ConfigSystem:UpdateValue(id, key, value)
        if not self.Data[id] then
            self.Data[id] = {}
        end
        self.Data[id][key] = value
        
        if self.AutoSave then
            self:Save()
        end
    end
    
    return ConfigSystem
end

_modules["core/signal/Signal"] = function()
    --[[
        HyperUI v2 - Signal System
        A lightweight, fast signal implementation for internal events.
    ]]
    
    local Signal = {}
    Signal.__index = Signal
    
    function Signal.new()
        return setmetatable({
            _listeners = {}
        }, Signal)
    end
    
    function Signal:Connect(callback)
        local listener = {
            callback = callback,
            connected = true
        }
        
        function listener:Disconnect()
            listener.connected = false
        end
        
        table.insert(self._listeners, listener)
        return listener
    end
    
    function Signal:Fire(...)
        local listeners = self._listeners
        local i = 1
        
        while i <= #listeners do
            local listener = listeners[i]
            if listener.connected then
                task.spawn(listener.callback, ...)
                i = i + 1
            else
                table.remove(listeners, i)
            end
        end
    end
    
    function Signal:Wait()
        local thread = coroutine.running()
        local connection
        connection = self:Connect(function(...)
            connection:Disconnect()
            coroutine.resume(thread, ...)
        end)
        return coroutine.yield()
    end
    
    function Signal:Destroy()
        for _, listener in ipairs(self._listeners) do
            listener.connected = false
        end
        self._listeners = {}
    end
    
    return Signal
end

_modules["core/store"] = function()
    --[[
        HyperUI v2 - State Store
        A lightweight Rodux-inspired state container for the UI Tree.
        Optimized for selective subscriptions to prevent global re-renders.
    ]]
    
    local Store = {}
    Store.__index = Store
    
    function Store.new()
        local self = setmetatable({
            _state = {
                windows = {},
                notifications = {},
                theme = "Dark",
                registry = {}, -- nodeId -> { type, props, children, parentId }
            },
            _listeners = {},
            _subscribers = {}, -- nodeId -> { list of callbacks }
        }, Store)
        
        return self
    end
    
    function Store:GetState()
        return self._state
    end
    
    -- Deep clone for immutability
    local function DeepCopy(t)
        local copy = {}
        for k, v in pairs(t) do
            if type(v) == "table" then
                copy[k] = DeepCopy(v)
            else
                copy[k] = v
            end
        end
        return copy
    end
    
    function Store:Dispatch(action)
        local oldState = self._state
        local newState = DeepCopy(oldState)
        
        local changedNodes = {} -- Track which node IDs changed
        
        if action.type == "ADD_WINDOW" then
            local window = action.window
            newState.windows[window.id] = window
            newState.registry[window.id] = {
                type = "Window",
                props = window,
                children = {},
            }
        elseif action.type == "UPDATE_ELEMENT" then
            local node = newState.registry[action.id]
            if node then
                for k, v in pairs(action.props) do
                    node.props[k] = v
                end
                table.insert(changedNodes, action.id)
            end
        elseif action.type == "ADD_TAB" then
            local window = newState.registry[action.windowId]
            if window then
                newState.registry[action.tab.id] = {
                    type = "Tab",
                    props = action.tab,
                    children = {},
                    parentId = action.windowId,
                }
                table.insert(window.children, action.tab.id)
                table.insert(changedNodes, action.windowId)
            end
        elseif action.type == "ADD_SECTION" then
            local tab = newState.registry[action.tabId]
            if tab then
                newState.registry[action.section.id] = {
                    type = "Section",
                    props = action.section,
                    children = {},
                    parentId = action.tabId,
                }
                table.insert(tab.children, action.section.id)
                table.insert(changedNodes, action.tabId)
            end
        elseif action.type == "ADD_ELEMENT" then
            local parent = newState.registry[action.parentId]
            if parent then
                newState.registry[action.element.id] = {
                    type = action.element.type,
                    props = action.element.props,
                    children = {},
                    parentId = action.parentId,
                }
                table.insert(parent.children, action.element.id)
                table.insert(changedNodes, action.parentId)
            end
        elseif action.type == "SET_THEME" then
            newState.theme = action.theme
        end
        
        self._state = newState
        
        -- Global listeners
        for _, listener in ipairs(self._listeners) do
            task.spawn(listener, newState, oldState)
        end
        
        -- Specific node subscribers
        for _, nodeId in ipairs(changedNodes) do
            if self._subscribers[nodeId] then
                for _, callback in ipairs(self._subscribers[nodeId]) do
                    task.spawn(callback, newState.registry[nodeId])
                end
            end
        end
    end
    
    function Store:Subscribe(nodeId, callback)
        if not self._subscribers[nodeId] then
            self._subscribers[nodeId] = {}
        end
        table.insert(self._subscribers[nodeId], callback)
        
        return function()
            local list = self._subscribers[nodeId]
            if list then
                local index = table.find(list, callback)
                if index then
                    table.remove(list, index)
                end
            end
        end
    end
    
    function Store:OnUpdate(callback)
        table.insert(self._listeners, callback)
        return function()
            local index = table.find(self._listeners, callback)
            if index then
                table.remove(self._listeners, index)
            end
        end
    end
    
    function Store:Destroy()
        self._state = nil
        self._listeners = {}
        self._subscribers = {}
    end
    
    return Store
end

_modules["core/tree"] = function()
    --[[
        HyperUI v2 - UI Tree System
        Handles node hierarchy and relationship logic.
    ]]
    
    local Tree = {}
    
    function Tree.createNode(id, nodeType, props, parentId)
        return {
            id = id,
            type = nodeType,
            props = props or {},
            children = {},
            parentId = parentId,
            visible = true,
        }
    end
    
    -- Deep reconciliation helper for tree updates
    function Tree.reconcile(oldTree, newNodes)
        -- Tree reconciliation logic for optimized rendering
        -- This is consumed by the Store during Dispatch
    end
    
    return Tree
end

_modules["dependencies/React"] = function()
    -- Placeholder for React Luau
    return {}
end

_modules["dependencies/ReactRoblox"] = function()
    -- Placeholder for ReactRoblox
    return {}
end

_modules["hooks/useInteractionState"] = function()
    --[[
        HyperUI v2 - useInteractionState Hook
        Centralizes hover, press, and focus logic for all elements.
    ]]
    
    local React = _require("dependencies/React")
    
    local function useInteractionState(enabled)
        local isHovered, setHovered = React.useState(false)
        local isPressed, setPressed = React.useState(false)
        local isFocused, setFocused = React.useState(false)
        
        local eventBindings = {}
        
        if enabled ~= false then
            eventBindings = {
                [React.Event.MouseEnter] = function() setHovered(true) end,
                [React.Event.MouseLeave] = function() 
                    setHovered(false)
                    setPressed(false)
                end,
                [React.Event.MouseButton1Down] = function() setPressed(true) end,
                [React.Event.MouseButton1Up] = function() setPressed(false) end,
                [React.Event.Focused] = function() setFocused(true) end,
                [React.Event.FocusLost] = function() setFocused(false) end,
            }
        end
        
        return {
            hovered = isHovered,
            pressed = isPressed,
            focused = isFocused,
            bindings = eventBindings
        }
    end
    
    return useInteractionState
end

_modules["hooks/useSpring"] = function()
    --[[
        HyperUI v2 - useSpring Hook
        Lightweight spring animation engine.
    ]]
    
    local React = _require("dependencies/React")
    local RunService = game:GetService("RunService")
    
    local function lerp(a, b, t)
        return a + (b - a) * t
    end
    
    local function useSpring(targetValue, springConfig)
        local springConfig = springConfig or { stiffness = 170, damping = 26 }
        local currentValue, setCurrentValue = React.useState(targetValue)
        local velocity = React.useRef(0)
        
        React.useEffect(function()
            local connection
            local current = currentValue
            local vel = velocity.current
            
            connection = RunService.RenderStepped:Connect(function(dt)
                local displacement = current - targetValue
                local force = -springConfig.stiffness * displacement
                local dampingForce = -springConfig.damping * vel
                local acceleration = force + dampingForce
                
                vel = vel + acceleration * dt
                current = current + vel * dt
                
                setCurrentValue(current)
                velocity.current = vel
                
                -- Sleep check
                if math.abs(vel) < 0.001 and math.abs(current - targetValue) < 0.001 then
                    setCurrentValue(targetValue)
                    connection:Disconnect()
                end
            end)
            
            return function()
                if connection then connection:Disconnect() end
            end
        end, {targetValue})
        
        return currentValue
    end
    
    return useSpring
end

_modules["hooks/useTree"] = function()
    --[[
        HyperUI v2 - useTree Hook
        Selector-based hook for selective node subscriptions.
    ]]
    
    local React = _require("dependencies/React")
    
    local function useTree(store, nodeId)
        local node, setNode = React.useState(function()
            return store:GetState().registry[nodeId]
        end)
        
        React.useEffect(function()
            local unsubscribe = store:Subscribe(nodeId, function(newNode)
                setNode(newNode)
            end)
            
            return function()
                unsubscribe()
            end
        end, {store, nodeId})
        
        return node
    end
    
    return useTree
end

_modules["managers/FocusManager"] = function()
    --[[
        HyperUI v2 - Focus Manager
        Coordinates which element has active input focus.
    ]]
    
    local Signal = _require("core/signal/Signal")
    
    local FocusManager = {}
    FocusManager.__index = FocusManager
    
    function FocusManager.new(store)
        local self = setmetatable({
            Store = store,
            FocusedElement = nil,
            FocusChanged = Signal.new(),
        }, FocusManager)
        
        return self
    end
    
    function FocusManager:RequestFocus(elementId)
        if self.FocusedElement == elementId then return end
        
        local oldFocus = self.FocusedElement
        self.FocusedElement = elementId
        
        -- Notify store if needed for visual updates
        if oldFocus then
            self.Store:Dispatch({
                type = "UPDATE_ELEMENT",
                id = oldFocus,
                props = { focused = false }
            })
        end
        
        if elementId then
            self.Store:Dispatch({
                type = "UPDATE_ELEMENT",
                id = elementId,
                props = { focused = true }
            })
        end
        
        self.FocusChanged:Fire(elementId, oldFocus)
    end
    
    function FocusManager:ClearFocus()
        self:RequestFocus(nil)
    end
    
    function FocusManager:GetFocus()
        return self.FocusedElement
    end
    
    function FocusManager:Destroy()
        self.FocusChanged:Destroy()
    end
    
    return FocusManager
end

_modules["managers/NotificationManager"] = function()
    --[[
        HyperUI v2 - Notification Manager
        Handles toast stacking and dismissal.
    ]]
    
    local NotificationManager = {}
    NotificationManager.__index = NotificationManager
    
    function NotificationManager.new(store)
        local self = setmetatable({
            Store = store,
            Queue = {},
        }, NotificationManager)
        
        return self
    end
    
    function NotificationManager:Notify(config)
        local id = game:GetService("HttpService"):GenerateGUID(false)
        local notification = {
            id = id,
            title = config.Title or "Notification",
            content = config.Content or "",
            icon = config.Icon,
            duration = config.Duration or 5,
            priority = config.Priority or "Info", -- Info, Success, Warning, Error
            createdAt = os.clock(),
        }
        
        table.insert(self.Queue, notification)
        
        self.Store:Dispatch({
            type = "ADD_NOTIFICATION",
            notification = notification
        })
        
        -- Auto-dismiss timer
        task.delay(notification.duration, function()
            self:Dismiss(id)
        end)
        
        return id
    end
    
    function NotificationManager:Dismiss(id)
        local index = -1
        for i, notif in ipairs(self.Queue) do
            if notif.id == id then
                index = i
                break
            end
        end
        
        if index ~= -1 then
            table.remove(self.Queue, index)
            self.Store:Dispatch({
                type = "REMOVE_NOTIFICATION",
                id = id
            })
        end
    end
    
    return NotificationManager
end

_modules["managers/ThemeManager"] = function()
    --[[
        HyperUI v2 - Theme Manager
    ]]
    
    local ThemeManager = {}
    ThemeManager.__index = ThemeManager
    
    function ThemeManager.new(store)
        local self = setmetatable({
            Store = store,
        }, ThemeManager)
        
        return self
    end
    
    function ThemeManager:SetTheme(themeName)
        self.Store:Dispatch({
            type = "SET_THEME",
            theme = themeName,
        })
    end
    
    return ThemeManager
end

_modules["managers/WindowManager"] = function()
    --[[
        HyperUI v2 - Window Manager
        Handles window focus, layering, and dragging.
    ]]
    
    local WindowManager = {}
    WindowManager.__index = WindowManager
    
    function WindowManager.new(store)
        local self = setmetatable({
            Store = store,
            Windows = {}, -- List of windowIds in focus order
        }, WindowManager)
        
        return self
    end
    
    function WindowManager:FocusWindow(windowId)
        local index = table.find(self.Windows, windowId)
        if index then
            table.remove(self.Windows, index)
        end
        table.insert(self.Windows, windowId)
        
        -- Update focus state in store for all windows
        for i, id in ipairs(self.Windows) do
            self.Store:Dispatch({
                type = "UPDATE_ELEMENT",
                id = id,
                props = { 
                    zIndex = i,
                    focused = (id == windowId)
                }
            })
        end
    end
    
    function WindowManager:RegisterWindow(windowId)
        table.insert(self.Windows, windowId)
        self:FocusWindow(windowId)
    end
    
    function WindowManager:UnregisterWindow(windowId)
        local index = table.find(self.Windows, windowId)
        if index then
            table.remove(self.Windows, index)
        end
    end
    
    return WindowManager
end

_modules["runtime/input"] = function()
    --[[
        HyperUI v2 - Input Manager
        Centralizes global input handling to avoid per-component connections.
    ]]
    
    local UserInputService = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    
    local InputManager = {}
    InputManager.__index = InputManager
    
    function InputManager.new(store)
        local self = setmetatable({
            Store = store,
            DraggingInstance = nil,
            DragOffset = nil,
            Connections = {},
        }, InputManager)
        
        self:Initialize()
        return self
    end
    
    function InputManager:Initialize()
        table.insert(self.Connections, UserInputService.InputBegan:Connect(function(input, processed)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                self:HandleDragBegan(input)
            end
        end))
        
        table.insert(self.Connections, UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                self:HandleDragEnded()
            end
        end))
        
        table.insert(self.Connections, RunService.RenderStepped:Connect(function()
            self:UpdateDragging()
        end))
    end
    
    function InputManager:HandleDragBegan(input)
        -- This logic will coordinate with WindowManager to find the relevant window under cursor
    end
    
    function InputManager:HandleDragEnded()
        self.DraggingInstance = nil
        self.DragOffset = nil
    end
    
    function InputManager:UpdateDragging()
        if self.DraggingInstance and self.DragOffset then
            local mousePos = UserInputService:GetMouseLocation()
            -- Update position in store or directly (for performance)
        end
    end
    
    function InputManager:Destroy()
        for _, conn in ipairs(self.Connections) do
            conn:Disconnect()
        end
        self.Connections = {}
    end
    
    return InputManager
end

_modules["runtime/mount"] = function()
    --[[
        HyperUI v2 - Mounting & Protection System
        Handles ScreenGui creation, protection, and React root initialization.
    ]]
    
    local Mount = {}
    Mount.__index = Mount
    
    local Players = game:GetService("Players")
    local CoreGui = game:GetService("CoreGui")
    
    local LocalPlayer = Players.LocalPlayer
    while not LocalPlayer do
        Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
        LocalPlayer = Players.LocalPlayer
    end
    
    function Mount.new(store)
        local self = setmetatable({
            Store = store,
            Container = nil,
        }, Mount)
        
        self:CreateContainer()
        return self
    end
    
    function Mount:CreateContainer()
        -- Protection Hierarchy
        -- 1. gethui()
        -- 2. protect_gui()
        -- 3. CoreGui
        -- 4. PlayerGui (Fallback)
        
        local guiParent
        local gethui = getgenv and getgenv().gethui
        local protect_gui = getgenv and (getgenv().protect_gui or (getgenv().syn and getgenv().syn.protect_gui))
        
        if gethui then
            guiParent = gethui()
        elseif CoreGui then
            -- Attempt to use CoreGui if possible (usually works in executors)
            local success = pcall(function()
                local test = Instance.new("Frame")
                test.Parent = CoreGui
                test:Destroy()
            end)
            if success then
                guiParent = CoreGui
            end
        end
        
        if not guiParent then
            guiParent = LocalPlayer:WaitForChild("PlayerGui")
        end
        
        local screenGui = Instance.new("ScreenGui")
        screenGui.Name = "HyperUI_" .. game:GetService("HttpService"):GenerateGUID(false):sub(1, 8)
        screenGui.ResetOnSpawn = false
        screenGui.IgnoreGuiInset = true
        screenGui.DisplayOrder = 100
        
        if protect_gui then
            pcall(protect_gui, screenGui)
        end
        
        screenGui.Parent = guiParent
        self.Container = screenGui
        
        -- Initialize React Root (Conceptual - placeholder for actual React call)
        -- This will be linked to components/Root.lua in the final bundle
        -- local root = ReactRoblox.createRoot(screenGui)
        -- root:render(React.createElement(App, { store = self.Store }))
        -- self.Root = root
    end
    
    function Mount:Unmount()
        if self.Root then
            -- pcall(function() self.Root:unmount() end)
        end
        if self.Container then
            self.Container:Destroy()
        end
    end
    
    return Mount
end

_modules["theme/palette"] = function()
    --[[
        HyperUI v2 - Color Palette
        Curated color sets for a premium look.
    ]]
    
    local Palette = {
        Slate = {
            [50] = Color3.fromHex("#f8fafc"),
            [100] = Color3.fromHex("#f1f5f9"),
            [200] = Color3.fromHex("#e2e8f0"),
            [300] = Color3.fromHex("#cbd5e1"),
            [400] = Color3.fromHex("#94a3b8"),
            [500] = Color3.fromHex("#64748b"),
            [600] = Color3.fromHex("#475569"),
            [700] = Color3.fromHex("#334155"),
            [800] = Color3.fromHex("#1e293b"),
            [900] = Color3.fromHex("#0f172a"),
            [950] = Color3.fromHex("#020617"),
        },
        Blue = {
            [500] = Color3.fromHex("#3b82f6"),
            [600] = Color3.fromHex("#2563eb"),
        },
        Emerald = {
            [500] = Color3.fromHex("#10b981"),
        },
        Rose = {
            [500] = Color3.fromHex("#f43f5e"),
        },
        Transparent = Color3.fromHex("#000000"),
    }
    
    return Palette
end

_modules["theme/shadows"] = function()
    --[[
        HyperUI v2 - Shadow Tokens
        Standardized elevation and depth tokens.
    ]]
    
    local Shadows = {
        Small = {
            Color = Color3.new(0, 0, 0),
            Transparency = 0.8,
            Thickness = 1,
        },
        Medium = {
            Color = Color3.new(0, 0, 0),
            Transparency = 0.6,
            Thickness = 2,
        },
        Large = {
            Color = Color3.new(0, 0, 0),
            Transparency = 0.4,
            Thickness = 4,
        }
    }
    
    return Shadows
end

_modules["theme/tokens"] = function()
    --[[
        HyperUI v2 - Design Tokens
        Semantic mapping for the visual system.
    ]]
    
    local Palette = _require("palette")
    local Typography = _require("typography")
    local Shadows = _require("shadows")
    
    local Tokens = {
        Color = {
            Background = Palette.Slate[950],
            Surface = Palette.Slate[900],
            Border = Palette.Slate[800],
            Text = Palette.Slate[100],
            TextMuted = Palette.Slate[400],
            Accent = Palette.Blue[500],
            Success = Palette.Emerald[500],
            Error = Palette.Rose[500],
        },
        Spacing = {
            [1] = 4,
            [2] = 8,
            [3] = 12,
            [4] = 16,
            [6] = 24,
            [8] = 32,
        },
        Radius = {
            Small = 4,
            Medium = 8,
            Large = 12,
            Full = 999,
        },
        Typography = Typography,
        Shadows = Shadows,
        
        -- Legacy Aliases for compatibility
        Font = Typography.Font,
        FontSize = Typography.Size,
    }
    
    return Tokens
end

_modules["theme/typography"] = function()
    --[[
        HyperUI v2 - Typography Tokens
    ]]
    
    local Typography = {
        Font = {
            Main = Enum.Font.BuilderSans,
            Bold = Enum.Font.BuilderSansExtraBold,
            Medium = Enum.Font.BuilderSansMedium,
            Mono = Enum.Font.RobotoMono,
        },
        Size = {
            Small = 12,
            Base = 14,
            Medium = 16,
            Large = 18,
            Title = 24,
        },
        Weight = {
            Light = Enum.FontWeight.Light,
            Regular = Enum.FontWeight.Regular,
            Medium = Enum.FontWeight.Medium,
            SemiBold = Enum.FontWeight.SemiBold,
            Bold = Enum.FontWeight.Bold,
            ExtraBold = Enum.FontWeight.Heavy,
        }
    }
    
    return Typography
end


local _cache = {}

local function _require(name)
    if _cache[name] then return _cache[name] end
    local module = _modules[name]
    if not module then error("Module not found: " .. tostring(name)) end
    local result = module()
    _cache[name] = result
    return result
end

-- Override global require inside the bundled environment
local require = _require

return _require('main')
