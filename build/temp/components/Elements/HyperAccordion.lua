



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.theme.tokens)
local c = require(script.Parent.BaseElement)
local d = require(script.Parent.Parent.Parent.hooks.useSpring)

local function HyperAccordion(e)
    local f, g = a.useState(false)
    local h = d(f and 180 or 0, { damping = 0.8, stiffness = 0.2 })
    
    return a.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        LayoutOrder = e.LayoutOrder,
    }, {
        Layout = a.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4) }),
        Header = a.createElement(c, {
            OnActivated = function() g(not f) end,
        }, {
            Container = a.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
            }, {
                Padding = a.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, b.Spacing[3]),
                    PaddingRight = UDim.new(0, b.Spacing[3]),
                }),
                Title = a.createElement("TextLabel", {
                    Size = UDim2.new(1, -24, 1, 0),
                    BackgroundTransparency = 1,
                    Text = e.Title or "Accordion",
                    TextColor3 = b.Color.Text,
                    Font = b.Font.Bold,
                    TextSize = b.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                Arrow = a.createElement("ImageLabel", {
                    Size = UDim2.fromOffset(16, 16),
                    Position = UDim2.new(1, -16, 0.5, -8),
                    BackgroundTransparency = 1,
                    Image = "rbxassetid://10723346959",
                    ImageColor3 = b.Color.TextMuted,
                    Rotation = h,
                })
            })
        }),
        Content = f and a.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
        }, {
            Padding = a.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 16),
                PaddingRight = UDim.new(0, 4),
            }),
            Elements = a.createElement(a.Fragment, {}, e.children)
        })
    })
end

return HyperAccordion
