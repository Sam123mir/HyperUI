--[[
    HyperUI v2 - Mounting & Protection System
    Handles ScreenGui creation, protection, and React root initialization.
]]

local Mount = {}
Mount.__index = Mount

local React = require(script.Parent.Parent.dependencies.React)
local ReactRoblox = require(script.Parent.Parent.dependencies.ReactRoblox)
local Root = require(script.Parent.Parent.components.Root)

function Mount.new(store)
    local self = setmetatable({
        Store = store,
        Container = nil,
        Root = nil,
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
        local success, err = pcall(function()
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
    if not screenGui then return end
    
    screenGui.Name = "HyperUI_" .. game:GetService("HttpService"):GenerateGUID(false):sub(1, 8)
    screenGui.ResetOnSpawn = false
    screenGui.IgnoreGuiInset = true
    screenGui.DisplayOrder = 100
    
    self.Container = screenGui
    
    -- Initialize React Root
    local root = ReactRoblox.createRoot(screenGui)
    root:render(React.createElement(Root, { store = self.Store }))
    self.Root = root
end

function Mount:Unmount()
    if self.Root then
        local success, err = pcall(function() 
            self.Root:unmount() 
        end)
        if not success then
            warn("[HyperUI] Unmount error:", err)
        end
    end
    if self.Container then
        self.Container:Destroy()
    end
end

return Mount
