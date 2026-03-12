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

local function getSafeGui()
    local CoreGui = game:GetService("CoreGui")
    local gethui = getgenv and getgenv().gethui
    local syn = getgenv and getgenv().syn
    
    if syn and syn.protect_gui then
        local sg = Instance.new("ScreenGui")
        syn.protect_gui(sg)
        sg.Parent = CoreGui
        return sg
    elseif gethui then
        local target = gethui()
        local sg = Instance.new("ScreenGui")
        sg.Parent = target
        return sg
    else
        local sg = Instance.new("ScreenGui")
        -- Fallback to PlayerGui if CoreGui is restricted
        local success = pcall(function()
            sg.Parent = CoreGui
        end)
        if not success then
            local LocalPlayer = game:GetService("Players").LocalPlayer
            if LocalPlayer then
                local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui") or LocalPlayer:WaitForChild("PlayerGui", 5)
                if PlayerGui then
                    sg.Parent = PlayerGui
                end
            end
        end
        return sg
    end
end

function Mount:CreateContainer()
    local screenGui = getSafeGui()
    screenGui.Name = "HyperUI_" .. game:GetService("HttpService"):GenerateGUID(false):sub(1, 8)
    screenGui.ResetOnSpawn = false
    screenGui.IgnoreGuiInset = true
    screenGui.DisplayOrder = 100
    
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
