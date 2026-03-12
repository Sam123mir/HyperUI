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
    local valueRef = React.useRef(targetValue)
    local velocityRef = React.useRef(0)
    
    React.useEffect(function()
        local connection
        
        connection = RunService.RenderStepped:Connect(function(dt)
            local displacement = valueRef.current - targetValue
            local force = -springConfig.stiffness * displacement
            local dampingForce = -springConfig.damping * velocityRef.current
            local acceleration = force + dampingForce
            
            velocityRef.current = velocityRef.current + acceleration * dt
            valueRef.current = valueRef.current + velocityRef.current * dt
            
            setCurrentValue(valueRef.current)
            
            -- Sleep check
            if math.abs(velocityRef.current) < 0.001 and math.abs(valueRef.current - targetValue) < 0.001 then
                valueRef.current = targetValue
                velocityRef.current = 0
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
