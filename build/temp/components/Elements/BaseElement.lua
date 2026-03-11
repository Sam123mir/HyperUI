




local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.theme.tokens)
local c = require(script.Parent.Parent.Parent.hooks.useInteractionState)

local d = require(script.Parent.Parent.Parent.hooks.useSpring)

local function BaseElement(e)
    local f = c(not e.Disabled)
    
    
    local g = 1
    if not e.Disabled then
        if f.pressed then
            g = 0.95
        elseif f.hovered then
            g = 1.02
        end
    end
    
    local h = d(g, { damping = 0.8, stiffness = 0.2 })
    
    
    local i = e.Size or UDim2.new(1, 0, 0, 32)
    local j = e.BackgroundTransparency or 0
    local k = e.BackgroundColor or b.Color.Surface
    
    return a.createElement("Frame", {
        Size = i,
        BackgroundColor3 = k,
        BackgroundTransparency = j,
        BorderSizePixel = 0,
        LayoutOrder = e.LayoutOrder,
    }, {
        UIScale = a.createElement("UIScale", {
            Scale = h
        }),
        UICorner = a.createElement("UICorner", {
            CornerRadius = UDim.new(0, b.Radius.Small)
        }),
        UIStroke = a.createElement("UIStroke", {
            Color = b.Color.Border,
            Transparency = 0.5,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        }),
        Content = a.createElement("Frame", {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
            ZIndex = 3,
        }, e.children),
        
        
        Trigger = a.createElement("TextButton", {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
            Text = "",
            ZIndex = 10,
            [a.Event.Activated] = function()
                if not e.Disabled and e.OnActivated then
                    e.OnActivated()
                end
            end,
        }, f.bindings)
    })
end

return BaseElement
