--[[
    HyperUI v2 - Official Demo Showcase
    Purpose: Testing, Validation, and Documentation.
]]

-- Load HyperUI via GitHub Raw URL
local HyperUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sam123mir/HyperUI/main/dist/HyperUI.lua"))()

-- Initializing an instance
local UI = HyperUI.new()

-- Create the main window
local Window = UI:CreateWindow({
    Title = "HyperUI v2 Showcase",
    SubTitle = "Official Component Library",
    Icon = "rbxassetid://10723343321",
    Resizable = true,
    Draggable = true,
})

--------------------------------------------------------------------------------
-- 1. ACTION TAB (Buttons, Toggles, etc.)
--------------------------------------------------------------------------------
local ActionTab = Window:CreateTab({
    Title = "Actions",
    Icon = "rbxassetid://10723343321"
})

local ActionSection = ActionTab:CreateSection({ Title = "Standard Actions" })

ActionSection:CreateButton({
    Text = "Primary Button",
    Description = "Typical action trigger with callback.",
    Callback = function()
        UI:Notify({ 
            Title = "Action Triggered", 
            Content = "You clicked the Primary Button!", 
            Priority = "Success" 
        })
    end
})

ActionSection:CreateIconButton({
    Icon = "rbxassetid://10723346371",
    Description = "Icon-only button for compact layouts.",
    Callback = function()
        UI:Notify({ Title = "Icon Clicked", Content = "Heart clicked!" })
    end
})

ActionSection:CreateCopyButton({
    Text = "Copy Script ID",
    Value = "local UI = loadstring(game:HttpGet(...))()",
    Description = "Click to copy text to clipboard."
})

local StateSection = ActionTab:CreateSection({ Title = "State Selection" })

StateSection:CreateToggle({
    Text = "Automatic Updates",
    Description = "Enable background polling for new data.",
    Default = true,
    Callback = function(state) print("Auto Updates:", state) end
})

StateSection:CreateCheckbox({
    Text = "I agree to the terms of service",
    Default = false,
    Callback = function(state) print("ToS Agreed:", state) end
})

--------------------------------------------------------------------------------
-- 2. INPUTS TAB (Text, Numbers, Sliders)
--------------------------------------------------------------------------------
local InputsTab = Window:CreateTab({
    Title = "Inputs",
    Icon = "rbxassetid://10723345799"
})

local SelectionSection = InputsTab:CreateSection({ Title = "Selection & Adjustments" })

SelectionSection:CreateSlider({
    Text = "Master Volume",
    Min = 0,
    Max = 100,
    Default = 75,
    Suffix = "%",
    Callback = function(val) print("Volume:", val) end
})

SelectionSection:CreateDropdown({
    Text = "Graphics Quality",
    Options = {"Low", "Medium", "High", "Ultra", "RTX On"},
    Default = "High",
    Callback = function(val) print("Graphics:", val) end
})

SelectionSection:CreateMultiDropdown({
    Text = "Preferred Servers",
    Options = {"North America", "Europe", "Asia", "South America", "Australia"},
    Default = {"North America", "Europe"},
    Callback = function(vals) print("Servers selected:", #vals) end
})

SelectionSection:CreateColorPicker({
    Text = "UI Theme Highlight",
    Description = "Choose the main accent color.",
    Default = Color3.fromRGB(0, 162, 255),
    Callback = function(color) print("Color updated") end
})

SelectionSection:CreateKeybind({
    Text = "Toggle Menu Visibility",
    Default = Enum.KeyCode.F4,
    Callback = function() print("Keybind triggered!") end
})

local TextSection = InputsTab:CreateSection({ Title = "Text & Forms" })

TextSection:CreateInput({
    Text = "User Handle",
    Placeholder = "@username",
    Callback = function(val) print("Username:", val) end
})

TextSection:CreateNumberInput({
    Text = "Player WalkSpeed",
    Default = 16,
    Min = 0,
    Max = 100,
    Callback = function(val) print("Speed set to", val) end
})

TextSection:CreateSearchInput({
    Placeholder = "Search components...",
    Callback = function(query) print("Searching for:", query) end
})

TextSection:CreateTextArea({
    Text = "Bug Report / Feedback",
    Placeholder = "Describe your issue here...",
    Callback = function(val) print("Feedback received") end
})

--------------------------------------------------------------------------------
-- 3. DISPLAY TAB (Information, Progress, Stats)
--------------------------------------------------------------------------------
local DisplayTab = Window:CreateTab({
    Title = "Display",
    Icon = "rbxassetid://10723346514"
})

local InfoSection = DisplayTab:CreateSection({ Title = "Information Elements" })

InfoSection:CreateLabel({
    Text = "Framework Status: Active",
    Description = "HyperUI Engine v2.0.0 is running optimally."
})

InfoSection:CreateBadge({
    Text = "STABLE RELEASE",
    Color = Color3.fromRGB(34, 197, 94)
})

InfoSection:CreateTag({
    Text = "Open Source",
    Color = Color3.fromRGB(59, 130, 246)
})

InfoSection:CreateStatusIndicator({
    Text = "Database Connection",
    Status = "Online", -- Online, Offline, Away, Busy
})

local StatSection = DisplayTab:CreateSection({ Title = "Data Visualization" })

StatSection:CreateProgressBar({
    Text = "Resource Loading",
    Value = 68,
    ShowPercentage = true
})

StatSection:CreateStatDisplay({
    Title = "Daily Active Users",
    Value = "14,502",
    SubValue = "^ 5.2% from yesterday",
    Icon = "rbxassetid://10723343321"
})

--------------------------------------------------------------------------------
-- 4. LAYOUT TAB (Accordions, Groups, Grids)
--------------------------------------------------------------------------------
local LayoutTab = Window:CreateTab({
    Title = "Layout",
    Icon = "rbxassetid://10723345102"
})

local StructureSection = LayoutTab:CreateSection({ Title = "Advanced Structure" })

StructureSection:CreateAccordion({
    Title = "Developer Options",
    Description = "Click to expand technical settings.",
    Content = function(acc)
        acc:CreateToggle({ Text = "Debug Mode" })
        acc:CreateButton({ Text = "Clear Cache" })
        acc:CreateLabel({ Text = "Build: #1042-STABLE" })
    end
})

StructureSection:CreateCollapsible({
    Title = "Legacy Features",
    Default = false,
    Content = function(col)
        col:CreateLabel({ Text = "These features will be removed in v3." })
    end
})

StructureSection:CreateGroup({
    Title = "Environment Settings",
    Content = function(grp)
        grp:CreateSlider({ Text = "Fog Density", Min = 0, Max = 1, Default = 0.1 })
        grp:CreateColorPicker({ Text = "Ambient Lighting" })
    end
})

StructureSection:CreateDivider()

StructureSection:CreateLabel({ Text = "The divider and spacer above help organize sections." })
StructureSection:CreateSpacer(10)

--------------------------------------------------------------------------------
-- 5. SETTINGS TAB (Theme, Config)
--------------------------------------------------------------------------------
local SettingsTab = Window:CreateTab({
    Title = "Settings",
    Icon = "rbxassetid://10723344693"
})

local ThemeSection = SettingsTab:CreateSection({ Title = "Visual Preference" })

ThemeSection:CreateDropdown({
    Text = "Select Theme",
    Options = {"Dark", "Light", "Glass", "Midnight", "Ocean"},
    Default = "Dark",
    Callback = function(theme)
        UI:SetTheme(theme)
        UI:Notify({ Title = "Theme Updated", Content = "Applied " .. theme .. " theme." })
    end
})

local ConfigSection = SettingsTab:CreateSection({ Title = "Configuration" })

ConfigSection:CreateButton({
    Text = "Save Configuration",
    Description = "Manually persist current settings.",
    Callback = function()
        UI:SaveConfig()
        UI:Notify({ Title = "Success", Content = "Configuration saved successfully." })
    end
})

ConfigSection:CreateButton({
    Text = "Reset to Default",
    Callback = function()
        UI:Prompt({
            Title = "Confirm Reset",
            Content = "Are you sure you want to revert all settings to their default values?",
            OnConfirm = function()
                print("Config Reset")
                UI:Notify({ Title = "Reset", Content = "Settings restored." })
            end
        })
    end
})

NotificationSection = SettingsTab:CreateSection({ Title = "Manual Destruct" })
NotificationSection:CreateButton({
    Text = "Destroy UI",
    Description = "Completely remove the UI instance.",
    Callback = function()
        UI:Destroy()
    end
})

print("HyperUI v2 Demo Showcase Loaded Successfully.")
