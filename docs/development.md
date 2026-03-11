# HyperUI v2 Development Guide

This guide is for developers who want to extend HyperUI v2 by adding new components or modifying the core architecture.

## 🏗️ Technical Overview

HyperUI v2 uses a three-layer architecture:
1.  **Public API**: Imperative wrappers (e.g., `Section:CreateButton`).
2.  **Framework Layer**: React Luau components.
3.  **Rendering Layer**: Roblox Instances.

### Component Foundation
All elements should extend or compose the **BaseElement**.

```lua
local BaseElement = require(script.Parent.BaseElement)

local function MyNewElement(props)
    return React.createElement(BaseElement, props, {
        -- Custom content here
    })
end
```

### Hooks & State
- **useInteractionState**: Handles hover, press, and focus states.
- **useSpring**: Use this for all animations to maintain the "HyperUI feel".
- **useTree**: Connected to the global UI state for persistence.

## ➕ Adding a New Component

1.  **Create the Component**: Add a new file in `src/v2/components/Elements/`.
2.  **Register in API**: Add a creation method in `src/v2/api/Section.lua`.
3.  **Map in Container**: Add the component to the `COMPONENTS` mapping in `src/v2/components/Containers/Section.lua`.
4.  **Add to Playground**: Register a demo case in `examples/playground/ComponentRegistry.lua`.

## 🧪 Testing Guidelines

Before committing a new component:
1.  Verify it renders correctly in the **UI Playground**.
2.  Test property updates in the **StatePanel**.
3.  Check performance in the **PerformancePanel** (especially for layouts).
4.  Add a showcase case to **full_demo.lua**.

## 📦 Bundling

To create the production distribution, run:
```bash
python build/scripts/bundle.py
```
This will generate `dist/HyperUI.lua`.

---
