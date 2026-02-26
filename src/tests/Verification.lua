-- HyperUI Refactoring Verification Script
-- This script manually tests the main features to ensure no regressions.

local HyperUI = require(game:GetService("ReplicatedStorage"):WaitForChild("HyperUI"))
local Window = HyperUI:CreateWindow({
    Title = "Verification Window",
    Icon = "check-circle",
    Author = "Antigravity",
    Size = UDim2.fromOffset(500, 400),
    Transparent = true,
    Background = "rbxassetid://12345678" -- Dummy image to test loading
})

local Tab = Window:Tab({
    Title = "General",
    Icon = "settings"
})

local Section = Tab:Section({
    Title = "Interactive Elements"
})

Section:Button({
    Title = "Test Button",
    Desc = "Click me to verify tactile feedback",
    Callback = function()
        print("Button clicked!")
    end
})

Section:Toggle({
    Title = "Test Toggle",
    Value = true,
    Callback = function(v)
        print("Toggle value:", v)
    end
})

Section:Slider({
    Title = "Test Slider",
    Value = {Min = 0, Max = 100, Default = 50},
    Callback = function(v)
        print("Slider value:", v)
    end
})

print("[ Verification ] Window and Elements created successfully!")
