--[[
    HyperUI v2 - Tab API
]]

local SectionAPI = require(script.Parent.Section)
local TabAPI = {}
TabAPI.__index = TabAPI

function TabAPI.new(id, windowId, store)
    return setmetatable({
        Id = id,
        WindowId = windowId,
        Store = store,
    }, TabAPI)
end

function TabAPI:CreateSection(config)
    local sectionId = game:GetService("HttpService"):GenerateGUID(false)
    
    self.Store:Dispatch({
        type = "ADD_SECTION",
        tabId = self.Id,
        section = {
            id = sectionId,
            title = config.Title or "New Section",
        }
    })
    
    return SectionAPI.new(sectionId, self.Id, self.WindowId, self.Store)
end

return TabAPI
