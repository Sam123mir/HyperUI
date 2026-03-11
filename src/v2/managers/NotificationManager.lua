--[[
    HyperUI v2 - Notification Manager
    Handles toast stacking and dismissal.
]]

local NotificationManager = {}
NotificationManager.__index = NotificationManager

function NotificationManager.new(store)
    local self = setmetatable({
        Store = store,
        Queue = {},
    }, NotificationManager)
    
    return self
end

function NotificationManager:Notify(config)
    local id = game:GetService("HttpService"):GenerateGUID(false)
    local notification = {
        id = id,
        title = config.Title or "Notification",
        content = config.Content or "",
        icon = config.Icon,
        duration = config.Duration or 5,
        priority = config.Priority or "Info", -- Info, Success, Warning, Error
        createdAt = os.clock(),
    }
    
    table.insert(self.Queue, notification)
    
    self.Store:Dispatch({
        type = "ADD_NOTIFICATION",
        notification = notification
    })
    
    -- Auto-dismiss timer
    task.delay(notification.duration, function()
        self:Dismiss(id)
    end)
    
    return id
end

function NotificationManager:Dismiss(id)
    local index = -1
    for i, notif in ipairs(self.Queue) do
        if notif.id == id then
            index = i
            break
        end
    end
    
    if index ~= -1 then
        table.remove(self.Queue, index)
        self.Store:Dispatch({
            type = "REMOVE_NOTIFICATION",
            id = id
        })
    end
end

return NotificationManager
