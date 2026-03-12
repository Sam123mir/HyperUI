





local a = require(script.Parent.palette)
local b = require(script.Parent.typography)
local c = require(script.Parent.shadows)





local function buildTheme(d, e, f, g, h)
    return {
        Color      = d,
        Spacing    = e or {
            [1] = 4, [2] = 8, [3] = 12,
            [4] = 16, [6] = 24, [8] = 32,
        },
        Radius     = f or {
            Small = 4, Medium = 8, Large = 12, Full = 999,
        },
        Typography = g or b,
        Shadows    = h    or c,
        
        Font     = (g or b).Font,
        FontSize = (g or b).Size,
    }
end





local d = {}


d.Default = buildTheme({
    Background  = a.Slate[950],
    Surface     = a.Slate[900],
    SurfaceAlt  = a.Slate[800],
    Border      = a.Slate[700],
    Text        = a.Slate[100],
    TextMuted   = a.Slate[400],
    TextOnAccent= a.White,
    Accent      = a.Blue[500],
    AccentHover = a.Blue[400],
    AccentMuted = a.Blue[900],
    Success     = a.Emerald[500],
    Warning     = a.Amber[400],
    Error       = a.Rose[500],
    Info        = a.Sky[400],
})


d.Light = buildTheme({
    Background  = a.White,
    Surface     = a.Slate[50],
    SurfaceAlt  = a.Slate[100],
    Border      = a.Slate[200],
    Text        = a.Slate[900],
    TextMuted   = a.Slate[500],
    TextOnAccent= a.White,
    Accent      = a.Blue[600],
    AccentHover = a.Blue[700],
    AccentMuted = a.Blue[100],
    Success     = a.Emerald[600],
    Warning     = a.Amber[500],
    Error       = a.Rose[600],
    Info        = a.Sky[500],
})


d.Midnight = buildTheme({
    Background  = a.Neutral[950],
    Surface     = a.Neutral[900],
    SurfaceAlt  = a.Neutral[800],
    Border      = a.Neutral[700],
    Text        = a.Neutral[50],
    TextMuted   = a.Neutral[400],
    TextOnAccent= a.Black,
    Accent      = a.Violet[400],
    AccentHover = a.Violet[300],
    AccentMuted = a.Violet[900],
    Success     = a.Teal[400],
    Warning     = a.Yellow[400],
    Error       = a.Red[400],
    Info        = a.Cyan[400],
},
{   
    [1] = 3, [2] = 6, [3] = 10,
    [4] = 14, [6] = 20, [8] = 28,
},
{   
    Small = 2, Medium = 4, Large = 8, Full = 999,
})


d.Ocean = buildTheme({
    Background  = a.Blue[950],
    Surface     = a.Blue[900],
    SurfaceAlt  = a.Blue[800],
    Border      = a.Blue[700],
    Text        = a.Sky[50],
    TextMuted   = a.Sky[300],
    TextOnAccent= a.Blue[950],
    Accent      = a.Cyan[400],
    AccentHover = a.Cyan[300],
    AccentMuted = a.Cyan[900],
    Success     = a.Emerald[400],
    Warning     = a.Amber[300],
    Error       = a.Rose[400],
    Info        = a.Blue[300],
})


d.Forest = buildTheme({
    Background  = a.Green[950],
    Surface     = a.Green[900],
    SurfaceAlt  = a.Green[800],
    Border      = a.Green[700],
    Text        = a.Green[50],
    TextMuted   = a.Green[300],
    TextOnAccent= a.Green[950],
    Accent      = a.Lime[400],
    AccentHover = a.Lime[300],
    AccentMuted = a.Green[800],
    Success     = a.Emerald[400],
    Warning     = a.Yellow[400],
    Error       = a.Red[400],
    Info        = a.Teal[400],
},
nil,
{   
    Small = 6, Medium = 12, Large = 20, Full = 999,
})


d.Sunset = buildTheme({
    Background  = a.Orange[950],
    Surface     = a.Orange[900],
    SurfaceAlt  = a.Orange[800],
    Border      = a.Orange[700],
    Text        = a.Orange[50],
    TextMuted   = a.Orange[300],
    TextOnAccent= a.White,
    Accent      = a.Yellow[400],
    AccentHover = a.Yellow[300],
    AccentMuted = a.Orange[800],
    Success     = a.Lime[400],
    Warning     = a.Amber[300],
    Error       = a.Rose[400],
    Info        = a.Sky[400],
})


d.Rose = buildTheme({
    Background  = a.Pink[950],
    Surface     = a.Pink[900],
    SurfaceAlt  = a.Pink[800],
    Border      = a.Pink[700],
    Text        = a.Pink[50],
    TextMuted   = a.Pink[300],
    TextOnAccent= a.White,
    Accent      = a.Rose[400],
    AccentHover = a.Rose[300],
    AccentMuted = a.Pink[800],
    Success     = a.Emerald[400],
    Warning     = a.Amber[300],
    Error       = a.Red[400],
    Info        = a.Purple[400],
},
nil,
{   
    Small = 8, Medium = 16, Large = 24, Full = 999,
})


d.Aurora = buildTheme({
    Background  = a.Purple[950],
    Surface     = a.Purple[900],
    SurfaceAlt  = a.Purple[800],
    Border      = a.Purple[700],
    Text        = a.Violet[50],
    TextMuted   = a.Violet[300],
    TextOnAccent= a.Purple[950],
    Accent      = a.Teal[400],
    AccentHover = a.Teal[300],
    AccentMuted = a.Purple[800],
    Success     = a.Emerald[400],
    Warning     = a.Amber[300],
    Error       = a.Rose[400],
    Info        = a.Sky[400],
})


d.Neon = buildTheme({
    Background  = a.Neutral[950],
    Surface     = a.Neutral[900],
    SurfaceAlt  = a.Neutral[800],
    Border      = a.Fuchsia[600],
    Text        = a.White,
    TextMuted   = a.Neutral[400],
    TextOnAccent= a.Black,
    Accent      = a.Fuchsia[400],
    AccentHover = a.Fuchsia[300],
    AccentMuted = a.Fuchsia[950],
    Success     = a.Green[400],
    Warning     = a.Yellow[300],
    Error       = a.Red[400],
    Info        = a.Cyan[400],
},
{   
    [1] = 4, [2] = 8, [3] = 14,
    [4] = 20, [6] = 32, [8] = 48,
},
{   
    Small = 0, Medium = 2, Large = 4, Full = 999,
})


d.Sand = buildTheme({
    Background  = a.Stone[50],
    Surface     = a.Stone[100],
    SurfaceAlt  = a.Stone[200],
    Border      = a.Stone[300],
    Text        = a.Stone[900],
    TextMuted   = a.Stone[500],
    TextOnAccent= a.White,
    Accent      = a.Orange[600],
    AccentHover = a.Orange[700],
    AccentMuted = a.Orange[100],
    Success     = a.Green[600],
    Warning     = a.Amber[500],
    Error       = a.Red[600],
    Info        = a.Blue[500],
})


d.Terminal = buildTheme({
    Background  = Color3.fromRGB(10, 14, 10),
    Surface     = Color3.fromRGB(16, 24, 16),
    SurfaceAlt  = Color3.fromRGB(24, 36, 24),
    Border      = Color3.fromRGB(0, 100, 0),
    Text        = Color3.fromRGB(0, 230, 0),
    TextMuted   = Color3.fromRGB(0, 140, 0),
    TextOnAccent= Color3.fromRGB(10, 14, 10),
    Accent      = Color3.fromRGB(0, 255, 80),
    AccentHover = Color3.fromRGB(80, 255, 120),
    AccentMuted = Color3.fromRGB(0, 60, 0),
    Success     = Color3.fromRGB(0, 200, 60),
    Warning     = Color3.fromRGB(200, 200, 0),
    Error       = Color3.fromRGB(255, 60, 60),
    Info        = Color3.fromRGB(0, 180, 200),
},
nil,
{   
    Small = 0, Medium = 0, Large = 0, Full = 999,
})


d.Sepia = buildTheme({
    Background  = Color3.fromRGB(245, 235, 215),
    Surface     = Color3.fromRGB(235, 222, 195),
    SurfaceAlt  = Color3.fromRGB(220, 205, 175),
    Border      = Color3.fromRGB(180, 158, 120),
    Text        = Color3.fromRGB(60, 40, 20),
    TextMuted   = Color3.fromRGB(120, 95, 65),
    TextOnAccent= Color3.fromRGB(245, 235, 215),
    Accent      = Color3.fromRGB(140, 80, 20),
    AccentHover = Color3.fromRGB(110, 60, 10),
    AccentMuted = Color3.fromRGB(220, 195, 160),
    Success     = Color3.fromRGB(60, 120, 60),
    Warning     = Color3.fromRGB(180, 130, 20),
    Error       = Color3.fromRGB(160, 40, 30),
    Info        = Color3.fromRGB(50, 90, 150),
},
nil,
{   
    Small = 3, Medium = 6, Large = 10, Full = 999,
})


d.Ice = buildTheme({
    Background  = Color3.fromRGB(235, 245, 255),
    Surface     = Color3.fromRGB(220, 235, 250),
    SurfaceAlt  = Color3.fromRGB(200, 220, 245),
    Border      = Color3.fromRGB(160, 195, 235),
    Text        = Color3.fromRGB(20, 40, 80),
    TextMuted   = Color3.fromRGB(80, 110, 160),
    TextOnAccent= Color3.fromRGB(235, 245, 255),
    Accent      = Color3.fromRGB(30, 100, 220),
    AccentHover = Color3.fromRGB(20, 80, 190),
    AccentMuted = Color3.fromRGB(190, 215, 250),
    Success     = Color3.fromRGB(20, 150, 110),
    Warning     = Color3.fromRGB(180, 130, 20),
    Error       = Color3.fromRGB(200, 50, 50),
    Info        = Color3.fromRGB(30, 130, 210),
},
nil,
{   
    Small = 10, Medium = 18, Large = 28, Full = 999,
})


d.Lava = buildTheme({
    Background  = Color3.fromRGB(14, 8, 6),
    Surface     = Color3.fromRGB(28, 14, 10),
    SurfaceAlt  = Color3.fromRGB(46, 20, 14),
    Border      = Color3.fromRGB(120, 40, 20),
    Text        = Color3.fromRGB(255, 220, 200),
    TextMuted   = Color3.fromRGB(180, 120, 100),
    TextOnAccent= Color3.fromRGB(14, 8, 6),
    Accent      = Color3.fromRGB(255, 80, 20),
    AccentHover = Color3.fromRGB(255, 120, 60),
    AccentMuted = Color3.fromRGB(80, 20, 10),
    Success     = Color3.fromRGB(100, 200, 80),
    Warning     = Color3.fromRGB(255, 180, 0),
    Error       = Color3.fromRGB(255, 40, 40),
    Info        = Color3.fromRGB(80, 160, 240),
})


d.Galaxy = buildTheme({
    Background  = Color3.fromRGB(8, 6, 18),
    Surface     = Color3.fromRGB(16, 12, 36),
    SurfaceAlt  = Color3.fromRGB(26, 20, 54),
    Border      = Color3.fromRGB(60, 40, 120),
    Text        = Color3.fromRGB(220, 210, 255),
    TextMuted   = Color3.fromRGB(130, 110, 200),
    TextOnAccent= Color3.fromRGB(8, 6, 18),
    Accent      = Color3.fromRGB(160, 100, 255),
    AccentHover = Color3.fromRGB(180, 130, 255),
    AccentMuted = Color3.fromRGB(40, 20, 80),
    Success     = Color3.fromRGB(80, 220, 160),
    Warning     = Color3.fromRGB(255, 200, 80),
    Error       = Color3.fromRGB(255, 80, 120),
    Info        = Color3.fromRGB(80, 180, 255),
})


d.Copper = buildTheme({
    Background  = Color3.fromRGB(22, 14, 8),
    Surface     = Color3.fromRGB(38, 24, 12),
    SurfaceAlt  = Color3.fromRGB(56, 36, 16),
    Border      = Color3.fromRGB(140, 80, 30),
    Text        = Color3.fromRGB(255, 230, 180),
    TextMuted   = Color3.fromRGB(180, 130, 80),
    TextOnAccent= Color3.fromRGB(22, 14, 8),
    Accent      = Color3.fromRGB(200, 110, 40),
    AccentHover = Color3.fromRGB(220, 140, 70),
    AccentMuted = Color3.fromRGB(80, 40, 10),
    Success     = Color3.fromRGB(80, 180, 80),
    Warning     = Color3.fromRGB(230, 180, 20),
    Error       = Color3.fromRGB(220, 60, 40),
    Info        = Color3.fromRGB(60, 140, 200),
},
nil,
{   
    Small = 2, Medium = 4, Large = 6, Full = 999,
})


d.Pastel = buildTheme({
    Background  = Color3.fromRGB(255, 250, 252),
    Surface     = Color3.fromRGB(250, 240, 255),
    SurfaceAlt  = Color3.fromRGB(240, 245, 255),
    Border      = Color3.fromRGB(210, 195, 230),
    Text        = Color3.fromRGB(60, 50, 80),
    TextMuted   = Color3.fromRGB(130, 115, 155),
    TextOnAccent= Color3.fromRGB(255, 250, 252),
    Accent      = Color3.fromRGB(180, 130, 220),
    AccentHover = Color3.fromRGB(160, 105, 205),
    AccentMuted = Color3.fromRGB(235, 220, 250),
    Success     = Color3.fromRGB(100, 200, 150),
    Warning     = Color3.fromRGB(240, 190, 100),
    Error       = Color3.fromRGB(240, 130, 140),
    Info        = Color3.fromRGB(110, 170, 240),
},
nil,
{   
    Small = 12, Medium = 20, Large = 32, Full = 999,
})


d.Monochrome = buildTheme({
    Background  = Color3.fromRGB(10, 10, 10),
    Surface     = Color3.fromRGB(22, 22, 22),
    SurfaceAlt  = Color3.fromRGB(36, 36, 36),
    Border      = Color3.fromRGB(60, 60, 60),
    Text        = Color3.fromRGB(240, 240, 240),
    TextMuted   = Color3.fromRGB(140, 140, 140),
    TextOnAccent= Color3.fromRGB(10, 10, 10),
    Accent      = Color3.fromRGB(220, 220, 220),
    AccentHover = Color3.fromRGB(255, 255, 255),
    AccentMuted = Color3.fromRGB(50, 50, 50),
    Success     = Color3.fromRGB(190, 190, 190),
    Warning     = Color3.fromRGB(170, 170, 170),
    Error       = Color3.fromRGB(200, 200, 200),
    Info        = Color3.fromRGB(160, 160, 160),
},
nil,
{   
    Small = 0, Medium = 0, Large = 0, Full = 0,
})


d.Nordic = buildTheme({
    Background  = Color3.fromRGB(36, 40, 50),
    Surface     = Color3.fromRGB(48, 54, 66),
    SurfaceAlt  = Color3.fromRGB(62, 70, 84),
    Border      = Color3.fromRGB(88, 98, 116),
    Text        = Color3.fromRGB(220, 228, 240),
    TextMuted   = Color3.fromRGB(140, 155, 180),
    TextOnAccent= Color3.fromRGB(36, 40, 50),
    Accent      = Color3.fromRGB(130, 180, 240),
    AccentHover = Color3.fromRGB(155, 200, 255),
    AccentMuted = Color3.fromRGB(50, 70, 100),
    Success     = Color3.fromRGB(100, 190, 130),
    Warning     = Color3.fromRGB(240, 190, 80),
    Error       = Color3.fromRGB(220, 90, 90),
    Info        = Color3.fromRGB(100, 170, 230),
})


d.Sakura = buildTheme({
    Background  = Color3.fromRGB(255, 248, 250),
    Surface     = Color3.fromRGB(255, 238, 244),
    SurfaceAlt  = Color3.fromRGB(252, 222, 234),
    Border      = Color3.fromRGB(240, 180, 200),
    Text        = Color3.fromRGB(60, 30, 45),
    TextMuted   = Color3.fromRGB(150, 100, 120),
    TextOnAccent= Color3.fromRGB(255, 248, 250),
    Accent      = Color3.fromRGB(220, 80, 120),
    AccentHover = Color3.fromRGB(200, 60, 100),
    AccentMuted = Color3.fromRGB(255, 215, 230),
    Success     = Color3.fromRGB(60, 170, 100),
    Warning     = Color3.fromRGB(220, 160, 30),
    Error       = Color3.fromRGB(210, 50, 70),
    Info        = Color3.fromRGB(70, 140, 210),
},
nil,
{   
    Small = 8, Medium = 16, Large = 24, Full = 999,
})






d._Names = {
    "Default",
    "Light",
    "Midnight",
    "Ocean",
    "Forest",
    "Sunset",
    "Rose",
    "Aurora",
    "Neon",
    "Sand",
    "Terminal",
    "Sepia",
    "Ice",
    "Lava",
    "Galaxy",
    "Copper",
    "Pastel",
    "Monochrome",
    "Nordic",
    "Sakura",
}


d._Active = "Default"




function d:Get(e)
    local f = e or self._Active
    return self[f] or self.Default
end




function d:Set(e)
    if self[e] and type(self[e]) == "table" then
        self._Active = e
        return true
    end
    warn(("[HyperUI] Tema '%s' no encontrado. Se mantiene '%s'."):format(tostring(e), self._Active))
    return false
end




function d:Register(e, f)
    assert(type(e)   == "string", "[HyperUI] El nombre del tema debe ser una cadena.")
    assert(type(f) == "table",  "[HyperUI] Los tokens del tema deben ser una tabla.")
    self[e] = f
    table.insert(self._Names, e)
end

return d