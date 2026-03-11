--[[
    HyperUI v2 - Playground Component Registry
    Stores definitions and render functions for component demos.
]]

local React = require(script.Parent.Parent.Parent.src.v2.dependencies.React)
local Elements = script.Parent.Parent.Parent.src.v2.components.Elements
local Containers = script.Parent.Parent.Parent.src.v2.components.Containers

local Registry = {
    _elements = {},
}

function Registry:Register(category, name, data)
    if not self._elements[category] then
        self._elements[category] = {}
    end
    
    self._elements[category][name] = {
        name = name,
        category = category,
        render = data.render,
        props = data.props or {},
        description = data.description or ""
    }
end

function Registry:GetCategories()
    local categories = {}
    for cat, _ in pairs(self._elements) do
        table.insert(categories, cat)
    end
    table.sort(categories)
    return categories
end

function Registry:GetElementsByCategory(category)
    return self._elements[category] or {}
end

function Registry:GetElement(category, name)
    return self._elements[category] and self._elements[category][name]
end

-- REQUIRE ELEMENTS
local HyperButton = require(Elements.HyperButton)
local HyperIconButton = require(Elements.HyperIconButton)
local HyperToggle = require(Elements.HyperToggle)
local HyperCheckbox = require(Elements.HyperCheckbox)
local HyperSlider = require(Elements.HyperSlider)
local HyperDropdown = require(Elements.HyperDropdown)
local HyperKeybind = require(Elements.HyperKeybind)
local HyperColorPicker = require(Elements.HyperColorPicker)

local HyperInput = require(Elements.HyperInput)
local HyperNumberInput = require(Elements.HyperNumberInput)
local HyperSearchInput = require(Elements.HyperSearchInput)
local HyperTextArea = require(Elements.HyperTextArea)
local HyperComboBox = require(Elements.HyperComboBox)

local HyperLabel = require(Elements.HyperLabel)
local HyperBadge = require(Elements.HyperBadge)
local HyperIcon = require(Elements.HyperIcon)
local HyperAvatar = require(Elements.HyperAvatar)
local HyperProgressBar = require(Elements.HyperProgressBar)
local HyperStatDisplay = require(Elements.HyperStatDisplay)

local HyperDivider = require(Elements.HyperDivider)
local HyperSpacer = require(Elements.HyperSpacer)
local HyperGroup = require(Elements.HyperGroup)

local HyperToast = require(Elements.HyperToast)
local HyperTooltip = require(Elements.HyperTooltip)
local HyperModal = require(Elements.HyperModal)
local HyperConfirmationDialog = require(Elements.HyperConfirmationDialog)

local HyperAccordion = require(Elements.HyperAccordion)
local HyperCollapsible = require(Elements.HyperCollapsible)
local TabBar = require(Containers.TabBar)
local Sidebar = require(Containers.Sidebar)

local HyperCopyButton = require(Elements.HyperCopyButton)
local HyperTag = require(Elements.HyperTag)
local HyperStatusIndicator = require(Elements.HyperStatusIndicator)

-- 1. CONTROLS
Registry:Register("Controls", "Button", {
    description = "Standard animated button.",
    props = { Text = "Button", Disabled = false },
    render = function(props) return React.createElement(HyperButton, props) end
})

Registry:Register("Controls", "IconButton", {
    description = "Icon-only button.",
    props = { Icon = "rbxassetid://10723346371" },
    render = function(props) return React.createElement(HyperIconButton, props) end
})

Registry:Register("Controls", "Toggle", {
    description = "Animated switch.",
    props = { Text = "Toggle label", Value = false },
    render = function(props) return React.createElement(HyperToggle, props) end
})

Registry:Register("Controls", "Checkbox", {
    description = "Standard tick box.",
    props = { Text = "Checkbox label", Value = false },
    render = function(props) return React.createElement(HyperCheckbox, props) end
})

Registry:Register("Controls", "Slider", {
    description = "Draggable range selection.",
    props = { Text = "Volume", Min = 0, Max = 100, Value = 50 },
    render = function(props) return React.createElement(HyperSlider, props) end
})

Registry:Register("Controls", "Dropdown", {
    description = "Single item selection.",
    props = { Text = "Select Option", Options = {"One", "Two", "Three"}, Value = "One" },
    render = function(props) return React.createElement(HyperDropdown, props) end
})

Registry:Register("Controls", "MultiDropdown", {
    description = "Multiple item selection.",
    props = { Text = "Select Options", Options = {"Apple", "Banana", "Cherry"}, Value = {"Apple"}, Multi = true },
    render = function(props) return React.createElement(HyperDropdown, props) end
})

Registry:Register("Controls", "Keybind", {
    description = "Capture keyboard input.",
    props = { Text = "Action Bind", Value = Enum.KeyCode.E },
    render = function(props) return React.createElement(HyperKeybind, props) end
})

Registry:Register("Controls", "ColorPicker", {
    description = "HSL color selection.",
    props = { Text = "Accent Color", Value = Color3.new(1, 0, 0) },
    render = function(props) return React.createElement(HyperColorPicker, props) end
})

-- 2. INPUTS
Registry:Register("Inputs", "Input", {
    description = "Text entry field.",
    props = { Text = "Username", Placeholder = "Enter name...", Value = "" },
    render = function(props) return React.createElement(HyperInput, props) end
})

Registry:Register("Inputs", "NumberInput", {
    description = "Validated numeric entry.",
    props = { Text = "Count", Min = 0, Max = 99, Value = 5 },
    render = function(props) return React.createElement(HyperNumberInput, props) end
})

Registry:Register("Inputs", "SearchInput", {
    description = "Search focused input.",
    props = { Placeholder = "Filter...", Value = "" },
    render = function(props) return React.createElement(HyperSearchInput, props) end
})

Registry:Register("Inputs", "TextArea", {
    description = "Multi-line text area.",
    props = { Placeholder = "Write something...", Value = "" },
    render = function(props) return React.createElement(HyperTextArea, props) end
})

Registry:Register("Inputs", "ComboBox", {
    description = "Input + Dropdown combo.",
    props = { Text = "Select or Type", Options = {"A", "B", "C"}, Value = "A" },
    render = function(props) return React.createElement(HyperComboBox, props) end
})

-- 3. DISPLAY
Registry:Register("Display", "Label", {
    description = "Informative text.",
    props = { Text = "This is a label", Description = "Supporting description." },
    render = function(props) return React.createElement(HyperLabel, props) end
})

Registry:Register("Display", "Badge", {
    description = "Status tag.",
    props = { Text = "NEW", Color = Color3.new(0, 1, 0) },
    render = function(props) return React.createElement(HyperBadge, props) end
})

Registry:Register("Display", "Icon", {
    description = "Visual symbol.",
    props = { Icon = "rbxassetid://10723346959", Size = 24 },
    render = function(props) return React.createElement(HyperIcon, props) end
})

Registry:Register("Display", "Avatar", {
    description = "Roblox user profile.",
    props = { UserId = 1, Size = 48 },
    render = function(props) return React.createElement(HyperAvatar, props) end
})

Registry:Register("Display", "ProgressBar", {
    description = "Completion indicator.",
    props = { Text = "Loading...", Value = 45 },
    render = function(props) return React.createElement(HyperProgressBar, props) end
})

Registry:Register("Display", "StatDisplay", {
    description = "Large metric display.",
    props = { Title = "Active Users", Value = "12,450", SubValue = "+5% vs last week" },
    render = function(props) return React.createElement(HyperStatDisplay, props) end
})

-- 4. LAYOUT
Registry:Register("Layout", "Divider", {
    description = "Visual separator.",
    props = {},
    render = function(props) return React.createElement(HyperDivider, props) end
})

Registry:Register("Layout", "Spacer", {
    description = "Layout gap.",
    props = { Height = 20 },
    render = function(props) return React.createElement(HyperSpacer, props) end
})

Registry:Register("Layout", "Group", {
    description = "Nested container.",
    props = {},
    render = function(props) return React.createElement(HyperGroup, props, {
        React.createElement(HyperButton, { Text = "Nested Button" })
    }) end
})

-- 5. FEEDBACK
Registry:Register("Feedback", "Toast", {
    description = "Ephemeral alert.",
    props = { Title = "Warning", Content = "Low battery detected.", Priority = "Warning" },
    render = function(props) return React.createElement(HyperToast, props) end
})

Registry:Register("Feedback", "Tooltip", {
    description = "Hover context bubble.",
    props = { Text = "Click for more info", Visible = true },
    render = function(props) return React.createElement(HyperTooltip, props) end
})

Registry:Register("Feedback", "Modal", {
    description = "Focus-capturing overlay.",
    props = { Title = "Critical Action", Content = "Confirm your choice.", Open = true },
    render = function(props) return React.createElement(HyperModal, props) end
})

Registry:Register("Feedback", "Confirmation", {
    description = "Confirm/Cancel dialog.",
    props = { Title = "Delete All?", Content = "This is permanent.", Open = true },
    render = function(props) return React.createElement(HyperConfirmationDialog, props) end
})

-- 6. NAVIGATION
Registry:Register("Navigation", "TabBar", {
    description = "Horizontal menu tabs.",
    props = {},
    render = function(props) return React.createElement(TabBar, props, {
        React.createElement(TabBar.Item, { Title = "Overview", Selected = true }),
        React.createElement(TabBar.Item, { Title = "Settings", Selected = false }),
    }) end
})

Registry:Register("Navigation", "Accordion", {
    description = "Collapsible grouping.",
    props = { Title = "More Settings" },
    render = function(props) return React.createElement(HyperAccordion, props, {
        React.createElement(HyperButton, { Text = "Action A" }),
        React.createElement(HyperButton, { Text = "Action B" }),
    }) end
})

Registry:Register("Navigation", "Collapsible", {
    description = "Simple collapsible content.",
    props = { Title = "Section Info" },
    render = function(props) return React.createElement(HyperCollapsible, props, {
        React.createElement(HyperLabel, { Text = "Hidden detail text." })
    }) end
})

-- 7. UTILITY
Registry:Register("Utility", "CopyButton", {
    description = "Clipboard trigger.",
    props = { Text = "Copy Session ID", Value = "XYZ-123" },
    render = function(props) return React.createElement(HyperCopyButton, props) end
})

Registry:Register("Utility", "Tag", {
    description = "Dismissible status item.",
    props = { Text = "Admin" },
    render = function(props) return React.createElement(HyperTag, props) end
})

Registry:Register("Utility", "StatusIndicator", {
    description = "Real-time state dot.",
    props = { Status = "Online" },
    render = function(props) return React.createElement(HyperStatusIndicator, props) end
})

return Registry
