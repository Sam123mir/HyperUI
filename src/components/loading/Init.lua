local Loading = {}

local Creator = require("../../modules/Creator")
local New = Creator.New
local Tween = Creator.Tween

local RunService = game:GetService("RunService")

function Loading.new(Config)
    local LoadingModule = {
        Frame = nil,
        FinishSignal = Instance.new("BindableEvent")
    }

    local WindowSize = Vector2.new(450, 300)
    
    local MainFrame = New("Frame", {
        Name = "LoadingScreen",
        Size = UDim2.fromOffset(WindowSize.X, WindowSize.Y),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(15, 15, 15),
        BackgroundTransparency = 0.1,
        Parent = Config.Parent,
        Active = true,
    }, {
        New("UICorner", {
            CornerRadius = UDim.new(0, 16),
        }),
        New("UIStroke", {
            Thickness = 1,
            Transparency = 0.8,
            Color = Color3.fromRGB(255, 255, 255),
        })
    })

    -- / Mac Dots /
    local DotsFrame = New("Frame", {
        Size = UDim2.new(0, 60, 0, 20),
        Position = UDim2.new(0, 15, 0, 15),
        BackgroundTransparency = 1,
    }, {
        New("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            Padding = UDim.new(0, 6),
        }),
        New("Frame", { Size = UDim2.fromOffset(10, 10), BackgroundColor3 = Color3.fromHex("#FF5F57") }, { New("UICorner", { CornerRadius = UDim.new(1, 0) }) }),
        New("Frame", { Size = UDim2.fromOffset(10, 10), BackgroundColor3 = Color3.fromHex("#FFBD2E") }, { New("UICorner", { CornerRadius = UDim.new(1, 0) }) }),
        New("Frame", { Size = UDim2.fromOffset(10, 10), BackgroundColor3 = Color3.fromHex("#28C840") }, { New("UICorner", { CornerRadius = UDim.new(1, 0) }) }),
    })
    DotsFrame.Parent = MainFrame

    -- / Header /
    local Header = New("TextLabel", {
        Text = "HyperUI Secure Core",
        TextSize = 12,
        FontFace = Font.new(Creator.Font, Enum.FontWeight.Medium),
        TextColor3 = Color3.fromRGB(150, 150, 150),
        BackgroundTransparency = 1,
        Position = UDim2.new(0.5, 0, 0, 20),
        AnchorPoint = Vector2.new(0.5, 0.5),
        AutomaticSize = Enum.AutomaticSize.XY,
        Parent = MainFrame,
    }, {
        New("UIGradient", {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 150, 150)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 150, 150)),
            })
        })
    })

    -- / Center Bolt & Circle /
    local CenterContent = New("Frame", {
        Size = UDim2.fromOffset(120, 120),
        Position = UDim2.new(0.5, 0, 0.45, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        Parent = MainFrame,
    })

    -- Premium improvement: Floating animation for center content
    task.spawn(function()
        local startPos = CenterContent.Position
        while MainFrame.Parent do
            Tween(CenterContent, 1.5, { Position = startPos + UDim2.fromOffset(0, 10) }, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut):Play()
            task.wait(1.5)
            Tween(CenterContent, 1.5, { Position = startPos }, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut):Play()
            task.wait(1.5)
        end
    end)

    local BoltContainer = New("Frame", {
        Size = UDim2.fromOffset(50, 50),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
        Parent = CenterContent,
    }, {
        New("UICorner", { CornerRadius = UDim.new(0, 14) }),
        New("ImageLabel", {
            Size = UDim2.fromOffset(24, 24),
            Position = UDim2.new(0.5, 0, 0.5, 0),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundTransparency = 1,
            Image = Creator.Icon("bolt")[1],
            ImageRectOffset = Creator.Icon("bolt")[2].ImageRectPosition,
            ImageRectSize = Creator.Icon("bolt")[2].ImageRectSize,
            ImageColor3 = Color3.fromHex("#257AF7"),
        })
    })

    -- Circular Progress Simulation (Using multiple frames for the rings)
    local Ring1 = New("Frame", {
        Size = UDim2.fromOffset(80, 80),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        Parent = CenterContent,
    }, {
        New("UIStroke", { Thickness = 1, Transparency = 0.9, Color = Color3.fromRGB(255, 255, 255) }),
        New("UICorner", { CornerRadius = UDim.new(1, 0) }),
    })

    local Ring2 = New("Frame", {
        Size = UDim2.fromOffset(110, 110),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        Parent = CenterContent,
    }, {
        New("UIStroke", { Thickness = 1, Transparency = 0.9, Color = Color3.fromRGB(255, 255, 255) }),
        New("UICorner", { CornerRadius = UDim.new(1, 0) }),
    })

    -- Spinning Progress Circle
    local ProgressCircle = New("ImageLabel", {
        Size = UDim2.fromOffset(95, 95),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        Image = "rbxassetid://132454641619478", -- Circular progress asset
        ImageColor3 = Color3.fromHex("#257AF7"),
        Parent = CenterContent,
    })

    task.spawn(function()
        while MainFrame.Parent do
            Tween(ProgressCircle, 2, { Rotation = ProgressCircle.Rotation + 360 }, Enum.EasingStyle.Linear):Play()
            task.wait(2)
        end
    end)

    -- / Initializing Text /
    local StatusLabel = New("TextLabel", {
        Text = "Initializing Environment",
        TextSize = 20,
        FontFace = Font.new(Creator.Font, Enum.FontWeight.SemiBold),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        Position = UDim2.new(0.5, 0, 0.7, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        AutomaticSize = Enum.AutomaticSize.XY,
        Parent = MainFrame,
    })

    local VersionLabel = New("TextLabel", {
        Text = "Version " .. (Config.Version or "1.0.0") .. "-stable",
        TextSize = 14,
        FontFace = Font.new(Creator.Font, Enum.FontWeight.Medium),
        TextColor3 = Color3.fromRGB(150, 150, 150),
        BackgroundTransparency = 1,
        Position = UDim2.new(0.5, 0, 0.77, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        AutomaticSize = Enum.AutomaticSize.XY,
        Parent = MainFrame,
    })

    -- / Bottom Progress Bar /
    local ProgressBackground = New("Frame", {
        Size = UDim2.new(0.8, 0, 0, 4),
        Position = UDim2.new(0.5, 0, 0.95, 0),
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(40, 40, 40),
        BorderSizePixel = 0,
        Parent = MainFrame,
    }, {
        New("UICorner", { CornerRadius = UDim.new(1, 0) }),
    })

    local ProgressFill = New("Frame", {
        Size = UDim2.new(0, 0, 1, 0),
        BackgroundColor3 = Color3.fromHex("#257AF7"),
        BorderSizePixel = 0,
        Parent = ProgressBackground,
    }, {
        New("UICorner", { CornerRadius = UDim.new(1, 0) }),
        New("UIGradient", {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromHex("#257AF7")),
                ColorSequenceKeypoint.new(0.45, Color3.fromRGB(255, 255, 255)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
                ColorSequenceKeypoint.new(0.55, Color3.fromRGB(255, 255, 255)),
                ColorSequenceKeypoint.new(1, Color3.fromHex("#257AF7")),
            }),
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.4, 0.4),
                NumberSequenceKeypoint.new(0.5, 0),
                NumberSequenceKeypoint.new(0.6, 0.4),
                NumberSequenceKeypoint.new(1, 0),
            }),
            Offset = Vector2.new(-1.5, 0),
        })
    })

    task.spawn(function()
        local gradient = ProgressFill:FindFirstChildWhichIsA("UIGradient")
        while MainFrame.Parent do
            local tween = Tween(gradient, 1.5, { Offset = Vector2.new(1.5, 0) }, Enum.EasingStyle.Linear)
            tween:Play()
            tween.Completed:Wait()
            gradient.Offset = Vector2.new(-1.5, 0)
        end
    end)

    local LoadingText = New("TextLabel", {
        Text = "LOADING ASSETS...",
        TextSize = 12,
        FontFace = Font.new(Creator.Font, Enum.FontWeight.Bold),
        TextColor3 = Color3.fromRGB(100, 100, 100),
        Position = UDim2.new(0.5, 0, 0.88, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        AutomaticSize = Enum.AutomaticSize.XY,
        Parent = MainFrame,
    })

    -- / Logic /
    function LoadingModule:UpdateStatus(text, progress)
        StatusLabel.Text = text
        Tween(ProgressFill, 0.3, { Size = UDim2.new(progress / 100, 0, 1, 0) }):Play()
    end

    function LoadingModule:Finish()
        Tween(MainFrame, 0.5, { BackgroundTransparency = 1, Size = UDim2.fromOffset(WindowSize.X + 40, WindowSize.Y + 40) }):Play()
        local mainStroke = MainFrame:FindFirstChildWhichIsA("UIStroke")
        if mainStroke then 
            Tween(mainStroke, 0.5, { Transparency = 1 }):Play() 
        end
        
        for _, child in next, MainFrame:GetDescendants() do
            if child:IsA("TextLabel") then
                Tween(child, 0.5, { TextTransparency = 1 }):Play()
            elseif child:IsA("ImageLabel") then
                Tween(child, 0.5, { ImageTransparency = 1 }):Play()
            elseif child:IsA("Frame") then
                Tween(child, 0.5, { BackgroundTransparency = 1 }):Play()
                local stroke = child:FindFirstChildWhichIsA("UIStroke")
                if stroke then Tween(stroke, 0.5, { Transparency = 1 }):Play() end
            end
        end

        task.wait(0.6)
        MainFrame:Destroy()
        LoadingModule.FinishSignal:Fire()
    end

    return LoadingModule
end

return Loading
