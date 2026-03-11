




local a = require(script.Parent.palette)
local b = require(script.Parent.typography)
local c = require(script.Parent.shadows)

local d = {
    Color = {
        Background = a.Slate[950],
        Surface = a.Slate[900],
        Border = a.Slate[800],
        Text = a.Slate[100],
        TextMuted = a.Slate[400],
        Accent = a.Blue[500],
        Success = a.Emerald[500],
        Error = a.Rose[500],
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
    Typography = b,
    Shadows = c,
    
    
    Font = b.Font,
    FontSize = b.Size,
}

return d
