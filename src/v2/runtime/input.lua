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
    -- This logic will coordinate with WindowManager to find the relevant window under cursor
end

function InputManager:HandleDragEnded()
    self.DraggingInstance = nil
    self.DragOffset = nil
end

function InputManager:UpdateDragging()
    if self.DraggingInstance and self.DragOffset then
        local mousePos = UserInputService:GetMouseLocation()
        -- Update position in store or directly (for performance)
    end
end

function InputManager:Destroy()
    for _, conn in ipairs(self.Connections) do
        conn:Disconnect()
    end
    self.Connections = {}
end

return InputManager
