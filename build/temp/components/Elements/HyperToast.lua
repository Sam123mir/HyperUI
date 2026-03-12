



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.BaseElement)
local c = require(script.Parent.Parent.Parent.hooks.useTheme)

local function HyperToast(d)
    local e = c(d.store)
    local f = {
        Info = e.Color.Accent,
        Success = e.Color.Success,
        Warning = e.Color.Warning,
        Error = e.Color.Error,
    }
    
    local g = f[d.Priority] or e.Color.Accent
    
    return a.createElement(b, {
        Size = UDim2.new(0, 300, 0, 60),
        BackgroundColor3 = e.Color.Surface,
        BackgroundTransparency = 0.1,
    }, {
        UIStroke = a.createElement("UIStroke", {
            Color = g,
            Thickness = 1,
            Transparency = 0.5,
        }),
        Container = a.createElement("Frame", {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
        }, {
            Padding = a.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, e.Spacing[3]),
                PaddingRight = UDim.new(0, e.Spacing[3]),
            }),
            Icon = d.Icon and a.createElement("ImageLabel", {
                Size = UDim2.fromOffset(24, 24),
                Position = UDim2.new(0, 0, 0.5, -12),
                BackgroundTransparency = 1,
                Image = d.Icon,
                ImageColor3 = g,
            }),
            Content = a.createElement("Frame", {
                Size = UDim2.new(1, d.Icon and -32 or 0, 1, 0),
                Position = UDim2.new(0, d.Icon and 32 or 0, 0, 0),
                BackgroundTransparency = 1,
            }, {
                Layout = a.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    Padding = UDim.new(0, 2),
                }),
                Title = a.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, 16),
                    BackgroundTransparency = 1,
                    Text = d.Title or "Notification",
                    TextColor3 = g,
                    Font = e.Font.Bold,
                    TextSize = e.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                Text = a.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, 14),
                    BackgroundTransparency = 1,
                    Text = d.Content or "",
                    TextColor3 = e.Color.Text,
                    Font = e.Font.Main,
                    TextSize = e.FontSize.Small,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextWrapped = true,
                })
            })
        })
    })
end

return HyperToast
