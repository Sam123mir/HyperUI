




local a = game:GetService("UserInputService")
local b = game:GetService("RunService")

local c = {}
c.__index = c

function c.new(d)
    local e = setmetatable({
        Store = d,
        DraggingInstance = nil,
        DragOffset = nil,
        Connections = {},
    }, c)
    
    e:Initialize()
    return e
end

function c:Initialize()
    table.insert(self.Connections, a.InputBegan:Connect(function(d, e)
        if d.UserInputType == Enum.UserInputType.MouseButton1 or d.UserInputType == Enum.UserInputType.Touch then
            self:HandleDragBegan(d)
        end
    end))
    
    table.insert(self.Connections, a.InputEnded:Connect(function(d)
        if d.UserInputType == Enum.UserInputType.MouseButton1 or d.UserInputType == Enum.UserInputType.Touch then
            self:HandleDragEnded()
        end
    end))
    
    table.insert(self.Connections, b.RenderStepped:Connect(function()
        self:UpdateDragging()
    end))
end

function c:HandleDragBegan(d)
    local e = self.Store:GetState()
    local f = a:GetMouseLocation()
    
    
    local g = {} 
    for h, i in pairs(e.registry or {}) do
        if i.type == "Window" then
            table.insert(g, h)
        end
    end
    
    
    for h, i in ipairs(g) do
        local j = e.registry[i]
        
    end
end

function c:HandleDragEnded()
    self.DraggingInstance = nil
    self.DragOffset = nil
end

function c:UpdateDragging()
    if self.DraggingInstance and self.DragOffset then
        local d = a:GetMouseLocation()
        local e = UDim2.fromOffset(d.X - self.DragOffset.X, d.Y - self.DragOffset.Y)
        
        self.Store:Dispatch({
            type = "UPDATE_ELEMENT",
            id = self.DraggingInstance,
            props = { Position = e }
        })
    end
end

function c:Destroy()
    for d, e in ipairs(self.Connections) do
        e:Disconnect()
    end
    self.Connections = {}
end

return c
