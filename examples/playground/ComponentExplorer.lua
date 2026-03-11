--[[
    HyperUI v2 - Playground Explorer
    Sidebar for selecting components to test.
]]

local React = require(script.Parent.Parent.Parent.src.v2.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.src.v2.theme.tokens)
local Registry = require(script.Parent.ComponentRegistry)

local function ComponentExplorer(props)
    local categories = Registry:GetCategories()
    local items = {}
    
    for _, catName in ipairs(categories) do
        -- Category Header
        table.insert(items, React.createElement("TextLabel", {
            key = catName .. "_header",
            Size = UDim2.new(1, 0, 0, 24),
            BackgroundTransparency = 1,
            Text = "  " .. catName:upper(),
            TextColor3 = Tokens.Color.TextMuted,
            Font = Tokens.Font.Bold,
            TextSize = 10,
            TextXAlignment = Enum.TextXAlignment.Left,
        }))
        
        -- Category Elements
        local elements = Registry:GetElementsByCategory(catName)
        for name, data in pairs(elements) do
            local isSelected = props.SelectedCategory == catName and props.SelectedName == name
            
            table.insert(items, React.createElement("TextButton", {
                key = catName .. "_" .. name,
                Size = UDim2.new(1, -16, 0, 28),
                BackgroundColor3 = isSelected and Tokens.Color.Accent or Tokens.Color.Surface,
                BackgroundTransparency = isSelected and 0 or 1,
                Text = "    " .. name,
                TextColor3 = Tokens.Color.Text,
                Font = isSelected and Tokens.Font.Bold or Tokens.Font.Main,
                TextSize = Tokens.FontSize.Small,
                TextXAlignment = Enum.TextXAlignment.Left,
                BorderSizePixel = 0,
                [React.Event.Activated] = function() 
                    props.OnSelect(catName, name) 
                end,
            }, {
                UICorner = React.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 4)
                })
            }))
        end
        
        -- Spacer
        table.insert(items, React.createElement("Frame", {
            key = catName .. "_spacer",
            Size = UDim2.new(1, 0, 0, 8),
            BackgroundTransparency = 1,
        }))
    end
    
    return React.createElement("ScrollingFrame", {
        Size = UDim2.new(0, 200, 1, 0),
        BackgroundColor3 = Tokens.Color.Surface,
        BorderSizePixel = 0,
        ScrollBarThickness = 2,
        ScrollBarImageColor3 = Tokens.Color.Accent,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
    }, {
        Layout = React.createElement("UIListLayout", {
            Padding = UDim.new(0, 2),
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        Padding = React.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 16),
            PaddingBottom = UDim.new(0, 16),
        }),
        Items = React.createElement(React.Fragment, {}, items)
    })
end

return ComponentExplorer
