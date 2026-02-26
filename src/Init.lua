local RunService = game:GetService("RunService")
local HyperUI = {
    Window = nil,
    Theme = nil,
    Creator = require("./modules/Creator"),
    LocalizationModule = require("./modules/Localization"),
    NotificationModule = require("./components/Notification"),
    Themes = nil,
    Transparent = false,
    
    TransparencyValue = .15,
    
    UIScale = 1,
    
    ConfigManager = nil,
    Version = "0.0.0",
    
    Services = require("./utils/services/Init"),
    
    AllElements = {},
    
    OnThemeChangeFunction = nil,
    
    cloneref = nil,
    UIScaleObj = nil,
}


local cloneref = (cloneref or clonereference or function(instance) return instance end)

HyperUI.cloneref = cloneref

local HttpService = cloneref(game:GetService("HttpService"))
local Players = cloneref(game:GetService("Players"))
local CoreGui= cloneref(game:GetService("CoreGui"))

local LocalPlayer = Players.LocalPlayer or nil

local Package = HttpService:JSONDecode(require("../build/package"))
if Package then
    HyperUI.Version = Package.version
end

local KeySystem = require("./components/KeySystem")
HyperUI.Loading = require("./components/loading/Init")

local ServicesModule = HyperUI.Services


local Creator = HyperUI.Creator

local New = Creator.New
local Tween = Creator.Tween


local Acrylic = require("./utils/Acrylic/Init")


local ProtectGui = protectgui or (syn and syn.protect_gui) or function() end

local GUIParent = gethui and gethui() or (CoreGui or game.Players.LocalPlayer:WaitForChild("PlayerGui"))

local UIScaleObj = New("UIScale", {
    Scale = HyperUI.UIScale,
})

HyperUI.UIScaleObj = UIScaleObj

HyperUI.ScreenGui = New("ScreenGui", {
    Name = "HyperUI",
    Parent = GUIParent,
    IgnoreGuiInset = true,
    ScreenInsets = "None",
}, {
    
    New("Folder", {
        Name = "Window"
    }),
    -- New("Folder", {
    --     Name = "Notifications"
    -- }),
    -- New("Folder", {
    --     Name = "Dropdowns"
    -- }),
    New("Folder", {
        Name = "KeySystem"
    }),
    New("Folder", {
        Name = "Popups"
    }),
    New("Folder", {
        Name = "ToolTips"
    })
})

HyperUI.NotificationGui = New("ScreenGui", {
    Name = "HyperUI/Notifications",
    Parent = GUIParent,
    IgnoreGuiInset = true,
    DisplayOrder = 102,
})
HyperUI.DropdownGui = New("ScreenGui", {
    Name = "HyperUI/Dropdowns",
    Parent = GUIParent,
    IgnoreGuiInset = true,
    DisplayOrder = 100,
})
HyperUI.TooltipGui = New("ScreenGui", {
    Name = "HyperUI/Tooltips",
    Parent = GUIParent,
    IgnoreGuiInset = true,
    DisplayOrder = 101,
})
ProtectGui(HyperUI.ScreenGui)
ProtectGui(HyperUI.NotificationGui)
ProtectGui(HyperUI.DropdownGui)
ProtectGui(HyperUI.TooltipGui)

Creator.Init(HyperUI)


function HyperUI:SetParent(parent)
    HyperUI.ScreenGui.Parent = parent
    HyperUI.NotificationGui.Parent = parent
    HyperUI.DropdownGui.Parent = parent
end
math.clamp(HyperUI.TransparencyValue, 0, 1)

local Holder = HyperUI.NotificationModule.Init(HyperUI.NotificationGui)

function HyperUI:Notify(Config)
    Config.Holder = Holder.Frame
    Config.Window = HyperUI.Window
    --Config.HyperUI = HyperUI
    return HyperUI.NotificationModule.New(Config)
end

function HyperUI:SetNotificationLower(Val)
    Holder.SetLower(Val)
end

function HyperUI:SetFont(FontId)
    Creator.UpdateFont(FontId)
end

function HyperUI:OnThemeChange(func)
    HyperUI.OnThemeChangeFunction = func
end

function HyperUI:AddTheme(LTheme)
    HyperUI.Themes[LTheme.Name] = LTheme
    return LTheme
end

function HyperUI:SetTheme(Value)
    if HyperUI.Themes[Value] then
        HyperUI.Theme = HyperUI.Themes[Value]
        Creator.SetTheme(HyperUI.Themes[Value])

        if HyperUI.OnThemeChangeFunction then
            HyperUI.OnThemeChangeFunction(Value)
        end
        
        return HyperUI.Themes[Value]
    end
    return nil
end

function HyperUI:GetThemes()
    return HyperUI.Themes
end
function HyperUI:GetCurrentTheme()
    return HyperUI.Theme.Name
end
function HyperUI:GetTransparency()
    return HyperUI.Transparent or false
end
function HyperUI:GetWindowSize()
    if not HyperUI.Window or not HyperUI.Window.UIElements or not HyperUI.Window.UIElements.Main then
        return UDim2.fromOffset(600, 400) -- Default or safe size
    end
    return HyperUI.Window.UIElements.Main.Size
end
function HyperUI:Localization(LocalizationConfig)
    return HyperUI.LocalizationModule:New(LocalizationConfig, Creator)
end

function HyperUI:SetLanguage(Value)
    if Creator.Localization then
        return Creator.SetLanguage(Value)
    end
    return false
end

function HyperUI:ToggleAcrylic(Value)
	if HyperUI.Window and HyperUI.Window.AcrylicPaint and HyperUI.Window.AcrylicPaint.Model then
		HyperUI.Window.Acrylic = Value
		HyperUI.Window.AcrylicPaint.Model.Transparency = Value and 0.98 or 1
		if Value then
			Acrylic.Enable()
		else
			Acrylic.Disable()
		end
	end
end


function HyperUI:Gradient(stops, props)
    local colorSequence = {}
    local transparencySequence = {}

    for posStr, stop in next, stops do
        local position = tonumber(posStr)
        if position then
            position = math.clamp(position / 100, 0, 1)

            local color = stop.Color
            if typeof(color) == "string" and string.sub(color, 1, 1) == "#" then
                color = Color3.fromHex(color)
            end

            local transparency = stop.Transparency or 0

            table.insert(colorSequence, ColorSequenceKeypoint.new(position, color))
            table.insert(transparencySequence, NumberSequenceKeypoint.new(position, transparency))
        end
    end

    table.sort(colorSequence, function(a, b) return a.Time < b.Time end)
    table.sort(transparencySequence, function(a, b) return a.Time < b.Time end)

    if #colorSequence < 2 then
        table.insert(colorSequence, ColorSequenceKeypoint.new(1, colorSequence[1].Value))
        table.insert(transparencySequence, NumberSequenceKeypoint.new(1, transparencySequence[1].Value))
    end

    local gradientData = {
        Color = ColorSequence.new(colorSequence),
        Transparency = NumberSequence.new(transparencySequence),
    }

    if props then
        for k, v in pairs(props) do
            gradientData[k] = v
        end
    end

    return gradientData
end


function HyperUI:Popup(PopupConfig)
    PopupConfig.HyperUI = HyperUI
    return require("./components/popup/Init").new(PopupConfig)
end


HyperUI.Themes = require("./themes/Init")(HyperUI)

Creator.Themes = HyperUI.Themes


HyperUI:SetTheme("Dark")
HyperUI:SetLanguage(Creator.Language)


function HyperUI:CreateWindow(Config)
    local CreateWindow = require("./components/window/Init")
    local LoadingComponent = require("./components/loading/Init")

    local LoadingScreen
    if not Config.HideLoadingScreen then
        LoadingScreen = LoadingComponent.new({
            Parent = HyperUI.ScreenGui,
            Version = HyperUI.Version
        })
        LoadingScreen:UpdateStatus("Synchronizing environment state", 20)
    end

    if not RunService:IsStudio() and writefile then
        if not isfolder("HyperUI") then
            makefolder("HyperUI")
        end
        if Config.Folder then
            Config.Folder = Creator.SanitizeFilename(Config.Folder)
            if not isfolder("HyperUI/" .. Config.Folder) then
                makefolder("HyperUI/" .. Config.Folder)
            end
        else
            Config.Folder = Creator.SanitizeFilename(Config.Title)
            if not isfolder("HyperUI/" .. Config.Folder) then
                makefolder("HyperUI/" .. Config.Folder)
            end
        end
    end
    
    Config.HyperUI = HyperUI
    Config.Parent = HyperUI.ScreenGui.Window
    
    if LoadingScreen then
        LoadingScreen:UpdateStatus("Reconstructing core components", 40)
    end

    if HyperUI.Window then
        warn("You cannot create more than one window")
        return
    end
    
    local CanLoadWindow = true
    
    local Theme = HyperUI.Themes[Config.Theme or "Dark"]
    
    --HyperUI.Theme = Theme
    Creator.SetTheme(Theme)
    
    
    local hwid = gethwid or function()
        return Players.LocalPlayer.UserId
    end
    
    local Filename = hwid()
    
    if Config.KeySystem then
        CanLoadWindow = false
    
        local function loadKeysystem()
            print("[ HyperUI ] Initializing Key System...")
            if LoadingScreen then LoadingScreen:Finish() end
            local success, err = pcall(function()
                KeySystem.new(Config, Filename, function(c) 
                    print("[ HyperUI ] Key System success:", c)
                    CanLoadWindow = c 
                end)
            end)
            if not success then
                warn("[ HyperUI ] Key System failed to initialize: " .. tostring(err))
                CanLoadWindow = true -- Fallback to allow opening if key system crashes
            end
        end
    
        if LoadingScreen then LoadingScreen:UpdateStatus("Authenticating session credentials", 60) end
        local keyPath = (Config.Folder or "Temp") .. "/" .. Filename .. ".key"
        
        if Config.KeySystem.KeyValidator then
            if Config.KeySystem.SaveKey and isfile(keyPath) then
                local savedKey = readfile(keyPath)
                local isValid = Config.KeySystem.KeyValidator(savedKey)
                
                if isValid then
                    CanLoadWindow = true
                else
                    loadKeysystem()
                end
            else
                loadKeysystem()
            end
        elseif not Config.KeySystem.API then
            if Config.KeySystem.SaveKey and isfile(keyPath) then
                local savedKey = readfile(keyPath)
                local isKey = (type(Config.KeySystem.Key) == "table")
                    and table.find(Config.KeySystem.Key, savedKey)
                    or tostring(Config.KeySystem.Key) == tostring(savedKey)
                    
                if isKey then
                    CanLoadWindow = true
                else
                    loadKeysystem()
                end
            else
                loadKeysystem()
            end
        else
            if isfile(keyPath) then
                local fileKey = readfile(keyPath)
                local isSuccess = false
                 
                for _, i in next, Config.KeySystem.API do
                    local serviceData = HyperUI.Services[i.Type]
                    if serviceData then
                        local args = {}
                        for _, argName in next, serviceData.Args do
                            table.insert(args, i[argName])
                        end
                        
                        local service = serviceData.New(table.unpack(args))
                        local success = service.Verify(fileKey)
                        if success then
                            isSuccess = true
                            break
                        end
                    end
                end
                    
                CanLoadWindow = isSuccess
                if not isSuccess then loadKeysystem() end
            else
                loadKeysystem()
            end
        end
        
        repeat task.wait() until CanLoadWindow
    end

    if LoadingScreen then LoadingScreen:UpdateStatus("Finalizing system architecture", 90) end
    task.wait(1.5)

    local Window = CreateWindow(Config)

    if LoadingScreen then 
        LoadingScreen:UpdateStatus("System operational", 100)
        task.wait(0.8)
        LoadingScreen:Finish() 
    end

    HyperUI.Transparent = Config.Transparent
    HyperUI.Window = Window
    
    if Config.Acrylic then
        Acrylic.init()
    end
    
    -- function Window:ToggleTransparency(Value)
    --     HyperUI.Transparent = Value
    --     HyperUI.Window.Transparent = Value
        
    --     Window.UIElements.Main.Background.BackgroundTransparency = Value and HyperUI.TransparencyValue or 0
    --     Window.UIElements.Main.Background.ImageLabel.ImageTransparency = Value and HyperUI.TransparencyValue or 0
    --     Window.UIElements.Main.Gradient.UIGradient.Transparency = NumberSequence.new{
    --         NumberSequenceKeypoint.new(0, 1), 
    --         NumberSequenceKeypoint.new(1, Value and 0.85 or 0.7),
    --     }
    -- end
    
    return Window
end

-- Build Timestamp: 2026-02-23T21:38:00
return HyperUI
