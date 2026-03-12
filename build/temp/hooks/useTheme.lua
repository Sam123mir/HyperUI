




local a = require(script.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.theme.tokens)

local function useTheme(c)
    
    local d, e = a.useState(c:GetState())
    
    a.useEffect(function()
        local f = c:OnUpdate(function(f)
            e(f)
        end)
        return f
    end, {c})
    
    local f = d.theme or "Default"
    return b:Get(f)
end

return useTheme
