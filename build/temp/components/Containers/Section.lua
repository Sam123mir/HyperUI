



local a = require(script.Parent.Parent.Parent.dependencies.React)
local b = require(script.Parent.Parent.Parent.theme.tokens)
local c = require(script.Parent.Parent.Parent.hooks.useTree)
local d = require(script.Parent.ElementList)


local e = {
    Button = require(script.Parent.Parent.Elements.HyperButton),
    IconButton = require(script.Parent.Parent.Elements.HyperIconButton),
    Toggle = require(script.Parent.Parent.Elements.HyperToggle),
    Checkbox = require(script.Parent.Parent.Elements.HyperCheckbox),
    Slider = require(script.Parent.Parent.Elements.HyperSlider),
    Dropdown = require(script.Parent.Parent.Elements.HyperDropdown),
    Keybind = require(script.Parent.Parent.Elements.HyperKeybind),
    ColorPicker = require(script.Parent.Parent.Elements.HyperColorPicker),
    Input = require(script.Parent.Parent.Elements.HyperInput),
    NumberInput = require(script.Parent.Parent.Elements.HyperNumberInput),
    SearchInput = require(script.Parent.Parent.Elements.HyperSearchInput),
    TextArea = require(script.Parent.Parent.Elements.HyperTextArea),
    Label = require(script.Parent.Parent.Elements.HyperLabel),
    Badge = require(script.Parent.Parent.Elements.HyperBadge),
    Icon = require(script.Parent.Parent.Elements.HyperIcon),
    ProgressBar = require(script.Parent.Parent.Elements.HyperProgressBar),
    StatDisplay = require(script.Parent.Parent.Elements.HyperStatDisplay),
    ComboBox = require(script.Parent.Parent.Elements.HyperComboBox),
    Avatar = require(script.Parent.Parent.Elements.HyperAvatar),
    Divider = require(script.Parent.Parent.Elements.HyperDivider),
    Spacer = require(script.Parent.Parent.Elements.HyperSpacer),
    Accordion = require(script.Parent.Parent.Elements.HyperAccordion),
    Collapsible = require(script.Parent.Parent.Elements.HyperCollapsible),
    CopyButton = require(script.Parent.Parent.Elements.HyperCopyButton),
    Tag = require(script.Parent.Parent.Elements.HyperTag),
    StatusIndicator = require(script.Parent.Parent.Elements.HyperStatusIndicator),
    Grid = require(script.Parent.Grid),
    Stack = require(script.Parent.Stack),
    VirtualList = require(script.Parent.VirtualList),
}

local function Section(f)
    local g = c(f.store, f.id)
    if not g then return nil end
    
    local h = {}
    for i, j in ipairs(g.children) do
        local k = c(f.store, j)
        if k then
            local l = e[k.type]
            if l then
                table.insert(h, a.createElement(l, {
                    key = j,
                    LayoutOrder = i,
                    
                    Text = k.props.text,
                    Value = k.props.value,
                    Options = k.props.options,
                    Min = k.props.min,
                    Max = k.props.max,
                    Icon = k.props.icon,
                    Disabled = k.props.disabled,
                    Callback = function(m)
                        
                        if k.type ~= "Button" and k.type ~= "IconButton" then
                            f.store:Dispatch({
                                type = "UPDATE_ELEMENT",
                                id = j,
                                props = { value = m }
                            })
                        end
                        
                        if k.props.callback then
                            k.props.callback(m)
                        end
                    end
                }))
            end
        end
    end
    
    return a.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        LayoutOrder = f.LayoutOrder,
    }, {
        Layout = a.createElement("UIListLayout", {
            Padding = UDim.new(0, b.Spacing[2]),
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        Title = a.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 20),
            BackgroundTransparency = 1,
            Text = g.props.title:upper(),
            TextColor3 = b.Color.TextMuted,
            Font = b.Font.Bold,
            TextSize = b.FontSize.Small,
            TextXAlignment = Enum.TextXAlignment.Left,
        }, {
            Padding = a.createElement("UIPadding", { PaddingLeft = UDim.new(0, b.Spacing[2]) })
        }),
        Container = a.createElement(d, {}, h)
    })
end

return Section
