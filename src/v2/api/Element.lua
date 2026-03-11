--[[
    HyperUI v2 - Element API
]]

local ElementAPI = {}
ElementAPI.__index = ElementAPI

function ElementAPI.new(id, store)
    return setmetatable({
        Id = id,
        Store = store,
    }, ElementAPI)
end

function ElementAPI:SetTitle(title)
    self.Store:Dispatch({
        type = "UPDATE_ELEMENT",
        id = self.Id,
        props = { text = title }
    })
end

function ElementAPI:SetValue(value)
    self.Store:Dispatch({
        type = "UPDATE_ELEMENT",
        id = self.Id,
        props = { value = value }
    })
end

function ElementAPI:SetVisible(visible)
    self.Store:Dispatch({
        type = "UPDATE_ELEMENT",
        id = self.Id,
        props = { visible = visible }
    })
end

return ElementAPI
