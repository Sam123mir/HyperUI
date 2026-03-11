




local a = require(script.Parent.Parent.dependencies.React)

local function useInteractionState(b)
    local c, d = a.useState(false)
    local e, f = a.useState(false)
    local g, h = a.useState(false)
    
    local i = {}
    
    if b ~= false then
        i = {
            [a.Event.MouseEnter] = function() d(true) end,
            [a.Event.MouseLeave] = function() 
                d(false)
                f(false)
            end,
            [a.Event.MouseButton1Down] = function() f(true) end,
            [a.Event.MouseButton1Up] = function() f(false) end,
            [a.Event.Focused] = function() h(true) end,
            [a.Event.FocusLost] = function() h(false) end,
        }
    end
    
    return {
        hovered = c,
        pressed = e,
        focused = g,
        bindings = i
    }
end

return useInteractionState
