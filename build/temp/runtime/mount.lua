




local a = {}
a.__index = a

local b = require(script.Parent.Parent.dependencies.React)
local c = require(script.Parent.Parent.dependencies.ReactRoblox)
local d = require(script.Parent.Parent.components.Root)

function a.new(e)
    local f = setmetatable({
        Store = e,
        Container = nil,
        Root = nil,
    }, a)
    
    f:CreateContainer()
    return f
end

local function getSafeGui()
    local e = game:GetService("CoreGui")
    local f = getgenv and getgenv().gethui
    local g = getgenv and getgenv().syn
    
    if g and g.protect_gui then
        local h = Instance.new("ScreenGui")
        g.protect_gui(h)
        h.Parent = e
        return h
    elseif f then
        local h = f()
        local i = Instance.new("ScreenGui")
        i.Parent = h
        return i
    else
        local h = Instance.new("ScreenGui")
        
        local i, j = pcall(function()
            h.Parent = e
        end)
        if not i then
            local k = game:GetService("Players").LocalPlayer
            if k then
                local l = k:FindFirstChild("PlayerGui") or k:WaitForChild("PlayerGui", 5)
                if l then
                    h.Parent = l
                end
            end
        end
        return h
    end
end

function a:CreateContainer()
    local e = getSafeGui()
    if not e then return end
    
    e.Name = "HyperUI_" .. game:GetService("HttpService"):GenerateGUID(false):sub(1, 8)
    e.ResetOnSpawn = false
    e.IgnoreGuiInset = true
    e.DisplayOrder = 100
    
    self.Container = e
    
    
    local f = c.createRoot(e)
    f:render(b.createElement(d, { store = self.Store }))
    self.Root = f
end

function a:Unmount()
    if self.Root then
        local e, f = pcall(function() 
            self.Root:unmount() 
        end)
        if not e then
            warn("[HyperUI] Unmount error:", f)
        end
    end
    if self.Container then
        self.Container:Destroy()
    end
end

return a
