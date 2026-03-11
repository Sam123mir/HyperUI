




local a = require(script.Parent.Parent.dependencies.React)

local function useTree(b, c)
    local d, e = a.useState(function()
        return b:GetState().registry[c]
    end)
    
    a.useEffect(function()
        local f = b:Subscribe(c, function(f)
            e(f)
        end)
        
        return function()
            f()
        end
    end, {b, c})
    
    return d
end

return useTree
