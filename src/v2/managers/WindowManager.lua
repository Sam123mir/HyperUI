--[[
    HyperUI v2 - Window Manager
    Handles window focus, layering, and dragging.
]]

local WindowManager = {}
WindowManager.__index = WindowManager

function WindowManager.new(store)
    local self = setmetatable({
        Store = store,
        Windows = {}, -- List of windowIds in focus order
    }, WindowManager)
    
    return self
end

function WindowManager:FocusWindow(windowId)
    local index = table.find(self.Windows, windowId)
    if index then
        table.remove(self.Windows, index)
    end
    table.insert(self.Windows, windowId)
    
    -- Update focus state in store for all windows
    for i, id in ipairs(self.Windows) do
        self.Store:Dispatch({
            type = "UPDATE_ELEMENT",
            id = id,
            props = { 
                zIndex = i,
                focused = (id == windowId)
            }
        })
    end
end

function WindowManager:RegisterWindow(windowId)
    table.insert(self.Windows, windowId)
    self:FocusWindow(windowId)
end

function WindowManager:UnregisterWindow(windowId)
    local index = table.find(self.Windows, windowId)
    if index then
        table.remove(self.Windows, index)
    end
end

return WindowManager
