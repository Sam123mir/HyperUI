




local a = {}

function a.createNode(b, c, d, e)
    return {
        id = b,
        type = c,
        props = d or {},
        children = {},
        parentId = e,
        visible = true,
    }
end


function a.reconcile(b, c)
    
    
end

return a
