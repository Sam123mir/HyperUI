local Creator = require("../../../modules/Creator")
local Tween = Creator.New -- wait, no it's Creator.Tween
local Tween = Creator.Tween
local UserInputService = game:GetService("UserInputService")

local Resize = {}

function Resize.Init(Window, ResizeHandle, FullScreenIcon)
    local isResizing = false
    local initialSize = nil
    local initialInputPosition = nil

    local function startResizing(input)
        if Window.CanResize then
            isResizing = true
            FullScreenIcon.Active = true
            initialSize = Window.UIElements.Main.Size
            initialInputPosition = input.Position
            Tween(ResizeHandle.ImageLabel, 0.1, {ImageTransparency = .35}):Play()
        
            Creator.AddSignal(input.Changed, function()
                if input.UserInputState == Enum.UserInputState.End then
                    isResizing = false
                    FullScreenIcon.Active = false
                    Tween(ResizeHandle.ImageLabel, 0.17, {ImageTransparency = .8}):Play()
                end
            end)
        end
    end
    
    Creator.AddSignal(ResizeHandle.InputBegan, function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            if Window.CanResize then
                startResizing(input)
            end
        end
    end)
    
    Creator.AddSignal(UserInputService.InputChanged, function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            if isResizing and Window.CanResize then
                local delta = input.Position - initialInputPosition
                local newSize = UDim2.new(0, initialSize.X.Offset + delta.X*2, 0, initialSize.Y.Offset + delta.Y*2)
                
                newSize = UDim2.new(
                    newSize.X.Scale,
                    math.clamp(newSize.X.Offset, Window.MinSize.X, Window.MaxSize.X),
                    newSize.Y.Scale,
                    math.clamp(newSize.Y.Offset, Window.MinSize.Y, Window.MaxSize.Y)
                )
                    
                Tween(Window.UIElements.Main, 0, {
                    Size = newSize
                }):Play()
                
                Window.Size = newSize
            end
        end
    end)
end

return Resize
