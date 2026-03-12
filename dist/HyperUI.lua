-- HyperUI Framework
-- Version: 2.0.0
-- Build Date: 2026-03-11 21:33:45
-- Distribution: Single File

local _modules = {}
local _cache = {}
local _require
_modules["api"] = function()
    
    
    
    
    
    return {
        Window = _require("api/Window"),
        Tab = _require("api/Tab"),
        Section = _require("api/Section"),
        Element = _require("api/Element"),
    }
end

_modules["api/Element"] = function()
    
    
    
    
    local a = {}
    a.__index = a
    
    function a.new(b, c)
        return setmetatable({
            Id = b,
            Store = c,
        }, a)
    end
    
    function a:SetTitle(b)
        self.Store:Dispatch({
            type = "UPDATE_ELEMENT",
            id = self.Id,
            props = { text = b }
        })
    end
    
    function a:SetValue(b)
        self.Store:Dispatch({
            type = "UPDATE_ELEMENT",
            id = self.Id,
            props = { value = b }
        })
    end
    
    function a:SetVisible(b)
        self.Store:Dispatch({
            type = "UPDATE_ELEMENT",
            id = self.Id,
            props = { visible = b }
        })
    end
    
    return a
end

_modules["api/Section"] = function()
    
    
    
    
    local a = {}
    a.__index = a
    
    local b = _require("api/Element")
    
    function a.new(c, d, e, f)
        local g = setmetatable({
            Id = c,
            TabId = d,
            WindowId = e,
            Store = f,
        }, a)
        
        return g
    end
    
    local function CreateElement(c, d, e)
        local f = game:GetService("HttpService"):GenerateGUID(false)
        
        c.Store:Dispatch({
            type = "ADD_ELEMENT",
            parentId = c.Id,
            element = {
                id = f,
                type = d,
                props = e,
            }
        })
        
        return b.new(f, c.Store)
    end
    
    function a:CreateButton(c)
        return CreateElement(self, "Button", c)
    end
    
    function a:CreateIconButton(c)
        return CreateElement(self, "IconButton", c)
    end
    
    function a:CreateToggle(c)
        return CreateElement(self, "Toggle", c)
    end
    
    function a:CreateCheckbox(c)
        return CreateElement(self, "Checkbox", c)
    end
    
    function a:CreateSlider(c)
        return CreateElement(self, "Slider", c)
    end
    
    function a:CreateDropdown(c)
        return CreateElement(self, "Dropdown", c)
    end
    
    function a:CreateMultiDropdown(c)
        c.Multi = true
        return CreateElement(self, "Dropdown", c)
    end
    
    function a:CreateKeybind(c)
        return CreateElement(self, "Keybind", c)
    end
    
    function a:CreateInput(c)
        return CreateElement(self, "Input", c)
    end
    
    function a:CreateNumberInput(c)
        return CreateElement(self, "NumberInput", c)
    end
    
    function a:CreateSearchInput(c)
        return CreateElement(self, "SearchInput", c)
    end
    
    function a:CreateTextArea(c)
        return CreateElement(self, "TextArea", c)
    end
    
    function a:CreateLabel(c)
        return CreateElement(self, "Label", c)
    end
    
    function a:CreateBadge(c)
        return CreateElement(self, "Badge", c)
    end
    
    function a:CreateIcon(c)
        return CreateElement(self, "Icon", c)
    end
    
    function a:CreateProgressBar(c)
        return CreateElement(self, "ProgressBar", c)
    end
    
    function a:CreateComboBox(c)
        return CreateElement(self, "ComboBox", c)
    end
    
    function a:CreateAvatar(c)
        return CreateElement(self, "Avatar", c)
    end
    
    function a:CreateDivider(c)
        return CreateElement(self, "Divider", c or {})
    end
    
    function a:CreateSpacer(c)
        return CreateElement(self, "Spacer", { Height = c })
    end
    
    function a:CreateAccordion(c)
        return CreateElement(self, "Accordion", c)
    end
    
    function a:CreateCollapsible(c)
        return CreateElement(self, "Collapsible", c)
    end
    
    function a:CreateCopyButton(c)
        return CreateElement(self, "CopyButton", c)
    end
    
    function a:CreateTag(c)
        return CreateElement(self, "Tag", c)
    end
    
    function a:CreateStatusIndicator(c)
        return CreateElement(self, "StatusIndicator", c)
    end
    
    function a:CreateGrid(c)
        return CreateElement(self, "Grid", c)
    end
    
    function a:CreateStack(c)
        return CreateElement(self, "Stack", c)
    end
    
    function a:CreateVirtualList(c)
        return CreateElement(self, "VirtualList", c)
    end
    
    return a
end

_modules["api/Tab"] = function()
    
    
    
    
    local a = _require("api/Section")
    local b = {}
    b.__index = b
    
    function b.new(c, d, e)
        return setmetatable({
            Id = c,
            WindowId = d,
            Store = e,
        }, b)
    end
    
    function b:CreateSection(c)
        local d = game:GetService("HttpService"):GenerateGUID(false)
        
        self.Store:Dispatch({
            type = "ADD_SECTION",
            tabId = self.Id,
            section = {
                id = d,
                title = c.Title or "New Section",
            }
        })
        
        return a.new(d, self.Id, self.WindowId, self.Store)
    end
    
    return b
end

_modules["api/Window"] = function()
    
    
    
    
    local a = _require("api/Tab")
    local b = {}
    b.__index = b
    
    function b.new(c, d)
        return setmetatable({
            Id = c,
            Store = d,
        }, b)
    end
    
    function b:CreateTab(c)
        local d = game:GetService("HttpService"):GenerateGUID(false)
        
        self.Store:Dispatch({
            type = "ADD_TAB",
            windowId = self.Id,
            tab = {
                id = d,
                title = c.Title or "New Tab",
                icon = c.Icon,
            }
        })
        
        return a.new(d, self.Id, self.Store)
    end
    
    function b:SetTitle(c)
        self.Store:Dispatch({
            type = "UPDATE_ELEMENT",
            id = self.Id,
            props = { title = c }
        })
    end
    
    function b:Close()
        self.Store:Dispatch({
            type = "UPDATE_ELEMENT",
            id = self.Id,
            props = { visible = false }
        })
    end
    
    return b
end

_modules["components/Containers/ElementList"] = function()
    
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    
    local function ElementList(c)
        return a.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            LayoutOrder = c.LayoutOrder,
        }, {
            Layout = a.createElement("UIListLayout", {
                Padding = UDim.new(0, b.Spacing[2]),
                SortOrder = Enum.SortOrder.LayoutOrder,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
            }),
            Padding = a.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, b.Spacing[2]),
                PaddingRight = UDim.new(0, b.Spacing[2]),
            }),
            Elements = a.createElement(a.Fragment, {}, c.children)
        })
    end
    
    return ElementList
end

_modules["components/Containers/Grid"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    
    local function Grid(b)
        return a.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            LayoutOrder = b.LayoutOrder,
        }, {
            Layout = a.createElement("UIGridLayout", {
                CellSize = b.CellSize or UDim2.fromOffset(100, 100),
                CellPadding = b.CellPadding or UDim2.fromOffset(8, 8),
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
            Children = a.createElement(a.Fragment, {}, b.children)
        })
    end
    
    return Grid
end

_modules["components/Containers/Section"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("hooks/useTree")
    local d = _require("components/Containers/ElementList")
    
    
    local e = {
        Button = _require("components/Elements/HyperButton"),
        IconButton = _require("components/Elements/HyperIconButton"),
        Toggle = _require("components/Elements/HyperToggle"),
        Checkbox = _require("components/Elements/HyperCheckbox"),
        Slider = _require("components/Elements/HyperSlider"),
        Dropdown = _require("components/Elements/HyperDropdown"),
        Keybind = _require("components/Elements/HyperKeybind"),
        ColorPicker = _require("components/Elements/HyperColorPicker"),
        Input = _require("components/Elements/HyperInput"),
        NumberInput = _require("components/Elements/HyperNumberInput"),
        SearchInput = _require("components/Elements/HyperSearchInput"),
        TextArea = _require("components/Elements/HyperTextArea"),
        Label = _require("components/Elements/HyperLabel"),
        Badge = _require("components/Elements/HyperBadge"),
        Icon = _require("components/Elements/HyperIcon"),
        ProgressBar = _require("components/Elements/HyperProgressBar"),
        StatDisplay = _require("components/Elements/HyperStatDisplay"),
        ComboBox = _require("components/Elements/HyperComboBox"),
        Avatar = _require("components/Elements/HyperAvatar"),
        Divider = _require("components/Elements/HyperDivider"),
        Spacer = _require("components/Elements/HyperSpacer"),
        Accordion = _require("components/Elements/HyperAccordion"),
        Collapsible = _require("components/Elements/HyperCollapsible"),
        CopyButton = _require("components/Elements/HyperCopyButton"),
        Tag = _require("components/Elements/HyperTag"),
        StatusIndicator = _require("components/Elements/HyperStatusIndicator"),
        Grid = _require("components/Containers/Grid"),
        Stack = _require("components/Containers/Stack"),
        VirtualList = _require("components/Containers/VirtualList"),
    }
    
    local function Section(f)
        local g = c(f.store, f.id)
        if not g then return nil end
        
        local h = {}
        for i, j in ipairs(g.children) do
            local k = c(f.store, j)
            if k then
                local l = e[k.type]
                if l then
                    table.insert(h, a.createElement(l, {
                        key = j,
                        LayoutOrder = i,
                        
                        Text = k.props.text,
                        Value = k.props.value,
                        Options = k.props.options,
                        Min = k.props.min,
                        Max = k.props.max,
                        Icon = k.props.icon,
                        Disabled = k.props.disabled,
                        Callback = function(m)
                            
                            if k.type ~= "Button" and k.type ~= "IconButton" then
                                f.store:Dispatch({
                                    type = "UPDATE_ELEMENT",
                                    id = j,
                                    props = { value = m }
                                })
                            end
                            
                            if k.props.callback then
                                k.props.callback(m)
                            end
                        end
                    }))
                end
            end
        end
        
        return a.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            LayoutOrder = f.LayoutOrder,
        }, {
            Layout = a.createElement("UIListLayout", {
                Padding = UDim.new(0, b.Spacing[2]),
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
            Title = a.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 20),
                BackgroundTransparency = 1,
                Text = g.props.title:upper(),
                TextColor3 = b.Color.TextMuted,
                Font = b.Font.Bold,
                TextSize = b.FontSize.Small,
                TextXAlignment = Enum.TextXAlignment.Left,
            }, {
                Padding = a.createElement("UIPadding", { PaddingLeft = UDim.new(0, b.Spacing[2]) })
            }),
            Container = a.createElement(d, {}, h)
        })
    end
    
    return Section
end

_modules["components/Containers/Sidebar"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    
    local function Sidebar(c)
        return a.createElement("Frame", {
            Size = UDim2.new(0, 200, 1, 0),
            BackgroundColor3 = b.Color.Surface,
            BorderSizePixel = 0,
        }, {
            Layout = a.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 4),
            }),
            Padding = a.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 12),
                PaddingBottom = UDim.new(0, 12),
                PaddingLeft = UDim.new(0, 8),
                PaddingRight = UDim.new(0, 8),
            }),
            Items = a.createElement(a.Fragment, {}, c.children)
        })
    end
    
    return Sidebar
end

_modules["components/Containers/Stack"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    
    local function Stack(b)
        return a.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            LayoutOrder = b.LayoutOrder,
        }, {
            Layout = a.createElement("UIListLayout", {
                FillDirection = b.FillDirection or Enum.FillDirection.Vertical,
                Padding = b.Padding or UDim.new(0, 8),
                HorizontalAlignment = b.HorizontalAlignment or Enum.HorizontalAlignment.Left,
                VerticalAlignment = b.VerticalAlignment or Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
            Children = a.createElement(a.Fragment, {}, b.children)
        })
    end
    
    return Stack
end

_modules["components/Containers/TabBar"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("hooks/useSpring")
    
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
end

_modules["components/Containers/VirtualList"] = function()
    
    
    
    
    
    local a = _require("dependencies/React")
    
    local function VirtualList(b)
        local c = b.Items or {}
        local d = b.ItemHeight or 32
        local e = b.Buffer or 5
        
        local f = a.useRef(nil)
        local g, h = a.useState(0)
        
        
        local i = math.ceil(400 / d) 
        local j = math.max(1, math.floor(g / d) - e)
        local k = math.min(#c, j + i + e * 2)
        
        local l = {}
        for m = j, k do
            local n = c[m]
            table.insert(l, a.createElement("Frame", {
                Key = m,
                Size = UDim2.new(1, 0, 0, d),
                Position = UDim2.fromOffset(0, (m - 1) * d),
                BackgroundTransparency = 1,
            }, {
                Content = b.RenderItem(n, m)
            }))
        end
        
        return a.createElement("ScrollingFrame", {
            Size = b.Size or UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
            CanvasSize = UDim2.new(0, 0, 0, #c * d),
            ScrollBarThickness = 2,
            [a.Change.CanvasPosition] = function(m)
                h(m.CanvasPosition.Y)
            end,
        }, l)
    end
    
    return VirtualList
end

_modules["components/Elements/BaseElement"] = function()
    
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("hooks/useInteractionState")
    
    local d = _require("hooks/useSpring")
    
    local function BaseElement(e)
        local f = c(not e.Disabled)
        
        
        local g = 1
        if not e.Disabled then
            if f.pressed then
                g = 0.95
            elseif f.hovered then
                g = 1.02
            end
        end
        
        local h = d(g, { damping = 0.8, stiffness = 0.2 })
        
        
        local i = e.Size or UDim2.new(1, 0, 0, 32)
        local j = e.BackgroundTransparency or 0
        local k = e.BackgroundColor or b.Color.Surface
        
        return a.createElement("Frame", {
            Size = i,
            BackgroundColor3 = k,
            BackgroundTransparency = j,
            BorderSizePixel = 0,
            LayoutOrder = e.LayoutOrder,
        }, {
            UIScale = a.createElement("UIScale", {
                Scale = h
            }),
            UICorner = a.createElement("UICorner", {
                CornerRadius = UDim.new(0, b.Radius.Small)
            }),
            UIStroke = a.createElement("UIStroke", {
                Color = b.Color.Border,
                Transparency = 0.5,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            }),
            Content = a.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
                ZIndex = 3,
            }, e.children),
            
            
            Trigger = a.createElement("TextButton", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
                Text = "",
                ZIndex = 10,
                [a.Event.Activated] = function()
                    if not e.Disabled and e.OnActivated then
                        e.OnActivated()
                    end
                end,
            }, f.bindings)
        })
    end
    
    return BaseElement
end

_modules["components/Elements/HyperAccordion"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("components/Elements/BaseElement")
    local d = _require("hooks/useSpring")
    
    local function HyperAccordion(e)
        local f, g = a.useState(false)
        local h = d(f and 180 or 0, { damping = 0.8, stiffness = 0.2 })
        
        return a.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            LayoutOrder = e.LayoutOrder,
        }, {
            Layout = a.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4) }),
            Header = a.createElement(c, {
                OnActivated = function() g(not f) end,
            }, {
                Container = a.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1),
                    BackgroundTransparency = 1,
                }, {
                    Padding = a.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, b.Spacing[3]),
                        PaddingRight = UDim.new(0, b.Spacing[3]),
                    }),
                    Title = a.createElement("TextLabel", {
                        Size = UDim2.new(1, -24, 1, 0),
                        BackgroundTransparency = 1,
                        Text = e.Title or "Accordion",
                        TextColor3 = b.Color.Text,
                        Font = b.Font.Bold,
                        TextSize = b.FontSize.Medium,
                        TextXAlignment = Enum.TextXAlignment.Left,
                    }),
                    Arrow = a.createElement("ImageLabel", {
                        Size = UDim2.fromOffset(16, 16),
                        Position = UDim2.new(1, -16, 0.5, -8),
                        BackgroundTransparency = 1,
                        Image = "rbxassetid://10723346959",
                        ImageColor3 = b.Color.TextMuted,
                        Rotation = h,
                    })
                })
            }),
            Content = f and a.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundTransparency = 1,
            }, {
                Padding = a.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 16),
                    PaddingRight = UDim.new(0, 4),
                }),
                Elements = a.createElement(a.Fragment, {}, e.children)
            })
        })
    end
    
    return HyperAccordion
end

_modules["components/Elements/HyperAvatar"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    
    local function HyperAvatar(c)
        local d = c.UserId or 1
        local e = c.Size or 48
        
        return a.createElement("ImageLabel", {
            Size = UDim2.fromOffset(e, e),
            BackgroundColor3 = b.Color.Surface,
            BorderSizePixel = 0,
            Image = "rbxthumb://type=AvatarHeadShot&id=" .. d .. "&w=150&h=150",
            LayoutOrder = c.LayoutOrder,
        }, {
            UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
            UIStroke = a.createElement("UIStroke", { Color = b.Color.Border, Thickness = 2 })
        })
    end
    
    return HyperAvatar
end

_modules["components/Elements/HyperBadge"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    
    local function HyperBadge(c)
        local d = c.Color or b.Color.Accent
        
        return a.createElement("Frame", {
            Size = UDim2.fromScale(0, 0),
            AutomaticSize = Enum.AutomaticSize.XY,
            BackgroundColor3 = d,
            BackgroundTransparency = 0.2,
            BorderSizePixel = 0,
            LayoutOrder = c.LayoutOrder,
        }, {
            UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
            Padding = a.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 2),
                PaddingBottom = UDim.new(0, 2),
                PaddingLeft = UDim.new(0, 6),
                PaddingRight = UDim.new(0, 6),
            }),
            Label = a.createElement("TextLabel", {
                Size = UDim2.fromScale(0, 0),
                AutomaticSize = Enum.AutomaticSize.XY,
                BackgroundTransparency = 1,
                Text = c.Text or "BADGE",
                TextColor3 = b.Color.Text,
                Font = b.Font.Bold,
                TextSize = 10,
            })
        })
    end
    
    return HyperBadge
end

_modules["components/Elements/HyperButton"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("components/Elements/BaseElement")
    
    local function HyperButton(d)
        return a.createElement(c, {
            Disabled = d.Disabled,
            OnActivated = d.Callback,
            LayoutOrder = d.LayoutOrder,
        }, {
            Label = a.createElement("TextLabel", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
                Text = d.Text or "Button",
                TextColor3 = b.Color.Text,
                Font = b.Font.Main,
                TextSize = b.FontSize.Medium,
                ZIndex = 5,
            })
        })
    end
    
    return HyperButton
end

_modules["components/Elements/HyperCheckbox"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("components/Elements/BaseElement")
    local d = _require("hooks/useSpring")
    
    local function HyperCheckbox(e)
        local f = e.Value or false
        local g = d(f and 1 or 0, { damping = 0.5, stiffness = 0.3 })
        
        return a.createElement(c, {
            Disabled = e.Disabled,
            OnActivated = function()
                if e.Callback then e.Callback(not f) end
            end,
            LayoutOrder = e.LayoutOrder,
        }, {
            Container = a.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = a.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, b.Spacing[3]),
                    PaddingRight = UDim.new(0, b.Spacing[3]),
                }),
                Label = a.createElement("TextLabel", {
                    Size = UDim2.new(1, -30, 1, 0),
                    BackgroundTransparency = 1,
                    Text = e.Text or "Checkbox",
                    TextColor3 = b.Color.Text,
                    Font = b.Font.Main,
                    TextSize = b.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                Box = a.createElement("Frame", {
                    Size = UDim2.fromOffset(20, 20),
                    Position = UDim2.new(1, -20, 0.5, -10),
                    BackgroundColor3 = b.Color.Surface,
                    BorderSizePixel = 0,
                }, {
                    UICorner = a.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 4)
                    }),
                    UIStroke = a.createElement("UIStroke", {
                        Color = f and b.Color.Accent or b.Color.Border,
                        Thickness = 1,
                    }),
                    CheckMark = a.createElement("Frame", {
                        Size = UDim2.fromScale(0.6, 0.6),
                        Position = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        BackgroundColor3 = b.Color.Accent,
                        BackgroundTransparency = g:map(function(h) return 1 - h end),
                    }, {
                        UICorner = a.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 2)
                        }),
                        UIScale = a.createElement("UIScale", {
                            Scale = g
                        })
                    })
                })
            })
        })
    end
    
    return HyperCheckbox
end

_modules["components/Elements/HyperCollapsible"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("components/Elements/HyperAccordion")
    
    local function HyperCollapsible(c)
        
        return a.createElement(b, c)
    end
    
    return HyperCollapsible
end

_modules["components/Elements/HyperColorPicker"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("components/Elements/BaseElement")
    
    local d = _require("components/Elements/HyperColorPicker/HueSlider")
    local e = _require("components/Elements/HyperColorPicker/SaturationSquare")
    local f = _require("components/Elements/HyperColorPicker/ColorPreview")
    
    local function HyperColorPicker(g)
        local h, i = a.useState(false)
        local j, k, l = Color3.toHSV(g.Value or Color3.new(1, 1, 1))
        
        local function updateColor(m, n, o)
            if g.Callback then
                g.Callback(Color3.fromHSV(m or j, n or k, o or l))
            end
        end
        
        return a.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            LayoutOrder = g.LayoutOrder,
            ZIndex = h and 100 or 1,
        }, {
            Layout = a.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4) }),
            Trigger = a.createElement(c, {
                OnActivated = function() i(not h) end,
            }, {
                Container = a.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1),
                    BackgroundTransparency = 1,
                }, {
                    Padding = a.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, b.Spacing[3]),
                        PaddingRight = UDim.new(0, b.Spacing[3]),
                    }),
                    Label = a.createElement("TextLabel", {
                        Size = UDim2.new(1, -60, 1, 0),
                        BackgroundTransparency = 1,
                        Text = g.Text or "Color Picker",
                        TextColor3 = b.Color.Text,
                        Font = b.Font.Main,
                        TextSize = b.FontSize.Medium,
                        TextXAlignment = Enum.TextXAlignment.Left,
                    }),
                    Preview = a.createElement(f, {
                        Color = g.Value or Color3.new(1, 1, 1)
                    })
                })
            }),
            Dropdown = h and a.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 200),
                BackgroundColor3 = b.Color.Surface,
                BorderSizePixel = 0,
            }, {
                UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, b.Radius.Small) }),
                Padding = a.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 8),
                    PaddingBottom = UDim.new(0, 8),
                    PaddingLeft = UDim.new(0, 8),
                    PaddingRight = UDim.new(0, 8),
                }),
                Layout = a.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 8) }),
                SatVal = a.createElement(e, {
                    Hue = j,
                    Sat = k,
                    Val = l,
                    OnChanged = function(m, n) updateColor(nil, m, n) end
                }),
                Hue = a.createElement(d, {
                    Hue = j,
                    OnChanged = function(m) updateColor(m, nil, nil) end
                })
            })
        })
    end
    
    return HyperColorPicker
end

_modules["components/Elements/HyperColorPicker/ColorPreview"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    
    local function ColorPreview(c)
        return a.createElement("Frame", {
            Size = UDim2.fromOffset(24, 24),
            Position = UDim2.new(1, -24, 0.5, -12),
            BackgroundColor3 = c.Color or Color3.new(1, 1, 1),
            BorderSizePixel = 0,
            ZIndex = 5,
        }, {
            UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
            UIStroke = a.createElement("UIStroke", { Color = b.Color.Border, Thickness = 2 })
        })
    end
    
    return ColorPreview
end

_modules["components/Elements/HyperColorPicker/HueSlider"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    
    local function HueSlider(c)
        return a.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 12),
            BorderSizePixel = 0,
            LayoutOrder = 2,
        }, {
            UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
            Gradient = a.createElement("UIGradient", {
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
            Handle = a.createElement("Frame", {
                Size = UDim2.fromOffset(16, 16),
                Position = UDim2.new(c.Hue, 0, 0.5, 0),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = b.Color.Text,
                BorderSizePixel = 0,
            }, {
                UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
                UIStroke = a.createElement("UIStroke", { Thickness = 2, Color = b.Color.Background })
            }),
            Trigger = a.createElement("TextButton", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
                Text = "",
                [a.Event.MouseButton1Down] = function(d)
                    local function update()
                        local e = (game:GetService("UserInputService"):GetMouseLocation().X - d.AbsolutePosition.X) / d.AbsoluteSize.X
                        c.OnChanged(math.clamp(e, 0, 1))
                    end
                    update()
                end
            })
        })
    end
    
    return HueSlider
end

_modules["components/Elements/HyperColorPicker/SaturationSquare"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    
    local function SaturationSquare(c)
        return a.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -20),
            BackgroundColor3 = Color3.fromHSV(c.Hue, 1, 1),
            BorderSizePixel = 0,
            LayoutOrder = 1,
        }, {
            UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, b.Radius.Small) }),
            SatGradient = a.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BorderSizePixel = 0,
                BackgroundTransparency = 0,
            }, {
                Gradient = a.createElement("UIGradient", {
                    Transparency = NumberSequence.new(0, 1),
                    Color = ColorSequence.new(Color3.new(1, 1, 1)),
                    Rotation = 0,
                })
            }),
            ValGradient = a.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BorderSizePixel = 0,
                BackgroundTransparency = 0,
            }, {
                Gradient = a.createElement("UIGradient", {
                    Transparency = NumberSequence.new(0, 1),
                    Color = ColorSequence.new(Color3.new(0, 0, 0)),
                    Rotation = 90,
                })
            }),
            Handle = a.createElement("Frame", {
                Size = UDim2.fromOffset(12, 12),
                Position = UDim2.fromScale(c.Sat, 1 - c.Val),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = b.Color.Text,
                BorderSizePixel = 0,
            }, {
                UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
                UIStroke = a.createElement("UIStroke", { Thickness = 2, Color = b.Color.Background })
            }),
            Trigger = a.createElement("TextButton", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
                Text = "",
                [a.Event.MouseButton1Down] = function(d)
                    local function update()
                        local e = game:GetService("UserInputService"):GetMouseLocation()
                        local f = (e.X - d.AbsolutePosition.X) / d.AbsoluteSize.X
                        local g = (e.Y - d.AbsolutePosition.Y) / d.AbsoluteSize.Y
                        c.OnChanged(math.clamp(f, 0, 1), 1 - math.clamp(g, 0, 1))
                    end
                    update()
                end
            })
        })
    end
    
    return SaturationSquare
end

_modules["components/Elements/HyperComboBox"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("components/Elements/HyperDropdown")
    local c = _require("components/Elements/HyperInput")
    
    local function HyperComboBox(d)
        
        
        return a.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            LayoutOrder = d.LayoutOrder,
        }, {
            Layout = a.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
            Combo = a.createElement(b, {
                Text = d.Text,
                Value = d.Value,
                Options = d.Options,
                Callback = d.Callback,
            })
        })
    end
    
    return HyperComboBox
end

_modules["components/Elements/HyperConfirmationDialog"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("components/Elements/HyperModal")
    local c = _require("components/Elements/HyperButton")
    
    local function HyperConfirmationDialog(d)
        return a.createElement(b, {
            Open = d.Open,
            Title = d.Title,
            Content = d.Content,
        }, {
            Cancel = a.createElement(c, {
                Text = d.CancelText or "Cancel",
                Size = UDim2.fromOffset(100, 32),
                Callback = d.OnCancel,
            }),
            Confirm = a.createElement(c, {
                Text = d.ConfirmText or "Confirm",
                Size = UDim2.fromOffset(100, 32),
                BackgroundColor = Color3.fromRGB(200, 50, 50), 
                Callback = d.OnConfirm,
            })
        })
    end
    
    return HyperConfirmationDialog
end

_modules["components/Elements/HyperCopyButton"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("components/Elements/BaseElement")
    
    local function CopyButton(d)
        local e, f = a.useState(false)
        
        local function copy()
            if setclipboard then
                setclipboard(d.Value or "")
                f(true)
                task.delay(2, function() f(false) end)
            end
        end
        
        return a.createElement(c, {
            OnActivated = copy,
            LayoutOrder = d.LayoutOrder,
        }, {
            Container = a.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = a.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, b.Spacing[3]),
                    PaddingRight = UDim.new(0, b.Spacing[3]),
                }),
                Label = a.createElement("TextLabel", {
                    Size = UDim2.new(1, -60, 1, 0),
                    BackgroundTransparency = 1,
                    Text = d.Text or "Copy Content",
                    TextColor3 = b.Color.Text,
                    Font = b.Font.Main,
                    TextSize = b.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                Status = a.createElement("TextLabel", {
                    Size = UDim2.fromScale(0.4, 1),
                    Position = UDim2.fromScale(0.6, 0),
                    BackgroundTransparency = 1,
                    Text = e and "COPIED" or "COPY",
                    TextColor3 = e and b.Color.Success or b.Color.TextMuted,
                    Font = b.Font.Bold,
                    TextSize = 10,
                    TextXAlignment = Enum.TextXAlignment.Right,
                })
            })
        })
    end
    
    return CopyButton
end

_modules["components/Elements/HyperDivider"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    
    local function HyperDivider(c)
        return a.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 1),
            BackgroundColor3 = b.Color.Border,
            BorderSizePixel = 0,
            BackgroundTransparency = 0.5,
            LayoutOrder = c.LayoutOrder,
        }, {
            Padding = a.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, b.Spacing[2]),
                PaddingRight = UDim.new(0, b.Spacing[2]),
            })
        })
    end
    
    return HyperDivider
end

_modules["components/Elements/HyperDropdown"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    
    local c = _require("components/Elements/HyperDropdown/DropdownTrigger")
    local d = _require("components/Elements/HyperDropdown/DropdownList")
    
    local function HyperDropdown(e)
        local f, g = a.useState(false)
        
        return a.createElement("Frame", {
            Size = e.Size or UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            LayoutOrder = e.LayoutOrder,
            ZIndex = f and 100 or 1,
        }, {
            Layout = a.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 4),
            }),
            Trigger = a.createElement(c, {
                Text = e.Text,
                Value = e.Value,
                Open = f,
                OnToggle = function() g(not f) end,
            }),
            List = f and a.createElement(d, {
                Options = e.Options,
                Selected = e.Value,
                Multi = e.Multi,
                OnSelect = function(h)
                    if not e.Multi then g(false) end
                    if e.Callback then e.Callback(h) end
                end,
            })
        })
    end
    
    return HyperDropdown
end

_modules["components/Elements/HyperDropdown/DropdownList"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("components/Containers/VirtualList")
    local d = _require("components/Elements/HyperDropdown/DropdownOption")
    local e = _require("components/Elements/HyperDropdown/DropdownSearch")
    
    local function DropdownList(f)
        local g, h = a.useState("")
        
        local i = {}
        for j, k in ipairs(f.Options or {}) do
            if string.find(string.lower(tostring(k)), string.lower(g)) then
                table.insert(i, k)
            end
        end
        
        return a.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 200),
            BackgroundColor3 = b.Color.Surface,
            BorderSizePixel = 0,
        }, {
            UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, b.Radius.Small) }),
            Layout = a.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
            Search = a.createElement(e, {
                OnChanged = h
            }),
            List = a.createElement(c, {
                Size = UDim2.new(1, 0, 1, -32),
                Items = i,
                ItemHeight = 32,
                RenderItem = function(j)
                    local k = false
                    if type(f.Selected) == "table" then
                        k = table.find(f.Selected, j) ~= nil
                    else
                        k = f.Selected == j
                    end
                    
                    return a.createElement(d, {
                        Text = tostring(j),
                        Selected = k,
                        OnSelect = function() f.OnSelect(j) end
                    })
                end
            })
        })
    end
    
    return DropdownList
end

_modules["components/Elements/HyperDropdown/DropdownOption"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("components/Elements/BaseElement")
    
    local function DropdownOption(d)
        return a.createElement(c, {
            BackgroundTransparency = 1,
            OnActivated = d.OnSelect,
        }, {
            Container = a.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = a.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, b.Spacing[3]),
                }),
                Label = a.createElement("TextLabel", {
                    Size = UDim2.fromScale(1, 1),
                    BackgroundTransparency = 1,
                    Text = d.Text,
                    TextColor3 = d.Selected and b.Color.Accent or b.Color.Text,
                    Font = d.Selected and b.Font.Bold or b.Font.Main,
                    TextSize = b.FontSize.Small,
                    TextXAlignment = Enum.TextXAlignment.Left,
                })
            })
        })
    end
    
    return DropdownOption
end

_modules["components/Elements/HyperDropdown/DropdownSearch"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    
    local function DropdownSearch(c)
        return a.createElement("TextBox", {
            Size = UDim2.new(1, 0, 0, 32),
            BackgroundColor3 = b.Color.Background,
            BackgroundTransparency = 0.5,
            BorderSizePixel = 0,
            PlaceholderText = "Search...",
            PlaceholderColor3 = b.Color.TextMuted,
            Text = "",
            TextColor3 = b.Color.Text,
            Font = b.Font.Main,
            TextSize = b.FontSize.Small,
            ClearTextOnFocus = false,
            [a.Change.Text] = function(d)
                c.OnChanged(d.Text)
            end,
        }, {
            UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, b.Radius.Small) }),
            Padding = a.createElement("UIPadding", { PaddingLeft = UDim.new(0, 8) }),
        })
    end
    
    return DropdownSearch
end

_modules["components/Elements/HyperDropdown/DropdownTrigger"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("components/Elements/BaseElement")
    local d = _require("hooks/useSpring")
    
    local function DropdownTrigger(e)
        local f = d(e.Open and 180 or 0, { damping = 0.8, stiffness = 0.2 })
        
        local g = "Select Option..."
        if e.Value then
            if type(e.Value) == "table" then
                g = #e.Value .. " selected"
            else
                g = tostring(e.Value)
            end
        end
        
        return a.createElement(c, {
            OnActivated = e.OnToggle,
        }, {
            Container = a.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = a.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, b.Spacing[3]),
                    PaddingRight = UDim.new(0, b.Spacing[3]),
                }),
                Label = a.createElement("TextLabel", {
                    Size = UDim2.new(1, -60, 1, 0),
                    BackgroundTransparency = 1,
                    Text = e.Text or "Dropdown",
                    TextColor3 = b.Color.Text,
                    Font = b.Font.Main,
                    TextSize = b.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                Value = a.createElement("TextLabel", {
                    Size = UDim2.new(1, -60, 1, 0),
                    BackgroundTransparency = 1,
                    Text = g,
                    TextColor3 = b.Color.TextMuted,
                    Font = b.Font.Main,
                    TextSize = b.FontSize.Small,
                    TextXAlignment = Enum.TextXAlignment.Right,
                    ZIndex = 4,
                }),
                Arrow = a.createElement("ImageLabel", {
                    Size = UDim2.fromOffset(16, 16),
                    Position = UDim2.new(1, -16, 0.5, -8),
                    BackgroundTransparency = 1,
                    Image = "rbxassetid://10723346959", 
                    ImageColor3 = b.Color.TextMuted,
                    Rotation = f,
                })
            })
        })
    end
    
    return DropdownTrigger
end

_modules["components/Elements/HyperGroup"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("components/Containers/ElementList")
    
    local function HyperGroup(d)
        return a.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundColor3 = b.Color.Background,
            BackgroundTransparency = 0.5,
            BorderSizePixel = 0,
            LayoutOrder = d.LayoutOrder,
        }, {
            UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, b.Radius.Small) }),
            Padding = a.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 8),
                PaddingBottom = UDim.new(0, 8),
            }),
            Content = a.createElement(c, {}, d.children)
        })
    end
    
    return HyperGroup
end

_modules["components/Elements/HyperIcon"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    
    local function HyperIcon(c)
        local d = c.Size or 16
        
        return a.createElement("ImageLabel", {
            Size = UDim2.fromOffset(d, d),
            BackgroundTransparency = 1,
            Image = c.Icon or "",
            ImageColor3 = c.Color or b.Color.Text,
            LayoutOrder = c.LayoutOrder,
        })
    end
    
    return HyperIcon
end

_modules["components/Elements/HyperIconButton"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("components/Elements/BaseElement")
    
    local function HyperIconButton(d)
        return a.createElement(c, {
            Size = d.Size or UDim2.fromOffset(32, 32),
            Disabled = d.Disabled,
            OnActivated = d.Callback,
            LayoutOrder = d.LayoutOrder,
        }, {
            Icon = a.createElement("ImageLabel", {
                Size = UDim2.fromOffset(20, 20),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundTransparency = 1,
                Image = d.Icon or "",
                ImageColor3 = b.Color.Text,
            })
        })
    end
    
    return HyperIconButton
end

_modules["components/Elements/HyperInput"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("components/Elements/BaseElement")
    
    local function HyperInput(d)
        return a.createElement(c, {
            Disabled = d.Disabled,
            LayoutOrder = d.LayoutOrder,
        }, {
            Container = a.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = a.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, b.Spacing[3]),
                    PaddingRight = UDim.new(0, b.Spacing[3]),
                }),
                Label = a.createElement("TextLabel", {
                    Size = UDim2.new(0.4, 0, 1, 0),
                    BackgroundTransparency = 1,
                    Text = d.Text or "Input",
                    TextColor3 = b.Color.Text,
                    Font = b.Font.Main,
                    TextSize = b.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                Box = a.createElement("TextBox", {
                    Size = UDim2.new(0.6, -8, 0, 24),
                    Position = UDim2.new(0.4, 8, 0.5, -12),
                    BackgroundColor3 = b.Color.Background,
                    BackgroundTransparency = 0.5,
                    BorderSizePixel = 0,
                    Text = d.Value or "",
                    PlaceholderText = d.Placeholder or "Enter text...",
                    PlaceholderColor3 = b.Color.TextMuted,
                    TextColor3 = b.Color.Accent,
                    Font = b.Font.Main,
                    TextSize = b.FontSize.Small,
                    ClearTextOnFocus = false,
                    [a.Change.Text] = function(e)
                        if d.Callback then d.Callback(e.Text) end
                    end,
                }, {
                    UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
                    UIStroke = a.createElement("UIStroke", { Color = b.Color.Border, Thickness = 1 }),
                    Padding = a.createElement("UIPadding", { PaddingLeft = UDim.new(0, 8) }),
                })
            })
        })
    end
    
    return HyperInput
end

_modules["components/Elements/HyperKeybind"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("components/Elements/BaseElement")
    local d = game:GetService("UserInputService")
    
    local function HyperKeybind(e)
        local f, g = a.useState(false)
        local h = e.Value or Enum.KeyCode.Unknown
        
        a.useEffect(function()
            if not f then return end
            
            local i = d.InputBegan:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.Keyboard then
                    g(false)
                    if e.Callback then e.Callback(i.KeyCode) end
                end
            end)
            
            return function() i:Disconnect() end
        end, {f})
        
        return a.createElement(c, {
            OnActivated = function() g(true) end,
            LayoutOrder = e.LayoutOrder,
        }, {
            Container = a.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = a.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, b.Spacing[3]),
                    PaddingRight = UDim.new(0, b.Spacing[3]),
                }),
                Label = a.createElement("TextLabel", {
                    Size = UDim2.new(1, -100, 1, 0),
                    BackgroundTransparency = 1,
                    Text = e.Text or "Keybind",
                    TextColor3 = b.Color.Text,
                    Font = b.Font.Main,
                    TextSize = b.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                BindDisplay = a.createElement("Frame", {
                    Size = UDim2.fromOffset(80, 24),
                    Position = UDim2.new(1, -80, 0.5, -12),
                    BackgroundColor3 = f and b.Color.Accent or b.Color.Surface,
                    BackgroundTransparency = 0.5,
                    BorderSizePixel = 0,
                }, {
                    UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
                    Text = a.createElement("TextLabel", {
                        Size = UDim2.fromScale(1, 1),
                        BackgroundTransparency = 1,
                        Text = f and "..." or h.Name,
                        TextColor3 = b.Color.Text,
                        Font = b.Font.Bold,
                        TextSize = b.FontSize.Small,
                    })
                })
            })
        })
    end
    
    return HyperKeybind
end

_modules["components/Elements/HyperLabel"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    
    local function HyperLabel(c)
        return a.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            LayoutOrder = c.LayoutOrder,
        }, {
            Layout = a.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 2),
            }),
            Padding = a.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, b.Spacing[2]),
            }),
            Title = a.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundTransparency = 1,
                Text = c.Text or "Label",
                TextColor3 = b.Color.Text,
                Font = b.Font.Main,
                TextSize = b.FontSize.Medium,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
            }),
            Description = c.Description and a.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundTransparency = 1,
                Text = c.Description,
                TextColor3 = b.Color.TextMuted,
                Font = b.Font.Main,
                TextSize = b.FontSize.Small,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
            })
        })
    end
    
    return HyperLabel
end

_modules["components/Elements/HyperModal"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("hooks/useSpring")
    
    local function HyperModal(d)
        local e = d.Open or false
        local f = c(e and 1 or 0, { damping = 0.7, stiffness = 0.2 })
        
        return a.createElement("Frame", {
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.new(0, 0, 0),
            BackgroundTransparency = f:map(function(g) return 1 - (g * 0.5) end),
            Visible = f:map(function(g) return g > 0.01 end),
            ZIndex = 2000,
        }, {
            Content = a.createElement("Frame", {
                Size = UDim2.fromOffset(400, 250),
                Position = f:map(function(g) return UDim2.fromScale(0.5, 0.5 + (0.1 * (1-g))) end),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = b.Color.Background,
                BorderSizePixel = 0,
                GroupTransparency = f:map(function(g) return 1 - g end),
            }, {
                UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, b.Radius.Medium) }),
                UIStroke = a.createElement("UIStroke", { Color = b.Color.Border, Thickness = 2 }),
                Shadow = a.createElement("ImageLabel", {
                    Size = UDim2.new(1, 40, 1, 40),
                    Position = UDim2.fromOffset(-20, -20),
                    BackgroundTransparency = 1,
                    Image = "rbxassetid://1316045217", 
                    ImageColor3 = Color3.new(0, 0, 0),
                    ImageTransparency = 0.5,
                    ZIndex = 0,
                }),
                Header = a.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 48),
                    BackgroundTransparency = 1,
                }, {
                    Title = a.createElement("TextLabel", {
                        Size = UDim2.fromScale(1, 1),
                        BackgroundTransparency = 1,
                        Text = d.Title or "Modal",
                        TextColor3 = b.Color.Text,
                        Font = b.Font.Bold,
                        TextSize = b.FontSize.Large,
                    }),
                    Divider = a.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, 1),
                        Position = UDim2.fromScale(0, 1),
                        BackgroundColor3 = b.Color.Border,
                        BorderSizePixel = 0,
                    })
                }),
                Body = a.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, -100),
                    Position = UDim2.fromOffset(0, 48),
                    BackgroundTransparency = 1,
                }, {
                    Padding = a.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 16),
                        PaddingBottom = UDim.new(0, 16),
                        PaddingLeft = UDim.new(0, 24),
                        PaddingRight = UDim.new(0, 24),
                    }),
                    Text = a.createElement("TextLabel", {
                        Size = UDim2.fromScale(1, 1),
                        BackgroundTransparency = 1,
                        Text = d.Content or "",
                        TextColor3 = b.Color.Text,
                        Font = b.Font.Main,
                        TextSize = b.FontSize.Medium,
                        TextWrapped = true,
                        TextYAlignment = Enum.TextYAlignment.Top,
                    })
                }),
                Footer = a.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 52),
                    Position = UDim2.new(0, 0, 1, -52),
                    BackgroundTransparency = 1,
                }, {
                    Layout = a.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Right,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        Padding = UDim.new(0, 12),
                    }),
                    Padding = a.createElement("UIPadding", { PaddingRight = UDim.new(0, 24) }),
                    Children = a.createElement(a.Fragment, {}, d.children)
                })
            })
        })
    end
    
    return HyperModal
end

_modules["components/Elements/HyperNumberInput"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("components/Elements/BaseElement")
    
    local function HyperNumberInput(d)
        return a.createElement(c, {
            Disabled = d.Disabled,
            LayoutOrder = d.LayoutOrder,
        }, {
            Container = a.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = a.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, b.Spacing[3]),
                    PaddingRight = UDim.new(0, b.Spacing[3]),
                }),
                Label = a.createElement("TextLabel", {
                    Size = UDim2.new(0.4, 0, 1, 0),
                    BackgroundTransparency = 1,
                    Text = d.Text or "Number",
                    TextColor3 = b.Color.Text,
                    Font = b.Font.Main,
                    TextSize = b.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                Box = a.createElement("TextBox", {
                    Size = UDim2.new(0, 100, 0, 24),
                    Position = UDim2.new(1, -100, 0.5, -12),
                    BackgroundColor3 = b.Color.Background,
                    BackgroundTransparency = 0.5,
                    BorderSizePixel = 0,
                    Text = tostring(d.Value or d.Min or 0),
                    PlaceholderText = "0",
                    PlaceholderColor3 = b.Color.TextMuted,
                    TextColor3 = b.Color.Accent,
                    Font = b.Font.Bold,
                    TextSize = b.FontSize.Small,
                    [a.Change.Text] = function(e)
                        local f = string.gsub(e.Text, "[^%d.-]", "")
                        local g = tonumber(f)
                        if g then
                            if d.Min then g = math.max(d.Min, g) end
                            if d.Max then g = math.min(d.Max, g) end
                            if d.Callback then d.Callback(g) end
                        end
                    end,
                }, {
                    UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
                    UIStroke = a.createElement("UIStroke", { Color = b.Color.Border, Thickness = 1 }),
                })
            })
        })
    end
    
    return HyperNumberInput
end

_modules["components/Elements/HyperProgressBar"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("hooks/useSpring")
    
    local function HyperProgressBar(d)
        local e = math.clamp(d.Value or 0, 0, 100)
        local f = c(e / 100, { damping = 0.8, stiffness = 0.2 })
        
        return a.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 24),
            BackgroundTransparency = 1,
            LayoutOrder = d.LayoutOrder,
        }, {
            Layout = a.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4) }),
            Label = d.Text and a.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 14),
                BackgroundTransparency = 1,
                Text = d.Text,
                TextColor3 = b.Color.TextMuted,
                Font = b.Font.Main,
                TextSize = b.FontSize.Small,
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
            Track = a.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 8),
                BackgroundColor3 = b.Color.Surface,
                BorderSizePixel = 0,
            }, {
                UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
                Fill = a.createElement("Frame", {
                    Size = f:map(function(g) return UDim2.fromScale(g, 1) end),
                    BackgroundColor3 = b.Color.Accent,
                    BorderSizePixel = 0,
                }, {
                    UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
                })
            })
        })
    end
    
    return HyperProgressBar
end

_modules["components/Elements/HyperSearchInput"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("components/Elements/BaseElement")
    
    local function HyperSearchInput(d)
        return a.createElement(c, {
            Disabled = d.Disabled,
            LayoutOrder = d.LayoutOrder,
        }, {
            Container = a.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = a.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, b.Spacing[3]),
                    PaddingRight = UDim.new(0, b.Spacing[3]),
                }),
                Icon = a.createElement("ImageLabel", {
                    Size = UDim2.fromOffset(16, 16),
                    Position = UDim2.new(0, 0, 0.5, -8),
                    BackgroundTransparency = 1,
                    Image = "rbxassetid://10723346959", 
                    ImageColor3 = b.Color.TextMuted,
                }),
                Box = a.createElement("TextBox", {
                    Size = UDim2.new(1, -24, 0, 24),
                    Position = UDim2.new(0, 24, 0.5, -12),
                    BackgroundTransparency = 1,
                    Text = d.Value or "",
                    PlaceholderText = d.Placeholder or "Search...",
                    PlaceholderColor3 = b.Color.TextMuted,
                    TextColor3 = b.Color.Text,
                    Font = b.Font.Main,
                    TextSize = b.FontSize.Small,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ClearTextOnFocus = false,
                    [a.Change.Text] = function(e)
                        if d.Callback then d.Callback(e.Text) end
                    end,
                })
            })
        })
    end
    
    return HyperSearchInput
end

_modules["components/Elements/HyperSlider"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("components/Elements/BaseElement")
    local d = _require("hooks/useSpring")
    
    local function HyperSlider(e)
        local f = e.Min or 0
        local g = e.Max or 100
        local h = e.Value or f
        
        local i = (h - f) / (g - f)
        local j = d(i, { damping = 0.9, stiffness = 0.1 })
        
        return a.createElement(c, {
            Disabled = e.Disabled,
            LayoutOrder = e.LayoutOrder,
        }, {
            Container = a.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = a.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, b.Spacing[3]),
                    PaddingRight = UDim.new(0, b.Spacing[3]),
                }),
                Label = a.createElement("TextLabel", {
                    Size = UDim2.new(1, -120, 0.5, 0),
                    BackgroundTransparency = 1,
                    Text = e.Text or "Slider",
                    TextColor3 = b.Color.Text,
                    Font = b.Font.Main,
                    TextSize = b.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                ValueLabel = a.createElement("TextLabel", {
                    Size = UDim2.new(0, 50, 0.5, 0),
                    Position = UDim2.new(1, -50, 0, 0),
                    BackgroundTransparency = 1,
                    Text = tostring(math.floor(h)),
                    TextColor3 = b.Color.Accent,
                    Font = b.Font.Bold,
                    TextSize = b.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Right,
                }),
                Track = a.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 4),
                    Position = UDim2.new(0, 0, 0.8, -2),
                    BackgroundColor3 = b.Color.Surface,
                    BorderSizePixel = 0,
                }, {
                    UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
                    Fill = a.createElement("Frame", {
                        Size = j:map(function(k) return UDim2.fromScale(k, 1) end),
                        BackgroundColor3 = b.Color.Accent,
                        BorderSizePixel = 0,
                    }, {
                        UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
                    })
                })
            })
        })
    end
    
    return HyperSlider
end

_modules["components/Elements/HyperSpacer"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    
    local function HyperSpacer(b)
        local c = b.Height or 10
        
        return a.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, c),
            BackgroundTransparency = 1,
            LayoutOrder = b.LayoutOrder,
        })
    end
    
    return HyperSpacer
end

_modules["components/Elements/HyperStatDisplay"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("components/Elements/BaseElement")
    
    local function HyperStatDisplay(d)
        return a.createElement(c, {
            Size = UDim2.new(1, 0, 0, 60),
            Disabled = true, 
            LayoutOrder = d.LayoutOrder,
        }, {
            Container = a.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = a.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, b.Spacing[3]),
                    PaddingRight = UDim.new(0, b.Spacing[3]),
                }),
                Title = a.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, 20),
                    Position = UDim2.fromOffset(0, 8),
                    BackgroundTransparency = 1,
                    Text = d.Title or "Metric",
                    TextColor3 = b.Color.TextMuted,
                    Font = b.Font.Main,
                    TextSize = b.FontSize.Small,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                Value = a.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, 30),
                    Position = UDim2.fromOffset(0, 24),
                    BackgroundTransparency = 1,
                    Text = d.Value or "0",
                    TextColor3 = b.Color.Text,
                    Font = b.Font.Bold,
                    TextSize = b.FontSize.Title,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                SubValue = d.SubValue and a.createElement("TextLabel", {
                    Size = UDim2.new(0, 100, 0, 20),
                    Position = UDim2.new(1, -100, 1, -24),
                    BackgroundTransparency = 1,
                    Text = d.SubValue,
                    TextColor3 = b.Color.Success,
                    Font = b.Font.Main,
                    TextSize = b.FontSize.Small,
                    TextXAlignment = Enum.TextXAlignment.Right,
                })
            })
        })
    end
    
    return HyperStatDisplay
end

_modules["components/Elements/HyperStatusIndicator"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    
    local function HyperStatusIndicator(c)
        local d = {
            Online = b.Color.Success,
            Warning = b.Color.Warning,
            Offline = b.Color.Error,
            Busy = Color3.fromRGB(255, 85, 255),
        }
        
        local e = d[c.Status] or b.Color.TextMuted
        
        return a.createElement("Frame", {
            Size = UDim2.fromOffset(10, 10),
            BackgroundColor3 = e,
            BorderSizePixel = 0,
            LayoutOrder = c.LayoutOrder,
        }, {
            UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
            Glow = a.createElement("ImageLabel", {
                Size = UDim2.fromScale(3, 3),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundTransparency = 1,
                Image = "rbxassetid://1316045217", 
                ImageColor3 = e,
                ImageTransparency = 0.5,
            })
        })
    end
    
    return HyperStatusIndicator
end

_modules["components/Elements/HyperTag"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    
    local function HyperTag(c)
        return a.createElement("Frame", {
            Size = UDim2.fromScale(0, 0),
            AutomaticSize = Enum.AutomaticSize.XY,
            BackgroundColor3 = b.Color.Surface,
            BorderSizePixel = 0,
            LayoutOrder = c.LayoutOrder,
        }, {
            UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
            UIStroke = a.createElement("UIStroke", { Color = b.Color.Border, Thickness = 1 }),
            Padding = a.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 4),
                PaddingBottom = UDim.new(0, 4),
                PaddingLeft = UDim.new(0, 8),
                PaddingRight = UDim.new(0, 8),
            }),
            Layout = a.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                Padding = UDim.new(0, 8),
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }),
            Label = a.createElement("TextLabel", {
                Size = UDim2.fromScale(0, 0),
                AutomaticSize = Enum.AutomaticSize.XY,
                BackgroundTransparency = 1,
                Text = c.Text or "Tag",
                TextColor3 = b.Color.Text,
                Font = b.Font.Main,
                TextSize = b.FontSize.Small,
            }),
            Close = c.OnDismiss and a.createElement("TextButton", {
                Size = UDim2.fromOffset(12, 12),
                BackgroundTransparency = 1,
                Text = "×",
                TextColor3 = b.Color.TextMuted,
                Font = b.Font.Bold,
                TextSize = 14,
                [a.Event.Activated] = c.OnDismiss,
            })
        })
    end
    
    return HyperTag
end

_modules["components/Elements/HyperTextArea"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("components/Elements/BaseElement")
    
    local function HyperTextArea(d)
        return a.createElement(c, {
            Size = UDim2.new(1, 0, 0, 100), 
            Disabled = d.Disabled,
            LayoutOrder = d.LayoutOrder,
        }, {
            Container = a.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = a.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, b.Spacing[2]),
                    PaddingBottom = UDim.new(0, b.Spacing[2]),
                    PaddingLeft = UDim.new(0, b.Spacing[3]),
                    PaddingRight = UDim.new(0, b.Spacing[3]),
                }),
                Box = a.createElement("TextBox", {
                    Size = UDim2.fromScale(1, 1),
                    BackgroundTransparency = 1,
                    Text = d.Value or "",
                    PlaceholderText = d.Placeholder or "Enter long text...",
                    PlaceholderColor3 = b.Color.TextMuted,
                    TextColor3 = b.Color.Text,
                    Font = b.Font.Main,
                    TextSize = b.FontSize.Small,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Top,
                    TextWrapped = true,
                    MultiLine = true,
                    ClearTextOnFocus = false,
                    [a.Change.Text] = function(e)
                        if d.Callback then d.Callback(e.Text) end
                    end,
                })
            })
        })
    end
    
    return HyperTextArea
end

_modules["components/Elements/HyperToast"] = function()
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("components/Elements/BaseElement")
    local d = _require("hooks/useSpring")
    
    local function HyperToast(e)
        local f = {
            Info = b.Color.Accent,
            Success = b.Color.Success,
            Warning = b.Color.Warning,
            Error = b.Color.Error,
        }
        
        local g = f[e.Priority] or b.Color.Accent
        
        return a.createElement(c, {
            Size = UDim2.new(0, 300, 0, 60),
            BackgroundColor = b.Color.Surface,
            BackgroundTransparency = 0.1,
        }, {
            UIStroke = a.createElement("UIStroke", {
                Color = g,
                Thickness = 1,
                Transparency = 0.5,
            }),
            Container = a.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = a.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, b.Spacing[3]),
                    PaddingRight = UDim.new(0, b.Spacing[3]),
                }),
                Icon = e.Icon and a.createElement("ImageLabel", {
                    Size = UDim2.fromOffset(24, 24),
                    Position = UDim2.new(0, 0, 0.5, -12),
                    BackgroundTransparency = 1,
                    Image = e.Icon,
                    ImageColor3 = g,
                }),
                Content = a.createElement("Frame", {
                    Size = UDim2.new(1, e.Icon and -32 or 0, 1, 0),
                    Position = UDim2.new(0, e.Icon and 32 or 0, 0, 0),
                    BackgroundTransparency = 1,
                }, {
                    Layout = a.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        Padding = UDim.new(0, 2),
                    }),
                    Title = a.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 0, 16),
                        BackgroundTransparency = 1,
                        Text = e.Title or "Notification",
                        TextColor3 = g,
                        Font = b.Font.Bold,
                        TextSize = b.FontSize.Medium,
                        TextXAlignment = Enum.TextXAlignment.Left,
                    }),
                    Text = a.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 0, 14),
                        BackgroundTransparency = 1,
                        Text = e.Content or "",
                        TextColor3 = b.Color.Text,
                        Font = b.Font.Main,
                        TextSize = b.FontSize.Small,
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
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("components/Elements/BaseElement")
    local d = _require("hooks/useSpring")
    
    local function HyperToggle(e)
        local f = e.Value or false
        local g = d(f and 1 or 0, { damping = 0.8, stiffness = 0.2 })
        
        return a.createElement(c, {
            Disabled = e.Disabled,
            OnActivated = function()
                if e.Callback then e.Callback(not f) end
            end,
            LayoutOrder = e.LayoutOrder,
        }, {
            Container = a.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = a.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, b.Spacing[3]),
                    PaddingRight = UDim.new(0, b.Spacing[3]),
                }),
                Label = a.createElement("TextLabel", {
                    Size = UDim2.new(1, -50, 1, 0),
                    BackgroundTransparency = 1,
                    Text = e.Text or "Toggle",
                    TextColor3 = b.Color.Text,
                    Font = b.Font.Main,
                    TextSize = b.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                SwitchTrack = a.createElement("Frame", {
                    Size = UDim2.fromOffset(40, 20),
                    Position = UDim2.new(1, -40, 0.5, -10),
                    BackgroundColor3 = g:map(function(h)
                        return b.Color.Surface:Lerp(b.Color.Accent, h)
                    end),
                    BorderSizePixel = 0,
                }, {
                    UICorner = a.createElement("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    }),
                    Handle = a.createElement("Frame", {
                        Size = UDim2.fromOffset(16, 16),
                        Position = g:map(function(h)
                            return UDim2.new(0, 2 + (20 * h), 0.5, -8)
                        end),
                        BackgroundColor3 = b.Color.Text,
                        BorderSizePixel = 0,
                    }, {
                        UICorner = a.createElement("UICorner", {
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
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("hooks/useSpring")
    
    local function HyperTooltip(d)
        local e = d.Visible or false
        local f = c(e and 1 or 0, { damping = 0.8, stiffness = 0.2 })
        
        return a.createElement("Frame", {
            Size = UDim2.fromScale(0, 0),
            AutomaticSize = Enum.AutomaticSize.XY,
            BackgroundColor3 = b.Color.Background,
            BackgroundTransparency = f:map(function(g) return 1 - (g * 0.9) end),
            Position = d.Position or UDim2.fromScale(0.5, 0),
            AnchorPoint = Vector2.new(0.5, 1.2),
            ZIndex = 1000,
        }, {
            UICorner = a.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
            UIStroke = a.createElement("UIStroke", {
                Color = b.Color.Border,
                Transparency = f:map(function(g) return 1 - g end),
            }),
            Padding = a.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 4),
                PaddingBottom = UDim.new(0, 4),
                PaddingLeft = UDim.new(0, 8),
                PaddingRight = UDim.new(0, 8),
            }),
            Label = a.createElement("TextLabel", {
                Size = UDim2.fromScale(0, 0),
                AutomaticSize = Enum.AutomaticSize.XY,
                BackgroundTransparency = 1,
                Text = d.Text or "Tooltip",
                TextColor3 = b.Color.Text,
                TextTransparency = f:map(function(g) return 1 - g end),
                Font = b.Font.Main,
                TextSize = b.FontSize.Small,
            })
        })
    end
    
    return HyperTooltip
end

_modules["components/Root"] = function()
    
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("components/Window")
    
    local function Root(c)
        local d, e = a.useState(c.store:GetState())
        
        a.useEffect(function()
            local f = c.store:OnUpdate(function(f)
                e(f)
            end)
            return f
        end, {c.store})
        
        local f = {}
        for g, h in pairs(d.windows) do
            f[g] = a.createElement(b, {
                id = g,
                store = c.store,
                config = h,
            })
        end
        
        
        
        return a.createElement("Frame", {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
        }, f)
    end
    
    return Root
end

_modules["components/Window"] = function()
    
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("hooks/useTree")
    local c = _require("hooks/useSpring")
    local d = _require("theme/tokens")
    
    local e = _require("components/Window/TabContainer") 
    
    local function Window(f)
        local g = b(f.store, f.id)
        if not g or not g.props.active then return nil end
        
        
        local h = g.props.active and 1 or 0
        local i = c(h)
        
        return a.createElement("Frame", {
            Size = UDim2.fromOffset(600, 400),
            Position = UDim2.new(0.5, -300, 0.5, -200),
            BackgroundColor3 = d.Color.Background,
            BorderSizePixel = 0,
            ZIndex = g.props.zIndex or 1,
            Visible = i > 0.01,
        }, {
            UICorner = a.createElement("UICorner", {
                CornerRadius = UDim.new(0, d.Radius.Large)
            }),
            UIStroke = a.createElement("UIStroke", {
                Color = d.Color.Border,
                Thickness = 1,
            }),
            TitleBar = a.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 40),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
            }, {
                TitleLabel = a.createElement("TextLabel", {
                    Size = UDim2.new(1, -80, 1, 0),
                    Position = UDim2.fromOffset(d.Spacing[4], 0),
                    BackgroundTransparency = 1,
                    Text = g.props.title or "HyperUI",
                    TextColor3 = d.Color.Text,
                    Font = d.Font.Bold,
                    TextSize = d.FontSize.Large,
                    TextXAlignment = Enum.TextXAlignment.Left,
                })
            }),
            
            Content = a.createElement(e, {
                windowId = f.id,
                store = f.store,
                tabs = g.children,
            })
        })
    end
    
    return Window
end

_modules["components/Window/TabContainer"] = function()
    
    
    
    
    
    local a = _require("dependencies/React")
    local b = _require("theme/tokens")
    local c = _require("hooks/useTree")
    
    local d = _require("components/Containers/Section") 
    
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
end

_modules["core/config"] = function()
    
    
    
    
    
    local a = game:GetService("HttpService")
    
    local b = {}
    b.__index = b
    
    function b.new(c, d)
        local e = setmetatable({
            Store = c,
            FileName = d.FileName or "HyperUI_Config.json",
            AutoSave = d.AutoSave ~= false,
            Data = {},
        }, b)
        
        return e
    end
    
    function b:Save(c)
        local d, e = pcall(function()
            local d = a:JSONEncode(self.Data)
            writefile(self.FileName, d)
        end)
        
        if not d then
            warn("[HyperUI] Failed to save config:", e)
        end
        return d
    end
    
    function b:Load()
        if not isfile(self.FileName) then return false end
        
        local c, d = pcall(function()
            local c = readfile(self.FileName)
            return a:JSONDecode(c)
        end)
        
        if c and type(d) == "table" then
            self.Data = d
            
            for e, f in pairs(self.Data) do
                self.Store:Dispatch({
                    type = "UPDATE_ELEMENT",
                    id = e,
                    props = f
                })
            end
            return true
        end
        
        return false
    end
    
    function b:UpdateValue(c, d, e)
        if not self.Data[c] then
            self.Data[c] = {}
        end
        self.Data[c][d] = e
        
        if self.AutoSave then
            self:Save()
        end
    end
    
    return b
end

_modules["core/signal/Signal"] = function()
    
    
    
    
    
    local a = {}
    a.__index = a
    
    function a.new()
        return setmetatable({
            _listeners = {}
        }, a)
    end
    
    function a:Connect(b)
        local c = {
            callback = b,
            connected = true
        }
        
        function c:Disconnect()
            c.connected = false
        end
        
        table.insert(self._listeners, c)
        return c
    end
    
    function a:Fire(...)
        local b = self._listeners
        local c = 1
        
        while c <= #b do
            local d = b[c]
            if d.connected then
                task.spawn(d.callback, ...)
                c = c + 1
            else
                table.remove(b, c)
            end
        end
    end
    
    function a:Wait()
        local b = coroutine.running()
        local c
        c = self:Connect(function(...)
            c:Disconnect()
            coroutine.resume(b, ...)
        end)
        return coroutine.yield()
    end
    
    function a:Destroy()
        for b, c in ipairs(self._listeners) do
            c.connected = false
        end
        self._listeners = {}
    end
    
    return a
end

_modules["core/store"] = function()
    
    
    
    
    
    
    local a = {}
    a.__index = a
    
    function a.new()
        local b = setmetatable({
            _state = {
                windows = {},
                notifications = {},
                theme = "Dark",
                registry = {}, 
            },
            _listeners = {},
            _subscribers = {}, 
        }, a)
        
        return b
    end
    
    function a:GetState()
        return self._state
    end
    
    
    local function DeepCopy(b)
        local c = {}
        for d, e in pairs(b) do
            if type(e) == "table" then
                c[d] = DeepCopy(e)
            else
                c[d] = e
            end
        end
        return c
    end
    
    function a:Dispatch(b)
        local c = self._state
        local d = DeepCopy(c)
        
        local e = {} 
        
        if b.type == "ADD_WINDOW" then
            local f = b.window
            d.windows[f.id] = f
            d.registry[f.id] = {
                type = "Window",
                props = f,
                children = {},
            }
        elseif b.type == "UPDATE_ELEMENT" then
            local f = d.registry[b.id]
            if f then
                for g, h in pairs(b.props) do
                    f.props[g] = h
                end
                table.insert(e, b.id)
            end
        elseif b.type == "ADD_TAB" then
            local f = d.registry[b.windowId]
            if f then
                d.registry[b.tab.id] = {
                    type = "Tab",
                    props = b.tab,
                    children = {},
                    parentId = b.windowId,
                }
                table.insert(f.children, b.tab.id)
                table.insert(e, b.windowId)
            end
        elseif b.type == "ADD_SECTION" then
            local f = d.registry[b.tabId]
            if f then
                d.registry[b.section.id] = {
                    type = "Section",
                    props = b.section,
                    children = {},
                    parentId = b.tabId,
                }
                table.insert(f.children, b.section.id)
                table.insert(e, b.tabId)
            end
        elseif b.type == "ADD_ELEMENT" then
            local f = d.registry[b.parentId]
            if f then
                d.registry[b.element.id] = {
                    type = b.element.type,
                    props = b.element.props,
                    children = {},
                    parentId = b.parentId,
                }
                table.insert(f.children, b.element.id)
                table.insert(e, b.parentId)
            end
        elseif b.type == "SET_THEME" then
            d.theme = b.theme
        elseif b.type == "ADD_NOTIFICATION" then
            d.notifications[b.notification.id] = b.notification
        elseif b.type == "REMOVE_NOTIFICATION" then
            d.notifications[b.id] = nil
        end
        
        self._state = d
        
        
        for f, g in ipairs(self._listeners) do
            task.spawn(g, d, c)
        end
        
        
        for f, g in ipairs(e) do
            if self._subscribers[g] then
                for h, i in ipairs(self._subscribers[g]) do
                    task.spawn(i, d.registry[g])
                end
            end
        end
    end
    
    function a:Subscribe(b, c)
        if not self._subscribers[b] then
            self._subscribers[b] = {}
        end
        table.insert(self._subscribers[b], c)
        
        return function()
            local d = self._subscribers[b]
            if d then
                local e = table.find(d, c)
                if e then
                    table.remove(d, e)
                end
            end
        end
    end
    
    function a:OnUpdate(b)
        table.insert(self._listeners, b)
        return function()
            local c = table.find(self._listeners, b)
            if c then
                table.remove(self._listeners, c)
            end
        end
    end
    
    function a:Destroy()
        self._state = nil
        self._listeners = {}
        self._subscribers = {}
    end
    
    return a
end

_modules["core/tree"] = function()
    
    
    
    
    
    local a = {}
    
    function a.createNode(b, c, d, e)
        return {
            id = b,
            type = c,
            props = d or {},
            children = {},
            parentId = e,
            visible = true,
        }
    end
    
    
    function a.reconcile(b, c)
        
        
    end
    
    return a
end

_modules["dependencies/React"] = function()
    
    return {}
end

_modules["dependencies/ReactRoblox"] = function()
    
    return {}
end

_modules["hooks/useInteractionState"] = function()
    
    
    
    
    
    local a = _require("dependencies/React")
    
    local function useInteractionState(b)
        local c, d = a.useState(false)
        local e, f = a.useState(false)
        local g, h = a.useState(false)
        
        local i = {}
        
        if b ~= false then
            i = {
                [a.Event.MouseEnter] = function() d(true) end,
                [a.Event.MouseLeave] = function() 
                    d(false)
                    f(false)
                end,
                [a.Event.MouseButton1Down] = function() f(true) end,
                [a.Event.MouseButton1Up] = function() f(false) end,
                [a.Event.Focused] = function() h(true) end,
                [a.Event.FocusLost] = function() h(false) end,
            }
        end
        
        return {
            hovered = c,
            pressed = e,
            focused = g,
            bindings = i
        }
    end
    
    return useInteractionState
end

_modules["hooks/useSpring"] = function()
    
    
    
    
    
    local a = _require("dependencies/React")
    local b = game:GetService("RunService")
    
    local function lerp(c, d, e)
        return c + (d - c) * e
    end
    
    local function useSpring(c, d)
        local e = d or { stiffness = 170, damping = 26 }
        local f, g = a.useState(c)
        local h = a.useRef(c)
        local i = a.useRef(0)
        
        a.useEffect(function()
            local j
            
            j = b.RenderStepped:Connect(function(k)
                local l = h.current - c
                local m = -e.stiffness * l
                local n = -e.damping * i.current
                local o = m + n
                
                i.current = i.current + o * k
                h.current = h.current + i.current * k
                
                g(h.current)
                
                
                if math.abs(i.current) < 0.001 and math.abs(h.current - c) < 0.001 then
                    h.current = c
                    i.current = 0
                    g(c)
                    j:Disconnect()
                end
            end)
            
            return function()
                if j then j:Disconnect() end
            end
        end, {c})
        
        return f
    end
    
    return useSpring
end

_modules["hooks/useTree"] = function()
    
    
    
    
    
    local a = _require("dependencies/React")
    
    local function useTree(b, c)
        local d, e = a.useState(function()
            return b:GetState().registry[c]
        end)
        
        a.useEffect(function()
            local f = b:Subscribe(c, function(f)
                e(f)
            end)
            
            return function()
                f()
            end
        end, {b, c})
        
        return d
    end
    
    return useTree
end

_modules["main"] = function()
    
    
    
    
    
    local a = {}
    a.__index = a
    
    
    
    local function CheckExistingInstance()
        local b = getgenv and getgenv() or _G
        if b.__HyperUI_Instance then
            local c = b.__HyperUI_Instance
            pcall(function()
                c:Destroy()
            end)
            b.__HyperUI_Instance = nil
        end
    end
    
    function a.new()
        CheckExistingInstance()
        
        local b = setmetatable({}, a)
        
        
        b.Store = _require("core/store").new()
        
        b.WindowManager = _require("managers/WindowManager").new(b.Store)
        b.NotificationManager = _require("managers/NotificationManager").new(b.Store)
        b.ThemeManager = _require("managers/ThemeManager").new(b.Store)
        b.FocusManager = _require("managers/FocusManager").new(b.Store)
        b.Config = _require("core/config").new(b.Store, {
            FileName = "HyperUI_V2_Config.json",
            AutoSave = true
        })
        
        
        b.Runtime = _require("runtime/mount").new(b.Store)
        
        
        local c = getgenv and getgenv() or _G
        c.__HyperUI_Instance = b
        
        return b
    end
    
    function a:CreateWindow(b)
        local c = _require("api")
        local d = game:GetService("HttpService"):GenerateGUID(false)
        
        self.Store:Dispatch({
            type = "ADD_WINDOW",
            window = {
                id = d,
                title = b.Title or "HyperUI",
                icon = b.Icon,
                active = true,
            }
        })
        
        return c.Window.new(d, self.Store)
    end
    
    function a:Notify(b)
        return self.NotificationManager:Notify(b)
    end
    
    function a:SetTheme(b)
        return self.ThemeManager:SetTheme(b)
    end
    
    function a:Destroy()
        if self.Runtime then
            self.Runtime:Unmount()
        end
        
        local b = getgenv and getgenv() or _G
        if b.__HyperUI_Instance == self then
            b.__HyperUI_Instance = nil
        end
        
        
        self.Store:Destroy()
    end
    
    return a
end

_modules["managers/FocusManager"] = function()
    
    
    
    
    
    local a = _require("core/signal/Signal")
    
    local b = {}
    b.__index = b
    
    function b.new(c)
        local d = setmetatable({
            Store = c,
            FocusedElement = nil,
            FocusChanged = a.new(),
        }, b)
        
        return d
    end
    
    function b:RequestFocus(c)
        if self.FocusedElement == c then return end
        
        local d = self.FocusedElement
        self.FocusedElement = c
        
        
        if d then
            self.Store:Dispatch({
                type = "UPDATE_ELEMENT",
                id = d,
                props = { focused = false }
            })
        end
        
        if c then
            self.Store:Dispatch({
                type = "UPDATE_ELEMENT",
                id = c,
                props = { focused = true }
            })
        end
        
        self.FocusChanged:Fire(c, d)
    end
    
    function b:ClearFocus()
        self:RequestFocus(nil)
    end
    
    function b:GetFocus()
        return self.FocusedElement
    end
    
    function b:Destroy()
        self.FocusChanged:Destroy()
    end
    
    return b
end

_modules["managers/NotificationManager"] = function()
    
    
    
    
    
    local a = {}
    a.__index = a
    
    function a.new(b)
        local c = setmetatable({
            Store = b,
            Queue = {},
        }, a)
        
        return c
    end
    
    function a:Notify(b)
        local c = game:GetService("HttpService"):GenerateGUID(false)
        local d = {
            id = c,
            title = b.Title or "Notification",
            content = b.Content or "",
            icon = b.Icon,
            duration = b.Duration or 5,
            priority = b.Priority or "Info", 
            createdAt = os.clock(),
        }
        
        table.insert(self.Queue, d)
        
        self.Store:Dispatch({
            type = "ADD_NOTIFICATION",
            notification = d
        })
        
        
        task.delay(d.duration, function()
            self:Dismiss(c)
        end)
        
        return c
    end
    
    function a:Dismiss(b)
        local c = -1    
    for d, e in ipairs(self.Queue) do
            if e.id == b then
                c = d
                break
            end
        end
        
        if c ~= -1 then
            table.remove(self.Queue, c)
            self.Store:Dispatch({
                type = "REMOVE_NOTIFICATION",
                id = b
            })
        end
    end
    
    return a
end

_modules["managers/ThemeManager"] = function()
    
    
    
    
    local a = {}
    a.__index = a
    
    function a.new(b)
        local c = setmetatable({
            Store = b,
        }, a)
        
        return c
    end
    
    function a:SetTheme(b)
        self.Store:Dispatch({
            type = "SET_THEME",
            theme = b,
        })
    end
    
    return a
end

_modules["managers/WindowManager"] = function()
    
    
    
    
    
    local a = {}
    a.__index = a
    
    function a.new(b)
        local c = setmetatable({
            Store = b,
            Windows = {}, 
        }, a)
        
        return c
    end
    
    function a:FocusWindow(b)
        local c = table.find(self.Windows, b)
        if c then
            table.remove(self.Windows, c)
        end
        table.insert(self.Windows, b)
        
        
        for d, e in ipairs(self.Windows) do
            self.Store:Dispatch({
                type = "UPDATE_ELEMENT",
                id = e,
                props = { 
                    zIndex = d,
                    focused = (e == b)
                }
            })
        end
    end
    
    function a:RegisterWindow(b)
        table.insert(self.Windows, b)
        self:FocusWindow(b)
    end
    
    function a:UnregisterWindow(b)
        local c = table.find(self.Windows, b)
        if c then
            table.remove(self.Windows, c)
        end
    end
    
    return a
end

_modules["runtime/input"] = function()
    
    
    
    
    
    local a = game:GetService("UserInputService")
    local b = game:GetService("RunService")
    
    local c = {}
    c.__index = c
    
    function c.new(d)
        local e = setmetatable({
            Store = d,
            DraggingInstance = nil,
            DragOffset = nil,
            Connections = {},
        }, c)
        
        e:Initialize()
        return e
    end
    
    function c:Initialize()
        table.insert(self.Connections, a.InputBegan:Connect(function(d, e)
            if d.UserInputType == Enum.UserInputType.MouseButton1 or d.UserInputType == Enum.UserInputType.Touch then
                self:HandleDragBegan(d)
            end
        end))
        
        table.insert(self.Connections, a.InputEnded:Connect(function(d)
            if d.UserInputType == Enum.UserInputType.MouseButton1 or d.UserInputType == Enum.UserInputType.Touch then
                self:HandleDragEnded()
            end
        end))
        
        table.insert(self.Connections, b.RenderStepped:Connect(function()
            self:UpdateDragging()
        end))
    end
    
    function c:HandleDragBegan(d)
        
    end
    
    function c:HandleDragEnded()
        self.DraggingInstance = nil
        self.DragOffset = nil
    end
    
    function c:UpdateDragging()
        if self.DraggingInstance and self.DragOffset then
            local d = a:GetMouseLocation()
            
        end
    end
    
    function c:Destroy()
        for d, e in ipairs(self.Connections) do
            e:Disconnect()
        end
        self.Connections = {}
    end
    
    return c
end

_modules["runtime/mount"] = function()
    
    
    
    
    
    local a = {}
    a.__index = a
    
    local b = _require("dependencies/React")
    local c = _require("dependencies/ReactRoblox")
    local d = _require("components/Root")
    
    function a.new(e)
        local f = setmetatable({
            Store = e,
            Container = nil,
            Root = nil,
        }, a)
        
        f:CreateContainer()
        return f
    end
    
    local function getSafeGui()
        local e = game:GetService("CoreGui")
        local f = getgenv and getgenv().gethui
        local g = getgenv and getgenv().syn
        
        if g and g.protect_gui then
            local h = Instance.new("ScreenGui")
            g.protect_gui(h)
            h.Parent = e
            return h
        elseif f then
            local h = f()
            local i = Instance.new("ScreenGui")
            i.Parent = h
            return i
        else
            local h = Instance.new("ScreenGui")
            
            local i, j = pcall(function()
                h.Parent = e
            end)
            if not i then
                local k = game:GetService("Players").LocalPlayer
                if k then
                    local l = k:FindFirstChild("PlayerGui") or k:WaitForChild("PlayerGui", 5)
                    if l then
                        h.Parent = l
                    end
                end
            end
            return h
        end
    end
    
    function a:CreateContainer()
        local e = getSafeGui()
        if not e then return end
        
        e.Name = "HyperUI_" .. game:GetService("HttpService"):GenerateGUID(false):sub(1, 8)
        e.ResetOnSpawn = false
        e.IgnoreGuiInset = true
        e.DisplayOrder = 100
        
        self.Container = e
        
        
        local f = c.createRoot(e)
        f:render(b.createElement(d, { store = self.Store }))
        self.Root = f
    end
    
    function a:Unmount()
        if self.Root then
            local e, f = pcall(function() 
                self.Root:unmount() 
            end)
            if not e then
                warn("[HyperUI] Unmount error:", f)
            end
        end
        if self.Container then
            self.Container:Destroy()
        end
    end
    
    return a
end

_modules["theme/palette"] = function()
    local a = {
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
        Neutral = {
            [50] = Color3.fromHex("#fafafa"),
            [100] = Color3.fromHex("#f5f5f5"),
            [200] = Color3.fromHex("#e5e5e5"),
            [300] = Color3.fromHex("#d4d4d4"),
            [400] = Color3.fromHex("#a3a3a3"),
            [500] = Color3.fromHex("#737373"),
            [600] = Color3.fromHex("#525252"),
            [700] = Color3.fromHex("#404040"),
            [800] = Color3.fromHex("#262626"),
            [900] = Color3.fromHex("#171717"),
            [950] = Color3.fromHex("#0a0a0a"),
        },
        Stone = {
            [50] = Color3.fromHex("#fafaf9"),
            [100] = Color3.fromHex("#f5f5f4"),
            [200] = Color3.fromHex("#e7e5e4"),
            [300] = Color3.fromHex("#d6d3d1"),
            [400] = Color3.fromHex("#a8a29e"),
            [500] = Color3.fromHex("#78716c"),
            [600] = Color3.fromHex("#57534e"),
            [700] = Color3.fromHex("#44403c"),
            [800] = Color3.fromHex("#292524"),
            [900] = Color3.fromHex("#1c1917"),
            [950] = Color3.fromHex("#0c0a09"),
        },
        Blue = {
            [50] = Color3.fromHex("#eff6ff"),
            [100] = Color3.fromHex("#dbeafe"),
            [200] = Color3.fromHex("#bfdbfe"),
            [300] = Color3.fromHex("#93c5fd"),
            [400] = Color3.fromHex("#60a5fa"),
            [500] = Color3.fromHex("#3b82f6"),
            [600] = Color3.fromHex("#2563eb"),
            [700] = Color3.fromHex("#1d4ed8"),
            [800] = Color3.fromHex("#1e40af"),
            [900] = Color3.fromHex("#1e3a8a"),
            [950] = Color3.fromHex("#172554"),
        },
        Sky = {
            [50] = Color3.fromHex("#f0f9ff"),
            [100] = Color3.fromHex("#e0f2fe"),
            [200] = Color3.fromHex("#bae6fd"),
            [300] = Color3.fromHex("#7dd3fc"),
            [400] = Color3.fromHex("#38bdf8"),
            [500] = Color3.fromHex("#0ea5e9"),
            [600] = Color3.fromHex("#0284c7"),
            [700] = Color3.fromHex("#0369a1"),
            [800] = Color3.fromHex("#075985"),
            [900] = Color3.fromHex("#0c4a6e"),
            [950] = Color3.fromHex("#082f49"),
        },
        Cyan = {
            [50] = Color3.fromHex("#ecfeff"),
            [100] = Color3.fromHex("#cffafe"),
            [200] = Color3.fromHex("#a5f3fc"),
            [300] = Color3.fromHex("#67e8f9"),
            [400] = Color3.fromHex("#22d3ee"),
            [500] = Color3.fromHex("#06b6d4"),
            [600] = Color3.fromHex("#0891b2"),
            [700] = Color3.fromHex("#0e7490"),
            [800] = Color3.fromHex("#155e75"),
            [900] = Color3.fromHex("#164e63"),
            [950] = Color3.fromHex("#083344"),
        },
        Emerald = {
            [50] = Color3.fromHex("#ecfdf5"),
            [100] = Color3.fromHex("#d1fae5"),
            [200] = Color3.fromHex("#a7f3d0"),
            [300] = Color3.fromHex("#6ee7b7"),
            [400] = Color3.fromHex("#34d399"),
            [500] = Color3.fromHex("#10b981"),
            [600] = Color3.fromHex("#059669"),
            [700] = Color3.fromHex("#047857"),
            [800] = Color3.fromHex("#065f46"),
            [900] = Color3.fromHex("#064e3b"),
            [950] = Color3.fromHex("#022c22"),
        },
        Teal = {
            [50] = Color3.fromHex("#f0fdfa"),
            [100] = Color3.fromHex("#ccfbf1"),
            [200] = Color3.fromHex("#99f6e4"),
            [300] = Color3.fromHex("#5eead4"),
            [400] = Color3.fromHex("#2dd4bf"),
            [500] = Color3.fromHex("#14b8a6"),
            [600] = Color3.fromHex("#0d9488"),
            [700] = Color3.fromHex("#0f766e"),
            [800] = Color3.fromHex("#115e59"),
            [900] = Color3.fromHex("#134e4a"),
            [950] = Color3.fromHex("#042f2e"),
        },
        Green = {
            [50] = Color3.fromHex("#f0fdf4"),
            [100] = Color3.fromHex("#dcfce7"),
            [200] = Color3.fromHex("#bbf7d0"),
            [300] = Color3.fromHex("#86efac"),
            [400] = Color3.fromHex("#4ade80"),
            [500] = Color3.fromHex("#22c55e"),
            [600] = Color3.fromHex("#16a34a"),
            [700] = Color3.fromHex("#15803d"),
            [800] = Color3.fromHex("#166534"),
            [900] = Color3.fromHex("#14532d"),
            [950] = Color3.fromHex("#052e16"),
        },
        Lime = {
            [50] = Color3.fromHex("#f7fee7"),
            [100] = Color3.fromHex("#ecfccb"),
            [200] = Color3.fromHex("#d9f99d"),
            [300] = Color3.fromHex("#bef264"),
            [400] = Color3.fromHex("#a3e635"),
            [500] = Color3.fromHex("#84cc16"),
            [600] = Color3.fromHex("#65a30d"),
            [700] = Color3.fromHex("#4d7c0f"),
            [800] = Color3.fromHex("#3f6212"),
            [900] = Color3.fromHex("#365314"),
            [950] = Color3.fromHex("#1a2e05"),
        },
        Yellow = {
            [50] = Color3.fromHex("#fefce8"),
            [100] = Color3.fromHex("#fef9c3"),
            [200] = Color3.fromHex("#fef08a"),
            [300] = Color3.fromHex("#fde047"),
            [400] = Color3.fromHex("#facc15"),
            [500] = Color3.fromHex("#eab308"),
            [600] = Color3.fromHex("#ca8a04"),
            [700] = Color3.fromHex("#a16207"),
            [800] = Color3.fromHex("#854d0e"),
            [900] = Color3.fromHex("#713f12"),
            [950] = Color3.fromHex("#422006"),
        },
        Amber = {
            [50] = Color3.fromHex("#fffbeb"),
            [100] = Color3.fromHex("#fef3c7"),
            [200] = Color3.fromHex("#fde68a"),
            [300] = Color3.fromHex("#fcd34d"),
            [400] = Color3.fromHex("#fbbf24"),
            [500] = Color3.fromHex("#f59e0b"),
            [600] = Color3.fromHex("#d97706"),
            [700] = Color3.fromHex("#b45309"),
            [800] = Color3.fromHex("#92400e"),
            [900] = Color3.fromHex("#78350f"),
            [950] = Color3.fromHex("#451a03"),
        },
        Orange = {
            [50] = Color3.fromHex("#fff7ed"),
            [100] = Color3.fromHex("#ffedd5"),
            [200] = Color3.fromHex("#fed7aa"),
            [300] = Color3.fromHex("#fdba74"),
            [400] = Color3.fromHex("#fb923c"),
            [500] = Color3.fromHex("#f97316"),
            [600] = Color3.fromHex("#ea580c"),
            [700] = Color3.fromHex("#c2410c"),
            [800] = Color3.fromHex("#9a3412"),
            [900] = Color3.fromHex("#7c2d12"),
            [950] = Color3.fromHex("#431407"),
        },
        Red = {
            [50] = Color3.fromHex("#fef2f2"),
            [100] = Color3.fromHex("#fee2e2"),
            [200] = Color3.fromHex("#fecaca"),
            [300] = Color3.fromHex("#fca5a5"),
            [400] = Color3.fromHex("#f87171"),
            [500] = Color3.fromHex("#ef4444"),
            [600] = Color3.fromHex("#dc2626"),
            [700] = Color3.fromHex("#b91c1c"),
            [800] = Color3.fromHex("#991b1b"),
            [900] = Color3.fromHex("#7f1d1d"),
            [950] = Color3.fromHex("#450a0a"),
        },
        Rose = {
            [50] = Color3.fromHex("#fff1f2"),
            [100] = Color3.fromHex("#ffe4e6"),
            [200] = Color3.fromHex("#fecdd3"),
            [300] = Color3.fromHex("#fda4af"),
            [400] = Color3.fromHex("#fb7185"),
            [500] = Color3.fromHex("#f43f5e"),
            [600] = Color3.fromHex("#e11d48"),
            [700] = Color3.fromHex("#be123c"),
            [800] = Color3.fromHex("#9f1239"),
            [900] = Color3.fromHex("#881337"),
            [950] = Color3.fromHex("#4c0519"),
        },
        Pink = {
            [50] = Color3.fromHex("#fdf2f8"),
            [100] = Color3.fromHex("#fce7f3"),
            [200] = Color3.fromHex("#fbcfe8"),
            [300] = Color3.fromHex("#f9a8d4"),
            [400] = Color3.fromHex("#f472b6"),
            [500] = Color3.fromHex("#ec4899"),
            [600] = Color3.fromHex("#db2777"),
            [700] = Color3.fromHex("#be185d"),
            [800] = Color3.fromHex("#9d174d"),
            [900] = Color3.fromHex("#831843"),
            [950] = Color3.fromHex("#500724"),
        },
        Fuchsia = {
            [50] = Color3.fromHex("#fdf4ff"),
            [100] = Color3.fromHex("#fae8ff"),
            [200] = Color3.fromHex("#f5d0fe"),
            [300] = Color3.fromHex("#f0abfc"),
            [400] = Color3.fromHex("#e879f9"),
            [500] = Color3.fromHex("#d946ef"),
            [600] = Color3.fromHex("#c026d3"),
            [700] = Color3.fromHex("#a21caf"),
            [800] = Color3.fromHex("#86198f"),
            [900] = Color3.fromHex("#701a75"),
            [950] = Color3.fromHex("#4a044e"),
        },
        Purple = {
            [50] = Color3.fromHex("#faf5ff"),
            [100] = Color3.fromHex("#f3e8ff"),
            [200] = Color3.fromHex("#e9d5ff"),
            [300] = Color3.fromHex("#d8b4fe"),
            [400] = Color3.fromHex("#c084fc"),
            [500] = Color3.fromHex("#a855f7"),
            [600] = Color3.fromHex("#9333ea"),
            [700] = Color3.fromHex("#7e22ce"),
            [800] = Color3.fromHex("#6b21a8"),
            [900] = Color3.fromHex("#581c87"),
            [950] = Color3.fromHex("#3b0764"),
        },
        Violet = {
            [50] = Color3.fromHex("#f5f3ff"),
            [100] = Color3.fromHex("#ede9fe"),
            [200] = Color3.fromHex("#ddd6fe"),
            [300] = Color3.fromHex("#c4b5fd"),
            [400] = Color3.fromHex("#a78bfa"),
            [500] = Color3.fromHex("#8b5cf6"),
            [600] = Color3.fromHex("#7c3aed"),
            [700] = Color3.fromHex("#6d28d9"),
            [800] = Color3.fromHex("#5b21b6"),
            [900] = Color3.fromHex("#4c1d95"),
            [950] = Color3.fromHex("#2e1065"),
        },
        White = Color3.fromHex("#ffffff"),
        Black = Color3.fromHex("#000000"),
        Transparent = Color3.new(0, 0, 0),
    }
    
    return a
end

_modules["theme/shadows"] = function()
    
    
    
    
    
    local a = {
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
    
    return a
end

_modules["theme/tokens"] = function()
    
    
    
    
    
    
    local a = _require("theme/palette")
    local b = _require("theme/typography")
    local c = _require("theme/shadows")
    
    
    
    
    
    local function buildTheme(d, e, f, g, h)
        return {
            Color      = d,
            Spacing    = e or {
                [1] = 4, [2] = 8, [3] = 12,
                [4] = 16, [6] = 24, [8] = 32,
            },
            Radius     = f or {
                Small = 4, Medium = 8, Large = 12, Full = 999,
            },
            Typography = g or b,
            Shadows    = h    or c,
            
            Font     = (g or b).Font,
            FontSize = (g or b).Size,
        }
    end
    
    
    
    
    
    local d = {}
    
    
    d.Default = buildTheme({
        Background  = a.Slate[950],
        Surface     = a.Slate[900],
        SurfaceAlt  = a.Slate[800],
        Border      = a.Slate[700],
        Text        = a.Slate[100],
        TextMuted   = a.Slate[400],
        TextOnAccent= a.White,
        Accent      = a.Blue[500],
        AccentHover = a.Blue[400],
        AccentMuted = a.Blue[900],
        Success     = a.Emerald[500],
        Warning     = a.Amber[400],
        Error       = a.Rose[500],
        Info        = a.Sky[400],
    })
    
    
    d.Light = buildTheme({
        Background  = a.White,
        Surface     = a.Slate[50],
        SurfaceAlt  = a.Slate[100],
        Border      = a.Slate[200],
        Text        = a.Slate[900],
        TextMuted   = a.Slate[500],
        TextOnAccent= a.White,
        Accent      = a.Blue[600],
        AccentHover = a.Blue[700],
        AccentMuted = a.Blue[100],
        Success     = a.Emerald[600],
        Warning     = a.Amber[500],
        Error       = a.Rose[600],
        Info        = a.Sky[500],
    })
    
    
    d.Midnight = buildTheme({
        Background  = a.Neutral[950],
        Surface     = a.Neutral[900],
        SurfaceAlt  = a.Neutral[800],
        Border      = a.Neutral[700],
        Text        = a.Neutral[50],
        TextMuted   = a.Neutral[400],
        TextOnAccent= a.Black,
        Accent      = a.Violet[400],
        AccentHover = a.Violet[300],
        AccentMuted = a.Violet[900],
        Success     = a.Teal[400],
        Warning     = a.Yellow[400],
        Error       = a.Red[400],
        Info        = a.Cyan[400],
    },
    {   
        [1] = 3, [2] = 6, [3] = 10,
        [4] = 14, [6] = 20, [8] = 28,
    },
    {   
        Small = 2, Medium = 4, Large = 8, Full = 999,
    })
    
    
    d.Ocean = buildTheme({
        Background  = a.Blue[950],
        Surface     = a.Blue[900],
        SurfaceAlt  = a.Blue[800],
        Border      = a.Blue[700],
        Text        = a.Sky[50],
        TextMuted   = a.Sky[300],
        TextOnAccent= a.Blue[950],
        Accent      = a.Cyan[400],
        AccentHover = a.Cyan[300],
        AccentMuted = a.Cyan[900],
        Success     = a.Emerald[400],
        Warning     = a.Amber[300],
        Error       = a.Rose[400],
        Info        = a.Blue[300],
    })
    
    
    d.Forest = buildTheme({
        Background  = a.Green[950],
        Surface     = a.Green[900],
        SurfaceAlt  = a.Green[800],
        Border      = a.Green[700],
        Text        = a.Green[50],
        TextMuted   = a.Green[300],
        TextOnAccent= a.Green[950],
        Accent      = a.Lime[400],
        AccentHover = a.Lime[300],
        AccentMuted = a.Green[800],
        Success     = a.Emerald[400],
        Warning     = a.Yellow[400],
        Error       = a.Red[400],
        Info        = a.Teal[400],
    },
    nil,
    {   
        Small = 6, Medium = 12, Large = 20, Full = 999,
    })
    
    
    d.Sunset = buildTheme({
        Background  = a.Orange[950],
        Surface     = a.Orange[900],
        SurfaceAlt  = a.Orange[800],
        Border      = a.Orange[700],
        Text        = a.Orange[50],
        TextMuted   = a.Orange[300],
        TextOnAccent= a.White,
        Accent      = a.Yellow[400],
        AccentHover = a.Yellow[300],
        AccentMuted = a.Orange[800],
        Success     = a.Lime[400],
        Warning     = a.Amber[300],
        Error       = a.Rose[400],
        Info        = a.Sky[400],
    })
    
    
    d.Rose = buildTheme({
        Background  = a.Pink[950],
        Surface     = a.Pink[900],
        SurfaceAlt  = a.Pink[800],
        Border      = a.Pink[700],
        Text        = a.Pink[50],
        TextMuted   = a.Pink[300],
        TextOnAccent= a.White,
        Accent      = a.Rose[400],
        AccentHover = a.Rose[300],
        AccentMuted = a.Pink[800],
        Success     = a.Emerald[400],
        Warning     = a.Amber[300],
        Error       = a.Red[400],
        Info        = a.Purple[400],
    },
    nil,
    {   
        Small = 8, Medium = 16, Large = 24, Full = 999,
    })
    
    
    d.Aurora = buildTheme({
        Background  = a.Purple[950],
        Surface     = a.Purple[900],
        SurfaceAlt  = a.Purple[800],
        Border      = a.Purple[700],
        Text        = a.Violet[50],
        TextMuted   = a.Violet[300],
        TextOnAccent= a.Purple[950],
        Accent      = a.Teal[400],
        AccentHover = a.Teal[300],
        AccentMuted = a.Purple[800],
        Success     = a.Emerald[400],
        Warning     = a.Amber[300],
        Error       = a.Rose[400],
        Info        = a.Sky[400],
    })
    
    
    d.Neon = buildTheme({
        Background  = a.Neutral[950],
        Surface     = a.Neutral[900],
        SurfaceAlt  = a.Neutral[800],
        Border      = a.Fuchsia[600],
        Text        = a.White,
        TextMuted   = a.Neutral[400],
        TextOnAccent= a.Black,
        Accent      = a.Fuchsia[400],
        AccentHover = a.Fuchsia[300],
        AccentMuted = a.Fuchsia[950],
        Success     = a.Green[400],
        Warning     = a.Yellow[300],
        Error       = a.Red[400],
        Info        = a.Cyan[400],
    },
    {   
        [1] = 4, [2] = 8, [3] = 14,
        [4] = 20, [6] = 32, [8] = 48,
    },
    {   
        Small = 0, Medium = 2, Large = 4, Full = 999,
    })
    
    
    d.Sand = buildTheme({
        Background  = a.Stone[50],
        Surface     = a.Stone[100],
        SurfaceAlt  = a.Stone[200],
        Border      = a.Stone[300],
        Text        = a.Stone[900],
        TextMuted   = a.Stone[500],
        TextOnAccent= a.White,
        Accent      = a.Orange[600],
        AccentHover = a.Orange[700],
        AccentMuted = a.Orange[100],
        Success     = a.Green[600],
        Warning     = a.Amber[500],
        Error       = a.Red[600],
        Info        = a.Blue[500],
    })
    
    
    d.Terminal = buildTheme({
        Background  = Color3.fromRGB(10, 14, 10),
        Surface     = Color3.fromRGB(16, 24, 16),
        SurfaceAlt  = Color3.fromRGB(24, 36, 24),
        Border      = Color3.fromRGB(0, 100, 0),
        Text        = Color3.fromRGB(0, 230, 0),
        TextMuted   = Color3.fromRGB(0, 140, 0),
        TextOnAccent= Color3.fromRGB(10, 14, 10),
        Accent      = Color3.fromRGB(0, 255, 80),
        AccentHover = Color3.fromRGB(80, 255, 120),
        AccentMuted = Color3.fromRGB(0, 60, 0),
        Success     = Color3.fromRGB(0, 200, 60),
        Warning     = Color3.fromRGB(200, 200, 0),
        Error       = Color3.fromRGB(255, 60, 60),
        Info        = Color3.fromRGB(0, 180, 200),
    },
    nil,
    {   
        Small = 0, Medium = 0, Large = 0, Full = 999,
    })
    
    
    d.Sepia = buildTheme({
        Background  = Color3.fromRGB(245, 235, 215),
        Surface     = Color3.fromRGB(235, 222, 195),
        SurfaceAlt  = Color3.fromRGB(220, 205, 175),
        Border      = Color3.fromRGB(180, 158, 120),
        Text        = Color3.fromRGB(60, 40, 20),
        TextMuted   = Color3.fromRGB(120, 95, 65),
        TextOnAccent= Color3.fromRGB(245, 235, 215),
        Accent      = Color3.fromRGB(140, 80, 20),
        AccentHover = Color3.fromRGB(110, 60, 10),
        AccentMuted = Color3.fromRGB(220, 195, 160),
        Success     = Color3.fromRGB(60, 120, 60),
        Warning     = Color3.fromRGB(180, 130, 20),
        Error       = Color3.fromRGB(160, 40, 30),
        Info        = Color3.fromRGB(50, 90, 150),
    },
    nil,
    {   
        Small = 3, Medium = 6, Large = 10, Full = 999,
    })
    
    
    d.Ice = buildTheme({
        Background  = Color3.fromRGB(235, 245, 255),
        Surface     = Color3.fromRGB(220, 235, 250),
        SurfaceAlt  = Color3.fromRGB(200, 220, 245),
        Border      = Color3.fromRGB(160, 195, 235),
        Text        = Color3.fromRGB(20, 40, 80),
        TextMuted   = Color3.fromRGB(80, 110, 160),
        TextOnAccent= Color3.fromRGB(235, 245, 255),
        Accent      = Color3.fromRGB(30, 100, 220),
        AccentHover = Color3.fromRGB(20, 80, 190),
        AccentMuted = Color3.fromRGB(190, 215, 250),
        Success     = Color3.fromRGB(20, 150, 110),
        Warning     = Color3.fromRGB(180, 130, 20),
        Error       = Color3.fromRGB(200, 50, 50),
        Info        = Color3.fromRGB(30, 130, 210),
    },
    nil,
    {   
        Small = 10, Medium = 18, Large = 28, Full = 999,
    })
    
    
    d.Lava = buildTheme({
        Background  = Color3.fromRGB(14, 8, 6),
        Surface     = Color3.fromRGB(28, 14, 10),
        SurfaceAlt  = Color3.fromRGB(46, 20, 14),
        Border      = Color3.fromRGB(120, 40, 20),
        Text        = Color3.fromRGB(255, 220, 200),
        TextMuted   = Color3.fromRGB(180, 120, 100),
        TextOnAccent= Color3.fromRGB(14, 8, 6),
        Accent      = Color3.fromRGB(255, 80, 20),
        AccentHover = Color3.fromRGB(255, 120, 60),
        AccentMuted = Color3.fromRGB(80, 20, 10),
        Success     = Color3.fromRGB(100, 200, 80),
        Warning     = Color3.fromRGB(255, 180, 0),
        Error       = Color3.fromRGB(255, 40, 40),
        Info        = Color3.fromRGB(80, 160, 240),
    })
    
    
    d.Galaxy = buildTheme({
        Background  = Color3.fromRGB(8, 6, 18),
        Surface     = Color3.fromRGB(16, 12, 36),
        SurfaceAlt  = Color3.fromRGB(26, 20, 54),
        Border      = Color3.fromRGB(60, 40, 120),
        Text        = Color3.fromRGB(220, 210, 255),
        TextMuted   = Color3.fromRGB(130, 110, 200),
        TextOnAccent= Color3.fromRGB(8, 6, 18),
        Accent      = Color3.fromRGB(160, 100, 255),
        AccentHover = Color3.fromRGB(180, 130, 255),
        AccentMuted = Color3.fromRGB(40, 20, 80),
        Success     = Color3.fromRGB(80, 220, 160),
        Warning     = Color3.fromRGB(255, 200, 80),
        Error       = Color3.fromRGB(255, 80, 120),
        Info        = Color3.fromRGB(80, 180, 255),
    })
    
    
    d.Copper = buildTheme({
        Background  = Color3.fromRGB(22, 14, 8),
        Surface     = Color3.fromRGB(38, 24, 12),
        SurfaceAlt  = Color3.fromRGB(56, 36, 16),
        Border      = Color3.fromRGB(140, 80, 30),
        Text        = Color3.fromRGB(255, 230, 180),
        TextMuted   = Color3.fromRGB(180, 130, 80),
        TextOnAccent= Color3.fromRGB(22, 14, 8),
        Accent      = Color3.fromRGB(200, 110, 40),
        AccentHover = Color3.fromRGB(220, 140, 70),
        AccentMuted = Color3.fromRGB(80, 40, 10),
        Success     = Color3.fromRGB(80, 180, 80),
        Warning     = Color3.fromRGB(230, 180, 20),
        Error       = Color3.fromRGB(220, 60, 40),
        Info        = Color3.fromRGB(60, 140, 200),
    },
    nil,
    {   
        Small = 2, Medium = 4, Large = 6, Full = 999,
    })
    
    
    d.Pastel = buildTheme({
        Background  = Color3.fromRGB(255, 250, 252),
        Surface     = Color3.fromRGB(250, 240, 255),
        SurfaceAlt  = Color3.fromRGB(240, 245, 255),
        Border      = Color3.fromRGB(210, 195, 230),
        Text        = Color3.fromRGB(60, 50, 80),
        TextMuted   = Color3.fromRGB(130, 115, 155),
        TextOnAccent= Color3.fromRGB(255, 250, 252),
        Accent      = Color3.fromRGB(180, 130, 220),
        AccentHover = Color3.fromRGB(160, 105, 205),
        AccentMuted = Color3.fromRGB(235, 220, 250),
        Success     = Color3.fromRGB(100, 200, 150),
        Warning     = Color3.fromRGB(240, 190, 100),
        Error       = Color3.fromRGB(240, 130, 140),
        Info        = Color3.fromRGB(110, 170, 240),
    },
    nil,
    {   
        Small = 12, Medium = 20, Large = 32, Full = 999,
    })
    
    
    d.Monochrome = buildTheme({
        Background  = Color3.fromRGB(10, 10, 10),
        Surface     = Color3.fromRGB(22, 22, 22),
        SurfaceAlt  = Color3.fromRGB(36, 36, 36),
        Border      = Color3.fromRGB(60, 60, 60),
        Text        = Color3.fromRGB(240, 240, 240),
        TextMuted   = Color3.fromRGB(140, 140, 140),
        TextOnAccent= Color3.fromRGB(10, 10, 10),
        Accent      = Color3.fromRGB(220, 220, 220),
        AccentHover = Color3.fromRGB(255, 255, 255),
        AccentMuted = Color3.fromRGB(50, 50, 50),
        Success     = Color3.fromRGB(190, 190, 190),
        Warning     = Color3.fromRGB(170, 170, 170),
        Error       = Color3.fromRGB(200, 200, 200),
        Info        = Color3.fromRGB(160, 160, 160),
    },
    nil,
    {   
        Small = 0, Medium = 0, Large = 0, Full = 0,
    })
    
    
    d.Nordic = buildTheme({
        Background  = Color3.fromRGB(36, 40, 50),
        Surface     = Color3.fromRGB(48, 54, 66),
        SurfaceAlt  = Color3.fromRGB(62, 70, 84),
        Border      = Color3.fromRGB(88, 98, 116),
        Text        = Color3.fromRGB(220, 228, 240),
        TextMuted   = Color3.fromRGB(140, 155, 180),
        TextOnAccent= Color3.fromRGB(36, 40, 50),
        Accent      = Color3.fromRGB(130, 180, 240),
        AccentHover = Color3.fromRGB(155, 200, 255),
        AccentMuted = Color3.fromRGB(50, 70, 100),
        Success     = Color3.fromRGB(100, 190, 130),
        Warning     = Color3.fromRGB(240, 190, 80),
        Error       = Color3.fromRGB(220, 90, 90),
        Info        = Color3.fromRGB(100, 170, 230),
    })
    
    
    d.Sakura = buildTheme({
        Background  = Color3.fromRGB(255, 248, 250),
        Surface     = Color3.fromRGB(255, 238, 244),
        SurfaceAlt  = Color3.fromRGB(252, 222, 234),
        Border      = Color3.fromRGB(240, 180, 200),
        Text        = Color3.fromRGB(60, 30, 45),
        TextMuted   = Color3.fromRGB(150, 100, 120),
        TextOnAccent= Color3.fromRGB(255, 248, 250),
        Accent      = Color3.fromRGB(220, 80, 120),
        AccentHover = Color3.fromRGB(200, 60, 100),
        AccentMuted = Color3.fromRGB(255, 215, 230),
        Success     = Color3.fromRGB(60, 170, 100),
        Warning     = Color3.fromRGB(220, 160, 30),
        Error       = Color3.fromRGB(210, 50, 70),
        Info        = Color3.fromRGB(70, 140, 210),
    },
    nil,
    {   
        Small = 8, Medium = 16, Large = 24, Full = 999,
    })
    
    
    
    
    
    
    d._Names = {
        "Default",
        "Light",
        "Midnight",
        "Ocean",
        "Forest",
        "Sunset",
        "Rose",
        "Aurora",
        "Neon",
        "Sand",
        "Terminal",
        "Sepia",
        "Ice",
        "Lava",
        "Galaxy",
        "Copper",
        "Pastel",
        "Monochrome",
        "Nordic",
        "Sakura",
    }
    
    
    d._Active = "Default"
    
    
    
    
    function d:Get(e)
        local f = e or self._Active
        return self[f] or self.Default
    end
    
    
    
    
    function d:Set(e)
        if self[e] and type(self[e]) == "table" then
            self._Active = e
            return true
        end
        warn(("[HyperUI] Tema '%s' no encontrado. Se mantiene '%s'."):format(tostring(e), self._Active))
        return false
    end
    
    
    
    
    function d:Register(e, f)
        assert(type(e)   == "string", "[HyperUI] El nombre del tema debe ser una cadena.")
        assert(type(f) == "table",  "[HyperUI] Los tokens del tema deben ser una tabla.")
        self[e] = f
        table.insert(self._Names, e)
    end
    
    return d
end

_modules["theme/typography"] = function()
    
    
    
    
    local a = {
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
    
    return a
end


_require = function(name)
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
