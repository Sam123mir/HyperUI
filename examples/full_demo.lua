--[[
    HyperUI v2 - Official Demo Showcase
    Purpose: Testing, Validation, and Documentation.
]]

-- Load HyperUI via GitHub Raw URL
local HyperUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sam123mir/HyperUI/main/dist/HyperUI.lua"))()

local UI = HyperUI.new()

local Window = UI:CreateWindow({
    Title = "HyperUI v2 Demo",
    Icon = "rbxassetid://123456789", -- Placeholder icon
})

--------------------------------------------------------------------------------
-- 1. CONTROLS TAB
--------------------------------------------------------------------------------
local ControlsTab = Window:CreateTab({
    Title = "Controls",
    Icon = "rbxassetid://10723343321"
})

local ActionSection = ControlsTab:CreateSection({ Title = "Action Triggers" })

ActionSection:CreateButton({
    Text = "Standard Button",
    Description = "A simple animated button with a callback.",
    Callback = function()
        print("Standard Button Clicked!")
        UI:Notify({ Title = "Success", Content = "Button interaction verified.", Priority = "Success" })
    end
})

ActionSection:CreateIconButton({
    Icon = "rbxassetid://10723346371",
    Callback = function() print("Icon Button Clicked!") end
})

local StateSection = ControlsTab:CreateSection({ Title = "State Selectors" })

StateSection:CreateToggle({
    Text = "Feature Toggle",
    Description = "Enable or disable a specific feature.",
    Default = true,
    Callback = function(state) print("Toggle State:", state) end
})

StateSection:CreateCheckbox({
    Text = "Accept Terms",
    Default = false,
    Callback = function(state) print("Checkbox State:", state) end
})

local SelectionSection = ControlsTab:CreateSection({ Title = "Selection" })

SelectionSection:CreateSlider({
    Text = "Volume Control",
    Min = 0,
    Max = 100,
    Default = 50,
    Callback = function(val) print("Slider Value:", val) end
})

SelectionSection:CreateDropdown({
    Text = "Select Server",
    Options = {"US-East", "US-West", "EU-Central", "Asia-East"},
    Default = "US-East",
    Callback = function(val) print("Dropdown Selection:", val) end
})

SelectionSection:CreateMultiDropdown({
    Text = "Filter Tags",
    Options = {"Combat", "Economy", "Social", "Stealth"},
    Default = {"Combat", "Social"},
    Callback = function(tags) print("MultiDropdown Selection:", table.concat(tags, ", ")) end
})

SelectionSection:CreateColorPicker({
    Text = "Accent Color",
    Default = Color3.fromRGB(0, 120, 255),
    Callback = function(color) print("Color Selected:", color) end
})

SelectionSection:CreateKeybind({
    Text = "Open Menu",
    Default = Enum.KeyCode.F4,
    Callback = function() print("Keybind Triggered!") end
})

--------------------------------------------------------------------------------
-- 2. INPUTS TAB
--------------------------------------------------------------------------------
local InputsTab = Window:CreateTab({
    Title = "Inputs",
    Icon = "rbxassetid://10723345799"
})

local TextSection = InputsTab:CreateSection({ Title = "Text Input" })

TextSection:CreateInput({
    Text = "Username",
    Placeholder = "Enter username...",
    Callback = function(val) print("Input:", val) end
})

TextSection:CreateSearchInput({
    Placeholder = "Search items...",
    Callback = function(query) print("Search Query:", query) end
})

TextSection:CreateTextArea({
    Text = "User Biography",
    Placeholder = "Tell us about yourself...",
    Callback = function(val) print("TextArea content updated") end
})

local NumericSection = InputsTab:CreateSection({ Title = "Numeric Input" })

NumericSection:CreateNumberInput({
    Text = "WalkSpeed",
    Default = 16,
    Min = 0,
    Max = 500,
    Callback = function(val) print("Number Input:", val) end
})

--------------------------------------------------------------------------------
-- 3. DISPLAY TAB
--------------------------------------------------------------------------------
local DisplayTab = Window:CreateTab({
    Title = "Display",
    Icon = "rbxassetid://10723346514"
})

local InfoSection = DisplayTab:CreateSection({ Title = "Information" })

InfoSection:CreateLabel({
    Text = "System Status: Online",
    Description = "Last checked 2 minutes ago."
})

InfoSection:CreateBadge({
    Text = "BETA",
    Color = Color3.fromRGB(255, 170, 0)
})

local VisualSection = DisplayTab:CreateSection({ Title = "Visuals" })

VisualSection:CreateIcon({
    Icon = "rbxassetid://10723346959",
    Size = 32
})

VisualSection:CreateProgressBar({
    Text = "Level Progress",
    Value = 75, -- 75%
})

VisualSection:CreateStatDisplay({
    Title = "Total Earnings",
    Value = "$1,250,000",
    SubValue = "+12% today"
})

--------------------------------------------------------------------------------
-- 4. LAYOUT TAB
--------------------------------------------------------------------------------
local LayoutTab = Window:CreateTab({
    Title = "Layout",
    Icon = "rbxassetid://10723345102"
})

local StructuralSection = LayoutTab:CreateSection({ Title = "Structure" })

StructuralSection:CreateLabel({ Text = "Element above divider" })
StructuralSection:CreateDivider()
StructuralSection:CreateLabel({ Text = "Element below divider" })

StructuralSection:CreateSpacer(20)

StructuralSection:CreateGroup({
    Title = "Property Settings",
    Content = function(group)
        group:CreateToggle({ Text = "Sub-option A" })
        group:CreateToggle({ Text = "Sub-option B" })
    end
})

--------------------------------------------------------------------------------
-- 5. FEEDBACK TAB
--------------------------------------------------------------------------------
local FeedbackTab = Window:CreateTab({
    Title = "Feedback",
    Icon = "rbxassetid://10723345525"
})

local NotificationSection = FeedbackTab:CreateSection({ Title = "System Feedback" })

NotificationSection:CreateButton({
    Text = "Send Toast",
    Callback = function()
        UI:Notify({ Title = "Update", Content = "Operation completed successfully.", Priority = "Info" })
    end
})

NotificationSection:CreateButton({
    Text = "Show Confirmation",
    Callback = function()
        UI:Prompt({
            Title = "Are you sure?",
            Content = "This action will permanently delete the selected item.",
            OnConfirm = function() print("Confirmed!") end,
            OnCancel = function() print("Cancelled") end
        })
    end
})

--------------------------------------------------------------------------------
-- 6. NAVIGATION TAB
--------------------------------------------------------------------------------
local NavTab = Window:CreateTab({
    Title = "Navigation",
    Icon = "rbxassetid://10723344693"
})

local ContentSection = NavTab:CreateSection({ Title = "Hierarchy" })

ContentSection:CreateAccordion({
    Title = "Advanced Settings",
    Content = function(acc)
        acc:CreateButton({ Text = "Inner Action" })
    end
})

--------------------------------------------------------------------------------
-- 7. PERFORMANCE TAB (STRESS TEST)
--------------------------------------------------------------------------------
local PerfTab = Window:CreateTab({
    Title = "Performance",
    Icon = "rbxassetid://10723344435"
})

local StressSection = PerfTab:CreateSection({ Title = "Stress Testing" })

StressSection:CreateButton({
    Text = "Render 100 Buttons",
    Callback = function()
        for i = 1, 100 do
            StressSection:CreateButton({ Text = "Button " .. i })
        end
    end
})

StressSection:CreateButton({
    Text = "Render 300 List Items",
    Callback = function()
        -- Virtualization test
        local items = {}
        for i = 1, 300 do table.insert(items, { Text = "Item " .. i }) end
        StressSection:CreateVirtualList({ Items = items })
    end
})

print("HyperUI v2 Demo Loaded Successfully.")
