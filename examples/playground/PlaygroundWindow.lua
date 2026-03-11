--[[
    HyperUI v2 - Playground Window
    The main layout for the visual testing environment.
]]

local React = require(script.Parent.Parent.Parent.src.v2.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.src.v2.theme.tokens)
local Registry = require(script.Parent.ComponentRegistry)

local Explorer = require(script.Parent.ComponentExplorer)
local StatePanel = require(script.Parent.StatePanel)
local PerformancePanel = require(script.Parent.PerformancePanel)

local function PlaygroundWindow(props)
    local selectedCategory, setSelectedCategory = React.useState("Controls")
    local selectedName, setSelectedName = React.useState("Button")
    
    -- Current component data
    local elementData = Registry:GetElement(selectedCategory, selectedName)
    local [componentProps, setComponentProps] = React.useState(elementData and elementData.props or {})
    
    -- Stress test state
    local [stressCount, setStressCount] = React.useState(0)
    
    -- Update props when selection changes
    React.useEffect(function()
        local data = Registry:GetElement(selectedCategory, selectedName)
        if data then
            setComponentProps(data.props)
            setStressCount(0)
        end
    end, {selectedCategory, selectedName})
    
    local function onSelect(cat, name)
        setSelectedCategory(cat)
        setSelectedName(name)
    end
    
    local function onPropChange(key, value)
        local newProps = {}
        for k, v in pairs(componentProps) do newProps[k] = v end
        newProps[key] = value
        setComponentProps(newProps)
    end
    
    return React.createElement("Frame", {
        Size = UDim2.fromOffset(1000, 600),
        Position = UDim2.new(0.5, -500, 0.5, -300),
        BackgroundColor3 = Tokens.Color.Background,
        BorderSizePixel = 0,
    }, {
        UICorner = React.createElement("UICorner", {
            CornerRadius = UDim.new(0, Tokens.Radius.Large)
        }),
        UIStroke = React.createElement("UIStroke", {
            Color = Tokens.Color.Border,
            Thickness = 1,
        }),
        
        -- Left Sidebar: Explorer
        Sidebar = React.createElement(Explorer, {
            SelectedCategory = selectedCategory,
            SelectedName = selectedName,
            OnSelect = onSelect
        }),
        
        -- Header (Stress Controls)
        Header = React.createElement("Frame", {
            Size = UDim2.new(1, -500, 0, 40),
            Position = UDim2.fromOffset(200, 0),
            BackgroundColor3 = Tokens.Color.Surface,
            BackgroundTransparency = 0.5,
        }, {
            Layout = React.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Padding = UDim.new(0, 12),
            }),
            Padding = React.createElement("UIPadding", { PaddingLeft = UDim.new(0, 16) }),
            Title = React.createElement("TextLabel", {
                Size = UDim2.fromOffset(200, 40),
                BackgroundTransparency = 1,
                Text = selectedName:upper(),
                TextColor3 = Tokens.Color.Text,
                Font = Tokens.Font.Bold,
                TextSize = Tokens.FontSize.Medium,
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
            Stress100 = React.createElement("TextButton", {
                Size = UDim2.fromOffset(100, 24),
                Text = "Stress 100",
                BackgroundColor3 = Tokens.Color.Surface,
                [React.Event.Activated] = function() setStressCount(100) end
            }, { UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }) }),
            Stress300 = React.createElement("TextButton", {
                Size = UDim2.fromOffset(100, 24),
                Text = "Stress 300",
                BackgroundColor3 = Tokens.Color.Surface,
                [React.Event.Activated] = function() setStressCount(300) end
            }, { UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }) }),
            Reset = React.createElement("TextButton", {
                Size = UDim2.fromOffset(60, 24),
                Text = "Reset",
                BackgroundColor3 = Tokens.Color.Error,
                [React.Event.Activated] = function() setStressCount(0) end
            }, { UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }) }),
        }),
        
        -- Center: Preview Area
        Preview = React.createElement("Frame", {
            Size = UDim2.new(1, -500, 1, -40),
            Position = UDim2.fromOffset(200, 40),
            BackgroundTransparency = 1,
        }, {
            Padding = React.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 40),
                PaddingBottom = UDim.new(0, 40),
                PaddingLeft = UDim.new(0, 40),
                PaddingRight = UDim.new(0, 40),
            }),
            -- Dynamic Render
            Instance = (not stressCount or stressCount == 0) and elementData and elementData.render(componentProps),
            
            -- Stress Test Render
            StressList = (stressCount and stressCount > 0) and React.createElement("ScrollingFrame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
                CanvasSize = UDim2.new(0, 0, 0, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
            }, {
                Layout = React.createElement("UIListLayout", { Padding = UDim.new(0, 8) }),
                Items = React.createElement(React.Fragment, {}, (function()
                    local t = {}
                    for i = 1, stressCount do
                        t[i] = elementData.render({ Text = selectedName .. " " .. i })
                    end
                    return t
                end)())
            })
        }),
        
        -- Right Panel: State & Performance
        RightPanel = React.createElement("Frame", {
            Size = UDim2.new(0, 300, 1, 0),
            Position = UDim2.new(1, -300, 0, 0),
            BackgroundColor3 = Tokens.Color.Surface,
            BackgroundTransparency = 0.5,
            BorderSizePixel = 0,
        }, {
            Layout = React.createElement("UIListLayout", {
                Padding = UDim.new(0, 0),
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
            State = React.createElement(StatePanel, {
                Category = selectedCategory,
                Name = selectedName,
                Props = componentProps,
                OnPropChange = onPropChange
            }),
            Performance = React.createElement(PerformancePanel)
        })
    })
end

return PlaygroundWindow
