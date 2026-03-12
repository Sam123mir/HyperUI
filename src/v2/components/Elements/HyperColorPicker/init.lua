--[[
    HyperUI v2 - HyperColorPicker Root
]]

local React = require(script.Parent.Parent.Parent.Parent.dependencies.React)
local BaseElement = require(script.Parent.Parent.BaseElement)
local HueSlider = require(script.HueSlider)
local SaturationSquare = require(script.SaturationSquare)
local ColorPreview = require(script.ColorPreview)
local useTheme = require(script.Parent.Parent.Parent.Parent.hooks.useTheme)

local function HyperColorPicker(props)
    local theme = useTheme(props.store)
    local isOpen, setOpen = React.useState(false)
    
    -- Store HSV in local state to avoid closure capture issues
    local initH, initS, initV = Color3.toHSV(props.Value or Color3.new(1, 1, 1))
    local h, setH = React.useState(initH)
    local s, setS = React.useState(initS)
    local v, setV = React.useState(initV)
    
    -- Sync state if props change (optional, but good for controlled components)
    React.useEffect(function()
        local nh, ns, nv = Color3.toHSV(props.Value or Color3.new(1, 1, 1))
        setH(nh)
        setS(ns)
        setV(nv)
    end, {props.Value})

    local function updateColor(newH, newS, newV)
        local targetH = newH or h
        local targetS = newS or s
        local targetV = newV or v
        
        setH(targetH)
        setS(targetS)
        setV(targetV)
        
        if props.Callback then
            props.Callback(Color3.fromHSV(targetH, targetS, targetV))
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
                    PaddingLeft = UDim.new(0, theme.Spacing[3]),
                    PaddingRight = UDim.new(0, theme.Spacing[3]),
                }),
                Label = React.createElement("TextLabel", {
                    Size = UDim2.new(1, -60, 1, 0),
                    BackgroundTransparency = 1,
                    Text = props.Text or "Color Picker",
                    TextColor3 = theme.Color.Text,
                    Font = theme.Font,
                    TextSize = theme.FontSize.Medium,
                    TextXAlignment = Enum.TextXAlignment.Left,
                }),
                Preview = React.createElement(ColorPreview, {
                    Color = props.Value or Color3.new(1, 1, 1)
                })
            })
        }),
        Dropdown = isOpen and React.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 200),
            BackgroundColor3 = theme.Color.Surface,
            BorderSizePixel = 0,
        }, {
            UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(0, theme.Radius.Small) }),
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
