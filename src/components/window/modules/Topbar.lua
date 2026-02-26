local Creator = require("../../../modules/Creator")
local New = Creator.New
local Tween = Creator.Tween

local Topbar = {}

function Topbar.Init(Window, Config)
    local HyperUI = Config.HyperUI

    Creator.AddSignal(Window.UIElements.Main.Main.Topbar.Left:GetPropertyChangedSignal("AbsoluteSize"), function()
        local RightWidth = Window.UIElements.Main.Main.Topbar.Right.UIListLayout.AbsoluteContentSize.X / HyperUI.UIScale
        local LeftWidth = Window.UIElements.Main.Main.Topbar.Left.AbsoluteSize.X / HyperUI.UIScale
        
        if Window.Topbar.ButtonsType ~= "Default" then
            LeftWidth = LeftWidth + RightWidth + Window.UIPadding - 4
        end

        Window.UIElements.Main.Main.Topbar.Center.Position = UDim2.new(
            0,
            LeftWidth + (Window.UIPadding / HyperUI.UIScale),
            0.5,
            0
        )
        Window.UIElements.Main.Main.Topbar.Center.Size = UDim2.new(
            1,
            - LeftWidth - RightWidth - ((Window.UIPadding * 2) / HyperUI.UIScale),
            1,
            0
        )
    end)
    
    if Window.Topbar.ButtonsType ~= "Default" then
        Creator.AddSignal(Window.UIElements.Main.Main.Topbar.Right:GetPropertyChangedSignal("AbsoluteSize"), function()
            Window.UIElements.Main.Main.Topbar.Left.Position = UDim2.new(0,(Window.UIElements.Main.Main.Topbar.Right.AbsoluteSize.X/HyperUI.UIScale) + Window.UIPadding - 4,0,0)
        end)
    end

    function Window:CreateTopbarButton(Name, Icon, Callback, LayoutOrder, IconThemed, Color, IconSize)
        local IconFrame = Creator.Image(
            Icon,
            Icon,
            0,
            Window.Folder,
            "WindowTopbarIcon",
            Window.Topbar.ButtonsType == "Default" and true or false,
            IconThemed,
            "WindowTopbarButtonIcon"
        )
        IconFrame.Size = Window.Topbar.ButtonsType == "Default" and UDim2.new(0,IconSize or Window.TopBarButtonIconSize,0,IconSize or Window.TopBarButtonIconSize) or UDim2.new(0,0,0,0)
        IconFrame.AnchorPoint = Vector2.new(0.5,0.5)
        IconFrame.Position = UDim2.new(0.5,0,0.5,0)
        IconFrame.ImageLabel.ImageTransparency = Window.Topbar.ButtonsType == "Default" and 0 or 1
        if Window.Topbar.ButtonsType ~= "Default" then
            IconFrame.ImageLabel.ImageColor3 = Creator.GetTextColorForHSB(Color)
        end
        
        local Button = Creator.NewRoundFrame(Window.Topbar.ButtonsType == "Default" and Window.UICorner-(Window.UIPadding/2) or 999, "Squircle", {
            Size = Window.Topbar.ButtonsType == "Default" and UDim2.new(0,Window.Topbar.Height-16,0,Window.Topbar.Height-16) or UDim2.new(0,14,0,14),
            LayoutOrder = LayoutOrder or 999,
            Parent = Window.Topbar.ButtonsType == "Default" and Window.UIElements.Main.Main.Topbar.Right or nil,
            ZIndex = Creator.ZIndex.Topbar,
            AnchorPoint = Vector2.new(0.5,0.5),
            Position = UDim2.new(0.5,0,0.5,0),
            ImageColor3 = Window.Topbar.ButtonsType ~= "Default" and (Color or Color3.fromHex("#ff3030")) or nil,
            ThemeTag = Window.Topbar.ButtonsType == "Default" and {
                ImageColor3 = "Text"
            } or nil,
            ImageTransparency = Window.Topbar.ButtonsType == "Default" and 1 or 0
        }, {
            Creator.NewRoundFrame(Window.Topbar.ButtonsType == "Default" and Window.UICorner-(Window.UIPadding/2) or 999, "SquircleOutline", {
                Size = UDim2.new(1,0,1,0),
                ThemeTag = {
                    ImageColor3 = "Black",
                },
                ImageTransparency = Window.Topbar.ButtonsType == "Default" and 1 or .8,
                Name = "Outline"
            }, {
                Window.Topbar.ButtonsType == "Default" and New("UIGradient", {
                    Rotation = 45,
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 255, 255)),
                        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
                        ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255)),
                    }),
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0.0, 0.1),
                        NumberSequenceKeypoint.new(0.5, 1),
                        NumberSequenceKeypoint.new(1.0, 0.1),
                    })
                }) or nil,
            }),
            IconFrame
        }, true)
        
        local ButtonContainer = New("Frame", {
            Size = UDim2.new(0,28,0,28),
            BackgroundTransparency = 1,
            Parent = Window.Topbar.ButtonsType ~= "Default" and Window.UIElements.Main.Main.Topbar.Right or nil,
            LayoutOrder = LayoutOrder or 999
        }, {
            Window.Topbar.ButtonsType ~= "Default" and Button or nil,
        })
        
        Window.TopBarButtons[100-LayoutOrder] = {
            Name = Name,
            Object = Button
        }
        
        Creator.AddSignal(Button.MouseButton1Click, function()
            Callback()
        end)
        Creator.AddSignal(Button.MouseEnter, function()
            if Window.Topbar.ButtonsType == "Default" then
                Creator.Tween(Button, .15, {ImageTransparency = .93}):Play()
                Creator.Tween(Button.Outline, .15, {ImageTransparency = .75}):Play()
            else
                Creator.Tween(IconFrame.ImageLabel, .1, {ImageTransparency = 0}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
                Creator.Tween(IconFrame, .1, {Size = UDim2.new(0,IconSize or Window.TopBarButtonIconSize,0,IconSize or Window.TopBarButtonIconSize)}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
            end
        end)
        Creator.AddSignal(Button.InputEnded, function()
            if Window.Topbar.ButtonsType == "Default" then
                Creator.Tween(Button, .1, {ImageTransparency = 1}):Play()
                Creator.Tween(Button.Outline, .1, {ImageTransparency = 1}):Play()
            else
                Creator.Tween(IconFrame.ImageLabel, .1, {ImageTransparency = 1}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
                Creator.Tween(IconFrame, .1, {Size = UDim2.new(0,0,0,0)}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
            end
        end)
        
        return Button
    end
end

return Topbar
