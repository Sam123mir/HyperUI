--[[
    HyperUI v2 - Typography Tokens
]]

local Typography = {
    Font = {
        Main = Enum.Font.BuilderSans,
        Bold = Enum.Font.BuilderSansExtraBold,
        Medium = Enum.Font.BuilderSansMedium,
        Mono = Enum.Font.RobotoMono,
    },
    Size = {
        Small = 12,
        Base = 14,
        Medium = 16,
        Large = 18,
        Title = 24,
    },
    Weight = {
        Light = Enum.FontWeight.Light,
        Regular = Enum.FontWeight.Regular,
        Medium = Enum.FontWeight.Medium,
        SemiBold = Enum.FontWeight.SemiBold,
        Bold = Enum.FontWeight.Bold,
        ExtraBold = Enum.FontWeight.Heavy,
    }
}

return Typography
