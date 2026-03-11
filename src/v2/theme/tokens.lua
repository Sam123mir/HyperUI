--[[
    HyperUI v2 - Design Tokens
    Semantic mapping for the visual system.
]]

local Palette = require(script.Parent.palette)
local Typography = require(script.Parent.typography)
local Shadows = require(script.Parent.shadows)

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
