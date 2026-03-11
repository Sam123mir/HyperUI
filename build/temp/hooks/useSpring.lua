




local a = require(script.Parent.Parent.dependencies.React)
local b = game:GetService("RunService")

local function lerp(c, d, e)
    return c + (d - c) * e
end

local function useSpring(c, d)
    local e = d or { stiffness = 170, damping = 26 }
    local f, g = a.useState(c)
    local h = a.useRef(0)
    
    a.useEffect(function()
        local i
        local j = f
        local k = h.current
        
        i = b.RenderStepped:Connect(function(l)
            local m = j - c
            local n = -e.stiffness * m
            local o = -e.damping * k
            local p = n + o
            
            k = k + p * l
            j = j + k * l
            
            g(j)
            h.current = k
            
            
            if math.abs(k) < 0.001 and math.abs(j - c) < 0.001 then
                g(c)
                i:Disconnect()
            end
        end)
        
        return function()
            if i then i:Disconnect() end
        end
    end, {c})
    
    return f
end

return useSpring
