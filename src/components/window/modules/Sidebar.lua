local Players = game:GetService("Players")
local Creator = require("../../../modules/Creator")
local New = Creator.New
local Tween = Creator.Tween

local Sidebar = {}

function Sidebar.Init(Window, Config)
    if not Window.User then return end

    local function GetUserThumb()
        local ImageId, _ = Players:GetUserThumbnailAsync(
            Window.User.Anonymous and 1 or Players.LocalPlayer.UserId, 
            Enum.ThumbnailType.HeadShot, 
            Enum.ThumbnailSize.Size420x420
        )
        return ImageId
    end
    
    local UserIcon = New("TextButton", {
        Size = UDim2.new(0,
            (Window.UIElements.SideBarContainer.AbsoluteSize.X)-(Window.UIPadding/2),
            0,
            42+(Window.UIPadding)
        ),
        Position = UDim2.new(0,Window.UIPadding/2,1,-(Window.UIPadding/2)),
        AnchorPoint = Vector2.new(0,1),
        BackgroundTransparency = 1,
        Visible = Window.User.Enabled or false,
    }, {
        Creator.NewRoundFrame(Window.UICorner-(Window.UIPadding/2), "SquircleOutline", {
            Size = UDim2.new(1,0,1,0),
            ThemeTag = {
                ImageColor3 = "Text",
            },
            ImageTransparency = 1,
            Name = "Outline"
        }, {
            New("UIGradient", {
                Rotation = 78,
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
            }),
        }),
        Creator.NewRoundFrame(Window.UICorner-(Window.UIPadding/2), "Squircle", {
            Size = UDim2.new(1,0,1,0),
            ThemeTag = {
                ImageColor3 = "Text",
            },
            ImageTransparency = 1,
            Name = "UserIcon",
        }, {
            New("ImageLabel", {
                Image = GetUserThumb(),
                BackgroundTransparency = 1,
                Size = UDim2.new(0,42,0,42),
                ThemeTag = {
                    BackgroundColor3 = "Text",
                },
                BackgroundTransparency = .93,
            }, {
                New("UICorner", {
                    CornerRadius = UDim.new(1,0)
                })
            }),
            New("Frame", {
                AutomaticSize = "XY",
                BackgroundTransparency = 1,
            }, {
                New("TextLabel", {
                    Text = Window.User.Anonymous and "Anonymous" or Players.LocalPlayer.DisplayName,
                    TextSize = 17,
                    ThemeTag = {
                        TextColor3 = "Text",
                    },
                    FontFace = Font.new(Creator.Font, Enum.FontWeight.SemiBold),
                    AutomaticSize = "Y",
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1,-(42/2)-6,0,0),
                    TextTruncate = "AtEnd",
                    TextXAlignment = "Left",
                    Name = "DisplayName"
                }),
                New("TextLabel", {
                    Text = Window.User.Anonymous and "anonymous" or Players.LocalPlayer.Name,
                    TextSize = 15,
                    TextTransparency = .6,
                    ThemeTag = {
                        TextColor3 = "Text",
                    },
                    FontFace = Font.new(Creator.Font, Enum.FontWeight.Medium),
                    AutomaticSize = "Y",
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1,-(42/2)-6,0,0),
                    TextTruncate = "AtEnd",
                    TextXAlignment = "Left",
                    Name = "UserName"
                }),
                New("UIListLayout", {
                    Padding = UDim.new(0,4),
                    HorizontalAlignment = "Left",
                })
            }),
            New("UIListLayout", {
                Padding = UDim.new(0,Window.UIPadding),
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
            }),
            New("UIPadding", {
                PaddingLeft = UDim.new(0,Window.UIPadding/2),
                PaddingRight = UDim.new(0,Window.UIPadding/2),
            })
        })
    })
    
    Window.UIElements.UserIcon = UserIcon

    function Window.User:Enable()
        Window.User.Enabled = true
        Tween(Window.UIElements.SideBarContainer, .25, { Size = UDim2.new(0,Window.SideBarWidth,1,-Window.Topbar.Height -42 -(Window.UIPadding*2)) }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
        UserIcon.Visible = true
    end
    function Window.User:Disable()
        Window.User.Enabled = false
        Tween(Window.UIElements.SideBarContainer, .25, { Size = UDim2.new(0,Window.SideBarWidth,1,-Window.Topbar.Height) }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
        UserIcon.Visible = false
    end
    function Window.User:SetAnonymous(v)
        if v ~= false then v = true end
        Window.User.Anonymous = v
        UserIcon.UserIcon.ImageLabel.Image = GetUserThumb()
        UserIcon.UserIcon.Frame.DisplayName.Text = v and "Anonymous" or Players.LocalPlayer.DisplayName
        UserIcon.UserIcon.Frame.UserName.Text = v and "anonymous" or Players.LocalPlayer.Name
    end
    
    if Window.User.Enabled then
        Window.User:Enable()
    else
        Window.User:Disable()
    end
    
    if Window.User.Callback then
        Creator.AddSignal(UserIcon.MouseButton1Click, function()
            Window.User.Callback()
        end)
        Creator.AddSignal(UserIcon.MouseEnter, function()
            Tween(UserIcon.UserIcon, 0.04, {ImageTransparency = .95}):Play()
            Tween(UserIcon.Outline, 0.04, {ImageTransparency = .85}):Play()
        end)
        Creator.AddSignal(UserIcon.InputEnded, function()
            Tween(UserIcon.UserIcon, 0.04, {ImageTransparency = 1}):Play()
            Tween(UserIcon.Outline, 0.04, {ImageTransparency = 1}):Play()
        end)
    end

    return UserIcon
end

return Sidebar
