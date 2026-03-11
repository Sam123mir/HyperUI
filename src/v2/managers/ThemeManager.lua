--[[
    HyperUI v2 - Theme Manager
]]

local ThemeManager = {}
ThemeManager.__index = ThemeManager

function ThemeManager.new(store)
    local self = setmetatable({
        Store = store,
    }, ThemeManager)
    
    return self
end

function ThemeManager:SetTheme(themeName)
    self.Store:Dispatch({
        type = "SET_THEME",
        theme = themeName,
    })
end

return ThemeManager
