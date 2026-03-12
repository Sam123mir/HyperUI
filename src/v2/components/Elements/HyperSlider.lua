--[[
    HyperUI v2 - HyperSlider Element
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local BaseElement = require(script.Parent.BaseElement)
local useSpring = require(script.Parent.Parent.Parent.hooks.useSpring)
local useTheme = require(script.Parent.Parent.Parent.hooks.useTheme)

local function HyperSlider(props)
    local theme = useTheme(props.store)
    local min = props.Min or 0
    local max = props.Max or 100
    
    local value, setValue = React.useState(props.Value or min)
    local isDragging = React.useRef(false)
    
    local fillPercent = (value - min) / (max - min)
    local fillScale = useSpring(fillPercent, { stiffness = 300, damping = 30 })
    
    local function updateValue(inputX, trackAbsoluteX, trackAbsoluteSizeX)
        local relativeX = math.clamp((inputX - trackAbsoluteX) / trackAbsoluteSizeX, 0, 1)
        local newValue = min + (relativeX * (max - min))
        
        setValue(newValue) -- Update internal state
        if props.Callback then
            props.Callback(newValue)
        end
    end
    
    -- Update value state when props.Value changes (controlled component behavior)
    React.useEffect(function()
        if props.Value ~= nil and props.Value ~= value then
            setValue(props.Value)
        end
    end, {props.Value})

    return React.createElement(BaseElement, {
        Disabled = props.Disabled,
        LayoutOrder = props.LayoutOrder,
    }, {
        Container = React.createElement("Frame", {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
        }, {
            Padding = React.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, theme.Spacing[3]),
                PaddingRight = UDim.new(0, theme.Spacing[3]),
            }),
            Label = React.createElement("TextLabel", {
                Size = UDim2.new(1, -120, 0.5, 0),
                BackgroundTransparency = 1,
                Text = props.Text or "Slider",
                TextColor3 = theme.Color.Text,
                Font = theme.Font,
                TextSize = theme.FontSize.Medium,
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
            ValueLabel = React.createElement("TextLabel", {
                Size = UDim2.new(0, 50, 0.5, 0),
                Position = UDim2.new(1, -50, 0, 0),
                BackgroundTransparency = 1,
                Text = tostring(math.floor(value)),
                TextColor3 = theme.Color.Accent,
                Font = theme.Font,
                TextSize = theme.FontSize.Medium,
                TextXAlignment = Enum.TextXAlignment.Right,
            }),
            Track = React.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 4),
                Position = UDim2.new(0, 0, 0.8, -2),
                BackgroundColor3 = theme.Color.Surface,
                BorderSizePixel = 0,
            }, {
                UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
                Fill = React.createElement("Frame", {
                    Size = fillScale:map(function(v) return UDim2.fromScale(v, 1) end),
                    BackgroundColor3 = theme.Color.Accent,
                    BorderSizePixel = 0,
                }, {
                    UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
                }),
                -- Input Overlay for dragging
                Trigger = React.createElement("TextButton", {
                    Size = UDim2.new(1, 0, 0, 20),
                    Position = UDim2.fromScale(0, 0.5),
                    AnchorPoint = Vector2.new(0, 0.5),
                    BackgroundTransparency = 1,
                    Text = "",
                    [React.Event.InputBegan] = function(rbx, input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            isDragging.current = true
                            updateValue(input.Position.X, rbx.AbsolutePosition.X, rbx.AbsoluteSize.X)
                        end
                    end,
                    [React.Event.InputEnded] = function(rbx, input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            isDragging.current = false
                        end
                    end,
                    [React.Event.InputChanged] = function(rbx, input)
                        if isDragging.current and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                            updateValue(input.Position.X, rbx.AbsolutePosition.X, rbx.AbsoluteSize.X)
                        end
                    end,
                })
            })
        })
    })
end

return HyperSlider
