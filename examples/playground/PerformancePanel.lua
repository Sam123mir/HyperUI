--[[
    HyperUI v2 - Playground Performance Panel
    Displays real-time technical metrics.
]]

local React = require(script.Parent.Parent.Parent.src.v2.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.src.v2.theme.tokens)
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")

local function PerformancePanel()
    local metrics, setMetrics = React.useState({
        fps = 60,
        memory = 0,
        instances = 0
    })
    
    React.useEffect(function()
        local lastTime = os.clock()
        local frames = 0
        
        local connection = RunService.Heartbeat:Connect(function()
            frames = frames + 1
            local now = os.clock()
            if now - lastTime >= 1 then
                setMetrics({
                    fps = math.floor(frames / (now - lastTime)),
                    memory = math.floor(Stats:GetTotalMemoryUsageMb()),
                    instances = #game:GetDescendants() -- Appoximate
                })
                frames = 0
                lastTime = now
            end
        end)
        
        return function() connection:Disconnect() end
    end, {})
    
    local function MetricLabel(title, value, color)
        return React.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 24),
            BackgroundTransparency = 1,
        }, {
            Title = React.createElement("TextLabel", {
                Size = UDim2.fromScale(0.5, 1),
                BackgroundTransparency = 1,
                Text = title,
                TextColor3 = Tokens.Color.TextMuted,
                Font = Tokens.Font.Main,
                TextSize = 12,
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
            Value = React.createElement("TextLabel", {
                Size = UDim2.fromScale(0.5, 1),
                Position = UDim2.fromScale(0.5, 0),
                BackgroundTransparency = 1,
                Text = value,
                TextColor3 = color or Tokens.Color.Text,
                Font = Tokens.Font.Mono,
                TextSize = 12,
                TextXAlignment = Enum.TextXAlignment.Right,
            })
        })
    end
    
    return React.createElement("Frame", {
        Size = UDim2.new(1, 0, 0.3, 0),
        BackgroundColor3 = Tokens.Color.Background,
        BackgroundTransparency = 0.2,
        BorderSizePixel = 0,
        LayoutOrder = 2,
    }, {
        Layout = React.createElement("UIListLayout", { Padding = UDim.new(0, 4) }),
        Padding = React.createElement("UIPadding", { 
            PaddingTop = UDim.new(0, 12), 
            PaddingLeft = UDim.new(0, 12), 
            PaddingRight = UDim.new(0, 12) 
        }),
        Title = React.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 24),
            Text = "DASHBOARD",
            TextColor3 = Tokens.Color.TextMuted,
            Font = Tokens.Font.Bold,
            TextSize = 10,
            BackgroundTransparency = 1,
        }),
        FPS = MetricLabel("Frame Rate", metrics.fps .. " FPS", metrics.fps > 55 and Tokens.Color.Success or Tokens.Color.Warning),
        MemoryValue = MetricLabel("Memory", metrics.memory .. " MB", Tokens.Color.Accent),
        InstanceValue = MetricLabel("Instances", tostring(metrics.instances), Tokens.Color.Text)
    })
end

return PerformancePanel
