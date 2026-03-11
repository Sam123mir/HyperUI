--[[
    HyperUI v2 - HyperKeybind Element
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.theme.tokens)
local BaseElement = require(script.Parent.BaseElement)
local UserInputService = game:GetService("UserInputService")

local function HyperKeybind(props)
    local isListening, setListening = React.useState(false)
    local bind = props.Value or Enum.KeyCode.Unknown
    
    React.useEffect(function()
        if not isListening then return end
        
        local connection = UserInputService.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Keyboard then
                setListening(false)
                if props.Callback then props.Callback(input.KeyCode) end
            end
        end)
        
        return function() connection:Disconnect() end
    end, {isListening})
    
    return React.createElement(BaseElement, {
        OnActivated = function() setListening(true) end,
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
                Size = UDim2.new(1, -100, 1, 0),
                BackgroundTransparency = 1,
                Text = props.Text or "Keybind",
                TextColor3 = Tokens.Color.Text,
                Font = Tokens.Font.Main,
                TextSize = Tokens.FontSize.Medium,
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
            BindDisplay = React.createElement("Frame", {
                Size = UDim2.fromOffset(80, 24),
                Position = UDim2.new(1, -80, 0.5, -12),
                BackgroundColor3 = isListening and Tokens.Color.Accent or Tokens.Color.Surface,
                BackgroundTransparency = 0.5,
                BorderSizePixel = 0,
            }, {
                UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
                Text = React.createElement("TextLabel", {
                    Size = UDim2.fromScale(1, 1),
                    BackgroundTransparency = 1,
                    Text = isListening and "..." or bind.Name,
                    TextColor3 = Tokens.Color.Text,
                    Font = Tokens.Font.Bold,
                    TextSize = Tokens.FontSize.Small,
                })
            })
        })
    })
end

return HyperKeybind
