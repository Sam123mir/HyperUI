local Footer = {}

local Creator = require("../../../modules/Creator")
local New = Creator.New
local Tween = Creator.Tween

local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

function Footer.Init(Window)
    local FooterFrame = New("Frame", {
        Name = "StatsWidget",
        Size = UDim2.new(0, 0, 0, 40),
        Position = UDim2.new(0.5, 0, 0, 20),
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0.2,
        Parent = Window.Parent,
        AutomaticSize = Enum.AutomaticSize.X,
    }, {
        New("UICorner", {
            CornerRadius = UDim.new(0, 10),
        }),
        New("UIStroke", {
            Thickness = 1,
            Transparency = 0.5,
            ThemeTag = {
                Color = "Accent",
            }
        }),
        New("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0, 12),
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
        }),
        New("UIPadding", {
            PaddingLeft = UDim.new(0, 10),
            PaddingRight = UDim.new(0, 10),
        })
    })

    -- / Profile Section /
    local AvatarImage = New("ImageLabel", {
        Size = UDim2.new(0, 24, 0, 24),
        BackgroundTransparency = 1,
        Image = "",
    }, {
        New("UICorner", {
            CornerRadius = UDim.new(1, 0),
        })
    })

    local UserName = New("TextLabel", {
        Text = LocalPlayer.DisplayName,
        TextSize = 14,
        FontFace = Font.new(Creator.Font, Enum.FontWeight.SemiBold),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        AutomaticSize = Enum.AutomaticSize.XY,
    })

    -- Get Avatar
    task.spawn(function()
        local content, isReady = Players:GetUserThumbnailAsync(
            LocalPlayer.UserId,
            Enum.ThumbnailType.HeadShot,
            Enum.ThumbnailSize.Size420x420
        )
        if isReady then
            AvatarImage.Image = content
        end
    end)

    -- / Separator helper /
    local function MakeSeparator()
        return New("Frame", {
            Size = UDim2.new(0, 1, 0, 20),
            BackgroundTransparency = 0.8,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        })
    end

    -- / Stats helper /
    local function CreateStat(iconName, initialText)
        local frame = New("Frame", {
            Size = UDim2.new(0, 0, 0, 24),
            BackgroundTransparency = 1,
            AutomaticSize = Enum.AutomaticSize.X,
        }, {
            New("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Padding = UDim.new(0, 4),
            }),
            New("ImageLabel", {
                Size = UDim2.new(0, 16, 0, 16),
                Image = Creator.Icon(iconName)[1],
                ImageRectOffset = Creator.Icon(iconName)[2].ImageRectPosition,
                ImageRectSize = Creator.Icon(iconName)[2].ImageRectSize,
                BackgroundTransparency = 1,
                ThemeTag = { ImageColor3 = "Icon" },
            }),
            New("TextLabel", {
                Text = initialText,
                TextSize = 13,
                FontFace = Font.new(Creator.Font, Enum.FontWeight.Medium),
                TextColor3 = Color3.fromRGB(200, 200, 200),
                BackgroundTransparency = 1,
                AutomaticSize = Enum.AutomaticSize.XY,
            })
        })
        return frame, frame:FindFirstChildWhichIsA("TextLabel")
    end

    -- / Clock Section /
    -- Formato: HH:MM:SS  con un icono de reloj
    local ClockFrame = New("Frame", {
        Size = UDim2.new(0, 0, 0, 24),
        BackgroundTransparency = 1,
        AutomaticSize = Enum.AutomaticSize.X,
    }, {
        New("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0, 4),
        }),
        New("ImageLabel", {
            Size = UDim2.new(0, 16, 0, 16),
            Image = Creator.Icon("clock")[1],
            ImageRectOffset = Creator.Icon("clock")[2].ImageRectPosition,
            ImageRectSize = Creator.Icon("clock")[2].ImageRectSize,
            BackgroundTransparency = 1,
            ThemeTag = { ImageColor3 = "Icon" },
        }),
    })

    local ClockLabel = New("TextLabel", {
        Text = "00:00:00",
        TextSize = 13,
        FontFace = Font.new(Creator.Font, Enum.FontWeight.SemiBold),
        -- Pequeño toque de color para destacar el reloj
        TextColor3 = Color3.fromRGB(180, 210, 255),
        BackgroundTransparency = 1,
        AutomaticSize = Enum.AutomaticSize.XY,
        Parent = ClockFrame,
    })

    -- Función para obtener hora local del sistema
    local function GetLocalTime()
        -- os.date("%H:%M:%S") sin "!" devuelve la hora local del sistema del usuario
        return os.date("%H:%M:%S")
    end

    -- / Stats /
    local executorName = (identifyexecutor and identifyexecutor()) or "Unknown"
    local ExecutorFrame, ExecutorLabel = CreateStat("cpu", executorName)
    local PingFrame,     PingLabel     = CreateStat("wifi", "0ms")
    local FPSFrame,      FPSLabel      = CreateStat("activity", "0 FPS")
    local RAMFrame,      RAMLabel      = CreateStat("database", "0MB")

    -- / App Logo (Footer) /
    local BrandLabel = New("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.new(0, 16, 0, 16),
        LayoutOrder = 1,
    })
    
    if Window.Icon then
        local logo = Creator.Image(
            Window.Icon,
            Window.Title,
            Window.IconRadius or 0,
            Window.Folder,
            "FooterIcon",
            true,
            Window.IconThemed,
            "WindowTopbarIcon" -- use topbar icon theme color mapping
        )
        logo.Size = UDim2.new(1,0,1,0)
        logo.Parent = BrandLabel
    end

    -- / Montar todo en el Footer en orden /
    BrandLabel.Parent     = FooterFrame
    MakeSeparator().Parent = FooterFrame
    AvatarImage.Parent    = FooterFrame
    UserName.Parent       = FooterFrame
    MakeSeparator().Parent = FooterFrame
    ExecutorFrame.Parent  = FooterFrame
    PingFrame.Parent      = FooterFrame
    FPSFrame.Parent       = FooterFrame
    RAMFrame.Parent       = FooterFrame
    MakeSeparator().Parent = FooterFrame  -- separador antes del reloj
    ClockFrame.Parent     = FooterFrame

    -- / Loop de actualización /
    local lastUpdate   = 0
    local fpsCount     = 0
    local fpsStartTime = tick()

    RunService.RenderStepped:Connect(function()
        fpsCount = fpsCount + 1
        local currentTime = tick()

        -- FPS (actualiza cada segundo)
        if currentTime - fpsStartTime >= 1 then
            FPSLabel.Text  = tostring(fpsCount) .. " FPS"
            fpsCount       = 0
            fpsStartTime   = currentTime
        end

        -- Ping, RAM y Reloj (cada segundo)
        if currentTime - lastUpdate >= 1 then
            lastUpdate = currentTime

            -- Ping
            local ok, ping = pcall(function()
                return math.round(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
            end)
            PingLabel.Text = (ok and tostring(ping) .. "ms") or "?ms"

            -- RAM
            RAMLabel.Text = tostring(math.round(Stats:GetTotalMemoryUsageMb())) .. "MB"

            -- ✅ Reloj — se actualiza cada segundo
            ClockLabel.Text = GetLocalTime()
        end
    end)
    -- Dragging
    Creator.Drag(FooterFrame)

    -- / Show/Hide with window /
    Window._FooterCloseCallback = function()
        -- FooterFrame.Visible = false
    end
    Window._FooterOpenCallback = function()
        -- FooterFrame.Visible = true
    end

    -- Cleanup
    Window._FooterDestroyCallback = function()
        FooterFrame:Destroy()
    end

    return FooterFrame
end

return Footer