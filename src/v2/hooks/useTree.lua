--[[
    HyperUI v2 - useTree Hook
    Selector-based hook for selective node subscriptions.
]]

local React = require(script.Parent.Parent.dependencies.React)

local function useTree(store, nodeId)
    local node, setNode = React.useState(function()
        return store:GetState().registry[nodeId]
    end)
    
    React.useEffect(function()
        local unsubscribe = store:Subscribe(nodeId, function(newNode)
            setNode(newNode)
        end)
        
        return function()
            unsubscribe()
        end
    end, {store, nodeId})
    
    return node
end

return useTree
