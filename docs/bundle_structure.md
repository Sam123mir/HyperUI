# HyperUI v2 - Distribution Bundle Structure

This document provides a technical breakdown of the `dist/HyperUI.lua` production file.

## 📦 Bundle Overview

- **Total Modules**: 75
- **File Size**: ~136 KB (139,419 bytes)
- **Composition**: The bundle is a single Lua script composed of a module registry, an internal loader, and an entry point execution. It is designed for zero-dependency integration via `loadstring`.

## 🗃️ Module Registry

The bundle uses a local table called `_modules` to store all framework code.

### Storage Format
Modules are stored as anonymous functions within the `_modules` dictionary:
```lua
_modules["path/to/module"] = function()
    -- Module code here
end
```

### Path Mapping
- **Source Paths**: The bundler traverses `src/v2/` and converts file paths into dot-less string keys (e.g., `api/Window`).
- **Initialization**: Standard `init.lua` files are mapped to their parent directory name. The root `src/v2/init.lua` is uniquely mapped to the key `"main"`.

## 🔄 Require Loader

To maintain modularity within a single file, HyperUI v2 implements a custom internal loader.

### Loader Logic (`_require`)
The `_require` function resolves module strings into their returned values:
```lua
local function _require(name)
    if _cache[name] then return _cache[name] end
    local module = _modules[name]
    if not module then error("Module not found: " .. tostring(name)) end
    local result = module()
    _cache[name] = result
    return result
end
```

### Features
1.  **Caching**: The `_cache` table ensures each module only executes once, mimicking standard Lua `require` behavior.
2.  **Local Context**: The bundler rewrites all source `require` calls into string-based lookups and overrides the global `require` keyword locally within each module function.

## 🏁 Entry Point

The bundle terminates with an explicit execution of the entry module:
```lua
return _require('main')
```
This returns the primary `HyperUI` class to the calling script, typically via a `loadstring` return value.

## 💎 Public API Surface

The distribution file exposes the following core methods:

| Method | Description |
| :--- | :--- |
| `HyperUI.new()` | Initializes the framework, core managers, and configuration. |
| `UI:CreateWindow(config)` | Creates a new high-level UI window. |
| `UI:Notify(config)` | Dispatches a toast notification via the NotificationManager. |
| `UI:SetTheme(themeName)` | Switches the active design tokens (Light/Dark). |
| `UI:Destroy()` | Unmounts all React roots and cleans up instances. |

*Full component creation logic (e.g., `Section:CreateButton`) is accessible through the hierarchical API returned by `CreateWindow`.*
