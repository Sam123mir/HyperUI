




local a = require(script.Parent.Parent.dependencies.React)
local b = game:GetService("RunService")

local function lerp(c, d, e)
    return c + (d - c) * e
end

local function useSpring(c, d)
    local e = d or { stiffness = 170, damping = 26 }
    
    
    local f, g = a.useBinding(c)
    
    
    local h = a.useRef(c)
    local i = a.useRef(0)
    
    a.useEffect(function()
        local j
        
        j = b.RenderStepped:Connect(function(k)
            local l = h.current - c
            local m = -e.stiffness * l
            local n = -e.damping * i.current
            local o = m + n
            
            i.current = i.current + o * k
            h.current = h.current + i.current * k
            
            g(h.current)
            
            
            if math.abs(i.current) < 0.001 and math.abs(h.current - c) < 0.001 then
                h.current = c
                i.current = 0
                g(c)
                j:Disconnect()
            end
        end)
        
        return function()
            if j then j:Disconnect() end
        end
    end, {c, e.stiffness, e.damping})
    
    return f
end

return useSpring
