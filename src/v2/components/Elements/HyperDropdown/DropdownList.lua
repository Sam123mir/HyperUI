--[[
    HyperUI v2 - Dropdown List
]]

local React = require(script.Parent.Parent.Parent.Parent.Parent.dependencies.React)
local Tokens = require(script.Parent.Parent.Parent.Parent.Parent.theme.tokens)
local VirtualList = require(script.Parent.Parent.Parent.Containers.VirtualList)
local DropdownOption = require(script.DropdownOption)
local DropdownSearch = require(script.DropdownSearch)

local function DropdownList(props)
    local searchQuery, setSearchQuery = React.useState("")
    
    local filteredOptions = {}
    for _, option in ipairs(props.Options or {}) do
        if string.find(string.lower(tostring(option)), string.lower(searchQuery)) then
            table.insert(filteredOptions, option)
        end
    end
    
    return React.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 200),
        BackgroundColor3 = Tokens.Color.Surface,
        BorderSizePixel = 0,
    }, {
        UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(0, Tokens.Radius.Small) }),
        Layout = React.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
        Search = React.createElement(DropdownSearch, {
            OnChanged = setSearchQuery
        }),
        List = React.createElement(VirtualList, {
            Size = UDim2.new(1, 0, 1, -32),
            Items = filteredOptions,
            ItemHeight = 32,
            RenderItem = function(option)
                local isSelected = false
                if type(props.Selected) == "table" then
                    isSelected = table.find(props.Selected, option) ~= nil
                else
                    isSelected = props.Selected == option
                end
                
                return React.createElement(DropdownOption, {
                    Text = tostring(option),
                    Selected = isSelected,
                    OnSelect = function() props.OnSelect(option) end
                })
            end
        })
    })
end

return DropdownList
