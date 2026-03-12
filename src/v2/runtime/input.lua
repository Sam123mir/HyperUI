--[[
    HyperUI v2 - Input Manager
    Centralizes global input handling to avoid per-component connections.
]]

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local InputManager = {}
InputManager.__index = InputManager

function InputManager.new(store)
    local self = setmetatable({
        Store = store,
        DraggingInstance = nil,
        DragOffset = nil,
        Connections = {},
    }, InputManager)
    
    self:Initialize()
    return self
end

function InputManager:Initialize()
    table.insert(self.Connections, UserInputService.InputBegan:Connect(function(input, processed)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            self:HandleDragBegan(input)
        end
    end))
    
    table.insert(self.Connections, UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            self:HandleDragEnded()
        end
    end))
    
    table.insert(self.Connections, RunService.RenderStepped:Connect(function()
        self:UpdateDragging()
    end))
end

function InputManager:HandleDragBegan(input)
    local state = self.Store:GetState()
    local mousePos = UserInputService:GetMouseLocation()
    
    -- Iterate windows in Z-order (top to bottom)
    for id, element in pairs(state.registry or {}) do
        if element.type == "Window" and element.props.Visible ~= false then
            local pos = element.props.Position or UDim2.new(0, 0, 0, 0)
            local size = element.props.Size or UDim2.new(0, 400, 0, 300)
            
            -- Approximate AbsolutePosition/Size for simple window dragging
            -- In a real React app, we'd get this from the engine, but here we estimate
            local absX = pos.X.Offset
            local absY = pos.Y.Offset
            local absW = size.X.Offset
            local absH = 30 -- Title bar height
            
            if mousePos.X >= absX and mousePos.X <= absX + absW and
               mousePos.Y >= absY and mousePos.Y <= absY + absH then
                self.DraggingInstance = id
                self.DragOffset = Vector2.new(mousePos.X - absX, mousePos.Y - absY)
                break
            end
        end
    end
end

function InputManager:HandleDragEnded()
    self.DraggingInstance = nil
    self.DragOffset = nil
end

function InputManager:UpdateDragging()
    if self.DraggingInstance and self.DragOffset then
        local mousePos = UserInputService:GetMouseLocation()
        local newPos = UDim2.fromOffset(mousePos.X - self.DragOffset.X, mousePos.Y - self.DragOffset.Y)
        
        self.Store:Dispatch({
            type = "UPDATE_ELEMENT",
            id = self.DraggingInstance,
            props = { Position = newPos }
        })
    end
end

function InputManager:Destroy()
    for _, conn in ipairs(self.Connections) do
        conn:Disconnect()
    end
    self.Connections = {}
end

return InputManager
