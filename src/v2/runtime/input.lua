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
    
    -- Iterate windows in Z-order (top to bottom) to find which one we're clicking
    local windowIds = {} 
    for id, element in pairs(state.registry or {}) do
        if element.type == "Window" then
            table.insert(windowIds, id)
        end
    end
    
    -- For now, just check all windows. 
    for _, id in ipairs(windowIds) do
        local window = state.registry[id]
        -- Logic for checking absolute position and setting DraggingInstance
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
