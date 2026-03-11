--[[
    HyperUI v2 - Root Component
    The top-level React component for the entire framework.
]]

local React = require(script.Parent.Parent.dependencies.React)
local Window = require(script.Parent.Window)

local function Root(props)
    local state, setState = React.useState(props.store:GetState())
    
    React.useEffect(function()
        local unsubscribe = props.store:OnUpdate(function(newState)
            setState(newState)
        end)
        return unsubscribe
    end, {props.store})
    
    local windows = {}
    for id, config in pairs(state.windows) do
        windows[id] = React.createElement(Window, {
            id = id,
            store = props.store,
            config = config,
        })
    end
    
    -- Notification stack will be rendered here as well
    
    return React.createElement("Frame", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
    }, windows)
end

return Root
