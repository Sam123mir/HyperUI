



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.theme.tokens)
local c = require(script.Parent.BaseElement)
local d = require(script.Parent.Parent.Parent.hooks.useSpring)

local function HyperToast(e)
    local f = {
        Info = b.Color.Accent,
        Success = b.Color.Success,
        Warning = b.Color.Warning,
        Error = b.Color.Error,
    }
    
    local g = f[e.Priority] or b.Color.Accent
    
    return a.createElement(c, {
        Size = UDim2.new(0, 300, 0, 60),
        BackgroundColor = b.Color.Surface,
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
                PaddingLeft = UDim.new(0, b.Spacing[3]),
                PaddingRight = UDim.new(0, b.Spacing[3]),
            }),
            Icon = e.Icon and a.createElement("ImageLabel", {
                Size = UDim2.fromOffset(24, 24),
                Position = UDim2.new(0, 0, 0.5, -12),
                BackgroundTransparency = 1,
                Image = e.Icon,
                ImageColor3 = g,
            }),
            Content = a.createElement("Frame", {
                Size = UDim2.new(1, e.Icon and -32 or 0, 1, 0),
                Position = UDim2.new(0, e.Icon and 32 or 0, 0, 0),
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
                    Text = e.Title or "Notification",
                    TextColor3 = g,
                    Font = b.Font.Bold,
                    TextSize = b.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                Text = a.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, 14),
                    BackgroundTransparency = 1,
                    Text = e.Content or "",
                    TextColor3 = b.Color.Text,
                    Font = b.Font.Main,
                    TextSize = b.FontSize.Small,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextWrapped = true,
                })
            })
        })
    })
end

return HyperToast
