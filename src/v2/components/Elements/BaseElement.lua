--[[
    HyperUI v2 - BaseElement Component
    The foundational container for all UI elements.
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.theme.tokens)
local useInteractionState = require(script.Parent.Parent.Parent.hooks.useInteractionState)

local useSpring = require(script.Parent.Parent.Parent.hooks.useSpring)

local function BaseElement(props)
    local interaction = useInteractionState(not props.Disabled)
    
    -- Animation state
    local targetScale = 1
    if not props.Disabled then
        if interaction.pressed then
            targetScale = 0.95
        elseif interaction.hovered then
            targetScale = 1.02
        end
    end
    
    local scale = useSpring(targetScale, { damping = 0.8, stiffness = 0.2 })
    
    -- Combined styles
    local size = props.Size or UDim2.new(1, 0, 0, 32)
    local backgroundTransparency = props.BackgroundTransparency or 0
    local backgroundColor = props.BackgroundColor or Tokens.Color.Surface
    
    return React.createElement("Frame", {
        Size = size,
        BackgroundColor3 = backgroundColor,
        BackgroundTransparency = backgroundTransparency,
        BorderSizePixel = 0,
        LayoutOrder = props.LayoutOrder,
    }, {
        UIScale = React.createElement("UIScale", {
            Scale = scale
        }),
        UICorner = React.createElement("UICorner", {
            CornerRadius = UDim.new(0, Tokens.Radius.Small)
        }),
        UIStroke = React.createElement("UIStroke", {
            Color = Tokens.Color.Border,
            Transparency = 0.5,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        }),
        Content = React.createElement("Frame", {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
            ZIndex = 3,
        }, props.children),
        
        -- Event triggers
        Trigger = React.createElement("TextButton", {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
            Text = "",
            ZIndex = 10,
            [React.Event.Activated] = function()
                if not props.Disabled and props.OnActivated then
                    props.OnActivated()
                end
            end,
        }, interaction.bindings)
    })
end

return BaseElement
