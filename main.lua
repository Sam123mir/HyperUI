--[[
    HyperUI - Definitive Developer Template
    
    This is the standard script for implementing HyperUI in your projects.
    It includes a robust loader compatible with most executors.
]]

local function GetHyperUI()
    if _G.HyperUI then return _G.HyperUI end
    
    print("### HyperUI Loader: v1.6.70 ###")
    local success, result = pcall(function()
        return game:HttpGet("https://raw.githubusercontent.com/Sam123mir/HyperUI/main/dist/WindUI.lua?cache=" .. tick())
    end)
    
    if not success then
        warn("HyperUI: Failed to download library. Error: " .. tostring(result))
        return nil
    end
    
    local func, err = loadstring(result)
    if not func then
        warn("HyperUI: Script compilation error. Error: " .. tostring(err))
        return nil
    end
    
    local library = func()
    _G.HyperUI = library
    return library
end

local HyperUI = GetHyperUI()
if not HyperUI then return end

-- ============================================================
-- 1. LOCALIZATION
-- ============================================================

local Localization = HyperUI:Localization({
    Enabled = true,
    Prefix = "loc:",
    DefaultLanguage = "en",
    Translations = {
        ["en"] = {
            ["WELCOME"]        = "Welcome to HyperUI",
            ["DESC"]           = "The most advanced UI library for Roblox developers.",
            ["TAB_HOME"]       = "Home",
            ["TAB_PLAYER"]     = "Player",
            ["TAB_VISUAL"]     = "Visual",
            ["TAB_INPUTS"]     = "Inputs",
            ["TAB_MEDIA"]      = "Media",
            ["TAB_CONFIG"]     = "Config",
            ["SEC_OVERVIEW"]   = "Overview",
            ["SEC_ACTIONS"]    = "Quick Actions",
            ["SEC_MOVEMENT"]   = "Movement",
            ["SEC_COMBAT"]     = "Combat",
            ["SEC_APPEARANCE"] = "Appearance",
            ["SEC_THEMING"]    = "Theming",
            ["SEC_KEYBINDS"]   = "Keybinds",
            ["SEC_TEXT"]       = "Text Fields",
            ["SEC_COLORS"]     = "Color Pickers",
            ["SEC_MEDIA"]      = "Media",
            ["SEC_NOTIFS"]     = "Notifications",
            ["SEC_DIALOGS"]    = "Dialogs",
            ["SEC_CFG"]        = "Save & Load",
        },
        ["es"] = {
            ["WELCOME"]        = "Bienvenido a HyperUI",
            ["DESC"]           = "La librería de UI más avanzada para desarrolladores de Roblox.",
            ["TAB_HOME"]       = "Inicio",
            ["TAB_PLAYER"]     = "Jugador",
            ["TAB_VISUAL"]     = "Visual",
            ["TAB_INPUTS"]     = "Entradas",
            ["TAB_MEDIA"]      = "Media",
            ["TAB_CONFIG"]     = "Config",
            ["SEC_OVERVIEW"]   = "Descripción general",
            ["SEC_ACTIONS"]    = "Acciones rápidas",
            ["SEC_MOVEMENT"]   = "Movimiento",
            ["SEC_COMBAT"]     = "Combate",
            ["SEC_APPEARANCE"] = "Apariencia",
            ["SEC_THEMING"]    = "Temas",
            ["SEC_KEYBINDS"]   = "Atajos",
            ["SEC_TEXT"]       = "Campos de texto",
            ["SEC_COLORS"]     = "Colores",
            ["SEC_MEDIA"]      = "Media",
            ["SEC_NOTIFS"]     = "Notificaciones",
            ["SEC_DIALOGS"]    = "Diálogos",
            ["SEC_CFG"]        = "Guardar y cargar",
        }
    }
})

HyperUI:SetTheme("Dark")

-- ============================================================
-- 2. CREATE WINDOW (with Key System)
-- ============================================================
--[[
    The KeySystem is OPTIONAL. Remove the KeySystem table below
    to skip key validation entirely.
    
    Flow when KeySystem is enabled:
      Loading Screen → Info Message → Key Validation Window → Main Window
    
    The "Title" in KeySystem is what users see (e.g. your hub name).
    Customize it to match your script/hub branding.
]]

local Window = HyperUI:CreateWindow({
    Title = "Example Hub",
    Icon = "solar:folder-2-bold-duotone",
    Transparent = true,
    Acrylic = true,
    HideSearchBar = false,
    StatsWidget = true,
    Tags = {
        { Title = "v1.0.0", Color = Color3.fromRGB(48, 255, 106) },
        { Title = "Developer", Color = Color3.fromRGB(100, 180, 255) },
    },
    KeySystem = {
        Title = "Example Hub | Key System",
        Key = {"hyper-key", "secret-test"},
        Note = "Use 'hyper-key' to access the developer template.",
        SaveKey = true,
        Discord = "https://discord.gg/P2AxyqgA",
    },
    Folder = "ExampleHub"
})

-- ============================================================
-- 3. TABS
-- ============================================================

local HomeTab    = Window:Tab({ Title = "loc:TAB_HOME",   Icon = "solar:home-2-bold-duotone" })
local PlayerTab  = Window:Tab({ Title = "loc:TAB_PLAYER", Icon = "solar:user-bold-duotone" })
local VisualTab  = Window:Tab({ Title = "loc:TAB_VISUAL", Icon = "solar:palette-bold-duotone" })
local InputsTab  = Window:Tab({ Title = "loc:TAB_INPUTS", Icon = "solar:keyboard-bold-duotone" })
local MediaTab   = Window:Tab({ Title = "loc:TAB_MEDIA",  Icon = "solar:gallery-bold-duotone" })
local ConfigTab  = Window:Tab({ Title = "loc:TAB_CONFIG", Icon = "solar:settings-bold-duotone" })

-- ============================================================
-- 4. HOME TAB — Overview & Quick Actions
-- ============================================================

HomeTab:Section({ Title = "loc:SEC_OVERVIEW" })

HomeTab:Paragraph({
    Title   = "loc:WELCOME",
    Content = "loc:DESC",
})

HomeTab:Divider()

HomeTab:Section({ Title = "loc:SEC_ACTIONS" })

HomeTab:Button({
    Title    = "Send Notification",
    Desc     = "Sends a test notification to the screen",
    Callback = function()
        HyperUI:Notify({
            Title    = "Success!",
            Content  = "HyperUI is working perfectly.",
            Duration = 5
        })
    end
})

HomeTab:Button({
    Title    = "Show Info Popup",
    Desc     = "Opens an informational modal dialog",
    Callback = function()
        HyperUI:Popup({
            Title   = "About HyperUI",
            Content = "HyperUI is the most advanced UI library for Roblox. Built with glassmorphism design, smooth animations and a robust API.",
            Buttons = {
                {
                    Title    = "Got it",
                    Variant  = "Primary",
                    Callback = function() end
                }
            }
        })
    end
})

HomeTab:Toggle({
    Title    = "Acrylic Effect",
    Desc     = "Toggle the frosted glass background",
    Default  = true,
    Callback = function(Value)
        Window:SetAcrylic(Value)
    end
})

-- ============================================================
-- 5. PLAYER TAB — Movement & Combat
-- ============================================================

PlayerTab:Section({ Title = "loc:SEC_MOVEMENT" })

local speedSlider = PlayerTab:Slider({
    Title    = "Walk Speed",
    Desc     = "Adjust your character's movement speed",
    Value    = { Min = 16, Max = 250, Default = 16 },
    Step     = 1,
    Flag     = "WalkSpeed",
    Callback = function(Value)
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = Value
        end
    end
})

local jumpSlider = PlayerTab:Slider({
    Title    = "Jump Power",
    Desc     = "Adjust your character's jump height",
    Value    = { Min = 0, Max = 500, Default = 50 },
    Step     = 5,
    Flag     = "JumpPower",
    Callback = function(Value)
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.JumpPower = Value
        end
    end
})

PlayerTab:Toggle({
    Title    = "No Clip",
    Desc     = "Walk through walls",
    Default  = false,
    Flag     = "NoClip",
    Callback = function(Value)
        HyperUI:Notify({
            Title    = "No Clip",
            Content  = Value and "Enabled" or "Disabled",
            Duration = 2
        })
    end
})

PlayerTab:Toggle({
    Title    = "Infinite Jump",
    Desc     = "Jump while in the air",
    Default  = false,
    Flag     = "InfJump",
    Callback = function(Value)
        HyperUI:Notify({
            Title    = "Infinite Jump",
            Content  = Value and "Enabled" or "Disabled",
            Duration = 2
        })
    end
})

PlayerTab:Button({
    Title    = "Reset Stats",
    Desc     = "Restore WalkSpeed and JumpPower to defaults",
    Callback = function()
        speedSlider:Set(16)
        jumpSlider:Set(50)
        HyperUI:Notify({
            Title    = "Reset",
            Content  = "Player stats restored to default.",
            Duration = 3
        })
    end
})

PlayerTab:Divider()
PlayerTab:Section({ Title = "loc:SEC_COMBAT" })

PlayerTab:Toggle({
    Title    = "Auto Farm",
    Default  = false,
    Flag     = "AutoFarm",
    Callback = function(Value)
        HyperUI:Notify({
            Title    = "Auto Farm",
            Content  = Value and "Started" or "Stopped",
            Duration = 2
        })
    end
})

PlayerTab:Toggle({
    Title    = "Silent Aim",
    Default  = false,
    Flag     = "SilentAim",
    Callback = function(Value)
        HyperUI:Notify({
            Title    = "Silent Aim",
            Content  = Value and "Enabled" or "Disabled",
            Duration = 2
        })
    end
})

PlayerTab:Slider({
    Title    = "FOV Size",
    Value    = { Min = 10, Max = 300, Default = 80 },
    Step     = 5,
    Flag     = "FOVSize",
    Callback = function(Value)
        print("FOV →", Value)
    end
})

PlayerTab:Dropdown({
    Title    = "Hit Part",
    Default  = "Head",
    Options  = { "Head", "HumanoidRootPart", "Torso", "Left Arm", "Right Arm" },
    Flag     = "HitPart",
    Callback = function(Value)
        HyperUI:Notify({
            Title    = "Hit Part",
            Content  = "Targeting: " .. tostring(Value),
            Duration = 2
        })
    end
})

-- ============================================================
-- 6. VISUAL TAB — Theming & Appearance
-- ============================================================

VisualTab:Section({ Title = "loc:SEC_THEMING" })

local allThemes = { 
    "Dark", "Light", "Rose", "Plant", "Red", "Indigo", "Sky", "Violet", 
    "Amber", "Emerald", "Midnight", "Crimson", "MonokaiPro", 
    "CottonCandy", "Mellowsi", "Rainbow", "DarkStealth", "CrimsonFrost" 
}

local themeDropdown = VisualTab:Dropdown({
    Title    = "UI Theme",
    Default  = "Dark",
    Options  = allThemes,
    Flag     = "UITheme",
    Callback = function(Value)
        HyperUI:SetTheme(Value)
        HyperUI:Notify({
            Title    = "Theme",
            Content  = "Switched to " .. tostring(Value),
            Duration = 2
        })
    end
})

VisualTab:Slider({
    Title    = "UI Transparency",
    Desc     = "Adjust the overall UI opacity",
    Value    = { Min = 0, Max = 1, Default = 0 },
    Step     = 0.05,
    Flag     = "UITransparency",
    Callback = function(Value)
        Window:SetBackgroundTransparency(Value)
        Window:SetBackgroundImageTransparency(Value)
    end
})

VisualTab:Toggle({
    Title    = "Acrylic / Blur",
    Default  = true,
    Flag     = "AcrylicToggle",
    Callback = function(Value)
        Window:SetAcrylic(Value)
    end
})

VisualTab:Divider()
VisualTab:Section({ Title = "loc:SEC_APPEARANCE" })

VisualTab:Colorpicker({
    Title    = "Accent Color",
    Default  = Color3.fromRGB(48, 255, 106),
    Flag     = "AccentColor",
    Callback = function(Value)
        HyperUI:Notify({
            Title    = "Accent Color",
            Content  = "#" .. Value:ToHex():upper(),
            Duration = 2
        })
    end
})

VisualTab:Colorpicker({
    Title        = "Background Tint",
    Default      = Color3.fromRGB(15, 12, 41),
    Transparency = 0.5,
    Flag         = "BgTint",
    Callback     = function(Value, Transparency)
        print("BG Tint:", Value:ToHex(), "Alpha:", Transparency)
    end
})

VisualTab:Dropdown({
    Title    = "Notification Position",
    Default  = "Bottom Right",
    Options  = { "Top Left", "Top Right", "Bottom Left", "Bottom Right", "Top Center", "Bottom Center" },
    Flag     = "NotifPosition",
    Callback = function(Value)
        print("Notif position:", Value)
    end
})

-- ============================================================
-- 7. INPUTS TAB — Text Fields & Keybinds
-- ============================================================

InputsTab:Section({ Title = "loc:SEC_TEXT" })

InputsTab:Input({
    Title       = "Target Player",
    Desc        = "Enter a player's username",
    Placeholder = "e.g. Roblox",
    Flag        = "TargetPlayer",
    Callback    = function(Value)
        if Value and Value ~= "" then
            HyperUI:Notify({
                Title    = "Target Set",
                Content  = "Targeting: " .. Value,
                Duration = 3
            })
        end
    end
})

InputsTab:Input({
    Title       = "Teleport Place ID",
    Placeholder = "e.g. 123456789",
    Flag        = "TeleportID",
    Callback    = function(Value)
        if tonumber(Value) then
            HyperUI:Notify({
                Title    = "Teleport",
                Content  = "Place ID set to " .. Value,
                Duration = 3
            })
        end
    end
})

InputsTab:Input({
    Title       = "Custom Chat Message",
    Placeholder = "Type a message...",
    Flag        = "ChatMsg",
    Callback    = function(Value)
        if Value and Value ~= "" then
            HyperUI:Notify({
                Title    = "Chat",
                Content  = Value,
                Duration = 3
            })
        end
    end
})

InputsTab:Divider()
InputsTab:Section({ Title = "loc:SEC_KEYBINDS" })

InputsTab:Keybind({
    Title    = "Toggle Auto Farm",
    Default  = Enum.KeyCode.F,
    Flag     = "KB_AutoFarm",
    Callback = function()
        HyperUI:Notify({ Title = "Keybind", Content = "Auto Farm toggled!", Duration = 2 })
    end
})

InputsTab:Keybind({
    Title    = "Teleport to Spawn",
    Default  = Enum.KeyCode.T,
    Flag     = "KB_Teleport",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        if char then
            char:SetPrimaryPartCFrame(CFrame.new(0, 5, 0))
            HyperUI:Notify({ Title = "Teleport", Content = "Returned to spawn!", Duration = 2 })
        end
    end
})

InputsTab:Keybind({
    Title    = "Show / Hide UI",
    Default  = Enum.KeyCode.RightControl,
    Flag     = "KB_ToggleUI",
    Callback = function()
        Window:Toggle()
    end
})

-- ============================================================
-- 8. MEDIA TAB — Paragraphs, Code Blocks, Images, Notifications, Dialogs
-- ============================================================

MediaTab:Section({ Title = "loc:SEC_MEDIA" })

MediaTab:Paragraph({
    Title   = "What is HyperUI?",
    Content = "HyperUI is a professional Roblox UI library featuring glassmorphism, smooth animations, and a complete component system.",
})

MediaTab:Paragraph({
    Title   = "GitHub Repository",
    Content = "github.com/Sam123mir/HyperUI",
    Buttons = {
        {
            Title    = "Copy Link",
            Variant  = "Tertiary",
            Callback = function()
                if setclipboard then
                    setclipboard("https://github.com/Sam123mir/HyperUI")
                end
                HyperUI:Notify({ Title = "Copied", Content = "Link copied to clipboard.", Duration = 2 })
            end
        },
        {
            Title    = "Open Docs",
            Variant  = "Primary",
            Callback = function()
                print("Opening docs...")
            end
        }
    }
})

MediaTab:Code({
    Title  = "quick_start.luau",
    Code   = [[local HyperUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Sam123mir/HyperUI/main/dist/main.lua"
))()

HyperUI:SetTheme("Dark")

local Window = HyperUI:CreateWindow({
    Title      = "My Script",
    Acrylic    = true,
    Transparent = true,
})

local Tab = Window:Tab({ Title = "Main", Icon = "rbxassetid://10888331510" })
Tab:Button({
    Title    = "Hello World",
    Callback = function()
        HyperUI:Notify({ Title = "Hi!", Content = "It works.", Duration = 3 })
    end
})]],
    OnCopy = function()
        HyperUI:Notify({ Title = "Copied", Content = "Code copied to clipboard.", Duration = 2 })
    end
})

MediaTab:Divider()
MediaTab:Section({ Title = "loc:SEC_NOTIFS" })

local notifTypes = {
    { title = "Success",  icon = "check-circle",   content = "Operation completed successfully." },
    { title = "Error",    icon = "x-circle",       content = "An unexpected error occurred." },
    { title = "Warning",  icon = "alert-triangle", content = "Something needs your attention." },
    { title = "Info",     icon = "info",           content = "Here is some general information." },
    { title = "Trophy",   icon = "trophy",         content = "Achievement unlocked!" },
    { title = "Download", icon = "download",       content = "Download complete." },
}

for _, notif in ipairs(notifTypes) do
    local n = notif
    MediaTab:Button({
        Title    = n.title .. " notification",
        Callback = function()
            HyperUI:Notify({
                Title    = n.title,
                Content  = n.content,
                Duration = 4
            })
        end
    })
end

MediaTab:Slider({
    Title    = "Custom Notification Duration",
    Value    = { Min = 1, Max = 15, Default = 5 },
    Step     = 1,
    Flag     = "NotifDuration",
    Callback = function(Value) end
})

MediaTab:Input({
    Title       = "Custom Notification Message",
    Placeholder = "Type your message...",
    Flag        = "NotifMsg",
    Callback    = function(Value) end
})

MediaTab:Button({
    Title    = "Send Custom Notification",
    Callback = function()
        local msg = HyperUI:GetFlag("NotifMsg") or ""
        local dur = HyperUI:GetFlag("NotifDuration") or 5
        HyperUI:Notify({
            Title    = "Custom",
            Content  = (msg ~= "" and msg) or "No message entered.",
            Duration = dur
        })
    end
})

MediaTab:Divider()
MediaTab:Section({ Title = "loc:SEC_DIALOGS" })

MediaTab:Button({
    Title    = "Confirmation Dialog",
    Callback = function()
        Window:Dialog({
            Title   = "Are you sure?",
            Content = "This action cannot be undone. Do you want to continue?",
            Buttons = {
                {
                    Title    = "Confirm",
                    Variant  = "Primary",
                    Callback = function()
                        HyperUI:Notify({ Title = "Confirmed", Content = "Action executed.", Duration = 2 })
                    end
                },
                {
                    Title    = "Cancel",
                    Variant  = "Secondary",
                    Callback = function()
                        HyperUI:Notify({ Title = "Cancelled", Content = "Action cancelled.", Duration = 2 })
                    end
                }
            }
        })
    end
})

MediaTab:Button({
    Title    = "Three-Option Dialog",
    Callback = function()
        Window:Dialog({
            Title   = "Save Changes?",
            Content = "You have unsaved changes. What would you like to do?",
            Buttons = {
                {
                    Title    = "Save",
                    Variant  = "Primary",
                    Callback = function()
                        HyperUI:Notify({ Title = "Saved", Content = "Changes saved.", Duration = 2 })
                    end
                },
                {
                    Title    = "Discard",
                    Variant  = "Secondary",
                    Callback = function()
                        HyperUI:Notify({ Title = "Discarded", Content = "Changes discarded.", Duration = 2 })
                    end
                },
                {
                    Title    = "Cancel",
                    Variant  = "Tertiary",
                    Callback = function() end
                }
            }
        })
    end
})

-- ============================================================
-- 9. CONFIG TAB — Save & Load
-- ============================================================

ConfigTab:Paragraph({
    Title   = "Configuration Manager",
    Content = "Save and load all your settings automatically across sessions.",
})

ConfigTab:Divider()
ConfigTab:Section({ Title = "loc:SEC_CFG" })

local configName = "default"
local configFile = nil

local cfgInput = ConfigTab:Input({
    Title       = "Config Name",
    Default     = configName,
    Placeholder = "default",
    Flag        = "CfgName",
    Callback    = function(val)
        configName = (val and val ~= "") and val or "default"
    end
})

local ConfigManager = Window.ConfigManager

if ConfigManager then
    ConfigManager:Init(Window)

    local saved = ConfigManager:AllConfigs()
    if saved and #saved > 0 then
        ConfigTab:Dropdown({
            Title    = "Saved Configs",
            Default  = saved[1],
            Options  = saved,
            Flag     = "SavedCfgSelect",
            Callback = function(val)
                configName = val or "default"
                cfgInput:Set(configName)
            end
        })
    end

    ConfigTab:Button({
        Title    = "Save Config",
        Callback = function()
            configFile = ConfigManager:CreateConfig(configName)
            configFile:Set("savedAt", os.date("%Y-%m-%d %H:%M:%S"))
            configFile:Set("version",  "1.0.0")
            configFile:Set("flags",    HyperUI.Flags)

            if configFile:Save() then
                HyperUI:Notify({
                    Title    = "Saved",
                    Content  = "Config saved as: " .. configName,
                    Duration = 3
                })
            else
                HyperUI:Notify({
                    Title    = "Error",
                    Content  = "Failed to save config.",
                    Duration = 3
                })
            end
        end
    })

    ConfigTab:Button({
        Title    = "Load Config",
        Callback = function()
            configFile = ConfigManager:CreateConfig(configName)
            local data = configFile:Load()

            if data then
                HyperUI:Notify({
                    Title    = "Loaded",
                    Content  = string.format("Config: %s\nSaved at: %s", configName, data.savedAt or "Unknown"),
                    Duration = 5
                })
            else
                HyperUI:Notify({
                    Title    = "Not Found",
                    Content  = "No config found with name: " .. configName,
                    Duration = 3
                })
            end
        end
    })

else
    ConfigTab:Paragraph({
        Title   = "ConfigManager Unavailable",
        Content = "ConfigManager requires it to be enabled in the CreateWindow options.",
    })
end

-- ============================================================
-- 10. WINDOW EVENTS
-- ============================================================

Window:OnOpen(function()
    print("[HyperUI Template] Window opened")
end)

Window:OnClose(function()
    print("[HyperUI Template] Window closed")
    if ConfigManager and configFile then
        configFile:Set("savedAt", os.date("%Y-%m-%d %H:%M:%S"))
        configFile:Set("flags",   HyperUI.Flags)
        configFile:Save()
        print("[HyperUI Template] Auto-saved config on close")
    end
end)

Window:OnDestroy(function()
    print("[HyperUI Template] Window destroyed")
end)

-- ============================================================
-- 11. FINALIZE
-- ============================================================

Window:UnlockAll()

HyperUI:Notify({
    Title    = "Loaded",
    Content  = "Developer Template loaded successfully!",
    Duration = 4
})

-- Add more tabs and elements following the documentation:
-- https://github.com/Sam123mir/HyperUI/blob/main/DOCUMENTATION.md