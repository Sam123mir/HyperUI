local OpenButton = {}

local Creator = require("../../modules/Creator")
local New = Creator.New
local Tween = Creator.Tween

local cloneref = (cloneref or clonereference or function(instance) return instance end)
local UserInputService = cloneref(game:GetService("UserInputService"))

function OpenButton.New(Window)
    local OpenButtonMain = { Button = nil }

    local Icon
    local VersionText = Window.Version or "v1.0"

    -- ✅ Texto más grande para mejor legibilidad
    local Title = New("TextLabel", {
        Text = Window.Title,
        TextSize = 17,
        RichText = true,
        FontFace = Font.new(Creator.Font, Enum.FontWeight.SemiBold),
        TextColor3 = Color3.fromRGB(240, 240, 240),
        BackgroundTransparency = 1,
        AutomaticSize = "X",
    })

    -- ✅ Logo más grande
    local LogoContainer = New("Frame", {
        Size = UDim2.new(0, 38, 0, 38),
        BackgroundTransparency = 0.85,
        BackgroundColor3 = Color3.fromRGB(15, 15, 20),
        Name = "LogoContainer",
    }, {
        New("UICorner", { CornerRadius = UDim.new(0, 9) })
    })

    -- ✅ Drag más grande y fácil de agarrar
    local Drag = New("Frame", {
        Size = UDim2.new(0, 34, 0, 34),
        BackgroundTransparency = 1,
        Name = "Drag",
    }, {
        New("ImageLabel", {
            Image = Creator.Icon("move")[1],
            ImageRectOffset = Creator.Icon("move")[2].ImageRectPosition,
            ImageRectSize = Creator.Icon("move")[2].ImageRectSize,
            Size = UDim2.new(0, 20, 0, 20),
            BackgroundTransparency = 1,
            Position = UDim2.new(0.5, 0, 0.5, 0),
            AnchorPoint = Vector2.new(0.5, 0.5),
            ThemeTag = { ImageColor3 = "Icon" },
            ImageTransparency = 0.3,
        })
    })

    local Divider = New("Frame", {
        Size = UDim2.new(0, 1, 0, 28),
        BackgroundColor3 = Color3.new(1, 1, 1),
        BackgroundTransparency = 0.75,
        Name = "Divider"
    })

    local UIScale = New("UIScale", { Scale = 1 })

    -- ✅ Altura sincronizada con el Widget (40px)
    local BUTTON_HEIGHT = 40

    local Container = New("Frame", {
        Size = UDim2.new(0, 0, 0, 0),
        -- ✅ Posición por defecto: Derecha-Centro
        Position = Window.MinibarPosition or UDim2.new(1, -120, 0.5, 0),
        AnchorPoint = Vector2.new(1, 0.5),
        Parent = Window.Parent,
        BackgroundTransparency = 1,
        Active = true,
        Visible = false,
        ClipsDescendants = true,
    })

    local OpenZone = New("TextButton", {
        Size = UDim2.new(0, 0, 1, 0),
        AutomaticSize = "X",
        BackgroundTransparency = 1,
        Text = "",
        Name = "OpenZone",
    }, {
        New("UIListLayout", {
            Padding = UDim.new(0, 10),
            FillDirection = "Horizontal",
            VerticalAlignment = "Center",
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        LogoContainer,
        Title,
    })

    local Button = New("Frame", {
        Size = UDim2.new(0, 0, 0, BUTTON_HEIGHT),
        AutomaticSize = "X",
        Parent = Container,
        Active = false,
        -- ✅ Estilo sincronizado con el Footer
        BackgroundTransparency = 0.2,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        ZIndex = 99,
    }, {
        UIScale,
        New("UICorner", { CornerRadius = UDim.new(0, 10) }),

        New("UIStroke", {
            Thickness = 1,
            ApplyStrokeMode = "Border",
            Transparency = 0.5,
            ThemeTag = { Color = "Accent" }
        }),

        New("UIListLayout", {
            Padding = UDim.new(0, 12),
            FillDirection = "Horizontal",
            VerticalAlignment = "Center",
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        New("UIPadding", {
            PaddingLeft = UDim.new(0, 10),
            PaddingRight = UDim.new(0, 10),
        }),

        OpenZone,
        Divider,
        Drag,
    })

    OpenButtonMain.Button = Button

    -- Sincronizar tamaño del Container con el Button
    Creator.AddSignal(Button:GetPropertyChangedSignal("AbsoluteSize"), function()
        local sz = Button.AbsoluteSize
        Container.Size = UDim2.new(0, sz.X, 0, sz.Y)
    end)

    -- Clic en el área de Logo/Título abre la ventana
    Creator.AddSignal(OpenZone.MouseButton1Click, function()
        Window:Open()
    end)

    -- ✅ Persistencia: Guardar posición después de arrastrar
    local DragModule = Creator.Drag(Container, { Drag }, function(dragging)
        if not dragging then
            Window.MinibarPosition = Container.Position
        end
    end)

    function OpenButtonMain:SetIcon(newIcon)
        if Icon then Icon:Destroy() end
        if newIcon then
            Icon = Creator.Image(newIcon, Window.Title, 0, Window.Folder, "OpenButton", true, Window.IconThemed)
            -- ✅ Icono sincronizado (16x16)
            Icon.Size = UDim2.new(0, 16, 0, 16)
            Icon.Position = UDim2.new(0.5, 0, 0.5, 0)
            Icon.AnchorPoint = Vector2.new(0.5, 0.5)
            Icon.Parent = LogoContainer
        end
    end

    if Window.Icon then OpenButtonMain:SetIcon(Window.Icon) end

    function OpenButtonMain:Visible(v, pos)
        -- ✅ Ignoramos 'pos' de la ventana para usar nuestra propia persistencia
        Container.Visible = v
    end

    function OpenButtonMain:SetScale(scale)
        UIScale.Scale = scale
    end

    function OpenButtonMain:Edit(OpenButtonConfig)
        local cfg = {
            Title           = OpenButtonConfig.Title,
            Icon            = OpenButtonConfig.Icon,
            Enabled         = OpenButtonConfig.Enabled,
            Position        = OpenButtonConfig.Position,
            OnlyIcon        = OpenButtonConfig.OnlyIcon or false,
            Draggable       = OpenButtonConfig.Draggable ~= false,
            OnlyMobile      = OpenButtonConfig.OnlyMobile,
            CornerRadius    = OpenButtonConfig.CornerRadius or UDim.new(0, 10),
            StrokeThickness = OpenButtonConfig.StrokeThickness or 1,
            Scale           = OpenButtonConfig.Scale or 1,
            Color           = OpenButtonConfig.Color
        }

        if cfg.Enabled == false then
            Window.IsOpenButtonEnabled = false
        end

        if not cfg.Draggable then
            Drag.Visible = false
            Divider.Visible = false
            if DragModule then DragModule:Set(false) end
        else
            Drag.Visible = true
            Divider.Visible = true
            if DragModule then DragModule:Set(true) end
        end

        if cfg.Position then Container.Position = cfg.Position end
        Title.Visible = not cfg.OnlyIcon

        if cfg.Title then
            Title.Text = cfg.Title
            if Creator.ChangeTranslationKey then
                Creator:ChangeTranslationKey(Title, cfg.Title)
            end
        end

        if cfg.Icon then OpenButtonMain:SetIcon(cfg.Icon) end

        local Stroke = Button:FindFirstChildWhichIsA("UIStroke")
        if Stroke then
            Stroke.Thickness = cfg.StrokeThickness
        end

        local Corner = Button:FindFirstChildWhichIsA("UICorner")
        if Corner then Corner.CornerRadius = cfg.CornerRadius end

        OpenButtonMain:SetScale(cfg.Scale)
    end

    return OpenButtonMain
end

return OpenButton
