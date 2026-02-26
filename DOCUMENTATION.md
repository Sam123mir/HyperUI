# <img src="assets/logo.png" width="35" height="35" valign="middle"> HyperUI Documentation

Welcome to the official documentation for **HyperUI**, a professional, modern, and highly customizable UI library for Roblox scripted in Luau. Designed with aesthetics and performance in mind, HyperUI offers a premium experience with features like glassmorphism, dynamic animations, and built-in systems for authentication and localization.

---

## 🚀 Getting Started

### Installation

To integrate HyperUI into your project, simply use the following `loadstring`:

```lua
local HyperUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/An-to-ni/HyperUI/main/src/Init.lua"))()
```

### Basic Window Example

Creating a window is the first step to building your interface.

```lua
local Window = HyperUI:CreateWindow({
    Title = "HyperUI | Professional Studio",
    Icon = "solar:palet-2-bold-duotone",
    Folder = "HyperUI_Data", -- Local storage folder name
    Size = UDim2.new(0, 580, 0, 460)
})
```

---

## 🏗️ Layout System

HyperUI uses a hierarchical layout system to keep your UI organized.

### Tabs
Tabs are the primary navigation elements located in the sidebar.

```lua
local Tab = Window:Tab({
    Title = "Main Settings",
    Icon = "solar:settings-bold-duotone"
})
```

### Sections
Sections help you group related elements within a tab.

```lua
local Section = Tab:Section({
    Title = "Optimization"
})
```

### Groups
Groups allow for secondary grouping, often with a different visual style or side-by-side elements.

```lua
local Group = Tab:Group({
    Title = "Character Specs"
})
```

---

## 💎 Components

### Button
A standard interactive button with customizable icons and alignment.

```lua
Tab:Button({
    Title = "Execute Script",
    Desc = "Runs the main automation process.",
    Icon = "solar:play-bold-duotone",
    Callback = function()
        print("Executing...")
    end
})
```

| Property | Type | Description |
| :--- | :--- | :--- |
| `Title` | `string` | The main text of the button. |
| `Desc` | `string` | Optional description text. |
| `Icon` | `string` | [Solar Icon ID](https://lucide.dev/icons/) or Asset ID. |
| `Color` | `Color3` | Accent color for the button. |
| `Callback` | `function` | Runs when clicked. |

### Toggle
A switch or checkbox to manage boolean states.

```lua
Tab:Toggle({
    Title = "Auto Farm",
    Value = false,
    Callback = function(state)
        print("Auto Farm is now " .. (state and "Enabled" or "Disabled"))
    end
})
```

### Slider
A precise input for numerical ranges.

```lua
Tab:Slider({
    Title = "WalkSpeed",
    Value = {Min = 16, Max = 100, Default = 16},
    Step = 1,
    IsTextbox = true,
    Callback = function(val)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
    end
})
```

### Dropdown
A selectable list of items.

```lua
Tab:Dropdown({
    Title = "Select Map",
    Multi = false,
    Options = {"Dust II", "Mirage", "Inferno"},
    Default = "Dust II",
    Callback = function(choice)
        print("Map selected: " .. choice)
    end
})
```

---

## 🛠️ Advanced Features

### Key System (Authentication)
HyperUI includes a built-in key validation UI.

```lua
HyperUI:KeySystem({
    Title = "Authorized Access",
    Key = "SUPER_SECRET_KEY",
    OnSuccess = function()
        print("Access Granted!")
    end
})
```

### Notifications
Send professional alerts to the user.

```lua
HyperUI:Notify({
    Title = "System Alert",
    Content = "Your settings have been saved successfully.",
    Icon = "solar:check-circle-bold-duotone",
    Duration = 5
})
```

### Popups (Modals)
Block the UI for important decisions.

```lua
HyperUI:Popup({
    Title = "Confirm Action",
    Content = "Are you sure you want to delete all data?",
    Buttons = {
        {Title = "Yes", Variant = "Primary", Callback = function() print("Deleted") end},
        {Title = "No", Variant = "Secondary"}
    }
})
```

### Keybind
Allows users to bind actions to specific keyboard keys.

```lua
Tab:Keybind({
    Title = "Fling Key",
    Default = Enum.KeyCode.F,
    Callback = function()
        print("Flinging!")
    end
})
```

### Colorpicker
A professional HSB color selector.

```lua
Tab:Colorpicker({
    Title = "UI Accent",
    Default = Color3.fromRGB(0, 255, 255),
    Callback = function(color)
        print("New color: " .. tostring(color))
    end
})
```

### Input
A text input field for strings or numbers.

```lua
Tab:Input({
    Title = "Player Name",
    Placeholder = "Enter name...",
    Callback = function(text)
        print("Searching for: " .. text)
    end
})
```

### Paragraph & Image
For displaying information and visual assets.

```lua
Tab:Paragraph({
    Title = "Update Log",
    Content = "Version 1.2.0: Added glassmorphism effects and stabilized animations."
})

Tab:Image({
    Title = "Example Preview",
    Image = "rbxassetid://123456789",
    Size = UDim2.new(0, 200, 0, 100)
})
```

---

## 🔧 Full API Reference

### HyperUI (Global)

| Method | Returns | Description |
| :--- | :--- | :--- |
| `CreateWindow(config)` | `Window` | Initializes the main UI container. |
| `Notify(config)` | `Notification` | Displays a toast notification. |
| `Popup(config)` | `Popup` | Shows a modal dialog. |
| `SetTheme(name)` | `void` | Changes the global theme. |
| `MakeDraggable(frame)` | `void` | Utility to make any GUI element draggable. |

### Window Instance

| Method | Description |
| :--- | :--- |
| `Tab(config)` | Creates a new tab. |
| `Section(config)` | Creates a section within a tab. |
| `SelectTab(index)` | Switches to a specific tab. |
| `SetTitle(text)` | Updates the main title. |
| `SetAuthor(text)` | Updates the subtitle/author text. |
| `SetIcon(id)` | Updates the window icon. |
| `Toggle()` | Toggles window visibility. |
| `Close()` | Minimizes the window. |
| `Destroy()` | Removes the UI completely. |

---

## 🎨 Professional Themes

HyperUI comes with several beautifully crafted themes. Use `HyperUI:SetTheme(name)` to switch.

- `Dark` (Default)
- `Light`
- `Blue`
- `Purple`
- `Aqua`

---

*Documentation version 1.1.0 | Created with ❤️ for the community.*
