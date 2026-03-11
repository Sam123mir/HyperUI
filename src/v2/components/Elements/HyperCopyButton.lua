--[[
    HyperUI v2 - CopyButton Element
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.theme.tokens)
local BaseElement = require(script.Parent.BaseElement)

local function CopyButton(props)
    local isCopied, setCopied = React.useState(false)
    
    local function copy()
        if setclipboard then
            setclipboard(props.Value or "")
            setCopied(true)
            task.delay(2, function() setCopied(false) end)
        end
    end
    
    return React.createElement(BaseElement, {
        OnActivated = copy,
        LayoutOrder = props.LayoutOrder,
    }, {
        Container = React.createElement("Frame", {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
        }, {
            Padding = React.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, Tokens.Spacing[3]),
                PaddingRight = UDim.new(0, Tokens.Spacing[3]),
            }),
            Label = React.createElement("TextLabel", {
                Size = UDim2.new(1, -60, 1, 0),
                BackgroundTransparency = 1,
                Text = props.Text or "Copy Content",
                TextColor3 = Tokens.Color.Text,
                Font = Tokens.Font.Main,
                TextSize = Tokens.FontSize.Medium,
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
            Status = React.createElement("TextLabel", {
                Size = UDim2.fromScale(0.4, 1),
                Position = UDim2.fromScale(0.6, 0),
                BackgroundTransparency = 1,
                Text = isCopied and "COPIED" or "COPY",
                TextColor3 = isCopied and Tokens.Color.Success or Tokens.Color.TextMuted,
                Font = Tokens.Font.Bold,
                TextSize = 10,
                TextXAlignment = Enum.TextXAlignment.Right,
            })
        })
    })
end

return CopyButton
