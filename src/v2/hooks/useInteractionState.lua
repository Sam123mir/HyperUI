--[[
    HyperUI v2 - useInteractionState Hook
    Centralizes hover, press, and focus logic for all elements.
]]

local React = require(script.Parent.Parent.dependencies.React)

local function useInteractionState(enabled)
    local isHovered, setHovered = React.useState(false)
    local isPressed, setPressed = React.useState(false)
    local isFocused, setFocused = React.useState(false)
    
    local eventBindings = {}
    
    if enabled ~= false then
        eventBindings = {
            [React.Event.MouseEnter] = function() setHovered(true) end,
            [React.Event.MouseLeave] = function() 
                setHovered(false)
                setPressed(false)
            end,
            [React.Event.MouseButton1Down] = function() setPressed(true) end,
            [React.Event.MouseButton1Up] = function() setPressed(false) end,
            [React.Event.Focused] = function() setFocused(true) end,
            [React.Event.FocusLost] = function() setFocused(false) end,
        }
    end
    
    return {
        hovered = isHovered,
        pressed = isPressed,
        focused = isFocused,
        bindings = eventBindings
    }
end

return useInteractionState
