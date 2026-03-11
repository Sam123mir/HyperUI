




local a = {}
a.__index = a

local b = game:GetService("Players")
local c = game:GetService("CoreGui")

local d = b.LocalPlayer
while not d do
    b:GetPropertyChangedSignal("LocalPlayer"):Wait()
    d = b.LocalPlayer
end

function a.new(e)
    local f = setmetatable({
        Store = e,
        Container = nil,
    }, a)
    
    f:CreateContainer()
    return f
end

function a:CreateContainer()
    
    
    
    
    
    
    local e
    local f = getgenv and getgenv().gethui
    local g = getgenv and (getgenv().protect_gui or (getgenv().syn and getgenv().syn.protect_gui))
    
    if f then
        e = f()
    elseif c then
        
        local h = pcall(function()
            local h = Instance.new("Frame")
            h.Parent = c
            h:Destroy()
        end)
        if h then
            e = c
        end
    end
    
    if not e then
        e = d:WaitForChild("PlayerGui")
    end
    
    local h = Instance.new("ScreenGui")
    h.Name = "HyperUI_" .. game:GetService("HttpService"):GenerateGUID(false):sub(1, 8)
    h.ResetOnSpawn = false
    h.IgnoreGuiInset = true
    h.DisplayOrder = 100
    
    if g then
        pcall(g, h)
    end
    
    h.Parent = e
    self.Container = h
    
    
    
    
    
    
end

function a:Unmount()
    if self.Root then
        
    end
    if self.Container then
        self.Container:Destroy()
    end
end

return a
