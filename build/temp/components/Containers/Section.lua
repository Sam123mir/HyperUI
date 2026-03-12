



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

local f = require(script.Parent.Parent.Parent.hooks.useTheme)

local function Section(g)
    local h = f(g.store)
    local i = c(g.store, g.id)
    if not i then return nil end
    
    local j = {}
    for k, l in ipairs(i.children) do
        local m = c(g.store, l)
        if m then
            local n = e[m.type]
            if n then
                table.insert(j, a.createElement(n, {
                    key = l,
                    LayoutOrder = k,
                    store = g.store, 
                    
                    Text = m.props.text,
                    Value = m.props.value,
                    Options = m.props.options,
                    Min = m.props.min,
                    Max = m.props.max,
                    Icon = m.props.icon,
                    Disabled = m.props.disabled,
                    Callback = function(o)
                        
                        if m.type ~= "Button" and m.type ~= "IconButton" then
                            g.store:Dispatch({
                                type = "UPDATE_ELEMENT",
                                id = l,
                                props = { value = o }
                            })
                        end
                        
                        if m.props.callback then
                            m.props.callback(o)
                        end
                    end
                }))
            end
        end
    end
    
    local k = i.props.title or ""
    
    return a.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        LayoutOrder = g.LayoutOrder,
    }, {
        Layout = a.createElement("UIListLayout", {
            Padding = UDim.new(0, h.Spacing[2]),
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        Title = #k > 0 and a.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 20),
            BackgroundTransparency = 1,
            Text = k:upper(),
            TextColor3 = h.Color.TextMuted,
            Font = h.Font,
            TextSize = h.FontSize.Small,
            TextXAlignment = Enum.TextXAlignment.Left,
        }, {
            Padding = a.createElement("UIPadding", { PaddingLeft = UDim.new(0, h.Spacing[2]) })
        }) or nil,
        Container = a.createElement(d, {}, j)
    })
end

return Section
