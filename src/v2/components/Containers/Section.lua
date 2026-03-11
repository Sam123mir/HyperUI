--[[
    HyperUI v2 - Section Component
]]

local React = require(script.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.theme.tokens)
local useTree = require(script.Parent.Parent.Parent.hooks.useTree)
local ElementList = require(script.Parent.ElementList)

-- Component Mapping
local COMPONENTS = {
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

local function Section(props)
    local node = useTree(props.store, props.id)
    if not node then return nil end
    
    local elements = {}
    for i, elementId in ipairs(node.children) do
        local elementNode = useTree(props.store, elementId)
        if elementNode then
            local Component = COMPONENTS[elementNode.type]
            if Component then
                table.insert(elements, React.createElement(Component, {
                    key = elementId,
                    LayoutOrder = i,
                    -- Pass all props to the component
                    Text = elementNode.props.text,
                    Value = elementNode.props.value,
                    Options = elementNode.props.options,
                    Min = elementNode.props.min,
                    Max = elementNode.props.max,
                    Icon = elementNode.props.icon,
                    Disabled = elementNode.props.disabled,
                    Callback = function(newValue)
                        -- Update tree state if it's a value-changing component
                        if elementNode.type ~= "Button" and elementNode.type ~= "IconButton" then
                            props.store:Dispatch({
                                type = "UPDATE_ELEMENT",
                                id = elementId,
                                props = { value = newValue }
                            })
                        end
                        -- Execute user callback
                        if elementNode.props.callback then
                            elementNode.props.callback(newValue)
                        end
                    end
                }))
            end
        end
    end
    
    return React.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        LayoutOrder = props.LayoutOrder,
    }, {
        Layout = React.createElement("UIListLayout", {
            Padding = UDim.new(0, Tokens.Spacing[2]),
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        Title = React.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 20),
            BackgroundTransparency = 1,
            Text = node.props.title:upper(),
            TextColor3 = Tokens.Color.TextMuted,
            Font = Tokens.Font.Bold,
            TextSize = Tokens.FontSize.Small,
            TextXAlignment = Enum.TextXAlignment.Left,
        }, {
            Padding = React.createElement("UIPadding", { PaddingLeft = UDim.new(0, Tokens.Spacing[2]) })
        }),
        Container = React.createElement(ElementList, {}, elements)
    })
end

return Section
