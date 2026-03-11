--[[
    HyperUI v2 - HyperColorPicker Root
]]

local React = require(script.Parent.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.Parent.theme.tokens)
local BaseElement = require(script.Parent.BaseElement)

local HueSlider = require(script.HueSlider)
local SaturationSquare = require(script.SaturationSquare)
local ColorPreview = require(script.ColorPreview)

local function HyperColorPicker(props)
    local isOpen, setOpen = React.useState(false)
    local h, s, v = Color3.toHSV(props.Value or Color3.new(1, 1, 1))
    
    local function updateColor(newH, newS, newV)
        if props.Callback then
            props.Callback(Color3.fromHSV(newH or h, newS or s, newV or v))
        end
    end
    
    return React.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        LayoutOrder = props.LayoutOrder,
        ZIndex = isOpen and 100 or 1,
    }, {
        Layout = React.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4) }),
        Trigger = React.createElement(BaseElement, {
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
                Label = React.createElement("TextLabel", {
                    Size = UDim2.new(1, -60, 1, 0),
                    BackgroundTransparency = 1,
                    Text = props.Text or "Color Picker",
                    TextColor3 = Tokens.Color.Text,
                    Font = Tokens.Font.Main,
                    TextSize = Tokens.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                Preview = React.createElement(ColorPreview, {
                    Color = props.Value or Color3.new(1, 1, 1)
                })
            })
        }),
        Dropdown = isOpen and React.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 200),
            BackgroundColor3 = Tokens.Color.Surface,
            BorderSizePixel = 0,
        }, {
            UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(0, Tokens.Radius.Small) }),
            Padding = React.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 8),
                PaddingBottom = UDim.new(0, 8),
                PaddingLeft = UDim.new(0, 8),
                PaddingRight = UDim.new(0, 8),
            }),
            Layout = React.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 8) }),
            SatVal = React.createElement(SaturationSquare, {
                Hue = h,
                Sat = s,
                Val = v,
                OnChanged = function(ns, nv) updateColor(nil, ns, nv) end
            }),
            Hue = React.createElement(HueSlider, {
                Hue = h,
                OnChanged = function(nh) updateColor(nh, nil, nil) end
            })
        })
    })
end

return HyperColorPicker
