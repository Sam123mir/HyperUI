--[[
    HyperUI v2 - useTheme Hook
    Provides reactive access to the current theme tokens.
]]

local React = require(script.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.theme.tokens)

local function useTheme(store)
    -- We subscribe to the store's "theme" state
    local state, setState = React.useState(store:GetState())
    
    React.useEffect(function()
        local unsubscribe = store:OnUpdate(function(newState)
            setState(newState)
        end)
        return unsubscribe
    end, {store})
    
    local themeName = state.theme or "Default"
    return Tokens:Get(themeName)
end

return useTheme
