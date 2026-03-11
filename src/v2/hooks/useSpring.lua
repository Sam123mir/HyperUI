--[[
    HyperUI v2 - useSpring Hook
    Lightweight spring animation engine.
]]

local React = require(script.Parent.Parent.dependencies.React)
local RunService = game:GetService("RunService")

local function lerp(a, b, t)
    return a + (b - a) * t
end

local function useSpring(targetValue, springConfig)
    local springConfig = springConfig or { stiffness = 170, damping = 26 }
    local currentValue, setCurrentValue = React.useState(targetValue)
    local velocity = React.useRef(0)
    
    React.useEffect(function()
        local connection
        local current = currentValue
        local vel = velocity.current
        
        connection = RunService.RenderStepped:Connect(function(dt)
            local displacement = current - targetValue
            local force = -springConfig.stiffness * displacement
            local dampingForce = -springConfig.damping * vel
            local acceleration = force + dampingForce
            
            vel = vel + acceleration * dt
            current = current + vel * dt
            
            setCurrentValue(current)
            velocity.current = vel
            
            -- Sleep check
            if math.abs(vel) < 0.001 and math.abs(current - targetValue) < 0.001 then
                setCurrentValue(targetValue)
                connection:Disconnect()
            end
        end)
        
        return function()
            if connection then connection:Disconnect() end
        end
    end, {targetValue})
    
    return currentValue
end

return useSpring
