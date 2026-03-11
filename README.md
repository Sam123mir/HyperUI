# HyperUI v2

HyperUI v2 is a professional-grade, high-performance UI framework designed specifically for Roblox script creators. It combines the declarative power of **React Luau** with a clean, imperative public API, all bundled into a single distribution file for easy `loadstring` integration.

## ✨ Key Features

- **40+ Professional Components**: A comprehensive library including Buttons, Sliders, MultiDropdowns, ColorPickers, and more.
- **Premium Aesthetics**: Built-in support for spring animations, typography tokens, and shadow elevations.
- **High Performance**: Features like `VirtualList` and efficient state management ensure 60 FPS even with hundreds of elements.
- **Script Creator Focused**: Simple, imperative API (`UI:CreateButton`) with internal complexity abstracted away.
- **Zero Dependencies**: Bundled into a single file; no need for end-users to install React or Rojo.

## 🚀 Installation

For script creators, integration is as simple as a `loadstring`:

```lua
local HyperUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sam123mir/HyperUI/main/dist/HyperUI.lua"))()

local UI = HyperUI.new()
local Window = UI:CreateWindow({
    Title = "My Script",
})
```

## 🖼️ Official Showcase

### HyperUI Demo
A living specification of every feature and component in the framework.
- **Location**: `examples/full_demo.lua`
- **How to Run**: Load the `full_demo.lua` script in Studio or an executor to see a complete showcase window.

## 📂 Component Categories

- **Controls**: Button, Slider, Keybind, ColorPicker, Dropdown...
- **Inputs**: Text, Number, Search, TextArea, ComboBox...
- **Display**: Label, Badge, Avatar, ProgressBar, StatDisplay...
- **Layout**: Section, Group, Grid, Stack, Divider, Spacer...
- **Feedback**: Notification (Toast), Tooltip, Modal, Confirmation...
- **Navigation**: TabBar, Sidebar, Accordion, Collapsible...
- **Utility**: CopyButton, Tag, StatusIndicator.

## 📜 Documentation

For more detailed information, see our documentation:
- [Walkthrough](.gemini/antigravity/brain/637c3651-de3e-470f-b810-ceda7cfba676/walkthrough.md) - Features and testing results.
- [Development Guide](docs/development.md) - How to extend HyperUI with new components.

---

Built with ❤️ by the HyperUI Team.