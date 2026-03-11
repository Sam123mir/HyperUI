




local a = {}
a.__index = a



local function CheckExistingInstance()
    local b = getgenv and getgenv() or _G
    if b.__HyperUI_Instance then
        local c = b.__HyperUI_Instance
        pcall(function()
            c:Destroy()
        end)
        b.__HyperUI_Instance = nil
    end
end

function a.new()
    CheckExistingInstance()
    
    local b = setmetatable({}, a)
    
    
    b.Store = require(script.Parent.core.store).new()
    
    b.WindowManager = require(script.Parent.managers.WindowManager).new(b.Store)
    b.NotificationManager = require(script.Parent.managers.NotificationManager).new(b.Store)
    b.ThemeManager = require(script.Parent.managers.ThemeManager).new(b.Store)
    b.FocusManager = require(script.Parent.managers.FocusManager).new(b.Store)
    b.Config = require(script.Parent.core.config).new(b.Store, {
        FileName = "HyperUI_V2_Config.json",
        AutoSave = true
    })
    
    
    b.Runtime = require(script.Parent.runtime.mount).new(b.Store)
    
    
    local c = getgenv and getgenv() or _G
    c.__HyperUI_Instance = b
    
    return b
end

function a:CreateWindow(b)
    local c = require(script.Parent.api)
    local d = game:GetService("HttpService"):GenerateGUID(false)
    
    self.Store:Dispatch({
        type = "ADD_WINDOW",
        window = {
            id = d,
            title = b.Title or "HyperUI",
            icon = b.Icon,
            active = true,
        }
    })
    
    return c.Window.new(d, self.Store)
end

function a:Notify(b)
    return self.NotificationManager:Notify(b)
end

function a:SetTheme(b)
    return self.ThemeManager:SetTheme(b)
end

function a:Destroy()
    if self.Runtime then
        self.Runtime:Unmount()
    end
    
    local b = getgenv and getgenv() or _G
    if b.__HyperUI_Instance == self then
        b.__HyperUI_Instance = nil
    end
    
    
    self.Store:Destroy()
end

return a
