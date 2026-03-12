--[[
    HyperUI v2 - Themes
    Una amplia gama de temas semánticos para el sistema visual.
    Cada tema mapea los Design Tokens a una paleta y personalidad específica.
]]

local Palette = require(script.Parent.palette)
local Typography = require(script.Parent.typography)
local Shadows = require(script.Parent.shadows)

-- ─────────────────────────────────────────────────────────────────────────────
-- Helpers
-- ─────────────────────────────────────────────────────────────────────────────

local function buildTheme(color, spacing, radius, typography, shadows)
    return {
        Color      = color,
        Spacing    = spacing or {
            [1] = 4, [2] = 8, [3] = 12,
            [4] = 16, [6] = 24, [8] = 32,
        },
        Radius     = radius or {
            Small = 4, Medium = 8, Large = 12, Full = 999,
        },
        Typography = typography or Typography,
        Shadows    = shadows    or Shadows,
        -- Legacy aliases
        Font     = (typography or Typography).Font,
        FontSize = (typography or Typography).Size,
    }
end

-- ─────────────────────────────────────────────────────────────────────────────
-- Themes
-- ─────────────────────────────────────────────────────────────────────────────

local Themes = {}

-- ── 1. Default (Dark Slate) ──────────────────────────────────────────────────
Themes.Default = buildTheme({
    Background  = Palette.Slate[950],
    Surface     = Palette.Slate[900],
    SurfaceAlt  = Palette.Slate[800],
    Border      = Palette.Slate[700],
    Text        = Palette.Slate[100],
    TextMuted   = Palette.Slate[400],
    TextOnAccent= Palette.White,
    Accent      = Palette.Blue[500],
    AccentHover = Palette.Blue[400],
    AccentMuted = Palette.Blue[900],
    Success     = Palette.Emerald[500],
    Warning     = Palette.Amber[400],
    Error       = Palette.Rose[500],
    Info        = Palette.Sky[400],
})

-- ── 2. Light (Clean White) ───────────────────────────────────────────────────
Themes.Light = buildTheme({
    Background  = Palette.White,
    Surface     = Palette.Slate[50],
    SurfaceAlt  = Palette.Slate[100],
    Border      = Palette.Slate[200],
    Text        = Palette.Slate[900],
    TextMuted   = Palette.Slate[500],
    TextOnAccent= Palette.White,
    Accent      = Palette.Blue[600],
    AccentHover = Palette.Blue[700],
    AccentMuted = Palette.Blue[100],
    Success     = Palette.Emerald[600],
    Warning     = Palette.Amber[500],
    Error       = Palette.Rose[600],
    Info        = Palette.Sky[500],
})

-- ── 3. Midnight (Deep Black) ─────────────────────────────────────────────────
Themes.Midnight = buildTheme({
    Background  = Palette.Neutral[950],
    Surface     = Palette.Neutral[900],
    SurfaceAlt  = Palette.Neutral[800],
    Border      = Palette.Neutral[700],
    Text        = Palette.Neutral[50],
    TextMuted   = Palette.Neutral[400],
    TextOnAccent= Palette.Black,
    Accent      = Palette.Violet[400],
    AccentHover = Palette.Violet[300],
    AccentMuted = Palette.Violet[900],
    Success     = Palette.Teal[400],
    Warning     = Palette.Yellow[400],
    Error       = Palette.Red[400],
    Info        = Palette.Cyan[400],
},
{   -- Spacing más apretado
    [1] = 3, [2] = 6, [3] = 10,
    [4] = 14, [6] = 20, [8] = 28,
},
{   -- Bordes más rectos
    Small = 2, Medium = 4, Large = 8, Full = 999,
})

-- ── 4. Ocean (Deep Blue) ─────────────────────────────────────────────────────
Themes.Ocean = buildTheme({
    Background  = Palette.Blue[950],
    Surface     = Palette.Blue[900],
    SurfaceAlt  = Palette.Blue[800],
    Border      = Palette.Blue[700],
    Text        = Palette.Sky[50],
    TextMuted   = Palette.Sky[300],
    TextOnAccent= Palette.Blue[950],
    Accent      = Palette.Cyan[400],
    AccentHover = Palette.Cyan[300],
    AccentMuted = Palette.Cyan[900],
    Success     = Palette.Emerald[400],
    Warning     = Palette.Amber[300],
    Error       = Palette.Rose[400],
    Info        = Palette.Blue[300],
})

-- ── 5. Forest (Natural Green) ────────────────────────────────────────────────
Themes.Forest = buildTheme({
    Background  = Palette.Green[950],
    Surface     = Palette.Green[900],
    SurfaceAlt  = Palette.Green[800],
    Border      = Palette.Green[700],
    Text        = Palette.Green[50],
    TextMuted   = Palette.Green[300],
    TextOnAccent= Palette.Green[950],
    Accent      = Palette.Lime[400],
    AccentHover = Palette.Lime[300],
    AccentMuted = Palette.Green[800],
    Success     = Palette.Emerald[400],
    Warning     = Palette.Yellow[400],
    Error       = Palette.Red[400],
    Info        = Palette.Teal[400],
},
nil,
{   -- Bordes orgánicos
    Small = 6, Medium = 12, Large = 20, Full = 999,
})

-- ── 6. Sunset (Warm Orange-Red) ──────────────────────────────────────────────
Themes.Sunset = buildTheme({
    Background  = Palette.Orange[950],
    Surface     = Palette.Orange[900],
    SurfaceAlt  = Palette.Orange[800],
    Border      = Palette.Orange[700],
    Text        = Palette.Orange[50],
    TextMuted   = Palette.Orange[300],
    TextOnAccent= Palette.White,
    Accent      = Palette.Yellow[400],
    AccentHover = Palette.Yellow[300],
    AccentMuted = Palette.Orange[800],
    Success     = Palette.Lime[400],
    Warning     = Palette.Amber[300],
    Error       = Palette.Rose[400],
    Info        = Palette.Sky[400],
})

-- ── 7. Rose (Feminine Pink) ──────────────────────────────────────────────────
Themes.Rose = buildTheme({
    Background  = Palette.Pink[950],
    Surface     = Palette.Pink[900],
    SurfaceAlt  = Palette.Pink[800],
    Border      = Palette.Pink[700],
    Text        = Palette.Pink[50],
    TextMuted   = Palette.Pink[300],
    TextOnAccent= Palette.White,
    Accent      = Palette.Rose[400],
    AccentHover = Palette.Rose[300],
    AccentMuted = Palette.Pink[800],
    Success     = Palette.Emerald[400],
    Warning     = Palette.Amber[300],
    Error       = Palette.Red[400],
    Info        = Palette.Purple[400],
},
nil,
{   -- Bordes muy redondeados
    Small = 8, Medium = 16, Large = 24, Full = 999,
})

-- ── 8. Aurora (Purple-Teal) ──────────────────────────────────────────────────
Themes.Aurora = buildTheme({
    Background  = Palette.Purple[950],
    Surface     = Palette.Purple[900],
    SurfaceAlt  = Palette.Purple[800],
    Border      = Palette.Purple[700],
    Text        = Palette.Violet[50],
    TextMuted   = Palette.Violet[300],
    TextOnAccent= Palette.Purple[950],
    Accent      = Palette.Teal[400],
    AccentHover = Palette.Teal[300],
    AccentMuted = Palette.Purple[800],
    Success     = Palette.Emerald[400],
    Warning     = Palette.Amber[300],
    Error       = Palette.Rose[400],
    Info        = Palette.Sky[400],
})

-- ── 9. Neon (Cyberpunk Dark) ─────────────────────────────────────────────────
Themes.Neon = buildTheme({
    Background  = Palette.Neutral[950],
    Surface     = Palette.Neutral[900],
    SurfaceAlt  = Palette.Neutral[800],
    Border      = Palette.Fuchsia[600],
    Text        = Palette.White,
    TextMuted   = Palette.Neutral[400],
    TextOnAccent= Palette.Black,
    Accent      = Palette.Fuchsia[400],
    AccentHover = Palette.Fuchsia[300],
    AccentMuted = Palette.Fuchsia[950],
    Success     = Palette.Green[400],
    Warning     = Palette.Yellow[300],
    Error       = Palette.Red[400],
    Info        = Palette.Cyan[400],
},
{   -- Spacing más generoso
    [1] = 4, [2] = 8, [3] = 14,
    [4] = 20, [6] = 32, [8] = 48,
},
{   -- Sin bordes redondeados (estilo angular)
    Small = 0, Medium = 2, Large = 4, Full = 999,
})

-- ── 10. Sand (Warm Beige Light) ──────────────────────────────────────────────
Themes.Sand = buildTheme({
    Background  = Palette.Stone[50],
    Surface     = Palette.Stone[100],
    SurfaceAlt  = Palette.Stone[200],
    Border      = Palette.Stone[300],
    Text        = Palette.Stone[900],
    TextMuted   = Palette.Stone[500],
    TextOnAccent= Palette.White,
    Accent      = Palette.Orange[600],
    AccentHover = Palette.Orange[700],
    AccentMuted = Palette.Orange[100],
    Success     = Palette.Green[600],
    Warning     = Palette.Amber[500],
    Error       = Palette.Red[600],
    Info        = Palette.Blue[500],
})

-- ── 11. Terminal (Classic Green CRT) ─────────────────────────────────────────
Themes.Terminal = buildTheme({
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
{   -- Sin redondeo, estilo terminal
    Small = 0, Medium = 0, Large = 0, Full = 999,
})

-- ── 12. Sepia (Old Parchment) ────────────────────────────────────────────────
Themes.Sepia = buildTheme({
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
{   -- Bordes orgánicos suaves
    Small = 3, Medium = 6, Large = 10, Full = 999,
})

-- ── 13. Ice (Cool White-Blue) ────────────────────────────────────────────────
Themes.Ice = buildTheme({
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
{   -- Bordes muy redondeados
    Small = 10, Medium = 18, Large = 28, Full = 999,
})

-- ── 14. Lava (Volcanic Dark-Red) ─────────────────────────────────────────────
Themes.Lava = buildTheme({
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

-- ── 15. Galaxy (Deep Space) ──────────────────────────────────────────────────
Themes.Galaxy = buildTheme({
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

-- ── 16. Copper (Steampunk Brown-Orange) ──────────────────────────────────────
Themes.Copper = buildTheme({
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
{   -- Bordes semi-angulares (estilo steampunk)
    Small = 2, Medium = 4, Large = 6, Full = 999,
})

-- ── 17. Pastel (Soft Light) ──────────────────────────────────────────────────
Themes.Pastel = buildTheme({
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
{   -- Bordes muy redondeados
    Small = 12, Medium = 20, Large = 32, Full = 999,
})

-- ── 18. Monochrome (Grayscale Only) ──────────────────────────────────────────
Themes.Monochrome = buildTheme({
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
{   -- Sin redondeo (estilo brutal)
    Small = 0, Medium = 0, Large = 0, Full = 0,
})

-- ── 19. Nordic (Scandinavian Blue-Gray) ──────────────────────────────────────
Themes.Nordic = buildTheme({
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

-- ── 20. Sakura (Japanese Pink-White) ─────────────────────────────────────────
Themes.Sakura = buildTheme({
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
{   -- Bordes suaves y orgánicos
    Small = 8, Medium = 16, Large = 24, Full = 999,
})

-- ─────────────────────────────────────────────────────────────────────────────
-- Theme Registry
-- ─────────────────────────────────────────────────────────────────────────────

-- Lista de todos los nombres de temas disponibles
Themes._Names = {
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

-- Tema activo por defecto
Themes._Active = "Default"

--- Obtiene el tema activo o un tema por nombre.
-- @param name string? Nombre del tema (opcional). Si no se provee, retorna el activo.
-- @return table El token set del tema solicitado.
function Themes:Get(name)
    local key = name or self._Active
    return self[key] or self.Default
end

--- Cambia el tema activo.
-- @param name string Nombre del tema a activar.
-- @return boolean true si el tema existe y fue activado, false si no existe.
function Themes:Set(name)
    if self[name] and type(self[name]) == "table" then
        self._Active = name
        return true
    end
    warn(("[HyperUI] Tema '%s' no encontrado. Se mantiene '%s'."):format(tostring(name), self._Active))
    return false
end

--- Registra un tema personalizado en tiempo de ejecución.
-- @param name   string El nombre único del tema.
-- @param tokens table  La tabla de tokens del tema (Color, Spacing, Radius, ...).
function Themes:Register(name, tokens)
    assert(type(name)   == "string", "[HyperUI] El nombre del tema debe ser una cadena.")
    assert(type(tokens) == "table",  "[HyperUI] Los tokens del tema deben ser una tabla.")
    self[name] = tokens
    table.insert(self._Names, name)
end

return Themes