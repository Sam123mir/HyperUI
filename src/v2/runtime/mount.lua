--[[
    HyperUI v2 - Mounting & Protection System
    Handles ScreenGui creation, protection, and React root initialization.
]]

local Mount = {}
Mount.__index = Mount

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
    Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
    LocalPlayer = Players.LocalPlayer
end

function Mount.new(store)
    local self = setmetatable({
        Store = store,
        Container = nil,
    }, Mount)
    
    self:CreateContainer()
    return self
end

function Mount:CreateContainer()
    -- Protection Hierarchy
    -- 1. gethui()
    -- 2. protect_gui()
    -- 3. CoreGui
    -- 4. PlayerGui (Fallback)
    
    local guiParent
    local gethui = getgenv and getgenv().gethui
    local protect_gui = getgenv and (getgenv().protect_gui or (getgenv().syn and getgenv().syn.protect_gui))
    
    if gethui then
        guiParent = gethui()
    elseif CoreGui then
        -- Attempt to use CoreGui if possible (usually works in executors)
        local success = pcall(function()
            local test = Instance.new("Frame")
            test.Parent = CoreGui
            test:Destroy()
        end)
        if success then
            guiParent = CoreGui
        end
    end
    
    if not guiParent then
        guiParent = LocalPlayer:WaitForChild("PlayerGui")
    end
    
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "HyperUI_" .. game:GetService("HttpService"):GenerateGUID(false):sub(1, 8)
    screenGui.ResetOnSpawn = false
    screenGui.IgnoreGuiInset = true
    screenGui.DisplayOrder = 100
    
    if protect_gui then
        pcall(protect_gui, screenGui)
    end
    
    screenGui.Parent = guiParent
    self.Container = screenGui
    
    -- Initialize React Root (Conceptual - placeholder for actual React call)
    -- This will be linked to components/Root.lua in the final bundle
    -- local root = ReactRoblox.createRoot(screenGui)
    -- root:render(React.createElement(App, { store = self.Store }))
    -- self.Root = root
end

function Mount:Unmount()
    if self.Root then
        -- pcall(function() self.Root:unmount() end)
    end
    if self.Container then
        self.Container:Destroy()
    end
end

return Mount
