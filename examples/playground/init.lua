--[[
    HyperUI v2 - Playground Entry Point
    Run this script in a Roblox environment (Studio or Executor).
]]

local React = require(script.Parent.Parent.src.v2.dependencies.React)
local ReactRoblox = require(script.Parent.Parent.src.v2.dependencies.ReactRoblox)
local PlaygroundWindow = require(script.PlaygroundWindow)

local Playground = {}

function Playground.start()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "HyperUI_Playground"
    screenGui.ResetOnSpawn = false
    screenGui.DisplayOrder = 1000
    
    -- In exploit environments, protect the GUI
    if gethui then
        screenGui.Parent = gethui()
    elseif syn and syn.protect_gui then
        syn.protect_gui(screenGui)
        screenGui.Parent = game:GetService("CoreGui")
    else
        screenGui.Parent = game:GetService("CoreGui")
    end
    
    local root = ReactRoblox.createRoot(screenGui)
    root:render(React.createElement(PlaygroundWindow))
    
    print("HyperUI v2 Playground Started Successfully.")
    return screenGui
end

-- Auto-start if run directly
if not _G.HyperUI_Loaded then
    Playground.start()
end

return Playground
