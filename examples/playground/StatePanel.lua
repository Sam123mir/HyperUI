--[[
    HyperUI v2 - Playground State Panel
    Property editor for real-time component manipulation.
]]

local React = require(script.Parent.Parent.Parent.src.v2.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.src.v2.theme.tokens)

local function PropertyRow(props)
    return React.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 32),
        BackgroundTransparency = 1,
    }, {
        Label = React.createElement("TextLabel", {
            Size = UDim2.new(0.4, 0, 1, 0),
            BackgroundTransparency = 1,
            Text = props.Name,
            TextColor3 = Tokens.Color.Text,
            Font = Tokens.Font.Main,
            TextSize = 12,
            TextXAlignment = Enum.TextXAlignment.Left,
        }),
        Editor = React.createElement("Frame", {
            Size = UDim2.new(0.6, -8, 1, -8),
            Position = UDim2.fromScale(0.4, 0.5),
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = Tokens.Color.Surface,
            BorderSizePixel = 0,
        }, {
            UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
            Input = props.children
        })
    })
end

local function StatePanel(props)
    local items = {
        Layout = React.createElement("UIListLayout", { Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder }),
        Padding = React.createElement("UIPadding", { PaddingLeft = UDim.new(0, 12), PaddingRight = UDim.new(0, 12) }),
    }
    
    for key, value in pairs(props.Props or {}) do
        local editor = nil
        
        if type(value) == "string" then
            editor = React.createElement("TextBox", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
                Text = value,
                TextColor3 = Tokens.Color.Text,
                Font = Tokens.Font.Main,
                TextSize = 12,
                ClipsDescendants = true,
                [React.Event.FocusLost] = function(rbx) props.OnPropChange(key, rbx.Text) end,
            })
        elseif type(value) == "number" then
            editor = React.createElement("TextBox", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
                Text = tostring(value),
                TextColor3 = Tokens.Color.Text,
                Font = Tokens.Font.Main,
                TextSize = 12,
                [React.Event.FocusLost] = function(rbx) props.OnPropChange(key, tonumber(rbx.Text) or 0) end,
            })
        elseif type(value) == "boolean" then
            editor = React.createElement("TextButton", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
                Text = value and "ENABLED" or "DISABLED",
                TextColor3 = value and Tokens.Color.Success or Tokens.Color.Error,
                Font = Tokens.Font.Bold,
                TextSize = 10,
                [React.Event.Activated] = function() props.OnPropChange(key, not value) end,
            })
        end
        
        if editor then
            items[key] = React.createElement(PropertyRow, { Name = key }, editor)
        end
    end
    
    return React.createElement("Frame", {
        Size = UDim2.new(1, 0, 0.7, 0),
        BackgroundColor3 = Tokens.Color.Background,
        BackgroundTransparency = 0.5,
        BorderSizePixel = 0,
        LayoutOrder = 1,
    }, {
        Title = React.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 32),
            Text = "PROPERTIES",
            TextColor3 = Tokens.Color.TextMuted,
            Font = Tokens.Font.Bold,
            TextSize = 10,
            BackgroundTransparency = 1,
        }),
        List = React.createElement("ScrollingFrame", {
            Size = UDim2.new(1, 0, 1, -32),
            Position = UDim2.fromOffset(0, 32),
            BackgroundTransparency = 1,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticCanvasSize.Y,
            ScrollBarThickness = 1,
        }, items)
    })
end

return StatePanel
