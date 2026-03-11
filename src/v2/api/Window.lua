--[[
    HyperUI v2 - Window API
]]

local TabAPI = require(script.Parent.Tab)
local WindowAPI = {}
WindowAPI.__index = WindowAPI

function WindowAPI.new(id, store)
    return setmetatable({
        Id = id,
        Store = store,
    }, WindowAPI)
end

function WindowAPI:CreateTab(config)
    local tabId = game:GetService("HttpService"):GenerateGUID(false)
    
    self.Store:Dispatch({
        type = "ADD_TAB",
        windowId = self.Id,
        tab = {
            id = tabId,
            title = config.Title or "New Tab",
            icon = config.Icon,
        }
    })
    
    return TabAPI.new(tabId, self.Id, self.Store)
end

function WindowAPI:SetTitle(title)
    self.Store:Dispatch({
        type = "UPDATE_ELEMENT",
        id = self.Id,
        props = { title = title }
    })
end

function WindowAPI:Close()
    self.Store:Dispatch({
        type = "UPDATE_ELEMENT",
        id = self.Id,
        props = { visible = false }
    })
end

return WindowAPI
