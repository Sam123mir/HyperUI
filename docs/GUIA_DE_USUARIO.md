# Guía de Usuario: HyperUI v2

Bienvenido a HyperUI v2, el framework de interfaz de usuario más avanzado y profesional para Roblox. Esta guía te enseñará cómo integrar y utilizar HyperUI en tus propios scripts, paso a paso.

## 1. Instalación (Carga Rápida)

Para usar HyperUI v2, solo necesitas una línea de código en tu script. Esto cargará la última versión estable directamente desde el repositorio oficial:

```lua
local HyperUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sam123mir/HyperUI/main/dist/HyperUI.lua"))()
local UI = HyperUI.new()
```

## 2. Creación de una Ventana

La ventana es el contenedor principal de tu interfaz. Puedes personalizar el título, subtítulo e icono.

```lua
local Window = UI:CreateWindow({
    Title = "Mi Script Increíble",
    SubTitle = "Versión 1.0.0",
    Icon = "rbxassetid://10723343321", -- ID de imagen de Roblox
    Resizable = true, -- Permite cambiar el tamaño
    Draggable = true, -- Permite arrastrar la ventana
})
```

## 3. Organización: Pestañas y Secciones

Para mantener tu UI limpia, organiza tus componentes en Pestañas (`Tabs`) y estas en Secciones (`Sections`).

```lua
-- Crear una pestaña
local MainTab = Window:CreateTab({
    Title = "Principal",
    Icon = "rbxassetid://10723345799"
})

-- Crear una sección dentro de la pestaña
local CombatSection = MainTab:CreateSection({ Title = "Combate" })
```

## 4. Componentes de Interacción

### Botones
Los botones ejecutan una función cuando se hace clic en ellos.

```lua
CombatSection:CreateButton({
    Text = "Kill All",
    Description = "Elimina a todos los jugadores cercanos.",
    Callback = function()
        print("Botón presionado")
    end
})
```

### Interruptores (Toggles) y Checkboxes
Ideales para activar o desactivar funciones.

```lua
CombatSection:CreateToggle({
    Text = "Auto Farm",
    Default = false,
    Callback = function(state)
        print("Auto Farm está:", state)
    end
})
```

### Deslizadores (Sliders)
Para valores numéricos con un rango.

```lua
CombatSection:CreateSlider({
    Text = "WalkSpeed",
    Min = 16,
    Max = 100,
    Default = 16,
    Callback = function(val)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
    end
})
```

### Listas Desplegables (Dropdowns)
Permite seleccionar una opción de una lista.

```lua
CombatSection:CreateDropdown({
    Text = "Seleccionar Arma",
    Options = {"Espada", "Arco", "Pistola"},
    Default = "Espada",
    Callback = function(opcion)
        print("Arma seleccionada:", opcion)
    end
})
```

## 5. Entradas de Texto (Inputs)

HyperUI ofrece varios tipos de campos de texto.

```lua
local SettingsSection = MainTab:CreateSection({ Title = "Ajustes" })

-- Entrada de texto simple
SettingsSection:CreateInput({
    Text = "Nombre de Config",
    Placeholder = "Escribe aquí...",
    Callback = function(texto)
        print("Texto ingresado:", texto)
    end
})

-- Entrada de números
SettingsSection:CreateNumberInput({
    Text = "Cantidad",
    Default = 1,
    Callback = function(num)
        print("Número ingresado:", num)
    end
})
```

## 6. Notificaciones y Alertas

Puedes enviar mensajes al usuario de forma elegante.

```lua
-- Notificación simple (Toast)
UI:Notify({
    Title = "Éxito",
    Content = "Configuración guardada correctamente.",
    Priority = "Success" -- Info, Success, Warning, Error
})

-- Alerta de confirmación (Modal)
UI:Prompt({
    Title = "¿Estás seguro?",
    Content = "Esta acción no se puede deshacer.",
    OnConfirm = function()
        print("Usuario confirmó")
    end,
    OnCancel = function()
        print("Usuario canceló")
    end
})
```

## 7. Temas y Personalización

HyperUI soporta temas dinámicos que puedes cambiar en tiempo real.

```lua
-- Cambiar a tema claro
UI:SetTheme("Light")

-- Temas disponibles: "Dark", "Light", "Glass", "Midnight", "Ocean"
```

## 8. Persistencia (Guardar Configuración)

Si quieres que las opciones se guarden automáticamente:

```lua
-- Guardar configuración actual
UI:SaveConfig()

-- El framework buscará automáticamente una configuración guardada al iniciar.
```

---
¡Eso es todo! Ahora estás listo para crear interfaces increíbles con **HyperUI v2**.
