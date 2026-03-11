--[[
    HyperUI v2 - HyperAccordion Element
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.theme.tokens)
local BaseElement = require(script.Parent.BaseElement)
local useSpring = require(script.Parent.Parent.Parent.hooks.useSpring)

local function HyperAccordion(props)
    local isOpen, setOpen = React.useState(false)
    local arrowRotation = useSpring(isOpen and 180 or 0, { damping = 0.8, stiffness = 0.2 })
    
    return React.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        LayoutOrder = props.LayoutOrder,
    }, {
        Layout = React.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4) }),
        Header = React.createElement(BaseElement, {
            OnActivated = function() setOpen(not isOpen) end,
        }, {
            Container = React.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = React.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, Tokens.Spacing[3]),
                    PaddingRight = UDim.new(0, Tokens.Spacing[3]),
                }),
                Title = React.createElement("TextLabel", {
                    Size = UDim2.new(1, -24, 1, 0),
                    BackgroundTransparency = 1,
                    Text = props.Title or "Accordion",
                    TextColor3 = Tokens.Color.Text,
                    Font = Tokens.Font.Bold,
                    TextSize = Tokens.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                Arrow = React.createElement("ImageLabel", {
                    Size = UDim2.fromOffset(16, 16),
                    Position = UDim2.new(1, -16, 0.5, -8),
                    BackgroundTransparency = 1,
                    Image = "rbxassetid://10723346959",
                    ImageColor3 = Tokens.Color.TextMuted,
                    Rotation = arrowRotation,
                })
            })
        }),
        Content = isOpen and React.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
        }, {
            Padding = React.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 16),
                PaddingRight = UDim.new(0, 4),
            }),
            Elements = React.createElement(React.Fragment, {}, props.children)
        })
    })
end

return HyperAccordion
