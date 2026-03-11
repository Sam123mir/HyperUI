--[[
    HyperUI v2 - HyperToast Element
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.theme.tokens)
local BaseElement = require(script.Parent.BaseElement)
local useSpring = require(script.Parent.Parent.Parent.hooks.useSpring)

local function HyperToast(props)
    local priorityColors = {
        Info = Tokens.Color.Accent,
        Success = Tokens.Color.Success,
        Warning = Tokens.Color.Warning,
        Error = Tokens.Color.Error,
    }
    
    local color = priorityColors[props.Priority] or Tokens.Color.Accent
    
    return React.createElement(BaseElement, {
        Size = UDim2.new(0, 300, 0, 60),
        BackgroundColor = Tokens.Color.Surface,
        BackgroundTransparency = 0.1,
    }, {
        UIStroke = React.createElement("UIStroke", {
            Color = color,
            Thickness = 1,
            Transparency = 0.5,
        }),
        Container = React.createElement("Frame", {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
        }, {
            Padding = React.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, Tokens.Spacing[3]),
                PaddingRight = UDim.new(0, Tokens.Spacing[3]),
            }),
            Icon = props.Icon and React.createElement("ImageLabel", {
                Size = UDim2.fromOffset(24, 24),
                Position = UDim2.new(0, 0, 0.5, -12),
                BackgroundTransparency = 1,
                Image = props.Icon,
                ImageColor3 = color,
            }),
            Content = React.createElement("Frame", {
                Size = UDim2.new(1, props.Icon and -32 or 0, 1, 0),
                Position = UDim2.new(0, props.Icon and 32 or 0, 0, 0),
                BackgroundTransparency = 1,
            }, {
                Layout = React.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    Padding = UDim.new(0, 2),
                }),
                Title = React.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, 16),
                    BackgroundTransparency = 1,
                    Text = props.Title or "Notification",
                    TextColor3 = color,
                    Font = Tokens.Font.Bold,
                    TextSize = Tokens.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                Text = React.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, 14),
                    BackgroundTransparency = 1,
                    Text = props.Content or "",
                    TextColor3 = Tokens.Color.Text,
                    Font = Tokens.Font.Main,
                    TextSize = Tokens.FontSize.Small,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextWrapped = true,
                })
            })
        })
    })
end

return HyperToast
