--[[
    HyperUI v2 - HyperGroup Element
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.theme.tokens)
local ElementList = require(script.Parent.Parent.Containers.ElementList)

local function HyperGroup(props)
    return React.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Tokens.Color.Background,
        BackgroundTransparency = 0.5,
        BorderSizePixel = 0,
        LayoutOrder = props.LayoutOrder,
    }, {
        UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(0, Tokens.Radius.Small) }),
        Padding = React.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 8),
            PaddingBottom = UDim.new(0, 8),
        }),
        Content = React.createElement(ElementList, {}, props.children)
    })
end

return HyperGroup
