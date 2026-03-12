--[[
    HyperUI v2 - Entry Point
    Professional React-based UI Framework for Roblox Scripts
]]

local HyperUI = {}
HyperUI.__index = HyperUI

-- Global Runtime Guard
-- Prevents multiple instances from running simultaneously in exploit environments
local function CheckExistingInstance()
    local registry = getgenv and getgenv() or _G
    if registry.__HyperUI_Instance then
        local oldInstance = registry.__HyperUI_Instance
        pcall(function()
            oldInstance:Destroy()
        end)
        registry.__HyperUI_Instance = nil
    end
end

function HyperUI.new()
    CheckExistingInstance()
    
    local self = setmetatable({}, HyperUI)
    
    -- Initialize Core Systems
    self.Store = require(script.Parent.core.store).new()
    -- Managers
    self.WindowManager = require(script.Parent.managers.WindowManager).new(self.Store)
    self.NotificationManager = require(script.Parent.managers.NotificationManager).new(self.Store)
    self.ThemeManager = require(script.Parent.managers.ThemeManager).new(self.Store)
    self.FocusManager = require(script.Parent.managers.FocusManager).new(self.Store)
    self.Config = require(script.Parent.core.config).new(self.Store, {
        FileName = "HyperUI_V2_Config.json",
        AutoSave = true
    })
    
    -- Mount the Runtime
    self.Runtime = require(script.Parent.runtime.mount).new(self.Store)
    
    -- Register global instance
    local registry = getgenv and getgenv() or _G
    registry.__HyperUI_Instance = self
    
    return self
end

function HyperUI:CreateWindow(config)
    local API = require(script.Parent.api)
    local windowId = game:GetService("HttpService"):GenerateGUID(false)
    
    self.Store:Dispatch({
        type = "ADD_WINDOW",
        window = {
            id = windowId,
            title = config.Title or "HyperUI",
            icon = config.Icon,
            active = true,
        }
    })
    
    self.WindowManager:RegisterWindow(windowId)
    
    return API.Window.new(windowId, self.Store)
end

function HyperUI:Notify(config)
    return self.NotificationManager:Notify(config)
end

function HyperUI:SetTheme(themeName)
    return self.ThemeManager:SetTheme(themeName)
end

function HyperUI:Destroy()
    if self.Runtime then
        self.Runtime:Unmount()
    end
    
    local registry = getgenv and getgenv() or _G
    if registry.__HyperUI_Instance == self then
        registry.__HyperUI_Instance = nil
    end
    
    -- Clear state
    self.Store:Destroy()
end

return HyperUI
