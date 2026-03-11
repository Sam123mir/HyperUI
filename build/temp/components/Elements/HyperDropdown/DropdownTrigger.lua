



local a = require(script.Parent.Parent.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.Parent.Parent.theme.tokens)
local c = require(script.Parent.Parent.BaseElement)
local d = require(script.Parent.Parent.Parent.Parent.Parent.hooks.useSpring)

local function DropdownTrigger(e)
    local f = d(e.Open and 180 or 0, { damping = 0.8, stiffness = 0.2 })
    
    local g = "Select Option..."
    if e.Value then
        if type(e.Value) == "table" then
            g = #e.Value .. " selected"
        else
            g = tostring(e.Value)
        end
    end
    
    return a.createElement(c, {
        OnActivated = e.OnToggle,
    }, {
        Container = a.createElement("Frame", {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
        }, {
            Padding = a.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, b.Spacing[3]),
                PaddingRight = UDim.new(0, b.Spacing[3]),
            }),
            Label = a.createElement("TextLabel", {
                Size = UDim2.new(1, -60, 1, 0),
                BackgroundTransparency = 1,
                Text = e.Text or "Dropdown",
                TextColor3 = b.Color.Text,
                Font = b.Font.Main,
                TextSize = b.FontSize.Medium,
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
            Value = a.createElement("TextLabel", {
                Size = UDim2.new(1, -60, 1, 0),
                BackgroundTransparency = 1,
                Text = g,
                TextColor3 = b.Color.TextMuted,
                Font = b.Font.Main,
                TextSize = b.FontSize.Small,
                TextXAlignment = Enum.TextXAlignment.Right,
                ZIndex = 4,
            }),
            Arrow = a.createElement("ImageLabel", {
                Size = UDim2.fromOffset(16, 16),
                Position = UDim2.new(1, -16, 0.5, -8),
                BackgroundTransparency = 1,
                Image = "rbxassetid://10723346959", 
                ImageColor3 = b.Color.TextMuted,
                Rotation = f,
            })
        })
    })
end

return DropdownTrigger
